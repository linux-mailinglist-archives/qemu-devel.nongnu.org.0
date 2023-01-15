Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FA766B408
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 22:02:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHA80-0005yt-8o; Sun, 15 Jan 2023 16:01:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pHA7y-0005yg-PE
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 16:01:18 -0500
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pHA7t-0006lQ-BY
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 16:01:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1673816471; bh=vDpiM8Fj0PyspxqL3DEYZIxvzXMVoxtM1udg7P4OQZc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=cfdlH9V307rUsykEXBBZaBGDeXAPR9GZ80Xa64YNlaUNbwq5FAM9thppFt1HRA8xO
 rwIfFFYQtmSZw/MlBjTUDk2X5AoZgI5SeYC/Hw4dx7Vodp0mCAwcOZE4y0ER2uN3y2
 kWPVMAWbpmm85UrpJvbDilrGUppDmWh6zV3uadOIoPYVsXU9A/55BTF+QTCni4Ou2l
 Jyy2Q6GfmcaXEOiQkN33uFf1BMp9xQqfw2MogjsCGb/PPt0cRYW473aB9umiLuaEgt
 rxH9I9KNcLX2chnr45StkBlp6mUTGAHhmijCwdMCaJvc5byFNvKN32FwHSPlJDSMK1
 kSwy1MgzolHnQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.161.25]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKm0-1p6egW3lyk-00Ood4; Sun, 15
 Jan 2023 22:01:10 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] linux-user: Improve strace output of getgroups() and
 setgroups()
Date: Sun, 15 Jan 2023 22:00:57 +0100
Message-Id: <20230115210057.445132-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g+rqDzvm+BzXvmrJ7Q+0VJSgSI43kWaLam+IIozW2Mpbrd6jx9h
 5DBGWNPdQTh2KZ1ws4LskSKWzYLfIkYIeBowzMp+DSK3sWkW3ORSbejh7MXW8ADU9kv3JEB
 sYUbnwj02ym1iRM3lDdvf2eQHxk2STHWeyzdLzsq5xalMeyobyCpQVU1Tr6PuQFqP9sxxO0
 qbUac4Db5MPqvHIqx19rg==
UI-OutboundReport: notjunk:1;M01:P0:pKFsgemGvkU=;eb+AT4YeQvj/ZjouYwQh3630C6B
 Sq19RqOthdVZd+8c5/QmHRpJeW+mERkdltR81rHzbaB06VkU+oSDCEb26IESc62AepFf1OB0o
 Sv/tIvsptloTJU4IJilBLB+6/6IYvseyyJkj2lnwQVIGRuibXdVfweSEyHvZgBsHooioEFUbF
 VYzyHm4zxSsOw8LM+dFsM7mb8V/Ld+nuvYN5JmZjsDMo68jP2LWTqYj3RA8ThffhEcKY5U7FK
 O3O0sAipBYeB6+9sCUmPWMlevB3o7BFoh/WXhVFbQmIbKRUfiJk2/1VbMUwpA26Kg8jnvvW8U
 WzVInVNV5BWIvhWjeOqL08QkIWQbtKSJj4N9u1+itixOGsCGSJjyBW+oIVqE+1Aa8u3RAeHvF
 c5pwb1Xl/tkR2WkG0MPAd0o71vhyhzDLrB7xpsrDRTbI/yc3bJARO/0Vco4pOmsegm0dDI0za
 5zgZ0I814hmkY3RKTxiygLLQq2VfJCL/C8MQLlSs48gngfCk4TIXEOldPHJRfhraialf0sPD2
 WlnI3SoB5+PRSLD1EZtccfYRtw3jqNJlhqHPZwhoE9Eg6MmenIHhSt9TeMI/oqSt3Jz3J4jOi
 jxBcJVBEGaV2LpSjfnNedGJMGFwJ6bJPcXDSOuANPGhK5C2BDxVJCmcyBPOS6/sG+j99eB4Od
 7lv0FuWFtD0BhZc2Ycgjr6lPG1E4vcLRZcRzIeG3jePoiq39YHdtrewxjYJyKWt3bDWnzBsbW
 ZkLmsIWCDsr1KgpxauvKetyKTcQ09eJ/kdfsvpDmXIk3qQkPixhj2RVscOxQN/v2RIlYCUu/V
 oCiXhMjh8KMwgz5UspXx9BtZK515o61F7jU0i5urPrKs6sWZSX9iNi2zf5i65veIdimoe6LoK
 oPCfg45ney4GymA9IGHzqkzw4MLItyyJ3BLgLlmeqjV4neSjZMwqzU+KLH/AITnzeY9PilDRD
 SM1wG0Bm4WBFV9FAnWy/3VHYlxg=
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Make the strace look nicer for those syscalls.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 3924046426..7c1124a718 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -321,10 +321,10 @@
 { TARGET_NR_getgid32, "getgid32" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_getgroups
-{ TARGET_NR_getgroups, "getgroups" , NULL, NULL, NULL },
+{ TARGET_NR_getgroups, "getgroups" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getgroups32
-{ TARGET_NR_getgroups32, "getgroups32" , NULL, NULL, NULL },
+{ TARGET_NR_getgroups32, "getgroups32" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_gethostname
 { TARGET_NR_gethostname, "gethostname" , NULL, NULL, NULL },
@@ -1308,10 +1308,10 @@
 { TARGET_NR_setgid32, "setgid32" , "%s(%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_setgroups
-{ TARGET_NR_setgroups, "setgroups" , NULL, NULL, NULL },
+{ TARGET_NR_setgroups, "setgroups" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_setgroups32
-{ TARGET_NR_setgroups32, "setgroups32" , NULL, NULL, NULL },
+{ TARGET_NR_setgroups32, "setgroups32" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_sethae
 { TARGET_NR_sethae, "sethae" , NULL, NULL, NULL },
=2D-
2.38.1


