Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F3941839E
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 19:33:29 +0200 (CEST)
Received: from localhost ([::1]:41494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUBYG-00056W-Ee
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 13:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mUBVy-00027o-8R
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:31:06 -0400
Received: from [115.28.160.31] (port=56942 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mUBVt-0005DV-5Q
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:31:05 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8D7A360B32;
 Sun, 26 Sep 2021 01:30:51 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632591051; bh=JKAM4vWle+GYWf+vpYg0AqSg51L/IKi81gCWcj86cvY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=chJjmg1frlfi29iiBMmnynadyQSfoqdAGU5TpG0updm26B7Wl0EM4Ww6my7m/Zp7J
 t5LGJIi/SENXdaWkg76GRSvJ1Xjd/6r0wKGrYwOlO2bpUxH6xOVEr4HoNwKD+5stba
 MAA8vFhFEgqCkmcRqCveFo9ZZg5/G66IsL4RF39Q=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/30] MAINTAINERS: Add tcg/loongarch64 entry with myself
 as maintainer
Date: Sun, 26 Sep 2021 01:30:04 +0800
Message-Id: <20210925173032.2434906-3-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210925173032.2434906-1-git@xen0n.name>
References: <20210925173032.2434906-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 WANG Xuerui <git@xen0n.name>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I ported the initial code, so I should maintain it of course.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7915ec128..859e5b5ba2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3114,6 +3114,11 @@ S: Maintained
 F: tcg/i386/
 F: disas/i386.c
 
+LoongArch64 TCG target
+M: WANG Xuerui <git@xen0n.name>
+S: Maintained
+F: tcg/loongarch64/
+
 MIPS TCG target
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Aurelien Jarno <aurelien@aurel32.net>
-- 
2.33.0


