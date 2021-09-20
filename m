Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903C4411634
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:59:57 +0200 (CEST)
Received: from localhost ([::1]:54002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJps-0004O5-JG
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEP6-0008Mi-9z
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:56 -0400
Received: from [115.28.160.31] (port=35588 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEP3-0005QO-QD
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:56 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8AEBA633F3;
 Mon, 20 Sep 2021 16:05:09 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125109; bh=0IY6fouHN1eV7whv2WjiBoKwWOUwhGcvaIKax7Wtakk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UdaBb9rPF/UTW7HpQi5VGMdSxLrGaRse+QEMMjzZj3l/fU7s5+MR7Eix00SZlSRDN
 AxKoOnkyUXQT2viJoozWF1hH71als80ogrYCTQsGt65OGLhdsaHZi1LiKAb7uTNref
 ULRPsL6P9yvaoPEoEU0fVcL3M+0u/qEm6ZyHHO84=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/30] MAINTAINERS: Add tcg/loongarch entry with myself as
 maintainer
Date: Mon, 20 Sep 2021 16:04:23 +0800
Message-Id: <20210920080451.408655-3-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920080451.408655-1-git@xen0n.name>
References: <20210920080451.408655-1-git@xen0n.name>
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
X-Mailman-Approved-At: Mon, 20 Sep 2021 09:57:24 -0400
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I wrote the initial code, so I should maintain it of course.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c20634d63..0e9942cc00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3109,6 +3109,11 @@ S: Maintained
 F: tcg/i386/
 F: disas/i386.c
 
+LoongArch TCG target
+M: WANG Xuerui <git@xen0n.name>
+S: Maintained
+F: tcg/loongarch/
+
 MIPS TCG target
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Aurelien Jarno <aurelien@aurel32.net>
-- 
2.33.0


