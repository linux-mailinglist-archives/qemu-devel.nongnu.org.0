Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0510334ADB6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 18:40:40 +0100 (CET)
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPqRr-0001iI-2o
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 13:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPqMe-0005Rc-2z
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:35:16 -0400
Received: from mout.web.de ([217.72.192.78]:44131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPqMc-0004aC-7l
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616780112;
 bh=+tezEO/HGYlg8UDCAoZCBB7IPiC45gc/drZqLmnqJCA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ptf2v1eS9ydxbxu2dNHA8//ixmBZr9PEkdYrltA5xFnGIuwjO3j2Y5/YRmA2JCahD
 nYCJuSrUMaZRAeRDSHwiuoza5YLhFpmgl/2zxkNQyf693rbKGBEflJl/s3TLNipS6T
 5utqLr9zTMd9H+2IAYfI7y2sea2XQgaH2BwLPxl0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MfHfy-1l18TS1aJu-00OmIk; Fri, 26
 Mar 2021 18:35:12 +0100
Date: Fri, 26 Mar 2021 18:35:10 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/6] chardev/char.c: Always pass id to chardev_new
Message-ID: <3e669b6c160aa7278e37c4d95e0445574f96c7b7.1616779714.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616779714.git.lukasstraub2@web.de>
References: <cover.1616779714.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RfU193eNeZKKflER_Wt9EMs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:p4aqaNZ128UjSErXZcSTZyCmTehRbHLH+yFfR86eJF7OLcKaxxn
 0WR57zxNKrc8dos3ElSir0/lRATHshEJbPhgXuUsRc55/q3mqxSsk3ab64c+tfakyvtE5gL
 TFCILpeIbKwoUcZNsQwGg0Koy71bSl/hQAz/HdBsh/XG3TvU7TGSPF8RwO3qEn0nzFURmE0
 GCxTsc5GZDOBZjB9WSmmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5YkUMQiK4XM=:0fgKNzTo9ESvH0FkbMjzo/
 /NCbqwgrRBcDkWcHR44keU93ApYZLL4+cf2bOzex3vm9wE0IFMm8EoKBuMpOWyxCuUpkdPss2
 Z8dYUGwzfLNHLjF7r3Bl51btZqYSZvHss80IQa828Lz9sj6mz2PDkX6hC3z1Xu3FsSF24p96u
 J1iNjhrt6ymJyKcLtUf67rcOcUyp5TQgJ/yexLjKMnhUprJ4XaVdjzmApN/z4yOYL1xxPth5j
 Y69QNOEYlNMsjQXbXo0XnBdpLTWYkwJrD7r7CenAb749Bk4Nl6MRcST1zrHxzkE0I39tvODiM
 Tqc3mHk2NBnVRxr+jy+IlcRsYNkyCEFhMubntISnI76WTT/Q+hYseiQvGk0DMYaftFwZwJDEf
 wXRED3lt/bYstgwLwglttAPSbX17rI4mLacjvj2opgP/fdh2r5gVS05+UxSBq3vQvH0gpa2wG
 yp0QMb119YAdvTFHkCl/eMLb7ks9tFlPMYPfTulTN+Iz+zu2TS9dCSoVUQy/iG82YVQ4V8jtA
 cX34VVtT7k5BwfMqnk1Y1O7tIGFm0MMMcAo51U4pj4eyKizzEYtGSbfT9reGmoqzlBADyBkgi
 Hq44Z71VMkNVimHux0g6/m0ga8rO9Ky8AUn41hZj7x+CA2j7nGdX9b32BX+I6nlx0kZ4RYO3T
 pdfk5nDZMZBD42+6b28FsiMh9qhbErF0TQiyCzH2wdl4zehn5w7ujxeBMWFVFRbQY51W1z0r9
 OBeGjUqRz3KwbLih2BcDvRxqHBHjHqR5TUVAisaV7F0VgV52N+4GS26rcwrkhKCqu3CuXSwpJ
 VWGbYPOvLxtyQkaFlBNmMpnABjUfDOYLv49PrtdISJASOyeVU4RVsQdHuIzJ2UDj3tKWWLR0R
 IzRLauPNFK3Fr3yBOmGpyb/wUSzR2q/0aKxf7HqOUcMrYXEam+iGZ9DFwOgGCvIxCBDL9HWXw
 iHK2qh8qZ//oQmc3elxWRRwnnvFpEMYQd1NGPHkLdu8K1/hFyiqz28rdkhjsG5bKVmhM5Mf4h
 gBSpGdZc3ljXariLAAyL3oX4/AwUYOTcPlvNOTNxjXFdj70NtNyVaC1rBST+S3Nehk4zGCS+3
 BarWMwwDuiMZjr47QBB5q6RNx8KMmn30xiHvE1+2cjZvNGzrYNB16vFcCEH+swXPTpijc9BgC
 FtRi/orWyvcrtgz38VQk1Wt1y50PRsloPSLcZtfc6pi16dn6wipnw3jDfyeGGIN2AbAfU=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/RfU193eNeZKKflER_Wt9EMs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Always pass the id to chardev_new, since it is needed to register
the yank instance for the chardev. Also, after checking that
nothing calls chardev_new with id=3DNULL, assert() that id!=3DNULL.

This fixes a crash when using chardev-change to change a chardev
to chardev-socket, which attempts to register a yank instance.
This in turn tries to dereference the NULL-pointer.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 chardev/char.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 48f321b3e1..75993f903f 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -967,6 +967,7 @@ static Chardev *chardev_new(const char *id, const char =
*typename,
     bool be_opened =3D true;

     assert(g_str_has_prefix(typename, "chardev-"));
+    assert(id);

     obj =3D object_new(typename);
     chr =3D CHARDEV(obj);
@@ -1095,12 +1096,11 @@ ChardevReturn *qmp_chardev_change(const char *id, C=
hardevBackend *backend,
         return NULL;
     }

-    chr_new =3D chardev_new(NULL, object_class_get_name(OBJECT_CLASS(cc)),
+    chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
                           backend, chr->gcontext, errp);
     if (!chr_new) {
         return NULL;
     }
-    chr_new->label =3D g_strdup(id);

     if (chr->be_open && !chr_new->be_open) {
         qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
--
2.30.2


--Sig_/RfU193eNeZKKflER_Wt9EMs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeG04ACgkQNasLKJxd
slhEYQ/+JARE3KO24R7VwpJAjIgS1ZW8ssZRoXm4G5+LwykpIar9UD+755bO/A8z
tKhz9UE4AiTpI2uBkrp00laQ8Ex9Tl0p1oaZqUscccnrctOlrNsl1md368OTgPER
Vx51tpJj1hjGYtqlDP5bXxB9mcMQeKAKHAlVcdwbhFZhWKFim6pZG5RA2SF+NAbV
CimGFdYu6YvCVMuQjoGXEoLmypJOSorOy0HF5Qe6ZKdI9WESk+ITFgkoCHP9QcGl
0dz8cKS/yLS2RlxeYEqTyQd5iERMq1hJYkSw78VQe8VyVNBmGKCUCBtk57deUcNc
iDFD3Q6cfSM1/EIsPVijay1itdBvHd7OpbmQI3rwVG0LMHnTOtPn7OAi5YcJ7940
WlMEoVXUPhkBxhdZT3ZGEwSpqWlpaI+8AUg6xNFjEBrheP5+XNo/Oa2+fSmqmUDc
0v5IjLfd+b76I5Sod9rOQRAHgeK5CxzGy+ewa+0o2OopbSo8bB4iVHyj/w3Go1lk
FYHhXU2TzDzf3ySaYZQeRAKjxZUnKqacx/I6c/Qcw7AmVk8dOzK55HCK3Qnkm75r
3Pre2151DmwkzHP3EyYwqVQoike8hUxYC75muSYlCAZSh4b7WHtLzRIW9S6DQOjZ
ixaGJdRGb0Qb+VuraU1rtyf/IZimoGbhkRO0YB9sNt9bxKr6VpI=
=LII5
-----END PGP SIGNATURE-----

--Sig_/RfU193eNeZKKflER_Wt9EMs--

