Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B40654EEC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 11:03:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8erj-0002RT-4k; Fri, 23 Dec 2022 05:01:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8erf-0002R6-UD
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:01:20 -0500
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8ere-0002lA-2E
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671789672; bh=YB2L70uK44N5R/oeVWfgwsmVVTyM6HjqFtMcefdKirw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=QMYd+asromC8PnInz7qwh0dYSCtvu7YfOyBa2diUcowhsbsI72++YL3+QhdTNHr/W
 xlEVdc8X24oHFyAG2+gzw3FGqWfc8ZvbMaN3CRSLS62pOtTnAYvcq3GOIfne0Dr3Q6
 uEdgwkvzCdCC13MyLfx5Hj8eofmGB/gsotEepGDIoIiz8EfgaKNnr0a/AoSV2Vl6z1
 pv2OoZGwkGph4/dLXBlRrFvkaF9El6ZZelAkTi59zAGjEvZnLioYqq3iw3jFztmPJ/
 XeX3el56/XiOnaVn+jFbxmbVAeyQGHUbzWG9ZDRgHJPHxOe8VyD1/df2DBQpg4KEQY
 T1Iwh4+v0iZtQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.152.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCKFu-1p0NOE2sYU-009S0k; Fri, 23
 Dec 2022 11:01:12 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] linux-user: Improve strace output of personality() and
 sysinfo()
Date: Fri, 23 Dec 2022 11:01:07 +0100
Message-Id: <20221223100107.17303-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TWJex4SKsJTrmf5763i24ANICVP6mVw69J7G/LEyTW05fhcLxBN
 ojSOZkbVrEvNFaPSBvaoAA6Sio75/zJO5Ao2Z600pmO98VA7ohM0omgXGUCIw92AOSw87wf
 SlT7NT/l96rRexl1cxL4DFnwjtON+wa5s63UKfrO9btzFgQa7bzzPHRnXcCq4CVVKkplPVD
 1GLB0EZEeVYj1Mk/ednpQ==
UI-OutboundReport: notjunk:1;M01:P0:XHwyTyOK+AM=;8tuf2LnfgXHOeKvstP5fizsemLm
 v1+Ot94GAOWoz7+yhq7EeoUGe1Vv/o5FGUECbiMQofJZQAHNLsVHgT5YBhU7Bz3lIP2lUNIJa
 Xnor7YpXSYKsFLii2RV9LENyb987wL6KzXqt5cJ90FBR4EDKtitec6+vAqaBR48iwhxaeSjep
 4WmuXoArOWwZ/1w0eayoDPSXUlX4y3E66N/0EEbn28QUk3o/gvWbrwDuFWdd5Z0mNMeJ4fClt
 Mj+ph6Cbp/xdYVo7b3DteZvZxWeM8HygH5EoosEUv3aOnCv5aGo/nIMDxGNk/kgxkhRXCP315
 fUrYQlVrBBwdANjzRddbNVxP130rCcMrLjZXfN4gUZGFzqUn8mBiM/DtRepb3dxnMmlevdLek
 t9x6vBAQQR89bayJrhcUt3LPXh+6caJMb5KugSW9l7zWi0uWQIcj85BaosIYpc/mxS6/nyHSW
 P1rm2c5WZj7O5aeIc1udGZOwyhMLI8AEvM4P6pugbiTxJkN5TmZDPs8qWZdC2C93C8G7bff9a
 M2S+hwYKa+wFNmuAlsjJp89wIXQeCiK0KaBwAoCoANFIpgsw01G3kEGJAy3WK3DB97LNd1rHA
 6qN7Owbu89QWaZdlualbOJBk55Y9seXGsBNh0sJeUzcwOn3qNjaBhCwXposBHonoH9H7QET18
 VXnrM4d6viu2hlFG/vOUtNz8n2XUlkBEzHx5sAcyAb9m/KBGqc0DZ9NXWndpxXybFqzaKeaBT
 FXiNjKsIcEw/Dpf/eBCI2mjFUhQb6RDs8xqEIuKSvisyP7cyYW2l3iyAlvx32SAWcLvSFN4Nt
 lmKlEk59GQVcJp+aeiaBYvRBeYCBWgijJBaNf8Z57GkzYKJgkctqw38gYtUgMgogLRnqeESQR
 2afZ46FxCA7uGZdxeqwlmcxOQbGwXuZ/ehTy3Ba4U2vtwlDER3dJKJ3sU3f+BvAd3X7ok5Dqh
 Rf0MNVQR8i0ft0CDBxdHCJYlwpc=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
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

Make the strace look nicer for those two syscalls.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index f9254725a1..909298099e 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1043,7 +1043,7 @@
 { TARGET_NR_perfctr, "perfctr" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_personality
-{ TARGET_NR_personality, "personality" , NULL, NULL, NULL },
+{ TARGET_NR_personality, "personality" , "%s(%p)", NULL, print_syscall_re=
t_addr },
 #endif
 #ifdef TARGET_NR_pipe
 { TARGET_NR_pipe, "pipe" , NULL, NULL, NULL },
@@ -1502,7 +1502,7 @@
 { TARGET_NR_sysfs, "sysfs" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_sysinfo
-{ TARGET_NR_sysinfo, "sysinfo" , NULL, NULL, NULL },
+{ TARGET_NR_sysinfo, "sysinfo" , "%s(%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_sys_kexec_load
 { TARGET_NR_sys_kexec_load, "sys_kexec_load" , NULL, NULL, NULL },
=2D-
2.38.1


