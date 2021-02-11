Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4579E31867B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:54:47 +0100 (CET)
Received: from localhost ([::1]:48640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7kM-0000Yl-C7
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1lA7io-0007x1-Oh
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:53:11 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:59778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1lA7im-0005BP-KU
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:53:10 -0500
Received: from sekoia-pc.home.lmichel.fr (sekoia-pc.home.lmichel.fr
 [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPS id DBFEDC602E6;
 Thu, 11 Feb 2021 09:53:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1613033580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=j1jc8WXUtCC+FePrr9Mh/sN7KMNQghFePJ86bZrdFj8=;
 b=VKjh4VqDHOAO94epk8rDmycm4EtGLb74ELnYo/xct5PjXN1LFinOOA35FBfOp/W1UXzllb
 NhkS5zUviMl7j4vWNq0e+crrzSXaA6HkV8X33XYN24EHjGwn8iNjcLo0mgXXfNyOpKprbU
 H5jnPc1LgUc9cOd2petsY7nbpO1/Id0nXrNH7b99/SAkkVn7iYPq5kklWRLkLSaRLIBFZQ
 XKIymgzf8jt6JYAYibGhysmsRHkObB5a15OouFdir08koGRQ10cKh8lkum56OqIkrZTTGg
 GeEQMRAOmYH8M3agf+PxUTAsViM6XIAdyDSfZQnOSXZYBpEjuFFq9taSpPuV0A==
From: Luc Michel <luc@lmichel.fr>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: add myself maintainer for the clock framework
Date: Thu, 11 Feb 2021 09:53:18 +0100
Message-Id: <20210211085318.2507-1-luc@lmichel.fr>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also add Damien as a reviewer.

Signed-off-by: Luc Michel <luc@lmichel.fr>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e6f1eca30f..67ad14ce14 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2850,10 +2850,21 @@ M: Bin Meng <bmeng.cn@gmail.com>
 S: Supported
 F: pc-bios/opensbi-*
 F: .gitlab-ci.d/opensbi.yml
 F: .gitlab-ci.d/opensbi/
 
+Clock framework
+M: Luc Michel <luc@lmichel.fr>
+R: Damien Hedde <damien.hedde@greensocs.com>
+S: Maintained
+F: include/hw/clock.h
+F: include/hw/qdev-clock.h
+F: hw/core/clock.c
+F: hw/core/clock-vmstate.c
+F: hw/core/qdev-clock.c
+F: docs/devel/clocks.rst
+
 Usermode Emulation
 ------------------
 Overall usermode emulation
 M: Riku Voipio <riku.voipio@iki.fi>
 S: Maintained
-- 
2.30.0


