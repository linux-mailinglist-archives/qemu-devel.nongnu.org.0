Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35AA33AA06
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 04:36:58 +0100 (CET)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLe2L-00034b-Ti
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 23:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLe18-0002CI-Hc
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 23:35:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLe15-0004po-GP
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 23:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615779337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=udUsSXSwNq7Z1hdlj0T7o3FqAhslnYZO3WOseDlPFcw=;
 b=IzjOZThyX6r9U0IeP0QCnOEoU0+TJFXFd2tzX9RQayVWF8SWnnc/oeu+8Z22z4hk2k4ViE
 7e61ujmzHJ7RYzMOUC/XPhxQP4QiPzt6P/1rg6k8SRMupubb6CG/UipXr4FwaEY7ddtUod
 BzQxrEU6+Fp7sJIInvOhgc31g0zKEbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-5FVZCeK_O3SsMRm6sZo4xg-1; Sun, 14 Mar 2021 23:35:33 -0400
X-MC-Unique: 5FVZCeK_O3SsMRm6sZo4xg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B06FC107ACCD;
 Mon, 15 Mar 2021 03:35:32 +0000 (UTC)
Received: from ovpn-13-199.pek2.redhat.com (ovpn-13-199.pek2.redhat.com
 [10.72.13.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB2DE2B394;
 Mon, 15 Mar 2021 03:35:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
Message-Id: <D84EEEBD-2341-49D2-818A-79CDF1F2DD5E@redhat.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PULL 00/16] Net patches
Date: Mon, 15 Mar 2021 11:35:27 +0800
In-Reply-To: <CAFEAcA-fMR8yLC6Y=HSYgpSOrffCYSNnf-0sDQ2RrNWrQff6Ng@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
 <CAFEAcA-fMR8yLC6Y=HSYgpSOrffCYSNnf-0sDQ2RrNWrQff6Ng@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_83618135-42C1-489B-9A00-64E23626E35C"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Apple-Mail=_83618135-42C1-489B-9A00-64E23626E35C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> 2021=E5=B9=B43=E6=9C=8814=E6=97=A5 =E4=B8=8B=E5=8D=887:37=EF=BC=8CPeter M=
aydell <peter.maydell@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Fri, 12 Mar 2021 at 06:16, Jason Wang <jasowang@redhat.com <mailto:jas=
owang@redhat.com>> wrote:
>>=20
>> The following changes since commit f4abdf32714d1845b7c01ec136dd2b04c2f7d=
b47:
>>=20
>>  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-docs-xe=
n-updates-100321-2' into staging (2021-03-11 16:20:58 +0000)
>>=20
>> are available in the git repository at:
>>=20
>>  https://github.com/jasowang/qemu.git tags/net-pull-request
>>=20
>> for you to fetch changes up to 9bdb56367679e68e5e71a1c29a1087bda6414b25:
>>=20
>>  pvrdma: wean code off pvrdma_ring.h kernel header (2021-03-12 14:08:31 =
+0800)
>>=20
>> ----------------------------------------------------------------
>>=20
>=20
> Hi; this has a merge conflict in net/nic.c relating to
> ID generation: it looks like
> "net: unbreak well-form id check for "-nic" (in this pullreq)
> "net: Use id_generate() in the network subsystem, too" (in master)
> are both changing the way that NIC ID strings are created, and
> I don't know which is supposed to be the correct way.
>=20
> Please can you fix up the conflict appropriately and resend?

Will do.

Thanks


>=20
> thanks
> -- PMM


--Apple-Mail=_83618135-42C1-489B-9A00-64E23626E35C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D""><br class=3D""><div><br cl=
ass=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">2021=E5=B9=B4=
3=E6=9C=8814=E6=97=A5 =E4=B8=8B=E5=8D=887:37=EF=BC=8CPeter Maydell &lt;<a h=
ref=3D"mailto:peter.maydell@linaro.org" class=3D"">peter.maydell@linaro.org=
</a>&gt; =E5=86=99=E9=81=93=EF=BC=9A</div><br class=3D"Apple-interchange-ne=
wline"><div class=3D""><meta charset=3D"UTF-8" class=3D""><span style=3D"ca=
ret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-styl=
e: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decora=
tion: none; float: none; display: inline !important;" class=3D"">On Fri, 12=
 Mar 2021 at 06:16, Jason Wang &lt;</span><a href=3D"mailto:jasowang@redhat=
.com" style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; or=
phans: auto; text-align: start; text-indent: 0px; text-transform: none; whi=
te-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust=
: auto; -webkit-text-stroke-width: 0px;" class=3D"">jasowang@redhat.com</a>=
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">&gt; wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; font-style=
: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: n=
ormal; orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-si=
ze-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;" cl=
ass=3D""><br class=3D"">The following changes since commit f4abdf32714d1845=
b7c01ec136dd2b04c2f7db47:<br class=3D""><br class=3D"">&nbsp;Merge remote-t=
racking branch 'remotes/stsquad/tags/pull-testing-docs-xen-updates-100321-2=
' into staging (2021-03-11 16:20:58 +0000)<br class=3D""><br class=3D"">are=
 available in the git repository at:<br class=3D""><br class=3D"">&nbsp;<a =
href=3D"https://github.com/jasowang/qemu.git" class=3D"">https://github.com=
/jasowang/qemu.git</a> tags/net-pull-request<br class=3D""><br class=3D"">f=
or you to fetch changes up to 9bdb56367679e68e5e71a1c29a1087bda6414b25:<br =
class=3D""><br class=3D"">&nbsp;pvrdma: wean code off pvrdma_ring.h kernel =
header (2021-03-12 14:08:31 +0800)<br class=3D""><br class=3D"">-----------=
-----------------------------------------------------<br class=3D""><br cla=
ss=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family: H=
elvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; f=
ont-weight: normal; letter-spacing: normal; text-align: start; text-indent:=
 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"=
caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-st=
yle: normal; font-variant-caps: normal; font-weight: normal; letter-spacing=
: normal; text-align: start; text-indent: 0px; text-transform: none; white-=
space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-deco=
ration: none; float: none; display: inline !important;" class=3D"">Hi; this=
 has a merge conflict in net/nic.c relating to</span><br style=3D"caret-col=
or: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: norm=
al; font-variant-caps: normal; font-weight: normal; letter-spacing: normal;=
 text-align: start; text-indent: 0px; text-transform: none; white-space: no=
rmal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: n=
one;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Hel=
vetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none; float: none; display: inline =
!important;" class=3D"">ID generation: it looks like</span><br style=3D"car=
et-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style=
: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorat=
ion: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; text-decoration: none; float: none; display: i=
nline !important;" class=3D"">"net: unbreak well-form id check for "-nic" (=
in this pullreq)</span><br style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none; float: none; display: inline !important;" class=3D"">"net=
: Use id_generate() in the network subsystem, too" (in master)</span><br st=
yle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; te=
xt-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-c=
aps: normal; font-weight: normal; letter-spacing: normal; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">are both changing the way that NIC =
ID strings are created, and</span><br style=3D"caret-color: rgb(0, 0, 0); f=
ont-family: Helvetica; font-size: 12px; font-style: normal; font-variant-ca=
ps: normal; font-weight: normal; letter-spacing: normal; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: normal; word-spacing:=
 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><s=
pan style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none; float: none; display: inline !important;" class=
=3D"">I don't know which is supposed to be the correct way.</span><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-=
family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px=
; font-style: normal; font-variant-caps: normal; font-weight: normal; lette=
r-spacing: normal; text-align: start; text-indent: 0px; text-transform: non=
e; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" class=3D""=
>Please can you fix up the conflict appropriately and resend?</span><br sty=
le=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; f=
ont-style: normal; font-variant-caps: normal; font-weight: normal; letter-s=
pacing: normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; tex=
t-decoration: none;" class=3D""></div></blockquote><div><br class=3D""></di=
v><div>Will do.</div><div><br class=3D""></div><div>Thanks</div><div><br cl=
ass=3D""></div><br class=3D""><blockquote type=3D"cite" class=3D""><div cla=
ss=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;=
 float: none; display: inline !important;" class=3D"">thanks</span><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); fo=
nt-family: Helvetica; font-size: 12px; font-style: normal; font-variant-cap=
s: normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; di=
splay: inline !important;" class=3D"">-- PMM</span></div></blockquote></div=
><br class=3D""></body></html>
--Apple-Mail=_83618135-42C1-489B-9A00-64E23626E35C--


