Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6190D5EBBB7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:40:08 +0200 (CEST)
Received: from localhost ([::1]:59012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5CI-0001kD-98
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od536-0003Yu-OZ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:30:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od534-0001hM-72
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664263832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RJCJkqrKVCwXHHIuRfXv5iDZDBONphxJt+A5qkNWiXI=;
 b=NVrJ+E2HlTQTClo42xeJf/XCCK4RDZAIgPTG8Wc9gTPDGlRh1Cmtkd7NAQC09AxCgJxG75
 qkPpyNowfV7X6EQyzyEKDY2VGl6MnD0nCFcKh3txZDapjPIOpEppX4XdY20u7rvggt9Tnu
 muj9Oljqi71Exgf9Mad39Otp0VViSbs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-qdHQX0tANaONgxJt2JdQPQ-1; Tue, 27 Sep 2022 03:30:27 -0400
X-MC-Unique: qdHQX0tANaONgxJt2JdQPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 945D7185A78F;
 Tue, 27 Sep 2022 07:30:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-192.pek2.redhat.com
 [10.72.13.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88ACB2166B26;
 Tue, 27 Sep 2022 07:30:25 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	stefanha@redhat.com
Cc: Jason Wang <jasowang@redhat.com>
Subject: [PULL 0/8] Net patches
Date: Tue, 27 Sep 2022 15:30:14 +0800
Message-Id: <20220927073022.28378-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 99d6b11b5b44d7dd64f4cb1973184e40a4a174f8:

  Merge tag 'pull-target-arm-20220922' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-09-26 13:38:26 -0400)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to bf769f742c3624952f125b303878a77ea870c156:

  virtio: del net client if net_init_tap_one failed (2022-09-27 15:14:37 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Ding Hui (1):
      e1000e: set RX desc status with DD flag in a separate operation

Eugenio Pérez (6):
      vdpa: Make VhostVDPAState cvq_cmd_in_buffer control ack type
      vdpa: extract vhost_vdpa_net_load_mac from vhost_vdpa_net_load
      vdpa: Add vhost_vdpa_net_load_mq
      vdpa: validate MQ CVQ commands
      virtio-net: Update virtio-net curr_queue_pairs in vdpa backends
      vdpa: Allow MQ feature in SVQ

lu zhipeng (1):
      virtio: del net client if net_init_tap_one failed

 hw/net/e1000e_core.c |  53 ++++++++++++++++++++++-
 hw/net/virtio-net.c  |  17 +++-----
 net/tap.c            |  18 +++++---
 net/vhost-vdpa.c     | 119 +++++++++++++++++++++++++++++++++++++--------------
 4 files changed, 157 insertions(+), 50 deletions(-)

Ding Hui (1):
  e1000e: set RX desc status with DD flag in a separate operation

Eugenio Pérez (6):
  vdpa: Make VhostVDPAState cvq_cmd_in_buffer control ack type
  vdpa: extract vhost_vdpa_net_load_mac from vhost_vdpa_net_load
  vdpa: Add vhost_vdpa_net_load_mq
  vdpa: validate MQ CVQ commands
  virtio-net: Update virtio-net curr_queue_pairs in vdpa backends
  vdpa: Allow MQ feature in SVQ

lu zhipeng (1):
  virtio: del net client if net_init_tap_one failed

 hw/net/e1000e_core.c |  53 ++++++++++++++++++++++-
 hw/net/virtio-net.c  |  17 +++-----
 net/tap.c            |  18 +++++---
 net/vhost-vdpa.c     | 119 +++++++++++++++++++++++++++++++++++++--------------
 4 files changed, 157 insertions(+), 50 deletions(-)

-- 
2.7.4


