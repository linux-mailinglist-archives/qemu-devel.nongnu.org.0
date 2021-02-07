Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E1C3125C2
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 17:04:54 +0100 (CET)
Received: from localhost ([::1]:45962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8mYP-0004A1-2l
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 11:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l8mPc-0006Jg-Ng
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 10:55:48 -0500
Received: from mout.web.de ([212.227.17.12]:48839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l8mPb-0006iU-51
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 10:55:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1612713343;
 bh=mIf4qypc2HQmu5a46XluMGIafyHfLdZ1Utqreso4Mmc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=nTx1X9Ivu2tEPbs21BAWMIjBGJOnrwXoJPRMiOgqBHbqHTnYWxvRfl917v7qbMHEo
 c5IuB1SeCwckMR6VVoo/kQevTfuyD9owQcI+WkXNWbM/7GZjLdP1RBO++OeP5oKmuq
 X2OCidR2s25lH47UNxZdeDy7ACEo8Ey6cQa2r3vY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.85]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LiUKG-1llP0s3c8S-00ceGc; Sun, 07
 Feb 2021 16:55:42 +0100
Date: Sun, 7 Feb 2021 16:55:41 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 6/6] MAINTAINERS: Add myself as maintainer for COLO
 resource agent
Message-ID: <5ddc7c7e2b19aaaab79406e5031b0a697e7f9fb6.1612712637.git.lukasstraub2@web.de>
In-Reply-To: <cover.1612712637.git.lukasstraub2@web.de>
References: <cover.1612712637.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NhinwOJL0CBt9xGliM5Mfeq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:nk4eGP09RwjZp0RCmyGvwkXFbKFxRcEk8liQTZy3dex/UMRiWys
 SQRIYaBMGFjE4jRqC19l4H73Vg0JejOWpQt1eWLaXy60z9uTFoN329sQCJlpyzK/Qls5ghM
 249f9RzRY1MmcObklGQfKfRi0usqM5cHexXsN9ic/wZghJRBESyOkx3RMUV2BpH0j+y0AfR
 x4XhfDnBM30aRAhN+85pg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:setmmX7Wtgw=:o2ezqbVkSuc/1Vw7eGzPYr
 yxCmgEfO67Z3/ygW+uKQePf5UHRcvAZSOjHs1/sWBHizEMhs0yoNBGkUHhCKZpfjgKB+VWSNV
 u5VH5vEEs2JxgMOGliS8HGd0l4QF9WiQs/Z2JQM5X3hPS+15y0jLsOrxpU+/lHLR6B+ywUQbf
 ihxdlo82bUpH9sj2UrGHCdS4ifeh110FNjC75JMCmnR78m4NK/roEMTKz4CgKEPYx7eDH5gvh
 H8VM7u2BuXHIfX4vn8Rju8ierIPdISa67rO11YV6ggCgy8Hij6n1w/ezlWcea3TTtDQkX4ozP
 z22NTZ7vTMA1nARgKMvgDS7IRurIyj0FmWNfDswP7GSPCNIhNjrj7v3rDRDjFJeJ0PCXflHQu
 GTcSmkMKLYVKCaWWNA94M424nFa9gAsvOnIHliBRtC+h7O7pAKrCd56Z+5IkCNaeSZwzemjA/
 ZRw/GWR32m86TmKvglf4XZ4CPGXjXVcuJvt0JH/LrSfhbTFLJi4mxahMY+EhugkIPrbuQcKN8
 GREZqGinN4GURqbfyF2C22h3pPz/pIHTjT6027mUI4mVwPad9Yma1B+BDsJDcy+UVH0/m4Xji
 3oeu27PXkIwAwA0IeBTOT43XYfs2sXo7A5giEtm392M+1w8xeAPl5v7Cg9YDMV5lBAYSg2BDk
 Qs92p9weMVomWzS9XemSfYQFRd1+eaO81UxDa5yE0IwSccwvXtZIwcfcUehjMkEhbdNHf/j/r
 D6XT9xm6wSrSWmz0yCAR4hSbVixwMvJYusXuWc8w7ewTYtAmBUYxj/uI/e0kBMkxCCDY9vfER
 K0X3VTBmfrBww3VJQpHm0bu0E3bNISowop03Mr6AvvdzywIO2fQF5HY9aTMSMFMA7X3mdZGCm
 t0ieEedRbMB+bRLEG488gProGvgfFVz5oNVoDgsLs=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/NhinwOJL0CBt9xGliM5Mfeq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d8b0bf966..d04567aa4d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2773,6 +2773,12 @@ F: net/colo*
 F: net/filter-rewriter.c
 F: net/filter-mirror.c

+COLO resource agent and testing
+M: Lukas Straub <lukasstraub2@web.de>
+S: Odd fixes
+F: scripts/colo-resource-agent/*
+F: tests/acceptance/colo.py
+
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
 R: Paolo Bonzini <pbonzini@redhat.com>
--
2.30.0

--Sig_/NhinwOJL0CBt9xGliM5Mfeq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAgDX0ACgkQNasLKJxd
slgPOg//SZL3EMJmx7eShHZqZwizfud7Jv/0oMPmF7gZeiSI6C9ptFdK19h9tBKA
6y2zjk3H7FW2rZOpEtOHgLJPeZ7v22cxAB0fuSuCc8Pv+h04mQ9WaUjLORNUeesI
SZfzGkZy61uTNYPdJuAg3U0dZuhdUXrh7s0vPgOXiiGp89S0d6ozhGbqAO9DllWh
+rOypibSfD14DdFWlb6VOnIXUhZOtxaMYRdeBo6MY2PCBxWXqYuR7dfF1RoeCxnJ
Xp+w5QjcEhtrTpytUuWzdDWyWK6omcdZ2uHSd8Lcg/EqAy07AKk8avYLwnjjZGDj
gc3ZJaEmkaRPYAjIe0b+tcJR99w6vm21BmYK32l1qlkIsxYCCwCF+p+KOStZpt/m
hMI8TdmRDDCCHC3NWnnW+6QX4BbCIu+2MFS9AiYe560AsCAM+cNWAMR3OZBsjSeK
Okk//Xuy9Wlvoqqypk1lA7Tod5+MbuQLbg11apbyx26WQecr3fH3DdaP0DvTQ9Cx
uJypkSwMOdj5NVyq7bkY0OmcHA4gm7gPwylIleGU1FIWEZpUa4qndheSRtQC2RXn
RBGW1YqsZ0rLCE3TupMxC1jNVt1NpkCceqT8vYRrH6lTMJtWX2SaTfBs1WTMfT5K
/W25MnqgnCMIL6djQ8kQZwqUTPED76SFsF1IdfvqOnaIgN/e1lY=
=hFkc
-----END PGP SIGNATURE-----

--Sig_/NhinwOJL0CBt9xGliM5Mfeq--

