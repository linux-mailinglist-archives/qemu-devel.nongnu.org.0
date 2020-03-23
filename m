Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B25C18F3AC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 12:31:07 +0100 (CET)
Received: from localhost ([::1]:60470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGLIQ-0006ob-2S
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 07:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42588)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jGLHD-0005z5-8v
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 07:29:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jGLHB-0005mj-SZ
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 07:29:50 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:37425)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jGLHB-0005mQ-PD
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 07:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584962988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fhwJZtBwYRaXFzRSpXf/3TnXWyCgxPyzLYcnsmKwQB0=;
 b=M7ihXijJQy+AvGqmlVzJZCK8JqPJ9qKVyL/sBA38RTjLpI7vvEhJRudID8LisgxJLb/C9Z
 Q2c3rzF5GC2NentovxhKKU5cav5ZBIyZTCfV4TyyS4FEms1AFtxw1R6oH9qHPgUhWAkaLu
 seLiDmXD/Q1IerOv9dLnEHfggQY6+hw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-cb-_RE3uMOicLWY9ZN7ggQ-1; Mon, 23 Mar 2020 07:29:47 -0400
X-MC-Unique: cb-_RE3uMOicLWY9ZN7ggQ-1
Received: by mail-wr1-f70.google.com with SMTP id p2so7217972wrw.8
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 04:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QE3YIhEKTc4mAtyc7f+TWuDURZezsFuVLw+5KrPb2pk=;
 b=HGYPsbvK27SVuqFLtt/tdOAq77kro6Sx0WgI0p6KL2yCZMrvkMolTiYU2P3rSDQpek
 3UNp/5GTyZHlzop/xvg00aq8apoqLj6YNDIX+hXFwW5+hvqzOjpKvpxfZA16etKnheMA
 SmLAuaN8GwSTAwltRF2fH+9hBGx9M12A9HMV4hABfuG43oi+8ikXBwBMyRi3R4V1xQvL
 5HeomYJbpYijHFiF2HA5pxoJr0e6Tt20Ie/h3UgELr78Juelr2AZka4egryohjfJVxML
 saHdFKYuWPjJ6tOFvgLyii/tY0+t4Vhedg5fkphes4N/0VHkRKyJTw4Z/YhHFqrwr2FG
 qUDA==
X-Gm-Message-State: ANhLgQ142ZLB1X4wvwkS2P8Lfe6UgXXKb8cPhOaIIz9zTaksZpYT3uAj
 gbKutWHkH02sOnncL9nP5rUU3ArYlc4PSI9ShWN7Bb4KMdqpKQkQY+FtQSp4wcNXa/D0CvUhkos
 zghiwsDRibaBM89A=
X-Received: by 2002:adf:ecc7:: with SMTP id s7mr30034804wro.386.1584962985763; 
 Mon, 23 Mar 2020 04:29:45 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtfTXtWyH6cpsUMviBjHZxkD6T+5CgBUIxZPwW1jvWGxCCuuROtgAhBv8qApvmta6GhlcZwIQ==
X-Received: by 2002:adf:ecc7:: with SMTP id s7mr30034778wro.386.1584962985551; 
 Mon, 23 Mar 2020 04:29:45 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id w11sm23547796wrv.86.2020.03.23.04.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 04:29:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 0/3] virtio,vhost-gpu: Release memory returned by
 malloc() with free()
Date: Mon, 23 Mar 2020 12:29:40 +0100
Message-Id: <20200323112943.12010-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity reported a ALLOC_FREE_MISMATCH in vg_handle_cursor(),
because the memory returned by vu_queue_pop() is allocated with
malloc(). Fix it.

Similar error occurs with virtio. Document and fix.

Philippe Mathieu-Daud=C3=A9 (3):
  vhost-user-gpu: Release memory returned by vu_queue_pop() with free()
  virtio: Document virtqueue_pop()
  virtio-gpu: Release memory returned by virtqueue_pop() with free()

 include/hw/virtio/virtio.h              | 8 ++++++++
 contrib/vhost-user-gpu/vhost-user-gpu.c | 4 ++--
 contrib/vhost-user-gpu/virgl.c          | 2 +-
 hw/display/virtio-gpu-3d.c              | 2 +-
 hw/display/virtio-gpu.c                 | 8 ++++----
 5 files changed, 16 insertions(+), 8 deletions(-)

--=20
2.21.1


