Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA65E553FCD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 02:58:42 +0200 (CEST)
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ohe-0004yT-0X
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 20:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@kevinlocke.name>)
 id 1o3ofh-0003d1-4V
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:56:42 -0400
Received: from vulcan.kevinlocke.name ([107.191.43.88]:41408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@kevinlocke.name>)
 id 1o3off-00022n-7S
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:56:40 -0400
Received: from kevinolos.kevinlocke.name
 (2600-6c67-5000-3d1b-bb03-82a1-4a56-5da8.res6.spectrum.com
 [IPv6:2600:6c67:5000:3d1b:bb03:82a1:4a56:5da8])
 (Authenticated sender: kevin@kevinlocke.name)
 by vulcan.kevinlocke.name (Postfix) with ESMTPSA id BF0D42F678D7;
 Wed, 22 Jun 2022 00:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kevinlocke.name;
 s=vulcan; t=1655859394;
 bh=UIX8iZZwUuDImEn3JVa2Iyts2k8M40nF5SuVicc28p0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kpkI/9yQj+A2UGa8fpW9uZaSvWSHoXqPZsvqwVSY01FmVejR3Xw6E7szDVKw+mLbd
 SWJBDYz9444cHhOtnTrUF40WvsWPAEa3BWW3wDkae8/C12FCQQaSAOsJ7IvkQ3e/vf
 8semHcNjndtC1ccUTkBgs3cyRgdrGIrf2bgWLL9c=
Received: by kevinolos.kevinlocke.name (Postfix, from userid 1000)
 id DF9471300427; Tue, 21 Jun 2022 18:56:30 -0600 (MDT)
From: Kevin Locke <kevin@kevinlocke.name>
To: qemu-devel@nongnu.org
Cc: Laszlo Ersek <lersek@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Laine Stump <laine@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v4] docs: mention devices with VBE on Root Complex
Date: Tue, 21 Jun 2022 18:56:24 -0600
Message-Id: <8818349ab4a671b9a0f83441e81ed3c26acb93bf.1655859374.git.kevin@kevinlocke.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <c4e18127b1760380a48f785b6c55a82539687c4d.1655128492.git.kevin@kevinlocke.name>
References: <c4e18127b1760380a48f785b6c55a82539687c4d.1655128492.git.kevin@kevinlocke.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.191.43.88; envelope-from=kevin@kevinlocke.name;
 helo=vulcan.kevinlocke.name
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mention devices which support VESA BIOS Extensions (VBE) specifically in
the list item of the Root Bus section discussing devices placed on the
Root Complex.

VESA BIOS Extensions (VBE) present a particular challenge not currently
noted in the recommendations:  ioport access to VBE registers is not
forwarded over PCI(e) bridges, even when using the special exception bit
for VGA register access.[1]  As a result, devices supporting VBE must be
placed on the Root Complex for VBE to be usable.

The new documentation also clarifies that VBE is used on systems with
BIOS firmware, including SeaBIOS, and that it is not generally used on
systems with UEFI firmware, including OVMF, where UEFI GOP is used.  I
say "generally" because VBE may be used on UEFI systems which boot using
a Compatibility Support Module (CSM), such as SeaBIOS.[2]  This
clarification is intended to help users who may not be familiar with VBE
to determine whether it is relevant to their situation.

[1]: https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/XG2RN3HKVRDEDTLA2PRELLIENIIH7II7/#XVP3I2KQVZHSTDA4SNVKOITWGRGSDU3F
[2]: https://www.mail-archive.com/edk2-devel@lists.sourceforge.net/msg03788.html

Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
---
Changes since v3:
 * Rewrite the doc addition, limiting it to VGA devices with VBE, as
   VBE is the only problematic feature.
 * Rewrite the commit message as a result of the new scope.
 * Mention VBE in relation to BIOS and UEFI to help users determine
   whether they may be using VBE.
 * Make the doc addition a new paragraph of the first list item, rather
   than its own list item, since it raises a consideration for PCI
   graphics devices covered by that list item, rather than a separate
   class of devices.
 * Drop Suggested-by: Laszlo Ersek.  Since I rewrote the text, I can no
   longer blame Laszlo for any issues in it.

Changes since v2:
 * Change Signed-off-by to Suggested-by for Laszlo Ersek, as suggested
   by Laszlo Ersek.

Changes since v1:
 * Replace my overly-broad exception for devices requiring ioport access
   with a list item specifically for PCI Express devices offering VGA
   Compatibility provided by Laszlo Ersek.
 * Rewrite the commit message based on my improved understanding of the
   issue and the improved scope of the change.

 docs/pcie.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/pcie.txt b/docs/pcie.txt
index 89e3502075..21c2624c44 100644
--- a/docs/pcie.txt
+++ b/docs/pcie.txt
@@ -48,6 +48,12 @@ Place only the following kinds of devices directly on the Root Complex:
         strangely when PCI Express devices are integrated
         with the Root Complex.
 
+        VGA compatible devices which support VESA BIOS Extensions (VBE) must
+        be placed on the Root Complex for the VBE registers to be accessible,
+        as the IO port access is not forwarded over bridges or root ports.
+        VBE may be used on systems with BIOS firmware (e.g. SeaBIOS).  It is
+        not generally used on systems with UEFI firmware (e.g. OVMF).
+
     (2) PCI Express Root Ports (ioh3420), for starting exclusively PCI Express
         hierarchies.
 
-- 
2.35.1


