Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745092DEECB
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 13:39:55 +0100 (CET)
Received: from localhost ([::1]:41992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqbWc-0006tM-I2
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 07:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqbV9-0006Ra-BN
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 07:38:23 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:53475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqbV5-0007Lu-04
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 07:38:23 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 1A4CF60E;
 Sat, 19 Dec 2020 07:38:16 -0500 (EST)
Received: from imap1 ([10.202.2.51])
 by compute6.internal (MEProxy); Sat, 19 Dec 2020 07:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=nSGfy
 ll8oJ/HLtxR59BC/5tieR9f195uSH0+/+PBOsI=; b=o3ClACCP4qC32bWaPKhP2
 dJb3VEbW+jN2ybXAysFjK5+puBo6OSUHajL8xhKCjofcjvFBSekzBi8XqBH38bQ1
 2F8rxojT9Y6M5qIDwTi1Fg4WByfbI7/kE/Q8tlxKQNYh+I8f/lmspU0GbzcrlNZY
 VF8egjZXfWcyBSqNpGfaPKY1bXkb6xvw2A5i4P6zfEymgrILSVoR80TgrrTFdfBQ
 fSkFIonQ5vL5hFDOZtOXXxxv4LFFst5l4QyRqDAnGqZ8sKbyinnk+tTWh2I4rCTl
 kXdX3lhjAzL3U+qiQWKtnDhXJE9jxVjwT5sbyd6eslP/cvDkwHvq5qZK2muQS+Fr
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=nSGfyll8oJ/HLtxR59BC/5tieR9f195uSH0+/+PBO
 sI=; b=aByN5zQrUoQp+A4qg22sf7MMZxlUniANIU0fhAD9bSVIhLmMJQEFD2hNK
 KqBjWiBOCHvHUcSy9hLalB/VmPvyeDrtQe1AaOIwBRp3QF2BmJGn3mqcfVO2LLrT
 9cQI2qDPrIQlluI0+PJot2rEdejdBciv1NdMA+wn0vjpnSKvOsBKAddPZlkVgSOv
 SxvwdzI/3ZRUjaY3sKjpNKeZ4a1T74SIK2lWuiN0v+n7AvkN29Vy5BUKtLiTexPp
 heY4kkY2Yb94iSUxmIZq/LrjdE26y8rsbjDBNisZVYhONlpCC/gorYOBpyON4NiD
 qlXBVU6kmqcII4wAg/OeYh6YFxlaA==
X-ME-Sender: <xms:NvTdXx-KzQIs_MEY3OSHRambLgNmASrgVMigYJJxBiv9K96B-vaCww>
 <xme:NvTdX1vFJVqdiyX6wrYOHCWCQrH43UubxTaxUwi3tUGN1eareqjmzNuCJjmGqtcoy
 MKwSbD7BH-VBAI2QwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelkedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
 rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
 eqnecuggftrfgrthhtvghrnhepudfhjeeuheekteeftdeiieegfeduhfdvteetudehleeg
 hedtleefkeetkeekvdfgnecuffhomhgrihhnpehoshgunhdrnhgvthenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:NvTdX_AhqSLx9F5ivlcTSzmF-64jfZdYqZaJLFsFYEdoIZ1hTrhduA>
 <xmx:NvTdX1d_pGSbFx79Cun4WtQ7UK3e-ctSP534rVKiIMxEV1mMMu2J2w>
 <xmx:NvTdX2Mm6rbe4Xo0BbY7qkm7ZLMbbQo50v0HpTeSTDOPZpwafhdZXA>
 <xmx:N_TdX_Z8IMjwo7L3DeKRC32kak-aUR6zed1ThPWPVyCd2tpZVHRltjZEp7RU1DTc>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 282F9C200A5; Sat, 19 Dec 2020 07:38:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <5cb09aab-f425-4faa-969d-9df324768af2@www.fastmail.com>
In-Reply-To: <516bc88e-d49-94f9-b4a2-a9d31e9026@eik.bme.hu>
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <516bc88e-d49-94f9-b4a2-a9d31e9026@eik.bme.hu>
Date: Sat, 19 Dec 2020 20:37:42 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "BALATON Zoltan" <balaton@eik.bme.hu>
Subject: Re: [PATCH v2 0/8] hm/mips/fuloong2e fixes
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: permerror client-ip=64.147.123.27;
 envelope-from=jiaxun.yang@flygoat.com; helo=wnew2-smtp.messagingengine.com
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
Cc: crosa@redhat.com, chenhuacai@kernel.org, qemu-devel@nongnu.org,
 wainersm@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



=E5=9C=A82020=E5=B9=B412=E6=9C=8819=E6=97=A5=E5=8D=81=E4=BA=8C=E6=9C=88 =
=E4=B8=8B=E5=8D=888:13=EF=BC=8CBALATON Zoltan=E5=86=99=E9=81=93=EF=BC=9A=

> On Sat, 19 Dec 2020, Jiaxun Yang wrote:
> > It can now boot Debian installer[1] as well as a custom PMON bootloa=
der
> > distribution[2].
> >
> > Note that it can't boot PMON shipped with actual machine as our ATI =
vgabios
> > is using some x86 hack that can't be handled by x86emu in original P=
MON.
>=20
> This may be similar problem that I've seen with similar PPC firmwares:=

>=20
> https://osdn.net/projects/qmiga/wiki/SubprojectAti
> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2#h3-Known.20iss=
ues
>=20
> TLDR; vgabios-ati.bin is compiled for i386 real mode (bacause that's w=
hat=20
> gcc can do, real x86 real mode would need something like bcc I think) =
that=20
> some x86emu can't handle. You can either use Bochs vga bios via romfil=
e=20
> property of the vga emulation or try the option for x86emu when compil=
ing=20
> vgabios-ati.bin (which did not help the firmwares I've tried).

Hi,

Thinks for your reminder!

To be more specified, our x86emu in PMON can handle i386 real mode,
however vgabios-ati uses INT15h when INT10h ax=3D0x4f01 (Get VESA Mode)
is called. And x86emu won't process INT15h properly.

My workround[1] is to allow 0x4f01 to be failed in PMON, as ax=3D0x4f02
(Set VESA Mode) do work, it won't be a actual problem.


- Jiaxun

