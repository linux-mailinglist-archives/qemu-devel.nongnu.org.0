Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A024373EEC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:48:45 +0200 (CEST)
Received: from localhost ([::1]:46756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJlS-00035t-1K
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>) id 1leJVg-0002yY-DF
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:32:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>) id 1leJVZ-0005oZ-52
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:32:24 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145F3G3f139909
 for <qemu-devel@nongnu.org>; Wed, 5 May 2021 11:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=eqFESLcHh1iCZ+Lgp3SJpFIktm6PsCTl2ekp7UHcgRI=;
 b=RBa3ESHIZoR/d2/2KKAD9X7G5yXT4q1Yog5iVfkYfOL913cQzp8xdjlyJWY+GMyv+vpk
 GLV6jXaBDIDCtX0Q91HOnmSj8eqsSDREIje6PNMhVg3ZZOlruOQ4RMr8Wr0dOwBVV5K4
 TMiZM9e0nS8/tNNuPmrGbVf3YG7KJva0VfUTLtvod3S/w8QUdzepHn2w1Cl7tPUZK2NT
 CR3kShox8WHzbR0tC9+6QLdjr0vsnV3umjrLhADYJ+BeugEK+fAgQ0TEX0HnF0Hp4vJF
 OabhJC6212lMcQI525+4x9qdNK/OkvJEBpAQpsG/Ba1a+ktfajpL4Q2CEDYOPgmH9a3o zQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38bwcu1g3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:32:12 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <qemu-devel@nongnu.org> from <ORO@il.ibm.com>;
 Wed, 5 May 2021 15:32:12 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 5 May 2021 15:32:09 -0000
Received: from us1a3-mail134.a3.dal06.isc4sb.com ([10.146.45.171])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2021050515320914-449491 ;
 Wed, 5 May 2021 15:32:09 +0000 
In-Reply-To: <YJFeV5YwdBRywKAX@redhat.com>
From: "Or Ozeri" <ORO@il.ibm.com>
To: "=?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?=" <berrange@redhat.com>
Date: Wed, 5 May 2021 15:32:09 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <YJFeV5YwdBRywKAX@redhat.com>,
 <20210502073617.2978836-1-oro@il.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 38219
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
x-cbid: 21050515-3649-0000-0000-0000058350D2
X-IBM-SpamModules-Scores: BY=0.293256; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0; ST=0; TS=0; UL=0; ISC=; MB=0.198149
X-IBM-SpamModules-Versions: BY=3.00015144; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01543696; UDB=6.00825223; IPR=6.01310096; 
 MB=3.00036875; MTD=3.00000008; XFM=3.00000015; UTC=2021-05-05 15:32:10
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-22 13:42:56 - 6.00012377
x-cbparentid: 21050515-3650-0000-0000-0000D0415192
Message-Id: <OF12B3B285.56B21A39-ON002586CC.00555754-002586CC.0055575A@notes.na.collabserv.com>
X-Proofpoint-ORIG-GUID: gUi6jKTqOGxH-yxi2vjUc3cMd3OMjk5p
X-Proofpoint-GUID: gUi6jKTqOGxH-yxi2vjUc3cMd3OMjk5p
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 18 URL's were un-rewritten
MIME-Version: 1.0
Subject: RE: [PATCH] block/rbd: Add support for rbd image encryption
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_09:2021-05-05,
 2021-05-05 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ORO@il.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: kwolf@redhat.com, Danny
 Harnik <DANNYH@il.ibm.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 to.my.trociny@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

<font face=3D"Verdana,Arial,Helvetica,sans-serif" size=3D"2"><font face=3D"=
Verdana, Arial, Helvetica, sans-serif" size=3D"2">Thanks Daniel!</font><div=
><br></div><div>I prepared a modified patch addressing all of your suggesti=
ons (including resizing after formatting to increase the image size).</div>=
<div>The only thing I'm not sure about is your last point regarding reporti=
ng image is encrypted.<br></div><div><br></div><div>When I followed the flo=
w of "qemu-img info" on an "rbd:pool/image" I saw that this information is =
extracted from the root BlockDriverState.</div><div>In our case, the root B=
lockDriverState comes from:</div><div><br></div><div style=3D"font-family: =
arial, helvetica, sans-serif; font-size: 12.8px;"><div><font face=3D"Verdan=
a, Arial, Helvetica, sans-serif" size=3D"2">BlockDriver bdrv_raw =3D {</fon=
t></div><div><font face=3D"Verdana, Arial, Helvetica, sans-serif" size=3D"2=
">&nbsp; &nbsp; .format_name&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "raw",</=
font></div><div><font face=3D"Verdana, Arial, Helvetica, sans-serif" size=
=3D"2"><br></font></div><div><font face=3D"Verdana, Arial, Helvetica, sans-=
serif" size=3D"2">...</font></div><div><font face=3D"Verdana, Arial, Helvet=
ica, sans-serif" size=3D"2"><br></font></div><div><font face=3D"Verdana, Ar=
ial, Helvetica, sans-serif" size=3D"2">The RBD driver is a child of this ro=
ot raw driver.</font></div><div><font face=3D"Verdana, Arial, Helvetica, sa=
ns-serif" size=3D"2"><br></font></div><div><font face=3D"Verdana, Arial, He=
lvetica, sans-serif" size=3D"2">Given this situation, it is not clear to me=
 how can I set:</font></div><div><font face=3D"Verdana, Arial, Helvetica, s=
ans-serif" size=3D"2">bs-&gt;drv-&gt;format_name=3D"luks2", bs-&gt;encrypte=
d=3Dtrue<br></font></div><div><font face=3D"Verdana, Arial, Helvetica, sans=
-serif" size=3D"2">On the root BlockDriverState.</font></div><div><font fac=
e=3D"Verdana, Arial, Helvetica, sans-serif" size=3D"2"><br></font></div><di=
v><font face=3D"Verdana, Arial, Helvetica, sans-serif" size=3D"2">Any advic=
e?</font></div></div><br><font face=3D"Default Sans Serif,Verdana,Arial,Hel=
vetica,sans-serif" size=3D"2" color=3D"#000000"><font color=3D"#990099">---=
--"Daniel P. Berrang=C3=A9" &lt;<a href=3D"mailto:berrange@redhat.com" targ=
et=3D"_blank">berrange@redhat.com</a>&gt; wrote: -----</font><div class=3D"=
iNotesHistory" style=3D"padding-left:5px;"><div style=3D"padding-right:0px;=
padding-left:5px;border-left:solid black 2px;">To: Or Ozeri &lt;<a href=3D"=
mailto:oro@il.ibm.com" target=3D"_blank">oro@il.ibm.com</a>&gt;<br>From: "D=
aniel P. Berrang=C3=A9" &lt;<a href=3D"mailto:berrange@redhat.com" target=
=3D"_blank">berrange@redhat.com</a>&gt;<br>Date: 05/04/2021 05:47PM<br>Cc: =
<a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank">qemu-devel@nongn=
u.org</a>, <a href=3D"mailto:kwolf@redhat.com" target=3D"_blank">kwolf@redh=
at.com</a>, <a href=3D"mailto:to.my.trociny@gmail.com" target=3D"_blank">to=
.my.trociny@gmail.com</a>, <a href=3D"mailto:qemu-block@nongnu.org" target=
=3D"_blank">qemu-block@nongnu.org</a>, <a href=3D"mailto:dannyh@il.ibm.com"=
 target=3D"_blank">dannyh@il.ibm.com</a><br>Subject: [EXTERNAL] Re: [PATCH]=
 block/rbd: Add support for rbd image encryption<br><br><div><font face=3D"=
Courier New,Courier,monospace" size=3D"2">On Sun, May 02, 2021 at 10:36:17A=
M +0300, Or Ozeri wrote:<br>&gt; Starting from ceph Pacific, RBD has built-=
in support for image-level encryption.<br>&gt; Currently supported formats =
are LUKS version 1 and 2.<br>&gt; <br>&gt; There are 2 new relevant librbd =
APIs for controlling encryption, both expect an<br>&gt; open image context:=
<br>&gt; <br>&gt; rbd_encryption_format: formats an image (i.e. writes the =
LUKS header)<br>&gt; rbd_encryption_load: loads encryptor/decryptor to the =
image IO stack<br><br>&gt; <br>&gt; This commit extends the qemu rbd driver=
 API to support the above.<br>&gt; <br>&gt; Signed-off-by: Or Ozeri &lt;<a =
href=3D"mailto:oro@il.ibm.com" target=3D"_blank">oro@il.ibm.com</a>&gt;<br>=
&gt; ---<br>&gt; &nbsp;block/rbd.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 230 =
++++++++++++++++++++++++++++++++++++++++++-<br>&gt; &nbsp;qapi/block-core.j=
son | &nbsp;61 ++++++++++++<br>&gt; &nbsp;2 files changed, 287 insertions(+=
), 4 deletions(-)<br>&gt; <br>&gt; diff --git a/block/rbd.c b/block/rbd.c<b=
r>&gt; index f098a89c7b..1239e97889 100644<br>&gt; --- a/block/rbd.c<br>&gt=
; +++ b/block/rbd.c<br>&gt; @@ -108,6 +108,13 @@ typedef struct BDRVRBDStat=
e {<br>&gt; &nbsp; &nbsp; &nbsp;uint64_t image_size;<br>&gt; &nbsp;} BDRVRB=
DState;<br>&gt; &nbsp;<br>&gt; +#ifdef LIBRBD_SUPPORTS_ENCRYPTION<br>&gt; +=
typedef int (*RbdEncryptionFunc)(rbd_image_t image,<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; rbd_encryption_format_t format,<br>&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; rbd_encryption_options_t opts,<br>&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; size_t opts_size);<br>&gt; +#endif<br>&gt; +=
<br>&gt; &nbsp;static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t =
*io_ctx,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;BlockdevOptionsRbd *opts, boo=
l cache,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const char *keypairs, const c=
har *secretid,<br>&gt; @@ -341,6 +348,115 @@ static void qemu_rbd_memset(RA=
DOSCB *rcb, int64_t offs)<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;}<br>=
&gt; &nbsp;<br>&gt; +#ifdef LIBRBD_SUPPORTS_ENCRYPTION<br>&gt; +static int =
qemu_rbd_convert_luks_options(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;RbdEncr=
yptionOptionsLUKSBase *luks_opts,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;rbd_=
encryption_algorithm_t *alg,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;char** pa=
ssphrase,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;Error **errp)<br>&gt; +{<br>=
&gt; + &nbsp; &nbsp;int r =3D 0;<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (!luks=
_opts-&gt;has_passphrase_secret) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =
=3D -EINVAL;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;error_setg_errno(errp, -r=
, "missing encrypt.passphrase-secret");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;return r;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;*pass=
phrase =3D qcrypto_secret_lookup_as_utf8(luks_opts-&gt;passphrase_secret,<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;errp);<br>&gt; + &nbsp; &nbsp;if (!*passphrase) {=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return -EIO;<br>&gt; + &nbsp; &nbsp;}=
<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (luks_opts-&gt;has_cipher_alg) {<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp;switch (luks_opts-&gt;cipher_alg) {<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case RBD_ENCRYPTION_ALGORITHM_A=
ES_128: {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
*alg =3D RBD_ENCRYPTION_ALGORITHM_AES128;<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case RB=
D_ENCRYPTION_ALGORITHM_AES_256: {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;*alg =3D RBD_ENCRYPTION_ALGORITHM_AES256;<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;default: {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;r =3D -ENOTSUP;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;error_setg_errno(errp, -r, "unknown encryption algo=
rithm: %u",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; luks_opts-&gt;ci=
pher_alg);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;return r;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;} else {<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;/* default alg */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;*alg =3D RBD_ENCRYPTION_ALGORITHM_AES256;<br>&gt; + &nbsp; &nbsp;}<br>&gt=
; +<br>&gt; + &nbsp; &nbsp;return 0;<br>&gt; +}<br>&gt; +<br>&gt; +static i=
nt qemu_rbd_apply_encryption_function(rbd_image_t image,<br>&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;RbdEncryptionSpec* spec,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;RbdEncryptionFunc func,<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;Error **errp)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;int r =3D 0=
;<br>&gt; + &nbsp; &nbsp;g_autofree char *passphrase =3D NULL;<br>&gt; + &n=
bsp; &nbsp;g_autofree rbd_encryption_options_t opts =3D NULL;<br>&gt; + &nb=
sp; &nbsp;rbd_encryption_format_t format;<br>&gt; + &nbsp; &nbsp;size_t opt=
s_size;<br>&gt; +<br>&gt; + &nbsp; &nbsp;switch (spec-&gt;format) {<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp;case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS1: {<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rbd_encryption_luks1_format=
_options_t *luks1_opts =3D<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;g_new0(rbd_encryption_luks1_format_options_t=
, 1);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;format =3D RBD_ENC=
RYPTION_FORMAT_LUKS1;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;op=
ts =3D luks1_opts;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;opts_=
size =3D sizeof(rbd_encryption_luks1_format_options_t);<br>&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D qemu_rbd_convert_luks_options(<br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qa=
pi_RbdEncryptionOptionsLUKS1_base(&amp;spec-&gt;u.luks1),<br>&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;luks1_op=
ts-&gt;alg, &amp;passphrase, errp);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;if (passphrase) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;luks1_opts-&gt;passphrase =3D passphrase;<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;luks1_opts-&gt;passphra=
se_size =3D strlen(passphrase);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;case R=
BD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;rbd_encryption_luks2_format_options_t *luks2_opts =3D<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_new=
0(rbd_encryption_luks2_format_options_t, 1);<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;format =3D RBD_ENCRYPTION_FORMAT_LUKS2;<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;opts =3D luks2_opts;<br>&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;opts_size =3D sizeof(rbd_encryption_luks2=
_format_options_t);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =
=3D qemu_rbd_convert_luks_options(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qapi_RbdEncryptionOptionsLUKS2_base(=
&amp;spec-&gt;u.luks2),<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;&amp;luks2_opts-&gt;alg, &amp;passphrase, errp)=
;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (passphrase) {<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;luks2_opts-&gt=
;passphrase =3D passphrase;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;luks2_opts-&gt;passphrase_size =3D strlen(passphrase);<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;default: {<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;r =3D -ENOTSUP;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;error_setg_errno(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;errp, -r, "unknown image encryption for=
mat: %u",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;spec-&gt;format);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&=
gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; + &nbsp; &nbsp;}<br>&gt; =
+<br>&gt; + &nbsp; &nbsp;r =3D func(image, format, opts, opts_size);<br>&gt=
; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;error=
_setg_errno(errp, -r, "error applying encryption function");<br>&gt; + &nbs=
p; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;return r;<br>&gt; +}<br>&gt; +#=
endif<br>&gt; +<br>&gt; &nbsp;/* FIXME Deprecate and remove keypairs or mak=
e it available in QMP. */<br>&gt; &nbsp;static int qemu_rbd_do_create(Block=
devCreateOptions *options,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cons=
t char *keypairs, const char *password_secret,<br>&gt; @@ -358,6 +474,13 @@=
 static int qemu_rbd_do_create(BlockdevCreateOptions *options,<br>&gt; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;return -EINVAL;<br>&gt; &nbsp; &nbsp; &nbsp;}=
<br>&gt; &nbsp;<br>&gt; +#ifndef LIBRBD_SUPPORTS_ENCRYPTION<br>&gt; + &nbsp=
; &nbsp;if (opts-&gt;location-&gt;has_encrypt) {<br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp;error_setg(errp, "RBD library does not support image encryption"=
);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return -ENOTSUP;<br>&gt; + &nbsp; &=
nbsp;}<br>&gt; +#endif<br>&gt; +<br>&gt; &nbsp; &nbsp; &nbsp;if (opts-&gt;h=
as_cluster_size) {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int64_t objsiz=
e =3D opts-&gt;cluster_size;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (=
(objsize - 1) &amp; objsize) { &nbsp; &nbsp;/* not a power of 2? */<br>&gt;=
 @@ -383,6 +506,30 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *=
options,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out;<br>&gt; &nbsp;=
 &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; +#ifdef LIBRBD_SUPPORTS_ENCRYPTION<b=
r>&gt; + &nbsp; &nbsp;if (opts-&gt;location-&gt;has_encrypt) {<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;rbd_image_t image;<br>&gt; +<br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp;ret =3D rbd_open(io_ctx, opts-&gt;location-&gt;image, &amp;=
image, NULL);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if (ret &lt; 0) {<br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;error_setg_errno(errp, -ret, "=
error reading header from %s",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; opts-&gt;lo=
cation-&gt;image);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto =
out;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp;ret =3D qemu_rbd_apply_encryption_function(image,<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; opts-&gt;location-&gt;encrypt,<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &amp;rbd_encryption_format,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; errp);<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp;rbd_close(image);<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp;if (ret &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;/* encryption format fail, try removing the image */<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;rbd_remove(io_ctx, opts-&gt;location-&gt;ima=
ge);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out;<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;}<br>&gt; +#endif<br><=
br>What happens to the size of the image when creating with luks ? LUKS<br>=
will typically have at least 1 MB of overhead for the headers. When<br>QEMU=
 gets told to create an image with a size "512MB" that refers to<br>the gue=
st exposed size. So with LUKS QEMU might allocate 513 MB instead<br>on the =
host POV, to ensure the guest POV is still 512 MB. &nbsp;Does RBD<br>do thi=
s correctly and if not, can QEMU adjust to take this into account ?<br><br>=
<br><br>&gt; +<br>&gt; &nbsp; &nbsp; &nbsp;ret =3D 0;<br>&gt; &nbsp;out:<br=
>&gt; &nbsp; &nbsp; &nbsp;rados_ioctx_destroy(io_ctx);<br>&gt; @@ -395,6 +5=
42,42 @@ static int qemu_rbd_co_create(BlockdevCreateOptions *options, Erro=
r **errp)<br>&gt; &nbsp; &nbsp; &nbsp;return qemu_rbd_do_create(options, NU=
LL, NULL, errp);<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; +static int qemu_rb=
d_extract_encryption_spec(QemuOpts *opts,<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;RbdEncryptionSpec **=
spec,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;Error **errp)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;QDict *o=
pts_qdict;<br>&gt; + &nbsp; &nbsp;QDict *encrypt_qdict;<br>&gt; + &nbsp; &n=
bsp;Visitor *v;<br>&gt; + &nbsp; &nbsp;int ret =3D 0;<br>&gt; +<br>&gt; + &=
nbsp; &nbsp;opts_qdict =3D qemu_opts_to_qdict(opts, NULL);<br>&gt; + &nbsp;=
 &nbsp;qdict_extract_subqdict(opts_qdict, &amp;encrypt_qdict, "encrypt.");<=
br>&gt; + &nbsp; &nbsp;qobject_unref(opts_qdict);<br>&gt; + &nbsp; &nbsp;if=
 (!qdict_size(encrypt_qdict)) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;*spec =
=3D NULL;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto exit;<br>&gt; + &nbsp; =
&nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;/* Convert options into a QAPI obj=
ect */<br>&gt; + &nbsp; &nbsp;v =3D qobject_input_visitor_new_flat_confused=
(encrypt_qdict, errp);<br>&gt; + &nbsp; &nbsp;if (!v) {<br>&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp;ret =3D -EINVAL;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;got=
o exit;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;visit_typ=
e_RbdEncryptionSpec(v, NULL, spec, errp);<br>&gt; + &nbsp; &nbsp;visit_free=
(v);<br>&gt; + &nbsp; &nbsp;if (!*spec) {<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp;ret =3D -EINVAL;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto exit;<br>&gt=
; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; +exit:<br>&gt; + &nbsp; &nbsp;qobject_=
unref(encrypt_qdict);<br>&gt; + &nbsp; &nbsp;return ret;<br>&gt; +}<br>&gt;=
 +<br>&gt; &nbsp;static int coroutine_fn qemu_rbd_co_create_opts(BlockDrive=
r *drv,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const char *filename,<br>&gt; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;QemuOpts *opts,<br>&gt; @@ -403,6 +586,7 @@ static int c=
oroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,<br>&gt; &nbsp; &nbsp;=
 &nbsp;BlockdevCreateOptions *create_options;<br>&gt; &nbsp; &nbsp; &nbsp;B=
lockdevCreateOptionsRbd *rbd_opts;<br>&gt; &nbsp; &nbsp; &nbsp;BlockdevOpti=
onsRbd *loc;<br>&gt; + &nbsp; &nbsp;RbdEncryptionSpec *encryption_spec =3D =
NULL;<br>&gt; &nbsp; &nbsp; &nbsp;Error *local_err =3D NULL;<br>&gt; &nbsp;=
 &nbsp; &nbsp;const char *keypairs, *password_secret;<br>&gt; &nbsp; &nbsp;=
 &nbsp;QDict *options =3D NULL;<br>&gt; @@ -431,6 +615,11 @@ static int cor=
outine_fn qemu_rbd_co_create_opts(BlockDriver *drv,<br>&gt; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;goto exit;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;<=
br>&gt; + &nbsp; &nbsp;ret =3D qemu_rbd_extract_encryption_spec(opts, &amp;=
encryption_spec, errp);<br>&gt; + &nbsp; &nbsp;if (ret &lt; 0) {<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp;goto exit;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br=
>&gt; &nbsp; &nbsp; &nbsp;/*<br>&gt; &nbsp; &nbsp; &nbsp; * Caution: while =
qdict_get_try_str() is fine, getting non-string<br>&gt; &nbsp; &nbsp; &nbsp=
; * types would require more care. &nbsp;When @options come from -blockdev<=
br>&gt; @@ -446,6 +635,8 @@ static int coroutine_fn qemu_rbd_co_create_opts=
(BlockDriver *drv,<br>&gt; &nbsp; &nbsp; &nbsp;loc-&gt;q_namespace =3D g_st=
rdup(qdict_get_try_str(options, "namespace"));<br>&gt; &nbsp; &nbsp; &nbsp;=
loc-&gt;has_q_namespace =3D !!loc-&gt;q_namespace;<br>&gt; &nbsp; &nbsp; &n=
bsp;loc-&gt;image &nbsp; &nbsp; &nbsp; =3D g_strdup(qdict_get_try_str(optio=
ns, "image"));<br>&gt; + &nbsp; &nbsp;loc-&gt;encrypt &nbsp; &nbsp; =3D enc=
ryption_spec;<br>&gt; + &nbsp; &nbsp;loc-&gt;has_encrypt =3D !!encryption_s=
pec;<br>&gt; &nbsp; &nbsp; &nbsp;keypairs &nbsp; &nbsp; &nbsp; &nbsp; =3D q=
dict_get_try_str(options, "=3Dkeyvalue-pairs");<br>&gt; &nbsp;<br>&gt; &nbs=
p; &nbsp; &nbsp;ret =3D qemu_rbd_do_create(create_options, keypairs, passwo=
rd_secret, errp);<br>&gt; @@ -756,12 +947,26 @@ static int qemu_rbd_open(Bl=
ockDriverState *bs, QDict *options, int flags,<br>&gt; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;goto failed_open;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp=
;<br>&gt; + &nbsp; &nbsp;if (opts-&gt;has_encrypt) {<br>&gt; +#ifdef LIBRBD=
_SUPPORTS_ENCRYPTION<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =3D qemu_rbd_ap=
ply_encryption_function(s-&gt;image, opts-&gt;encrypt,<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &amp;rbd_encryption_load, errp);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if (=
r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto failed_=
post_open;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; +#else<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp;r =3D -ENOTSUP;<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp;error_setg_errno(errp, -r,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "RBD library does not su=
pport image encryption");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto failed_=
post_open;<br>&gt; +#endif<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; &nbsp=
; &nbsp; &nbsp;r =3D rbd_get_size(s-&gt;image, &amp;s-&gt;image_size);<br>&=
gt; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;error_setg_errno(errp, -r, "error getting image size from %s",<br>&g=
t; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; s-&gt;image_name);<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;=
rbd_close(s-&gt;image);<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;goto failed_op=
en;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto failed_post_open;<br>&gt; &nb=
sp; &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;/* If we are =
using an rbd snapshot, we must be r/o, otherwise<br>&gt; @@ -769,8 +974,7 @=
@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,=
<br>&gt; &nbsp; &nbsp; &nbsp;if (s-&gt;snap !=3D NULL) {<br>&gt; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;r =3D bdrv_apply_auto_read_only(bs, "rbd snapshots =
are read-only", errp);<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt;=
 0) {<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rbd_close(s-&gt;im=
age);<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto failed_open;<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto failed_post_open;<b=
r>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp; &nbsp; &nbsp;}<br=
>&gt; &nbsp;<br>&gt; @@ -780,6 +984,8 @@ static int qemu_rbd_open(BlockDriv=
erState *bs, QDict *options, int flags,<br>&gt; &nbsp; &nbsp; &nbsp;r =3D 0=
;<br>&gt; &nbsp; &nbsp; &nbsp;goto out;<br>&gt; &nbsp;<br>&gt; +failed_post=
_open:<br>&gt; + &nbsp; &nbsp;rbd_close(s-&gt;image);<br>&gt; &nbsp;failed_=
open:<br>&gt; &nbsp; &nbsp; &nbsp;rados_ioctx_destroy(s-&gt;io_ctx);<br>&gt=
; &nbsp; &nbsp; &nbsp;g_free(s-&gt;snap);<br>&gt; @@ -1243,6 +1449,22 @@ st=
atic QemuOptsList qemu_rbd_create_opts =3D {<br>&gt; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;.type =3D QEMU_OPT_STRING,<br>&gt; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.help =3D "ID of secret providing the pas=
sword",<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},<br>&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.name =
=3D "encrypt.format",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.t=
ype =3D QEMU_OPT_STRING,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;.help =3D "Encrypt the image, format choices: 'luks1', 'luks2'",<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp;},<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;{<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.name =3D "encrypt.cipher-alg=
",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.type =3D QEMU_OPT_ST=
RING,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.help =3D "Name of=
 encryption cipher algorithm"<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" (allowed values: aes-128, aes-256)",<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;},<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
{<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.name =3D "encrypt.pas=
sphrase-secret",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.type =
=3D QEMU_OPT_STRING,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.he=
lp =3D "ID of secret providing LUKS passphrase",<br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp;},<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ /* end of list */=
 }<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;};<br>&gt; diff --git a/qapi=
/block-core.json b/qapi/block-core.json<br>&gt; index 6d227924d0..a1f3230e2=
9 100644<br>&gt; --- a/qapi/block-core.json<br>&gt; +++ b/qapi/block-core.j=
son<br>&gt; @@ -3609,6 +3609,64 @@<br>&gt; &nbsp;{ 'enum': 'RbdAuthMode',<b=
r>&gt; &nbsp; &nbsp;'data': [ 'cephx', 'none' ] }<br>&gt; &nbsp;<br>&gt; +#=
#<br>&gt; +# @RbdImageEncryptionFormat:<br>&gt; +#<br>&gt; +# Since: 6.1<br=
>&gt; +##<br>&gt; +{ 'enum': 'RbdImageEncryptionFormat',<br>&gt; + &nbsp;'d=
ata': [ 'luks1', 'luks2' ] }<br><br>We already have LUKS support in QEMU th=
at we use with raw files<br>and with qcow2, and here we call LUKSv1 simply =
"luks".<br><br>IOW, I think we should just have "luks" and "luks2" <br><br>=
&gt; +<br>&gt; +##<br>&gt; +# @RbdEncryptionAlgorithm:<br>&gt; +#<br>&gt; +=
# Since: 6.1<br>&gt; +##<br>&gt; +{ 'enum': 'RbdEncryptionAlgorithm',<br>&g=
t; + &nbsp;'data': [ 'aes-128', 'aes-256' ] }<br><br>We already have a QCry=
ptoCipherAlgorithm we should be using<br><br>&gt; +<br>&gt; +##<br>&gt; +# =
@RbdEncryptionOptionsLUKSBase:<br>&gt; +#<br>&gt; +# @cipher-alg: The encry=
ption algorithm<br>&gt; +# @passphrase-secret: ID of a QCryptoSecret object=
 providing a passphrase<br>&gt; +# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; for unlocking the encryption<br>&gt; +#<br>&g=
t; +# Since: 6.1<br>&gt; +##<br>&gt; +{ 'struct': 'RbdEncryptionOptionsLUKS=
Base',<br>&gt; + &nbsp;'data': { '*cipher-alg': 'RbdEncryptionAlgorithm',<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'*passphrase-secret': 'st=
r' }}<br><br>For other block devices we've called it "key-secret", so pleas=
e<br>lets keep the same terminology<br><br>IIUC, cipher-alg is only relevan=
t when creating a new<br>disk image.<br><br>IOW, we ought to have separate =
option structs for the code<br>paths for opening and creating images, since=
 the format<br>only wants a secret.<br><br>&gt; +<br>&gt; +##<br>&gt; +# @R=
bdEncryptionOptionsLUKS1:<br>&gt; +#<br>&gt; +# Since: 6.1<br>&gt; +##<br>&=
gt; +{ 'struct': 'RbdEncryptionOptionsLUKS1',<br>&gt; + &nbsp;'base': 'RbdE=
ncryptionOptionsLUKSBase',<br>&gt; + &nbsp;'data': {}}<br>&gt; +<br>&gt; +#=
#<br>&gt; +# @RbdEncryptionOptionsLUKS2:<br>&gt; +#<br>&gt; +# Since: 6.1<b=
r>&gt; +##<br>&gt; +{ 'struct': 'RbdEncryptionOptionsLUKS2',<br>&gt; + &nbs=
p;'base': 'RbdEncryptionOptionsLUKSBase',<br>&gt; + &nbsp;'data': {}}<br>&g=
t; +<br>&gt; +##<br>&gt; +# @RbdEncryptionSpec:<br>&gt; +#<br>&gt; +# Since=
: 6.1<br>&gt; +##<br>&gt; +{ 'union': 'RbdEncryptionSpec',<br>&gt; + &nbsp;=
'base': { 'format': 'RbdImageEncryptionFormat' },<br>&gt; + &nbsp;'discrimi=
nator': 'format',<br>&gt; + &nbsp;'data': { 'luks1': 'RbdEncryptionOptionsL=
UKS1',<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'luks2': 'RbdEncr=
yptionOptionsLUKS2'} }<br><br><br><br>&gt; +<br>&gt; &nbsp;##<br>&gt; &nbsp=
;# @BlockdevOptionsRbd:<br>&gt; &nbsp;#<br>&gt; @@ -3624,6 +3682,8 @@<br>&g=
t; &nbsp;#<br>&gt; &nbsp;# @snapshot: Ceph snapshot name.<br>&gt; &nbsp;#<b=
r>&gt; +# @encrypt: Image encryption specification. (Since 6.1)<br>&gt; +#<=
br>&gt; &nbsp;# @user: Ceph id name.<br>&gt; &nbsp;#<br>&gt; &nbsp;# @auth-=
client-required: Acceptable authentication modes.<br>&gt; @@ -3646,6 +3706,=
7 @@<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'image': 'str'=
,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'*conf': 'str',<b=
r>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'*snapshot': 'str',<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'*encrypt': 'RbdEncrypti=
onSpec',<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'*user': '=
str',<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'*auth-client=
-required': ['RbdAuthMode'],<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;'*key-secret': 'str',<br><br><br>Is there any way to report that =
LUKS is enabled for a given image ?<br><br>For an application to specify th=
e "key-secret" for encryption, we<br>need to know that the image is encrypt=
ed. &nbsp;For the existing raw<br>and qcow2 file luks support we have this =
reported with "qemu-img info"<br><br><br>Regards,<br>Daniel<br>-- <br>|: <a=
 href=3D"https://berrange.com">https://berrange.com</a>&nbsp;&nbsp; &nbsp; =
&nbsp; -o- &nbsp; &nbsp;<a href=3D"https://www.flickr.com/photos/dberrange"=
>https://www.flickr.com/photos/dberrange</a>&nbsp;&nbsp;:|<br>|: <a href=3D=
"https://libvirt.org">https://libvirt.org</a>&nbsp;&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;-o- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"https://f=
stop138.berrange.com">https://fstop138.berrange.com</a>&nbsp;&nbsp;:|<br>|:=
 <a href=3D"https://entangle-photo.org">https://entangle-photo.org</a>&nbsp=
;&nbsp; &nbsp; -o- &nbsp; &nbsp;<a href=3D"https://www.instagram.com/dberra=
nge">https://www.instagram.com/dberrange</a>&nbsp;&nbsp;:|<br><br></font></=
div></div></div></font></font><BR>


