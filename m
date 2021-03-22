Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7017E344FD3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:24:07 +0100 (CET)
Received: from localhost ([::1]:53150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQ9m-0002c3-FT
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>) id 1lOQ2E-00054o-Ic
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:16:20 -0400
Received: from mout.gmx.net ([212.227.15.18]:42561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>) id 1lOQ2A-0003Y1-Sw
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616440565;
 bh=ewblw4KAPS2McIks79D4QX4ZyODWBeeF6GatiDj7TaY=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=QOghudtZ+NesUZi9+bpQ/OMmbxITktbWU80Siw1KSw57G84ykjyXHb7lcGPZw4Mue
 luMSYxXw17ZgnH0qw4SE6uA0hksZRAK9L0GXix53kzkCgwdyCRM1NMhMPAvgJU+phQ
 ilaNXf5J1lLZK69JfFgaygvP6qT9/VOM5JIYK2gY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([95.115.84.213]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNNo-1lBgYh2hSE-00VRvJ; Mon, 22
 Mar 2021 20:16:05 +0100
Subject: [PATCH v2] docs/system/generic-loader.rst: Fix style
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <a7e50a64-1c7c-2d41-96d3-d8a417a659ac@gmx.de>
 <CAKmqyKNFYzC5xkAyhZ+StNGCQUrztKQzqAQAme2wrs8CZXz1Hw@mail.gmail.com>
From: Axel Heider <axelheider@gmx.de>
Message-ID: <36b9dcf9-a691-1602-ec7d-1210e8aca863@gmx.de>
Date: Mon, 22 Mar 2021 20:16:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNFYzC5xkAyhZ+StNGCQUrztKQzqAQAme2wrs8CZXz1Hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nHyebnosZOxtBt3DuDLFvWsPQFcH0xTuMhVNZarIh/DmL3McMX8
 6DwHjY5HcnfA1XuH0kQto6x1Em0/qAwbUKpeAL6CA+Jh+2qbUkDuxLYJWlAVRNLkfzXKWBG
 GIs/VxKIXqQq366/ONSKUEE5clKZuyGIzqAVM7+JH/vl7+rc0LnpS4nYOiBS4k6RMjLIvsr
 vLgYjaTJZ2QqHxUj9n1pA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vlzoGWhigQc=:zX5iglZ9EQdS0c0aYfu4do
 uU7lT07dWouoFgKvrsF2IsdWlFUSXbNcLtpjW9AbF4muSccbudyhQHsziKRQofamkf4sE2pJu
 YbDfmuJ2UUlAQJXj/brcp7BVejZ+0IA23xu1lVtWPsPedDy1a8VfOzN+7gUsAjbaA8JyDbbEO
 TybrMB8aIJ9H0nhrJ+qOSQiOJ901E1+GdXr1LZKNDzbwxPjSg+77viTt3XfIi9rEsiVkW67SI
 GPCQfU37Q2G1u5WKIU3nNYIZSgBh+ghWmiN/Paemx4HlhyzzcMdz/0b3x+Ch79mdhtTlQx+nP
 A4fHeR+fVisdIQebCXyxMldJ0dy7Ni00jc7bDCrmlQGrvL5ZUV5wCagj/rIC4994LoVmIdyhT
 0fVgttIKCxogoX8H28mWKskxfbsjt5hs6Qk7OE1FNNLhazl+V39w9c+B0mEzegG/Lsn9zdBlB
 0M/c/yaqmPv1WTrV/aE0UaDOrWP0Ccm1UAVA8l3Go9cqooRcWkaaGn7xkuLGz2/dMMwi0aHz4
 QhaRnQRaz9rD0BqJwAlUvj1s0kSKxidaB6qdGNyMhrgnEGr+ZCfCdujpvQkc5rMMaF75IkI2H
 oy72pZ0zaG3WyxU4auxdLmp4JSW5baq8MRbEhd2hleyGjJ3H0X6V6IYkn+56nMPKz6UTs8GJa
 oi/zYLj3doRpfmAQN+kE0nIbtURQBbr1LoXtTEcF39phYmB4JllIO42oUZWDxgN1lLuGA5bn5
 2/gst7iEKD85XBo98ibviupYe05RpMGETdIk8AorovWpkDfzaT6Ll9RdXT6rMschqOHwQWUCs
 Z6ohOIcjZq5xLQzV2Y+IHg7b4pmLehX/rEigGX69bdmd5PXzR25tY0rk+N0YD9LQ3a1EpymGk
 zDAYI0CFL9GDIy3dv8hH7BNB9/ysP7jdvqSj1KC68PlzEen237W6Pvu3F79KKGEn9cOxk0D+b
 ByYwnC79dfoeV+AVfA4z/9/cMuXKEtUWTFL0o0RV/EyLN6XwAAwDNCaeUmBxk2gICVLnwXMvV
 AHwlmhdtZHUKJL4kym4fQp6QogrUkxfkR4S+5vPVvhOFs9Rz6H0AbNomhMZnlVAV2x4Dn8E8u
 dnDD/SgS3qkYJWdJvOGFQsallQ7wpyYDkIcuvhvaKgYCotQSaka/WTdMWSatMXCtlIg10SWjL
 G9+ewH0JECtDvSBxQh2IkENMPw22uuG6j70GK/qwHK5uzWzZ7knAXEPuJ12q1Q6/IcGzc=
Received-SPF: pass client-ip=212.227.15.18; envelope-from=axelheider@gmx.de;
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
index 6bf8a4eb48..531ddbc8e3 100644
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


