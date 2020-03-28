Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C659196760
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 17:32:55 +0100 (CET)
Received: from localhost ([::1]:57114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIEOE-000132-33
	for lists+qemu-devel@lfdr.de; Sat, 28 Mar 2020 12:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chadkennedyonline@yahoo.com>) id 1jIEMk-0008Ow-Pn
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 12:31:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chadkennedyonline@yahoo.com>) id 1jIEMj-0000I7-Jt
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 12:31:22 -0400
Received: from sonic315-13.consmr.mail.bf2.yahoo.com ([74.6.134.123]:43134)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chadkennedyonline@yahoo.com>)
 id 1jIEMj-0000Gy-E0
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 12:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1585413080; bh=8oREIDk+rbfY5EW4o+DQF/t3P1aDM79CZad1RX4a6k0=;
 h=Date:From:To:Subject:References:From:Subject;
 b=kHdKV8smKa1rUMFepTR2FyyVDpAGOiPOhiiPmc8tsBhgNL7rstKbvuacRLdYK91tjGiN6dLuRto/sy6GGP2CYt+9SaQTApcbeMfwcSl1JynjGppzkhJNSa/SKg+jbNb4cbpcnRc8ajwnxxWLv7JeOiS2kkDd9JQqzV5QVORVwH42ewByOEymJtLOatnaqAI/miIo/U9qcT0PlEBqsjLktKMhgJV9eQSJamSSJtgSGdAmoVAjvX+CKGEqkSA3vhW4iiNl3fEjYn0/13BMmomvjHBhRTk/jjkW5CzEdEWLPg7/bba0CpGKq/RQRXHqlXw3NMlFOx6uvedmlLy9XuMo2A==
X-YMail-OSG: Gl8cXJAVM1kq3agTTFuYEtsuvG69KNAp8XNQPs2Sz6LDF4sjmeYKXB5Sief0koq
 gSofDNN_ny9K0ZfkOFEpesKhl.QnQP4oC7CdzmWnqYSlz9.kPwWFNbLkcVkWVuy4IwJFws_VUot0
 FXlKTz3fY0ryKqeY5mqCKR1vol5fCaQc9itb3mQ0ddpjAUdpwarMhEv.Gqy9m.Y0M62H0ofSUXge
 saZ_cyywWEo45.aRr8ZFk0S8k73KziqBr9eYvWoQlKx0rEUbtBh8G.oRFUTZn6C_1J370AxgXdMq
 2sKIxd6EwlYneTLDRJGKy57gkui03O3QMXEvC_MUy8WL4MKWYBAA7q_21K.TDVaDK4EklqdTICIu
 BJO1y9g.F6R7WzeDYw_DHi.fOP19nGpssxh0w0597hyhOdRILv8.BH9puAv3zcB8S8qSLymY6ILQ
 SpmrO3qGQV5d3vStoltnzgVlOv7wSsNp5JVsCZktdJfzLaWU9YOjxvyswnrOEB3B5ko30afJjDih
 ybilkm0B4V_5qT5VehqXHkRvSPOTKNc1PK0bvMXFKwo5BS0W2sr1ZRLPKPIiPMO77Oq6QzWDKYTI
 g5opamZTzIx3wAOPfbjJu0uGwCZCKwRVlacZQyonFQQg1AvwlI.ZbB3ORgBiZ9jMiKrL.VjM_YoP
 s_ToyKNelu5bjHdGgi3F8vRNbmiL_au3bEDeQX8Ys_gm0Iq.EUXTtllDqyWrNyJXS1DO9ALnyH_Q
 QC3cLNzl9ekT0AtaZWdlJ2zc1sijRz2iJyzE1mCphZnYmGYovqkqYV4FKNhsA3Kf7X_Lq14xab7k
 KPayK2ONrjzjfOkUMof2Ncle4nB4LoGNz6QqLk2Q1zh4KD6DbO2lco5ZBTPOlJL3YmwuE2gYS1jG
 wnNu4ZqXLzJ._O9AViClN3YV7u4jsd.l7yb3tFx8uxYKwu38PIVZ.jg3Ixvs0FBg221EeYwWNOxs
 y4gqFEFBNiZXnyS6b8nnCQEzTtbEonMXmNEoC5W9eQhNU2HvpQU0PYWevyTPyAawpq7AkDZIjiBd
 Hmt2betLJeo2.zaFWpPwfj6K7.7cAjd4Gle3UdI7wZsClLMtbWqmjl8LxIxakCbt56HIMF8MhB6o
 69mw.yFQ34A7VJxWXP97tPgovitSnhkxNJMLu_1fmD0p9tF.EA3ZFEZQiNBaEzkfr5qDFK3FgKGP
 mkTc3M.lX4mDOWH9nGXWcG5r4e9OSp4brFKIgrwVmUs6H1ZiRrnJvQJwgAderCtwRPlUidnFGKXY
 L7j6YCtQ4lHVQXScH5nIYt6zzRKBVFBdEisgSyVC.QoKVp6qf9qEBJWK3rZKrokL__Cj4M1UNXx_
 TceiZbwL5_3.sLgIyQQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.bf2.yahoo.com with HTTP; Sat, 28 Mar 2020 16:31:20 +0000
Date: Sat, 28 Mar 2020 16:31:15 +0000 (UTC)
From: Chad Kennedy <chadkennedyonline@yahoo.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <1076116481.206160.1585413075911@mail.yahoo.com>
Subject: Request for Wiki write access
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_206159_539423149.1585413075910"
References: <1076116481.206160.1585413075911.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15555 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149
 Safari/537.36
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 74.6.134.123
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_206159_539423149.1585413075910
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'm getting started with building QEMU on Windows and, following the instru=
ctions at=C2=A0=C2=A0https://wiki.qemu.org/Hosts/W32#Native_builds_with_MSY=
S2,=C2=A0I ran into some small issues. I'd like to be able to tweak the wik=
i a bit to help save others who might follow behind me some time.
Therefore, I'm requesting a wiki account per the bottom of=C2=A0https://wik=
i.qemu.org/Main_Page
Thanks and best regards!







------=_Part_206159_539423149.1585413075910
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><div dir=
=3D"ltr" data-setdir=3D"false">I'm getting started with building QEMU on Wi=
ndows and, following the instructions at&nbsp;&nbsp;<a href=3D"https://wiki=
.qemu.org/Hosts/W32#Native_builds_with_MSYS2" rel=3D"nofollow" target=3D"_b=
lank" class=3D"">https://wiki.qemu.org/Hosts/W32#Native_builds_with_MSYS2</=
a>,&nbsp;I ran into some small issues. I'd like to be able to tweak the wik=
i a bit to help save others who might follow behind me some time.</div><div=
 dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=
=3D"false">Therefore, I'm requesting a wiki account per the bottom of&nbsp;=
<a href=3D"https://wiki.qemu.org/Main_Page" rel=3D"nofollow" target=3D"_bla=
nk">https://wiki.qemu.org/Main_Page</a></div><div dir=3D"ltr" data-setdir=
=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Thanks and best=
 regards!<br><div><br></div><div><br></div><div><br></div></div><div><br></=
div><div><br></div><div><br></div></div></body></html>
------=_Part_206159_539423149.1585413075910--

