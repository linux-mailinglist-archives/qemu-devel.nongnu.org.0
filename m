Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6564E568735
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 13:48:16 +0200 (CEST)
Received: from localhost ([::1]:44714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o93Vv-00049A-Ei
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 07:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o93ON-0000vu-AW
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 07:40:29 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:55551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o93OG-0002uz-PH
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 07:40:26 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MVe1U-1nz2yi0nm0-00RbxY; Wed, 06
 Jul 2022 13:40:16 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PULL 1/2] m68k: use correct variable name in boot info string macro
Date: Wed,  6 Jul 2022 13:40:12 +0200
Message-Id: <20220706114013.340537-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706114013.340537-1-laurent@vivier.eu>
References: <20220706114013.340537-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0uN+kcXs9b0Y3A16GNM00m4MWzrSZ+3hw4VxyKtU4sFmqOr03eD
 OuZ/27x9vTJANCWcKONvQFU1929GWEW42EAUb7WJ5rRMHetiER1F2JTwFD8If9pIJz4ynTA
 bwDblkMG6K0rYK0eLj93rIV2zDMKAXXJ4fCZ0c+oFKMJW6PZTxVngVA1gmp4yrVKhuqHTP+
 +1BhpNWPBrkB5+DkX0wrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wj3Iq5CEGbQ=:Mk12YkV7NFlPwtOo7IR7Fa
 UQEpzBIKAzHg0wt4LWC9p4Sdge673JpZd+clw4c3lVIomA7mqVMLrLFQlsYFD5oKQ1CovbGpi
 kKfgNlO00Dl0O0J0RPFGu3SMr80RTFlloUsLP55XoSqy+hXJGO/tuUNxseUmHQuxufYd+zRbm
 ZN4XayL5XZ3SwxqrzGtiSeViFweF82VRvjWtr6z5YPRE0/+h3trUs1v8ypGQ/KPFy7HmqR4IM
 iN9j3oPyH4KTjqCMuk2yKgP+G5rJHCDihFKkvogO5RbOTP4BJ8fQW0FsBnDF2dtArswrx6y5J
 E1yEr1jq6augHD3E7IS8odQRenh0hvsxeQSOS6PoVa85q6d6aXBBxQaFVKhueJQEmM8Nll9nZ
 In3tiPGaFG1eHJM5Xhyy6Deyrkql4a6in8UJFQ7VupVS4NHfyVVZpmFAqAZe5F0g+DgPyzt41
 MJShEOUbKX3GPFSAdt9xLSNsqKvwH/mM5cUtz6NMFOERwVMFK1/wp/MG4KNzQz1a+yG/7Sr9e
 YPfTgD8m6UH5BIup3gleGKHrlKxD7i320WCIWxL2Vb2aFOdY2xSFB+ZkMZCboCznEqDq/IFgc
 1G47NswJ69PBNKZBr5MU6LbvUJqqlmjcdw6b2kUOWLYBa+3Ob9KLFus9bdiwCw3eKv/pxrROV
 +ttuAOLNN7sXepd8pZxgzp5k2gI7Q6GSBWWO442Q3A6khGmkNFs1imC4dkW2OLHcVv1IIQYbl
 YVOVN6F2dIgKYelqAUoZuL+ifdJTd6b0bw/e/g==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

Every time this macro is used, the caller is passing in
"parameters_base", so this bug wasn't spotted. But the actual macro
variable name is "base", so use that instead.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220625152318.120849-1-Jason@zx2c4.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/bootinfo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
index adbf0c5521e5..ff4e155a3cc8 100644
--- a/hw/m68k/bootinfo.h
+++ b/hw/m68k/bootinfo.h
@@ -54,6 +54,6 @@
             stb_phys(as, base++, string[i]); \
         } \
         stb_phys(as, base++, 0); \
-        base = (parameters_base + 1) & ~1; \
+        base = (base + 1) & ~1; \
     } while (0)
 #endif
-- 
2.36.1


