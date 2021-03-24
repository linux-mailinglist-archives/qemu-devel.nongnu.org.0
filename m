Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBB1346F21
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:58:23 +0100 (CET)
Received: from localhost ([::1]:48728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsmt-0000iK-1A
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsdx-0002Cn-S6; Tue, 23 Mar 2021 21:49:09 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55003 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsds-0007uC-Ou; Tue, 23 Mar 2021 21:49:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4rkN6ymbz9sWj; Wed, 24 Mar 2021 12:49:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616550540;
 bh=MTyA8Pa/Ar6jy0pAjUXTfhrW5P0k2/q44qaxMXsqm74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KdnHTWynf8swReq7Y/9y1E4pymLOJ/Y4BA4ITXxhusyX+4rYVBeLlme8jHawQbDIz
 C5Y+stkGV53zuwaZp8kRVId5BQknSOVvhdBWZYRlIX1zNe5na8fpnvudk50edro4e8
 8a/BoHy6sq7Xbv9ysn7JePblZact0UlEeAMWE24M=
Date: Wed, 24 Mar 2021 12:48:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v10 6/7] hw/pci-host: Add emulation of Marvell MV64361
 PPC system controller
Message-ID: <YFqah3YX0rbZFkEO@yekko.fritz.box>
References: <cover.1615943871.git.balaton@eik.bme.hu>
 <ed5661ffa159546a8f9816316345906f33b12b2d.1615943871.git.balaton@eik.bme.hu>
 <YFk5GcVCLGKDSHyQ@yekko.fritz.box>
 <265d13b0-6f3e-fa51-30fb-36a88188cb3@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PeWdmqE4tdX0DS3+"
Content-Disposition: inline
In-Reply-To: <265d13b0-6f3e-fa51-30fb-36a88188cb3@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PeWdmqE4tdX0DS3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 02:31:07PM +0100, BALATON Zoltan wrote:
> On Tue, 23 Mar 2021, David Gibson wrote:
> > On Wed, Mar 17, 2021 at 02:17:51AM +0100, BALATON Zoltan wrote:
[snip]
> > > +static void setup_mem_windows(MV64361State *s, uint32_t val)
> > > +{
> > > +    MV64361PCIState *p;
> > > +    MemoryRegion *mr;
> > > +    uint32_t mask;
> > > +    int i;
> > > +
> > > +    val &=3D 0x1fffff;
> > > +    for (mask =3D 1, i =3D 0; i < 21; i++, mask <<=3D 1) {
> >=20
> > Having a loop, where nearly the entire body is a switch over the loop
> > variable seems a rather odd choice to me, compared to just unrolling
> > the whole thing.  Or alternatively, maybe more can be be factored out
> > of the switch into common body code.
>=20
> The loop is really over the bits in val that say which memory regions to

I see that, but it doesn't change the point.

> enable so depending on this we need to touch different mem regions. For
> selecting those memory regions and what to do with them a switch seems to=
 be
> obvious choice. I probably can't factor out anything as these lines in
> switch cases are similar but all differ in some little details (like which
> PCI bus, name of the region, etc.). Unrolling could be possible but would
> just add lines between cases that's now in the loop head so I really don't

I see only 2 common lines, which basically balances about the case and
break lines in every switchcase.

> see why would that be better. Maybe renaming the loop variable from i to
> something that makes the intent clearer could help but I don't know what
> you'd like better. Can you suggest something?
>=20
> > > +        if ((val & mask) !=3D (s->base_addr_enable & mask)) {
> > > +            trace_mv64361_region_enable(!(val & mask) ? "enable" : "=
disable", i);
> > > +            switch (i) {
> > > +            /*
> > > +             * 0-3 are SDRAM chip selects but we map all RAM directly
> > > +             * 4-7 are device chip selects (not sure what those are)
> > > +             * 8 is Boot device (ROM) chip select but we map that di=
rectly too
> > > +             */
> > > +            case 9:
> > > +                p =3D &s->pci[0];
> > > +                mr =3D &s->cpu_win[i];
> > > +                unmap_region(mr);
> > > +                if (!(val & mask)) {
> > > +                    map_pci_region(mr, &p->io, OBJECT(s), "pci0-io-w=
in",
> > > +                                   p->remap[4], (p->io_size + 1) << =
16,
> > > +                                   (p->io_base & 0xfffff) << 16);
> > > +                }
> > > +                break;
> > > +            case 10:
> > > +                p =3D &s->pci[0];
> > > +                mr =3D &s->cpu_win[i];
> > > +                unmap_region(mr);
> > > +                if (!(val & mask)) {
> > > +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci0-mem=
0-win",
> > > +                                   p->remap[0], (p->mem_size[0] + 1)=
 << 16,
> > > +                                   (p->mem_base[0] & 0xfffff) << 16);
> > > +                }
> > > +                break;
> > > +            case 11:
> > > +                p =3D &s->pci[0];
> > > +                mr =3D &s->cpu_win[i];
> > > +                unmap_region(mr);
> > > +                if (!(val & mask)) {
> > > +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci0-mem=
1-win",
> > > +                                   p->remap[1], (p->mem_size[1] + 1)=
 << 16,
> > > +                                   (p->mem_base[1] & 0xfffff) << 16);
> > > +                }
> > > +                break;
> > > +            case 12:
> > > +                p =3D &s->pci[0];
> > > +                mr =3D &s->cpu_win[i];
> > > +                unmap_region(mr);
> > > +                if (!(val & mask)) {
> > > +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci0-mem=
2-win",
> > > +                                   p->remap[2], (p->mem_size[2] + 1)=
 << 16,
> > > +                                   (p->mem_base[2] & 0xfffff) << 16);
> > > +                }
> > > +                break;
> > > +            case 13:
> > > +                p =3D &s->pci[0];
> > > +                mr =3D &s->cpu_win[i];
> > > +                unmap_region(mr);
> > > +                if (!(val & mask)) {
> > > +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci0-mem=
3-win",
> > > +                                   p->remap[3], (p->mem_size[3] + 1)=
 << 16,
> > > +                                   (p->mem_base[3] & 0xfffff) << 16);
> > > +                }
> > > +                break;
> > > +            case 14:
> > > +                p =3D &s->pci[1];
> > > +                mr =3D &s->cpu_win[i];
> > > +                unmap_region(mr);
> > > +                if (!(val & mask)) {
> > > +                    map_pci_region(mr, &p->io, OBJECT(s), "pci1-io-w=
in",
> > > +                                   p->remap[4], (p->io_size + 1) << =
16,
> > > +                                   (p->io_base & 0xfffff) << 16);
> > > +                }
> > > +                break;
> > > +            case 15:
> > > +                p =3D &s->pci[1];
> > > +                mr =3D &s->cpu_win[i];
> > > +                unmap_region(mr);
> > > +                if (!(val & mask)) {
> > > +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci1-mem=
0-win",
> > > +                                   p->remap[0], (p->mem_size[0] + 1)=
 << 16,
> > > +                                   (p->mem_base[0] & 0xfffff) << 16);
> > > +                }
> > > +                break;
> > > +            case 16:
> > > +                p =3D &s->pci[1];
> > > +                mr =3D &s->cpu_win[i];
> > > +                unmap_region(mr);
> > > +                if (!(val & mask)) {
> > > +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci1-mem=
1-win",
> > > +                                   p->remap[1], (p->mem_size[1] + 1)=
 << 16,
> > > +                                   (p->mem_base[1] & 0xfffff) << 16);
> > > +                }
> > > +                break;
> > > +            case 17:
> > > +                p =3D &s->pci[1];
> > > +                mr =3D &s->cpu_win[i];
> > > +                unmap_region(mr);
> > > +                if (!(val & mask)) {
> > > +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci1-mem=
2-win",
> > > +                                   p->remap[2], (p->mem_size[2] + 1)=
 << 16,
> > > +                                   (p->mem_base[2] & 0xfffff) << 16);
> > > +                }
> > > +                break;
> > > +            case 18:
> > > +                p =3D &s->pci[1];
> > > +                mr =3D &s->cpu_win[i];
> > > +                unmap_region(mr);
> > > +                if (!(val & mask)) {
> > > +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci1-mem=
3-win",
> > > +                                   p->remap[3], (p->mem_size[3] + 1)=
 << 16,
> > > +                                   (p->mem_base[3] & 0xfffff) << 16);
> > > +                }
> > > +                break;
> > > +            /* 19 is integrated SRAM */
> > > +            case 20:
> > > +                mr =3D &s->regs;
> > > +                unmap_region(mr);
> > > +                if (!(val & mask)) {
> > > +                    memory_region_add_subregion(get_system_memory(),
> > > +                        (s->regs_base & 0xfffff) << 16, mr);
> > > +                }
> > > +                break;
> > > +            }
> > > +        }
> > > +    }
> > > +}
> > > +
> > > +static void mv64361_update_irq(void *opaque, int n, int level)
> > > +{
> > > +    MV64361State *s =3D opaque;
> > > +    uint64_t val =3D s->main_int_cr;
> > > +
> > > +    if (level) {
> > > +        val |=3D BIT_ULL(n);
> > > +    } else {
> > > +        val &=3D ~BIT_ULL(n);
> > > +    }
> > > +    if ((s->main_int_cr & s->cpu0_int_mask) !=3D (val & s->cpu0_int_=
mask)) {
> > > +        qemu_set_irq(s->cpu_irq, level);
> > > +    }
> > > +    s->main_int_cr =3D val;
> > > +}
> > > +
> > > +static uint64_t mv64361_read(void *opaque, hwaddr addr, unsigned int=
 size)
> > > +{
> > > +    MV64361State *s =3D MV64361(opaque);
> > > +    uint32_t ret =3D 0;
> > > +
> > > +    switch (addr) {
> > > +    case MV64340_CPU_CONFIG:
> > > +        ret =3D s->cpu_conf;
> > > +        break;
> > > +    case MV64340_PCI_0_IO_BASE_ADDR:
> > > +        ret =3D s->pci[0].io_base;
> >=20
> > Reaching into the PCI internal state here doesn't seem great, although
> > I'll admit I can't quickly see another way to do it that wouldn't be
> > horribly verbose.
>=20
> The MV64361PCIState is an internal class representing a PCI bus so touchi=
ng
> it from the parent object should not be that bad as this is only put in a
> separate object for separating it from the other functions and make it ea=
sy
> to have two of them without much repetition. Otherwise it's part of the
> implementation of the main MV64361 class so touching it from that should =
be
> OK. I'd consider touching internals of an unrelated object bad but that's
> not the case here. The MV64361 and MV64361PCI are friend classes.

Not really a QOM concept AFAIK, but sure, I'll buy it.

> > > +        break;
> > > +    case MV64340_PCI_0_IO_SIZE:
> > > +        ret =3D s->pci[0].io_size;
> > > +        break;
> > > +    case MV64340_PCI_0_IO_ADDR_REMAP:
> > > +        ret =3D s->pci[0].remap[4] >> 16;
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY0_BASE_ADDR:
> > > +        ret =3D s->pci[0].mem_base[0];
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY0_SIZE:
> > > +        ret =3D s->pci[0].mem_size[0];
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY0_LOW_ADDR_REMAP:
> > > +        ret =3D (s->pci[0].remap[0] & 0xffff0000) >> 16;
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY0_HIGH_ADDR_REMAP:
> > > +        ret =3D s->pci[0].remap[0] >> 32;
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY1_BASE_ADDR:
> > > +        ret =3D s->pci[0].mem_base[1];
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY1_SIZE:
> > > +        ret =3D s->pci[0].mem_size[1];
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY1_LOW_ADDR_REMAP:
> > > +        ret =3D (s->pci[0].remap[1] & 0xffff0000) >> 16;
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY1_HIGH_ADDR_REMAP:
> > > +        ret =3D s->pci[0].remap[1] >> 32;
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY2_BASE_ADDR:
> > > +        ret =3D s->pci[0].mem_base[2];
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY2_SIZE:
> > > +        ret =3D s->pci[0].mem_size[2];
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY2_LOW_ADDR_REMAP:
> > > +        ret =3D (s->pci[0].remap[2] & 0xffff0000) >> 16;
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY2_HIGH_ADDR_REMAP:
> > > +        ret =3D s->pci[0].remap[2] >> 32;
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY3_BASE_ADDR:
> > > +        ret =3D s->pci[0].mem_base[3];
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY3_SIZE:
> > > +        ret =3D s->pci[0].mem_size[3];
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY3_LOW_ADDR_REMAP:
> > > +        ret =3D (s->pci[0].remap[3] & 0xffff0000) >> 16;
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY3_HIGH_ADDR_REMAP:
> > > +        ret =3D s->pci[0].remap[3] >> 32;
> > > +        break;
> > > +    case MV64340_PCI_1_IO_BASE_ADDR:
> > > +        ret =3D s->pci[1].io_base;
> > > +        break;
> > > +    case MV64340_PCI_1_IO_SIZE:
> > > +        ret =3D s->pci[1].io_size;
> > > +        break;
> > > +    case MV64340_PCI_1_IO_ADDR_REMAP:
> > > +        ret =3D s->pci[1].remap[4] >> 16;
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY0_BASE_ADDR:
> > > +        ret =3D s->pci[1].mem_base[0];
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY0_SIZE:
> > > +        ret =3D s->pci[1].mem_size[0];
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY0_LOW_ADDR_REMAP:
> > > +        ret =3D (s->pci[1].remap[0] & 0xffff0000) >> 16;
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY0_HIGH_ADDR_REMAP:
> > > +        ret =3D s->pci[1].remap[0] >> 32;
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY1_BASE_ADDR:
> > > +        ret =3D s->pci[1].mem_base[1];
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY1_SIZE:
> > > +        ret =3D s->pci[1].mem_size[1];
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY1_LOW_ADDR_REMAP:
> > > +        ret =3D (s->pci[1].remap[1] & 0xffff0000) >> 16;
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY1_HIGH_ADDR_REMAP:
> > > +        ret =3D s->pci[1].remap[1] >> 32;
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY2_BASE_ADDR:
> > > +        ret =3D s->pci[1].mem_base[2];
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY2_SIZE:
> > > +        ret =3D s->pci[1].mem_size[2];
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY2_LOW_ADDR_REMAP:
> > > +        ret =3D (s->pci[1].remap[2] & 0xffff0000) >> 16;
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY2_HIGH_ADDR_REMAP:
> > > +        ret =3D s->pci[1].remap[2] >> 32;
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY3_BASE_ADDR:
> > > +        ret =3D s->pci[1].mem_base[3];
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY3_SIZE:
> > > +        ret =3D s->pci[1].mem_size[3];
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY3_LOW_ADDR_REMAP:
> > > +        ret =3D (s->pci[1].remap[3] & 0xffff0000) >> 16;
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY3_HIGH_ADDR_REMAP:
> > > +        ret =3D s->pci[1].remap[3] >> 32;
> > > +        break;
> > > +    case MV64340_INTERNAL_SPACE_BASE_ADDR:
> > > +        ret =3D s->regs_base;
> > > +        break;
> > > +    case MV64340_BASE_ADDR_ENABLE:
> > > +        ret =3D s->base_addr_enable;
> > > +        break;
> > > +    case MV64340_PCI_0_CONFIG_ADDR:
> > > +        ret =3D pci_host_conf_le_ops.read(PCI_HOST_BRIDGE(&s->pci[0]=
), 0, size);
> > > +        break;
> > > +    case MV64340_PCI_0_CONFIG_DATA_VIRTUAL_REG ...
> > > +         MV64340_PCI_0_CONFIG_DATA_VIRTUAL_REG + 3:
> > > +        ret =3D pci_host_data_le_ops.read(PCI_HOST_BRIDGE(&s->pci[0]=
),
> > > +                  addr - MV64340_PCI_0_CONFIG_DATA_VIRTUAL_REG, size=
);
> > > +        break;
> > > +    case MV64340_PCI_1_CONFIG_ADDR:
> > > +        ret =3D pci_host_conf_le_ops.read(PCI_HOST_BRIDGE(&s->pci[1]=
), 0, size);
> > > +        break;
> > > +    case MV64340_PCI_1_CONFIG_DATA_VIRTUAL_REG ...
> > > +         MV64340_PCI_1_CONFIG_DATA_VIRTUAL_REG + 3:
> > > +        ret =3D pci_host_data_le_ops.read(PCI_HOST_BRIDGE(&s->pci[1]=
),
> > > +                  addr - MV64340_PCI_1_CONFIG_DATA_VIRTUAL_REG, size=
);
> > > +        break;
> > > +    case MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG:
> > > +        /* FIXME: Should this be sent via the PCI bus somehow? */
> > > +        if (s->gpp_int_level && (s->gpp_value & BIT(31))) {
> > > +            ret =3D pic_read_irq(isa_pic);
> > > +        }
> > > +        break;
> > > +    case MV64340_MAIN_INTERRUPT_CAUSE_LOW:
> > > +        ret =3D s->main_int_cr;
> > > +        break;
> > > +    case MV64340_MAIN_INTERRUPT_CAUSE_HIGH:
> > > +        ret =3D s->main_int_cr >> 32;
> > > +        break;
> > > +    case MV64340_CPU_INTERRUPT0_MASK_LOW:
> > > +        ret =3D s->cpu0_int_mask;
> > > +        break;
> > > +    case MV64340_CPU_INTERRUPT0_MASK_HIGH:
> > > +        ret =3D s->cpu0_int_mask >> 32;
> > > +        break;
> > > +    case MV64340_CPU_INTERRUPT0_SELECT_CAUSE:
> > > +        ret =3D s->main_int_cr;
> > > +        if (s->main_int_cr & s->cpu0_int_mask) {
> > > +            if (!(s->main_int_cr & s->cpu0_int_mask & 0xffffffff)) {
> > > +                ret =3D s->main_int_cr >> 32 | BIT(30);
> > > +            } else if ((s->main_int_cr & s->cpu0_int_mask) >> 32) {
> > > +                ret |=3D BIT(31);
> > > +            }
> > > +        }
> > > +        break;
> > > +    case MV64340_CUNIT_ARBITER_CONTROL_REG:
> > > +        ret =3D 0x11ff0000 | (s->gpp_int_level << 10);
> > > +        break;
> > > +    case MV64340_GPP_IO_CONTROL:
> > > +        ret =3D s->gpp_io;
> > > +        break;
> > > +    case MV64340_GPP_LEVEL_CONTROL:
> > > +        ret =3D s->gpp_level;
> > > +        break;
> > > +    case MV64340_GPP_VALUE:
> > > +        ret =3D s->gpp_value;
> > > +        break;
> > > +    case MV64340_GPP_VALUE_SET:
> > > +    case MV64340_GPP_VALUE_CLEAR:
> > > +        ret =3D 0;
> > > +        break;
> > > +    case MV64340_GPP_INTERRUPT_CAUSE:
> > > +        ret =3D s->gpp_int_cr;
> > > +        break;
> > > +    case MV64340_GPP_INTERRUPT_MASK0:
> > > +    case MV64340_GPP_INTERRUPT_MASK1:
> > > +        ret =3D s->gpp_int_mask;
> > > +        break;
> > > +    default:
> > > +        qemu_log_mask(LOG_UNIMP, "%s: Unimplemented register read 0x=
%"
> > > +                      HWADDR_PRIx "\n", __func__, addr);
> > > +        break;
> > > +    }
> > > +    if (addr !=3D MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG) {
> > > +        trace_mv64361_reg_read(addr, ret);
> > > +    }
> > > +    return ret;
> > > +}
> > > +
> > > +static void warn_swap_bit(uint64_t val)
> > > +{
> > > +    if ((val & 0x3000000ULL) >> 24 !=3D 1) {
> > > +        qemu_log_mask(LOG_UNIMP, "%s: Data swap not implemented", __=
func__);
> > > +    }
> > > +}
> > > +
> > > +static void mv64361_set_pci_mem_remap(MV64361State *s, int bus, int =
idx,
> > > +                                      uint64_t val, bool high)
> > > +{
> > > +    if (high) {
> > > +        s->pci[bus].remap[idx] =3D val;
> > > +    } else {
> > > +        s->pci[bus].remap[idx] &=3D 0xffffffff00000000ULL;
> > > +        s->pci[bus].remap[idx] |=3D (val & 0xffffULL) << 16;
> > > +    }
> > > +}
> > > +
> > > +static void mv64361_write(void *opaque, hwaddr addr, uint64_t val,
> > > +                          unsigned int size)
> > > +{
> > > +    MV64361State *s =3D MV64361(opaque);
> > > +
> > > +    trace_mv64361_reg_write(addr, val);
> > > +    switch (addr) {
> > > +    case MV64340_CPU_CONFIG:
> > > +        s->cpu_conf =3D val & 0xe4e3bffULL;
> > > +        s->cpu_conf |=3D BIT(23);
> > > +        break;
> > > +    case MV64340_PCI_0_IO_BASE_ADDR:
> > > +        s->pci[0].io_base =3D val & 0x30fffffULL;
> > > +        warn_swap_bit(val);
> > > +        if (!(s->cpu_conf & BIT(27))) {
> > > +            s->pci[0].remap[4] =3D (val & 0xffffULL) << 16;
> > > +        }
> > > +        break;
> > > +    case MV64340_PCI_0_IO_SIZE:
> > > +        s->pci[0].io_size =3D val & 0xffffULL;
> > > +        break;
> > > +    case MV64340_PCI_0_IO_ADDR_REMAP:
> > > +        s->pci[0].remap[4] =3D (val & 0xffffULL) << 16;
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY0_BASE_ADDR:
> > > +        s->pci[0].mem_base[0] =3D val & 0x70fffffULL;
> > > +        warn_swap_bit(val);
> > > +        if (!(s->cpu_conf & BIT(27))) {
> > > +            mv64361_set_pci_mem_remap(s, 0, 0, val, false);
> > > +        }
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY0_SIZE:
> > > +        s->pci[0].mem_size[0] =3D val & 0xffffULL;
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY0_LOW_ADDR_REMAP:
> > > +    case MV64340_PCI_0_MEMORY0_HIGH_ADDR_REMAP:
> > > +        mv64361_set_pci_mem_remap(s, 0, 0, val,
> > > +            (addr =3D=3D MV64340_PCI_0_MEMORY0_HIGH_ADDR_REMAP));
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY1_BASE_ADDR:
> > > +        s->pci[0].mem_base[1] =3D val & 0x70fffffULL;
> > > +        warn_swap_bit(val);
> > > +        if (!(s->cpu_conf & BIT(27))) {
> > > +            mv64361_set_pci_mem_remap(s, 0, 1, val, false);
> > > +        }
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY1_SIZE:
> > > +        s->pci[0].mem_size[1] =3D val & 0xffffULL;
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY1_LOW_ADDR_REMAP:
> > > +    case MV64340_PCI_0_MEMORY1_HIGH_ADDR_REMAP:
> > > +        mv64361_set_pci_mem_remap(s, 0, 1, val,
> > > +            (addr =3D=3D MV64340_PCI_0_MEMORY1_HIGH_ADDR_REMAP));
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY2_BASE_ADDR:
> > > +        s->pci[0].mem_base[2] =3D val & 0x70fffffULL;
> > > +        warn_swap_bit(val);
> > > +        if (!(s->cpu_conf & BIT(27))) {
> > > +            mv64361_set_pci_mem_remap(s, 0, 2, val, false);
> > > +        }
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY2_SIZE:
> > > +        s->pci[0].mem_size[2] =3D val & 0xffffULL;
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY2_LOW_ADDR_REMAP:
> > > +    case MV64340_PCI_0_MEMORY2_HIGH_ADDR_REMAP:
> > > +        mv64361_set_pci_mem_remap(s, 0, 2, val,
> > > +            (addr =3D=3D MV64340_PCI_0_MEMORY2_HIGH_ADDR_REMAP));
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY3_BASE_ADDR:
> > > +        s->pci[0].mem_base[3] =3D val & 0x70fffffULL;
> > > +        warn_swap_bit(val);
> > > +        if (!(s->cpu_conf & BIT(27))) {
> > > +            mv64361_set_pci_mem_remap(s, 0, 3, val, false);
> > > +        }
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY3_SIZE:
> > > +        s->pci[0].mem_size[3] =3D val & 0xffffULL;
> > > +        break;
> > > +    case MV64340_PCI_0_MEMORY3_LOW_ADDR_REMAP:
> > > +    case MV64340_PCI_0_MEMORY3_HIGH_ADDR_REMAP:
> > > +        mv64361_set_pci_mem_remap(s, 0, 3, val,
> > > +            (addr =3D=3D MV64340_PCI_0_MEMORY3_HIGH_ADDR_REMAP));
> > > +        break;
> > > +    case MV64340_PCI_1_IO_BASE_ADDR:
> > > +        s->pci[1].io_base =3D val & 0x30fffffULL;
> > > +        warn_swap_bit(val);
> > > +        break;
> > > +        if (!(s->cpu_conf & BIT(27))) {
> > > +            s->pci[1].remap[4] =3D (val & 0xffffULL) << 16;
> > > +        }
> > > +        break;
> > > +    case MV64340_PCI_1_IO_SIZE:
> > > +        s->pci[1].io_size =3D val & 0xffffULL;
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY0_BASE_ADDR:
> > > +        s->pci[1].mem_base[0] =3D val & 0x70fffffULL;
> > > +        warn_swap_bit(val);
> > > +        if (!(s->cpu_conf & BIT(27))) {
> > > +            mv64361_set_pci_mem_remap(s, 1, 0, val, false);
> > > +        }
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY0_SIZE:
> > > +        s->pci[1].mem_size[0] =3D val & 0xffffULL;
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY0_LOW_ADDR_REMAP:
> > > +    case MV64340_PCI_1_MEMORY0_HIGH_ADDR_REMAP:
> > > +        mv64361_set_pci_mem_remap(s, 1, 0, val,
> > > +            (addr =3D=3D MV64340_PCI_1_MEMORY0_HIGH_ADDR_REMAP));
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY1_BASE_ADDR:
> > > +        s->pci[1].mem_base[1] =3D val & 0x70fffffULL;
> > > +        warn_swap_bit(val);
> > > +        if (!(s->cpu_conf & BIT(27))) {
> > > +            mv64361_set_pci_mem_remap(s, 1, 1, val, false);
> > > +        }
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY1_SIZE:
> > > +        s->pci[1].mem_size[1] =3D val & 0xffffULL;
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY1_LOW_ADDR_REMAP:
> > > +    case MV64340_PCI_1_MEMORY1_HIGH_ADDR_REMAP:
> > > +        mv64361_set_pci_mem_remap(s, 1, 1, val,
> > > +            (addr =3D=3D MV64340_PCI_1_MEMORY1_HIGH_ADDR_REMAP));
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY2_BASE_ADDR:
> > > +        s->pci[1].mem_base[2] =3D val & 0x70fffffULL;
> > > +        warn_swap_bit(val);
> > > +        if (!(s->cpu_conf & BIT(27))) {
> > > +            mv64361_set_pci_mem_remap(s, 1, 2, val, false);
> > > +        }
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY2_SIZE:
> > > +        s->pci[1].mem_size[2] =3D val & 0xffffULL;
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY2_LOW_ADDR_REMAP:
> > > +    case MV64340_PCI_1_MEMORY2_HIGH_ADDR_REMAP:
> > > +        mv64361_set_pci_mem_remap(s, 1, 2, val,
> > > +            (addr =3D=3D MV64340_PCI_1_MEMORY2_HIGH_ADDR_REMAP));
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY3_BASE_ADDR:
> > > +        s->pci[1].mem_base[3] =3D val & 0x70fffffULL;
> > > +        warn_swap_bit(val);
> > > +        if (!(s->cpu_conf & BIT(27))) {
> > > +            mv64361_set_pci_mem_remap(s, 1, 3, val, false);
> > > +        }
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY3_SIZE:
> > > +        s->pci[1].mem_size[3] =3D val & 0xffffULL;
> > > +        break;
> > > +    case MV64340_PCI_1_MEMORY3_LOW_ADDR_REMAP:
> > > +    case MV64340_PCI_1_MEMORY3_HIGH_ADDR_REMAP:
> > > +        mv64361_set_pci_mem_remap(s, 1, 3, val,
> > > +            (addr =3D=3D MV64340_PCI_1_MEMORY3_HIGH_ADDR_REMAP));
> > > +        break;
> > > +    case MV64340_INTERNAL_SPACE_BASE_ADDR:
> > > +        s->regs_base =3D val & 0xfffffULL;
> > > +        break;
> > > +    case MV64340_BASE_ADDR_ENABLE:
> > > +        setup_mem_windows(s, val);
> > > +        s->base_addr_enable =3D val & 0x1fffffULL;
> >=20
> > AFAICT every call to setup_mem_windows() is followed by an update to
> > base_addr_enable, so it probably makes sense to fold that update into
> > setup_mem_windows().
>=20
> Maybe that could be done. It would probably save about two lines of code =
and
> I'd rename setup_mem_windows to something like set_mem_windows then. Is t=
hat
> worth the effort?

Sure.  Small reward, trivial effort.

>=20
> > > +        break;
> > > +    case MV64340_PCI_0_CONFIG_ADDR:
> > > +        pci_host_conf_le_ops.write(PCI_HOST_BRIDGE(&s->pci[0]), 0, v=
al, size);
> > > +        break;
> > > +    case MV64340_PCI_0_CONFIG_DATA_VIRTUAL_REG ...
> > > +         MV64340_PCI_0_CONFIG_DATA_VIRTUAL_REG + 3:
> > > +        pci_host_data_le_ops.write(PCI_HOST_BRIDGE(&s->pci[0]),
> > > +            addr - MV64340_PCI_0_CONFIG_DATA_VIRTUAL_REG, val, size);
> > > +        break;
> > > +    case MV64340_PCI_1_CONFIG_ADDR:
> > > +        pci_host_conf_le_ops.write(PCI_HOST_BRIDGE(&s->pci[1]), 0, v=
al, size);
> > > +        break;
> > > +    case MV64340_PCI_1_CONFIG_DATA_VIRTUAL_REG ...
> > > +         MV64340_PCI_1_CONFIG_DATA_VIRTUAL_REG + 3:
> > > +        pci_host_data_le_ops.write(PCI_HOST_BRIDGE(&s->pci[1]),
> > > +            addr - MV64340_PCI_1_CONFIG_DATA_VIRTUAL_REG, val, size);
> > > +        break;
> > > +    case MV64340_CPU_INTERRUPT0_MASK_LOW:
> > > +        s->cpu0_int_mask &=3D 0xffffffff00000000ULL;
> > > +        s->cpu0_int_mask |=3D val & 0xffffffffULL;
> > > +        break;
> > > +    case MV64340_CPU_INTERRUPT0_MASK_HIGH:
> > > +        s->cpu0_int_mask &=3D 0xffffffffULL;
> > > +        s->cpu0_int_mask |=3D val << 32;
> > > +        break;
> > > +    case MV64340_CUNIT_ARBITER_CONTROL_REG:
> > > +        s->gpp_int_level =3D !!(val & BIT(10));
> > > +        break;
> > > +    case MV64340_GPP_IO_CONTROL:
> > > +        s->gpp_io =3D val;
> > > +        break;
> > > +    case MV64340_GPP_LEVEL_CONTROL:
> > > +        s->gpp_level =3D val;
> > > +        break;
> > > +    case MV64340_GPP_VALUE:
> > > +        s->gpp_value &=3D ~s->gpp_io;
> > > +        s->gpp_value |=3D val & s->gpp_io;
> > > +        break;
> > > +    case MV64340_GPP_VALUE_SET:
> > > +        s->gpp_value |=3D val & s->gpp_io;
> > > +        break;
> > > +    case MV64340_GPP_VALUE_CLEAR:
> > > +        s->gpp_value &=3D ~(val & s->gpp_io);
> > > +        break;
> > > +    case MV64340_GPP_INTERRUPT_CAUSE:
> > > +        if (!s->gpp_int_level && val !=3D s->gpp_int_cr) {
> > > +            int i;
> > > +            uint32_t ch =3D s->gpp_int_cr ^ val;
> > > +            s->gpp_int_cr =3D val;
> > > +            for (i =3D 0; i < 4; i++) {
> > > +                if ((ch & 0xff << i) && !(val & 0xff << i)) {
> > > +                    mv64361_update_irq(opaque, MV64361_IRQ_P0_GPP0_7=
 + i, 0);
> > > +                }
> > > +            }
> > > +        } else {
> > > +            s->gpp_int_cr =3D val;
> > > +        }
> > > +        break;
> > > +    case MV64340_GPP_INTERRUPT_MASK0:
> > > +    case MV64340_GPP_INTERRUPT_MASK1:
> > > +        s->gpp_int_mask =3D val;
> > > +        break;
> > > +    default:
> > > +        qemu_log_mask(LOG_UNIMP, "%s: Unimplemented register write 0=
x%"
> > > +                      HWADDR_PRIx " =3D %"PRIx64"\n", __func__, addr=
, val);
> > > +        break;
> > > +    }
> > > +}
> > > +
> > > +static const MemoryRegionOps mv64361_ops =3D {
> > > +    .read =3D mv64361_read,
> > > +    .write =3D mv64361_write,
> > > +    .valid.min_access_size =3D 1,
> > > +    .valid.max_access_size =3D 4,
> > > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > > +};
> > > +
> > > +static void mv64361_gpp_irq(void *opaque, int n, int level)
> > > +{
> > > +    MV64361State *s =3D opaque;
> > > +    uint32_t mask =3D BIT(n);
> > > +    uint32_t val =3D s->gpp_value & ~mask;
> > > +
> > > +    if (s->gpp_level & mask) {
> > > +        level =3D !level;
> > > +    }
> > > +    val |=3D level << n;
> > > +    if (val > s->gpp_value) {
> > > +        s->gpp_value =3D val;
> > > +        s->gpp_int_cr |=3D mask;
> > > +        if (s->gpp_int_mask & mask) {
> > > +            mv64361_update_irq(opaque, MV64361_IRQ_P0_GPP0_7 + n / 8=
, 1);
> > > +        }
> > > +    } else if (val < s->gpp_value) {
> > > +        int b =3D n / 8;
> > > +        s->gpp_value =3D val;
> > > +        if (s->gpp_int_level && !(val & 0xff << b)) {
> > > +            mv64361_update_irq(opaque, MV64361_IRQ_P0_GPP0_7 + b, 0);
> > > +        }
> > > +    }
> > > +}
> > > +
> > > +static void mv64361_realize(DeviceState *dev, Error **errp)
> > > +{
> > > +    MV64361State *s =3D MV64361(dev);
> > > +    int i;
> > > +
> > > +    s->base_addr_enable =3D 0x1fffff;
> > > +    memory_region_init_io(&s->regs, OBJECT(s), &mv64361_ops, s,
> > > +                          TYPE_MV64361, 0x10000);
> > > +    for (i =3D 0; i < 2; i++) {
> > > +        char *name =3D g_strdup_printf("pcihost%d", i);
> > > +        object_initialize_child(OBJECT(dev), name, &s->pci[i],
> > > +                                TYPE_MV64361_PCI);
> > > +        g_free(name);
> >=20
> > You can avoid some of these awkward free()s using a g_autofree
> > annotation.
>=20
> This one is pretty simple but for others it might help a little. I need to
> find out how to use g_autofree...
>=20
> Regards,
> BALATON Zoltan
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PeWdmqE4tdX0DS3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBamoYACgkQbDjKyiDZ
s5J69RAA2acC29VuKrTVMA+gwU3s58wURIrFc5W84Ecd1TrDI3OQ4GaqIlHMZAsE
pGBYSYten4dtmUkCyqh0fIfBkQUKAerm20COFyypSBNM+9t4H7Ku8wIjHY4QIHTH
NoIm+f220EWZoXsLbiAukyg6X84BNHFYWK4mdg5jrhjAz+5GD2m3pOPs5ZihC33t
/OoqKpaWk7moSdg81VxW0/lRJAg+oJDqd+pARKp/kqhCfQsr0NhxPZpzHKJnxQF2
+PaIvYaAkOXV4g/Jm9gsYcKy37eOu2CHyWSYrcvtIQe9TQSqOBqy1Mb5aahl2bVi
coQwbUOzre6Vwk1OcuK4P0Xge10LOih2jKunqHZMHYrtMyhsMbpRHSH7kUTj1F+R
vSBEX6KaEBk6SSSGmybc2qbJrhQ7nz8IizD7m7FtnqlK64ub08DdqKh+18bxYzSl
bRugVIfkCzgw15A7v0XFBfo4WHf5AwAMkz/xCQ8jU3yRLXvZ2eMoIrhyUM9dxG4t
CGw9VFXbRgRsCiO6pPtNTPez6aMuogpGuWJO5+J1bo0AuoPgLV1mUwIXEEbsqevh
VmGM+DflI+H2DgeXTWL/+HEelzwrY8BOVtJx1RJgKu781SlWS9GEkdVnUf1UNhoF
573sQLvi/PIqxUPE6tv7WY0Kgt13e/V1NgtF0P/At4EvahM4Tow=
=jmWY
-----END PGP SIGNATURE-----

--PeWdmqE4tdX0DS3+--

