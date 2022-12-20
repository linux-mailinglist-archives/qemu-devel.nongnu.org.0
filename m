Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F99C6521F2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:04:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dCw-00064R-W7; Tue, 20 Dec 2022 09:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p7dCW-0005sv-QE
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:02:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p7dCU-0002XB-S5
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671544953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=76t3AvGjgnCY3EIYczeOy32EcAnG/kUtdCXC+GRE97U=;
 b=aLRqbdJRkOABfeQXCy5j7aPApfhSI3eigffE913CegOKqx5Ia0MsqWp/7LH3vSecYTbmKJ
 Toj8gfaY+QbOPv0uLYCEhhcQhxGaefOPDGFipo9fQhyk/9CI/t3dqaD6z3oyE3MoOzUTIZ
 a2HzUHRVN6yBgacKTpBTQVU+vd1ScM4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-Iy1Bf1dtOzKtw_hCce81YQ-1; Tue, 20 Dec 2022 09:02:29 -0500
X-MC-Unique: Iy1Bf1dtOzKtw_hCce81YQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C286B80D181;
 Tue, 20 Dec 2022 14:02:28 +0000 (UTC)
Received: from kostyanf14nb.Dlink (ovpn-192-73.brq.redhat.com [10.40.192.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC0471410DD7;
 Tue, 20 Dec 2022 14:02:27 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL v3 0/6] QEMU Guest Agent misc patches
Date: Tue, 20 Dec 2022 16:02:19 +0200
Message-Id: <20221220140225.615908-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

The following changes since commit 33698d3abf8ce65c38bb4b12b600b130d2682c79:

  Merge tag 'pull-monitor-2022-12-19' of https://repo.or.cz/qemu/armbru into staging (2022-12-19 16:12:59 +0000)

are available in the Git repository at:

  git@github.com:kostyanf14/qemu.git tags/qga-pull-2022-12-20

for you to fetch changes up to 9ca180bce1f9dad86b8d455a0c5c252d4c54eb92:

  qga-win: choose the right libpcre version to include in MSI package (2022-12-20 15:54:42 +0200)

----------------------------------------------------------------
qga-pull-2022-12-20

v2 -> v3:
  fixed author of Andrey Drobyshev commits

v1 -> v2:
  removed 'qga: Add ZFS TRIM support for FreeBSD' series
  that failed to merge

----------------------------------------------------------------
Andrey Drobyshev (3):
      qga-win: add logging to Windows event log
      qga: map GLib log levels to system levels
      qga-win: choose the right libpcre version to include in MSI package

Brad Smith (1):
      qga: Add initial OpenBSD and NetBSD support

Kfir Manor (2):
      qga:/qga-win: adding a empty PCI address creation function
      qga:/qga-win: skip getting pci info for USB disks

 configure                 |  3 +++
 meson.build               |  2 +-
 qga/commands-bsd.c        |  5 +++++
 qga/commands-posix.c      |  9 ++++++--
 qga/commands-win32.c      | 32 +++++++++++++++++----------
 qga/installer/qemu-ga.wxs | 17 +++++++++++---
 qga/main.c                | 56 +++++++++++++++++++++++++++++++++++++++++------
 qga/meson.build           | 25 ++++++++++++++++++++-
 qga/messages-win32.mc     |  9 ++++++++
 9 files changed, 133 insertions(+), 25 deletions(-)
 create mode 100644 qga/messages-win32.mc

--
2.25.1


