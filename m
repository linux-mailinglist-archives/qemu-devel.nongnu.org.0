Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4955BF103
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:23:13 +0200 (CEST)
Received: from localhost ([::1]:56752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oama8-0005aC-IM
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6M-00049h-A7
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:09 -0400
Received: from mout.gmx.net ([212.227.17.21]:53615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6G-0003IO-3g
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663695114;
 bh=BcxOqfmO/trIQjNo29cpvGdH85hMR3n5nzwaODzaDdI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kkZ7nMSVuORhh4tj4L23okHSV8Ljmoesc7ETfvVuqB094ypgBSNbqzMS4KRnP1Mf1
 eZLyns6Yi65ZmJiwvMdhyz2zSBwoBaYVWJT9uL/BN/7HduPNcRCmYbby3XMLLORYst
 Sn/IysGsn/SyVlytKIL+K97usx0BBra26oR5q5tw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.174.94]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKbg4-1or7WI1nu0-00L0Dx; Tue, 20
 Sep 2022 19:31:54 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: deller@gmx.de
Subject: [PULL 08/12] linux-user/hppa: Set TASK_UNMAPPED_BASE to 0xfa000000
 for hppa arch
Date: Tue, 20 Sep 2022 19:31:48 +0200
Message-Id: <20220920173152.199359-9-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920173152.199359-1-deller@gmx.de>
References: <20220920173152.199359-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FkLP9tkjtH8iyG+/FIAcbUwIaHAMBJw43DcTVUCH06SxnI3nvoz
 M9o0xHlLtd/k0eSZS1OImoGZlr3jSQOPb8+99xwncNqgu+K5g2e8q62Brpv4VVmRDd7wV2h
 LDLYF44z5/+TCJ/B33r+Ut8Kz6gKb2k+ffP4J75Vj9/CE1fb/nFTQOtWssHp+o4AjdApRcG
 Z42p3h6DDdXOBrK/+4eQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZctraO/anlk=:i+T1pnzrbJeBo9ba76k9+a
 I5Tb7ib15U8MBrJQlWEQeUAIq669d/GZlesPxADn6NNS/0ldGxMQtw30ggeUCgWWK9T9pLwVF
 Bbdw7FNQVAwPPPmcGggXMvdxoMOQSpAcKtX1G6FRKMOF2sBvS3aKWJRIJDyqbL6qOJBTRxHQY
 7I4me7/Gx33/hnGkR1qUVTGbXtElm7uryG3CGslcgPU1aQUlbJ2rQeAXl0dnLGm7y7QSAnEh7
 71Ardt1hEdplT7QpPENfHyG5sJ44hFQ+OhD7hjbvSXcD8faC3xhiUzs/r0j0jYSO8muK5qiiQ
 kXlKA3qB5w5BlMPBbsLCZqDte1WIocj7eZPtkafwQ+Vrtyt8MG/aQKlw1fOcYYaTSW4K7Zhqf
 QW7S3Z3VYYzJoJ3mGVjw7XU3x7aIBSwCLKt+u2z/44bnxNYa4ptPv3TwNhFChtTjLFWOUNuA9
 oG1XTgBmLVhHVyS5LzWXln+IJgjutSVFOieaGJzoXs4vop/swdoHEw3kbTAObs9AFKzp/vxuY
 8YtP4YMLuoO6VRwtVBUHHyt7/dzBQuIWNbWj21zcnXtPgYSrM9eV0ZFfnDvqxpgxqWdzk2FSj
 Vlvz5ljh6hMwHd7fQxwyQDCNZ8qWYs/OL0DJH0QE1k8NZnMPf/5X4kin3VP3OqSeBai7v02DX
 qAJXdBLXgV1vu5JzLC0fpY83upFy6rTvDoaqElQahfNB1WhsPEgtgY4w3XIp6QVDGg3ihcIya
 zFu8nw0Kla1YW2bP4UWvY7+23LwDx/maAR+bse/rFwfLkdYcbpAv/TMpRnZcUupFSg7iQZUSd
 zQqOxDMhVLiKmikfkihehvTLmIYnR5a0QpHbvH5VYaH3PR6tCPuEWBYoCRPpWJgPF0FNcI1Jx
 BF4v7gklJEXFLsNAAr+fQFRhoG7B21g5tKYr5osKi2pXOgKq88Kkulnoc/QtMPmofYyMPozGJ
 musqa6oZrm2h+i/142Tc+0CLzmsQolG4XOQJEVLbLvBI6RysP/3J+vgaVrI7kXCI7L5KSAmiM
 FGuXwtkf0Y5+zjEDjsjQyEJGwTFTqa7u4/WJ3a959t5JcK1DeDKi3KlNQPCoytL9u8/Oow7Wq
 Xvdms93teA12Mo3Eon0yxrbwMwTxwCulTTJQCPW5LN4OXia7bYvBMy76RjCLQkq0rUSU9SvM6
 v+SncSb047JTvAx535qgQA6VK3
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
2.37.3


