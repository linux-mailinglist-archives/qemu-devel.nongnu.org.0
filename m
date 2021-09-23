Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9D44163CB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 19:03:39 +0200 (CEST)
Received: from localhost ([::1]:47446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTS8I-0008Gf-Nf
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 13:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mTS4n-0005Oe-Uu
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 13:00:01 -0400
Received: from [115.28.160.31] (port=54296 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mTS4m-00059G-5O
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 13:00:01 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id CDBA060AEE;
 Fri, 24 Sep 2021 00:59:55 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632416396; bh=tWgLAv2V4EIPK5JexN++SbuYts9uE/SRFzRMHWK4g1M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ecOQ7KAtVLVrnIUvKO3nXZSqYtPKznb+bSpakcHs9Q5pFRx84UJTqwi/KG7sHKiE6
 V19xHFL/6Shgn72ths7qJkkHV5PlL0Mldm8Zr0MHHe8+TFvfXKznDBO3JC7fVgBeLE
 GnFQiD+5+/7s4ALHwLnl7EPG5MjICevfCTGsrdDw=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/30] MAINTAINERS: Add tcg/loongarch64 entry with myself
 as maintainer
Date: Fri, 24 Sep 2021 00:59:11 +0800
Message-Id: <20210923165939.729081-3-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923165939.729081-1-git@xen0n.name>
References: <20210923165939.729081-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I ported the initial code, so I should maintain it of course.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


