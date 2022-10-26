Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3E060E9A8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:58:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmRg-0005OJ-Eh; Wed, 26 Oct 2022 15:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1onmRa-0005O1-W8; Wed, 26 Oct 2022 15:52:07 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1onmRY-0007qU-Vw; Wed, 26 Oct 2022 15:52:06 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so2479531wmb.3; 
 Wed, 26 Oct 2022 12:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24VM5vcw6MPj3QQ88UlUsnFdLAtNXIyE97Tj9STBVvw=;
 b=MEv97QqE4Ok2zlLziN1WR8K710o4WT4h1ML8XBIInEtO0loEJda1zfelTGBjHjPTNy
 0RYr96GtfVMAtBzTqaE/+QPfbCCYoQNvQqErGp9TBDACTRRRAydQfzcNqbpVKqjhtBho
 CL7dhJGGjFFvFryiUhS8r8KjCc7XeYRlpF6NUN0HyR0hPFds9BP/WeyOAQpuy2rW8dzq
 oF0Gc5lgKdpYjSbUCGyfn0qMNYmxK1X/603jlQy6Z6g2hr9TgiNlDQNVh7e/JFXT6pP9
 RmPKcwc2FUhyJTAvPi6DhhzRBFl0gVVzKFg7u/1G6SbNQaBOzezn0ZkSSdHrK2gFqhpx
 68eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=24VM5vcw6MPj3QQ88UlUsnFdLAtNXIyE97Tj9STBVvw=;
 b=JqEynadc30W2TU1OxKPqBF+AzEUZG3G9eqmJC27+7Uycv0SlsFLEpVsWgmBB7cR+DY
 4Rh9TC8Me5LSNuH0cqCPL+fSAqLaVrAA/f1DUJAS5sqdOdm9fbP1GX0clqdBjXrtOcaO
 fhA1WZ8GrMmIdrZEhlO4Gf/1NWf6fiwFrC5pUE318hggh2308ED8vA8FbK1PjN+z7TI3
 ZwI9L0eEqJrt16Yf7DGHp3RexpbfdY64dm/Ub46ejCOzLfCImiiUSwpAMt9qcwl3F4sV
 y6zcylM/SLhUrgAyNPm37NJoI7BYvtCoABkyFouD5eddACEIOfSIzEzGx1E0nZLBz+S8
 FhKA==
X-Gm-Message-State: ACrzQf0jd+rv8NpTNRIZGJEV7+NHzuAE3PK4P+wm+Q2W51Qhyq5+8Os6
 aN/jaHlpuLmKe9G/n/DlVbY=
X-Google-Smtp-Source: AMsMyM7/2HZmtsBQ73dEYs6RdvbyXXEGVr1VIFJN98QfaADeLjDOb0CwdE7w1JCybBpXerVwlDQ/yA==
X-Received: by 2002:a1c:f009:0:b0:3b4:9398:49c9 with SMTP id
 a9-20020a1cf009000000b003b4939849c9mr3591896wmb.174.1666813920915; 
 Wed, 26 Oct 2022 12:52:00 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200a5b52e958d7b8718.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:a5b5:2e95:8d7b:8718])
 by smtp.gmail.com with ESMTPSA id
 n11-20020adff08b000000b00228692033dcsm6104271wro.91.2022.10.26.12.52.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Oct 2022 12:52:00 -0700 (PDT)
Date: Wed, 26 Oct 2022 19:51:58 +0000
From: B <shentey@gmail.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>, 
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jan Kiszka <jan.kiszka@web.de>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_0/7=5D_ppc/e500=3A_Add_sup?=
 =?US-ASCII?Q?port_for_two_types_of_flash=2C_cleanup?=
In-Reply-To: <7e76dbc2-ff48-1f08-36c3-8eae41591752@gmail.com>
References: <20221018210146.193159-1-shentey@gmail.com>
 <7e76dbc2-ff48-1f08-36c3-8eae41591752@gmail.com>
Message-ID: <ED34EAF0-FBEF-4F71-9479-8EFA41CA31B1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 26=2E Oktober 2022 17:18:14 UTC schrieb Daniel Henrique Barboza <daniel=
hb413@gmail=2Ecom>:
>Hi,
>
>Since this is being sent to qemu-ppc and has to do with e500 I decided to
>take a look=2E I acked the e500 related patches, 5 and 7=2E Patch 6 LGTM =
as well
>but I'd rather not ack it it's SD specific code=2E
>
>I'll send a PowerPC pull request this week=2E I can grab this series via =
the ppc
>tree if someone with SD authority acks patch 6=2E

This would be awesome=2E If we can't reach consensus on the eSDHC device u=
ntil then perhaps you could pull everything but the last two patches?

Thanks Daniel for generally absorbing any patches floating around which lo=
ok remotely useful for the ppc tree=2E This is rewarding=2E

Best regards,
Bernhard
>
>
>Thanks,
>
>
>Daniel
>
>
>
>
>
>On 10/18/22 18:01, Bernhard Beschow wrote:
>> Cover letter:
>> ~~~~~~~~~~~~~
>>=20
>> This series adds support for -pflash and direct SD card access to the
>> PPC e500 boards=2E The idea is to increase compatibility with "real" fi=
rmware
>> images where only the bare minimum of drivers is compiled in=2E
>>=20
>> The series is structured as follows:
>>=20
>> Patches 1-4 perform some general cleanup which paves the way for the re=
st of
>> the series=2E
>>=20
>> Patch 5 adds -pflash handling where memory-mapped flash can be added on
>> user's behalf=2E That is, the flash memory region in the eLBC is only a=
dded if
>> the -pflash argument is supplied=2E Note that the cfi01 device model be=
comes
>> stricter in checking the size of the emulated flash space=2E
>>=20
>> Patches 6 and 7 add a new device model - the Freescale eSDHC - to the e=
500
>> boards which was missing so far=2E
>>=20
>> User documentation is also added as the new features become available=
=2E
>>=20
>> Tesing done:
>> * `qeu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
>> "console=3DttyS0 rootwait root=3D/dev/mtdblock0 nokaslr" -drive
>> if=3Dpflash,file=3Drootfs=2Eext2,format=3Draw`
>> * `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
>> "console=3DttyS0 rootwait root=3D/dev/mmcblk0" -device sd-card,drive=3D=
mydrive -drive
>> id=3Dmydrive,if=3Dnone,file=3Drootfs=2Eext2,format=3Draw`
>>=20
>> The load was created using latest Buildroot with `make
>> qemu_ppc_e500mc_defconfig` where the rootfs was configured to be of ext=
2 type=2E
>> In both cases it was possible to log in and explore the root file syste=
m=2E
>>=20
>> v4:
>> ~~~
>> Zoltan:
>> - Don't suggest presence of qemu-system-ppc32 in documentation
>>=20
>> Bin:
>> - New patch: docs/system/ppc/ppce500: Use qemu-system-ppc64 across the =
board(s)
>>=20
>> Peter:
>> - Inline pflash_cfi01_register() rather than modify it (similar to v2)
>>=20
>> v3:
>> ~~~
>> Phil:
>> - Also add power-of-2 fix to pflash_cfi02
>> - Resolve cfi01-specific assertion in e500 code
>> - Resolve unused define in eSDHC device model
>> - Resolve redundant alignment checks in eSDHC device model
>>=20
>> Bin:
>> - Add dedicated flash chapter to documentation
>>=20
>> Bernhard:
>> - Use is_power_of_2() instead of ctpop64() for better readability
>> - Only instantiate eSDHC device model in ppce500 (not used in MPC8544DS=
)
>> - Rebase onto gitlab=2Ecom/danielhb/qemu/tree/ppc-next
>>=20
>> v2:
>> ~~~
>> Bin:
>> - Add source for MPC8544DS platform bus' memory map in commit message=
=2E
>> - Keep "ESDHC" in comment referring to Linux driver=2E
>> - Use "qemu-system-ppc{64|32} in documentation=2E
>> - Use g_autofree in device tree code=2E
>> - Remove unneeded device tree properties=2E
>> - Error out if pflash size doesn't fit into eLBC memory window=2E
>> - Remove unused ESDHC defines=2E
>> - Define macro ESDHC_WML for register offset with magic constant=2E
>> - Fix some whitespace issues when adding eSDHC device to e500=2E
>>=20
>> Phil:
>> - Fix tense in commit message=2E
>>=20
>> Bernhard Beschow (7):
>>    docs/system/ppc/ppce500: Use qemu-system-ppc64 across the board(s)
>>    hw/block/pflash_cfi0{1,2}: Error out if device length isn't a power =
of
>>      two
>>    hw/sd/sdhci-internal: Unexport ESDHC defines
>>    hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
>>    hw/ppc/e500: Implement pflash handling
>>    hw/sd/sdhci: Implement Freescale eSDHC device model
>>    hw/ppc/e500: Add Freescale eSDHC to e500plat
>>=20
>>   docs/system/ppc/ppce500=2Erst |  38 +++++++-
>>   hw/block/pflash_cfi01=2Ec     |   8 +-
>>   hw/block/pflash_cfi02=2Ec     |   5 +
>>   hw/ppc/Kconfig              |   2 +
>>   hw/ppc/e500=2Ec               | 114 +++++++++++++++++++++-
>>   hw/ppc/e500=2Eh               |   1 +
>>   hw/ppc/e500plat=2Ec           |   1 +
>>   hw/sd/sdhci-internal=2Eh      |  20 ----
>>   hw/sd/sdhci=2Ec               | 183 +++++++++++++++++++++++++++++++--=
---
>>   include/hw/sd/sdhci=2Eh       |   3 +
>>   10 files changed, 324 insertions(+), 51 deletions(-)
>>=20

