Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63C14EE36A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 23:43:40 +0200 (CEST)
Received: from localhost ([::1]:56280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na2Zv-0002jm-IO
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 17:43:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.manzanares@samsung.com>)
 id 1na2Yt-0001Gd-Mf
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 17:42:35 -0400
Received: from mailout1.w2.samsung.com ([211.189.100.11]:10317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.manzanares@samsung.com>)
 id 1na2Yr-0002JH-GM
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 17:42:35 -0400
Received: from uscas1p1.samsung.com (unknown [182.198.245.206])
 by mailout1.w2.samsung.com (KnoxPortal) with ESMTP id
 20220331214221usoutp01f839cb6516f4b29a761056048584d7c1~hlSj7xJyH2274622746usoutp01M;
 Thu, 31 Mar 2022 21:42:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w2.samsung.com
 20220331214221usoutp01f839cb6516f4b29a761056048584d7c1~hlSj7xJyH2274622746usoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1648762941;
 bh=V9YRO/cvWHADB+XvQlNcEwE4GIfBom2x4ZghBKMYI0E=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=nWs9BYVT8+OTLeOW91vRpgFkqgAZT9pskbWaf9IJ5B7fmANqZ+buit+ih00+IK6a3
 oZFskEw3Uclf0lYSb6zPNttsjpk0v6lh680LADrHGnS3FD8XzUNqzj9z0YN5gTyAzV
 3xREglCCZlSJcs/z4+1AAOY83/JkYcvPyEGRA3f8=
Received: from ussmges2new.samsung.com (u111.gpu85.samsung.co.kr
 [203.254.195.111]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220331214221uscas1p23fe134189181b919b6b3f182c58623bf~hlSjqagc02360923609uscas1p2H;
 Thu, 31 Mar 2022 21:42:21 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges2new.samsung.com (USCPEMTA) with SMTP id CB.E7.09642.D3026426; Thu,
 31 Mar 2022 17:42:21 -0400 (EDT)
Received: from ussmgxs3new.samsung.com (u92.gpu85.samsung.co.kr
 [203.254.195.92]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220331214220uscas1p15566b5ba9e76f13549ef8f67faec6ccf~hlSjG7BFD0345803458uscas1p1K;
 Thu, 31 Mar 2022 21:42:20 +0000 (GMT)
X-AuditID: cbfec36f-bfdff700000025aa-b0-6246203d62fc
Received: from SSI-EX4.ssi.samsung.com ( [105.128.2.145]) by
 ussmgxs3new.samsung.com (USCPEXMTA) with SMTP id 7D.E9.09665.C3026426; Thu,
 31 Mar 2022 17:42:20 -0400 (EDT)
Received: from SSI-EX3.ssi.samsung.com (105.128.2.228) by
 SSI-EX4.ssi.samsung.com (105.128.2.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2242.4; Thu, 31 Mar 2022 14:42:19 -0700
Received: from SSI-EX3.ssi.samsung.com ([fe80::8d80:5816:c578:8c36]) by
 SSI-EX3.ssi.samsung.com ([fe80::8d80:5816:c578:8c36%3]) with mapi id
 15.01.2242.008; Thu, 31 Mar 2022 14:42:19 -0700
From: Adam Manzanares <a.manzanares@samsung.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Subject: Re: [PATCH v8 04/46] hw/cxl/device: Introduce a CXL device (8.2.8)
Thread-Topic: [PATCH v8 04/46] hw/cxl/device: Introduce a CXL device (8.2.8)
Thread-Index: AQHYQ5jDAh0o55BFMkO81MsYMsoB9azXO5OAgAESZwCAAjCMgA==
Date: Thu, 31 Mar 2022 21:42:19 +0000
Message-ID: <20220331214133.GA2203@bgt-140510-bm01>
In-Reply-To: <20220330131558.00004c26@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <529A4BC6905BDC4692779069981520FE@ssi.samsung.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1DTZRzHe74/ti/L2dfpxeM8iXaZnhgBVjwexXlB3vdOvesqz8vLaJPv
 ATmG7YdldCdJBcMZ07VbDQwXQQhDHAIRR7IhCgg0RNhwRzAUdyHNIEFFZMX2xbv99/7c+/V5
 ntc991C46GeemMpSqFmlQiqX8ARE05U550tvRO+QxWn7xajQmwdQWe0YgYp8xTg67jwPkMnY
 D1DNDStAc3WPcNRV78BRz+VCHFVbXDzkNF8l0CVbL4a0l4tJlNetQP89ukOitqYAiUp7vQRq
 aLvPR50nmgnUf62GQCdGHxPo16FjJLI1GXnbIxn7XxY+02/Qk4xVO4UxJdOzGPNVh59kbv+Z
 z2dMpx/jTHnrJMaMuFp5zITrAsb8c3GIxxhLjjL36qPeFu4TvJ7OyrMOs8qXkz8SZDZ7fiQP
 NWz7rMDUyM8D8zFFIIKC9CvQb/BhRUBAieizAJq+KeVzw9cY7HFbySdURcMCwRW1AE4t/MYP
 FiJ6BsC+BTVX2AFsHGnFgwWPjoMLnbZQXkMnwMFKR+hYnHZHQK/LCILFanonNPxbRnLQLujq
 mF1eeBNeafQRwUzQG+Ck82yIEdJb4XixJ7QbQcdDx722UAb0s/DBVSsWzDgdCT0TZRinvQr+
 VMIJwSUm0DLO4/LzcOzBJJ/jY+Gw8Tsel5PhLfspkssxsNIyhXP3roLdP0wQ3O5a6KgaDj0F
 pI8JoCHfviRBLQ2p8IJhE8esgybr9WWmAMBp/UWSG/QAjvjnly2SYEDr4uvBC+YwcXOYlDlM
 yhwmZQ6TOgPIahCpUamyM1hVgoL9NFYlzVZpFBmxB3Ky68HSR+4JXMppBm7PTGw7wCjQDiCF
 S9YIh/a/JRMJ06VHPmeVOWlKjZxVtYN1FCGJFFZmnZeK6Aypmj3IsodY5ZMWoyLEeZjizsYP
 dIsGWVHu9/iioLzKmejXPL3jlHjw2vCmaANpiTm5bWwxySXevvv4TSLJuNdZ9UduxWtf5v2u
 dTlWXO+Lr4vKzfALEjr2fHz6/ZSDDndLWudumUDuzZTMtvvaV7qrJMmbMc07t/xPCRqmBkjZ
 KG+gb2e6vFZ/oyUadCVUPCzueiZx9ej6UZWnwbL37tH1u4gBB1WT9q53xUq+2adL/XvfTO2L
 W0+a0s7d/9BOPbw9SLQVVhvndPkeXcrAxs4of8A7a0uNC6jPHRZ/Mn+k/EDphjP27EEbu9/b
 e/c5jW4k0aaa/iWz4D3vlvFqdcqrX8TQW7q/zb+Zukdcsra5TkKoMqXxm3GlSvo/tQ2MdzcE
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0yTVxjGc75LL2QNnx3asy6Zipgt4KroXI4L4lTEz2mUuPCPQlirX7iM
 FtPKZWRoIyRCCXJtiBWHjdIJlGnLRWa4FYodWEcx0nBREAVtRTYRhAwQZ/tp0v9+b57nfZ5z
 kpeHCy2kmJeoOM0oFdLkQI4fkajGir8OWxcp25LzcivKfawGqLJujECaZ4U4yu+7CVC51gFQ
 7ZARoDc3FnH0l9mCo7vduTiq0Ts5qE/XS6Aukx1Ded2FJFL3KNC7xRckam9aIVGF/TGBGtrn
 uchW0EwgR38tgQpGlwl0a+AciUxNWs73IrrDpefSjtIikjbmTWH0pVdzGJ1jnSbpyUfZXLr8
 8jJOX21xY/RDZwuHnnDWY/S/bQMcWnvpLD1r/iJKcMwv7CSTnJjGKDeH/+SX0Dz8G3mqYUfG
 +fJGrhr8F6IBfB6kvoFVDUuEh4VULYCl6kQN8HvPMwD2z9sIdugA0Oy453VxqC1wyWbCPRxA
 bYUPDBaux4RTA3x4x34F8wifUgdh6etKkjUdgk7r3IeFPfBO4zNvEEFthO6+aq9HQG2D44XD
 gG3rxeDyUCfwCHwqFFpm270MqDVwodfoLcApERyeqMTYP1DwWksfzvJq6H66QrK8Ho4tuLms
 XwIHtWUclsPh044SkuUQaNBP4ewjVsGeixMEu/sZtFwfJIoA1PnU6XyidD5ROp8onU/UFUDW
 AFGqSiWPz1BtUzDpEpVUrkpVxEtOpMjN4P2V3V3pimkGo8Mzkk6A8UAngDw8MEAwELtPJhSc
 lP6SyShT4pSpyYyqE3zOIwJFAjq2OE5IxUtPMz8zzClG+VHFeHyxGrtviM7eW7WYZ53506rf
 JL7fGP8uJ0qmybTcTNEfMzU96b9Qb+pfPL7bZpyyNJ9ZSZ80ZGW/nUsf74mu5+jh9uoCF0p6
 PiYeG8x6lDUplsdY2/IKLwqdr/Iji/7p0suMQu0fP3Zlf/ure6dmf36mrMNeNX4oiQrGnDRT
 J91fHTO6XbTv92VX2oOMsPLRuky7Y0damX+I6Dlx4HZQNMJPxLz5wT/qbMXRcxtGQlsjIiL+
 zv1q3ds1uxZ2Fj28PCQLEG1eapk+LB9ZapQc/U5pvjc7M20oPj/Lt7zwj7Zyy74siaxpTRhx
 zVebNjjDP4kIJp1rFbaM2KSgsjiX4Ej34ZJAQpUgDQ3GlSrp/wK15TbUAwAA
X-CMS-MailID: 20220331214220uscas1p15566b5ba9e76f13549ef8f67faec6ccf
CMS-TYPE: 301P
X-CMS-RootMailID: 20220329181401uscas1p2b229afdbb479a012e140f84367c35ccd
References: <20220318150635.24600-1-Jonathan.Cameron@huawei.com>
 <20220318150635.24600-5-Jonathan.Cameron@huawei.com>
 <CGME20220329181401uscas1p2b229afdbb479a012e140f84367c35ccd@uscas1p2.samsung.com>
 <20220329181353.GA59203@bgt-140510-bm01>
 <20220329195351.mzlbgxu2riscdb22@offworld>
 <20220330131558.00004c26@Huawei.com>
Received-SPF: pass client-ip=211.189.100.11;
 envelope-from=a.manzanares@samsung.com; helo=mailout1.w2.samsung.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 Heekwon Park <heekwon.p@samsung.com>, Jaemin Jung <j.jaemin@samsung.com>,
 Davidlohr Bueso <dave@stgolabs.net>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jongmin Gim <gim.jongmin@samsung.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Tong Zhang <t.zhang2@samsung.com>,
 Chris Browy <cbrowy@avery-design.com>, Saransh Gupta1 <saransh@ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 =?iso-8859-1?Q?Alex_Benn=EF=BF=BDe?= <alex.bennee@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=EF=BF=BD?= <f4bug@amsat.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 01:15:58PM +0100, Jonathan Cameron wrote:
> On Tue, 29 Mar 2022 12:53:51 -0700
> Davidlohr Bueso <dave@stgolabs.net> wrote:
>=20
> > On Tue, 29 Mar 2022, Adam Manzanares wrote:
> > >> +typedef struct cxl_device_state {
> > >> +    MemoryRegion device_registers;
> > >> +
> > >> +    /* mmio for device capabilities array - 8.2.8.2 */
> > >> +    MemoryRegion device;
> > >> +    MemoryRegion caps;
> > >> +
> > >> +    /* mmio for the mailbox registers 8.2.8.4 */
> > >> +    MemoryRegion mailbox;
> > >> +
> > >> +    /* memory region for persistent memory, HDM */
> > >> +    uint64_t pmem_size; =20
> > >
> > >Can we switch this to mem_size and drop the persistent comment? It is =
my
> > >understanding that HDM is independent of persistence. =20
> >=20
> > Agreed, but ideally both volatile and persistent capacities would have =
been
> > supported in this patchset. I'm also probably missing specific reasons =
as to
> > why this isn't the case.
>=20
> Whilst it doesn't add a huge amount of complexity it does add some
> and the software paths in Linux we were developing this for are pmem focu=
sed.
> Hence volatile is on the todo list rather than in this first patch set.
> Not sensible to aim for feature complete in one go.

Makes complete sense. We can help with the Linux development for the volati=
le=20
side. I will add a couple of folks on cc. In addition, we would like to hel=
p
the CXL ecosystem in general so I anticipate we will have more reviews and=
=20
patches for CXL in general.

>=20
> >=20
> > Looking at it briefly could it be just a matter of adding to cxl_type3_=
dev
> > a new hostmem along with it's AddressSpace for the volatile? If so, I'm
> > thinking something along these lines:
> >=20
> > @@ -123,8 +123,8 @@ typedef struct cxl_device_state {
> > 	 uint64_t host_set;
> >       } timestamp;
> >=20
> > -    /* memory region for persistent memory, HDM */
> > -    uint64_t pmem_size;
> > +    /* memory region for persistent and volatile memory, HDM */
> > +    uint64_t pmem_size, mem_size;
> >   } CXLDeviceState;
> >=20
> >   /* Initialize the register block for a device */
> > @@ -235,9 +235,9 @@ typedef struct cxl_type3_dev {
> >       PCIDevice parent_obj;
> >=20
> >       /* Properties */
> > -    AddressSpace hostmem_as;
> > +    AddressSpace hostmem_as, hostmemv_as;
> >       uint64_t size;
> > -    HostMemoryBackend *hostmem;
> > +    HostMemoryBackend *hostmem, *hostmemv;
> >       HostMemoryBackend *lsa;
> >       uint64_t sn;
> >=20
> > Then for cxl_setup_memory(), with ct3d->hostmem and/or ct3d->hostmemv
> > non-nil, set the respective MemoryRegions:
> >=20
> > +    if (ct3d->hostmem) {
> > +            memory_region_set_nonvolatile(mr, true);
> > +            memory_region_set_enabled(mr, true);
> > +            host_memory_backend_set_mapped(ct3d->hostmem, true);
> > +            address_space_init(&ct3d->hostmem_as, mr, name);
> > +            ct3d->cxl_dstate.pmem_size =3D ct3d->hostmem->size;
> > +    }
> > +    if (ct3d->hostmemv) {
> > +            memory_region_set_nonvolatile(mrv, false);
> > +            memory_region_set_enabled(mrv, true);
> > +            host_memory_backend_set_mapped(ct3d->hostmemv, true);
> > +            address_space_init(&ct3d->hostmem_as, mrv, name);
> > +            ct3d->cxl_dstate.pmem_size =3D ct3d->hostmem->size;
> > +    }
> >=20
> > For corresponding MB commands, it's mostly IDENTIFY_MEMORY_DEVICE that =
needs
> > updating:
> >=20
> > @@ -281,7 +281,7 @@ static ret_code cmd_identify_memory_device(struct c=
xl_cmd *cmd,
> >=20
> >       CXLType3Dev *ct3d =3D container_of(cxl_dstate, CXLType3Dev, cxl_d=
state);
> >       CXLType3Class *cvc =3D CXL_TYPE3_DEV_GET_CLASS(ct3d);
> > -    uint64_t size =3D cxl_dstate->pmem_size;
> > +    uint64_t size =3D cxl_dstate->pmem_size + cxl_dstate->mem_size;
> >=20
> >       if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
> > 	 return CXL_MBOX_INTERNAL_ERROR;
> > @@ -290,11 +290,11 @@ static ret_code cmd_identify_memory_device(struct=
 cxl_cmd *cmd,
> >       id =3D (void *)cmd->payload;
> >       memset(id, 0, sizeof(*id));
> >=20
> > -    /* PMEM only */
> >       snprintf(id->fw_revision, 0x10, "BWFW VERSION %02d", 0);
> >=20
> >       id->total_capacity =3D size / (256 << 20);
> > -    id->persistent_capacity =3D size / (256 << 20);
> > +    id->persistent_capacity =3D cxl_dstate->pmem_size / (256 << 20);
> > +    id->volatile_capacity =3D cxl_dstate->mem_size / (256 << 20);
> >       id->lsa_size =3D cvc->get_lsa_size(ct3d);
> >=20
> >       *len =3D sizeof(*id);
> > @@ -312,16 +312,16 @@ static ret_code cmd_ccls_get_partition_info(struc=
t cxl_cmd *cmd,
> > 	 uint64_t next_pmem;
> >       } QEMU_PACKED *part_info =3D (void *)cmd->payload;
> >       QEMU_BUILD_BUG_ON(sizeof(*part_info) !=3D 0x20);
> > -    uint64_t size =3D cxl_dstate->pmem_size;
> > +    uint64_t psize =3D cxl_dstate->pmem_size;
> > +    uint64_t vsize =3D cxl_dstate->mem_size;
> >=20
> > -    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
> > +    if (!QEMU_IS_ALIGNED(psize + vsize, 256 << 20)) {
> > 	 return CXL_MBOX_INTERNAL_ERROR;
> >       }
> >=20
> > -    /* PMEM only */
> > -    part_info->active_vmem =3D 0;
> > -    part_info->next_vmem =3D 0;
> > -    part_info->active_pmem =3D size / (256 << 20);
> > +    part_info->active_vmem =3D vsize / (256 << 20);
> > +    part_info->next_vmem =3D part_info->active_vmem;
> > +    part_info->active_pmem =3D psize / (256 << 20);
> >       part_info->next_pmem =3D part_info->active_pmem;
> >=20
> > Then for reads/writes, both cxl_type3_write() and _read() would, after =
computing the dpa_offset,
> > first try the volatile region then upon error attempt the same in the p=
ersistent memory - this
> > assuming the DPA space is consistent among both types of memory. Ie:
> >=20
> > address_space_read(&ct3d->hostmemv_as, dpa_offset, attrs, data, size)
> > or
> > address_space_read(&ct3d->hostmem_as, dpa_offset, attrs, data, size)
> >=20
> > ... but then again all this is probably just wishful thinking.
>=20
> Without looking in detail, will indeed be something along those lines.
> Gets more fiddly if you include partitioning control that Alison was inte=
rested
> in adding.
>=20
> Also, we probably need to support multiple HDM decoders.  Also not a huge
> complexity to add, but left for now as main focus is to get the base
> patch set merged.
>=20
> So I'm happy to queue stuff up on top of this series and carry it forward
> but I don't want to add features to what we try to merge initially.
> This set is already huge and hard to review even with what think is a
> minimum set of features to be useful.
>=20
> Note I'm already carrying a few features on top if this on the gitlab
> branch gitlab.com/jic23/qemu (DOE + CDAT and serial numbers) and
> have a few other things out of tree for now (SPDM, emulating most
> of the PCI Config space controls).=20
>=20

Thanks for the updates. Do you have any suggestions on how to coordinate=20
efforts? Ideally we can have a list of features that need to be developed a=
nd
some names of people that will lead the work.=20

> Jonathan
>=20
> >=20
> > Thanks,
> > Davidlohr
> =

