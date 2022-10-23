Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B566097F7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 03:52:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oml8e-00075O-8y
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 20:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omWTV-00058p-8x; Sun, 23 Oct 2022 04:36:55 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omWTT-0001oO-Kd; Sun, 23 Oct 2022 04:36:53 -0400
Received: by mail-ed1-x52f.google.com with SMTP id y12so588717edc.9;
 Sun, 23 Oct 2022 01:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRmZJ+oikEiB6CzwdJGUgvAr3e9iP8jKtb/7e7pjDzc=;
 b=fEAr9Q6ueSxeSuyLT9676891MFpPNqGkeEL6Q15nzy+jrQR2QAzUmhwgscEOzmzj++
 H1krq9ApbirCXhblFIY+u6c4ALpYdAS9GeJxTrSMJk958xr1qdg1R5xajG4ARUHZ/E22
 QtVaaP3C1mYT5paqwoK8xiV3lB0pNy66RcXoahyJ9F5ySkqdl14JBkPLrsgvIwle4IpG
 Bk9/BpAQ1JohdQ01N5fdJHLDBlFdDj4Cb6dJgfAyPst9n2EHrRFjDpISBb/BQ4kcook5
 FIOJgivVF8SyrCN44fYz7R7s6H4M+xonrNq8e1+AKeRZd2A+SsGDGhKJBSOOFZWlChvT
 TmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XRmZJ+oikEiB6CzwdJGUgvAr3e9iP8jKtb/7e7pjDzc=;
 b=za8Xcy9umzjG6DZg9J48x9M3pGi+mb5f9Bh0wjxooeLgyqffJAkRmiE+ouQD5kM5fs
 zpNO2y+inVk9GH7CG5lDFkR//BXiXaWJuQCrL0IJrIMgwwfkIQaYRrrCwippre2gRraT
 ir7Zticjw9yNNFLsCvo3jvaiUTxVAgTHwFDj8Vm+Mp5/jCK67CEc81gaJ/fhsNyG7w8A
 ZxbwpS8SRlqfsgE0k4ZWMHNhZVA3ek6lDkg/fWLy1YPA91P6DqWIZzIzFoKUhdjZKWTF
 Q4R+paZCdUw11DMVdf/D7OTay/RMJe+dqe909/BpUZ5U/N0J/Z4HRZBRCk5ewPIFfIE5
 4n+w==
X-Gm-Message-State: ACrzQf3CWAqkpV9ks0AHsBTBJ0yCPV2ID5PiZYdMOx65XdNIqUvK1f+O
 1r0ttK+r7pnq0YKeGnxL/nZivGOr754=
X-Google-Smtp-Source: AMsMyM5j1FWS8GMquSk9nIsZXWVBs9YCD7GaK8ppa2374iBo0Vz+L89W/Enp3gVDh5X9srYhqwZYew==
X-Received: by 2002:a50:ff09:0:b0:456:fd61:83b3 with SMTP id
 a9-20020a50ff09000000b00456fd6183b3mr24857113edu.166.1666514208179; 
 Sun, 23 Oct 2022 01:36:48 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-191-180-043.77.191.pool.telefonica.de.
 [77.191.180.43]) by smtp.gmail.com with ESMTPSA id
 h28-20020a1709070b1c00b00780f6071b5dsm13685404ejl.188.2022.10.23.01.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 01:36:47 -0700 (PDT)
Date: Sun, 23 Oct 2022 08:36:44 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
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
In-Reply-To: <20221018210146.193159-1-shentey@gmail.com>
References: <20221018210146.193159-1-shentey@gmail.com>
Message-ID: <56D10C31-F94E-4E4B-A37C-667AF8F61540@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18=2E Oktober 2022 21:01:39 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>Cover letter:
>
>~~~~~~~~~~~~~
>
>
>
>This series adds support for -pflash and direct SD card access to the
>
>PPC e500 boards=2E The idea is to increase compatibility with "real" firm=
ware
>
>images where only the bare minimum of drivers is compiled in=2E
>
>
>
>The series is structured as follows:
>
>
>
>Patches 1-4 perform some general cleanup which paves the way for the rest=
 of
>
>the series=2E
>
>
>
>Patch 5 adds -pflash handling where memory-mapped flash can be added on
>
>user's behalf=2E That is, the flash memory region in the eLBC is only add=
ed if
>
>the -pflash argument is supplied=2E Note that the cfi01 device model beco=
mes
>
>stricter in checking the size of the emulated flash space=2E
>
>
>
>Patches 6 and 7 add a new device model - the Freescale eSDHC - to the e50=
0
>
>boards which was missing so far=2E
>
>
>
>User documentation is also added as the new features become available=2E
=
>
>
>
>Tesing done:
>
>* `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
>
>"console=3DttyS0 rootwait root=3D/dev/mtdblock0 nokaslr" -drive
>
>if=3Dpflash,file=3Drootfs=2Eext2,format=3Draw`
>
>* `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
>
>"console=3DttyS0 rootwait root=3D/dev/mmcblk0" -device sd-card,drive=3Dmy=
drive -drive
>
>id=3Dmydrive,if=3Dnone,file=3Drootfs=2Eext2,format=3Draw`
>
>
>
>The load was created using latest Buildroot with `make
>
>qemu_ppc_e500mc_defconfig` where the rootfs was configured to be of ext2 =
type=2E
>
>In both cases it was possible to log in and explore the root file system=
=2E
>
>
>
>v4:
>
>~~~
>
>Zoltan:
>
>- Don't suggest presence of qemu-system-ppc32 in documentation
>
>
>
>Bin:
>
>- New patch: docs/system/ppc/ppce500: Use qemu-system-ppc64 across the bo=
ard(s)
>
>
>
>Peter:
>
>- Inline pflash_cfi01_register() rather than modify it (similar to v2)
>

Ping

>
>
>v3:
>
>~~~
>
>Phil:
>
>- Also add power-of-2 fix to pflash_cfi02
>
>- Resolve cfi01-specific assertion in e500 code
>
>- Resolve unused define in eSDHC device model
>
>- Resolve redundant alignment checks in eSDHC device model
>
>
>
>Bin:
>
>- Add dedicated flash chapter to documentation
>
>
>
>Bernhard:
>
>- Use is_power_of_2() instead of ctpop64() for better readability
>
>- Only instantiate eSDHC device model in ppce500 (not used in MPC8544DS)
=
>
>- Rebase onto gitlab=2Ecom/danielhb/qemu/tree/ppc-next
>
>
>
>v2:
>
>~~~
>
>Bin:
>
>- Add source for MPC8544DS platform bus' memory map in commit message=2E
=
>
>- Keep "ESDHC" in comment referring to Linux driver=2E
>
>- Use "qemu-system-ppc{64|32} in documentation=2E
>
>- Use g_autofree in device tree code=2E
>
>- Remove unneeded device tree properties=2E
>
>- Error out if pflash size doesn't fit into eLBC memory window=2E
>
>- Remove unused ESDHC defines=2E
>
>- Define macro ESDHC_WML for register offset with magic constant=2E
>
>- Fix some whitespace issues when adding eSDHC device to e500=2E
>
>
>
>Phil:
>
>- Fix tense in commit message=2E
>
>
>
>Bernhard Beschow (7):
>
>  docs/system/ppc/ppce500: Use qemu-system-ppc64 across the board(s)
>
>  hw/block/pflash_cfi0{1,2}: Error out if device length isn't a power of
=
>
>    two
>
>  hw/sd/sdhci-internal: Unexport ESDHC defines
>
>  hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
>
>  hw/ppc/e500: Implement pflash handling
>
>  hw/sd/sdhci: Implement Freescale eSDHC device model
>
>  hw/ppc/e500: Add Freescale eSDHC to e500plat
>
>
>
> docs/system/ppc/ppce500=2Erst |  38 +++++++-
>
> hw/block/pflash_cfi01=2Ec     |   8 +-
>
> hw/block/pflash_cfi02=2Ec     |   5 +
>
> hw/ppc/Kconfig              |   2 +
>
> hw/ppc/e500=2Ec               | 114 +++++++++++++++++++++-
>
> hw/ppc/e500=2Eh               |   1 +
>
> hw/ppc/e500plat=2Ec           |   1 +
>
> hw/sd/sdhci-internal=2Eh      |  20 ----
>
> hw/sd/sdhci=2Ec               | 183 +++++++++++++++++++++++++++++++-----=

>
> include/hw/sd/sdhci=2Eh       |   3 +
>
> 10 files changed, 324 insertions(+), 51 deletions(-)
>
>
>
>-- >
>2=2E38=2E0
>
>
>


