Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F70391245
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 10:26:42 +0200 (CEST)
Received: from localhost ([::1]:35752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llosD-00055V-Gc
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 04:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lloqj-0002gk-Ie
 for qemu-devel@nongnu.org; Wed, 26 May 2021 04:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lloqf-0006pT-9Y
 for qemu-devel@nongnu.org; Wed, 26 May 2021 04:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622017503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ViVPx08+2e/4vzNOo7Cb4fZjnXLFIccDGaYFaB7Thg0=;
 b=VDPr0+DqgvIPyLALj+CyO8KJOzd5tdUps4wZqN4MQONx7OueRHx2ESxdTynRLehrNoCc77
 ga3Hijy9gpWfKDFgAV/c/BRB5PubFKIeM8CZFYrob9gXqxHTd/3ppLmG6CN/S5Xua3qYHE
 suMU6QcQsuDeFwGCk0fDxgqvVDhYXyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-3U6xOBtmMk-EAP--Cgl_Ng-1; Wed, 26 May 2021 04:24:57 -0400
X-MC-Unique: 3U6xOBtmMk-EAP--Cgl_Ng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FBF4108C30F;
 Wed, 26 May 2021 08:24:55 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-159.pek2.redhat.com
 [10.72.13.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2729260875;
 Wed, 26 May 2021 08:24:53 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 0/3] Net patches
Date: Wed, 26 May 2021 16:24:49 +0800
Message-Id: <1622017492-7770-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

for you to fetch changes up to 7ec0d72cd519e569b6d1ef11be770beb67dd0824:

  tap-bsd: Remove special casing for older OpenBSD releases (2021-05-26 16:20:27 +0800)

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



