Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8162C6B12A0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 21:05:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa01Z-000113-7p; Wed, 08 Mar 2023 15:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pa01X-00010u-Kx
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:04:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pa01V-0006vk-A8
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678305867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qEzUbuUV7kp7Q/bOAfC/vYzgczy1ann275bxJU64UZo=;
 b=BVCgUcv9w7bndYFZ7X2d10k1/XIWArVQw3lAz9+btyLa+3rVnQKZi1O/gXEAYy/Da32NX9
 awzb0EcqfjR1Y1cU4+ZiiAkY59L7phNTyr3UpN4S/Ws1x0pCcbVttS340KjZX1PR0mFeV2
 QcXaFFpJXCljNnOwZmD6LBlD+yxgZNM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-xCor2lMGOD-hMLzcyGUmhw-1; Wed, 08 Mar 2023 15:04:23 -0500
X-MC-Unique: xCor2lMGOD-hMLzcyGUmhw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F98F299E75B;
 Wed,  8 Mar 2023 20:04:23 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.45.224.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A5342026D4B;
 Wed,  8 Mar 2023 20:04:21 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 0/5] QGA Misc patches
Date: Wed,  8 Mar 2023 22:04:14 +0200
Message-Id: <20230308200419.453688-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:

  Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)

are available in the Git repository at:

  git@github.com:kostyanf14/qemu.git tags/qga-pull-2023-03-08

for you to fetch changes up to 0961f929c66ceb5e9e95756bfe418b9ef34510eb:

  qga/win/vss: requester_freeze changes (2023-03-08 18:26:50 +0200)

----------------------------------------------------------------
qga-pull-2023-03-08

----------------------------------------------------------------
Kfir Manor (3):
      qga/win/installer: add VssOption to installer
      qga/win/vss: query VSS backup type
      qga/win/vss: requester_freeze changes

Konstantin Kostiuk (2):
      qga/win32: Remove change action from MSI installer
      qga/win32: Use rundll for VSS installation

 qga/installer/qemu-ga.wxs   | 15 ++++++++++-----
 qga/vss-win32/install.cpp   |  9 +++++++++
 qga/vss-win32/qga-vss.def   |  2 ++
 qga/vss-win32/requester.cpp | 41 ++++++++++++++++++++++++++++++++++++++++-
 qga/vss-win32/vss-handles.h |  3 +++
 5 files changed, 64 insertions(+), 6 deletions(-)


--
2.25.1


