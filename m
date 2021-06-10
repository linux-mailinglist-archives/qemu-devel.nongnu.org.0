Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5994D3A3333
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 20:37:26 +0200 (CEST)
Received: from localhost ([::1]:57992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrPYT-0005Ba-Ec
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 14:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lrPWP-0002x7-Bj; Thu, 10 Jun 2021 14:35:17 -0400
Received: from mout.gmx.net ([212.227.15.19]:50741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lrPWM-0005PW-Ps; Thu, 10 Jun 2021 14:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623350107;
 bh=qBuU1SSi7IuD58YXYaSoqAAca+SXsbvJCIYG6Wk/ftg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=WtFeiCKVcbGIB+86X1C8oGks3qiI6e6CiVYX2x21HayvrtFbDlsu9u7gNG6vtWLYH
 zH8eBrCejR+q3fI1OsHcpCrPPrAh7EYaYOUUolNkh+EoNNNsejkGWEHEdNCxrTEXgI
 KMS7R824SVqG+7YAwbx2FmCcupbfKiVPdyxHUdFI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([62.143.247.63]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MMXUD-1laZK939Xz-00JXBv; Thu, 10
 Jun 2021 20:35:06 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/1] hw: virt: consider hw_compat_6_0
Date: Thu, 10 Jun 2021 20:34:59 +0200
Message-Id: <20210610183500.54207-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v/12hOeHA9KaSB5+usBPWXIvwz7AwpaBhAKTFWZ3ylnmdUiPZsa
 uQFzZhC1thVtwvQ1WxsGAc872BBT3pdMkWJVxwVUkJCUkUI8IdXznXHLBlTYL59UVvCCDy7
 yVSuuRJEGdnrjBfKX8Ji+AdQUkOhNcAERiULa/Dypa/o2G3d8WpgVYLsXHoNxSojOLeSb0L
 zgWN9Ld5DA3WdKRm76zPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rND5nwB9Rc0=:fDqus6XAwpXNIVVxmcQY4x
 HfIVfGOPtEoUMcD3EIjJUh8JyyEvJBVrXjn10Xpg9MU/HEcXM/TZE7HF8zzdNYxvODfAb3oec
 wM8MHEZe3jphexop9MGc77eopF58TNDwhsGtiiRh9NpKl9AZ3x/FGxKLLiaBh4PWOEon0tUpv
 EQaUX5wiK5J8F21dZUgFj/asrnvHp611jPwvjww7JhXRTEQZewtoMRodju80Qw7yQ9+Hfsf4P
 giFWucYw0ggqoyjRZpWqTnZkMRUbCompyF0xuabMbHZhX+zp9/4XfLiJLdMQ+Iw/FO6ddkEZL
 is/JJZdgbOipIPafXoQSa2NlvAtjHU1X6OKI0/mu+24OO40hOOQsAWnzyhKV9to40aChFd95h
 gkGSuXBiigxgS2HKjUlIql6Rm7IzmC8M1zKyjy1EM5r4kxTXswEEQcpOmMfCRPFnJcBd6CU83
 //6P5XNQuvjvktWaQLohUon7Wi3pS/Gxm8e0pK9jb2c+9F+OOtXyCT1TCn8PkqVNfPjOX0MIt
 9AJBbihdJQyPmOgjCnLU5nFDVD/Zbx4Pwi2CfhLO7JXQQA9h78PhD5culbg5Up7yDwcCYMoDW
 9ApkQ/ehgFPOq5I0T2p1pZ6sEYuypLDtIWmm0yXozTGAJbwqgvQ5q8YlFRVsrlJWZkZO3HRG7
 S5OKS9QMvEKZn3zVBwgw3yYhONPywRrkneyBW111THUbetI6VsVwEbplXoiI+niu6UBmuIdK1
 xjzKp6suqkY3SRJGkKcKL6pXAb5iX01ROMhfLoPe35cniMx3EDby4IaCR97Xw/2K4iNZ2idey
 VSPZdoPjRBNPMkrs1yrU1fqt5BvNW6N5x7E3qDOzHKPi24KgMxYw2srFlCaOEZRcSeFiJCPhi
 OT1wWwhifxqTX4WoZYyPbKZTCjZ0R9rWMAj8660/arjJwTCeCJw9ndvT+TV8E9BqDMU/I83qs
 y3UgQR/aBNgHP5vAvKWgvIwNhZLtyjudl6LiY43YbeD2OY4N1eDR1Evt6pJgDtqszwOb5zdiw
 X/zpMRqv93SgjvE11yaVaaWguRHUm2TW3a/FkRrhg8/NWG2pd2bc6z9wg4SVUfpzP00vqRXRT
 UOtlIViDfsVXA1+nemMiY2Y4uw4ociQ3t7O
Received-SPF: pass client-ip=212.227.15.19; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Klaus Jensen <its@irrelevant.dk>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virt-6.0 must consider hw_compat_6_0.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
=2D--
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 840758666d..8bc3b408fe 100644
=2D-- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2764,6 +2764,8 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)

 static void virt_machine_6_0_options(MachineClass *mc)
 {
+    virt_machine_6_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
 }
 DEFINE_VIRT_MACHINE(6, 0)

=2D-
2.30.2


