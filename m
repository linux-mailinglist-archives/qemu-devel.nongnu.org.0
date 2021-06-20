Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520E83ADE5D
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 14:48:17 +0200 (CEST)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luws3-0003PN-Rz
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 08:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1luwqM-0002Z8-IT; Sun, 20 Jun 2021 08:46:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1luwqI-0004rg-Py; Sun, 20 Jun 2021 08:46:30 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15KCXtjt058503; Sun, 20 Jun 2021 08:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-transfer-encoding : content-type :
 mime-version : references : subject; s=pp1;
 bh=DWyOdsfJlguxVCaaOF2cUjSg3lvdvy5d1oFqzbIF3dw=;
 b=LhgSoLY08taGeqxgVHtU2OoJbeb9zLceA5jmdbaOKjpsDfYtle/6LB7pHA3c++6vfm4p
 ZQbLjlilGJkiVmYlPlvcerR9lO1viML+icYjdCh9mBapaIpITYZvXSPCFmzPbk8iupDZ
 GOOCxJk47Z8rBbAeUtUOh4A4ia5ZDEZ7M6Yx1eK3sXDjXVlInHtiP6JUkeqj6pnx9xKE
 a+sWQTnliF6g8gh4T1tH5TSpHMlwaTO3a0jgZZxubZwsBXyTYz0LHZ7mN0EmHBv3ojtJ
 HCeYCNE7J/9ervPyTjQtanBBj7+CWRhhT1rWJc1N/yeacsDUtBnbNasCDxNixSkvhGWm 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39a5gp8dub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Jun 2021 08:46:22 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15KCfGTT080330;
 Sun, 20 Jun 2021 08:46:22 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39a5gp8dtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Jun 2021 08:46:21 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15KCcJTD026202;
 Sun, 20 Jun 2021 12:46:20 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 3998790j88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Jun 2021 12:46:20 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15KCkKDV34865456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 20 Jun 2021 12:46:20 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3075BB2064;
 Sun, 20 Jun 2021 12:46:20 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2631B205F;
 Sun, 20 Jun 2021 12:46:19 +0000 (GMT)
Received: from mww0311.wdc07m.mail.ibm.com (unknown [9.208.64.46])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Sun, 20 Jun 2021 12:46:19 +0000 (GMT)
In-Reply-To: <CAOi1vP8JJiupdBCQsfN=KK8j1Q2Bnu059vXS0a1M53QsgY+OFQ@mail.gmail.com>
From: "Or Ozeri" <ORO@il.ibm.com>
To: Ilya Dryomov <idryomov@gmail.com>
Date: Sun, 20 Jun 2021 12:46:13 +0000
Message-ID: <OF104797DC.6AE60576-ON002586FA.00462648-002586FA.0046264B@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CAOi1vP8JJiupdBCQsfN=KK8j1Q2Bnu059vXS0a1M53QsgY+OFQ@mail.gmail.com>,
 <20210617160520.3694358-1-oro@il.ibm.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF88   April 28, 2021
X-MIMETrack: Serialize by http on MWW0311/01/M/IBM at 06/20/2021 12:46:13,
 Serialize complete at 06/20/2021 12:46:13
X-Disclaimed: 63403
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PYmU2dN-R9D2rfja-oPJDk5bIQmXZ1il
X-Proofpoint-ORIG-GUID: sr1uHSpCpfLJNJoLEa3Iscf99g-YcIuT
Subject: RE: [PATCH] block/rbd: Add support for rbd image encryption
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-20_04:2021-06-20,
 2021-06-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106200089
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ORO@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Mykola Golub <to.my.trociny@gmail.com>,
 Danny Harnik <DANNYH@il.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">Thanks for your review!<div><br></div><div>Regarding the last point:=
</div><div>I currently don't have any plans for adding new luks2-only optio=
ns, but they do exist. See in cryptsetup, for example the sector size which=
 is configurable in luks2 only.</div><div>In the librbd API we followed the=
 same spirit and split luks1 and luks2 option structs.</div><div>Same goes =
for passphrase (or "key-secret", as it called in qemu). In cryptsetup this =
is sort-of optional (there are other ways to authenticate othar than a pass=
phrase, like a keyfile or a token).</div><div><br><div><font color=3D"#9900=
99">-----Ilya Dryomov &lt;<a href=3D"mailto:idryomov@gmail.com" target=3D"=
=5Fblank" rel=3D"noopener noreferrer">idryomov@gmail.com</a>&gt; wrote: ---=
--</font></div><div class=3D"iNotesHistory" style=3D"padding-left:5px;"><di=
v style=3D"padding-right:0px;padding-left:5px;border-left:solid black 2px;"=
>To: Or Ozeri &lt;<a href=3D"mailto:oro@il.ibm.com" target=3D"=5Fblank" rel=
=3D"noopener noreferrer">oro@il.ibm.com</a>&gt;<br>From: Ilya Dryomov &lt;<=
a href=3D"mailto:idryomov@gmail.com" target=3D"=5Fblank" rel=3D"noopener no=
referrer">idryomov@gmail.com</a>&gt;<br>Date: 06/19/2021 10:44PM<br>Cc: <a =
href=3D"mailto:qemu-devel@nongnu.org" target=3D"=5Fblank" rel=3D"noopener n=
oreferrer">qemu-devel@nongnu.org</a>, <a href=3D"mailto:qemu-block@nongnu.o=
rg" target=3D"=5Fblank" rel=3D"noopener noreferrer">qemu-block@nongnu.org</=
a>, <a href=3D"mailto:kwolf@redhat.com" target=3D"=5Fblank" rel=3D"noopener=
 noreferrer">kwolf@redhat.com</a>, Mykola Golub &lt;<a href=3D"mailto:to.my=
.trociny@gmail.com" target=3D"=5Fblank" rel=3D"noopener noreferrer">to.my.t=
rociny@gmail.com</a>&gt;, Danny Harnik &lt;<a href=3D"mailto:dannyh@il.ibm.=
com" target=3D"=5Fblank" rel=3D"noopener noreferrer">dannyh@il.ibm.com</a>&=
gt;, <a href=3D"mailto:berrange@redhat.com" target=3D"=5Fblank" rel=3D"noop=
ener noreferrer">berrange@redhat.com</a><br>Subject: [EXTERNAL] Re: [PATCH]=
 block/rbd: Add support for rbd image encryption<br><br><div><font face=3D"=
Courier New,Courier,monospace" size=3D"2">On Thu, Jun 17, 2021 at 6:05 PM O=
r Ozeri &lt;<a href=3D"mailto:oro@il.ibm.com" target=3D"=5Fblank" rel=3D"no=
opener noreferrer">oro@il.ibm.com</a>&gt; wrote:<br>&gt;<br>&gt; Starting f=
rom ceph Pacific, RBD has built-in support for image-level encryption.<br>&=
gt; Currently supported formats are LUKS version 1 and 2.<br>&gt;<br>&gt; T=
here are 2 new relevant librbd APIs for controlling encryption, both expect=
 an<br>&gt; open image context:<br>&gt;<br>&gt; rbd=5Fencryption=5Fformat: =
formats an image (i.e. writes the LUKS header)<br>&gt; rbd=5Fencryption=5Fl=
oad: loads encryptor/decryptor to the image IO stack<br>&gt;<br>&gt; This c=
ommit extends the qemu rbd driver API to support the above.<br>&gt;<br>&gt;=
 Signed-off-by: Or Ozeri &lt;<a href=3D"mailto:oro@il.ibm.com" target=3D"=
=5Fblank" rel=3D"noopener noreferrer">oro@il.ibm.com</a>&gt;<br>&gt; ---<br=
>&gt; &nbsp;block/raw-format.c &nbsp; | &nbsp; 7 +<br>&gt; &nbsp;block/rbd.=
c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 371 +++++++++++++++++++++++++++++++++=
+++++++++-<br>&gt; &nbsp;qapi/block-core.json | 110 ++++++++++++-<br>&gt; &=
nbsp;3 files changed, 482 insertions(+), 6 deletions(-)<br>&gt;<br>&gt; dif=
f --git a/block/raw-format.c b/block/raw-format.c<br>&gt; index 7717578ed6.=
.f6e70e2356 100644<br>&gt; --- a/block/raw-format.c<br>&gt; +++ b/block/raw=
-format.c<br>&gt; @@ -369,6 +369,12 @@ static int raw=5Fget=5Finfo(BlockDri=
verState *bs, BlockDriverInfo *bdi)<br>&gt; &nbsp; &nbsp; &nbsp;return bdrv=
=5Fget=5Finfo(bs-&gt;file-&gt;bs, bdi);<br>&gt; &nbsp;}<br>&gt;<br>&gt; +st=
atic ImageInfoSpecific *raw=5Fget=5Fspecific=5Finfo(BlockDriverState *bs,<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;Error **errp)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;r=
eturn bdrv=5Fget=5Fspecific=5Finfo(bs-&gt;file-&gt;bs, errp);<br>&gt; +}<br=
>&gt; +<br>&gt; &nbsp;static void raw=5Frefresh=5Flimits(BlockDriverState *=
bs, Error **errp)<br>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp; &nbsp;if (bs-&gt;pr=
obed) {<br>&gt; @@ -603,6 +609,7 @@ BlockDriver bdrv=5Fraw =3D {<br>&gt; &n=
bsp; &nbsp; &nbsp;.has=5Fvariable=5Flength &nbsp;=3D true,<br>&gt; &nbsp; &=
nbsp; &nbsp;.bdrv=5Fmeasure &nbsp; &nbsp; &nbsp; &nbsp; =3D &amp;raw=5Fmeas=
ure,<br>&gt; &nbsp; &nbsp; &nbsp;.bdrv=5Fget=5Finfo &nbsp; &nbsp; &nbsp; &n=
bsp;=3D &amp;raw=5Fget=5Finfo,<br>&gt; + &nbsp; &nbsp;.bdrv=5Fget=5Fspecifi=
c=5Finfo =3D &amp;raw=5Fget=5Fspecific=5Finfo,<br><br>Hi Or,<br><br>This fe=
els a bit contentious to me.<br><br>AFAIU ImageInfoSpecific is for format-s=
pecfic information. &nbsp;"raw"<br>is a format and passing the request down=
 the stack this way results<br>in a somewhat confusing output such as<br><b=
r>&nbsp;&nbsp; &nbsp;$ qemu-img info rbd:foo/bar<br>&nbsp;&nbsp; &nbsp;imag=
e: json:{"driver": "raw", "file": {"pool": "foo", "image":<br>"bar", "drive=
r": "rbd", "namespace": ""}}<br>&nbsp;&nbsp; &nbsp;file format: raw<br>&nbs=
p;&nbsp; &nbsp;...<br>&nbsp;&nbsp; &nbsp;Format specific information:<br>&n=
bsp;&nbsp; &nbsp; &nbsp; &lt;information for rbd format&gt;<br><br>I think =
this should be broken out into its own patch and get separate<br>acks.<br><=
br>&gt; &nbsp; &nbsp; &nbsp;.bdrv=5Frefresh=5Flimits &nbsp;=3D &amp;raw=5Fr=
efresh=5Flimits,<br>&gt; &nbsp; &nbsp; &nbsp;.bdrv=5Fprobe=5Fblocksizes =3D=
 &amp;raw=5Fprobe=5Fblocksizes,<br>&gt; &nbsp; &nbsp; &nbsp;.bdrv=5Fprobe=
=5Fgeometry &nbsp;=3D &amp;raw=5Fprobe=5Fgeometry,<br>&gt; diff --git a/blo=
ck/rbd.c b/block/rbd.c<br>&gt; index f098a89c7b..183b17cd84 100644<br>&gt; =
--- a/block/rbd.c<br>&gt; +++ b/block/rbd.c<br>&gt; @@ -73,6 +73,18 @@<br>&=
gt; &nbsp;#define LIBRBD=5FUSE=5FIOVEC 0<br>&gt; &nbsp;#endif<br>&gt;<br>&g=
t; +#define RBD=5FENCRYPTION=5FLUKS=5FHEADER=5FVERIFICATION=5FLEN 8<br>&gt;=
 +<br>&gt; +static const char rbd=5Fluks=5Fheader=5Fverification[<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp;RBD=5FENCRYPTION=5FLUKS=5FHEADER=5FVERIFICATION=
=5FLEN] =3D {<br>&gt; + &nbsp; &nbsp;'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 1<b=
r>&gt; +};<br>&gt; +<br>&gt; +static const char rbd=5Fluks2=5Fheader=5Fveri=
fication[<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;RBD=5FENCRYPTION=5FLUKS=5FHE=
ADER=5FVERIFICATION=5FLEN] =3D {<br>&gt; + &nbsp; &nbsp;'L', 'U', 'K', 'S',=
 0xBA, 0xBE, 0, 2<br>&gt; +};<br>&gt; +<br>&gt; &nbsp;typedef enum {<br>&gt=
; &nbsp; &nbsp; &nbsp;RBD=5FAIO=5FREAD,<br>&gt; &nbsp; &nbsp; &nbsp;RBD=5FA=
IO=5FWRITE,<br>&gt; @@ -341,6 +353,206 @@ static void qemu=5Frbd=5Fmemset(R=
ADOSCB *rcb, int64=5Ft offs)<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;}<=
br>&gt;<br>&gt; +#ifdef LIBRBD=5FSUPPORTS=5FENCRYPTION<br>&gt; +static int =
qemu=5Frbd=5Fconvert=5Fluks=5Foptions(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
;RbdEncryptionOptionsLUKSBase *luks=5Fopts,<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp;char **passphrase,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;Error **errp)=
<br>&gt; +{<br>&gt; + &nbsp; &nbsp;int r =3D 0;<br>&gt; +<br>&gt; + &nbsp; =
&nbsp;if (!luks=5Fopts-&gt;has=5Fkey=5Fsecret) {<br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp;r =3D -EINVAL;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=
=5Ferrno(errp, -r, "missing encrypt.key-secret");<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp;return r;<br>&gt; + &nbsp; &nbsp;}<br><br>Why is key-secret opt=
ional?<br><br>&gt; +<br>&gt; + &nbsp; &nbsp;*passphrase =3D qcrypto=5Fsecre=
t=5Flookup=5Fas=5Futf8(luks=5Fopts-&gt;key=5Fsecret, errp);<br>&gt; + &nbsp=
; &nbsp;if (!*passphrase) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return -EI=
O;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;return 0;<br>&=
gt; +}<br>&gt; +<br>&gt; +static int qemu=5Frbd=5Fconvert=5Fluks=5Fcreate=
=5Foptions(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;RbdEncryptionCreateOptions=
LUKSBase *luks=5Fopts,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;rbd=5Fencryptio=
n=5Falgorithm=5Ft *alg,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;char **passphr=
ase,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;Error **errp)<br>&gt; +{<br>&gt; =
+ &nbsp; &nbsp;int r =3D 0;<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D qemu=5Fr=
bd=5Fconvert=5Fluks=5Foptions(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;qapi=5FRbdEncryptionCreateOptionsLUKSBase=5Fbase(luks=5Fopts),<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;passphrase, errp);<br>&gt; + =
&nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return r;=
<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (luks=5Fopts-=
&gt;has=5Fcipher=5Falg) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;switch (luks=
=5Fopts-&gt;cipher=5Falg) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;case QCRYPTO=5FCIPHER=5FALG=5FAES=5F128: {<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*alg =3D RBD=5FENCRYPTION=5FALGORITHM=
=5FAES128;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;break;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case QCRYPTO=5FCIPHER=5FALG=5FAES=5F25=
6: {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*alg =
=3D RBD=5FENCRYPTION=5FALGORITHM=5FAES256;<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;defaul=
t: {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D=
 -ENOTSUP;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;error=5Fsetg=5Ferrno(errp, -r, "unknown encryption algorithm: %u",<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; luks=5Fopts-&gt;cipher=5Falg);<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;} else {<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp;/* default alg */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;*alg =3D RBD=
=5FENCRYPTION=5FALGORITHM=5FAES256;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&=
gt; + &nbsp; &nbsp;return 0;<br>&gt; +}<br>&gt; +<br>&gt; +static int qemu=
=5Frbd=5Fencryption=5Fformat(rbd=5Fimage=5Ft image,<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;RbdEncryptionCreateOptions *enc=
rypt,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Er=
ror **errp)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;int r =3D 0;<br>&gt; + &nbsp;=
 &nbsp;g=5Fautofree char *passphrase =3D NULL;<br>&gt; + &nbsp; &nbsp;g=5Fa=
utofree rbd=5Fencryption=5Foptions=5Ft opts =3D NULL;<br>&gt; + &nbsp; &nbs=
p;rbd=5Fencryption=5Fformat=5Ft format;<br>&gt; + &nbsp; &nbsp;rbd=5Fimage=
=5Finfo=5Ft info;<br>&gt; + &nbsp; &nbsp;size=5Ft opts=5Fsize;<br>&gt; + &n=
bsp; &nbsp;uint64=5Ft raw=5Fsize;<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D rb=
d=5Fstat(image, &amp;info, sizeof(info));<br>&gt; + &nbsp; &nbsp;if (r &lt;=
 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r, "=
cannot get raw image size");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return r;=
<br>&gt; + &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;raw=5Fsize =3D info.size;<=
br><br>Using rbd=5Fget=5Fsize() to put size directly into raw=5Fsize would =
be<br>neater and avoid rbd=5Fimage=5Finfo=5Ft.<br><br>&gt; +<br>&gt; + &nbs=
p; &nbsp;switch (encrypt-&gt;format) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
;case RBD=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS: {<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;rbd=5Fencryption=5Fluks1=5Fformat=5Foptions=5Ft *=
luks=5Fopts =3D<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;g=5Fnew0(rbd=5Fencryption=5Fluks1=5Fformat=5Foptions=5F=
t, 1);<br><br>Why is this dynamically allocated? &nbsp;It doesn't matter th=
at much, but<br>would rbd=5Fencryption=5Fluks1=5Fformat=5Foptions=5Ft on th=
e stack not work?<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fo=
rmat =3D RBD=5FENCRYPTION=5FFORMAT=5FLUKS1;<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;opts =3D luks=5Fopts;<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;opts=5Fsize =3D sizeof(rbd=5Fencryption=5Fluks1=5Fformat=
=5Foptions=5Ft);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D q=
emu=5Frbd=5Fconvert=5Fluks=5Fcreate=5Foptions(<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qapi=5FRbdEncryptionCrea=
teOptionsLUKS=5Fbase(&amp;encrypt-&gt;u.luks),<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;luks=5Fopts-&gt;alg=
, &amp;passphrase, errp);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;luks=5Fopts-&gt;passphrase =3D passphrase;<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;luks=5Fopts-&gt;passphrase=5Fsize =3D strlen(passphras=
e);<br><br>r needs to be checked before strlen() is called, as passphrase<b=
r>would be NULL on error.<br><br>More importantly, what about randomly-gene=
rated (i.e. binary)<br>passphrases? &nbsp;I think qemu=5Frbd=5Fconvert=5Flu=
ks=5Foptions() should be<br>switched to qcrypto=5Fsecret=5Flookup() to cove=
r this case. &nbsp;Then<br>this strlen() would go away entirely.<br><br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;case RBD=5FIMAGE=5FENC=
RYPTION=5FFORMAT=5FLUKS2: {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;rbd=5Fencryption=5Fluks2=5Fformat=5Foptions=5Ft *luks2=5Fopts =3D<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g=
=5Fnew0(rbd=5Fencryption=5Fluks2=5Fformat=5Foptions=5Ft, 1);<br><br>Same he=
re.<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;format =3D RBD=
=5FENCRYPTION=5FFORMAT=5FLUKS2;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;opts =3D luks2=5Fopts;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;opts=5Fsize =3D sizeof(rbd=5Fencryption=5Fluks2=5Fformat=5Foptions=
=5Ft);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D qemu=5Frbd=
=5Fconvert=5Fluks=5Fcreate=5Foptions(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qapi=5FRbdEncryptionCreateOptions=
LUKS2=5Fbase(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;encrypt-&gt;u.luks2),<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;&amp;luks2=5Fopts-&gt;alg, &amp;passphrase, errp);<br>&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;luks2=5Fopts-&gt;passphrase =3D passphrase;<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;luks2=5Fopts-&gt;passphras=
e=5Fsize =3D strlen(passphrase);<br><br>And here.<br><br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;default: {<br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;r =3D -ENOTSUP;<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;errp, -r, "unknown image encrypt=
ion format: %u",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;encrypt-&gt;format);<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp;}<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; =
0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; + &nbsp; &nbsp;=
}<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D rbd=5Fencryption=5Fformat(image, f=
ormat, opts, opts=5Fsize);<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r, "encryption form=
at fail");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; + &nbsp; =
&nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D rbd=5Fstat(image, &amp;info,=
 sizeof(info));<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r, "cannot get effective image=
 size");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; + &nbsp; &n=
bsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D rbd=5Fresize(image, raw=5Fsize=
 + (raw=5Fsize - info.size));<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r, "cannot resiz=
e image after format");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&=
gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;return 0;<br>&gt; +}<=
br>&gt; +<br>&gt; +static int qemu=5Frbd=5Fencryption=5Fload(rbd=5Fimage=5F=
t image,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;RbdEncryptionOptions *encrypt,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;Error **errp)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;int=
 r =3D 0;<br>&gt; + &nbsp; &nbsp;g=5Fautofree char *passphrase =3D NULL;<br=
>&gt; + &nbsp; &nbsp;g=5Fautofree rbd=5Fencryption=5Foptions=5Ft opts =3D N=
ULL;<br>&gt; + &nbsp; &nbsp;rbd=5Fencryption=5Fformat=5Ft format;<br>&gt; +=
 &nbsp; &nbsp;size=5Ft opts=5Fsize;<br>&gt; +<br>&gt; + &nbsp; &nbsp;switch=
 (encrypt-&gt;format) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;case RBD=5FIMA=
GE=5FENCRYPTION=5FFORMAT=5FLUKS: {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;rbd=5Fencryption=5Fluks1=5Fformat=5Foptions=5Ft *luks=5Fopts =3D=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;g=5Fnew0(rbd=5Fencryption=5Fluks1=5Fformat=5Foptions=5Ft, 1);<br>&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;format =3D RBD=5FENCRYPTION=5FFO=
RMAT=5FLUKS1;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;opts =3D l=
uks=5Fopts;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;opts=5Fsize =
=3D sizeof(rbd=5Fencryption=5Fluks1=5Fformat=5Foptions=5Ft);<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D qemu=5Frbd=5Fconvert=5Fluks=5Fop=
tions(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;qapi=5FRbdEncryptionOptionsLUKS=5Fbase(&amp;encrypt-&gt;u.luks),=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;&amp;passphrase, errp);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;luks=5Fopts-&gt;passphrase =3D passphrase;<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;luks=5Fopts-&gt;passphrase=5Fsize =3D strlen(passph=
rase);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;case RBD=
=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS2: {<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;rbd=5Fencryption=5Fluks2=5Fformat=5Foptions=5Ft *luks2=5F=
opts =3D<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;g=5Fnew0(rbd=5Fencryption=5Fluks2=5Fformat=5Foptions=5Ft, 1);<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;format =3D RBD=5FENCRYPT=
ION=5FFORMAT=5FLUKS2;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;op=
ts =3D luks2=5Fopts;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;opt=
s=5Fsize =3D sizeof(rbd=5Fencryption=5Fluks2=5Fformat=5Foptions=5Ft);<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D qemu=5Frbd=5Fconvert=5F=
luks=5Foptions(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;qapi=5FRbdEncryptionOptionsLUKS2=5Fbase(&amp;encrypt-&g=
t;u.luks2),<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;&amp;passphrase, errp);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;luks2=5Fopts-&gt;passphrase =3D passphrase;<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;luks2=5Fopts-&gt;passphrase=5Fsize =3D =
strlen(passphrase);<br><br>Same as in qemu=5Frbd=5Fencryption=5Fformat().<b=
r><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;default: {<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D -ENOTSUP;<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;errp, -r=
, "unknown image encryption format: %u",<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;encrypt-&gt;format);<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + =
&nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return r;=
<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D rbd=5Fencr=
yption=5Fload(image, format, opts, opts=5Fsize);<br>&gt; + &nbsp; &nbsp;if =
(r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp=
, -r, "encryption load fail");<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; +=
 &nbsp; &nbsp;return r;<br>&gt; +}<br>&gt; +#endif<br>&gt; +<br>&gt; &nbsp;=
/* FIXME Deprecate and remove keypairs or make it available in QMP. */<br>&=
gt; &nbsp;static int qemu=5Frbd=5Fdo=5Fcreate(BlockdevCreateOptions *option=
s,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const char *keypairs, const =
char *password=5Fsecret,<br>&gt; @@ -358,6 +570,13 @@ static int qemu=5Frbd=
=5Fdo=5Fcreate(BlockdevCreateOptions *options,<br>&gt; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;return -EINVAL;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt;<br>&gt;=
 +#ifndef LIBRBD=5FSUPPORTS=5FENCRYPTION<br>&gt; + &nbsp; &nbsp;if (opts-&g=
t;location-&gt;has=5Fencrypt) {<br><br>Here opts-&gt;location-&gt;encrypt i=
s being checked<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg(errp,=
 "RBD library does not support image encryption");<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp;return -ENOTSUP;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +#endif<br>&=
gt; +<br>&gt; &nbsp; &nbsp; &nbsp;if (opts-&gt;has=5Fcluster=5Fsize) {<br>&=
gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int64=5Ft objsize =3D opts-&gt;cluste=
r=5Fsize;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ((objsize - 1) &amp;=
 objsize) { &nbsp; &nbsp;/* not a power of 2? */<br>&gt; @@ -383,6 +602,27 =
@@ static int qemu=5Frbd=5Fdo=5Fcreate(BlockdevCreateOptions *options,<br>&=
gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out;<br>&gt; &nbsp; &nbsp; &nbsp=
;}<br>&gt;<br>&gt; +#ifdef LIBRBD=5FSUPPORTS=5FENCRYPTION<br>&gt; + &nbsp; =
&nbsp;if (opts-&gt;has=5Fencrypt) {<br><br>... but opts-&gt;encrypt is bein=
g acted on. &nbsp;A request to create an<br>encrypted image with an old lib=
rbd would not be failed.<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;rbd=5Fima=
ge=5Ft image;<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ret =3D rbd=5F=
open(io=5Fctx, opts-&gt;location-&gt;image, &amp;image, NULL);<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;if (ret &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -ret, "error reading header f=
rom %s",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; opts-&gt;location-&gt;image);<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out;<br>&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ret =
=3D qemu=5Frbd=5Fencryption=5Fformat(image, opts-&gt;encrypt, errp);<br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp;rbd=5Fclose(image);<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp;if (ret &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;/* encryption format fail, try removing the image */<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rbd=5Fremove(io=5Fctx, opts-&gt;locatio=
n-&gt;image);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out;<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;}<br>&gt; +#e=
ndif<br>&gt; +<br>&gt; &nbsp; &nbsp; &nbsp;ret =3D 0;<br>&gt; &nbsp;out:<br=
>&gt; &nbsp; &nbsp; &nbsp;rados=5Fioctx=5Fdestroy(io=5Fctx);<br>&gt; @@ -39=
5,6 +635,43 @@ static int qemu=5Frbd=5Fco=5Fcreate(BlockdevCreateOptions *o=
ptions, Error **errp)<br>&gt; &nbsp; &nbsp; &nbsp;return qemu=5Frbd=5Fdo=5F=
create(options, NULL, NULL, errp);<br>&gt; &nbsp;}<br>&gt;<br>&gt; +static =
int qemu=5Frbd=5Fextract=5Fencryption=5Fcreate=5Foptions(<br>&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp;QemuOpts *opts,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;Rb=
dEncryptionCreateOptions **spec,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;Error=
 **errp)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;QDict *opts=5Fqdict;<br>&gt; + &=
nbsp; &nbsp;QDict *encrypt=5Fqdict;<br>&gt; + &nbsp; &nbsp;Visitor *v;<br>&=
gt; + &nbsp; &nbsp;int ret =3D 0;<br>&gt; +<br>&gt; + &nbsp; &nbsp;opts=5Fq=
dict =3D qemu=5Fopts=5Fto=5Fqdict(opts, NULL);<br>&gt; + &nbsp; &nbsp;qdict=
=5Fextract=5Fsubqdict(opts=5Fqdict, &amp;encrypt=5Fqdict, "encrypt.");<br>&=
gt; + &nbsp; &nbsp;qobject=5Funref(opts=5Fqdict);<br>&gt; + &nbsp; &nbsp;if=
 (!qdict=5Fsize(encrypt=5Fqdict)) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;*s=
pec =3D NULL;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto exit;<br>&gt; + &nb=
sp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;/* Convert options into a QAPI=
 object */<br>&gt; + &nbsp; &nbsp;v =3D qobject=5Finput=5Fvisitor=5Fnew=5Ff=
lat=5Fconfused(encrypt=5Fqdict, errp);<br>&gt; + &nbsp; &nbsp;if (!v) {<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ret =3D -EINVAL;<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp;goto exit;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp;=
 &nbsp;visit=5Ftype=5FRbdEncryptionCreateOptions(v, NULL, spec, errp);<br>&=
gt; + &nbsp; &nbsp;visit=5Ffree(v);<br>&gt; + &nbsp; &nbsp;if (!*spec) {<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ret =3D -EINVAL;<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;goto exit;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; +exit:<=
br>&gt; + &nbsp; &nbsp;qobject=5Funref(encrypt=5Fqdict);<br>&gt; + &nbsp; &=
nbsp;return ret;<br>&gt; +}<br>&gt; +<br>&gt; &nbsp;static int coroutine=5F=
fn qemu=5Frbd=5Fco=5Fcreate=5Fopts(BlockDriver *drv,<br>&gt; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;const char *filename,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;QemuOpts *o=
pts,<br>&gt; @@ -403,6 +680,7 @@ static int coroutine=5Ffn qemu=5Frbd=5Fco=
=5Fcreate=5Fopts(BlockDriver *drv,<br>&gt; &nbsp; &nbsp; &nbsp;BlockdevCrea=
teOptions *create=5Foptions;<br>&gt; &nbsp; &nbsp; &nbsp;BlockdevCreateOpti=
onsRbd *rbd=5Fopts;<br>&gt; &nbsp; &nbsp; &nbsp;BlockdevOptionsRbd *loc;<br=
>&gt; + &nbsp; &nbsp;RbdEncryptionCreateOptions *encrypt =3D NULL;<br>&gt; =
&nbsp; &nbsp; &nbsp;Error *local=5Ferr =3D NULL;<br>&gt; &nbsp; &nbsp; &nbs=
p;const char *keypairs, *password=5Fsecret;<br>&gt; &nbsp; &nbsp; &nbsp;QDi=
ct *options =3D NULL;<br>&gt; @@ -431,6 +709,13 @@ static int coroutine=5Ff=
n qemu=5Frbd=5Fco=5Fcreate=5Fopts(BlockDriver *drv,<br>&gt; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;goto exit;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt;<br>&gt;=
 + &nbsp; &nbsp;ret =3D qemu=5Frbd=5Fextract=5Fencryption=5Fcreate=5Foption=
s(opts, &amp;encrypt, errp);<br>&gt; + &nbsp; &nbsp;if (ret &lt; 0) {<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp;goto exit;<br>&gt; + &nbsp; &nbsp;}<br>&gt;=
 + &nbsp; &nbsp;rbd=5Fopts-&gt;encrypt &nbsp; &nbsp; =3D encrypt;<br>&gt; +=
 &nbsp; &nbsp;rbd=5Fopts-&gt;has=5Fencrypt =3D !!encrypt;<br>&gt; +<br>&gt;=
 &nbsp; &nbsp; &nbsp;/*<br>&gt; &nbsp; &nbsp; &nbsp; * Caution: while qdict=
=5Fget=5Ftry=5Fstr() is fine, getting non-string<br>&gt; &nbsp; &nbsp; &nbs=
p; * types would require more care. &nbsp;When @options come from -blockdev=
<br>&gt; @@ -756,12 +1041,25 @@ static int qemu=5Frbd=5Fopen(BlockDriverSta=
te *bs, QDict *options, int flags,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;goto failed=5Fopen;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt;<br>&gt; + &nbsp=
; &nbsp;if (opts-&gt;has=5Fencrypt) {<br>&gt; +#ifdef LIBRBD=5FSUPPORTS=5FE=
NCRYPTION<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =3D qemu=5Frbd=5Fencryptio=
n=5Fload(s-&gt;image, opts-&gt;encrypt, errp);<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;goto failed=5Fpost=5Fopen;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; =
+#else<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =3D -ENOTSUP;<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r,<br>&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "RB=
D library does not support image encryption");<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;goto failed=5Fpost=5Fopen;<br>&gt; +#endif<br>&gt; + &nbsp; &nbsp;=
}<br>&gt; +<br>&gt; &nbsp; &nbsp; &nbsp;r =3D rbd=5Fget=5Fsize(s-&gt;image,=
 &amp;s-&gt;image=5Fsize);<br>&gt; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&=
gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r, "error=
 getting image size from %s",<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; s-&gt;image=5Fname);<=
br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;rbd=5Fclose(s-&gt;image);<br>&gt; - &n=
bsp; &nbsp; &nbsp; &nbsp;goto failed=5Fopen;<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp;goto failed=5Fpost=5Fopen;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt;<br>=
&gt; &nbsp; &nbsp; &nbsp;/* If we are using an rbd snapshot, we must be r/o=
, otherwise<br>&gt; @@ -769,8 +1067,7 @@ static int qemu=5Frbd=5Fopen(Block=
DriverState *bs, QDict *options, int flags,<br>&gt; &nbsp; &nbsp; &nbsp;if =
(s-&gt;snap !=3D NULL) {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D bd=
rv=5Fapply=5Fauto=5Fread=5Fonly(bs, "rbd snapshots are read-only", errp);<b=
r>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; - &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rbd=5Fclose(s-&gt;image);<br>&gt; - &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto failed=5Fopen;<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;goto failed=5Fpost=5Fopen;<br>&gt; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt;<br>&gt; @@=
 -780,6 +1077,8 @@ static int qemu=5Frbd=5Fopen(BlockDriverState *bs, QDict=
 *options, int flags,<br>&gt; &nbsp; &nbsp; &nbsp;r =3D 0;<br>&gt; &nbsp; &=
nbsp; &nbsp;goto out;<br>&gt;<br>&gt; +failed=5Fpost=5Fopen:<br>&gt; + &nbs=
p; &nbsp;rbd=5Fclose(s-&gt;image);<br>&gt; &nbsp;failed=5Fopen:<br>&gt; &nb=
sp; &nbsp; &nbsp;rados=5Fioctx=5Fdestroy(s-&gt;io=5Fctx);<br>&gt; &nbsp; &n=
bsp; &nbsp;g=5Ffree(s-&gt;snap);<br>&gt; @@ -1050,6 +1349,53 @@ static int =
qemu=5Frbd=5Fgetinfo(BlockDriverState *bs, BlockDriverInfo *bdi)<br>&gt; &n=
bsp; &nbsp; &nbsp;return 0;<br>&gt; &nbsp;}<br>&gt;<br>&gt; +static ImageIn=
foSpecific *qemu=5Frbd=5Fget=5Fspecific=5Finfo(BlockDriverState *bs,<br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Error **errp)<br>&gt; +{<br>&gt; + &nbs=
p; &nbsp;BDRVRBDState *s =3D bs-&gt;opaque;<br>&gt; + &nbsp; &nbsp;ImageInf=
oSpecific *spec=5Finfo;<br>&gt; + &nbsp; &nbsp;rbd=5Fimage=5Finfo=5Ft info;=
<br>&gt; + &nbsp; &nbsp;char buf[RBD=5FENCRYPTION=5FLUKS=5FHEADER=5FVERIFIC=
ATION=5FLEN] =3D {0};<br>&gt; + &nbsp; &nbsp;int r;<br>&gt; +<br>&gt; + &nb=
sp; &nbsp;r =3D rbd=5Fstat(s-&gt;image, &amp;info, sizeof(info));<br><br>Di=
tto -- rbd=5Fget=5Fsize().<br><br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r, "cannot get =
image size");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return NULL;<br>&gt; + &=
nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (info.size &gt;=3D RBD=5F=
ENCRYPTION=5FLUKS=5FHEADER=5FVERIFICATION=5FLEN) {<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp;r =3D rbd=5Fread(s-&gt;image, 0,<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RBD=5FENCRYPTION=5FLUKS=
=5FHEADER=5FVERIFICATION=5FLEN, buf) ;<br><br>Stray space before semicolon.=
<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r, "cannot re=
ad image start for probe");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;return NULL;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &n=
bsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;spec=5Finfo =3D g=5Fnew(ImageInfoSpe=
cific, 1);<br>&gt; + &nbsp; &nbsp;*spec=5Finfo =3D (ImageInfoSpecific){<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;.type &nbsp;=3D IMAGE=5FINFO=5FSPECIFIC=
=5FKIND=5FRBD,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;.u.rbd.data =3D g=5Fnew=
0(ImageInfoSpecificRbd, 1),<br>&gt; + &nbsp; &nbsp;};<br>&gt; +<br>&gt; + &=
nbsp; &nbsp;if (memcmp(buf, rbd=5Fluks=5Fheader=5Fverification,<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RBD=5FENCRYPTION=5FLUKS=5FH=
EADER=5FVERIFICATION=5FLEN) =3D=3D 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;spec=5Finfo-&gt;u.rbd.data-&gt;encryption=5Fformat =3D<br>&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;RBD=5FIMAGE=5FENCRYPTION=5FF=
ORMAT=5FLUKS;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;spec=5Finfo-&gt;u.rbd.da=
ta-&gt;has=5Fencryption=5Fformat =3D true;<br>&gt; + &nbsp; &nbsp;} else if=
 (memcmp(buf, rbd=5Fluks2=5Fheader=5Fverification,<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RBD=5FENCRYPTION=5FLUKS=5FHEADER=5FVERIF=
ICATION=5FLEN) =3D=3D 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;spec=5Finfo=
-&gt;u.rbd.data-&gt;encryption=5Fformat =3D<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;RBD=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS2=
;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;spec=5Finfo-&gt;u.rbd.data-&gt;has=
=5Fencryption=5Fformat =3D true;<br>&gt; + &nbsp; &nbsp;} else {<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp;spec=5Finfo-&gt;u.rbd.data-&gt;has=5Fencryption=
=5Fformat =3D false;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &n=
bsp;return spec=5Finfo;<br>&gt; +}<br>&gt; +<br>&gt; &nbsp;static int64=5Ft=
 qemu=5Frbd=5Fgetlength(BlockDriverState *bs)<br>&gt; &nbsp;{<br>&gt; &nbsp=
; &nbsp; &nbsp;BDRVRBDState *s =3D bs-&gt;opaque;<br>&gt; @@ -1243,6 +1589,=
22 @@ static QemuOptsList qemu=5Frbd=5Fcreate=5Fopts =3D {<br>&gt; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.type =3D QEMU=5FOPT=5FSTRING,<br>&=
gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.help =3D "ID of secret=
 providing the password",<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;.name =3D "encrypt.format",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;.type =3D QEMU=5FOPT=5FSTRING,<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;.help =3D "Encrypt the image, format choices: 'luks',=
 'luks2'",<br><br>I think it should be "luks1" and "luks2" to match rbd/lib=
rbd.h and<br>"rbd encryption format" command.<br><br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp;},<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;.name =3D "encrypt.cipher-alg",<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.type =3D QEMU=5FOPT=5FSTRING,<br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.help =3D "Name of encryption =
cipher algorithm"<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;" (allowed values: aes-128, aes-256)",<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp;},<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.name =3D "encrypt.key-secret",<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.type =3D QEMU=5FOPT=5FSTR=
ING,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.help =3D "ID of se=
cret providing LUKS passphrase",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;},<br=
><br>A question probably better suited for QEMU maintainers but just in<br>=
case you have already asked and clarified this matter...<br><br>There seem =
to be two image creation APIs: the old option-based thing<br>and the new QA=
PI-based x-blockdev-create command. &nbsp;This patch extends<br>both and im=
plements the old -&gt; new translation. &nbsp;Is this the right way<br>to d=
o it? &nbsp;Is the option-based interface supposed to be extended when<br>a=
dding new functionality?<br><br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ /*=
 end of list */ }<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;};<br>&gt; @@=
 -1272,6 +1634,7 @@ static BlockDriver bdrv=5Frbd =3D {<br>&gt; &nbsp; &nbs=
p; &nbsp;.bdrv=5Fco=5Fcreate=5Fopts &nbsp; &nbsp;=3D qemu=5Frbd=5Fco=5Fcrea=
te=5Fopts,<br>&gt; &nbsp; &nbsp; &nbsp;.bdrv=5Fhas=5Fzero=5Finit &nbsp; &nb=
sp; =3D bdrv=5Fhas=5Fzero=5Finit=5F1,<br>&gt; &nbsp; &nbsp; &nbsp;.bdrv=5Fg=
et=5Finfo &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D qemu=5Frbd=5Fgetinfo,<br>&g=
t; + &nbsp; &nbsp;.bdrv=5Fget=5Fspecific=5Finfo =3D qemu=5Frbd=5Fget=5Fspec=
ific=5Finfo,<br>&gt; &nbsp; &nbsp; &nbsp;.create=5Fopts &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;=3D &amp;qemu=5Frbd=5Fcreate=5Fopts,<br>&gt; &nbsp; &=
nbsp; &nbsp;.bdrv=5Fgetlength &nbsp; &nbsp; &nbsp; &nbsp; =3D qemu=5Frbd=5F=
getlength,<br>&gt; &nbsp; &nbsp; &nbsp;.bdrv=5Fco=5Ftruncate &nbsp; &nbsp; =
&nbsp; =3D qemu=5Frbd=5Fco=5Ftruncate,<br>&gt; diff --git a/qapi/block-core=
.json b/qapi/block-core.json<br>&gt; index 6d227924d0..60d2ff0d1a 100644<br=
>&gt; --- a/qapi/block-core.json<br>&gt; +++ b/qapi/block-core.json<br>&gt;=
 @@ -127,6 +127,18 @@<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;'extents': ['Image=
Info']<br>&gt; &nbsp; &nbsp;} }<br>&gt;<br>&gt; +##<br>&gt; +# @ImageInfoSp=
ecificRbd:<br>&gt; +#<br>&gt; +# @encryption-format: Image encryption forma=
t<br>&gt; +#<br>&gt; +# Since: 6.1<br>&gt; +##<br>&gt; +{ 'struct': 'ImageI=
nfoSpecificRbd',<br>&gt; + &nbsp;'data': {<br>&gt; + &nbsp; &nbsp; &nbsp;'*=
encryption-format': 'RbdImageEncryptionFormat'<br>&gt; + &nbsp;} }<br>&gt; =
+<br>&gt; &nbsp;##<br>&gt; &nbsp;# @ImageInfoSpecific:<br>&gt; &nbsp;#<br>&=
gt; @@ -141,7 +153,8 @@<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;# If we need to =
add block driver specific parameters for<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp=
;# LUKS in future, then we'll subclass QCryptoBlockInfoLUKS<br>&gt; &nbsp; =
&nbsp; &nbsp; &nbsp;# to define a ImageInfoSpecificLUKS<br>&gt; - &nbsp; &n=
bsp; &nbsp;'luks': 'QCryptoBlockInfoLUKS'<br>&gt; + &nbsp; &nbsp; &nbsp;'lu=
ks': 'QCryptoBlockInfoLUKS',<br>&gt; + &nbsp; &nbsp; &nbsp;'rbd': 'ImageInf=
oSpecificRbd'<br>&gt; &nbsp; &nbsp;} }<br>&gt;<br>&gt; &nbsp;##<br>&gt; @@ =
-3609,6 +3622,94 @@<br>&gt; &nbsp;{ 'enum': 'RbdAuthMode',<br>&gt; &nbsp; &=
nbsp;'data': [ 'cephx', 'none' ] }<br>&gt;<br>&gt; +##<br>&gt; +# @RbdImage=
EncryptionFormat:<br>&gt; +#<br>&gt; +# Since: 6.1<br>&gt; +##<br>&gt; +{ '=
enum': 'RbdImageEncryptionFormat',<br>&gt; + &nbsp;'data': [ 'luks', 'luks2=
' ] }<br><br>Ditto -- "luks1" and "luks2".<br><br>&gt; +<br>&gt; +##<br>&gt=
; +# @RbdEncryptionOptionsLUKSBase:<br>&gt; +#<br>&gt; +# @key-secret: ID o=
f a QCryptoSecret object providing a passphrase<br>&gt; +# &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;for unlocking the encryption<br>&gt; +#<br>=
&gt; +# Since: 6.1<br>&gt; +##<br>&gt; +{ 'struct': 'RbdEncryptionOptionsLU=
KSBase',<br>&gt; + &nbsp;'data': { '*key-secret': 'str' }}<br><br>When woul=
d we not need a passphrase? &nbsp;I think it should be required.<br><br>&gt=
; +<br>&gt; +##<br>&gt; +# @RbdEncryptionCreateOptionsLUKSBase:<br>&gt; +#<=
br>&gt; +# @cipher-alg: The encryption algorithm<br>&gt; +#<br>&gt; +# Sinc=
e: 6.1<br>&gt; +##<br>&gt; +{ 'struct': 'RbdEncryptionCreateOptionsLUKSBase=
',<br>&gt; + &nbsp;'base': 'RbdEncryptionOptionsLUKSBase',<br>&gt; + &nbsp;=
'data': { '*cipher-alg': 'QCryptoCipherAlgorithm'}}<br><br>Why QCryptoCiphe=
rAlgorithm instead of just enumerating the two<br>algorithms that librbd su=
pports? &nbsp;An early failure when parsing<br>seems better than failing in=
 qemu=5Frbd=5Fconvert=5Fluks=5Fcreate=5Foptions()<br>and having to clean up=
 the newly created image.<br><br>&gt; +<br>&gt; +##<br>&gt; +# @RbdEncrypti=
onOptionsLUKS:<br>&gt; +#<br>&gt; +# Since: 6.1<br>&gt; +##<br>&gt; +{ 'str=
uct': 'RbdEncryptionOptionsLUKS',<br>&gt; + &nbsp;'base': 'RbdEncryptionOpt=
ionsLUKSBase',<br>&gt; + &nbsp;'data': {}}<br>&gt; +<br>&gt; +##<br>&gt; +#=
 @RbdEncryptionOptionsLUKS2:<br>&gt; +#<br>&gt; +# Since: 6.1<br>&gt; +##<b=
r>&gt; +{ 'struct': 'RbdEncryptionOptionsLUKS2',<br>&gt; + &nbsp;'base': 'R=
bdEncryptionOptionsLUKSBase',<br>&gt; + &nbsp;'data': {}}<br>&gt; +<br>&gt;=
 +##<br>&gt; +# @RbdEncryptionCreateOptionsLUKS:<br>&gt; +#<br>&gt; +# Sinc=
e: 6.1<br>&gt; +##<br>&gt; +{ 'struct': 'RbdEncryptionCreateOptionsLUKS',<b=
r>&gt; + &nbsp;'base': 'RbdEncryptionCreateOptionsLUKSBase',<br>&gt; + &nbs=
p;'data': {}}<br>&gt; +<br>&gt; +##<br>&gt; +# @RbdEncryptionCreateOptionsL=
UKS2:<br>&gt; +#<br>&gt; +# Since: 6.1<br>&gt; +##<br>&gt; +{ 'struct': 'Rb=
dEncryptionCreateOptionsLUKS2',<br>&gt; + &nbsp;'base': 'RbdEncryptionCreat=
eOptionsLUKSBase',<br>&gt; + &nbsp;'data': {}}<br><br>This appears over-eng=
ineered to me. &nbsp;A three-deep hierarchy for<br>a structure with two fie=
lds (key-secret and cipher-alg) seems like<br>it could be simplified.<br><b=
r>Why differentiate between luks1 and luks2 if the fields are exactly<br>th=
e same? &nbsp;Do you expect one of these empty derived structures to be<br>=
extended in the future?<br><br>Thanks,<br><br>&nbsp;&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;Ilya<br><br></font></div></div></div></div>=
</font><BR>
<BR>

