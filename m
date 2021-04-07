Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFCD356219
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 05:49:21 +0200 (CEST)
Received: from localhost ([::1]:41902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTzBw-0008VG-7U
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 23:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1lTzBA-00085E-Dd
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 23:48:32 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:57263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1lTzB8-0006p9-Bm
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 23:48:32 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7C74E138E;
 Tue,  6 Apr 2021 23:48:27 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute6.internal (MEProxy); Tue, 06 Apr 2021 23:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=qlD4T
 8wg+Q3nYdZoolz4GaixXF8HsLa88JE+Z5P06dQ=; b=TFnN1V6wZRN9rf+7WN97o
 ghB++P3RObl5eZAH9ded29yZNQWeT0KoMKaZSfZAkZGoi3an8W6vDdu0MU9+GY6F
 fBhu8EM05iFLsObX9gBOdhvFtcFPcXdZI1LqVQDw57eXQ1+qob3kYmmv/0ZLmuZJ
 /H4D29Utk5gsxMKqmfnudQSAC9h+UkIaYCuNRmMd2ZCEfSM5zyuMFL3oTz5AJmo9
 0vVpVw037tjYnQ5mXj2c4Iv1+u+Cq5SmsRbtnsOiSlvAaE20+7oRx//BP1GcsDAh
 OLsnUE1Ll1Wj9QfBS6/j+zqX1hF7ZSjAZVcUs223AY5uCilTPZvMJFWgoGyzxgiS
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=qlD4T8wg+Q3nYdZoolz4GaixXF8HsLa88JE+Z5P06
 dQ=; b=P+qKTU9QK0agvWtAZYcs2nKHZ3avzhiCE8HlIJjE2QChLtfPrNh/tZLWn
 aE5CAxId5dLA/XAFEFqn7dUuxXv/fAUXg3a4JDkAPd9vQ2Xq/jciv2oXFtOz9+sH
 o0CyAJbPKRyAWrQuXrdM9j/t19jDVpj/H/F+6IMJMtVMlp3iQCEBYDkh+gt9wr5T
 mAr57yKlZcFkeVjUSej0mdlKU+1rubmq0B31zOz4tMlRrIXSR1xycu28OtCmEt6/
 xBPPtV15fZQ4u4/ngmozjHGq8UVup+FUEgOUP7k2NK0SFxjF5AIpGrQmFMBhv+Ez
 b7btl5HX3Ao1j2/lIBUdOKKMrSRyA==
X-ME-Sender: <xms:iittYDAsdyts-6CM1pKwAAi4OHhUiKe4S-NaV2zBHQzIMYXlF7Ztyg>
 <xme:iittYJgMpzc9u_SVgTxtw7mHP_zVadjLXkgRz-Cjg07SxynN08Em1b0BcgTCgro1Q
 fZZL_zFRQjlDPdDjsc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejiedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
 rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
 eqnecuggftrfgrthhtvghrnhepudekgfelleegieetfeehffejuefguddtvdejheevhfeh
 jedufeelvedtkefhvdejnecuffhomhgrihhnpehmrghilhdqrghrtghhihhvvgdrtghomh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
 gihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:iittYOlE8Sr3ucmTaZ1R69ytu4pEbvLZ7FlwK33j6gQS6fb4IBStig>
 <xmx:iittYFwZU-aKwe_s-DR6T0P8AzdS-PixFK-m7X11evD6kVrBKZtBgw>
 <xmx:iittYIQ4Ph8jo8xIS6BkZxFLsSbnSnQEFKjfSVG8pHFhaIESMSlmJg>
 <xmx:iyttYDJ0GTcd8QsgjnDSPQ9HptsKw928Us_sYNmDPDE-33pEvc6hHA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 544D11300062; Tue,  6 Apr 2021 23:48:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <aee9e99d-2cae-483d-9117-7a97e0d153b5@www.fastmail.com>
In-Reply-To: <87mtubwnsq.fsf@linaro.org>
References: <87mtubwnsq.fsf@linaro.org>
Date: Wed, 07 Apr 2021 11:47:58 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Huacai Chen" <chenhuacai@kernel.org>
Subject: Re: Could we document exact steps for loongson3-virt in the manual?
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.24;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, Apr 6, 2021, at 9:06 PM, Alex Benn=C3=A9e wrote:
> Hi,
>=20
> I was trying to bootstrap a Loongson3 Debian image but ran into some
> roadblocks. Philippe pointed me at:
>=20
>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg768848.html
>=20
> which gives a bit of detail but elides over details such as how to
> handle block devices. AFAICT it should support virtio-blk although may=
be
> Debian bullseye doesn't support the target, it's hard to say:
>=20
>   ./qemu-system-mips64el -M loongson3-virt -m 4096 -nographic -blockde=
v=20
> driver=3Draw,node-name=3Dhd0,discard=3Dunmap,file.driver=3Dhost_device=
,file.filename=3D/dev/zvol/hackpool-0/debian-bullseye-mips64le -device v=
irtio-blk,drive=3Dhd0 -kernel ./vmlinuz-5.9.0-4-loongson-3 -initrd initr=
d.gz -append "root=3D/dev/sda1 console=3Dtty0 nokaslr"

missing console=3DttyS0,115200 in cmdline.


>=20
> Gets as far as:
>=20
> [    0.008641] printk: console [tty0] enabled
> [    0.009507] printk: bootconsole [early0] disabled
>=20
> and then just goes silent. It would be nice if we could add enough
> detail to the appropriate target-mips.rst to:
>=20
>  - give guidance on the best model to use for general purpose distros
>  - describe a common command line for such
>  - detail bootstraping a modern kernel
>=20
> In the ARM section there is a nice "Choosing a board model" which
> discusses what you want (probably "virt") and then we have varying
> levels of detail for the various myriad zoo of ARM machines that are
> emulated. I recently added sections to the versatile and vexpress
> sections after going through similar pain trying to get those up and
> running.

I=E2=80=99ll take a look.

Thanks!


>=20
> --=20
> Alex Benn=C3=A9e
>

--=20
- Jiaxun

