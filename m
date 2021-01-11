Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D982F0AD7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 02:40:03 +0100 (CET)
Received: from localhost ([::1]:60584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kymBe-0006KZ-3w
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 20:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kymAS-0005tk-DX
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 20:38:50 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:49517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kymAQ-0007nk-4R
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 20:38:48 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8CE1E58058D;
 Sun, 10 Jan 2021 20:38:45 -0500 (EST)
Received: from imap1 ([10.202.2.51])
 by compute6.internal (MEProxy); Sun, 10 Jan 2021 20:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=+UVVN
 IdP1wx51YrNbr92ow+G0QYbHHbwFb74sD6jMY8=; b=hGDrnuR8BlOBGpp4HsxE3
 3Qvh+nATcE5Hqxuww4Kz0mbBXjbb6Iv0LkjG7mqEmVfJqTwOA03LG2klk1gyoNLs
 1CUrt5xuAzy1cW74+oeDomXCgiIO9uiY0e8qf0WhJ+gTdL5KLPBPAl314m0+nan1
 k5Dq5eZZ3Zbca9dgf312qr0+l0uDmJ3IMh0o1gzSVlLOkG+cPpmbrsU9ARbHhWMs
 R0S6eGtCawJ44EWJSA+Xmxla1H7PIf8RKnK5DD70jbvquYCEigO38OW3UjQA6EAF
 IsvUiJ0H9kcWtQY53I0PwCqg+5NT6l2ro82jQZEA0fu4rsbIlnuQwQdKaqQgCX8U
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=+UVVNIdP1wx51YrNbr92ow+G0QYbHHbwFb74sD6jM
 Y8=; b=TXSTikdMgAcZ92gToWtBMRRJqq//oU8LBqt92iceUxO2vQXsjltRWHVZr
 FtAHyJxoXu2ycurgtcyK5CGnuT/5x3k4lWMCWN/izxO0yUB1o8nGFvHJ+8Wk+c4N
 fml26IiwsntK0dsgZgNYyqMXcGU/dZFupLc3jOjlMeu6P5oLw/TNgV/Yan7EtGSx
 TTTQZwe4NcdWNRU0K0TG/7mwLdNQRbYlgSvSYeAeeOOeBSbucxAHPgW8lnDjsRA6
 4pFG+81MUsFDyfHFHh6uzHFNLYNjfHA2UrxYOZYgMzFqtJ3+r2uMD4fk7oVIijaU
 DMOmkPL/5fSdm5mEx2YYRqEV0FqUg==
X-ME-Sender: <xms:I6z7X_uU0U-ocgV5sbeYHTymxW2Gv5XJt4JkawO8oElKv-DEy1M4_w>
 <xme:I6z7XwcNcJH0a00Qbf1X-sw8WWdkjNBdjiK7E1BACeBU2YESalk2_27QEFERqV_2t
 X_EGvoP-6SXbHF16Qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehtddgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
 rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeetgeekveeftefhgfduheegvdeuuddvieefvddvlefh
 feehkeetfeeukedtfeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:I6z7XywuPqRfgh0PSPvDVaanSv9m2on0ym4KpJB1lmVCI748Uwe-Tw>
 <xmx:I6z7X-OcaMkC5CIAjnLe0e7rHMNDz_VieS1LTEx9Ik0qfkBjs_Im6g>
 <xmx:I6z7X_-CBnb2s6phFXnc065Sxd0C398dcu6IB_2iux4iNcjzhY7GoA>
 <xmx:Jaz7X6novX80flkyGUG2alHPK49Bp8FNVZ8oRE9GIHEbZblLoT3kqg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C8A61C200A5; Sun, 10 Jan 2021 20:38:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-45-g4839256-fm-20210104.001-g48392560
Mime-Version: 1.0
Message-Id: <f5466f0b-cc4f-4a71-8c06-7971198a7602@www.fastmail.com>
In-Reply-To: <1b55216e-4526-6f50-eac2-f91797a64e7@eik.bme.hu>
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <bf9400cc8e4ddd3129aa5678de4d3cf38384805f.1610223397.git.balaton@eik.bme.hu>
 <f77d6471-d19d-a1c2-e447-18181d55ba86@amsat.org>
 <5c5ce8b9-f5c4-c58d-6f8a-76c47ad8db4d@eik.bme.hu>
 <2a45450d-8357-c03e-7e11-bd59bffa61ae@amsat.org>
 <1b55216e-4526-6f50-eac2-f91797a64e7@eik.bme.hu>
Date: Mon, 11 Jan 2021 09:38:22 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "BALATON Zoltan" <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_08/13]_vt82c686:_Move_creation_of_ISA_devices_to?=
 =?UTF-8?Q?_the_ISA_bridge?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: permerror client-ip=66.111.4.230;
 envelope-from=jiaxun.yang@flygoat.com; helo=new4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan via <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, Jan 11, 2021, at 3:25 AM, BALATON Zoltan wrote:
> On Sun, 10 Jan 2021, Philippe Mathieu-Daud=C3=A9 wrote:
> > +PCI experts
> >
> > On 1/10/21 1:43 AM, BALATON Zoltan wrote:
> >> On Sun, 10 Jan 2021, Philippe Mathieu-Daud=C3=A9 wrote:

[...]

> > I'm not a PCI expert but my understanding is PCI device functions ar=
e
> > restricted to the PCI bus address space. The host bridge may map thi=
s
> > space within the host.
> >
> > QEMU might be using get_system_memory() because for some host bridge=

> > the mapping is not implemented so it was easier this way?
>=20
> Maybe, also one less indirection which if not really needed is a good=20=

> thing for performance so unless it's found to be needed to use another=
=20
> address space here I'm happy with this as it matches what other simila=
r=20
> devices do and it seems to work. Maybe a separate address space is onl=
y=20
> really needed if we have an iommu?

Hi Zoltan,

It is possible for bonito to remap PCI address space so maybe it's essen=
tial for bonito.

Appreciate for your work. I'm going to help with reviewing as well.

>=20
> Regards,
> BALATON Zoltan

--=20
- Jiaxun

