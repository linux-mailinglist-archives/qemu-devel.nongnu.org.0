Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3D065D22B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 13:15:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD2ek-0002cf-52; Wed, 04 Jan 2023 07:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD2eh-0002c2-Pj
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:14:03 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD2ef-0005L6-M5
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:14:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id ay40so25431665wmb.2
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 04:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tp0OYuN+hFp93UNubvtXVhop92O4XSYXyFAqRN3asxg=;
 b=bUjggjXm/ZKd2AdcPuoyYtGHQkJlJsoQhispfOfu6iis4HsJgusAR6+OaYyUeOFW/C
 ZXSbcyXa9RNXynpta1alP+kbX7N8M/3V2pAioMbthnKQc0qd/JUjpPLtFoBAjuRnSKdr
 qsihK5gCrYrl1NtVf98bO7tXADzeAw42JsNFo0K4SyG0NuS/ho3OSZs4h1bQNPsC2X3J
 ZH4dOO8tzOHxo0/3eVhOlr4y8Rvo87UoJIwsxwv55ykT53pD1pGl5CYdvgcKDBfSXO1D
 ZcJkLbeBpOHsl3EE/hYpAJWXISJ3cVGD+lZG7pr8Kt5bMq7ftvzQS9Bg6EM3uZYdz9yu
 794w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tp0OYuN+hFp93UNubvtXVhop92O4XSYXyFAqRN3asxg=;
 b=H/+yy0eNvIBsIn6a00NJnyLKMWJ0TohDZUCoxYiN7IsADoxOsc95BjXa3HJeTpfNkE
 iwXqpkT0Db43LcuDEP7vNdsH3QlaflPJDYQT8mhDJ4L9Te6mncnK/gu8jdByXPX1i47x
 hgjudf7gSZH5mn/vn2oao+fTs1IvG2zH5ETIhZFudVSLKeBf5d1HSmjiwHr209O9f5CN
 NP5L8LoHtNRsDpTF83Ss+N2BRSBhGegPqyr5df7PbfD6nBWX2rV4ms6caExrGAeya6IF
 2+2wLLdbxbEKeFXTukPdLc3aG+x73xq4FaVgawGNle/Ly1sYcWAwSZu+jFtL53F2/6Wv
 onrA==
X-Gm-Message-State: AFqh2koBtnIPZnGRE19RmgdxBV3q1JJjlwQBjZtobdtt6SWPAW+lyU7v
 DkJUKkLsGygZqwwOVjITQqU=
X-Google-Smtp-Source: AMrXdXsxsodApwN0IFQ7MnSFd/e8HkT0U6Gmn6hEN4OSkztIw+emGuCdlBq9EcIRLyPspNRRIEuLBA==
X-Received: by 2002:a05:600c:5c8:b0:3d1:4145:b3b with SMTP id
 p8-20020a05600c05c800b003d141450b3bmr34663011wmd.9.1672834440070; 
 Wed, 04 Jan 2023 04:14:00 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20064d0d42b6b29c193.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:64d0:d42b:6b29:c193])
 by smtp.gmail.com with ESMTPSA id
 bg24-20020a05600c3c9800b003cfa3a12660sm2320766wmb.1.2023.01.04.04.13.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 04:13:59 -0800 (PST)
Date: Wed, 04 Jan 2023 12:13:54 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Chuck Zmudzinski <brchuckz@aol.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, 
 xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <aed4f2c1-83f7-163a-fb44-f284376668dc@aol.com>
References: <20230102213504.14646-1-shentey@gmail.com>
 <bd4daee7-09df-4bfa-3b96-713690be9f4e@aol.com>
 <0de699a7-98b8-e320-da4d-678d0f594213@linaro.org>
 <CAG4p6K7hcJ-47GvsEvmuBmdwP2LsEC4WLkw_t6ZfwhqakYUEyQ@mail.gmail.com>
 <aed4f2c1-83f7-163a-fb44-f284376668dc@aol.com>
Message-ID: <AB058B2A-406E-487B-A1BA-74416C310B7A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



Am 4=2E Januar 2023 08:18:59 UTC schrieb Chuck Zmudzinski <brchuckz@aol=2E=
com>:
>On 1/3/2023 8:38 AM, Bernhard Beschow wrote:
>>
>>
>> On Tue, Jan 3, 2023 at 2:17 PM Philippe Mathieu-Daud=C3=A9 <philmd@lina=
ro=2Eorg> wrote:
>>
>>     Hi Chuck,
>>
>>     On 3/1/23 04:15, Chuck Zmudzinski wrote:
>>     > On 1/2/23 4:34=E2=80=AFPM, Bernhard Beschow wrote:
>>     >> This series first renders TYPE_PIIX3_XEN_DEVICE redundant and fi=
nally removes
>>     >> it=2E The motivation is to 1/ decouple PIIX from Xen and 2/ to m=
ake Xen in the PC
>>     >> machine agnostic to the precise southbridge being used=2E 2/ wil=
l become
>>     >> particularily interesting once PIIX4 becomes usable in the PC ma=
chine, avoiding
>>     >> the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>>     >>
>>     >> Testing done:
>>     >> None, because I don't know how to conduct this properly :(
>>     >>
>>     >> Based-on: <20221221170003=2E2929-1-shentey@gmail=2Ecom>
>>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "[PATCH v4 00/30] Conso=
lidate PIIX south bridges"
>>
>>     This series is based on a previous series:
>>     https://lore=2Ekernel=2Eorg/qemu-devel/20221221170003=2E2929-1-shen=
tey@gmail=2Ecom/
>>     (which itself also is)=2E
>>
>>     >> Bernhard Beschow (6):
>>     >>=C2=A0 =C2=A0 include/hw/xen/xen: Make xen_piix3_set_irq() generi=
c and rename it
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Reuse piix3_realize() in piix3_xen_rea=
lize()
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Wire up Xen PCI IRQ handling outside o=
f PIIX3
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Avoid Xen-specific variant of piix_wri=
te_config()
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Resolve redundant k->config_write assi=
gnments
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVIC=
E
>>     >>
>>     >>=C2=A0 =C2=A0hw/i386/pc_piix=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 34 ++++++++++++++++--
>>     >>=C2=A0 =C2=A0hw/i386/xen/xen-hvm=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 9 +++--
>>     >>=C2=A0 =C2=A0hw/isa/piix=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 66 +----------------------------------
>>     >
>>     > This file does not exist on the Qemu master branch=2E
>>     > But hw/isa/piix3=2Ec and hw/isa/piix4=2Ec do exist=2E
>>     >
>>     > I tried renaming it from piix=2Ec to piix3=2Ec in the patch, but
>>     > the patch set still does not apply cleanly on my tree=2E
>>     >
>>     > Is this patch set re-based against something other than
>>     > the current master Qemu branch?
>>     >
>>     > I have a system that is suitable for testing this patch set, but
>>     > I need guidance on how to apply it to the Qemu source tree=2E
>>
>>     You can ask Bernhard to publish a branch with the full work,
>>
>>
>> Hi Chuck,
>>
>> =2E=2E=2E or just visit https://patchew=2Eorg/QEMU/20230102213504=2E146=
46-1-shentey@gmail=2Ecom/ =2E There you'll find a git tag with a complete h=
istory and all instructions!
>>
>> Thanks for giving my series a test ride!
>>
>> Best regards,
>> Bernhard
>>
>>     or apply each series locally=2E I use the b4 tool for that:
>>     https://b4=2Edocs=2Ekernel=2Eorg/en/latest/installing=2Ehtml
>>
>>     i=2Ee=2E:
>>
>>     $ git checkout -b shentey_work
>>     $ b4 am 20221120150550=2E63059-1-shentey@gmail=2Ecom
>>     $ git am
>>     =2E/v2_20221120_shentey_decouple_intx_to_lnkx_routing_from_south_br=
idges=2Embx
>>     $ b4 am 20221221170003=2E2929-1-shentey@gmail=2Ecom
>>     $ git am
>>     =2E/v4_20221221_shentey_this_series_consolidates_the_implementation=
s_of_the_piix3_and_piix4_south=2Embx
>>     $ b4 am 20230102213504=2E14646-1-shentey@gmail=2Ecom
>>     $ git am =2E/20230102_shentey_resolve_type_piix3_xen_device=2Embx
>>
>>     Now the branch 'shentey_work' contains all the patches and you can =
test=2E
>>
>>     Regards,
>>
>>     Phil=2E
>>
>
>Hi Phil and Bernard,
>
>I tried applying these 3 patch series on top of the current qemu
>master branch=2E
>
>Unfortunately, I saw a regression, so I can't give a tested-by tag yet=2E

Hi Chuck,

Thanks for your valuable test report! I think the culprit may be commit ht=
tps://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2023-01/msg00102=2Ehtml =
where now 128 PIRQs are considered rather than four=2E I'll revisit my seri=
es and will prepare a v2 in the next days=2E I think there is no need for f=
urther testing v1=2E

Thanks,
Bernhard

>
>Here are the details of the testing I did so far:
>
>Xen only needs one target, the i386-softmmu target which creates
>the qemu-system-i386 binary that Xen uses for its device model=2E
>That target compiled and linked with no problems with these 3
>patch series applied on top of qemu master=2E I didn't try building
>any other targets=2E
>
>My tests used the xenfv machine type with the xen platform
>pci device, which is ordinarily called a xen hvm guest with xen
>paravirtualized network and block device drivers=2E It is based on the
>i440fx machine type and so emulates piix3=2E I tested the xen
>hvm guests with two different configurations as described below=2E
>
>I tested both Linux and Windows guests, with mixed results=2E With the
>current Qemu master (commit 222059a0fccf4 without the 3 patch
>series applied), all tested guest configurations work normally for both
>Linux and Windows guests=2E
>
>With these 3 patch series applied on top of the qemu master branch,
>which tries to consolidate piix3 and piix4 and resolve the xen piix3
>device that my guests use, I unfortunately got a regression=2E
>
>The regression occurred with a configuration that uses the qemu
>bochs stdvga graphics device with a vnc display, and the qemu
>usb-tablet device to emulate the mouse and keyboard=2E After applying
>the 3 patch series, the emulated mouse is not working at all for Linux
>guests=2E It works for Windows guests, but the mouse pointer in the
>guest does not follow the mouse pointer in the vnc window as closely
>as it does without the 3 patch series=2E So this is the bad news of a
>regression introduced somewhere in these 3 patch series=2E
>
>The good news is that by using guests in a configuration that does
>not use the qemu usb-tablet device or the bochs stdvga device but
>instead uses a real passed through usb3 controller with a real usb
>mouse and a real usb keyboard connected, and also the real sound
>card and vga device passed through and a 1920x1080 HDMI monitor,
>there is no regression introduced by the 3 patch series and both Linux
>and Windows guests in that configuration work perfectly=2E
>
>My next test will be to test Bernhard's published git tag without
>trying to merge the 3 patch series into master and see if that also
>has the regression=2E I also will double check that I didn't make
>any mistakes in merging the 3 patch series by creating the shentey_work
>branch with b4 and git as Phil described and compare that to my
>working tree=2E
>
>I also will try testing only the first series, then the first series and =
the
>second series, to try to determine in which of the 3 series the regressio=
n
>is introduced=2E
>
>Best regards,
>
>Chuck

