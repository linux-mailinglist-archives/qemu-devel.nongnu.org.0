Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AA13295C7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 04:46:08 +0100 (CET)
Received: from localhost ([::1]:42798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGvz5-0005dL-QS
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 22:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGvx3-0004FT-Ub; Mon, 01 Mar 2021 22:44:02 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40389 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGvx0-00079y-0p; Mon, 01 Mar 2021 22:44:01 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DqNK52Q32z9sS8; Tue,  2 Mar 2021 14:43:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614656633;
 bh=w3yYbhMlNxncb4nY95OLW9HvTPQRFeLxr7d2NjISc7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gT/NDxUIiEswV+vSKtxWAItcRKmRE+5uTtbuMYHRdUSx2vQnh8gBrrBTGdvz8Z8EP
 gPlQ0SEHIFkF0tlZdcoHXIepWcCrizMxV6r0jxoBPT1rplo73OT0haMTegmethkRrp
 ODFvPnOnD90k1Yx/QNOYT+LprhsgR84zQWA1qAp8=
Date: Tue, 2 Mar 2021 14:42:16 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 0/6] Pegasos2 emulation
Message-ID: <YD20GALW0M3bABLV@yekko.fritz.box>
References: <cover.1614282456.git.balaton@eik.bme.hu>
 <161428385362.1906.5456679248187436990@c667a6b167f6>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LMTQ72cqJccy5B27"
Content-Disposition: inline
In-Reply-To: <161428385362.1906.5456679248187436990@c667a6b167f6>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-ppc@nongnu.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LMTQ72cqJccy5B27
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 12:10:55PM -0800, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/cover.1614282456.git.balaton@eik.bm=
e.hu/
>=20
>=20
>=20
> Hi,
>=20
> This series seems to have some coding style problems. See output below for
> more information:
>=20
> Type: series
> Message-id: cover.1614282456.git.balaton@eik.bme.hu
> Subject: [PATCH v4 0/6] Pegasos2 emulation
>=20
> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> =3D=3D=3D TEST SCRIPT END =3D=3D=3D
>=20
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>    7ef8134..51db2d7  master     -> master
>  - [tag update]      patchew/20210225181507.3624509-1-f4bug@amsat.org -> =
patchew/20210225181507.3624509-1-f4bug@amsat.org
>  * [new tag]         patchew/cover.1614282456.git.balaton@eik.bme.hu -> p=
atchew/cover.1614282456.git.balaton@eik.bme.hu
> Switched to a new branch 'test'
> 42b2a15 hw/ppc: Add emulation of Genesi/bPlan Pegasos II
> 2b43495 hw/pci-host: Add emulation of Marvell MV64361 PPC system controll=
er
> 0ba0ef2 vt82c686: Add emulation of VT8231 south bridge
> 4d547c7 vt82c686: Add VT8231_SUPERIO based on VIA_SUPERIO
> af493ab vt82c686: QOM-ify superio related functionality
> 9041915 vt82c686: Implement control of serial port io ranges via config r=
egs
>=20
> =3D=3D=3D OUTPUT BEGIN =3D=3D=3D
> 1/6 Checking commit 904191528152 (vt82c686: Implement control of serial p=
ort io ranges via config regs)
> 2/6 Checking commit af493ab3ac51 (vt82c686: QOM-ify superio related funct=
ionality)
> 3/6 Checking commit 4d547c7dc19d (vt82c686: Add VT8231_SUPERIO based on V=
IA_SUPERIO)
> 4/6 Checking commit 0ba0ef255e0d (vt82c686: Add emulation of VT8231 south=
 bridge)
> 5/6 Checking commit 2b43495ccd8f (hw/pci-host: Add emulation of Marvell M=
V64361 PPC system controller)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/c=
heckpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #51:=20
> new file mode 100644
>=20
> WARNING: line over 80 characters
> #307: FILE: hw/pci-host/mv64361.c:252:
> +            trace_mv64361_region_enable(!(val & mask) ? "enable" : "disa=
ble", i);

You will need to fix these style errors before merge.

> ERROR: code indent should never use tabs
> #1032: FILE: hw/pci-host/mv643xx.h:5:
> + * ^IAuthor: Matthew Dharm <mdharm@momenco.com>$
>=20
> WARNING: architecture specific defines should be avoided
> #1040: FILE: hw/pci-host/mv643xx.h:13:
> +#ifndef __ASM_MV643XX_H
>=20
> WARNING: Block comments use a leading /* on a separate line
> #1102: FILE: hw/pci-host/mv643xx.h:75:
> +/* Enables the CS , DEV_CS , PCI 0 and PCI 1
>=20
> WARNING: Block comments use * on subsequent lines
> #1103: FILE: hw/pci-host/mv643xx.h:76:
> +/* Enables the CS , DEV_CS , PCI 0 and PCI 1
> +   windows above */
>=20
> WARNING: Block comments use a trailing */ on a separate line
> #1103: FILE: hw/pci-host/mv643xx.h:76:
> +   windows above */
>=20
> ERROR: code indent should never use tabs
> #1206: FILE: hw/pci-host/mv643xx.h:179:
> +/*      CPU Interface Debug Registers ^I*/$
>=20
> ERROR: code indent should never use tabs
> #1283: FILE: hw/pci-host/mv643xx.h:256:
> +/* Device Parameters^I^I^I*/$
>=20
> ERROR: code indent should never use tabs
> #1286: FILE: hw/pci-host/mv643xx.h:259:
> +#define MV64340_DEVICE_BANK0_PARAMETERS^I^I^I^I    0x45c$
>=20
> ERROR: code indent should never use tabs
> #1287: FILE: hw/pci-host/mv643xx.h:260:
> +#define MV64340_DEVICE_BANK1_PARAMETERS^I^I^I^I    0x460$
>=20
> ERROR: code indent should never use tabs
> #1288: FILE: hw/pci-host/mv643xx.h:261:
> +#define MV64340_DEVICE_BANK2_PARAMETERS^I^I^I^I    0x464$
>=20
> ERROR: code indent should never use tabs
> #1289: FILE: hw/pci-host/mv643xx.h:262:
> +#define MV64340_DEVICE_BANK3_PARAMETERS^I^I^I^I    0x468$
>=20
> ERROR: code indent should never use tabs
> #1290: FILE: hw/pci-host/mv643xx.h:263:
> +#define MV64340_DEVICE_BOOT_BANK_PARAMETERS^I^I^I    0x46c$
>=20
> ERROR: code indent should never use tabs
> #1297: FILE: hw/pci-host/mv643xx.h:270:
> +/* Device interrupt registers^I^I*/$
>=20
> ERROR: code indent should never use tabs
> #1300: FILE: hw/pci-host/mv643xx.h:273:
> +#define MV64340_DEVICE_INTERRUPT_CAUSE^I^I^I^I    0x4d0$
>=20
> ERROR: code indent should never use tabs
> #1301: FILE: hw/pci-host/mv643xx.h:274:
> +#define MV64340_DEVICE_INTERRUPT_MASK^I^I^I^I    0x4d4$
>=20
> ERROR: code indent should never use tabs
> #1302: FILE: hw/pci-host/mv643xx.h:275:
> +#define MV64340_DEVICE_ERROR_ADDR^I^I^I^I    0x4d8$
>=20
> ERROR: code indent should never use tabs
> #1303: FILE: hw/pci-host/mv643xx.h:276:
> +#define MV64340_DEVICE_ERROR_DATA   ^I^I^I^I    0x4dc$
>=20
> ERROR: code indent should never use tabs
> #1304: FILE: hw/pci-host/mv643xx.h:277:
> +#define MV64340_DEVICE_ERROR_PARITY     ^I^I^I    0x4e0$
>=20
> ERROR: code indent should never use tabs
> #1307: FILE: hw/pci-host/mv643xx.h:280:
> +/* Device debug registers   ^I^I*/$
>=20
> ERROR: code indent should never use tabs
> #1310: FILE: hw/pci-host/mv643xx.h:283:
> +#define MV64340_DEVICE_DEBUG_LOW     ^I^I^I^I    0x4e4$
>=20
> ERROR: code indent should never use tabs
> #1311: FILE: hw/pci-host/mv643xx.h:284:
> +#define MV64340_DEVICE_DEBUG_HIGH     ^I^I^I^I    0x4e8$
>=20
> ERROR: code indent should never use tabs
> #1350: FILE: hw/pci-host/mv643xx.h:323:
> +#define MV64340_PCI_0_CS_0_BASE_ADDR_REMAP^I^I^I    0xc48$
>=20
> ERROR: code indent should never use tabs
> #1351: FILE: hw/pci-host/mv643xx.h:324:
> +#define MV64340_PCI_1_CS_0_BASE_ADDR_REMAP^I^I^I    0xcc8$
>=20
> ERROR: code indent should never use tabs
> #1352: FILE: hw/pci-host/mv643xx.h:325:
> +#define MV64340_PCI_0_CS_1_BASE_ADDR_REMAP^I^I^I    0xd48$
>=20
> ERROR: code indent should never use tabs
> #1353: FILE: hw/pci-host/mv643xx.h:326:
> +#define MV64340_PCI_1_CS_1_BASE_ADDR_REMAP^I^I^I    0xdc8$
>=20
> ERROR: code indent should never use tabs
> #1354: FILE: hw/pci-host/mv643xx.h:327:
> +#define MV64340_PCI_0_CS_2_BASE_ADDR_REMAP^I^I^I    0xc4c$
>=20
> ERROR: code indent should never use tabs
> #1355: FILE: hw/pci-host/mv643xx.h:328:
> +#define MV64340_PCI_1_CS_2_BASE_ADDR_REMAP^I^I^I    0xccc$
>=20
> ERROR: code indent should never use tabs
> #1356: FILE: hw/pci-host/mv643xx.h:329:
> +#define MV64340_PCI_0_CS_3_BASE_ADDR_REMAP^I^I^I    0xd4c$
>=20
> ERROR: code indent should never use tabs
> #1357: FILE: hw/pci-host/mv643xx.h:330:
> +#define MV64340_PCI_1_CS_3_BASE_ADDR_REMAP^I^I^I    0xdcc$
>=20
> ERROR: code indent should never use tabs
> #1358: FILE: hw/pci-host/mv643xx.h:331:
> +#define MV64340_PCI_0_CS_0_BASE_HIGH_ADDR_REMAP^I^I^I    0xF04$
>=20
> ERROR: code indent should never use tabs
> #1359: FILE: hw/pci-host/mv643xx.h:332:
> +#define MV64340_PCI_1_CS_0_BASE_HIGH_ADDR_REMAP^I^I^I    0xF84$
>=20
> ERROR: code indent should never use tabs
> #1360: FILE: hw/pci-host/mv643xx.h:333:
> +#define MV64340_PCI_0_CS_1_BASE_HIGH_ADDR_REMAP^I^I^I    0xF08$
>=20
> ERROR: code indent should never use tabs
> #1361: FILE: hw/pci-host/mv643xx.h:334:
> +#define MV64340_PCI_1_CS_1_BASE_HIGH_ADDR_REMAP^I^I^I    0xF88$
>=20
> ERROR: code indent should never use tabs
> #1362: FILE: hw/pci-host/mv643xx.h:335:
> +#define MV64340_PCI_0_CS_2_BASE_HIGH_ADDR_REMAP^I^I^I    0xF0C$
>=20
> ERROR: code indent should never use tabs
> #1363: FILE: hw/pci-host/mv643xx.h:336:
> +#define MV64340_PCI_1_CS_2_BASE_HIGH_ADDR_REMAP^I^I^I    0xF8C$
>=20
> ERROR: code indent should never use tabs
> #1364: FILE: hw/pci-host/mv643xx.h:337:
> +#define MV64340_PCI_0_CS_3_BASE_HIGH_ADDR_REMAP^I^I^I    0xF10$
>=20
> ERROR: code indent should never use tabs
> #1365: FILE: hw/pci-host/mv643xx.h:338:
> +#define MV64340_PCI_1_CS_3_BASE_HIGH_ADDR_REMAP^I^I^I    0xF90$
>=20
> ERROR: code indent should never use tabs
> #1366: FILE: hw/pci-host/mv643xx.h:339:
> +#define MV64340_PCI_0_DEVCS_0_BASE_ADDR_REMAP^I^I^I    0xc50$
>=20
> ERROR: code indent should never use tabs
> #1367: FILE: hw/pci-host/mv643xx.h:340:
> +#define MV64340_PCI_1_DEVCS_0_BASE_ADDR_REMAP^I^I^I    0xcd0$
>=20
> ERROR: code indent should never use tabs
> #1368: FILE: hw/pci-host/mv643xx.h:341:
> +#define MV64340_PCI_0_DEVCS_1_BASE_ADDR_REMAP^I^I^I    0xd50$
>=20
> ERROR: code indent should never use tabs
> #1369: FILE: hw/pci-host/mv643xx.h:342:
> +#define MV64340_PCI_1_DEVCS_1_BASE_ADDR_REMAP^I^I^I    0xdd0$
>=20
> ERROR: code indent should never use tabs
> #1370: FILE: hw/pci-host/mv643xx.h:343:
> +#define MV64340_PCI_0_DEVCS_2_BASE_ADDR_REMAP^I^I^I    0xd58$
>=20
> ERROR: code indent should never use tabs
> #1371: FILE: hw/pci-host/mv643xx.h:344:
> +#define MV64340_PCI_1_DEVCS_2_BASE_ADDR_REMAP^I^I^I    0xdd8$
>=20
> ERROR: code indent should never use tabs
> #1372: FILE: hw/pci-host/mv643xx.h:345:
> +#define MV64340_PCI_0_DEVCS_3_BASE_ADDR_REMAP           ^I    0xc54$
>=20
> ERROR: code indent should never use tabs
> #1373: FILE: hw/pci-host/mv643xx.h:346:
> +#define MV64340_PCI_1_DEVCS_3_BASE_ADDR_REMAP           ^I    0xcd4$
>=20
> ERROR: code indent should never use tabs
> #1374: FILE: hw/pci-host/mv643xx.h:347:
> +#define MV64340_PCI_0_DEVCS_BOOTCS_BASE_ADDR_REMAP      ^I    0xd54$
>=20
> ERROR: code indent should never use tabs
> #1375: FILE: hw/pci-host/mv643xx.h:348:
> +#define MV64340_PCI_1_DEVCS_BOOTCS_BASE_ADDR_REMAP      ^I    0xdd4$
>=20
> ERROR: code indent should never use tabs
> #1411: FILE: hw/pci-host/mv643xx.h:384:
> +#define MV64340_PCI_0_COMMAND^I^I^I         ^I    0xc00$
>=20
> ERROR: code indent should never use tabs
> #1412: FILE: hw/pci-host/mv643xx.h:385:
> +#define MV64340_PCI_1_COMMAND^I^I^I^I^I    0xc80$
>=20
> ERROR: code indent should never use tabs
> #1415: FILE: hw/pci-host/mv643xx.h:388:
> +#define MV64340_PCI_0_RETRY^I        ^I ^I^I    0xc04$
>=20
> ERROR: code indent should never use tabs
> #1416: FILE: hw/pci-host/mv643xx.h:389:
> +#define MV64340_PCI_1_RETRY^I^I^I^I            0xc84$
>=20
> ERROR: code indent should never use tabs
> #1478: FILE: hw/pci-host/mv643xx.h:451:
> +#define MV64340_PCI_0_CONFIG_ADDR ^I^I^I^I    0xcf8$
>=20
> ERROR: code indent should never use tabs
> #1480: FILE: hw/pci-host/mv643xx.h:453:
> +#define MV64340_PCI_1_CONFIG_ADDR ^I^I^I^I    0xc78$
>=20
> ERROR: code indent should never use tabs
> #1482: FILE: hw/pci-host/mv643xx.h:455:
> +#define MV64340_PCI_0_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG^I            0xc=
34$
>=20
> ERROR: code indent should never use tabs
> #1483: FILE: hw/pci-host/mv643xx.h:456:
> +#define MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG^I            0xc=
b4$
>=20
> ERROR: code indent should never use tabs
> #1489: FILE: hw/pci-host/mv643xx.h:462:
> +#define MV64340_PCI_0_SERR_MASK^I^I^I^I^I    0xc28$
>=20
> ERROR: code indent should never use tabs
> #1490: FILE: hw/pci-host/mv643xx.h:463:
> +#define MV64340_PCI_1_SERR_MASK^I^I^I^I^I    0xca8$
>=20
> ERROR: code indent should never use tabs
> #1515: FILE: hw/pci-host/mv643xx.h:488:
> +#define MV64340_PCI_DEVICE_AND_VENDOR_ID ^I^I^I    0x000$
>=20
> ERROR: code indent should never use tabs
> #1516: FILE: hw/pci-host/mv643xx.h:489:
> +#define MV64340_PCI_STATUS_AND_COMMAND^I^I^I^I    0x004$
>=20
> ERROR: code indent should never use tabs
> #1517: FILE: hw/pci-host/mv643xx.h:490:
> +#define MV64340_PCI_CLASS_CODE_AND_REVISION_ID^I^I^I    0x008$
>=20
> ERROR: code indent should never use tabs
> #1518: FILE: hw/pci-host/mv643xx.h:491:
> +#define MV64340_PCI_BIST_HEADER_TYPE_LATENCY_TIMER_CACHE_LINE ^I    0x00=
C$
>=20
> ERROR: code indent should never use tabs
> #1520: FILE: hw/pci-host/mv643xx.h:493:
> +#define MV64340_PCI_SCS_0_BASE_ADDR_LOW   ^I      ^I^I    0x010$
>=20
> ERROR: code indent should never use tabs
> #1521: FILE: hw/pci-host/mv643xx.h:494:
> +#define MV64340_PCI_SCS_0_BASE_ADDR_HIGH   ^I^I            0x014$
>=20
> ERROR: code indent should never use tabs
> #1522: FILE: hw/pci-host/mv643xx.h:495:
> +#define MV64340_PCI_SCS_1_BASE_ADDR_LOW  ^I     ^I            0x018$
>=20
> ERROR: code indent should never use tabs
> #1523: FILE: hw/pci-host/mv643xx.h:496:
> +#define MV64340_PCI_SCS_1_BASE_ADDR_HIGH ^I^I            0x01C$
>=20
> ERROR: code indent should never use tabs
> #1524: FILE: hw/pci-host/mv643xx.h:497:
> +#define MV64340_PCI_INTERNAL_REG_MEM_MAPPED_BASE_ADDR_LOW      ^I    0x0=
20$
>=20
> ERROR: code indent should never use tabs
> #1525: FILE: hw/pci-host/mv643xx.h:498:
> +#define MV64340_PCI_INTERNAL_REG_MEM_MAPPED_BASE_ADDR_HIGH     ^I    0x0=
24$
>=20
> ERROR: code indent should never use tabs
> #1526: FILE: hw/pci-host/mv643xx.h:499:
> +#define MV64340_PCI_SUBSYSTEM_ID_AND_SUBSYSTEM_VENDOR_ID^I    0x02c$
>=20
> ERROR: code indent should never use tabs
> #1527: FILE: hw/pci-host/mv643xx.h:500:
> +#define MV64340_PCI_EXPANSION_ROM_BASE_ADDR_REG^I                    0x0=
30$
>=20
> ERROR: code indent should never use tabs
> #1529: FILE: hw/pci-host/mv643xx.h:502:
> +#define MV64340_PCI_INTERRUPT_PIN_AND_LINE ^I^I^I    0x03C$
>=20
> ERROR: code indent should never use tabs
> #1547: FILE: hw/pci-host/mv643xx.h:520:
> +#define MV64340_PCI_SCS_2_BASE_ADDR_LOW   ^I^I^I    0x110$
>=20
> ERROR: code indent should never use tabs
> #1548: FILE: hw/pci-host/mv643xx.h:521:
> +#define MV64340_PCI_SCS_2_BASE_ADDR_HIGH^I^I^I    0x114$
>=20
> ERROR: code indent should never use tabs
> #1549: FILE: hw/pci-host/mv643xx.h:522:
> +#define MV64340_PCI_SCS_3_BASE_ADDR_LOW ^I^I^I    0x118$
>=20
> ERROR: code indent should never use tabs
> #1550: FILE: hw/pci-host/mv643xx.h:523:
> +#define MV64340_PCI_SCS_3_BASE_ADDR_HIGH^I^I^I    0x11c$
>=20
> ERROR: code indent should never use tabs
> #1551: FILE: hw/pci-host/mv643xx.h:524:
> +#define MV64340_PCI_INTERNAL_SRAM_BASE_ADDR_LOW          ^I    0x120$
>=20
> ERROR: code indent should never use tabs
> #1552: FILE: hw/pci-host/mv643xx.h:525:
> +#define MV64340_PCI_INTERNAL_SRAM_BASE_ADDR_HIGH         ^I    0x124$
>=20
> ERROR: code indent should never use tabs
> #1558: FILE: hw/pci-host/mv643xx.h:531:
> +#define MV64340_PCI_DEVCS_0_BASE_ADDR_LOW^I    ^I^I    0x210$
>=20
> ERROR: code indent should never use tabs
> #1559: FILE: hw/pci-host/mv643xx.h:532:
> +#define MV64340_PCI_DEVCS_0_BASE_ADDR_HIGH ^I^I^I    0x214$
>=20
> ERROR: code indent should never use tabs
> #1560: FILE: hw/pci-host/mv643xx.h:533:
> +#define MV64340_PCI_DEVCS_1_BASE_ADDR_LOW ^I^I^I    0x218$
>=20
> ERROR: code indent should never use tabs
> #1561: FILE: hw/pci-host/mv643xx.h:534:
> +#define MV64340_PCI_DEVCS_1_BASE_ADDR_HIGH      ^I^I    0x21c$
>=20
> ERROR: code indent should never use tabs
> #1562: FILE: hw/pci-host/mv643xx.h:535:
> +#define MV64340_PCI_DEVCS_2_BASE_ADDR_LOW ^I^I^I    0x220$
>=20
> ERROR: code indent should never use tabs
> #1563: FILE: hw/pci-host/mv643xx.h:536:
> +#define MV64340_PCI_DEVCS_2_BASE_ADDR_HIGH      ^I^I    0x224$
>=20
> ERROR: code indent should never use tabs
> #1569: FILE: hw/pci-host/mv643xx.h:542:
> +#define MV64340_PCI_DEVCS_3_BASE_ADDR_LOW^I    ^I^I    0x310$
>=20
> ERROR: code indent should never use tabs
> #1570: FILE: hw/pci-host/mv643xx.h:543:
> +#define MV64340_PCI_DEVCS_3_BASE_ADDR_HIGH ^I^I^I    0x314$
>=20
> ERROR: code indent should never use tabs
> #1571: FILE: hw/pci-host/mv643xx.h:544:
> +#define MV64340_PCI_BOOT_CS_BASE_ADDR_LOW^I^I^I    0x318$
>=20
> ERROR: code indent should never use tabs
> #1572: FILE: hw/pci-host/mv643xx.h:545:
> +#define MV64340_PCI_BOOT_CS_BASE_ADDR_HIGH      ^I^I    0x31c$
>=20
> ERROR: code indent should never use tabs
> #1573: FILE: hw/pci-host/mv643xx.h:546:
> +#define MV64340_PCI_CPU_BASE_ADDR_LOW ^I^I^I^I    0x220$
>=20
> ERROR: code indent should never use tabs
> #1574: FILE: hw/pci-host/mv643xx.h:547:
> +#define MV64340_PCI_CPU_BASE_ADDR_HIGH      ^I^I^I    0x224$
>=20
> ERROR: code indent should never use tabs
> #1580: FILE: hw/pci-host/mv643xx.h:553:
> +#define MV64340_PCI_P2P_MEM0_BASE_ADDR_LOW  ^I^I^I    0x410$
>=20
> ERROR: code indent should never use tabs
> #1581: FILE: hw/pci-host/mv643xx.h:554:
> +#define MV64340_PCI_P2P_MEM0_BASE_ADDR_HIGH ^I^I^I    0x414$
>=20
> ERROR: code indent should never use tabs
> #1582: FILE: hw/pci-host/mv643xx.h:555:
> +#define MV64340_PCI_P2P_MEM1_BASE_ADDR_LOW   ^I^I^I    0x418$
>=20
> ERROR: code indent should never use tabs
> #1583: FILE: hw/pci-host/mv643xx.h:556:
> +#define MV64340_PCI_P2P_MEM1_BASE_ADDR_HIGH ^I^I^I    0x41c$
>=20
> ERROR: code indent should never use tabs
> #1584: FILE: hw/pci-host/mv643xx.h:557:
> +#define MV64340_PCI_P2P_I_O_BASE_ADDR                 ^I            0x42=
0$
>=20
> ERROR: code indent should never use tabs
> #1588: FILE: hw/pci-host/mv643xx.h:561:
> +/* Messaging Unit Registers (I20)   ^I*/$
>=20
> ERROR: code indent should never use tabs
> #1591: FILE: hw/pci-host/mv643xx.h:564:
> +#define MV64340_I2O_INBOUND_MESSAGE_REG0_PCI_0_SIDE^I^I    0x010$
>=20
> ERROR: code indent should never use tabs
> #1592: FILE: hw/pci-host/mv643xx.h:565:
> +#define MV64340_I2O_INBOUND_MESSAGE_REG1_PCI_0_SIDE  ^I^I    0x014$
>=20
> ERROR: code indent should never use tabs
> #1593: FILE: hw/pci-host/mv643xx.h:566:
> +#define MV64340_I2O_OUTBOUND_MESSAGE_REG0_PCI_0_SIDE ^I^I    0x018$
>=20
> ERROR: code indent should never use tabs
> #1594: FILE: hw/pci-host/mv643xx.h:567:
> +#define MV64340_I2O_OUTBOUND_MESSAGE_REG1_PCI_0_SIDE  ^I^I    0x01C$
>=20
> ERROR: code indent should never use tabs
> #1595: FILE: hw/pci-host/mv643xx.h:568:
> +#define MV64340_I2O_INBOUND_DOORBELL_REG_PCI_0_SIDE  ^I^I    0x020$
>=20
> ERROR: code indent should never use tabs
> #1597: FILE: hw/pci-host/mv643xx.h:570:
> +#define MV64340_I2O_INBOUND_INTERRUPT_MASK_REG_PCI_0_SIDE^I    0x028$
>=20
> ERROR: code indent should never use tabs
> #1598: FILE: hw/pci-host/mv643xx.h:571:
> +#define MV64340_I2O_OUTBOUND_DOORBELL_REG_PCI_0_SIDE ^I^I    0x02C$
>=20
> ERROR: code indent should never use tabs
> #1603: FILE: hw/pci-host/mv643xx.h:576:
> +#define MV64340_I2O_QUEUE_CONTROL_REG_PCI_0_SIDE ^I^I    0x050$
>=20
> ERROR: code indent should never use tabs
> #1604: FILE: hw/pci-host/mv643xx.h:577:
> +#define MV64340_I2O_QUEUE_BASE_ADDR_REG_PCI_0_SIDE ^I^I    0x054$
>=20
> ERROR: code indent should never use tabs
> #1614: FILE: hw/pci-host/mv643xx.h:587:
> +#define MV64340_I2O_INBOUND_MESSAGE_REG0_PCI_1_SIDE^I^I    0x090$
>=20
> ERROR: code indent should never use tabs
> #1615: FILE: hw/pci-host/mv643xx.h:588:
> +#define MV64340_I2O_INBOUND_MESSAGE_REG1_PCI_1_SIDE  ^I^I    0x094$
>=20
> ERROR: code indent should never use tabs
> #1616: FILE: hw/pci-host/mv643xx.h:589:
> +#define MV64340_I2O_OUTBOUND_MESSAGE_REG0_PCI_1_SIDE ^I^I    0x098$
>=20
> ERROR: code indent should never use tabs
> #1617: FILE: hw/pci-host/mv643xx.h:590:
> +#define MV64340_I2O_OUTBOUND_MESSAGE_REG1_PCI_1_SIDE  ^I^I    0x09C$
>=20
> ERROR: code indent should never use tabs
> #1618: FILE: hw/pci-host/mv643xx.h:591:
> +#define MV64340_I2O_INBOUND_DOORBELL_REG_PCI_1_SIDE  ^I^I    0x0A0$
>=20
> ERROR: code indent should never use tabs
> #1620: FILE: hw/pci-host/mv643xx.h:593:
> +#define MV64340_I2O_INBOUND_INTERRUPT_MASK_REG_PCI_1_SIDE^I    0x0A8$
>=20
> ERROR: code indent should never use tabs
> #1621: FILE: hw/pci-host/mv643xx.h:594:
> +#define MV64340_I2O_OUTBOUND_DOORBELL_REG_PCI_1_SIDE ^I^I    0x0AC$
>=20
> ERROR: code indent should never use tabs
> #1626: FILE: hw/pci-host/mv643xx.h:599:
> +#define MV64340_I2O_QUEUE_CONTROL_REG_PCI_1_SIDE ^I^I    0x0D0$
>=20
> ERROR: code indent should never use tabs
> #1627: FILE: hw/pci-host/mv643xx.h:600:
> +#define MV64340_I2O_QUEUE_BASE_ADDR_REG_PCI_1_SIDE ^I^I    0x0D4$
>=20
> ERROR: code indent should never use tabs
> #1637: FILE: hw/pci-host/mv643xx.h:610:
> +#define MV64340_I2O_INBOUND_MESSAGE_REG0_CPU0_SIDE^I^I    0x1C10$
>=20
> ERROR: code indent should never use tabs
> #1638: FILE: hw/pci-host/mv643xx.h:611:
> +#define MV64340_I2O_INBOUND_MESSAGE_REG1_CPU0_SIDE  ^I^I    0x1C14$
>=20
> ERROR: code indent should never use tabs
> #1639: FILE: hw/pci-host/mv643xx.h:612:
> +#define MV64340_I2O_OUTBOUND_MESSAGE_REG0_CPU0_SIDE ^I^I    0x1C18$
>=20
> ERROR: code indent should never use tabs
> #1640: FILE: hw/pci-host/mv643xx.h:613:
> +#define MV64340_I2O_OUTBOUND_MESSAGE_REG1_CPU0_SIDE  ^I^I    0x1C1C$
>=20
> ERROR: code indent should never use tabs
> #1641: FILE: hw/pci-host/mv643xx.h:614:
> +#define MV64340_I2O_INBOUND_DOORBELL_REG_CPU0_SIDE  ^I^I    0x1C20$
>=20
> ERROR: code indent should never use tabs
> #1642: FILE: hw/pci-host/mv643xx.h:615:
> +#define MV64340_I2O_INBOUND_INTERRUPT_CAUSE_REG_CPU0_SIDE  ^I    0x1C24$
>=20
> ERROR: code indent should never use tabs
> #1643: FILE: hw/pci-host/mv643xx.h:616:
> +#define MV64340_I2O_INBOUND_INTERRUPT_MASK_REG_CPU0_SIDE^I    0x1C28$
>=20
> ERROR: code indent should never use tabs
> #1644: FILE: hw/pci-host/mv643xx.h:617:
> +#define MV64340_I2O_OUTBOUND_DOORBELL_REG_CPU0_SIDE ^I^I    0x1C2C$
>=20
> ERROR: code indent should never use tabs
> #1649: FILE: hw/pci-host/mv643xx.h:622:
> +#define MV64340_I2O_QUEUE_CONTROL_REG_CPU0_SIDE ^I^I    0x1C50$
>=20
> ERROR: code indent should never use tabs
> #1650: FILE: hw/pci-host/mv643xx.h:623:
> +#define MV64340_I2O_QUEUE_BASE_ADDR_REG_CPU0_SIDE ^I^I    0x1C54$
>=20
> ERROR: code indent should never use tabs
> #1659: FILE: hw/pci-host/mv643xx.h:632:
> +#define MV64340_I2O_INBOUND_MESSAGE_REG0_CPU1_SIDE^I^I    0x1C90$
>=20
> ERROR: code indent should never use tabs
> #1660: FILE: hw/pci-host/mv643xx.h:633:
> +#define MV64340_I2O_INBOUND_MESSAGE_REG1_CPU1_SIDE  ^I^I    0x1C94$
>=20
> ERROR: code indent should never use tabs
> #1661: FILE: hw/pci-host/mv643xx.h:634:
> +#define MV64340_I2O_OUTBOUND_MESSAGE_REG0_CPU1_SIDE ^I^I    0x1C98$
>=20
> ERROR: code indent should never use tabs
> #1662: FILE: hw/pci-host/mv643xx.h:635:
> +#define MV64340_I2O_OUTBOUND_MESSAGE_REG1_CPU1_SIDE  ^I^I    0x1C9C$
>=20
> ERROR: code indent should never use tabs
> #1663: FILE: hw/pci-host/mv643xx.h:636:
> +#define MV64340_I2O_INBOUND_DOORBELL_REG_CPU1_SIDE  ^I^I    0x1CA0$
>=20
> ERROR: code indent should never use tabs
> #1664: FILE: hw/pci-host/mv643xx.h:637:
> +#define MV64340_I2O_INBOUND_INTERRUPT_CAUSE_REG_CPU1_SIDE  ^I    0x1CA4$
>=20
> ERROR: code indent should never use tabs
> #1665: FILE: hw/pci-host/mv643xx.h:638:
> +#define MV64340_I2O_INBOUND_INTERRUPT_MASK_REG_CPU1_SIDE^I    0x1CA8$
>=20
> ERROR: code indent should never use tabs
> #1666: FILE: hw/pci-host/mv643xx.h:639:
> +#define MV64340_I2O_OUTBOUND_DOORBELL_REG_CPU1_SIDE ^I^I    0x1CAC$
>=20
> ERROR: code indent should never use tabs
> #1671: FILE: hw/pci-host/mv643xx.h:644:
> +#define MV64340_I2O_QUEUE_CONTROL_REG_CPU1_SIDE ^I^I    0x1CD0$
>=20
> ERROR: code indent should never use tabs
> #1672: FILE: hw/pci-host/mv643xx.h:645:
> +#define MV64340_I2O_QUEUE_BASE_ADDR_REG_CPU1_SIDE ^I^I    0x1CD4$
>=20
> ERROR: code indent should never use tabs
> #1683: FILE: hw/pci-host/mv643xx.h:656:
> +/*        Ethernet Unit Registers  ^I^I*/$
>=20
> WARNING: line over 80 characters
> #1733: FILE: hw/pci-host/mv643xx.h:706:
> +#define MV64340_MPSC_CAUSE_REG(port)                               (0xb8=
04 + (port<<3))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1733: FILE: hw/pci-host/mv643xx.h:706:
> +#define MV64340_MPSC_CAUSE_REG(port)                               (0xb8=
04 + (port<<3))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1734: FILE: hw/pci-host/mv643xx.h:707:
> +#define MV64340_MPSC_MASK_REG(port)                                (0xb8=
84 + (port<<3))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1734: FILE: hw/pci-host/mv643xx.h:707:
> +#define MV64340_MPSC_MASK_REG(port)                                (0xb8=
84 + (port<<3))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1736: FILE: hw/pci-host/mv643xx.h:709:
> +#define MV64340_MPSC_MAIN_CONFIG_LOW(port)                         (0x80=
00 + (port<<12))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1736: FILE: hw/pci-host/mv643xx.h:709:
> +#define MV64340_MPSC_MAIN_CONFIG_LOW(port)                         (0x80=
00 + (port<<12))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1737: FILE: hw/pci-host/mv643xx.h:710:
> +#define MV64340_MPSC_MAIN_CONFIG_HIGH(port)                        (0x80=
04 + (port<<12))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1737: FILE: hw/pci-host/mv643xx.h:710:
> +#define MV64340_MPSC_MAIN_CONFIG_HIGH(port)                        (0x80=
04 + (port<<12))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1738: FILE: hw/pci-host/mv643xx.h:711:
> +#define MV64340_MPSC_PROTOCOL_CONFIG(port)                         (0x80=
08 + (port<<12))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1738: FILE: hw/pci-host/mv643xx.h:711:
> +#define MV64340_MPSC_PROTOCOL_CONFIG(port)                         (0x80=
08 + (port<<12))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1739: FILE: hw/pci-host/mv643xx.h:712:
> +#define MV64340_MPSC_CHANNEL_REG1(port)                            (0x80=
0c + (port<<12))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1739: FILE: hw/pci-host/mv643xx.h:712:
> +#define MV64340_MPSC_CHANNEL_REG1(port)                            (0x80=
0c + (port<<12))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1740: FILE: hw/pci-host/mv643xx.h:713:
> +#define MV64340_MPSC_CHANNEL_REG2(port)                            (0x80=
10 + (port<<12))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1740: FILE: hw/pci-host/mv643xx.h:713:
> +#define MV64340_MPSC_CHANNEL_REG2(port)                            (0x80=
10 + (port<<12))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1741: FILE: hw/pci-host/mv643xx.h:714:
> +#define MV64340_MPSC_CHANNEL_REG3(port)                            (0x80=
14 + (port<<12))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1741: FILE: hw/pci-host/mv643xx.h:714:
> +#define MV64340_MPSC_CHANNEL_REG3(port)                            (0x80=
14 + (port<<12))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1742: FILE: hw/pci-host/mv643xx.h:715:
> +#define MV64340_MPSC_CHANNEL_REG4(port)                            (0x80=
18 + (port<<12))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1742: FILE: hw/pci-host/mv643xx.h:715:
> +#define MV64340_MPSC_CHANNEL_REG4(port)                            (0x80=
18 + (port<<12))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1743: FILE: hw/pci-host/mv643xx.h:716:
> +#define MV64340_MPSC_CHANNEL_REG5(port)                            (0x80=
1c + (port<<12))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1743: FILE: hw/pci-host/mv643xx.h:716:
> +#define MV64340_MPSC_CHANNEL_REG5(port)                            (0x80=
1c + (port<<12))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1744: FILE: hw/pci-host/mv643xx.h:717:
> +#define MV64340_MPSC_CHANNEL_REG6(port)                            (0x80=
20 + (port<<12))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1744: FILE: hw/pci-host/mv643xx.h:717:
> +#define MV64340_MPSC_CHANNEL_REG6(port)                            (0x80=
20 + (port<<12))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1745: FILE: hw/pci-host/mv643xx.h:718:
> +#define MV64340_MPSC_CHANNEL_REG7(port)                            (0x80=
24 + (port<<12))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1745: FILE: hw/pci-host/mv643xx.h:718:
> +#define MV64340_MPSC_CHANNEL_REG7(port)                            (0x80=
24 + (port<<12))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1746: FILE: hw/pci-host/mv643xx.h:719:
> +#define MV64340_MPSC_CHANNEL_REG8(port)                            (0x80=
28 + (port<<12))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1746: FILE: hw/pci-host/mv643xx.h:719:
> +#define MV64340_MPSC_CHANNEL_REG8(port)                            (0x80=
28 + (port<<12))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1747: FILE: hw/pci-host/mv643xx.h:720:
> +#define MV64340_MPSC_CHANNEL_REG9(port)                            (0x80=
2c + (port<<12))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1747: FILE: hw/pci-host/mv643xx.h:720:
> +#define MV64340_MPSC_CHANNEL_REG9(port)                            (0x80=
2c + (port<<12))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1748: FILE: hw/pci-host/mv643xx.h:721:
> +#define MV64340_MPSC_CHANNEL_REG10(port)                           (0x80=
30 + (port<<12))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1748: FILE: hw/pci-host/mv643xx.h:721:
> +#define MV64340_MPSC_CHANNEL_REG10(port)                           (0x80=
30 + (port<<12))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1757: FILE: hw/pci-host/mv643xx.h:730:
> +#define MV64340_SDMA_CONFIG_REG(channel)                        (0x4000 =
+ (channel<<13))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1757: FILE: hw/pci-host/mv643xx.h:730:
> +#define MV64340_SDMA_CONFIG_REG(channel)                        (0x4000 =
+ (channel<<13))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1758: FILE: hw/pci-host/mv643xx.h:731:
> +#define MV64340_SDMA_COMMAND_REG(channel)                       (0x4008 =
+ (channel<<13))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1758: FILE: hw/pci-host/mv643xx.h:731:
> +#define MV64340_SDMA_COMMAND_REG(channel)                       (0x4008 =
+ (channel<<13))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1759: FILE: hw/pci-host/mv643xx.h:732:
> +#define MV64340_SDMA_CURRENT_RX_DESCRIPTOR_POINTER(channel)     (0x4810 =
+ (channel<<13))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1759: FILE: hw/pci-host/mv643xx.h:732:
> +#define MV64340_SDMA_CURRENT_RX_DESCRIPTOR_POINTER(channel)     (0x4810 =
+ (channel<<13))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1760: FILE: hw/pci-host/mv643xx.h:733:
> +#define MV64340_SDMA_CURRENT_TX_DESCRIPTOR_POINTER(channel)     (0x4c10 =
+ (channel<<13))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1760: FILE: hw/pci-host/mv643xx.h:733:
> +#define MV64340_SDMA_CURRENT_TX_DESCRIPTOR_POINTER(channel)     (0x4c10 =
+ (channel<<13))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1761: FILE: hw/pci-host/mv643xx.h:734:
> +#define MV64340_SDMA_FIRST_TX_DESCRIPTOR_POINTER(channel)       (0x4c14 =
+ (channel<<13))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1761: FILE: hw/pci-host/mv643xx.h:734:
> +#define MV64340_SDMA_FIRST_TX_DESCRIPTOR_POINTER(channel)       (0x4c14 =
+ (channel<<13))
>                                                                          =
          ^
>=20
> WARNING: line over 80 characters
> #1768: FILE: hw/pci-host/mv643xx.h:741:
> +#define MV64340_BRG_CONFIG_REG(brg)                              (0xb200=
 + (brg<<3))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1768: FILE: hw/pci-host/mv643xx.h:741:
> +#define MV64340_BRG_CONFIG_REG(brg)                              (0xb200=
 + (brg<<3))
>                                                                          =
       ^
>=20
> WARNING: line over 80 characters
> #1769: FILE: hw/pci-host/mv643xx.h:742:
> +#define MV64340_BRG_BAUDE_TUNING_REG(brg)                        (0xb208=
 + (brg<<3))
>=20
> ERROR: spaces required around that '<<' (ctx:VxV)
> #1769: FILE: hw/pci-host/mv643xx.h:742:
> +#define MV64340_BRG_BAUDE_TUNING_REG(brg)                        (0xb208=
 + (brg<<3))
>                                                                          =
       ^
>=20
> ERROR: code indent should never use tabs
> #1774: FILE: hw/pci-host/mv643xx.h:747:
> +/* DMA Channel Control^I^I^I*/$
>=20
> ERROR: code indent should never use tabs
> #1777: FILE: hw/pci-host/mv643xx.h:750:
> +#define MV64340_DMA_CHANNEL0_CONTROL ^I^I^I^I    0x840$
>=20
> ERROR: code indent should never use tabs
> #1778: FILE: hw/pci-host/mv643xx.h:751:
> +#define MV64340_DMA_CHANNEL0_CONTROL_HIGH^I^I^I    0x880$
>=20
> ERROR: code indent should never use tabs
> #1779: FILE: hw/pci-host/mv643xx.h:752:
> +#define MV64340_DMA_CHANNEL1_CONTROL ^I^I^I^I    0x844$
>=20
> ERROR: code indent should never use tabs
> #1780: FILE: hw/pci-host/mv643xx.h:753:
> +#define MV64340_DMA_CHANNEL1_CONTROL_HIGH^I^I^I    0x884$
>=20
> ERROR: code indent should never use tabs
> #1781: FILE: hw/pci-host/mv643xx.h:754:
> +#define MV64340_DMA_CHANNEL2_CONTROL ^I^I^I^I    0x848$
>=20
> ERROR: code indent should never use tabs
> #1782: FILE: hw/pci-host/mv643xx.h:755:
> +#define MV64340_DMA_CHANNEL2_CONTROL_HIGH^I^I^I    0x888$
>=20
> ERROR: code indent should never use tabs
> #1783: FILE: hw/pci-host/mv643xx.h:756:
> +#define MV64340_DMA_CHANNEL3_CONTROL ^I^I^I^I    0x84C$
>=20
> ERROR: code indent should never use tabs
> #1784: FILE: hw/pci-host/mv643xx.h:757:
> +#define MV64340_DMA_CHANNEL3_CONTROL_HIGH^I^I^I    0x88C$
>=20
> WARNING: Block comments use a leading /* on a separate line
> #1834: FILE: hw/pci-host/mv643xx.h:807:
> + /* IDMA Address Decoding High Address Remap and Access
>=20
> WARNING: Block comments use * on subsequent lines
> #1835: FILE: hw/pci-host/mv643xx.h:808:
> + /* IDMA Address Decoding High Address Remap and Access
> +                  Protection Registers                    */
>=20
> WARNING: Block comments use a trailing */ on a separate line
> #1835: FILE: hw/pci-host/mv643xx.h:808:
> +                  Protection Registers                    */
>=20
> ERROR: code indent should never use tabs
> #1868: FILE: hw/pci-host/mv643xx.h:841:
> +/* Timer_Counter ^I^I^I*/$
>=20
> ERROR: code indent should never use tabs
> #1871: FILE: hw/pci-host/mv643xx.h:844:
> +#define MV64340_TIMER_COUNTER0^I^I^I^I^I    0x850$
>=20
> ERROR: code indent should never use tabs
> #1872: FILE: hw/pci-host/mv643xx.h:845:
> +#define MV64340_TIMER_COUNTER1^I^I^I^I^I    0x854$
>=20
> ERROR: code indent should never use tabs
> #1873: FILE: hw/pci-host/mv643xx.h:846:
> +#define MV64340_TIMER_COUNTER2^I^I^I^I^I    0x858$
>=20
> ERROR: code indent should never use tabs
> #1874: FILE: hw/pci-host/mv643xx.h:847:
> +#define MV64340_TIMER_COUNTER3^I^I^I^I^I    0x85C$
>=20
> ERROR: code indent should never use tabs
> #1875: FILE: hw/pci-host/mv643xx.h:848:
> +#define MV64340_TIMER_COUNTER_0_3_CONTROL^I^I^I    0x864$
>=20
> ERROR: code indent should never use tabs
> #1876: FILE: hw/pci-host/mv643xx.h:849:
> +#define MV64340_TIMER_COUNTER_0_3_INTERRUPT_CAUSE^I^I    0x868$
>=20
> ERROR: code indent should never use tabs
> #1877: FILE: hw/pci-host/mv643xx.h:850:
> +#define MV64340_TIMER_COUNTER_0_3_INTERRUPT_MASK      ^I^I    0x86c$
>=20
> ERROR: code indent should never use tabs
> #1880: FILE: hw/pci-host/mv643xx.h:853:
> +/*         Watchdog registers  ^I        */$
>=20
> ERROR: code indent should never use tabs
> #1911: FILE: hw/pci-host/mv643xx.h:884:
> +/* Interrupts^I  ^I^I^I*/$
>=20
> total: 170 errors, 31 warnings, 1926 lines checked
>=20
> Patch 5/6 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>=20
> 6/6 Checking commit 42b2a155d898 (hw/ppc: Add emulation of Genesi/bPlan P=
egasos II)
> =3D=3D=3D OUTPUT END =3D=3D=3D
>=20
> Test command exited with code: 1
>=20
>=20
> The full log is available at
> http://patchew.org/logs/cover.1614282456.git.balaton@eik.bme.hu/testing.c=
heckpatch/?type=3Dmessage.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LMTQ72cqJccy5B27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA9tBgACgkQbDjKyiDZ
s5KXWhAAneclQd6PqywbCTTeWm1Fg+0WxM/VS2BeWDWROqWyQPZtwxypIUWh0d4M
QuMOeCUMHtFb5BZ9RpvNcENx4M3aexf2zY6Ba3I3vRWYTX0l+KD7TtJxeERD2qi8
5iXf9mdI5ODe8BFwYd9PnjXmAZC18FB94oiYhZu0satUKm2WNAS/huhDKJtW4QoS
RLki4ar3kIqz5EKkGYSOmRChCx779f4YUZa+8VH4u18ovhKywylq6iXCue68QAeR
DgiiXrfN8JNqw0VKt7bTkSQu/ZKOAnWhF+TdZvo3/HUtN3VvtXSMxOSIahBg8Kg+
tDJYYRn5ASn4eUUc8s81WUPDJrd2zrwzTwwrEB06KDXUDHCgfiQ5jT1+cHx5QHJG
Jqm+SUqeh9k+aFclUCWqNbZLijR1OF8pmAbcqk0IV5NgGNGKZWHLNlp1qXDmebnp
aRJPMuXMzD5CqTEW6JpRCb7zKIr42RrCU/TU9aagjODUzIJFsXd4vimFz3wLRIXS
oNDVJvuelmwhNIGXF6fyeahP9xh5iC5KNZ4yGfjPK4Avhx8EkIHOQfGPZUIbPM7u
dwQXvYu+xBH0j0irExp1qOvdtVnkUoArFtrhEAquQyiFzLcJw/dHYoFgWuBfLLT4
R0B8V+CrLbqUgYc+ntYitFl2D7bT/8xOJo57Gdb3L1w+16P4Bmc=
=bZPf
-----END PGP SIGNATURE-----

--LMTQ72cqJccy5B27--

