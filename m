Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22746034DD
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 23:25:34 +0200 (CEST)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oku5c-0005Ka-Sz
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 17:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oktjW-00022D-HX; Tue, 18 Oct 2022 17:02:51 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:39667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oktjS-0003un-GN; Tue, 18 Oct 2022 17:02:41 -0400
Received: by mail-ej1-x636.google.com with SMTP id b2so35396219eja.6;
 Tue, 18 Oct 2022 14:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iOmB+xoTEaRaOIdbCKCBrtSMoKomoXO9ygIphsjM/7g=;
 b=GBHjcUehhWInfIZLMHzCyP1MYWZN2aMfTnwWuY/7IoO1KFpcPqfCAXV9PBuqzVZ4iM
 BMIv0XMe7otEQOBnCnCaV9KVd5SUlF0vaZAeTV5fBJXmOqOxKFJfHzILTPgc+Jhl20OL
 Tmd++d1j4YKDF6HuCBScqXes3Pt43mrJyP4YrlL4pT/nvW0hlB2EeiCK0Apu3C7MM4rF
 qDNxfVjDCuYCxBLHbdYRATYA8FHpeAW8T/ko4pxjaBlxadcNJdYnX/PorA/YHRDMZUyB
 K2XFa405sbiq1q21tpIcf5YZPpBxp19ZzhbfHIJEFs8yFWLQjeRVphnP4VY/8AKo4rva
 /kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iOmB+xoTEaRaOIdbCKCBrtSMoKomoXO9ygIphsjM/7g=;
 b=QUlR8jYXVzb9QyL5MCcSIb53MwG9laBYPBkYROZ2GKqOtuwGdsMNAXoPuvvxAj2zKg
 abk2oMzWdCNghW2L/RuKmkjttcsoifIrUJaITS8JkIFXjXWGJ3NxYJ2sP0d6ZIVWJdoM
 NJ6ZMthpQJz1dRTDB4UVt7EAsaDm0wr8MDjfINIaNS7vJ+oqAYuVSQjWm236APDTi9tU
 lpuNVzQAu/6vUTUxcrDx8U1IRKoKX5IAgmRq4eNBmM5L0QavcImA6M9Lin5N6mM/lHdk
 zN+JMc5CHjsqgZF5g1E2rNFCHiC/JJ5ZAvrD9FV204h8/PJsMDnpy3S3Oe02znGNXBwo
 Az1w==
X-Gm-Message-State: ACrzQf2AYe/hfY3HYMWoNOtgX8R7ssB9cwReOs5mSXv2hbyRzHQa6BAI
 ufVVNQCuaKZwhC9bz9n49O5LM21xZP0=
X-Google-Smtp-Source: AMsMyM5oe6RNRGryZioLiMwic86r81Ydk2MPyHz/ArWbw6Loj4xwaerOADBpqRKPOZBsFdFwM4QYog==
X-Received: by 2002:a17:907:3ea9:b0:78d:fdf0:88fe with SMTP id
 hs41-20020a1709073ea900b0078dfdf088femr4116844ejc.667.1666126954317; 
 Tue, 18 Oct 2022 14:02:34 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-012-048.78.54.pool.telefonica.de. [78.54.12.48])
 by smtp.gmail.com with ESMTPSA id
 fe7-20020a056402390700b004587c2b5048sm9407951edb.52.2022.10.18.14.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 14:02:33 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 0/7] ppc/e500: Add support for two types of flash, cleanup
Date: Tue, 18 Oct 2022 23:01:39 +0200
Message-Id: <20221018210146.193159-1-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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

Cover letter:=0D
~~~~~~~~~~~~~=0D
=0D
This series adds support for -pflash and direct SD card access to the=0D
PPC e500 boards. The idea is to increase compatibility with "real" firmware=
=0D
images where only the bare minimum of drivers is compiled in.=0D
=0D
The series is structured as follows:=0D
=0D
Patches 1-4 perform some general cleanup which paves the way for the rest o=
f=0D
the series.=0D
=0D
Patch 5 adds -pflash handling where memory-mapped flash can be added on=0D
user's behalf. That is, the flash memory region in the eLBC is only added i=
f=0D
the -pflash argument is supplied. Note that the cfi01 device model becomes=
=0D
stricter in checking the size of the emulated flash space.=0D
=0D
Patches 6 and 7 add a new device model - the Freescale eSDHC - to the e500=
=0D
boards which was missing so far.=0D
=0D
User documentation is also added as the new features become available.=0D
=0D
Tesing done:=0D
* `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append=0D
"console=3DttyS0 rootwait root=3D/dev/mtdblock0 nokaslr" -drive=0D
if=3Dpflash,file=3Drootfs.ext2,format=3Draw`=0D
* `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append=0D
"console=3DttyS0 rootwait root=3D/dev/mmcblk0" -device sd-card,drive=3Dmydr=
ive -drive=0D
id=3Dmydrive,if=3Dnone,file=3Drootfs.ext2,format=3Draw`=0D
=0D
The load was created using latest Buildroot with `make=0D
qemu_ppc_e500mc_defconfig` where the rootfs was configured to be of ext2 ty=
pe.=0D
In both cases it was possible to log in and explore the root file system.=0D
=0D
v4:=0D
~~~=0D
Zoltan:=0D
- Don't suggest presence of qemu-system-ppc32 in documentation=0D
=0D
Bin:=0D
- New patch: docs/system/ppc/ppce500: Use qemu-system-ppc64 across the boar=
d(s)=0D
=0D
Peter:=0D
- Inline pflash_cfi01_register() rather than modify it (similar to v2)=0D
=0D
v3:=0D
~~~=0D
Phil:=0D
- Also add power-of-2 fix to pflash_cfi02=0D
- Resolve cfi01-specific assertion in e500 code=0D
- Resolve unused define in eSDHC device model=0D
- Resolve redundant alignment checks in eSDHC device model=0D
=0D
Bin:=0D
- Add dedicated flash chapter to documentation=0D
=0D
Bernhard:=0D
- Use is_power_of_2() instead of ctpop64() for better readability=0D
- Only instantiate eSDHC device model in ppce500 (not used in MPC8544DS)=0D
- Rebase onto gitlab.com/danielhb/qemu/tree/ppc-next=0D
=0D
v2:=0D
~~~=0D
Bin:=0D
- Add source for MPC8544DS platform bus' memory map in commit message.=0D
- Keep "ESDHC" in comment referring to Linux driver.=0D
- Use "qemu-system-ppc{64|32} in documentation.=0D
- Use g_autofree in device tree code.=0D
- Remove unneeded device tree properties.=0D
- Error out if pflash size doesn't fit into eLBC memory window.=0D
- Remove unused ESDHC defines.=0D
- Define macro ESDHC_WML for register offset with magic constant.=0D
- Fix some whitespace issues when adding eSDHC device to e500.=0D
=0D
Phil:=0D
- Fix tense in commit message.=0D
=0D
Bernhard Beschow (7):=0D
  docs/system/ppc/ppce500: Use qemu-system-ppc64 across the board(s)=0D
  hw/block/pflash_cfi0{1,2}: Error out if device length isn't a power of=0D
    two=0D
  hw/sd/sdhci-internal: Unexport ESDHC defines=0D
  hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*=0D
  hw/ppc/e500: Implement pflash handling=0D
  hw/sd/sdhci: Implement Freescale eSDHC device model=0D
  hw/ppc/e500: Add Freescale eSDHC to e500plat=0D
=0D
 docs/system/ppc/ppce500.rst |  38 +++++++-=0D
 hw/block/pflash_cfi01.c     |   8 +-=0D
 hw/block/pflash_cfi02.c     |   5 +=0D
 hw/ppc/Kconfig              |   2 +=0D
 hw/ppc/e500.c               | 114 +++++++++++++++++++++-=0D
 hw/ppc/e500.h               |   1 +=0D
 hw/ppc/e500plat.c           |   1 +=0D
 hw/sd/sdhci-internal.h      |  20 ----=0D
 hw/sd/sdhci.c               | 183 +++++++++++++++++++++++++++++++-----=0D
 include/hw/sd/sdhci.h       |   3 +=0D
 10 files changed, 324 insertions(+), 51 deletions(-)=0D
=0D
-- =0D
2.38.0=0D
=0D

