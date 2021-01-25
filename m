Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2273024D1
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 13:26:05 +0100 (CET)
Received: from localhost ([::1]:43252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40wW-0004ta-Eq
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 07:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l40tt-0002tN-01
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:23:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l40tp-0007pX-4r
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:23:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611577395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=itwqyD7bYi2r+iI+75KcdTvR0eNizbF41wHGj7CGZ5c=;
 b=aybGa0sdJp0KKAPPSC8PvsMDKNswcTgIKcaOSEMuJStrNCiYWbFzs7mNhiZrMDuEO0TKof
 8JgjX1o2UdeqsG7lNXwLETXnPhvTTOyg6GZt1BB9hhZVRZub8n/xoDLbU5g0gNj/G9/Ioj
 xLPIQWSfeCrczXDtDklR3jBdpXUIL5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-gbWb8i-0PT-dk2Xh4WPZ2Q-1; Mon, 25 Jan 2021 07:23:11 -0500
X-MC-Unique: gbWb8i-0PT-dk2Xh4WPZ2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD4761005586;
 Mon, 25 Jan 2021 12:23:10 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-126.pek2.redhat.com
 [10.72.12.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86E1019C44;
 Mon, 25 Jan 2021 12:23:09 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [RESEND PULL 0/4] Net patches
Date: Mon, 25 Jan 2021 20:23:03 +0800
Message-Id: <1611577387-4296-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e81eb5e6d108008445821e4f891fb9563016c71b:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-01-23 22:34:21 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to f574633529926697ced51b6865e5c50bbb78bf1b:

  net: checksum: Introduce fine control over checksum type (2021-01-25 17:04:56 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Bin Meng (1):
      net: checksum: Introduce fine control over checksum type

Guishan Qin (1):
      net: checksum: Add IP header checksum calculation

Markus Armbruster (1):
      net: Fix handling of id in netdev_add and netdev_del

Markus Carlstedt (1):
      net: checksum: Skip fragmented IP packets

 hw/net/allwinner-sun8i-emac.c |  2 +-
 hw/net/cadence_gem.c          |  2 +-
 hw/net/fsl_etsec/rings.c      | 18 +++++++++---------
 hw/net/ftgmac100.c            | 13 ++++++++++++-
 hw/net/imx_fec.c              | 20 ++++++++------------
 hw/net/virtio-net.c           |  2 +-
 hw/net/xen_nic.c              |  2 +-
 include/net/checksum.h        |  7 ++++++-
 net/checksum.c                | 24 +++++++++++++++++++++---
 net/filter-rewriter.c         |  4 ++--
 net/net.c                     | 20 ++++++++++++++++++--
 11 files changed, 80 insertions(+), 34 deletions(-)


