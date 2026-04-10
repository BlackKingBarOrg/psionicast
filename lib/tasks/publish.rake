require_relative '../file_utils'

namespace :publish do
  desc "Publish episode 2"
  task episode_2: :environment do
    terry = Host.find_by(name: "Terry Tai")
    jan = Host.find_by(name: "Jan Xie")
    howard = Host.find_by(name: "Howard Ye")
    file_uri = "https://assets.teahour.dev/teahour2_2.mp3"
    file_size = FileUtils.get_remote_file_size(file_uri)
    puts "File size: #{file_size} bytes"

    episode_2 = Episode.create!(
      name: "昨天，今天，明天",
      file_uri: file_uri,
      summary: "本期节目是 「Teahour 2.0 来了！(下)」 ，新主播们继续摆龙门阵, 聊聊科技的昨天，今天，明天（BTW,明天没来得及聊）。",
      desc: File.read(Rails.root.join('db', 'seeds', 'episode_2_desc.md')),
      status: 1,
      keywords: 'podcast, ai, web2',
      number: 2,
      slug: '2',
      duration: 4434,
      published_at: Time.zone.now,
      cover_url: "https://assets.teahour.dev/teahour2-logo.jpg",
      length: file_size
    )

    puts "Creating attendances..."
    Attendance.create!(attendee: terry, episode: episode_2, role: 0)
    Attendance.create!(attendee: jan, episode: episode_2, role: 1)
    Attendance.create!(attendee: howard, episode: episode_2, role: 1)

    puts "Episode 2 published!"

  end

  desc "Delete episode 2"
  task delete_episode_2: :environment do
    episode_2 = Episode.find_by(number: 2)
    Attendance.where(episode: episode_2).destroy_all
    episode_2.destroy
    puts "Episode 2 deleted!"
  end

  desc "Publish Episode 3" 
  task episode_3: :environment do
    terry = Host.find_by(name: "Terry Tai")
    jan = Host.find_by(name: "Jan Xie")
    howard = Host.find_by(name: "Howard Ye")
    kai = Guest.find_by(name: "Kai Chen")
    unless kai
      kai = Guest.create!(name: "Kai Chen", avatar_url: "https://assets.teahour.dev/kai-avatar.jpg", social_links: {'X' => 'https://x.com/_kaichen' })
    end
    file_uri = "https://assets.teahour.dev/teahour2_3.mp3"
    file_size = FileUtils.get_remote_file_size(file_uri)
    puts "File size: #{file_size} bytes"

    episode_3 = Episode.create!(
      name: "程序员的存在主义危机（上）",
      file_uri: file_uri,
      summary: "AI 技术席卷而来的浪潮如何重塑程序员的职业与人生，程序员们正面临前所未有的存在主义危机？ 又或者是机遇？这一期我们邀请到好友 Kai, 冲上一杯好茶，我们一起来探讨一下这个话题。",
      desc: File.read(Rails.root.join('db', 'seeds', 'episode_3_desc.md')),
      status: 1,
      keywords: 'ai, programmer, developer, career, philosophy',
      number: 3,
      slug: '3',
      duration: 10228,
      published_at: Time.zone.now,
      cover_url: "https://assets.teahour.dev/teahour2-ep3-cover.png",
      length: file_size
    )

    puts "Creating attendances..."
    Attendance.create!(attendee: terry, episode: episode_3, role: 0)
    Attendance.create!(attendee: jan, episode: episode_3, role: 0)
    Attendance.create!(attendee: howard, episode: episode_3, role: 0)
    Attendance.create!(attendee: kai, episode: episode_3, role: 1)

    puts "Episode 3 published!"

  end

  desc "Update Episode 3"
  task update_episode_3: :environment do
    episode_3 = Episode.find_by(number: 3)
    episode_3.update(
      desc: File.read(Rails.root.join('db', 'seeds', 'episode_3_desc.md'))
    )
  end

  desc "Delete Episode 3" 
  task delete_episode_3: :environment do
    episode_3 = Episode.find_by(number: 3)
    Attendance.where(episode: episode_3).destroy_all
    episode_3.destroy
    puts "Episode 3 deleted!"
  end

  desc "Publish Episode 4"
  task episode_4: :environment do
    terry = Host.find_by(name: "Terry Tai")
    jan = Host.find_by(name: "Jan Xie")
    howard = Host.find_by(name: "Howard Ye")
    kai = Guest.find_by(name: "Kai Chen")

    file_uri = "https://assets.teahour.dev/teahour2_4.mp3"
    file_size = FileUtils.get_remote_file_size(file_uri)
    puts "File size: #{file_size} bytes"

    episode_4 = Episode.create!(
      name: "程序员的存在主义危机（下）",
      file_uri: file_uri,
      summary: "AI 技术席卷而来的浪潮如何重塑程序员的职业与人生，程序员们正面临前所未有的存在主义危机？ 又或者是机遇？这一期我们邀请到好友 Kai, 冲上一杯好茶，我们一起来探讨一下这个话题。",
      desc: File.read(Rails.root.join('db', 'seeds', 'episode_4_desc.md')),
      status: 1,
      keywords: 'ai, programmer, developer, career, philosophy',
      number: 4,
      slug: '4',
      duration: 6780,
      published_at: Time.zone.now,
      cover_url: "https://assets.teahour.dev/teahour2-ep3-cover.png",
      length: file_size
    )

    puts "Creating attendances..."
    Attendance.create!(attendee: terry, episode: episode_4, role: 0)
    Attendance.create!(attendee: jan, episode: episode_4, role: 0)
    Attendance.create!(attendee: howard, episode: episode_4, role: 0)
    Attendance.create!(attendee: kai, episode: episode_4, role: 1)

    puts "Episode 4 published!"
  end

  desc "Delete Episode 4"
  task delete_episode_4: :environment do
    episode_4 = Episode.find_by(number: 4)
    Attendance.where(episode: episode_4).destroy_all
    episode_4.destroy
    puts "Episode 4 deleted!"
  end

  desc "Publish Episode 5"
  task episode_5: :environment do
    terry = Host.find_by(name: "Terry Tai")
    jan = Host.find_by(name: "Jan Xie")
    howard = Host.find_by(name: "Howard Ye")
    ash = Guest.find_by(name: "Ash Chen")
    unless ash
      ash = Guest.create!(name: "Ash Chen", avatar_url: "https://assets.teahour.dev/ash-avatar.jpg", social_links: {'X' => 'https://x.com/ashchan', 'Website' => 'https://ashchan.com/'})
    end
    file_uri = "https://assets.teahour.dev/teahour2_5.mp3"
    file_size = FileUtils.get_remote_file_size(file_uri)
    puts "File size: #{file_size} bytes"

    episode_5 = Episode.create!(
      name: "教练，我想一辈子写代码！（上）",
      file_uri: file_uri,
      summary: "这期和老朋友 Ash Chen 一起聊聊开发者的爱好; 聊聊开发者喜欢的软件硬件;聊聊咱能一辈子做开发吗？...",
      desc: File.read(Rails.root.join('db', 'seeds', 'episode_5_desc.md')),
      status: 1,
      keywords: 'ai, programmer, developer, career, philosophy',
      number: 5,
      slug: '5',
      duration: 6923,
      published_at: Time.zone.now,
      cover_url: "https://assets.teahour.dev/teahour2-ep5-cover.png",
      length: file_size
    )
    
    puts "Creating attendances..."
    Attendance.create!(attendee: terry, episode: episode_5, role: 0)
    Attendance.create!(attendee: jan, episode: episode_5, role: 0)
    Attendance.create!(attendee: howard, episode: episode_5, role: 0)
    Attendance.create!(attendee: ash, episode: episode_5, role: 1)

    puts "Episode 5 published!"
  end
  
  desc "Delete Episode 5"
  task delete_episode_5: :environment do
    episode_5 = Episode.find_by(number: 5)
    Attendance.where(episode: episode_5).destroy_all
    episode_5.destroy
    puts "Episode 5 deleted!"
  end

  desc "Publish Episode 6"
  task episode_6: :environment do
    terry = Host.find_by(name: "Terry Tai")
    jan = Host.find_by(name: "Jan Xie")
    howard = Host.find_by(name: "Howard Ye")
    ash = Guest.find_by(name: "Ash Chen")
  

    file_uri = "https://assets.teahour.dev/teahour2_6.mp3"
    file_size = FileUtils.get_remote_file_size(file_uri)
    puts "File size: #{file_size} bytes"

    episode_6 = Episode.create!(
      name: "教练，我想一辈子写代码！（下）",
      file_uri: file_uri,
      summary: "这一期我们继续和老朋友 Ash 聊聊他如何 “开飞机”，“打飞机”， 搞 CAD, 自己做木工， 3D 打印， 还有啥？...",
      desc: File.read(Rails.root.join('db', 'seeds', 'episode_6_desc.md')),
      status: 1,
      keywords: 'ai, programmer, developer, hobby, cad',
      number: 6,
      slug: '6',
      duration: 6067,
      published_at: Time.zone.now,
      cover_url: "https://assets.teahour.dev/teahour2-ep6a-cover.png",
      length: file_size
    )
      
    puts "Creating attendances..."
    Attendance.create!(attendee: terry, episode: episode_6, role: 0)
    Attendance.create!(attendee: jan, episode: episode_6, role: 0)
    Attendance.create!(attendee: howard, episode: episode_6, role: 0)
    Attendance.create!(attendee: ash, episode: episode_6, role: 1)

    puts "Episode 6 published!"
  end

  desc "Delete Episode 6"
  task delete_episode_6: :environment do
    episode_6 = Episode.find_by(number: 6)
    Attendance.where(episode: episode_6).destroy_all
    episode_6.destroy
    puts "Episode 6 deleted!"
  end

  desc "Publish Episode 7"
  task episode_7: :environment do
    terry = Host.find_by(name: "Terry Tai")
    howard = Host.find_by(name: "Howard Ye")
    mike = Guest.find_by(name: "Mike Chong")
    unless mike
      mike = Guest.create!(name: "Mike Chong", avatar_url: "https://assets.teahour.dev/mike.jpg", social_links: {'X' => 'https://x.com/mike_chong_zh', 'YouTube' => 'https://www.youtube.com/@MikeChongZh'})
    end

    file_uri = "https://assets.teahour.dev/teahour2_7_1.mp3"
    file_size = FileUtils.get_remote_file_size(file_uri)
    puts "File size: #{file_size} bytes"

    episode_7 = Episode.create!(
      name: "Vibe Coding 好上瘾",
      file_uri: file_uri,
      summary: "抱歉, 因为 Vibe Coding 乐不思蜀了。这一期我们和 Howard & Mike 聊聊我们是怎么实践（玩）的。",
      desc: File.read(Rails.root.join('db', 'seeds', 'episode_7_desc.md')),
      status: 1,
      keywords: 'vibe coding, ai, claude code, cursor, programming',
      number: 7,
      slug: '7',
      duration: 5476,
      published_at: Time.zone.now,
      cover_url: "https://assets.teahour.dev/teahour2-ep7-cover-2.png",
      length: file_size
    )

    puts "Creating attendances..."
    Attendance.create!(attendee: terry, episode: episode_7, role: 0)
    Attendance.create!(attendee: howard, episode: episode_7, role: 0)
    Attendance.create!(attendee: mike, episode: episode_7, role: 1)

    puts "Episode 7 published!"
  end

  desc "Delete Episode 7"
  task delete_episode_7: :environment do
    episode_7 = Episode.find_by(number: 7)
    Attendance.where(episode: episode_7).destroy_all
    episode_7.destroy
    puts "Episode 7 deleted!"
  end
end
