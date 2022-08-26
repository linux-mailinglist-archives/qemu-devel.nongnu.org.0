Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D0C5A29EC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:47:14 +0200 (CEST)
Received: from localhost ([::1]:41546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRac5-0005Gq-Go
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAo-0000di-Jh
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:02 -0400
Received: from mout.gmx.net ([212.227.15.19]:46063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAk-000557-Hu
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661523535;
 bh=vqBGlEYh2uc/X0/atrzzZ0k1UEI6QeKa0HJ0LqnmR5s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=BKLalN52yvqI/W4Gk4yRZA+pJA/Q6erGX6BzZY2SDAdVDAaPtYAT5XKRLZc3tJI6v
 FH2KKuIwV+n6DNoza/CvyEYi0WkCD95osj8JTjQkf5g5i0fp88zT4oUohDdRNUKEc6
 zqKjNgfGSkV+4PK8mAj/c2VIZ3ifz3l3ERDzqVMw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.171.190]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKGZ-1ocsqs0v9d-00FiQN; Fri, 26
 Aug 2022 16:18:55 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 09/13] linux-user/hppa: Set TASK_UNMAPPED_BASE to 0xfa000000
 for hppa arch
Date: Fri, 26 Aug 2022 16:18:49 +0200
Message-Id: <20220826141853.419564-10-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826141853.419564-1-deller@gmx.de>
References: <20220826141853.419564-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:W2do2XuOj057L8nY8Evl+xJSSDIwIWe0IqMBpd8k5njh2jFt8ie
 LQBVsJ6f0PO4q3pMtYA0diELpzBHc2VFjZot+rrWlfc7kyVU3TlUde+Q3GjeKPs8TeQrMBu
 WTK7+/P11MfvTcCxYYjvXQIBI1DRULlfd2AkcdgJdLoEk5UIGD+DrqISzvelkoiNNfJHGWY
 M/1KvaO3jxfs/UKGO6yhA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SBGLScu1gOI=:UPaXxkMEMakduV3gDDMReG
 FlMU/61sP9dqlp+U9HMgzzXvGX/pOsGlqG2kjUbBEg/OeFwF9Q1Sl+AHEjjuhXhxoWQPBf2zR
 F+dyd/JbB/YxtQyEjZmJFUH20xllaS53uZtJ9WT48vlQh6ZrAalG1oMbmWEME6BDxiaIuW2rR
 NGmX27my6X7Nf8F2iuERExzgTVWudFroF/zHnlCULTFI88/R2N60TNq54jjQZQLRVLZQnEbdy
 rjzKdx2lhCJANnWn61UuwlMtGWJMQW/GbfkuICYAQbf3pOKIxuz2TJBZ9iQGGGkNzSGbkIxLU
 jMv6kFt3DQO1JY282t2ynLdcmgmfdb3tLyYJDXietBqyBhY3+DlF/q13U1FfZOVb36nrADEAs
 S1wp60/gCEE2cKUq19DzX8CcaU6BQkhvo/NlMIvJwxsqFhZhNT5byUbZMqObm2hHUtUmtcRMS
 aFcV0jG1RSBPj7hSHNwkiqbXUVt0tU9fsi1qJOoS4laR4hGALBwqSbg/IdVEv+tEgDCXbUKi+
 6VdaDA7LhobZFj5DCZRGA1ZyJUmL1AhQKzFKK3AXwli7TP9TPY2PG6OBlfj+9gHo8/kn39pxx
 kUF2EfG/sEcGttMk8QxMtRcFzfIrXpfMaZ/03bKzjYZHhtLK093gejce7LbFrIGOI8sqIM6sc
 VhXAbFuCz/kVgzSca9fEG/O5gT2ZmyfZwmtt8bpcqQ9IMLse51/ZHHYgVQtIUzKuXpM4qpQmp
 4sswb/j9M27XE2r3GHWY+hlRqI81nkkQSO1qwGYA1EYV0+3iPw+kXR9KtBWBV2euWBOnacsQ/
 87vLY+FWY8XyU/Vswp1xj5BLVUqibCaOzqiK6HvDp5Odu0Tr1hoAliG7ThEs3w2kNW+2XqF1e
 YQP5Na+qS07gDwny1DOEBEa5RnRvZHugw5iT1yZJbzky6DISwEPbeBybJJHQ3A8rLxhdTVW4j
 u9oQHOs+fkbXsrWiSDDGLd3IZENmNudiLyZA6KFxL4s+oddUnOHaOo0ApqrhsIPnGY3WKnWwa
 L77EE3Gbh275/dVzoCpL73/HAMzxq611ULGTN0/PBKQh2dDTT//1KhW5A72dXoS7MEAxTqCqW
 bmX5Blsxq3oCaS933nr6nDssZoUhSVPl0NWqlKiGykwxzNXe1Y05Tw2Qw==
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

On the parisc architecture the stack grows upwards.
Move the TASK_UNMAPPED_BASE to high memory area as it's done by the
kernel on physical machines.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/mmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 048c4135af..dba6823668 100644
=2D-- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -251,8 +251,12 @@ static int mmap_frag(abi_ulong real_start,
 # define TASK_UNMAPPED_BASE  (1ul << 38)
 #endif
 #else
+#ifdef TARGET_HPPA
+# define TASK_UNMAPPED_BASE  0xfa000000
+#else
 # define TASK_UNMAPPED_BASE  0x40000000
 #endif
+#endif
 abi_ulong mmap_next_start =3D TASK_UNMAPPED_BASE;

 unsigned long last_brk;
=2D-
2.37.1


