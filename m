Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECF81E6394
	for <lists+qemu-devel@lfdr.de>; Thu, 28 May 2020 16:19:00 +0200 (CEST)
Received: from localhost ([::1]:47512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeJN5-0005lS-VG
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 10:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <soumyadipta_das@yahoo.com>)
 id 1jeGB3-0008Dc-Kt
 for qemu-devel@nongnu.org; Thu, 28 May 2020 06:54:21 -0400
Received: from sonic313-19.consmr.mail.sg3.yahoo.com ([106.10.240.78]:38412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <soumyadipta_das@yahoo.com>)
 id 1jeGB2-0001Cm-43
 for qemu-devel@nongnu.org; Thu, 28 May 2020 06:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1590663254; bh=N6w1UpFnUjMRwpw0cUNsMiAHwHkP0Wiu4fLARH0BpP8=;
 h=Date:From:To:Subject:References:From:Subject;
 b=Ab3+y90IWUYsYa4raNEUiBKXaF3Ir8+RtDWdBtKlehIjolzWAOAYBSyz0GbozY1LEy9ggnYOSx1OAQYfFOdt0q0XY+8XyJPkTxeDcXbA/DgI3pvVOqGjRqCLNcSv2FKnpa4IXjvZgFspnsqz0e2Sgk+4hGe1eLpeCmCJqst9B86alFWMJp247pXQRrSdmj2278K7ZHN7wHPQ3EX1Y9zj1ZXvthlySqT9UtRgFmB2nnigMb9wzLqWGLSwKzW5LgC4r7LQMktgoEiEvwihlvfihtZFeSTALEf1yvr6Gi2YXnj7zrxxDGh6pHQ9xnaH1gt+OE+ntaRHfd4H4fNwPVvHCQ==
X-YMail-OSG: AZPrnLAVM1mNfACCDY_BeXFDqz.ewm_EvEVJNToIlxpcQ.dSBWHKGLg9fX8ITmc
 g51Is0OMfIB3PgV7LYj5XjjWfElTztgzoRclA0h..aJLTouK7aCUheRPUHZ.4OsBmnXz67.ZJq7M
 eXkB0Km5Gi4_C318G8DvtpTjgvOfjP9jR_nqLeJVEvIcrtzrP9G9QTDIvRc4FPCga3ODfOqrR3Pb
 9ekAqcqI_dZi_17KLexGbUpSax0j4fV5ayMmsZwS7qK9vLfrXY2JbSWLozehYVdWlIWSpg9EKh3w
 06_zNQke.JdFHtikWN5NeTBk3mqEFvIv7Ng.yFa7fIOBBJKPGAH2_BIJVK7RrduwlKemJfydcSLI
 tY368UucgDCIlTmSpDmgmt9R7ZbAABXGYjnN2eSLwVwNxsj830FoSF.USyFcY1Z0amxNLeUn94za
 BUDOczJJdCCV7LVTIy9n2xWD8mz0A.xF5mZgfu9e.K8rkPvdzc_pv5qSa5XfPHV2glscwGU964nV
 hMhbGF17GOpwIbTJJ5MH3SN6omVdbf9efoSWVTOj3z3nOZ86GgH6kQHcuqT4S1sGkJYADl1BZXaC
 MgMilTmsAbgK63fTxha8jhX7.hhgfk02I2Ua9EYDGtycnOw9Y4d9rRarjzv6eCJ8__Y2Cy0foVtX
 pCuFCVAG50M8GEhOHBWJUeW43mrX3YO1Zmo4q_6WH2kfYkqZ_T.8C4bb9t5Xj3URGe8hoUjSUSaz
 zWvjXSw6UkS.kzdQHe2bzHlIYTDYK6nXL.u8H4hlgVql8NzS_MOsrG7By6mxKmI2iwB0KjTv7yB.
 HZ5nA1RR_KpO5p51qIOubhZKPRr67yjhIe4GiWKG.gJBOYWbJP177NrVqzwKwLGq0a.rWQSUuau3
 s9DsBPZHnOXlff6hoWCy4_08gSP7dh9eQAfDmDJtSDnaHml1ycBoz4quaxIoW3Syy48ZyXYHrB7M
 HzMHOal2IJcC4Ao7ttYk0Dl94jSr_zw6aOf_cRxyVtzxLWVSU6VW2eFTIAhdTIk8uihz1gFxjeth
 GVCVF0y29B49JIlrg71l1h44FGEkMze1T5geqkru8w90AoUyzAMHCrGxIqjG4M7IZ.2egJdX0LHG
 SlDbAEqj12i4unSV0bRNQV9sPOb_E16e0UIPFPM3dFP52wOd0mFQhTo1E81D87UqxXzYhL17xzUT
 VZfMCnCEM7B5_wnwODluBmo_o473Mfn1FWGqWtutg8N.VKUi12AkttNuodsIw.NEZ2P1pkgqtP_.
 TL6mr18n8mOzYcaokmErgh0FPcokBjnE.ekD8g2lFXVSaGCNuOczFsWMf9YKIMCD5RQaPY4tz.o_
 RqyDcVeQ2mCLEwBj7
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.sg3.yahoo.com with HTTP; Thu, 28 May 2020 10:54:14 +0000
Date: Thu, 28 May 2020 10:54:14 +0000 (UTC)
From: Soumyadipta Das <soumyadipta_das@yahoo.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <299940283.742671.1590663254236@mail.yahoo.com>
Subject: Adding LoadVM capability for temporary snapshots
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_742670_966473715.1590663254234"
References: <299940283.742671.1590663254236.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15959 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4136.5
 Safari/537.36
Received-SPF: pass client-ip=106.10.240.78;
 envelope-from=soumyadipta_das@yahoo.com;
 helo=sonic313-19.consmr.mail.sg3.yahoo.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 06:54:15
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 28 May 2020 10:17:44 -0400
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

------=_Part_742670_966473715.1590663254234
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi All,
I am trying to add loadvm capabilities to the temporary snapshot mode which=
 is entered through the "-snapshot" command argument.
In=C2=A0block.c file at "bdrv_append_temp_snapshot" function we can add the=
 block snapshot information using:
=C2=A0 =C2=A0 nb_sns =3D bdrv_snapshot_list(bs, &sn_tab);=C2=A0 =C2=A0 if (=
nb_sns > 0) {=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < nb_sns; i++) {=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sn =3D &sn_tab[i];=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bdrv_snapshot_create(bs_snapshot, sn);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 }=C2=A0 =C2=A0 }
However after adding the save state information like:
#include "migration/savevm.h"=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 #include "migration/qemu-file.h"

QEMUFile *f_src,*f_dst;

f_src =3D qemu_fopen_bdrv(bs, 0);f_dst =3D qemu_fopen_bdrv(bs_snapshot, 1);=
qemu_put_qemu_file(f_dst, f_src);qemu_fclose(f_src);qemu_fclose(f_dst);
I get the following error at the linking stage:
block.o: In function `bdrv_append_temp_snapshot':
=C2=A0undefined reference to `qemu_fopen_bdrv'=C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0I have added=
=C2=A0qemu_fopen_bdrv definition to replication/savevm.h
Need help is linking block.o with replication/savevm.o
Regards,Soumy

------=_Part_742670_966473715.1590663254234
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div dir=
=3D"ltr" data-setdir=3D"false">Hi All,</div><div dir=3D"ltr" data-setdir=3D=
"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">I am trying to add=
 loadvm capabilities to the temporary snapshot mode which is entered throug=
h the "-snapshot" command argument.</div><div dir=3D"ltr" data-setdir=3D"fa=
lse"><br></div><div dir=3D"ltr" data-setdir=3D"false">In&nbsp;<span>block.c=
 file at "<span>bdrv_append_temp_snapshot" function we can add the block sn=
apshot information using:</span></span></div><div dir=3D"ltr" data-setdir=
=3D"false"><span><span><br></span></span></div><div dir=3D"ltr" data-setdir=
=3D"false"><span><div><div>&nbsp; &nbsp; nb_sns =3D bdrv_snapshot_list(bs, =
&amp;sn_tab);</div><div>&nbsp; &nbsp; if (nb_sns &gt; 0) {</div><div>&nbsp;=
 &nbsp; &nbsp; &nbsp; for (i =3D 0; i &lt; nb_sns; i++) {</div><div>&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sn =3D &amp;sn_tab[i];</div><div>&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bdrv_snapshot_create(bs_snapshot, sn);</=
div><div>&nbsp; &nbsp; &nbsp; &nbsp; }</div><div>&nbsp; &nbsp; }</div><div>=
<br></div></div><div dir=3D"ltr" data-setdir=3D"false">However after adding=
 the save state information like:</div><div dir=3D"ltr" data-setdir=3D"fals=
e"><span><br></span></div><div dir=3D"ltr" data-setdir=3D"false"><span><spa=
n>#include "migration/savevm.h"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 #include "migration/qemu-file.h"</span><br></span></div><div dir=3D"ltr" d=
ata-setdir=3D"false"><span><span><br></span></span></div><div dir=3D"ltr" d=
ata-setdir=3D"false"><span>QEMUFile *f_src,*f_dst;</span><br></div><div dir=
=3D"ltr" data-setdir=3D"false"><span><br></span></div><div dir=3D"ltr" data=
-setdir=3D"false"><div><div>f_src =3D qemu_fopen_bdrv(bs, 0);</div><div>f_d=
st =3D qemu_fopen_bdrv(bs_snapshot, 1);</div><div>qemu_put_qemu_file(f_dst,=
 f_src);</div><div>qemu_fclose(f_src);</div><div>qemu_fclose(f_dst);</div><=
div><br></div><div dir=3D"ltr" data-setdir=3D"false">I get the following er=
ror at the linking stage:</div><div dir=3D"ltr" data-setdir=3D"false"><span=
><br></span></div><div dir=3D"ltr" data-setdir=3D"false"><span>block.o: In =
function `bdrv_append_temp_snapshot':</span><br></div><div dir=3D"ltr" data=
-setdir=3D"false"><span>&nbsp;undefined reference to `qemu_fopen_bdrv'&nbsp=
;</span></div><div dir=3D"ltr" data-setdir=3D"false">&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div dir=
=3D"ltr" data-setdir=3D"false">I have added&nbsp;<span>qemu_fopen_bdrv defi=
nition to replication/savevm.h</span></div></div><div dir=3D"ltr" data-setd=
ir=3D"false"><span><br></span></div><div dir=3D"ltr" data-setdir=3D"false">=
Need help is linking block.o with replication/savevm.o</div><div dir=3D"ltr=
" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Re=
gards,</div><div dir=3D"ltr" data-setdir=3D"false">Soumy</div><br></div></s=
pan></div></div></body></html>
------=_Part_742670_966473715.1590663254234--

