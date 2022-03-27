Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B804E8868
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Mar 2022 17:22:08 +0200 (CEST)
Received: from localhost ([::1]:37016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYUiU-0001B1-Jo
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 11:22:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jostein@secure.kjonigsen.net>)
 id 1nYUga-0000U2-5a
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 11:20:08 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:55663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jostein@secure.kjonigsen.net>)
 id 1nYUgX-0003rM-RW
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 11:20:07 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 23E7F32009E5
 for <qemu-devel@nongnu.org>; Sun, 27 Mar 2022 11:20:02 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
 by compute3.internal (MEProxy); Sun, 27 Mar 2022 11:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 secure.kjonigsen.net; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:sender:subject:subject:to:to; s=fm3; bh=EHtAD
 h9/Kye1Ipcuhu/h7YORznVITws7GuHrs6kU84A=; b=ydINDpQYt/xThXGP5smkq
 YAPK7NtgchdyPqxm6So4ucIodrTC7oqLO9X7l9rGTx7XT7do1sEI6C5Tr/EuMPen
 bfbsfQmu1KmWY2S8y0zHFDW5ealBdh9MlME9i1/uPGyXeb4doDBcvErVdFn81Yn+
 wgzXH16uf+LxKlUIo9/WtOWs+R2PorSQFUIupRzpo36CzXweomtKoGQyooyiIpa+
 Rmd2RqU4DtVpAx2gljNrYRpz9T/5IVF7tAZtzBo7Uk91TknlnQzy0sxPfYZxJykE
 bARrcKkESWMeyzf+cWL/hoA43vmvDImWPnaAN3sx/D6/qvty593rWLKdFODSKVpO
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EHtADh
 9/Kye1Ipcuhu/h7YORznVITws7GuHrs6kU84A=; b=XY6KgSBrNsAQWrOrHNWZWp
 5FQmtR7rpRvWA/L3NNHgrcTmCjystDalkVHDEL+oUh1xGgmYmQQw6SW+jg32UM9O
 kvffZwnQ7daF9Y3Ouv3VDbtaRYMC9em9CDGxRJ1Tx4LWrAJiGh7Bq6lPUkAboFik
 ZtyLBnZh5c+ejFBOPosxPLlEIhLBY1gwnL7zhyndtt//10JrqRsYwc446Q3E1qLA
 w/3Q3NKg30Mu8Cb3P+8RqFnnfej5AoSr6Zqb2JwwtDBAP7drWu+tDUpzqNblVYGB
 J3AEcsxwsinU25UWOF9JzaTtE5jYczLDzk9bjDoZwmbZXSg0BaxovZWMiS8Y+nXg
 ==
X-ME-Sender: <xms:oYBAYlJxFct9sfjKuBi6EGRLDZtGkWlEsu_WCF4UIo2uy11TXhqYBg>
 <xme:oYBAYhIIf5cWHu4sKnITOaYi_1ulu273FeDDiG5M4oUlR2Cf_Xe64qm7BMFnUODDt
 cnCTndKY4m314cjGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehhedgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhrhfvufgtsegrtderreerreejnecuhfhrohhmpeflohhs
 thgvihhnpgfmjhppnhhighhsvghnuceojhhoshhtvghinhesshgvtghurhgvrdhkjhhonh
 highhsvghnrdhnvghtqeenucggtffrrghtthgvrhhnpeejveefffeiieejgedtjeekjefg
 veethfeuhfdutedtlefggffhueejfeeuvdehhfenucffohhmrghinhepkhhjnhhighhsvg
 hnrdhnohenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehjohhsthgvihhnsehsvggtuhhrvgdrkhhjohhnihhgshgvnhdrnhgvth
X-ME-Proxy: <xmx:oYBAYtvzTqbEFwOR-X9BLv6Aa_bvmupWu1nfdZ_bbmF3rZRsKW_U2g>
 <xmx:oYBAYmYCfLtIzmdFGI2xvz34DG9cxoMe6wFhVY0mUgU_vVU-gUoLig>
 <xmx:oYBAYsZtQCSEQUY3gSm3HPUtN2Z3dltnrmqVG6wIsIaYnLUx-KC0rw>
 <xmx:oYBAYln0T1qsb8IGrc2pWS_i6RSwAYOyKwTuWj8iCS6jBi0XP7Qdcw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7C4511EA006C; Sun, 27 Mar 2022 11:20:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <cb831ca8-d8ff-460f-a2e4-0808dbf1e34d@www.fastmail.com>
In-Reply-To: <0605f78f-fe90-45bd-8e5b-d48fb3b99246@www.fastmail.com>
References: <0605f78f-fe90-45bd-8e5b-d48fb3b99246@www.fastmail.com>
Date: Sun, 27 Mar 2022 17:19:41 +0200
From: =?UTF-8?Q?Jostein_Kj=C3=B8nigsen?= <jostein@secure.kjonigsen.net>
To: "QEMU Developers" <qemu-devel@nongnu.org>
Subject: Re: QEMU, UEFI and Windows with Bitlocker encryption
Content-Type: multipart/alternative; boundary=579815cba12c44539e49aa401b041518
Received-SPF: pass client-ip=64.147.123.24;
 envelope-from=jostein@secure.kjonigsen.net;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: jostein@kjonigsen.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--579815cba12c44539e49aa401b041518
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

I didn=E2=80=99t get any response to this, but found out the solution my=
self, so I just thought I=E2=80=99d share the solution for anyone with a=
 similar issue.

Basically the root of this problem seems to have been TPM-related and no=
t UEFI-related.=20

So switching from a pass through-TPM to a swtpm for my VM caused Windows=
 to having to reinitialize the TPM and thus bitlocker.=20

After doing this the VM boots cleanly, like expected.=20

I=E2=80=99m guessing that simply resetting the existing TPM and reinitia=
lizing it in Windows would have solved the issue too, and that a similar=
 fix might work when shifting a BitLocker encrypted boot drive from one =
system to another, VM or not.=20

Cheers!

--
Vennlig hilsen
Jostein Kj=C3=B8nigsen

jostein@kjonigsen.net =F0=9F=8D=B5 jostein@gmail.com
https://jostein.kj=C3=B8nigsen.no <https://jostein.xn--kjnigsen-64a.no/>


On Wed, Mar 9, 2022, at 17:55, Jostein Kj=C3=B8nigsen wrote:
> Dear QEMU developers.=20
>=20
> I=E2=80=99m having some issues with one of my QEMU VMs. I=E2=80=99m no=
t sure if the mailing list is the best place to get help, and if it=E2=80=
=99s a complete miss, feel free to direct me towards more appropriate ve=
nues.=20
>=20
> My case in short: I have a Windows 11 VM with BitLocker encryption whi=
ch is imported from a physical volume. I run it through virt-manager, bo=
oting with UEFI through OVMF, tpm pass-through and it boots just fine.=20
>=20
> What is annoying is that I have to manually enter the 48-digit BitLock=
er recovery key on every boot.=20
>=20
> I would assume these keys should get stored in EFI vars or TPM somewhe=
re? If so, shouldn=E2=80=99t they be persisted when the VM is rebooted o=
r powered off?
>=20
> Any advice on how I can resolve this situation would be greatly apprec=
iated.=20
>=20
> --
> Kind regards
> Jostein Kj=C3=B8nigsen
>=20
> jostein@kjonigsen.net =F0=9F=8D=B5 jostein@gmail.com
> https://jostein.kj=C3=B8nigsen.no <https://jostein.xn--kjnigsen-64a.no=
/>
>=20

--579815cba12c44539e49aa401b041518
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">
p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>I didn=E2=80=
=99t get any response to this, but found out the solution myself, so I j=
ust thought I=E2=80=99d share the solution for anyone with a similar iss=
ue.<br></div><div><br></div><div>Basically the root of this problem seem=
s to have been TPM-related and not UEFI-related.&nbsp;<br></div><div><br=
></div><div>So switching from a pass through-TPM to a swtpm for my VM ca=
used Windows to having to reinitialize the TPM and thus bitlocker.&nbsp;=
<br></div><div><br></div><div>After doing this the VM boots cleanly, lik=
e expected.&nbsp;<br></div><div><br></div><div>I=E2=80=99m guessing that=
 simply resetting the existing TPM and reinitializing it in Windows woul=
d have solved the issue too, and that a similar fix might work when shif=
ting a BitLocker encrypted boot drive from one system to another, VM or =
not.&nbsp;<br></div><div><br></div><div>Cheers!<br></div><div><br></div>=
<div id=3D"sig19302177"><div class=3D"signature">--<br></div><div id=3D"=
sig19302177" class=3D"signature"><div class=3D"signature">Vennlig hilsen=
<br></div></div><div class=3D"signature">Jostein Kj=C3=B8nigsen<br></div=
><div class=3D"signature"><br></div><div class=3D"signature"><a href=3D"=
mailto:jostein@kjonigsen.net">jostein@kjonigsen.net</a> =F0=9F=8D=B5 <a =
href=3D"mailto:jostein@gmail.com">jostein@gmail.com</a><br></div><div cl=
ass=3D"signature"><a href=3D"https://jostein.kj=C3=B8nigsen.no">https://=
jostein.kj=C3=B8nigsen.no</a><br></div></div><div><br></div><div><br></d=
iv><div>On Wed, Mar 9, 2022, at 17:55, Jostein Kj=C3=B8nigsen wrote:<br>=
</div><blockquote type=3D"cite" id=3D"qt" style=3D""><div>Dear QEMU deve=
lopers.&nbsp;<br></div><div><br></div><div>I=E2=80=99m having some issue=
s with one of my QEMU VMs. I=E2=80=99m not sure if the mailing list is t=
he best place to get help, and if it=E2=80=99s a complete miss, feel fre=
e to direct me towards more appropriate venues.&nbsp;<br></div><div><br>=
</div><div>My case in short: I have a Windows 11 VM with BitLocker encry=
ption which is imported from a physical volume. I run it through virt-ma=
nager, booting with UEFI through OVMF, tpm pass-through and it boots jus=
t fine.&nbsp;<br></div><div><br></div><div>What is annoying is that I ha=
ve to manually enter the 48-digit BitLocker recovery key on every boot.&=
nbsp;<br></div><div><br></div><div>I would assume these keys should get =
stored in EFI vars or TPM somewhere? If so, shouldn=E2=80=99t they be pe=
rsisted when the VM is rebooted or powered off?<br></div><div><br></div>=
<div>Any advice on how I can resolve this situation would be greatly app=
reciated.&nbsp;<br></div><div><br></div><div id=3D"qt-sig19302177"><div =
class=3D"qt-signature">--<br></div><div id=3D"qt-sig19302177" class=3D"q=
t-signature"><div class=3D"qt-signature">Kind regards<br></div></div><di=
v class=3D"qt-signature">Jostein Kj=C3=B8nigsen<br></div><div class=3D"q=
t-signature"><br></div><div class=3D"qt-signature"><a href=3D"mailto:jos=
tein@kjonigsen.net">jostein@kjonigsen.net</a> =F0=9F=8D=B5 <a href=3D"ma=
ilto:jostein@gmail.com">jostein@gmail.com</a><br></div><div class=3D"qt-=
signature"><a href=3D"https://jostein.kj=C3=B8nigsen.no">https://jostein=
.kj=C3=B8nigsen.no</a><br></div></div><div><br></div></blockquote><div><=
br></div></body></html>
--579815cba12c44539e49aa401b041518--

