Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110CE345019
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:41:57 +0100 (CET)
Received: from localhost ([::1]:58426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQR2-0001cX-5N
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>) id 1lOOgp-000300-TP
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:50:07 -0400
Received: from mout.gmx.net ([212.227.17.22]:35395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>) id 1lOOgn-0000AM-Ry
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616435398;
 bh=yL37xG6XJrcE77dgU6YoE+SVzDWz6KsgsXsXvHErCyQ=;
 h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
 b=X/2u+Kd1W1CNznfBlkynE8kFzqmhYaVUpbjdv/NT2WUtK9zJsF5cpC4ntcQ3URcSJ
 cRWE1xRPOdWrDU8vj+DgsPxoAqywUROciPxTaCce8e0pmpda/lBDW0CHiGNX+l2hG+
 hyq1xP61gTKjim8W9NxhrfYY2bXc7M+dI5FU6Z8U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([95.115.84.213]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QS8-1lJyqM38Km-004VxE; Mon, 22
 Mar 2021 18:49:58 +0100
To: qemu-devel@nongnu.org
From: Axel Heider <axelheider@gmx.de>
Subject: [PATCH] docs/system/generic-loader.rst: Fix style
Message-ID: <0733e356-5384-8e8f-120c-986f031df53c@gmx.de>
Date: Mon, 22 Mar 2021 18:49:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MeEyMMeu5BmOHSZeR5+FzqU/c98q/s3kVz4+GbeimaL1C2OLYZa
 KZtJ3unTS6jD95gJxzrreEP0hJ2gEOBFY7AxpDlGBPKjb69co+ceEHvL+hwQNBZQC1jbOy4
 WRQMr8tp5IR0p+HfqtOsavpoI2A3FUbekjRqwpKp5okWIY/8V+p5YLKciWCI7PkG5Je26UJ
 7M8x6myMBP2Ofa2wjFBag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dcuRs1sZP7U=:vTh5Ht1EGy2T+uXr3KENOl
 wvmJB/HHPSsDwDxe2vqN6QNWrf9FkK6Hx4h8woJv6fgPP8iVG+L0oIVhVPT+URrJEJ7lh0jUF
 QOiDNDVUUHqN1m8nl1hAAvsusLN2dphCR+H1u1Pt7t0lbm2M/1MWLHC8TKsvgh2nN0Cn3sAAV
 QsCYsrjnAX82luLo0/juWsseIMiI70tJZOw4fvKPVo4gG3BmasnxtDXqCA6JNLAnEpVKLHKdC
 tN0C63tSjgVxuMN3xKWSEUHWFlelnjHkvoc6DTta7MdkDUYHXcfURievAJabrli9Avl77by2b
 HkCQDBcxVBPyYgNfGKf2gWLej14GDfoZzT5nCyMzvSw4hfGvsD93xe/MKu/3+vZorWn+XYMyV
 mRh00xN3iQKQcNB3sHwJZKtRgUfk27lCFZJQuf4fEgq1b9jHOd87/hFvEfWPX168zAvrsOa05
 cIkQMyDg9rub5Ve7RSj78/Kzw0eZxgzfY7E42HJQNpas1wb7J/N3mrnBI/e0MHJ7RFMO2nP1j
 fd0+3HthEQuECZEp0Knlf1xmXkk4bTPcptsPB9PGa2wue5IuaiT/7APcoz4CKHm/Pw0MHq83g
 S5uIwXPYcqvgosZJeJDXbZsOUlQOoqo7xZYklUeKujDI7s6aFsUL4xasOgSKlmCWUNOro6tpo
 pp5XWdQdSQz5CKQfOPJGSbsNCz28S0gOQBJNoXs695lur96Rc67IaBgtget5xG9reXCjQVmw0
 JKgBOrYVZhxFIlUN8wCrVqqoBjK/gSxI0AWSm1ifkvKmCQhopR9b1HbxsBiJ4nwhhA3WNgzh0
 FjhYsGJCgmaYiulJzOByUD2INKP76TRAFAwyoQ9TxTia1geooHty3WSxbUVQw5U0IsapBCPmU
 ovqsFu0EAuVeDYkmaTdw==
Received-SPF: pass client-ip=212.227.17.22; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 22 Mar 2021 15:34:37 -0400
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
Cc: Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix style to have a proper description of the parameter 'force-raw'.

Signed-off-by: Axel Heider <axelheider@gmx.de>
=2D--
 docs/system/generic-loader.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/docs/system/generic-loader.rst b/docs/system/generic-loader.r=
st
index 6bf8a4eb48..13457cc705 100644
=2D-- a/docs/system/generic-loader.rst
+++ b/docs/system/generic-loader.rst
@@ -92,9 +92,12 @@ shown below:
   specified in the executable format header. This option should only
   be used for the boot image. This will also cause the image to be
   written to the specified CPU's address space. If not specified, the
-  default is CPU 0. <force-raw> - Setting force-raw=3Don forces the file
-  to be treated as a raw image. This can be used to load supported
-  executable formats as if they were raw.
+  default is CPU 0.
+
+``<force-raw>``
+  Setting 'force-raw=3Don' forces the file to be treated as a raw image.
+  This can be used to load supported executable formats as if they
+  were raw.

 All values are parsed using the standard QemuOpts parsing. This allows th=
e user
 to specify any values in any format supported. By default the values
=2D-
2.25.1


