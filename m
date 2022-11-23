Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284546363C0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:31:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxrhv-0001rw-LH; Wed, 23 Nov 2022 10:30:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oxrhk-0001rg-Cu
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:30:28 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oxrhh-0000W8-B7
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:30:27 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 56470320091D;
 Wed, 23 Nov 2022 10:30:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 23 Nov 2022 10:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217422; x=
 1669303822; bh=Ik7Of3Wq65LH0/62tgCVmwo0WmVUDdMc+WWftd1xfGA=; b=B
 rTMbDFA3fGaes0xFyjGK7ZCPf2eeWo5vbaCAxmfA2ineaiD9apV6NRCu2OB2vXFj
 g6QEd2+kV41u/9KzpUrsfmNso3Exo4wDl4jJVWY5AsZyowpxkJoctBsPO5k2o3vG
 OTN6U1hhimCSoguuhm0fAYaMEyxtoYIkVqlrzN87ieb/ecuCYI/cKV6BfNwnrgnS
 AmXuJ/gYj3K/FhfTzxhyjwufiBGH8t4ENwBwKuAQACqZDOPyoQIDsnJ0maKB6ZjF
 JeOwkyuICZ7XkBTBacISvulI3CExUTA595upcSONaFcXiFE6hgj6+blK7iumcjP2
 u3cS1Fcc/qbxMfr3eB22Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217422; x=
 1669303822; bh=Ik7Of3Wq65LH0/62tgCVmwo0WmVUDdMc+WWftd1xfGA=; b=k
 x3laT0gtB1IOuEqxemCyCSn29VPjuSXfaFk/6PaaOfSQ/EA0shewpj2BKnE4eNBx
 CpGxyGXxUyO7Dm0BMTmbch7f4iXCsDc1JymVgPFAnM9mG4NhXDAxPS5Fbbe0yx6U
 JSz3Oa7ybs1KX5EN3Yq8mZQWzQMc+mIeuQgCUHOsS3UppYB8zVyRYVGbjuaMehgL
 urKaszfB4ySGk+JsOOSxO2//WUeqgYSKPau9sMhFS6mO9kkxUNIt1dnfE8CuJC2g
 5AvYZWhAaSUM9J4gAp3V5Lw/U05sVI8ooLzHPzVGQI+nFIeXpN6SDCVsYcCWY1hi
 uHLbgT9ORLzK5CR2LuIkw==
X-ME-Sender: <xms:jjx-Yxtyia_L11DIwcytbH6UPX93dmV4KLu1UgniqjV09qTFCF6a8A>
 <xme:jjx-Y6fz4xwAntOeZ5I123S9rgFs3ILRcIs6ZjtY9UtxiN9kOxgZOzhrzAs7-oKdW
 b9Cj2H_EftB-giBC60>
X-ME-Received: <xmr:jjx-Y0wgS4GN_RZml0iuYtv5Y6ec2nUVa5rxu9shjJJ3l3RjIkutFCiiCnO4KtzC1Xmf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpefhudeugeeuhfeugfehveeftddtudejffejueejheehgedttdet
 ffejfeelieduleenucffohhmrghinhepmhhiphhsrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
 hihgohgrthdrtghomh
X-ME-Proxy: <xmx:jjx-Y4N09H75578ixsZqKncBAD3Z37ASF5hFVv1CCpnEniVFjd25jA>
 <xmx:jjx-Yx8Sy-0lUi1do6RiTVOvPIcMZLPDE65vUO-anQOdIZUD96nLTQ>
 <xmx:jjx-Y4UtOcmizKk4j0G91t7N4dUTJcWWdb0vy-nnKvDdCJGrsFddSg>
 <xmx:jjx-Y9ZdQVLtdIMSDtXExlGD7CQyLtxoJr7p6jOSatItG4WKdHGFpQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:30:21 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH v2 2/3] hw/mips/malta: Set PIIX4 IRQ routes in embedded
 bootloader
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <0de95136-0683-75e2-3191-1686b7ad6d60@eik.bme.hu>
Date: Wed, 23 Nov 2022 15:30:10 +0000
Cc: Bernhard Beschow <shentey@gmail.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan via <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?utf-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9F104ADA-7B1D-4FFC-A6C8-1E0A88485D3E@flygoat.com>
References: <20221027204720.33611-1-philmd@linaro.org>
 <20221027204720.33611-3-philmd@linaro.org>
 <9F566248-59DA-46E2-BD56-5DB98E9DB446@gmail.com>
 <29561bcc-a8d2-639a-8662-cf15fbeb5928@linaro.org>
 <B64DB06E-A125-47E7-9E11-828A763AD590@gmail.com>
 <0de95136-0683-75e2-3191-1686b7ad6d60@eik.bme.hu>
To: BALATON Zoltan <balaton@eik.bme.hu>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
Received-SPF: pass client-ip=64.147.123.19;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> 2022=E5=B9=B411=E6=9C=8822=E6=97=A5 12:37=EF=BC=8CBALATON Zoltan =
<balaton@eik.bme.hu> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hello,
>=20
> On Mon, 21 Nov 2022, Bernhard Beschow wrote:
>> Am 21. November 2022 22:43:50 UTC schrieb "Philippe Mathieu-Daud=C3=A9"=
 <philmd@linaro.org>:
>>> On 21/11/22 16:34, Bernhard Beschow wrote:
>>>> Am 27. Oktober 2022 20:47:19 UTC schrieb "Philippe Mathieu-Daud=C3=A9=
" <philmd@linaro.org>:
>>>>> Linux kernel expects the northbridge & southbridge chipsets
>>>>> configured by the BIOS firmware. We emulate that by writing
>>>>> a tiny bootloader code in write_bootloader().
>>>>>=20
>>>>> Upon introduction in commit 5c2b87e34d ("PIIX4 support"),
>>>>> the PIIX4 configuration space included values specific to
>>>>> the Malta board.
>>>>>=20
>>>>> Set the Malta-specific IRQ routing values in the embedded
>>>>> bootloader, so the next commit can remove the Malta specific
>>>>> bits from the PIIX4 PCI-ISA bridge and make it generic
>>>>> (matching the real hardware).
>>>>>=20
>>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>>>> ---
>>>>> FIXME: Missing the nanoMIPS counter-part!
>>>>=20
>>>> Who will be taking care of this? I have absolutely no clue how the =
write_bootloader functions work, so I don't see how to fix it.
>>>=20
>>> Oh actually I wrote that and tested it but context switched and =
forgot
>>> about it... I'll look back when I get some time, probably around the
>>> release.

I can try to adopt existing boot loader helper functions, just a matter =
of opcodes I think.

>=20
> Unrelated to this but found it while looking at malta.c now: another =
possible clean up is to replace the local generate_eeprom_spd() func =
with spd_data_generate() from hw/i2c/smbus_eeprom.c that other boards =
use already but I did not change malta because I could not test it. If =
you can test malta then it should be an easy change and simplify malta.c =
a bit.
>=20
>>>> Couldn't we just do it like in pegasos2_init() where the registers =
are initialized by QEMU directly if there is no bootloader binary =
configured? I could do that.
>>> I rather mimic bootloaders... maybe a matter of taste?
>=20
> Is that a bootloader or a replacement firmware? To me bootloader is =
some OS specific binary that is loaded by firware to boot an OS. But =
there are OS independent bootloaders like grub so maybe you could =
emulate something like that, I don't know what malta does.

YAMON is a OS-dependent and HW-dependent firmware like u-boot.

>=20
> If there's no firmware binary QEMU should provide something to replace =
it to give the expected environment for the binary loaded by -kernel. In =
case of pegasos2 the init method sets up regs to init devices as done by =
the firmware and the rest is implemented by VOF (loaded from pc-bios) =
that provices the OpenFirmware client interface. The device setup in =
init is needed because VOF does not do that.
>=20
>> I don't mind either way. I meant that I could help with the second =
approach but not with the current one since I have no clue whatsoever =
how it works. There are just too many magic constants that don't make =
any sense to me, and too many layers of indirection, for example.
>=20
> If malta has a replacement firmware for this case maybe it could be =
stored in a binary in pc-bios and loaded from there instead of writing =
it in hex to guest memory. That binary could even be assembled from =
source which should make it simpler to write and change. Or is YAMON =
open source? According to this page it is: =
https://www.mips.com/develop/tools/boot-loaders/ so maybe it could be =
included as a firmware binary instead of being emulated?

Hmm, YAMON was a open source software but I=E2=80=99m unable to find a =
copy of source for Malta board comes with GT chipset that QEMU emulated.
So nowadays we mainly use -kernel feature to do direct kernel boot.

Direct kernel boot is really a brilliant function that I don=E2=80=99t =
want to lose :-)

Thanks
- Jiaxun


>=20
> Regards,
> BALATON Zoltan
>=20
>> Anyway, I'm asking for the current state because I'm pretty much =
ready for posting a v3 of my PIIX consolidation series which now depends =
on this series.
>>=20
>> Best regards,
>> Bernhard
>>=20
>>>=20
>>> Regards,
>>>=20
>>> Phil.
>>=20


