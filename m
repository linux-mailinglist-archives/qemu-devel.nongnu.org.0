Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33485B7AB8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:23:03 +0200 (CEST)
Received: from localhost ([::1]:59122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBUs-0003bL-KH
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLm-0008GS-6G
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:38 -0400
Received: from mout.gmx.net ([212.227.17.21]:37217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLf-0007ew-TL
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663096405;
 bh=11LtDJ/FRxnL1hOwc6wuQJsp9XSl32r0mSiKAp9ljjg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NzSh2UuHmZL/Dfg2P2JlKiaSfRoyw2wesVgSZeLOwUSqt+n5BVMMR21eLEmaiJH8H
 BE9+zJpoJOjiqbi/6xS8Tx9MIzCh4QrC4jrc4USlD8zMlwseUUtFr1kNyiJD+wPx1P
 lldMIZVpmUkoR+p7S0/TkoMN/03wgOh5HZ4gy/lo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N79u8-1pNh6n2PZk-017W3h; Tue, 13
 Sep 2022 21:13:25 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PULL 10/12] linux-user: Show timespec on strace for futex()
Date: Tue, 13 Sep 2022 21:13:19 +0200
Message-Id: <20220913191321.96747-11-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913191321.96747-1-deller@gmx.de>
References: <20220913191321.96747-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hAuncdms70yxwvNHGMuygil0SpgPD4XaIhrT9T0rjtAF6bzNFnu
 BrLdD5v+9QjeSmEUw8A9K0zhvCaIgTxd7PnS2B+J/e1DCc2zXVpNMDWyyF3RBn7VNaoGZsf
 Af7jXrl3JPGNJK4WDhJIn0nu1uhaNsiG4dENH1pZbORodN3KXYGS3ETZItV4826GVmP1Vd3
 Zdo/K7NTYzLAJP/jooutg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:N6+jsa3cfow=:dwjZNFArF5+DhCTX1faow5
 OwjA+hKfXXLljnk7d/k5gJtkxNvXPQsuriH2em9tF7VhMK3NKCHIWNUW+oV+1rWHI8I9LmYl7
 jyFyKBbWTR7oein6/nFYminEFUAWcaxR5Mu4TztBqKAABPF7DquqlRb5C/SJi25uAPHUSCpfo
 Lb3owl2VUBHr656Lnfhv54h4jnHDOTHlzw4tOXrXVx3wPW8YuVqtAH4VopX6GnlWKilkpqhEf
 aXwqj4ShcS2LelluIMjnJPtjI1L5llSuxcSQFP9aWXC6udpXXTQtWTJ3PslFPYRPAA2hKJK60
 q3QslQd36Ja4UXmliRrxYaaLfk3Xty5vVJYzLgHVToKHkhAOOCfhDnW6+5H+PbzCbZ8Lbkxbt
 7pwBH0ZfsRCqYMuuESU08geUBrePA2kqbcJesVezOn0y9wFbDa4SYLAnl4sItVdyXiuZAxiZT
 gO3yByNXb6eJ7PYSyN5JV8WKPkAV7O4JLShFZlJyTCT9KgA0EY8ju/ovYoh1S0k76P9OEKrie
 sDfXiI67SE56yYZhziQe3xiAVCKnloGVtF5lk8WZ7qbpBoO5bKv1R1xtVivTOOcnTCahPaCrK
 P0fHModu7+OEeC0bxTCtT6YRz7MRDj1NThMACHVD/lM7TIoMwe5H/z+WV23hA+NIxj14MkNAr
 Gcp6D5GN4OQAc/u1mS8hfs6ggMasnfddtyqeCTO1UPqqjQUT8W9Deo/a+mDwdY0jsmw2ZlA5Y
 t2ndL3y+E1DUg1ItESUnRyA7MOlCSNCgBFH9QV7xg6Upv0KQ/ABRRbUs8sXJDJYx9b4aGpCV+
 TcYW4RMoMeqWu+SF2L0or4F65albgaIAsljCb4oUt0SyEj2SWBm6lgGKyZ6FcJR5K/n79k7Zs
 JodJ3Onh0ddJ3Ci8riw0wSUjUa5RtIPkGKMW2zn1xq1QO8382pckaosuWIFnb1LlvQhqnyYiY
 SE22t2xYk/G6mkRLDpOacgpWAOx+/qLbgBdK3Qk0ZoxDJrX5h+YhPmw/V0ZiMdzm5ckM+xUcf
 XfLt4Y1YjpCqra+pRifygGX5PqwB5cDk4QmDOdfsmDlDThRHrubL0VSjbh+HWCxzqhRslF12x
 Kpm0zbVgZq+VkKCUxHfcZivhSloEi/UJUaYyRYdVTHSU60BWRnPkhm+uCc8yNdxqceDFIHQ3S
 abroxyicf0xjDmsd3VLQh+46Zc
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 6f818212d5..b6b9abaea4 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3714,11 +3714,20 @@ print_futex(CPUArchState *cpu_env, const struct sy=
scallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
+    abi_long op =3D arg1 & FUTEX_CMD_MASK;
     print_syscall_prologue(name);
     print_pointer(arg0, 0);
     print_futex_op(arg1, 0);
     print_raw_param(",%d", arg2, 0);
-    print_pointer(arg3, 0); /* struct timespec */
+    switch (op) {
+        case FUTEX_WAIT:
+        case FUTEX_WAIT_BITSET:
+            print_timespec(arg3, 0);
+            break;
+        default:
+            print_pointer(arg3, 0);
+            break;
+    }
     print_pointer(arg4, 0);
     print_raw_param("%d", arg4, 1);
     print_syscall_epilogue(name);
=2D-
2.37.2


