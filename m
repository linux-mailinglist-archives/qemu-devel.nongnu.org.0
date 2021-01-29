Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9FE30890F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:29:22 +0100 (CET)
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Stt-0003as-ML
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l5S9W-00007u-SF; Fri, 29 Jan 2021 06:41:26 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:34601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l5S9R-0007Q9-NN; Fri, 29 Jan 2021 06:41:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 9B9878702512;
 Fri, 29 Jan 2021 12:41:17 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 29 Jan
 2021 12:41:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003004a27c6-5f78-436b-8683-3705c4fd85fb,
 F0B20D4B8DDBF51DA61C26A45925665B938B7F3E) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 29 Jan 2021 12:41:15 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2] ppc/pnv: Set default RAM size to 1 GB
Message-ID: <20210129124115.750432da@bahia.lan>
In-Reply-To: <20210129111719.790692-1-clg@kaod.org>
References: <20210129111719.790692-1-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 1cf3e04c-3858-42e0-83e2-e1ff9e216e88
X-Ovh-Tracer-Id: 17608230120150702499
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedvgdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 12:17:19 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> The memory layout of the PowerNV machine is defined as :
>=20
>   #define KERNEL_LOAD_BASE	((void *)0x20000000)
>   #define KERNEL_LOAD_SIZE	0x08000000
>=20
>   #define INITRAMFS_LOAD_BASE	KERNEL_LOAD_BASE + KERNEL_LOAD_SIZE
>   #define INITRAMFS_LOAD_SIZE	0x08000000
>=20
>   #define SKIBOOT_BASE		0x30000000
>   #define SKIBOOT_SIZE		0x01c10000
>=20
>   #define CPU_STACKS_BASE	(SKIBOOT_BASE + SKIBOOT_SIZE)
>   #define STACK_SHIFT		15
>   #define STACK_SIZE		(1 << STACK_SHIFT)
>=20
> The overall size of the CPU stacks is (max PIR + 1) * 32K and the
> machine easily reaches 800MB of minimum required RAM.
>=20
> Any value below will result in a skiboot crash :
>=20
>     [    0.034949905,3] MEM: Partial overlap detected between regions:
>     [    0.034959039,3] MEM: ibm,firmware-stacks [0x31c10000-0x3a450000] =
(new)
>     [    0.034968576,3] MEM: ibm,firmware-allocs-memory@0 [0x31c10000-0x3=
8400000]
>     [    0.034980367,3] Out of memory adding skiboot reserved areas
>     [    0.035074945,3] ***********************************************
>     [    0.035093627,3] < assert failed at core/mem_region.c:1129 >
>     [    0.035104247,3]     .
>     [    0.035108025,3]      .
>     [    0.035111651,3]       .
>     [    0.035115231,3]         OO__)
>     [    0.035119198,3]        <"__/
>     [    0.035122980,3]         ^ ^
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/ppc/pnv.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 50810df83815..77af846cdfea 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -21,6 +21,7 @@
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
> +#include "qemu/cutils.h"
>  #include "qapi/error.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/sysemu.h"
> @@ -725,8 +726,11 @@ static void pnv_init(MachineState *machine)
>      DeviceState *dev;
> =20
>      /* allocate RAM */
> -    if (machine->ram_size < (1 * GiB)) {
> -        warn_report("skiboot may not work with < 1GB of RAM");
> +    if (machine->ram_size < mc->default_ram_size) {
> +        char *sz =3D size_to_str(mc->default_ram_size);
> +        error_report("Invalid RAM size, should be bigger than %s", sz);
> +        g_free(sz);

FWIW you could even not call g_free() at all since this is an
exit path and this code is unlikely to be reused differently,
or stay clean and tag 'sz' with g_autofree as recommended in
CODING_STYLE.

Anyway, this is definitely an improvement so:

Reviewed-by: Greg Kurz <groug@kaod.org>

> +        exit(EXIT_FAILURE);
>      }
>      memory_region_add_subregion(get_system_memory(), 0, machine->ram);
> =20
> @@ -1994,7 +1998,7 @@ static void pnv_machine_class_init(ObjectClass *oc,=
 void *data)
>       * RAM defaults to less than 2048 for 32-bit hosts, and large
>       * enough to fit the maximum initrd size at it's load address
>       */
> -    mc->default_ram_size =3D INITRD_LOAD_ADDR + INITRD_MAX_SIZE;
> +    mc->default_ram_size =3D 1 * GiB;
>      mc->default_ram_id =3D "pnv.ram";
>      ispc->print_info =3D pnv_pic_print_info;
>      nc->nmi_monitor_handler =3D pnv_nmi;


