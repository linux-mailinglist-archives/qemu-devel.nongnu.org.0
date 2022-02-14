Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA864B4093
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 05:03:44 +0100 (CET)
Received: from localhost ([::1]:60406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJSaV-0001aF-J4
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 23:03:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJSX3-00050R-TY
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 23:00:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJSX1-00005p-EY
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 23:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644811206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4ZjETI0DzEsDhzHP0NzMBDAdXRZ+d3sy3JrYB8A/ryk=;
 b=XRigp/CMKSK2bXFuZts3G/PkFXWcCOLP9eTYoYp+m0C3XVEfG+ceC1ZSguh9bvlCYxfPbH
 2LypD9LnQgdGnTkyP69rZ4LAWjqkN8HMGhVsNyLZPA2u3aARV/LzL2h3NE1xw9QE1xx1qW
 oNyyEHZ5VGUP6TEy4NLfxcx2envrTk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-xF-2AgLuPjmYz7YKmk7QDA-1; Sun, 13 Feb 2022 23:00:03 -0500
X-MC-Unique: xF-2AgLuPjmYz7YKmk7QDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4D452F49;
 Mon, 14 Feb 2022 04:00:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-241.pek2.redhat.com
 [10.72.13.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 398E8610A6;
 Mon, 14 Feb 2022 04:00:00 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 0/8] Net patches
Date: Mon, 14 Feb 2022 11:59:49 +0800
Message-Id: <20220214035957.71339-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 48033ad678ae2def43bf0d543a2c4c3d2a93feaf:

  Merge remote-tracking branch 'remotes/vsementsov/tags/pull-nbd-2022-02-09-v2' into staging (2022-02-12 22:04:07 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 9d6267b240c114d1a3cd314a08fd6e1339d34b83:

  net/eth: Don't consider ESP to be an IPv6 option header (2022-02-14 11:50:44 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Nick Hudson (1):
      hw/net: e1000e: Clear ICR on read when using non MSI-X interrupts

Peter Foley (2):
      net/tap: Set return code on failure
      net: Fix uninitialized data usage

Philippe Mathieu-Daudé (1):
      hw/net/vmxnet3: Log guest-triggerable errors using LOG_GUEST_ERROR

Rao Lei (1):
      net/filter: Optimize filter_send to coroutine

Thomas Jansen (1):
      net/eth: Don't consider ESP to be an IPv6 option header

Zhang Chen (2):
      net/colo-compare.c: Optimize compare order for performance
      net/colo-compare.c: Update the default value comments

 hw/net/e1000e_core.c |  5 ++++
 hw/net/trace-events  |  1 +
 hw/net/vmxnet3.c     |  4 +++-
 net/colo-compare.c   | 28 +++++++++++-----------
 net/eth.c            |  1 -
 net/filter-mirror.c  | 66 +++++++++++++++++++++++++++++++++++++++++-----------
 net/tap-linux.c      |  1 +
 net/tap.c            |  1 +
 8 files changed, 78 insertions(+), 29 deletions(-)


