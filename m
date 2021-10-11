Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B2A428DBC
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 15:23:25 +0200 (CEST)
Received: from localhost ([::1]:55394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZvH2-0002H8-Df
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 09:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1mZv8y-0003Lb-AL
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:15:05 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1mZv8t-0002uq-F2
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:15:03 -0400
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4HSfLY3xFMz6H7h6;
 Mon, 11 Oct 2021 21:11:01 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 11 Oct 2021 15:14:47 +0200
Received: from localhost (10.52.122.204) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 14:14:46 +0100
Date: Mon, 11 Oct 2021 14:14:28 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: ACPI endianness
Message-ID: <20211011141428.000073af@Huawei.com>
In-Reply-To: <20211011080528-mutt-send-email-mst@kernel.org>
References: <957db5ec-fc70-418-44d9-da4f81f5b98@eik.bme.hu>
 <612d2f0b-f312-073d-b796-c76357ba51a2@redhat.com>
 <d8284c4-c2e7-15e9-bec5-b2f619e1e6ad@eik.bme.hu>
 <20211011080528-mutt-send-email-mst@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.52.122.204]
X-ClientProxiedBy: lhreml723-chm.china.huawei.com (10.201.108.74) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, pbonzini@redhat.com,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Oct 2021 08:19:01 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Oct 11, 2021 at 12:13:55PM +0200, BALATON Zoltan wrote:
> > On Mon, 11 Oct 2021, Philippe Mathieu-Daud=E9 wrote: =20
> > > On 10/10/21 15:24, BALATON Zoltan wrote: =20
> > > > Hello,
> > > >=20
> > > > I'm trying to fix shutdown and reboot on pegasos2 which uses ACPI as
> > > > part of the VIA VT8231 (similar to and modelled in hw/isa/vt82c686b=
.c)
> > > > and found that the guest writes to ACPI PM1aCNT register come out w=
ith
> > > > wrong endianness but not shure why. I have this:
> > > >=20
> > > > $ qemu-system-ppc -M pegasos2 -monitor stdio
> > > > (qemu) info mtree
> > > > [...]
> > > > memory-region: pci1-io
> > > > =A0 0000000000000000-000000000000ffff (prio 0, i/o): pci1-io
> > > > [...]
> > > > =A0=A0=A0 0000000000000f00-0000000000000f7f (prio 0, i/o): via-pm
> > > > =A0=A0=A0=A0=A0 0000000000000f00-0000000000000f03 (prio 0, i/o): ac=
pi-evt
> > > > =A0=A0=A0=A0=A0 0000000000000f04-0000000000000f05 (prio 0, i/o): ac=
pi-cnt
> > > > =A0=A0=A0=A0=A0 0000000000000f08-0000000000000f0b (prio 0, i/o): ac=
pi-tmr
> > > >=20
> > > > memory-region: system
> > > > =A0 0000000000000000-ffffffffffffffff (prio 0, i/o): system
> > > > =A0=A0=A0 0000000000000000-000000001fffffff (prio 0, ram): pegasos2=
.ram
> > > > =A0=A0=A0 0000000080000000-00000000bfffffff (prio 0, i/o): alias pc=
i1-mem0-win
> > > > @pci1-mem 0000000080000000-00000000bfffffff
> > > > =A0=A0=A0 00000000c0000000-00000000dfffffff (prio 0, i/o): alias pc=
i0-mem0-win
> > > > @pci0-mem 00000000c0000000-00000000dfffffff
> > > > =A0=A0=A0 00000000f1000000-00000000f100ffff (prio 0, i/o): mv64361
> > > > =A0=A0=A0 00000000f8000000-00000000f8ffffff (prio 0, i/o): alias pc=
i0-io-win
> > > > @pci0-io 0000000000000000-0000000000ffffff
> > > > =A0=A0=A0 00000000f9000000-00000000f9ffffff (prio 0, i/o): alias pc=
i0-mem1-win
> > > > @pci0-mem 0000000000000000-0000000000ffffff
> > > > =A0=A0=A0 00000000fd000000-00000000fdffffff (prio 0, i/o): alias pc=
i1-mem1-win
> > > > @pci1-mem 0000000000000000-0000000000ffffff
> > > > =A0=A0=A0 00000000fe000000-00000000feffffff (prio 0, i/o): alias pc=
i1-io-win
> > > > @pci1-io 0000000000000000-0000000000ffffff
> > > > =A0=A0=A0 00000000ff800000-00000000ffffffff (prio 0, i/o): alias pc=
i1-mem3-win
> > > > @pci1-mem 00000000ff800000-00000000ffffffff
> > > > =A0=A0=A0 00000000fff00000-00000000fff7ffff (prio 0, rom): pegasos2=
.rom
> > > >=20
> > > > The guest (which is big endian PPC and I think wotks on real hardwa=
re)
> > > > writes to 0xf05 in the io region which should be the high byte of t=
he
> > > > little endian register but in the acpi code it comes out wrong, ins=
tead
> > > > of 0x2800 I get in acpi_pm1_cnt_write: val=3D0x28 =20
> > >=20
> > > Looks like a northbridge issue (MV64340).
> > > Does Pegasos2 enables bus swapping?
> > > See hw/pci-host/mv64361.c:585:
> > >=20
> > > static void warn_swap_bit(uint64_t val)
> > > {
> > >    if ((val & 0x3000000ULL) >> 24 !=3D 1) {
> > >        qemu_log_mask(LOG_UNIMP, "%s: Data swap not implemented", __fu=
nc__);
> > >    }
> > > } =20
> >=20
> > No, guests don't use this feature just byteswap themselves and write li=
ttle
> > endian values to the mapped io region. (Or in this case just write one =
byte
> > of the 16 bit value, it specifically writes 0x28 to 0xf05.) That's why I
> > think the device model should not byteswap itself so the acpi regions s=
hould
> > be declared native endian and let the guest handle it. Some mentions I'=
ve
> > found say that native endian means don't byteswap, little endian means
> > byteswap if vcpu is big endian and big endian means byteswap if vcpu is
> > little endian. Since guests already account for this and write little e=
ndian
> > values to these regions there's no need to byteswap in device model and
> > changing to native endian should not affect little endian machines so u=
nless
> > there's a better argument I'll try sending a patch.
> >=20
> > Regards,
> > BALATON Zoltan =20
>=20
> native endian means endian-ness is open-coded in the device handler
> itself.  I think you just found a bug in memory core.
>=20
> static const MemoryRegionOps acpi_pm_cnt_ops =3D {
>     .read =3D acpi_pm_cnt_read,
>     .write =3D acpi_pm_cnt_write,
>     .impl.min_access_size =3D 2,
>     .valid.min_access_size =3D 1,
>     .valid.max_access_size =3D 2,
>     .endianness =3D DEVICE_LITTLE_ENDIAN,
> };
>=20
>=20
> Because of that     .impl.min_access_size =3D 2,
> the 1 byte write should be converted to a 2 byte
> read+2 byte write.
>=20
> docs/devel/memory.rst just says:
> - .impl.min_access_size, .impl.max_access_size define the access sizes
>   (in bytes) supported by the *implementation*; other access sizes will be
>   emulated using the ones available.  For example a 4-byte write will be
>   emulated using four 1-byte writes, if .impl.max_access_size =3D 1.
>=20
>=20
>=20
> Instead what we have is:
>=20
> MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>                                          hwaddr addr,
>                                          uint64_t data,
>                                          MemOp op,
>                                          MemTxAttrs attrs)
> {
>     unsigned size =3D memop_size(op);
>=20
>     if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
>         unassigned_mem_write(mr, addr, data, size);
>         return MEMTX_DECODE_ERROR;
>     }
>=20
>     adjust_endianness(mr, &data, op);
>=20
>=20
> ---
>=20
>=20
> static void adjust_endianness(MemoryRegion *mr, uint64_t *data, MemOp op)
> {
>     if ((op & MO_BSWAP) !=3D devend_memop(mr->ops->endianness)) {
>         switch (op & MO_SIZE) {
>         case MO_8:
>             break;
>         case MO_16:
>             *data =3D bswap16(*data);
>             break;
>         case MO_32:
>             *data =3D bswap32(*data);
>             break;
>         case MO_64:
>             *data =3D bswap64(*data);
>             break;
>         default:
>             g_assert_not_reached();
>         }
>     }
> }
>=20
> so the byte swap is based on size before extending it to
> .impl.min_access_size, not after.
>=20
> Also, no read happens which I suspect is also a bug,
> but could be harmless ...

The lack of read modify write looks like this again:
https://lore.kernel.org/qemu-devel/20210513124737.00002b2d@Huawei.com/

byte swap part is new to me though...

>=20
> Paolo, any feedback here?
>=20


