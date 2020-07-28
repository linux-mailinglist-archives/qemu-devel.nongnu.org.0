Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7361923022A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 07:59:24 +0200 (CEST)
Received: from localhost ([::1]:45882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0Ie2-0002KJ-Te
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 01:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1k0Ict-0001HW-12
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 01:58:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53722
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1k0Icq-0007AT-E4
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 01:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595915886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=qGvcPtlWeSR93vKTl7BxSQbaB1FtrqzVd3AL/MAsiDw=;
 b=c4hG3aj3zzb19LMO4l27ahUIANj9rOYbt1bqPjkYl2utHvMC2bilChJctf7ToZbxGxqvdd
 /mH5SC5HbOhlKL6pyXOQ0/e3QhinHdZPUvqQrTnBpLcslcunC4TGAnAKg43R/+8moSKYTX
 fkQeO1ja+8XR2dARwUUZe8llU0BSuaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-Wm7EeWFOMSSvgUju7TPQIg-1; Tue, 28 Jul 2020 01:58:03 -0400
X-MC-Unique: Wm7EeWFOMSSvgUju7TPQIg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7463106B242;
 Tue, 28 Jul 2020 05:58:02 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-130.pek2.redhat.com
 [10.72.13.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6933F1001281;
 Tue, 28 Jul 2020 05:58:01 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 0/4] Net patches
Date: Tue, 28 Jul 2020 13:57:54 +0800
Message-Id: <1595915878-22568-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 23:56:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9303ecb658a0194560d1eecde165a1511223c2d8:

  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20200727' into staging (2020-07-27 17:25:06 +0100)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 7142cad78d6bf4a1cbcb09d06b39935a7998c24e:

  net: forbid the reentrant RX (2020-07-28 13:50:41 +0800)

----------------------------------------------------------------
Want to send earlier but most patches just come.

- fix vhost-vdpa issues when no peer
- fix virtio-pci queue enabling check
- forbid reentrant RX

----------------------------------------------------------------
Jason Wang (2):
      virtio-net: check the existence of peer before accessing vDPA config
      net: forbid the reentrant RX

Laurent Vivier (1):
      virtio-pci: fix virtio_pci_queue_enabled()

Yuri Benditovich (1):
      virtio-pci: fix wrong index in virtio_pci_queue_enabled

 hw/net/virtio-net.c        | 30 +++++++++++++++++++-----------
 hw/virtio/virtio-pci.c     |  4 ++--
 hw/virtio/virtio.c         |  7 ++++++-
 include/hw/virtio/virtio.h |  1 +
 net/queue.c                |  3 +++
 5 files changed, 31 insertions(+), 14 deletions(-)



