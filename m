Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A8E6CF0FD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:24:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZWG-0003DR-AA; Wed, 29 Mar 2023 13:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phZWE-0003DI-SI
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:23:30 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phZWC-00007O-RB
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:23:30 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 q7-20020a05600c46c700b003ef6e809574so6915827wmo.4
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680110607;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O7YfW7YrbKV4o+rT8gJkqbwTHgK6ANsQ7J+yuArTy9I=;
 b=hUB1mleahVnm+sIk1mp07SUt1DC4tTj2WLFcE5BoQGc37x+aOmSzfP2+Oo0Ws5+XNC
 ahipoRfqBMkF2uMFqgAXXhiYmI7kU4noF5NOIMbsKiv/tYWglBbi0j5QUvNEs2CCwlnr
 pcGgSada0WSlDuwp2FJpIEI86h0xwj+z1RgBhfmQnvx8u1JPzXf71jR3E8WVZsonS3ii
 MP8egw/LwFasG1HiNz9Aqmp+t27smK5grYHQ6c1NeI9dnFDsIuCU/xODN88rf/uCpQiF
 xMjWrcLo5Oni+QGwipqmkANH2Tl0OFXgk97be7ZwjavicKHIBI/l/LV2HClriigEfelH
 R3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110607;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O7YfW7YrbKV4o+rT8gJkqbwTHgK6ANsQ7J+yuArTy9I=;
 b=xgbrPp6ndyQ0ElaxoTjm5nnf1et3DUIIpCvFNUIHPc7Eraj7BWXwfqyFp/91bNqph/
 xxGcxTyloFaVcValH8oMDdXpyXlaT23dFfBLy+/gTOIqF550nb6o3tcYBrTZRKoLXIDi
 D1y6FPjRrB68xo0e32RivntULWl8lM4s+W7pfsrETySRmVEL12jSK9RwK2Z8eFo8tu3/
 XvmUpmk0Smjeukp69EJU9adjRLwPkvCglivUWHp/vkduY2XHJIp9HXnfOX00lq96Mx8E
 PBOfkkh/qHvaLmt+yM68oVhIeur0t/ukogdUho+GAID9VJhw9ugRTHvARc0QgsIDaSbS
 o3fA==
X-Gm-Message-State: AO0yUKWe5xGybb1Ic5rKrP48PJ0EbGcSlf4b3WPmoVjro9xuuYfUx1hq
 YrioYV+8BPkdxo0yaTnBHP3q2A==
X-Google-Smtp-Source: AK7set/aAuTBcCiUsp6jp1M/pNOgjvivqHDqcCYemnd69bnARDJ+Z33InUwgU/JPifwwEMmZEyf02Q==
X-Received: by 2002:a1c:4b07:0:b0:3eb:2b88:a69a with SMTP id
 y7-20020a1c4b07000000b003eb2b88a69amr15708042wma.14.1680110606981; 
 Wed, 29 Mar 2023 10:23:26 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e8-20020adffd08000000b002c592535839sm30625968wrr.17.2023.03.29.10.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 10:23:26 -0700 (PDT)
Message-ID: <cf1deca3-49ef-06a3-0f20-92c25968ae7d@linaro.org>
Date: Wed, 29 Mar 2023 19:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Content-Language: en-US
To: Rob Landley <rob@landley.net>, Nathan Chancellor <nathan@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 balaton@eik.bme.hu, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
 <aa1e6559-55ae-0f7b-80cb-890bb34b9544@linaro.org>
 <20230320165821.GA4064187@dev-arch.thelio-3990X>
 <edea2619-8fe9-638e-cfa0-684123f7ee99@linaro.org>
 <037d00b7-9df9-e888-a4d7-235e6d08f784@landley.net>
 <89504c25-5265-d6c5-6e48-dcdc0be43ea0@linaro.org>
 <0ae35be3-794a-deee-1c96-507d5be2306c@landley.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <0ae35be3-794a-deee-1c96-507d5be2306c@landley.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 29/3/23 18:48, Rob Landley wrote:
> 
> 
> On 3/29/23 11:07, Philippe Mathieu-Daudé wrote:
>> On 29/3/23 18:09, Rob Landley wrote:
>>> On 3/28/23 12:02, Philippe Mathieu-Daudé wrote:
>>>> On 20/3/23 17:58, Nathan Chancellor wrote:
>>>>> On Wed, Mar 08, 2023 at 12:33:38AM +0100, Philippe Mathieu-Daudé wrote:
>>>>>> On 23/2/23 17:19, Jiaxun Yang wrote:
>>>>>>> 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
>>>>>>> MemoryRegionOps") converted CFGADDR/CFGDATA registers to use PCI_HOST_BRIDGE's
>>>>>>> accessor facility and enabled byte swap for both CFGADDR/CFGDATA register.
>>>>>>>
>>>>>>> However CFGADDR as a ISD internal register is not controled by MByteSwap
>>>>>>> bit, it follows endian of all other ISD register, which means it ties to
>>>>>>> little endian.
>>>>>>>
>>>>>>> Move mapping of CFGADDR out of gt64120_update_pci_cfgdata_mapping to disable
>>>>>>> endian-swapping.
>>>>>>>
>>>>>>> This should fix some recent reports about poweroff hang.
>>>>>>>
>>>>>>> Fixes: 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps")
>>>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>>>> ---
>>>>>>>      hw/pci-host/gt64120.c | 18 ++++++------------
>>>>>>>      1 file changed, 6 insertions(+), 12 deletions(-)
>>>>>>
>>>>>> So this works on little-endian hosts, but fails on
>>>>>> big-endian ones :(
>>>>>>
>>>>>> I.e. on Linux we have early_console_write() -> prom_putchar()
>>>>>> looping:
>>>>>>
>>>>>> IN: prom_putchar
>>>>>> 0x8010fab8:  lbu	v0,0(v1)
>>>>>> 0x8010fabc:  andi	v0,v0,0x20
>>>>>> 0x8010fac0:  beqz	v0,0x8010fab8
>>>>>> 0x8010fac4:  andi	v0,a0,0xff
>>>>>>
>>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>>> ...
>>>>>>
>>>>>
>>>>> Is there going to be a new version of this patch or a different solution
>>>>> to the poweroff hang then? I am still seeing that with tip of tree QEMU
>>>>> and I see 8.0.0-rc0 has been tagged; I would hate for this to end up in
>>>>> a release version.
>>>>
>>>> I couldn't work a fix, however I ran our (new) tests on merge
>>>> commit 3db29dcac2 which is before the offending commit 145e2198d749,
>>>> and they fail. So I suppose Malta on big-endian host is badly broken
>>>> since quite some time. Thus clearly nobody tests/runs Malta there.
>>>
>>> I test/run malta with the mips and mipsel binaries at
>>> https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/ but I'm still
>>> locally applying the first patch I saw to fix this (attached) until upstream
>>> sorts itself out.
>>>
>>> Works fine for me. Somebody said it was the wrong fix but I don't remember why...
>>
>> This is a correct /partial/ fix. With this patch, Malta works on little
>> endian hosts. No luck with big-endian hosts, but this was broken
>> previous to 3db29dcac2 rework, so apparently not a big deal ¯\_(ツ)_/¯
> 
> No, big endian worked for me with that patch?
> 
> The build in my $PATH is QEMU emulator version 7.2.50
> (v7.2.0-873-g65cc5ccf06-dirty) with that patch, and if you wget
> https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/mips.tgz and
> ./run-emulator.sh in there, the virtual net can wget http://site (the sample

Oh, we are having some QEMU semantic confusion here...

You are testing a QEMU big-endian *guest* (or "target") in this example.

I presume you are testing on a little-endian *host* (x86_64, aarch64,
ppc64el or mips64el).

> image hasn't got https:// support enabled because I didn't include the build
> dependency), and the virtual disk works (if you do "./run-emulator.sh -hda
> blah.img" anyway, the test wrapper I mentioned creates a squashfs image for it
> to mount)). Without the patch I don't even get a PCI bus. Running "file
> /bin/toybox" says MSB, and the mipsel image is the little endian one anyway. I

Here you describe the little-endian MIPS *target* image.

> also test s390x (which is big endian 64 bit), but I don't think this needed a
> patch? (Hadn't been broken last I checked?)

Here you describe big-endian s390x *target* image.

> 
> I vaguely recall having tested newer qemu, but couldn't say when that was (early
> february at the latest, and if so I didn't install it into /usr/bin/local. It
> takes a while to build all the targets so I only really do it quarterly, usually
> when I'm about to cut a toybox release and want to make sure qemu hasn't broken
> anything important while I wasn't looking...)

Currently, QEMU MIPS (32 and 64-bit) big-endian *targets* regressed
(regardless on the host architecture).

This patch fixes QEMU MIPS (32 and 64-bit) big-endian *targets* on
little-endian *hosts* (x86_64, aarch64, ppc64el or mips64el).

However, QEMU MIPS (32 and 64-bit) big-endian *targets* are still
broken on big-endian *hosts* (s390x, ppc64, mips64, sparc64, ...).
But this was broken previous to commit 3db29dcac2.

I expect if you run your test with QEMU v7.2.0-873-g65cc5ccf06-dirty
on any big-endian *host* (like a s390x), the test fails.

It that clear? Sorry for the confusion...

Phil.

