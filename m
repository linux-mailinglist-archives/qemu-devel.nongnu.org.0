Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2D25B5093
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:25:42 +0200 (CEST)
Received: from localhost ([::1]:46600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXReH-0005Si-VL
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXW-0002S1-9s
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:43 -0400
Received: from mout.gmx.net ([212.227.15.19]:39569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXS-0002lf-VL
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920315;
 bh=11LtDJ/FRxnL1hOwc6wuQJsp9XSl32r0mSiKAp9ljjg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=AQPZqeVL4xmEqY24Gi78JWzYhyQ38D1Pyot4OJTJ9qCmFEpukhcvFkYtZ09EpG2FI
 wQEvXAZwJl+KRg/I3FwLXprauTkax/mdjUExHNE1CdNW2w8QnT2+NGTJrSOECWGznQ
 Q/Ty/4DxFjSYE8hYA02MtYvw6V/k2q0UDcMIpZb0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.178.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fMe-1oQJiy3c6c-007BZf; Sun, 11
 Sep 2022 20:18:34 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: deller@gmx.de,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 10/12] linux-user: Show timespec on strace for futex()
Date: Sun, 11 Sep 2022 20:18:28 +0200
Message-Id: <20220911181830.15851-11-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911181830.15851-1-deller@gmx.de>
References: <20220911181830.15851-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Cj1zdcw6wfMQ5UeEoIW8ov6XhMGBK3qS0pijJ5KhFifYiKWldnW
 Vkr5Q2as/tQPA85kQ8SXGF9vbUFNIsq2Jx/k4o+MP3XTOCNlLUygzO2lns+LBx6zgVHY8wP
 cPofdyTQBzmZLw+yeSq6qTHt/fzYmNSWQaMO4fIhoidGYpIMQaJ0Wr5pq8cCEReU/tVn7JD
 N9FTHFbN1gNmYyNC17KMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FyW1ve7ylm8=:GtjX6eQgnOLQzJKP6ffpzm
 tWq6jSahJvgCpYOubMhqEScVGYPftUOPVVFvnqE120Duydn0Dk+nKlwYHHfY/gRC0miQBGSZ6
 S4swklfVOokR7nN7nrmHiH566YK0ppreCHnXsXscMEI8lodlcslI6kDsvgV2ZV/9OBm6ECrQ1
 Xbk3VbYCWM+5quRWVA1Dm0aBLxSu/RBAuUvCKWFRVxD2djcJJlzy5RLbJEOQABw9t+PLJjxl/
 xVNY0LjHj1xz0Dvytvn5a1OvZy+Nr3P0FMVzXErancU5SCwY0OubsYfmLXf/tDw3VSTzcXCgj
 W8pXKOrMSjSr/oXUK+L3g2BeSYYfX7xCHCjeLGijr/TBV9jH0eCrZFgnMSWn509mmHXxihlKT
 1axKDQkhMKqMTp3txFn70Q/HtA7/fxAWExMCreRZVGlmE6bDY3ZpZc6enK2MQezFsVnwzAAdX
 1yIQSWCa2QMphFqVASi0F6hL1e43LczsGWu74mQrtz4x8SwEtNd4nyFEXpcWjoUl8gzlL1lOS
 6vKS/Yy7w/YDoKzcO7G4PJbi+gmLwg9ob6p38lN2+/OCNrL3uOURvcs2AUgZexspsKZM+qS++
 obOckouBHWfcoBnNUIc/dkzUjl20lwkfuVvNQ0IP1kOTJ001znj6Z2J/WG3Qsq+CpyuA5TPKu
 Zf3Ew4c0FiPiNfpjcwzmfGdXnwYicjCQAsfM9x7I4vw0LM8twlTBNg9i8LZnOiIWMXBskAagW
 xx8wt7HllR4wKyGlM947GRknWZkTlX9VJeMRXf/itDlPnNPmUFFlHZ2taty2TiNi5cfsnQRdW
 PnQN1aAWfabVCBd4TXTuKweYKNRSqNolHYT036q3u8sPE5WEVRMdu4JvPrRPGuPFNqIJnnTP1
 xf8AgrpEAV+NQxS3LeGs5SBp3Ttna3a7f3I6uXczAcPvcRTAt3G2ftu1r/7sgA12yYoLd3eG4
 L1D3cplH49KtOqoJrSHsKab7gwDqlY8xodvDDArlmIr1aQg8v0/9SUiLYHp6fKcKD9QuRoexR
 PJFUMta1E7Aly0fsTzM1ie32sRNxV7RkpC5JVImv4UrKJGwCDa+UnUdwN2ZrGn+hY4r8DOaQW
 OcpKw+uhulNCQmetIUFc5qQmJo/vT5oD5gclGJFjviNBH8Cb6UgLqAYBAJTOX5fqqYv6dfC+O
 SmkLg=
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
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


