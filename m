Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2885BF0F9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:18:54 +0200 (CEST)
Received: from localhost ([::1]:35670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamVx-0007Ti-El
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6J-00046L-GY
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:03 -0400
Received: from mout.gmx.net ([212.227.17.21]:47709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6E-0003IT-Bz
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663695115;
 bh=Ch0VD1RjoPxJVBQy7NTTlp4njBGwmtHPyvXwy03EIcQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=On+NSD9rcLQ6RFPUPOhFkjcUzKKNeUhdaoO22HFQyYCOAt8xqb/kIXA7Jm281TL0M
 LPuZML8+a/YW3GdN4+wQHpCbCnvxYFogTxBXQb8SiWy3M4O0T12LFfJ19DnDrqEs8B
 RV0qm4K2N90Vmw4Avqi8WdPC1FzhVuRswUwhonkI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.174.94]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysRu-1pWDhg3VA2-00w1GJ; Tue, 20
 Sep 2022 19:31:54 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: deller@gmx.de
Subject: [PULL 10/12] linux-user: Show timespec on strace for futex()
Date: Tue, 20 Sep 2022 19:31:50 +0200
Message-Id: <20220920173152.199359-11-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920173152.199359-1-deller@gmx.de>
References: <20220920173152.199359-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kRfQ2ILoRv44pI/bQcfy0c8wnGLNml73rEnHLatdnFy3HFO75ON
 rowBrDQmydpkQlNf29OEgrq+mpyDh19VdFVUZDvw1mRFpQbtjeUCA26oxoIg7qgOetLaDTU
 Opctds4VrmGR66TaUtEUVCBvjJiFURpHLfi98pCEtJbK4zH7PQq7K3Pndi22nfdkWuL0iMe
 xNbzyMk8sXct8P1km+eUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lO9lN6p6NBU=:WVbw4MPWPgSiuhMyxaIW8Y
 Yhd6JI1VdfyTrv9FlNomYGUO0XVh6wj6tXF/Q5HQMSGAehSElZs4LFdnefIYzu731qevHhkD6
 HsYSvveuTs02wwN5KYz9pKWVC7kVBCgyPuRVRLh3p0UPXAXU1cWMO34PZDabhcXSEgZYOzZDl
 BAFy3KEjg8OKBqz9Bi+TFGrz/Nr0ERtJ7YrVhmsv3e5Ugq6Y2MD+4G34wc3nw8U+SpMnC2wxa
 SMtxZE9A+y8HTjaEaMLERtBXZuebCBXdyoXIRQw1q3g0hi9mUAL/HY/RXVOm2R2xFMs5DsMpo
 UrYzdzC+ozSxLtrMXkbFoy43QKUyRYHuB/Bt83h2wWBuRyOh9E99ItAJKhXR6ALFMDx2dMOzX
 gpxYc150Hv5t+Yex/rhuIpCa5IvoJG3QLXTyM7MbeTkiPhDS73VNgOp2+AdkkPNliVsu30JO1
 j6BFL64fFO9IboIuMdfRw732fi5d1X9WvKX+kjUNzOyA0btPZuFPElN5G7nioFwQbZB6Y4T4s
 Dq1k55BANoM6Ma2k5dAkeJ4qjN/Zmrgp0vHCbzBX1tLf6v5uU/UTBWPpDEo+Qy2kgwGtP6+di
 wqPwj84SJURRuL18qa4wJJW/Qph+MMWzFJUELyIeUKR2ayQ0CiJzWLwx2MmhVH6i2PF+cK+v7
 mr4bbPI8LuVXPu48cobt1h3WYeMuXutSCaKUOIxH2iC7/ltKv0qS31j2QZGTItJlWrxbTLRvr
 Rf48Va4/z6eGszIwTZR6qHEERJBC1xbfwllVBQknl2d7wBFf2+jDGmiO7uRlOQCRiS0Y2H5XW
 kk2ZExGUnUFwPeqZMGS/Wjm0/esLBuJ9zs2pXmqtKCsd5q1c2sgbbdLU1CJ3pWTyJFagILSAe
 nrfKiu2vGZDA2eRhwjvQSS0eQYzXbO1a8evXlaJfpZkihR0IyW1G0phF0GVJ9PjU2+2+mu4nS
 pXTs8pRmMRTgTiGDp5DTRt0cGp+8e8mty5oOZJKRJnC9aaDZQPaILagtphs8ta4QaYxrki5hY
 WN3tIoYPoBNoRVDANahIfXMgEduCAYjGDEkMAZCzFtXE2tcKS/8ymkYM3noaGooJM1frcbbAn
 9SELkBHiTgMKxurOdbTTFgPUj2/T0czxDJ5/Wv6Ijg8tEdhRoYEXh+LcBBjNQmYBINEBIRe7h
 P+ooc=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
2.37.3


