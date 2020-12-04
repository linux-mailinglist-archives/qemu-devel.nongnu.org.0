Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91F42CF5BE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:40:18 +0100 (CET)
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHsH-0007EM-T4
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1klFsP-0007UF-U5; Fri, 04 Dec 2020 13:32:18 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:40415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1klFsK-0000J7-S4; Fri, 04 Dec 2020 13:32:17 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3B1827176D48;
 Fri,  4 Dec 2020 19:32:06 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 4 Dec 2020
 19:32:06 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001129b99fe-54c6-48e3-bc2f-35d3e3e10c3a,
 977776E1094EFD99122EFBBE6561ABC933400753) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Fri, 4 Dec 2020 19:32:05 +0100
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v10] spapr: Implement Open Firmware client interface
Message-ID: <20201204193205.45d2a15a@bahia.lan>
In-Reply-To: <20201013021911.28701-1-aik@ozlabs.ru>
References: <20201013021911.28701-1-aik@ozlabs.ru>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 3ec9a095-da86-432e-84c2-1ba2d0e980ae
X-Ovh-Tracer-Id: 9270096887021803939
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeikedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleeugedtiefgteetgfekffduueefvdefffehffdulefftdfffeehueetieeihfdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Oct 2020 13:19:11 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> The PAPR platform which describes an OS environment that's presented by
> a combination of a hypervisor and firmware. The features it specifies
> require collaboration between the firmware and the hypervisor.
>=20
> Since the beginning, the runtime component of the firmware (RTAS) has
> been implemented as a 20 byte shim which simply forwards it to
> a hypercall implemented in qemu. The boot time firmware component is
> SLOF - but a build that's specific to qemu, and has always needed to be
> updated in sync with it. Even though we've managed to limit the amount
> of runtime communication we need between qemu and SLOF, there's some,
> and it has become increasingly awkward to handle as we've implemented
> new features.
>=20
> This implements a boot time OF client interface (CI) which is
> enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
> which implements Open Firmware Client Interface (OF CI). This allows
> using a smaller stateless firmware which does not have to manage
> the device tree.
>=20
> The new "vof.bin" firmware image is included with source code under
> pc-bios/. It also includes RTAS blob.
>=20
> This implements a handful of CI methods just to get -kernel/-initrd
> working. In particular, this implements the device tree fetching and
> simple memory allocator - "claim" (an OF CI memory allocator) and updates
> "/memory@0/available" to report the client about available memory.
>=20
> This implements changing some device tree properties which we know how
> to deal with, the rest is ignored. To allow changes, this skips
> fdt_pack() when x-vof=3Don as not packing the blob leaves some room for
> appending.
>=20
> In absence of SLOF, this assigns phandles to device tree nodes to make
> device tree traversing work.
>=20
> When x-vof=3Don, this adds "/chosen" every time QEMU (re)builds a tree.
>=20
> This adds basic instances support which are managed by a hash map
> ihandle -> [phandle].
>=20
> Before the guest started, the used memory is:
> 0..4000 - the initial firmware
> 10000..180000 - stack
>=20
> This OF CI does not implement "interpret".
>=20
> With this basic support, this can only boot into kernel directly.

Maybe worth erroring out if -kernel is missing then.

eg.

void spapr_of_client_machine_init(SpaprMachineState *spapr)
{
    if (!spapr->kernel_size) {
        error_report("The 'x-vof' machine property requires '-kernel'");
        exit(EXIT_FAILURE);
    }
    spapr_register_hypercall(KVMPPC_H_OF_CLIENT, spapr_h_of_client);
}

> However this is just enough for the petitboot kernel and initradmdisk to
> boot from any possible source. Note this requires reasonably recent guest
> kernel with:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Ddf5be5be8735
>=20

FWIW it worked flawlessly with the vmlinuz and initramfs of a recent
rhel8 guest.

The patch is huge and I never find time to do a full review...  so instead
of postponing again and again, I post what I have noted so far.

Please find some comments below.

> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

[...]=20

> @@ -1646,22 +1650,36 @@ static void spapr_machine_reset(MachineState *mac=
hine)
> =20
>      fdt =3D spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
> =20
> -    rc =3D fdt_pack(fdt);
> -
> -    /* Should only fail if we've built a corrupted tree */
> -    assert(rc =3D=3D 0);
> -
> -    /* Load the fdt */
>      qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
> -    cpu_physical_memory_write(fdt_addr, fdt, fdt_totalsize(fdt));
> +
>      g_free(spapr->fdt_blob);
>      spapr->fdt_size =3D fdt_totalsize(fdt);
>      spapr->fdt_initial_size =3D spapr->fdt_size;
>      spapr->fdt_blob =3D fdt;

It is a bit confusing that these are set here and...

> =20
>      /* Set up the entry state */
> -    spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT, 0, fdt_a=
ddr, 0);
>      first_ppc_cpu->env.gpr[5] =3D 0;
> +    if (spapr->vof) {
> +        target_ulong stack_ptr =3D 0;
> +
> +        spapr_setup_of_client(spapr, &stack_ptr);
> +        spapr_of_client_dt_finalize(spapr);
> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
> +                                  stack_ptr, spapr->initrd_base,
> +                                  spapr->initrd_size);
> +    } else {
> +        /* Load the fdt */
> +        rc =3D fdt_pack(spapr->fdt_blob);
> +        /* Should only fail if we've built a corrupted tree */
> +        assert(rc =3D=3D 0);
> +
> +        spapr->fdt_size =3D fdt_totalsize(spapr->fdt_blob);
> +        spapr->fdt_initial_size =3D spapr->fdt_size;

... overwritten there. I guess this is because fdt_pack() has an
impact on fdt_totalsize(), right ? Could this be consolidated
in an helper that optionally calls fdt_pack() ?

> +        cpu_physical_memory_write(fdt_addr, spapr->fdt_blob, spapr->fdt_=
size);
> +
> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
> +                                  0, fdt_addr, 0);
> +    }
> =20
>      spapr->fwnmi_system_reset_addr =3D -1;
>      spapr->fwnmi_machine_check_addr =3D -1;

[...]

> @@ -3296,6 +3332,11 @@ static void spapr_instance_init(Object *obj)
>                                      stringify(KERNEL_LOAD_ADDR)
>                                      " for -kernel is the default");
>      spapr->kernel_addr =3D KERNEL_LOAD_ADDR;
> +    object_property_add_bool(obj, "x-vof", spapr_get_vof, spapr_set_vof);
> +    object_property_set_description(obj, "x-vof",
> +                                    "Enable Virtual Open Firmware");
> +    spapr->vof =3D false;

We usually don't initialize to false or 0 since QOM already
does memset(0) on the instance.

> +
>      /* The machine class defines the default interrupt controller mode */
>      spapr->irq =3D smc->irq;
>      object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,

[...]

> diff --git a/hw/ppc/spapr_of_client.c b/hw/ppc/spapr_of_client.c
> new file mode 100644
> index 000000000000..04b1543696b0
> --- /dev/null
> +++ b/hw/ppc/spapr_of_client.c
> @@ -0,0 +1,1011 @@
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include <sys/ioctl.h>
> +#include "qapi/error.h"
> +#include "hw/ppc/spapr.h"
> +#include "hw/ppc/spapr_vio.h"
> +#include "hw/ppc/fdt.h"
> +#include "sysemu/sysemu.h"
> +#include "qom/qom-qobject.h"
> +#include "trace.h"
> +
> +/*
> + * OF 1275 "nextprop" description suggests is it 32 bytes max but
> + * LoPAPR defines "ibm,query-interrupt-source-number" which is 33 chars =
long.
> + */
> +#define OF_PROPNAME_LEN_MAX 64
> +
> +/* Copied from SLOF, and 4K is definitely not enough for GRUB */
> +#define OF_STACK_SIZE       0x8000
> +
> +/* 0..10000 is reserved for the VOF fw */
> +#define OF_STACK_ADDR       0x10000
> +
> +#define ALIGN(x, a) (((x) + (a) - 1) & ~((a) - 1))
> +
> +typedef struct {
> +    uint64_t start;
> +    uint64_t size;
> +} SpaprOfClaimed;
> +
> +typedef struct {
> +    char *params;
> +    char *path; /* the path used to open the instance */
> +    uint32_t phandle;
> +} SpaprOfInstance;
> +
> +/* Defined as Big Endian */
> +struct prom_args {
> +    uint32_t service;
> +    uint32_t nargs;
> +    uint32_t nret;
> +    uint32_t args[10];
> +} QEMU_PACKED;
> +

The QEMU_PACKED breaks build with gcc-10.2.1-6.fc32.x86_64:

../../hw/ppc/spapr_of_client.c: In function =E2=80=98spapr_h_of_client=E2=
=80=99:
../../hw/ppc/spapr_of_client.c:793:35: error: taking address of packed memb=
er of =E2=80=98struct prom_args=E2=80=99 may result in an unaligned pointer=
 value [-Werror=3Daddress-of-packed-member]
  793 |                                   &pargs.args[nargs + 1]);
      |                                   ^~~~~~~~~~~~~~~~~~~~~~
../../hw/ppc/spapr_of_client.c:800:38: error: taking address of packed memb=
er of =E2=80=98struct prom_args=E2=80=99 may result in an unaligned pointer=
 value [-Werror=3Daddress-of-packed-member]
  800 |                                      &pargs.args[nargs + 1]);
      |                                      ^~~~~~~~~~~~~~~~~~~~~~

Fixable by dropping QEMU_PACKED and adding:

QEMU_BUILD_BUG_ON(sizeof(struct prom_args) !=3D 13 * 4);

> +static void readstr(hwaddr pa, char *buf, int size)
> +{
> +    cpu_physical_memory_read(pa, buf, size);
> +    if (buf[size - 1] !=3D '\0') {
> +        buf[size - 1] =3D '\0';
> +        if (strlen(buf) =3D=3D size - 1) {
> +            trace_spapr_of_client_error_str_truncated(buf, size);
> +        }
> +    }
> +}
> +
> +static bool cmpservice(const char *s, size_t len,
> +                       unsigned nargs, unsigned nret,
> +                       const char *s1, size_t len1,
> +                       unsigned nargscheck, unsigned nretcheck)
> +{
> +    if (strcmp(s, s1)) {
> +        return false;
> +    }
> +    if ((nargscheck && (nargs !=3D nargscheck)) ||
> +        (nretcheck && (nret !=3D nretcheck))) {

Parenthesitis : !=3D has precedence over &&.

> +        trace_spapr_of_client_error_param(s, nargscheck, nretcheck, narg=
s,
> +                                          nret);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void split_path(const char *fullpath, char **node, char **unit,
> +                       char **part)
> +{
> +    const char *c, *p =3D NULL, *u =3D NULL;
> +
> +    *node =3D *unit =3D *part =3D NULL;
> +
> +    if (fullpath[0] =3D=3D '\0') {
> +        *node =3D g_strdup(fullpath);
> +        return;
> +    }
> +
> +    for (c =3D fullpath + strlen(fullpath) - 1; c > fullpath; --c) {
> +        if (*c =3D=3D '/') {
> +            break;
> +        }
> +        if (*c =3D=3D ':') {
> +            p =3D c + 1;
> +            continue;
> +        }
> +        if (*c =3D=3D '@') {
> +            u =3D c + 1;
> +            continue;
> +        }
> +    }
> +
> +    if (p && u && p < u) {
> +        p =3D NULL;
> +    }
> +
> +    if (u && p) {
> +        *node =3D g_strndup(fullpath, u - fullpath - 1);
> +        *unit =3D g_strndup(u, p - u - 1);
> +        *part =3D g_strdup(p);
> +    } else if (!u && p) {
> +        *node =3D g_strndup(fullpath, p - fullpath - 1);
> +        *part =3D g_strdup(p);
> +    } else if (!p && u) {
> +        *node =3D g_strndup(fullpath, u - fullpath - 1);
> +        *unit =3D g_strdup(u);
> +    } else {
> +        *node =3D g_strdup(fullpath);
> +    }

It looks like this function could be simplified by using g_strsplit_set().

> +}
> +
> +static void prop_format(char *tval, int tlen, const void *prop, int len)
> +{
> +    int i;
> +    const char *c;
> +    char *t;
> +    const char bin[] =3D "...";
> +
> +    for (i =3D 0, c =3D prop; i < len; ++i, ++c) {
> +        if (*c =3D=3D '\0' && i =3D=3D len - 1) {
> +            strncpy(tval, prop, tlen - 1);
> +            return;
> +        }
> +        if (*c < 0x20 || *c >=3D 0x80) {

This breaks build with gcc-10.2.1-6.fc32.x86_64:

../../hw/ppc/spapr_of_client.c: In function =E2=80=98prop_format=E2=80=99:
../../hw/ppc/spapr_of_client.c:131:29: error: comparison is always false du=
e to limited range of data type [-Werror=3Dtype-limits]
  131 |         if (*c < 0x20 || *c >=3D 0x80) {
      |                             ^~

Fixable by making 'c' a 'const unsigned char'.

> +            break;
> +        }
> +    }
> +
> +    for (i =3D 0, c =3D prop, t =3D tval; i < len; ++i, ++c) {
> +        if (t >=3D tval + tlen - sizeof(bin) - 1 - 2 - 1) {
> +            strcpy(t, bin);
> +            return;
> +        }
> +        if (i && i % 4 =3D=3D 0 && i !=3D len - 1) {
> +            strcat(t, " ");
> +            ++t;
> +        }
> +        t +=3D sprintf(t, "%02X", *c & 0xFF);
> +    }
> +}
> +
> +static int of_client_fdt_path_offset(const void *fdt, const char *node,
> +                                     const char *unit)
> +{
> +    int offset;
> +
> +    offset =3D fdt_path_offset(fdt, node);
> +
> +    if (offset < 0 && unit) {
> +        char *tmp =3D g_strdup_printf("%s@%s", node, unit);
> +
> +        offset =3D fdt_path_offset(fdt, tmp);
> +        g_free(tmp);

CODING_STYLE advocates the use of g_autofree instead of manually
calling g_free().

> +    }
> +
> +    return offset;
> +}
> +
> +static uint32_t of_client_finddevice(const void *fdt, uint32_t nodeaddr)
> +{
> +    char *node, *unit, *part;

If you do this:

    g_autofree *node =3D NULL, *unit =3D NULL, *part =3D NULL;

> +    char fullnode[1024];
> +    uint32_t ret =3D -1;
> +    int offset;
> +
> +    readstr(nodeaddr, fullnode, sizeof(fullnode));
> +
> +    split_path(fullnode, &node, &unit, &part);
> +    offset =3D of_client_fdt_path_offset(fdt, node, unit);
> +    if (offset >=3D 0) {
> +        ret =3D fdt_get_phandle(fdt, offset);
> +    }
> +    trace_spapr_of_client_finddevice(fullnode, ret);
> +    g_free(node);
> +    g_free(unit);
> +    g_free(part);

You can drop these ^^

You should be able to work out something similar with g_auto(GStrv) if
you decide to use g_strsplit_set().

> +    return (uint32_t) ret;
> +}
> +

[...]

> +static uint32_t of_client_setprop(SpaprMachineState *spapr,
> +                                  uint32_t nodeph, uint32_t pname,
> +                                  uint32_t valaddr, uint32_t vallen)
> +{
> +    char propname[OF_PROPNAME_LEN_MAX + 1];
> +    uint32_t ret =3D -1;
> +    int offset;
> +    char trval[64] =3D "";
> +
> +    readstr(pname, propname, sizeof(propname));
> +    /*
> +     * We only allow changing properties which we know how to update on
> +     * the QEMU side.
> +     */
> +    if (vallen =3D=3D sizeof(uint32_t)) {
> +        uint32_t val32 =3D ldl_be_phys(first_cpu->as, valaddr);
> +
> +        if ((strcmp(propname, "linux,rtas-base") =3D=3D 0) ||
> +            (strcmp(propname, "linux,rtas-entry") =3D=3D 0)) {

What about :

        if (!strcmp(propname, "linux,rtas-base") ||
            !strcmp(propname, "linux,rtas-entry")) {

> +            spapr->rtas_base =3D val32;
> +        } else if (strcmp(propname, "linux,initrd-start") =3D=3D 0) {
> +            spapr->initrd_base =3D val32;
> +        } else if (strcmp(propname, "linux,initrd-end") =3D=3D 0) {
> +            spapr->initrd_size =3D val32 - spapr->initrd_base;
> +        } else {
> +            goto trace_exit;
> +        }

[...]

> +static uint32_t spapr_of_client_open(SpaprMachineState *spapr, const cha=
r *path)
> +{
> +    int offset;
> +    uint32_t ret =3D 0;
> +    SpaprOfInstance *inst =3D NULL;
> +    char *node, *unit, *part;
> +
> +    if (spapr->of_instance_last =3D=3D 0xFFFFFFFF) {
> +        /* We do not recycle ihandles yet */
> +        goto trace_exit;

And g_free() is passed uninitialized pointers.

A typical use case for the g_auto magic.

> +    }
> +
> +    split_path(path, &node, &unit, &part);
> +
> +    offset =3D of_client_fdt_path_offset(spapr->fdt_blob, node, unit);
> +    if (offset < 0) {
> +        trace_spapr_of_client_error_unknown_path(path);
> +        goto trace_exit;
> +    }
> +
> +    inst =3D g_new0(SpaprOfInstance, 1);
> +    inst->phandle =3D fdt_get_phandle(spapr->fdt_blob, offset);
> +    g_assert(inst->phandle);
> +    ++spapr->of_instance_last;
> +
> +    inst->path =3D g_strdup(path);
> +    inst->params =3D part;
> +    g_hash_table_insert(spapr->of_instances,
> +                        GINT_TO_POINTER(spapr->of_instance_last),
> +                        inst);
> +    ret =3D spapr->of_instance_last;
> +
> +trace_exit:
> +    trace_spapr_of_client_open(path, inst ? inst->phandle : 0, ret);
> +    g_free(node);
> +    g_free(unit);

If you don't switch to g_auto, it seems you should at least add:

    g_free(part);

> +
> +    return ret;
> +}
> +
> +static uint32_t of_client_open(SpaprMachineState *spapr, uint32_t pathad=
dr)
> +{
> +    char path[256];
> +
> +    readstr(pathaddr, path, sizeof(path));
> +
> +    return spapr_of_client_open(spapr, path);
> +}
> +
> +static void of_client_close(SpaprMachineState *spapr, uint32_t ihandle)
> +{
> +    if (!g_hash_table_remove(spapr->of_instances, GINT_TO_POINTER(ihandl=
e))) {
> +        trace_spapr_of_client_error_unknown_ihandle_close(ihandle);
> +    }
> +}
> +
> +static uint32_t of_client_instance_to_package(SpaprMachineState *spapr,
> +                                              uint32_t ihandle)
> +{
> +    gpointer instp =3D g_hash_table_lookup(spapr->of_instances,
> +                                         GINT_TO_POINTER(ihandle));
> +    uint32_t ret =3D -1;
> +
> +    if (instp) {
> +        ret =3D ((SpaprOfInstance *)instp)->phandle;
> +    }
> +    trace_spapr_of_client_instance_to_package(ihandle, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t of_client_package_to_path(const void *fdt, uint32_t phan=
dle,
> +                                          uint32_t buf, uint32_t len)
> +{
> +    uint32_t ret =3D -1;
> +    char tmp[256] =3D "";
> +
> +    if (0 =3D=3D fdt_get_path(fdt, fdt_node_offset_by_phandle(fdt, phand=
le), tmp,
> +                          sizeof(tmp))) {

Quite an usual way to check for nullity. Any reason not to
just s/0 =3D=3D /!/ and save some indentation ?

> +        tmp[sizeof(tmp) - 1] =3D 0;
> +        ret =3D MIN(len, strlen(tmp) + 1);
> +        cpu_physical_memory_write(buf, tmp, ret);
> +    }
> +
> +    trace_spapr_of_client_package_to_path(phandle, tmp, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t of_client_instance_to_path(SpaprMachineState *spapr,
> +                                           uint32_t ihandle, uint32_t bu=
f,
> +                                           uint32_t len)
> +{
> +    uint32_t ret =3D -1;
> +    uint32_t phandle =3D of_client_instance_to_package(spapr, ihandle);
> +    char tmp[256] =3D "";
> +
> +    if (phandle !=3D -1) {
> +        if (0 =3D=3D fdt_get_path(spapr->fdt_blob,

ditto

> +                              fdt_node_offset_by_phandle(spapr->fdt_blob,
> +                                                         phandle),
> +                              tmp, sizeof(tmp))) {
> +            tmp[sizeof(tmp) - 1] =3D 0;
> +            ret =3D MIN(len, strlen(tmp) + 1);
> +            cpu_physical_memory_write(buf, tmp, ret);
> +        }
> +    }
> +    trace_spapr_of_client_instance_to_path(ihandle, phandle, tmp, ret);
> +
> +    return ret;
> +}
> +

[...]

> +static uint32_t of_client_call_method(SpaprMachineState *spapr,
> +                                      uint32_t methodaddr, uint32_t ihan=
dle,
> +                                      uint32_t param1, uint32_t param2,
> +                                      uint32_t param3, uint32_t param4,
> +                                      uint32_t *ret2)
> +{
> +    uint32_t ret =3D -1;
> +    char method[256] =3D "";
> +    SpaprOfInstance *inst =3D NULL;

It doesn't seem that inst needs to be initialized.

> +
> +    if (!ihandle) {
> +        goto trace_exit;
> +    }
> +
> +    inst =3D (SpaprOfInstance *) g_hash_table_lookup(spapr->of_instances,
> +                                                   GINT_TO_POINTER(ihand=
le));
> +    if (!inst) {
> +        goto trace_exit;
> +    }
> +
> +    readstr(methodaddr, method, sizeof(method));
> +
> +    if (strcmp(inst->path, "/") =3D=3D 0) {
> +        if (strcmp(method, "ibm,client-architecture-support") =3D=3D 0) {
> +            ret =3D do_client_architecture_support(POWERPC_CPU(first_cpu=
), spapr,
> +                                                 param1, FDT_MAX_SIZE);
> +            *ret2 =3D 0;
> +        }
> +    } else if (strcmp(inst->path, "/rtas") =3D=3D 0) {
> +        if (strcmp(method, "instantiate-rtas") =3D=3D 0) {
> +            of_client_instantiate_rtas(spapr, param1);
> +            ret =3D 0;
> +            *ret2 =3D param1; /* rtasbase */

rtas-base ?

> +        }
> +    } else {
> +        trace_spapr_of_client_error_unknown_method(method);
> +    }
> +
> +trace_exit:
> +    trace_spapr_of_client_method(ihandle, method, param1, ret, *ret2);
> +
> +    return ret;
> +}
> +
> +static uint32_t of_client_call_interpret(SpaprMachineState *spapr,
> +                                         uint32_t cmdaddr, uint32_t para=
m1,
> +                                         uint32_t param2, uint32_t *ret2)
> +{
> +    uint32_t ret =3D -1;
> +    char cmd[256] =3D "";
> +
> +    readstr(cmdaddr, cmd, sizeof(cmd));
> +    trace_spapr_of_client_interpret(cmd, param1, param2, ret, *ret2);
> +
> +    return ret;
> +}
> +
> +static void of_client_quiesce(SpaprMachineState *spapr)
> +{
> +    int rc =3D fdt_pack(spapr->fdt_blob);
> +
> +    assert(rc =3D=3D 0);
> +
> +    spapr->fdt_size =3D fdt_totalsize(spapr->fdt_blob);
> +    spapr->fdt_initial_size =3D spapr->fdt_size;

Same code pattern  as in spapr_machine_reset(). A helper ?

> +    of_client_clamed_dump(spapr->claimed);
> +}
> +
> +static target_ulong spapr_h_of_client(PowerPCCPU *cpu, SpaprMachineState=
 *spapr,
> +                                      target_ulong opcode, target_ulong =
*args)
> +{
> +    target_ulong of_client_args =3D ppc64_phys_to_real(args[0]);
> +    struct prom_args pargs =3D { 0 };
> +    char service[64];
> +    unsigned nargs, nret;
> +    int i, servicelen;
> +
> +    cpu_physical_memory_read(of_client_args, &pargs, sizeof(pargs));
> +    nargs =3D be32_to_cpu(pargs.nargs);
> +    nret =3D be32_to_cpu(pargs.nret);
> +    readstr(be32_to_cpu(pargs.service), service, sizeof(service));
> +    servicelen =3D strlen(service);
> +
> +    if (nargs >=3D ARRAY_SIZE(pargs.args)) {
> +        return H_PARAMETER;
> +    }
> +
> +#define cmpserv(s, a, r) \
> +    cmpservice(service, servicelen, nargs, nret, (s), sizeof(s), (a), (r=
))
> +
> +    if (cmpserv("finddevice", 1, 1)) {
> +        pargs.args[nargs] =3D
> +            of_client_finddevice(spapr->fdt_blob,
> +                                 be32_to_cpu(pargs.args[0]));
> +    } else if (cmpserv("getprop", 4, 1)) {
> +        pargs.args[nargs] =3D
> +            of_client_getprop(spapr->fdt_blob,
> +                              be32_to_cpu(pargs.args[0]),
> +                              be32_to_cpu(pargs.args[1]),
> +                              be32_to_cpu(pargs.args[2]),
> +                              be32_to_cpu(pargs.args[3]));
> +    } else if (cmpserv("getproplen", 2, 1)) {
> +        pargs.args[nargs] =3D
> +            of_client_getproplen(spapr->fdt_blob,
> +                                 be32_to_cpu(pargs.args[0]),
> +                                 be32_to_cpu(pargs.args[1]));
> +    } else if (cmpserv("setprop", 4, 1)) {
> +        pargs.args[nargs] =3D
> +            of_client_setprop(spapr,
> +                              be32_to_cpu(pargs.args[0]),
> +                              be32_to_cpu(pargs.args[1]),
> +                              be32_to_cpu(pargs.args[2]),
> +                              be32_to_cpu(pargs.args[3]));
> +    } else if (cmpserv("nextprop", 3, 1)) {
> +        pargs.args[nargs] =3D
> +            of_client_nextprop(spapr->fdt_blob,
> +                               be32_to_cpu(pargs.args[0]),
> +                               be32_to_cpu(pargs.args[1]),
> +                               be32_to_cpu(pargs.args[2]));
> +    } else if (cmpserv("peer", 1, 1)) {
> +        pargs.args[nargs] =3D
> +            of_client_peer(spapr->fdt_blob,
> +                           be32_to_cpu(pargs.args[0]));
> +    } else if (cmpserv("child", 1, 1)) {
> +        pargs.args[nargs] =3D
> +            of_client_child(spapr->fdt_blob,
> +                            be32_to_cpu(pargs.args[0]));
> +    } else if (cmpserv("parent", 1, 1)) {
> +        pargs.args[nargs] =3D
> +            of_client_parent(spapr->fdt_blob,
> +                             be32_to_cpu(pargs.args[0]));
> +    } else if (cmpserv("open", 1, 1)) {
> +        pargs.args[nargs] =3D of_client_open(spapr, be32_to_cpu(pargs.ar=
gs[0]));
> +    } else if (cmpserv("close", 1, 0)) {
> +        of_client_close(spapr, be32_to_cpu(pargs.args[0]));
> +    } else if (cmpserv("instance-to-package", 1, 1)) {
> +        pargs.args[nargs] =3D
> +            of_client_instance_to_package(spapr,
> +                                          be32_to_cpu(pargs.args[0]));
> +    } else if (cmpserv("package-to-path", 3, 1)) {
> +        pargs.args[nargs] =3D
> +            of_client_package_to_path(spapr->fdt_blob,
> +                                      be32_to_cpu(pargs.args[0]),
> +                                      be32_to_cpu(pargs.args[1]),
> +                                      be32_to_cpu(pargs.args[2]));
> +    } else if (cmpserv("instance-to-path", 3, 1)) {
> +        pargs.args[nargs] =3D
> +            of_client_instance_to_path(spapr,
> +                                       be32_to_cpu(pargs.args[0]),
> +                                       be32_to_cpu(pargs.args[1]),
> +                                       be32_to_cpu(pargs.args[2]));
> +    } else if (cmpserv("claim", 3, 1)) {
> +        pargs.args[nargs] =3D
> +            of_client_claim(spapr,
> +                            be32_to_cpu(pargs.args[0]),
> +                            be32_to_cpu(pargs.args[1]),
> +                            be32_to_cpu(pargs.args[2]));
> +    } else if (cmpserv("release", 2, 0)) {
> +        pargs.args[nargs] =3D
> +            of_client_release(spapr,
> +                              be32_to_cpu(pargs.args[0]),
> +                              be32_to_cpu(pargs.args[1]));
> +    } else if (cmpserv("call-method", 0, 0)) {
> +        pargs.args[nargs] =3D
> +            of_client_call_method(spapr,
> +                                  be32_to_cpu(pargs.args[0]),
> +                                  be32_to_cpu(pargs.args[1]),
> +                                  be32_to_cpu(pargs.args[2]),
> +                                  be32_to_cpu(pargs.args[3]),
> +                                  be32_to_cpu(pargs.args[4]),
> +                                  be32_to_cpu(pargs.args[5]),
> +                                  &pargs.args[nargs + 1]);
> +    } else if (cmpserv("interpret", 0, 0)) {
> +        pargs.args[nargs] =3D
> +            of_client_call_interpret(spapr,
> +                                     be32_to_cpu(pargs.args[0]),
> +                                     be32_to_cpu(pargs.args[1]),
> +                                     be32_to_cpu(pargs.args[2]),
> +                                     &pargs.args[nargs + 1]);
> +    } else if (cmpserv("milliseconds", 0, 1)) {
> +        pargs.args[nargs] =3D qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
> +    } else if (cmpserv("quiesce", 0, 0)) {
> +        of_client_quiesce(spapr);
> +    } else if (cmpserv("exit", 0, 0)) {
> +        error_report("Stopped as the VM requested \"exit\"");
> +        vm_stop(RUN_STATE_PAUSED); /* Or qemu_system_guest_panicked(NULL=
); ? */

qemu_system_guest_panicked(NULL) seems more appropriate IMHO.

> +    } else {
> +        trace_spapr_of_client_error_unknown_service(service, nargs, nret=
);
> +        pargs.args[nargs] =3D -1;
> +    }
> +
> +    for (i =3D 0; i < nret; ++i) {
> +        pargs.args[nargs + i] =3D be32_to_cpu(pargs.args[nargs + i]);
> +    }
> +
> +    cpu_physical_memory_write(of_client_args, &pargs,
> +                              sizeof(uint32_t) * (3 + nargs + nret));
> +
> +    return H_SUCCESS;
> +}
> +

That's all for now.

Cheers,

--
Greg

