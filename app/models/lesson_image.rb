class LessonImage < ActiveRecord::Base
  belongs_to :lesson

  has_attached_file :file,
    styles: { medium: "300x300>", thumb: "100x100>", mini: "24x24>" },
    path: ":rails_root/public/uploads/:class/:id/:basename_:style.:extension",
    url: "/uploads/:class/:id/:basename_:style.:extension",
    default_url: "/images/placeholders/:style/missing.png"
  validates_attachment :file,
    content_type: { content_type: /\Aimage\/.*\Z/ },
    file_name: { matches: [/png\Z/, /jpe?g\Z/] },
    size: { in: 0..2.megabytes }
end
