Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6529344E27
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 19:11:43 +0100 (CET)
Received: from localhost ([::1]:35666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOP1i-00065q-Bu
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 14:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>) id 1lOOyQ-00052W-1g
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 14:08:18 -0400
Received: from mout.gmx.net ([212.227.17.20]:45947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>) id 1lOOyN-0007pF-US
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 14:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616436490;
 bh=yL37xG6XJrcE77dgU6YoE+SVzDWz6KsgsXsXvHErCyQ=;
 h=X-UI-Sender-Class:From:Subject:To:Cc:Date;
 b=G9VmVK7yqoCKiPfXFKOa42gRKz+zBA1UZBTaAZtVrV0VTUVdKIiZ+Uev0G5bmTpd2
 Ga1nWW0erJ2WwwbWk38jSPVDR2W2B4VHCOCpAOqFfs/xKuV+Kl+MsWfKerqabmiT6b
 TYXezd7HRIAKoiUj0PiaEiA1DnecXjXHjvD/PLcE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([95.115.84.213]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBUqF-1lWwtR0fZH-00D0fp; Mon, 22
 Mar 2021 19:08:10 +0100
From: Axel Heider <axelheider@gmx.de>
Subject: [PATCH] docs/system/generic-loader.rst: Fix style
To: qemu-devel@nongnu.org
Message-ID: <a7e50a64-1c7c-2d41-96d3-d8a417a659ac@gmx.de>
Date: Mon, 22 Mar 2021 19:08:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uvbhLYB3E05csAny+ZRWTADfy5hiDLh5Cn50/ACudEBtZa/TzQq
 5POkwYcw9OjYEPyBzIAitTVcYYDEZlutNaERjugAIZDMl8U25VB9jwKMUS55UI1N2uAPZad
 9Bll/Y7huuHhX+1XEEt6cnRtulwpRvL9r/DlcRNw0GPLlykUtZ39+x+ZDkcjuso5gYHOFs6
 FKrEnXnTg4h7w13jHAuHA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kaEON6gdCzk=:5jozZSZcMdw00VGoAVqwbu
 7xPv6+QSJZK5t8Uv7XFit2Q9yoCTQif1fbqGa9YZiUZR/0Tfawsfok7txCpe1JXntfKHJMCRE
 Slt4tB237AadVqEhQMrGJeYK7GHWbwhRgv7csdHPlhAClxwWlxHcZ+YTAPgXX/oHJgZOoJQsi
 g5mL/WxHiFDF15mdE32xy7nsJXEyOVHv2SLeHbZJseOYyw3fwtAF1Jct8pvpKg5sNAZZ0+iK0
 pg9VCS1rh6xGRpEz/ZJVS9liBNr4IwBnWl8zFTCEpbaBMvk5O+BqYKmQmm/UNfrS/R8dG//Yw
 aFht39ecjKSfV9U5Tdf4NnPMvLqIhIPbDqerPClgUiYHJwjivBAE8EvJNflmuQ/7W9HcA3R4U
 xl2YaORR8QSfUEM0iUos5lVLRQgSBYBwo3ScbHTizN+XSxbM4MeViCpwQ0csmzWDJenNvleJk
 +Gs1bp5QVzro9D9P0FgL8JyGt9MjG6zRnrL//VkOBbd9HGClElCgPL3PgmzUbDeWZVwQNqo/1
 1JjT0GQvfNPS0Wxj2lo9UQU2lMlOPbVAmxRo9geJP7zHcztz3Ap/M7KsJRdV6sBQ9QAK0uoP6
 oCkSymC7dYM3L6NErHglvQ9HQFeh7RPrdMLLwbcpBkR+Rg797s1gvVkrDP9WNxiUoRttyWf9d
 hpL3RGrB81Iz/9lY3AA16StodbLotojkNAiSwFxq4DW5MVpEUW2svuDwc3yEJ/MWT3Ky/5g6h
 7yG8bHxQ0PAcnCHuJi1mTGA4DsG7S+ncE4U66x+fhj4k8eTp9SpEO46Q2C+7bC7NODK9LvhHF
 8coVYkYi7+2rGwgk/ci7aRGJPZM2BP9BWbIJN0QpEhCJo4h2Z/QIjfW0OVzrICMlvTBJWEFJ4
 wVkV9J4m6NPuSjNeysRcB16PaZF27xQQXNM/O4mQw0hTZ77q52ZG08MpJHLb++0StCROLYsjy
 RLtE8dfm9+w1M/Ee5Wgzvu4WWXZofPwlCiXg1qajenyoClDeVBdpYJqENfS9EbiYDviJ4Wqle
 PJxM/3+KzYIQHsVRMMHwmfF1WRXDpZ9tTDtnXVaoFkbZsSKxKs+1oGy9NqY4y8fWVmQu6awbo
 2LyCdbSlKgHj4x6/XPczIGhqx6rZpi9l33PfidN9D0LfT3EUgugYS3Uw+1NqC+79+Qbb7wQBL
 53RVl3+qxEzIhBs5hRmN725zk/8lUPEhk+i2mkxLn0lueEjk164ihAC5/aKHVnbRCOyR8=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


