Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14A43BF82D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:13:29 +0200 (CEST)
Received: from localhost ([::1]:60830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1R28-0006TB-Ua
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qx3-0004rB-Br
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:14 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:40949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qx0-0001Ht-3B
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:13 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mum6l-1lA9dj0uep-00rlAO; Thu, 08
 Jul 2021 12:08:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] linux-user/alpha: Handle TARGET_EWOULDBLOCK as
 TARGET_EAGAIN
Date: Thu,  8 Jul 2021 12:07:52 +0200
Message-Id: <20210708100756.212085-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708100756.212085-1-laurent@vivier.eu>
References: <20210708100756.212085-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tGyJEFvFoZ0YJ/lPNBReOiN9Nvo5kalkGm+s6aYXPzEYeVg6crh
 ly3Reg7bWb8HytCPRykiJ5klKeqd8u+rSXTLgNVbs0izrchAYitZAoaJjtb6/7UP/rqK5jD
 c6xCQghDvOZyGFsg5t+mht9QpgZPLzS6M7w8nF6JhDGqf70NJVJrvYHFy6TjW/hyL2FV75H
 wO+jGS6dDU/jx25zzC4eA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Id33UoO93Dc=:wdG4tUq7/1R6M/kHc4i268
 ZFDNj0aen0qAXWk3dyh44WsPJf3ZoqenQ7qCSEyKO9pwqQE9/MUUh9Apw1AM4YRbvGJE6Eoxb
 QUBVtswmQkB3UNm6FEa3lZOE3Ci1LnoXb5Eo/HKu3oJhdJlf1ZZ99aW596cVpeuAvHsHd8fbA
 AxfG4ylOQVE54r+lBf62+l5ygr/rLj8fPtWnuSoho4YU6T05nJMIlfBT14s7f/p5jakFTbWKK
 ++3tlf6P8xSFcOA8Ei/X0KyNdvPY22jOaXi05W9hbrN1wABeBrlEV6Om14QlRr94Xlns00j9p
 jr6LFYA5dKZwNDt3zhCkaMV9i2Zze/IlOIWub2VEor4EK50ybpx7CbLar+4W1H7eaeOhdVQA1
 Kzze7H2RNyR+7GBWs7uz9EXcdrIluyDvDTgDSALH61OE/9HcolEWlj3hcQXMBzqnr94r/Ozn7
 1nV3u9tAPPW/P4TWveGj9ksPb962iehKsd0lIG9rdfYWhB2cxE5oj7BAe6j8rxtOui9mwoDYW
 v5ubZruU+sc2FP9gLbYf1OIjrniBlvMOG7eO0xkTbYtgpI+w10wxQGuKXLOBSQ3QJHlRE9MB9
 lxpbpY3Dmm8jFVKVv2svtjIkIa7H2cusNpZhd43/h2vJQgA7jWUIhB61r8L0NM7kVPshqj2kF
 RSTifuQoiZ3ixSLPaECqPXjdL7B8T9n/ozyGGpprSaW6RAaMlgXz60SA5vQrFqjZEF79a09wr
 fxRyK6fiOKql7VAgxyHZWXw/XYPb0gmzc1/DuhLJPrrs//7a+C3KDvoR/eqzib63fkOq+VfQe
 bz1LBTAuAFln8HMPslCyCOcrq2mrv09Si/SX9yM5Hkv807F2J15tsfRytXr5VPjM6MQHz7/
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Linux kernel defines EWOULDBLOCK as EAGAIN (since before v2.6.12-rc2).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210704183755.655002-2-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/target_syscall.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/alpha/target_syscall.h b/linux-user/alpha/target_syscall.h
index fd389422e31e..4e6f93605660 100644
--- a/linux-user/alpha/target_syscall.h
+++ b/linux-user/alpha/target_syscall.h
@@ -44,6 +44,8 @@ struct target_pt_regs {
 #define UNAME_MACHINE "alpha"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
+#undef TARGET_EWOULDBLOCK
+#define TARGET_EWOULDBLOCK      TARGET_EAGAIN /* Operation would block */
 #undef TARGET_EDEADLK
 #define TARGET_EDEADLK		11
 #undef TARGET_EAGAIN
-- 
2.31.1


