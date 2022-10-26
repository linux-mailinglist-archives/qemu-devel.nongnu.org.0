Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734EB60EAEA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 23:42:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ono8x-0003NL-KH; Wed, 26 Oct 2022 17:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ono8t-0003Gg-71; Wed, 26 Oct 2022 17:40:56 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ono8b-0005hI-B9; Wed, 26 Oct 2022 17:40:53 -0400
Received: by mail-oi1-x229.google.com with SMTP id s206so7140778oie.3;
 Wed, 26 Oct 2022 14:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aIeTbCJ5qauqBL994Qxhvrh3XYky0hVe7kwCv+fnhBc=;
 b=i8xvBj8arJ/T1sDH9hVSALD5v74vAH9/Bjn2nyW7I/fFmb81QSATXXAXTYuMhdBsro
 dD1pUO/KHTT8nYAdRggjnEMCqTryv857qRAaZYUFU+2ZFL7QrDZHdaIgOZRV6pdYJOfy
 7f3a0YByF1MGzO0VR+jHvdIgHaHJrFVCFktTeJnZ+7ti4ljoc74zuCVLb9OT2wzX0hlo
 3fVLmXGUmI2dUTyCIH3xIyriKWnZCG/FBUIhXrY2doijl91VYZ1klNpzkWAzNNhpl9Ai
 fMu+fOQmuXLcTSmOGiVQOEiRe6aYabSwHmAMC4KwAvN5sWD9UtTB/ms2haViora+WsJI
 EIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aIeTbCJ5qauqBL994Qxhvrh3XYky0hVe7kwCv+fnhBc=;
 b=XXzI3Y1LcqXEFccSPRXs0nbDWx+ln1lWWRLdfy79v+megQgvWweRmbKlFHAoQJpL1u
 w39hEOg92VrMeBCaadbCpLQJPWz9dQlzE0j6do484bs29URxXFCpQoIKxZ3etQuBdxIY
 4xV272JZsf245QdQ80PFweF5JHNiYIyDBNv7JG++Nmc9B+YO0sZqAVptPat8CnbEpkj9
 RfNfASrop3kzyRFj/IaOpcejEVpqcB+w40WQyZZdfLeY4Kt0YMetKgk85j5yjJUf7thR
 jgXpvXATgpqIty1MVO/0hhOgeAoRw8jn4y1lmZPQ/+thQQFQVcC+voOfts/9fR9eNmLM
 TJDw==
X-Gm-Message-State: ACrzQf3XufbacNtvOhaMYnUnA3Tq787rwHZ3sc7jQ/FpvoieuDciIrG9
 0iDk+5j4pdvwEXgwMHWrXnY=
X-Google-Smtp-Source: AMsMyM7SWwzD1OIONQqUs0L9Uk+aieP0eeslOdhHXwkFHMpDLu4j9kxtMhjF2nlpcl4N6nW96z9QBw==
X-Received: by 2002:a05:6808:208f:b0:354:c47d:6d6a with SMTP id
 s15-20020a056808208f00b00354c47d6d6amr3068098oiw.58.1666820427195; 
 Wed, 26 Oct 2022 14:40:27 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 o8-20020aca4108000000b003544822f725sm2482326oia.8.2022.10.26.14.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 14:40:26 -0700 (PDT)
Message-ID: <0c2db499-d808-2d0f-597d-8241bd5dd618@gmail.com>
Date: Wed, 26 Oct 2022 18:40:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 0/7] ppc/e500: Add support for two types of flash,
 cleanup
To: B <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
References: <20221018210146.193159-1-shentey@gmail.com>
 <7e76dbc2-ff48-1f08-36c3-8eae41591752@gmail.com>
 <ED34EAF0-FBEF-4F71-9479-8EFA41CA31B1@gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <ED34EAF0-FBEF-4F71-9479-8EFA41CA31B1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 10/26/22 16:51, B wrote:
> 
> 
> Am 26. Oktober 2022 17:18:14 UTC schrieb Daniel Henrique Barboza <danielhb413@gmail.com>:
>> Hi,
>>
>> Since this is being sent to qemu-ppc and has to do with e500 I decided to
>> take a look. I acked the e500 related patches, 5 and 7. Patch 6 LGTM as well
>> but I'd rather not ack it it's SD specific code.
>>
>> I'll send a PowerPC pull request this week. I can grab this series via the ppc
>> tree if someone with SD authority acks patch 6.
> 
> This would be awesome. If we can't reach consensus on the eSDHC device until then perhaps you could pull everything but the last two patches?


That's fair enough. Just applied 1-5 to ppc-next.

I'll send a PR most likely Friday. If patch 6 gets an ACK until then I'll
pick 6 and 7 as well.

I'll be offline start of next week so this will be my last PR before the freeze.
If a patch 6 ACK arrives after Friday we'll need the SD maintainers to pick those
in before the freeze. Patch 7 has my ACK so feel free to take it.

> 
> Thanks Daniel for generally absorbing any patches floating around which look remotely useful for the ppc tree. This is rewarding.


Glad I'm able to help!


Daniel

> 
> Best regards,
> Bernhard
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>
>>
>>
>> On 10/18/22 18:01, Bernhard Beschow wrote:
>>> Cover letter:
>>> ~~~~~~~~~~~~~
>>>
>>> This series adds support for -pflash and direct SD card access to the
>>> PPC e500 boards. The idea is to increase compatibility with "real" firmware
>>> images where only the bare minimum of drivers is compiled in.
>>>
>>> The series is structured as follows:
>>>
>>> Patches 1-4 perform some general cleanup which paves the way for the rest of
>>> the series.
>>>
>>> Patch 5 adds -pflash handling where memory-mapped flash can be added on
>>> user's behalf. That is, the flash memory region in the eLBC is only added if
>>> the -pflash argument is supplied. Note that the cfi01 device model becomes
>>> stricter in checking the size of the emulated flash space.
>>>
>>> Patches 6 and 7 add a new device model - the Freescale eSDHC - to the e500
>>> boards which was missing so far.
>>>
>>> User documentation is also added as the new features become available.
>>>
>>> Tesing done:
>>> * `qeu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
>>> "console=ttyS0 rootwait root=/dev/mtdblock0 nokaslr" -drive
>>> if=pflash,file=rootfs.ext2,format=raw`
>>> * `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
>>> "console=ttyS0 rootwait root=/dev/mmcblk0" -device sd-card,drive=mydrive -drive
>>> id=mydrive,if=none,file=rootfs.ext2,format=raw`
>>>
>>> The load was created using latest Buildroot with `make
>>> qemu_ppc_e500mc_defconfig` where the rootfs was configured to be of ext2 type.
>>> In both cases it was possible to log in and explore the root file system.
>>>
>>> v4:
>>> ~~~
>>> Zoltan:
>>> - Don't suggest presence of qemu-system-ppc32 in documentation
>>>
>>> Bin:
>>> - New patch: docs/system/ppc/ppce500: Use qemu-system-ppc64 across the board(s)
>>>
>>> Peter:
>>> - Inline pflash_cfi01_register() rather than modify it (similar to v2)
>>>
>>> v3:
>>> ~~~
>>> Phil:
>>> - Also add power-of-2 fix to pflash_cfi02
>>> - Resolve cfi01-specific assertion in e500 code
>>> - Resolve unused define in eSDHC device model
>>> - Resolve redundant alignment checks in eSDHC device model
>>>
>>> Bin:
>>> - Add dedicated flash chapter to documentation
>>>
>>> Bernhard:
>>> - Use is_power_of_2() instead of ctpop64() for better readability
>>> - Only instantiate eSDHC device model in ppce500 (not used in MPC8544DS)
>>> - Rebase onto gitlab.com/danielhb/qemu/tree/ppc-next
>>>
>>> v2:
>>> ~~~
>>> Bin:
>>> - Add source for MPC8544DS platform bus' memory map in commit message.
>>> - Keep "ESDHC" in comment referring to Linux driver.
>>> - Use "qemu-system-ppc{64|32} in documentation.
>>> - Use g_autofree in device tree code.
>>> - Remove unneeded device tree properties.
>>> - Error out if pflash size doesn't fit into eLBC memory window.
>>> - Remove unused ESDHC defines.
>>> - Define macro ESDHC_WML for register offset with magic constant.
>>> - Fix some whitespace issues when adding eSDHC device to e500.
>>>
>>> Phil:
>>> - Fix tense in commit message.
>>>
>>> Bernhard Beschow (7):
>>>     docs/system/ppc/ppce500: Use qemu-system-ppc64 across the board(s)
>>>     hw/block/pflash_cfi0{1,2}: Error out if device length isn't a power of
>>>       two
>>>     hw/sd/sdhci-internal: Unexport ESDHC defines
>>>     hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
>>>     hw/ppc/e500: Implement pflash handling
>>>     hw/sd/sdhci: Implement Freescale eSDHC device model
>>>     hw/ppc/e500: Add Freescale eSDHC to e500plat
>>>
>>>    docs/system/ppc/ppce500.rst |  38 +++++++-
>>>    hw/block/pflash_cfi01.c     |   8 +-
>>>    hw/block/pflash_cfi02.c     |   5 +
>>>    hw/ppc/Kconfig              |   2 +
>>>    hw/ppc/e500.c               | 114 +++++++++++++++++++++-
>>>    hw/ppc/e500.h               |   1 +
>>>    hw/ppc/e500plat.c           |   1 +
>>>    hw/sd/sdhci-internal.h      |  20 ----
>>>    hw/sd/sdhci.c               | 183 +++++++++++++++++++++++++++++++-----
>>>    include/hw/sd/sdhci.h       |   3 +
>>>    10 files changed, 324 insertions(+), 51 deletions(-)
>>>

