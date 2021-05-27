Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CF9392653
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:26:36 +0200 (CEST)
Received: from localhost ([::1]:37950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7bP-0004kI-5l
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lm7Zj-0002kE-RO
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:24:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lm7Zg-00060x-GK
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622089486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9wPoCDE1+nBeVwAmenZ8wjtT6kBSDmDHlNBG4Xx2/PA=;
 b=Sl9d5DyjXna/VUHjHR7NtPAfbAc0ZVAtc1vJzQrH0asb0dClD2ubhF6xavHCUrmj0LLWHH
 q64eK+lqrlWSruTnZpI8uwQeD1k/6RUm4G+rnQBr7dRgFkM0JSbXf1raex+F5g50eS2RoQ
 HxeMnuT+V5i0S30x/W02cv1g4k7ONYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-VRMBjcYrMruZiK2JD5YKbw-1; Thu, 27 May 2021 00:24:42 -0400
X-MC-Unique: VRMBjcYrMruZiK2JD5YKbw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE599800D55;
 Thu, 27 May 2021 04:24:41 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-43.pek2.redhat.com
 [10.72.13.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94EF65D6D3;
 Thu, 27 May 2021 04:24:40 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 0/3] Net patches
Date: Thu, 27 May 2021 12:24:35 +0800
Message-Id: <1622089478-5426-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672:

  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05 20:29:14 +0100)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 4f8a39494aded9f2026a26b137378ea2ee3d5338:

  tap-bsd: Remove special casing for older OpenBSD releases (2021-05-27 11:03:55 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Brad Smith (1):
      tap-bsd: Remove special casing for older OpenBSD releases

Guenter Roeck (1):
      hw/net/imx_fec: return 0xffff when accessing non-existing PHY

Laurent Vivier (1):
      virtio-net: failover: add missing remove_migration_state_change_notifier()

 hw/net/imx_fec.c    | 8 +++-----
 hw/net/trace-events | 2 ++
 hw/net/virtio-net.c | 1 +
 net/tap-bsd.c       | 8 --------
 4 files changed, 6 insertions(+), 13 deletions(-)


