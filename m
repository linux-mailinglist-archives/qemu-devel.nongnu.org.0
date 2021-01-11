Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73282F0AD2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 02:36:45 +0100 (CET)
Received: from localhost ([::1]:58412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kym8S-0005M3-Gi
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 20:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kym68-0004pa-T1
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 20:34:20 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:48695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kym66-0006IE-Rn
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 20:34:20 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1BFF558059F;
 Sun, 10 Jan 2021 20:34:16 -0500 (EST)
Received: from imap1 ([10.202.2.51])
 by compute6.internal (MEProxy); Sun, 10 Jan 2021 20:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=+Fchs
 mVtK6CFH+E0s0mqCyGdUH/X4oT9wbxoPT3e5z4=; b=Ss/OneWNIMHOguezkcsT1
 R8mqJBPaP1kTBiIT9JPeQIHA2YYAL3htUp7tcyKHLRbeF2fEEHlYujrR/BTysrPz
 80BxLk81o2LcuGphjR97h7Lec8LzFSHAZx0bjCTskGsptZs0QL5WaV+8BJAF+Mqh
 hKRg/5Mg2ezbeOl8LTqLNWcU6wFsIBqdLnLPAAjp/VS3LpkSEHgyOKWSMObVqVgH
 qAiixGd5/+rl1QNaTJZ+g7FuNHS9kLRPvTk0TPCpOjt3C+3NLe9RdV64/gwF581v
 M2HbJHXYwSnxHJ3EHzK7DW57B9MnmeWBgaREm4XawKl3e6UQWjumkJ+bbqJbtevq
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=+FchsmVtK6CFH+E0s0mqCyGdUH/X4oT9wbxoPT3e5
 z4=; b=ZGrCgi6w4sV73lxPoHBhIARnkuCAqEUw9NoR8zyvjQiuLRpxfzYFPSF/f
 TM2pZLh2Sj9ALy1qT3iNyLfDupwtKZj5ijS0S7Fv0kfW8b5ijOsW59LtHk2NKga8
 CzGtmTv8atzpH+LJqx1KNFtaeGTA2G4pEBdSBPrc47Taa83VC23+0HhQDtoX9GBH
 8cQk/celAzLWTnhefOXBAEOOz64nmORM5zRiMcEHVEpJgOo9FrUfmnA3k/jjhABc
 uvBaFl/f8coOU0dSd1cW/9EH7wq1mjH4iDw6K4EtK+fqexXvBIQcR/GXIleX5aFL
 cFrFS6HnoMvb1Ep2IzOIrRR7nyBfw==
X-ME-Sender: <xms:Fqv7X39rF3IbIJY2HGIEclD9VBNfP19grea5FQAB8L53L8KIHogtPw>
 <xme:Fqv7Xzv7liFjJ3F-CqI1g9rc0_J5bq3DHtiOtsa27Sj7L10uc_mtD2OQsh58KeX9T
 yFzOCES2VlYrMbGACA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehtddgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
 rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeetgeekveeftefhgfduheegvdeuuddvieefvddvlefh
 feehkeetfeeukedtfeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Fqv7X1BSxK7vm6m6SruBWb3-81sHKGbl-3d4UQWmpssukD3GkI_7Uw>
 <xmx:Fqv7XzdYLlJk97rYkac2etzthAsXdQxkZ7UTlOIr48smNgIfcngSPA>
 <xmx:Fqv7X8O99OExNDm5984EWOARKY8ox7ZWvjlFHe-2aCUWwWj9EB-x_g>
 <xmx:F6v7X1agYmmLb9L9eWs5lzR433Ccf6VFDBFvswO0zo3kJ05zw0cK5A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3885DC200A5; Sun, 10 Jan 2021 20:34:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-45-g4839256-fm-20210104.001-g48392560
Mime-Version: 1.0
Message-Id: <3f383a52-6583-4c60-8f24-a24e6b95c068@www.fastmail.com>
In-Reply-To: <CAAhV-H71-wrTfDWN9zH2gU4gdJkCpMk5EDfAi1W1d4jXA3OkZg@mail.gmail.com>
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <20210103205021.2837760-24-f4bug@amsat.org>
 <CAFEAcA_YqAiiLRY08-gACmKOCf2mat3AaBGnyRK0Jc+aK-iuOw@mail.gmail.com>
 <b2dd6d33-d8e9-21a3-7b76-bdf44e117128@amsat.org>
 <3aece87-60ff-b195-8bd-c696bf461cb6@eik.bme.hu>
 <CAAhV-H71-wrTfDWN9zH2gU4gdJkCpMk5EDfAi1W1d4jXA3OkZg@mail.gmail.com>
Date: Mon, 11 Jan 2021 09:33:51 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Huacai Chen" <chenhuacai@kernel.org>,
 "BALATON Zoltan" <balaton@eik.bme.hu>
Subject: Re: [PULL 23/35] hw/intc: Rework Loongson LIOINTC
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 BALATON Zoltan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, Jan 11, 2021, at 8:36 AM, Huacai Chen wrote:
> I think R_END should be 0x60, Jiaxun, what do you think?

U r right.
The manual is misleading.

Thanks.

- Jiaxun

>=20
> Huacai
>=20
> On Mon, Jan 11, 2021 at 5:51 AM BALATON Zoltan <balaton@eik.bme.hu> wr=
ote:
> >
> > On Sun, 10 Jan 2021, Philippe Mathieu-Daud=C3=A9 wrote:
> > > Hi Peter, Huacai,
> > >
> > > On 1/10/21 8:49 PM, Peter Maydell wrote:
> > >> On Sun, 3 Jan 2021 at 21:11, Philippe Mathieu-Daud=C3=A9 <f4bug@a=
msat.org> wrote:
> > >>>
> > >>> From: Huacai Chen <chenhuacai@kernel.org>
> > >>>
> > >>> As suggested by Philippe Mathieu-Daud=C3=A9, rework Loongson's l=
iointc:
> > >>> 1, Move macro definitions to loongson_liointc.h;
> > >>> 2, Remove magic values and use macros instead;
> > >>> 3, Replace dead D() code by trace events.
> > >>>
> > >>> Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > >>> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> > >>> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > >>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > >>> Message-Id: <20201221110538.3186646-2-chenhuacai@kernel.org>
> > >>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > >>> ---
> > >>>  include/hw/intc/loongson_liointc.h | 22 ++++++++++++++++++
> > >>>  hw/intc/loongson_liointc.c         | 36 +++++++++++++----------=
-------
> > >>>  2 files changed, 38 insertions(+), 20 deletions(-)
> > >>>  create mode 100644 include/hw/intc/loongson_liointc.h
> > >>
> > >> Hi; Coverity complains about a possible array overrun
> > >> in this commit:
> > >>
> > >>
> > >>> @@ -40,13 +39,10 @@
> > >>>  #define R_IEN                   0x24
> > >>>  #define R_IEN_SET               0x28
> > >>>  #define R_IEN_CLR               0x2c
> > >>> -#define R_PERCORE_ISR(x)        (0x40 + 0x8 * x)
> > >>> +#define R_ISR_SIZE              0x8
> > >>> +#define R_START                 0x40
> > >>>  #define R_END                   0x64
> > >>>
> > >>> -#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
> > >>> -DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOI=
NTC,
> > >>> -                         TYPE_LOONGSON_LIOINTC)
> > >>> -
> > >>>  struct loongson_liointc {
> > >>>      SysBusDevice parent_obj;
> > >>>
> > >>> @@ -123,14 +119,13 @@ liointc_read(void *opaque, hwaddr addr, un=
signed int size)
> > >>>          goto out;
> > >>>      }
> > >>>
> > >>> -    /* Rest is 4 byte */
> > >>> +    /* Rest are 4 bytes */
> > >>>      if (size !=3D 4 || (addr % 4)) {
> > >>>          goto out;
> > >>>      }
> > >>>
> >
> > Expanding macros in the following:
> >
> > >>> -    if (addr >=3D R_PERCORE_ISR(0) &&
> > >>> -        addr < R_PERCORE_ISR(NUM_CORES)) {
> > >>> -        int core =3D (addr - R_PERCORE_ISR(0)) / 8;
> >
> > if (addr >=3D (0x40 + 0x8 * 0) && addr < (0x40 + 0x8 * 4))
> > ->
> > if (addr >=3D 0x40 && addr < 0x60)
> > int core =3D (addr - 0x40) / 8;
> >
> >
> > >>> +    if (addr >=3D R_START && addr < R_END) {
> > >>> +        int core =3D (addr - R_START) / R_ISR_SIZE;
> >
> > if (addr >=3D 0x40 && addr < 0x64)
> > int core =3D (addr - 0x40) / 0x8;
> >
> > R_END seems to be off by 4 in the above. Should it be 0x60?
> >
> > Regards,
> > BALATON Zoltan
> >
> > >> R_END is 0x64 and R_START is 0x40, so if addr is 0x60
> > >> then addr - R_START is 0x32 and so core here is 4.
> > >> However p->per_core_isr[] only has 4 entries, so this will
> > >> be off the end of the array.
> > >>
> > >> This is CID 1438965.
> > >>
> > >>>          r =3D p->per_core_isr[core];
> > >>>          goto out;
> > >>>      }
> > >>
> > >>> -    if (addr >=3D R_PERCORE_ISR(0) &&
> > >>> -        addr < R_PERCORE_ISR(NUM_CORES)) {
> > >>> -        int core =3D (addr - R_PERCORE_ISR(0)) / 8;
> > >>> +    if (addr >=3D R_START && addr < R_END) {
> > >>> +        int core =3D (addr - R_START) / R_ISR_SIZE;
> > >>>          p->per_core_isr[core] =3D value;
> > >>>          goto out;
> > >>>      }
> > >>
> > >> Same thing here, CID 1438967.
> > >
> > > Thanks Peter.
> > >
> > > Huacai, can you have a look please?
> > >
> > > Thanks,
> > >
> > > Phil.
> > >
> > >
>

--=20
- Jiaxun

