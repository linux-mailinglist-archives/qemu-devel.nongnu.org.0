Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2A94873C3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 08:53:30 +0100 (CET)
Received: from localhost ([::1]:58828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5k41-0005Hu-JC
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 02:53:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5k17-0003tU-Lq; Fri, 07 Jan 2022 02:50:30 -0500
Received: from [2001:41c9:1:41f::167] (port=38236
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5k13-0001l8-8d; Fri, 07 Jan 2022 02:50:27 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5k0V-00011q-4M; Fri, 07 Jan 2022 07:49:55 +0000
Message-ID: <5a63cdca-51bd-4a9f-7963-afb7305bd2e9@ilande.co.uk>
Date: Fri, 7 Jan 2022 07:50:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220105104800.407570-1-thuth@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220105104800.407570-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] MAINTAINERS: Improve the PowerPC machines section
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2022 10:48, Thomas Huth wrote:

> Add some documentation files to the corresponding machine sections
> and mention the machine names in the section titles where it is
> not so obvious (e.g. that "taihu" is a 405 machine).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f871d759fd..53cf0fdc00 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1245,7 +1245,7 @@ F: hw/openrisc/openrisc_sim.c
>   
>   PowerPC Machines
>   ----------------
> -405
> +405 (ref405ep and taihu)
>   L: qemu-ppc@nongnu.org
>   S: Orphan
>   F: hw/ppc/ppc405_boards.c
> @@ -1281,6 +1281,7 @@ New World (mac99)
>   M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>   L: qemu-ppc@nongnu.org
>   S: Odd Fixes
> +F: docs/system/ppc/powermac.rst
>   F: hw/ppc/mac_newworld.c
>   F: hw/pci-host/uninorth.c
>   F: hw/pci-bridge/dec.[hc]
> @@ -1299,6 +1300,7 @@ Old World (g3beige)
>   M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>   L: qemu-ppc@nongnu.org
>   S: Odd Fixes
> +F: docs/system/ppc/powermac.rst
>   F: hw/ppc/mac_oldworld.c
>   F: hw/pci-host/grackle.c
>   F: hw/misc/macio/
> @@ -1312,6 +1314,7 @@ PReP
>   M: Hervé Poussineau <hpoussin@reactos.org>
>   L: qemu-ppc@nongnu.org
>   S: Maintained
> +F: docs/system/ppc/prep.rst
>   F: hw/ppc/prep.c
>   F: hw/ppc/prep_systemio.c
>   F: hw/ppc/rs6000_mc.c
> @@ -1324,7 +1327,7 @@ F: include/hw/isa/pc87312.h
>   F: include/hw/rtc/m48t59.h
>   F: tests/avocado/ppc_prep_40p.py
>   
> -sPAPR
> +sPAPR (pseries)
>   M: Cédric Le Goater <clg@kaod.org>
>   M: Daniel Henrique Barboza <danielhb413@gmail.com>
>   R: David Gibson <david@gibson.dropbear.id.au>
> @@ -1336,8 +1339,8 @@ F: include/hw/*/spapr*
>   F: hw/*/xics*
>   F: include/hw/*/xics*
>   F: pc-bios/slof.bin
> -F: docs/specs/ppc-spapr-hcalls.txt
> -F: docs/specs/ppc-spapr-hotplug.txt
> +F: docs/system/ppc/pseries.rst
> +F: docs/specs/ppc-spapr-*
>   F: tests/qtest/spapr*
>   F: tests/qtest/libqos/*spapr*
>   F: tests/qtest/rtas*
> @@ -1348,6 +1351,7 @@ PowerNV (Non-Virtualized)
>   M: Cédric Le Goater <clg@kaod.org>
>   L: qemu-ppc@nongnu.org
>   S: Maintained
> +F: docs/system/ppc/powernv.rst
>   F: hw/ppc/pnv*
>   F: hw/intc/pnv*
>   F: hw/intc/xics_pnv.c

For the New World and Old World machines:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

