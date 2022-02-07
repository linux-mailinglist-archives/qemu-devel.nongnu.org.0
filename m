Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4524AC164
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:39:45 +0100 (CET)
Received: from localhost ([::1]:39222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5B9-0003U1-Kl
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:39:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nH4tF-0000vy-Of
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:21:13 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nH4t2-00053a-Fo
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:21:13 -0500
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Jsp8l1p5Mz67YYY;
 Mon,  7 Feb 2022 22:16:07 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Feb 2022 15:20:09 +0100
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Mon, 7 Feb
 2022 14:20:08 +0000
Date: Mon, 7 Feb 2022 14:20:07 +0000
To: <qemu-devel@nongnu.org>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v5 00/43] CXl 2.0 emulation Support
Message-ID: <20220207142007.00004801@huawei.com>
In-Reply-To: <20220202141037.17352-1-Jonathan.Cameron@huawei.com>
References: <20220202141037.17352-1-Jonathan.Cameron@huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml743-chm.china.huawei.com (10.201.108.193) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Wed, 2 Feb 2022 14:09:54 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> Changes since v4:
> https://lore.kernel.org/linux-cxl/20220124171705.10432-1-Jonathan.Cameron=
@huawei.com/
>=20
> Note documentation patch that Alex requested to follow.
> I don't want to delay getting this out as Alex mentioned possibly
> having time to continue reviewing in latter part of this week.
>=20
> Issues identified by CI / Alex Benn=E9e
> - Stubs added for hw/cxl/cxl-host and hw/acpi/cxl plus related meson
>   changes to use them as necessary.
> - Drop uid from cxl-test (result of last minute change in v4 that was not
>   carried through to the test)
> - Fix naming clash with field name ERROR which on some arches is defined
>   and results in the string being replaced with 0 in some of the
>   register field related defines.  Call it ERR instead.
> - Fix type issue around mr->size by using 64 bit acessor functions.
> - Add a new patch to exclude pxb-cxl from device-crash-test in similar
>   fashion to pxb.
>=20
> CI tests now passing with exception of checkpatch which has what
> I think is a false positive and build-oss-fuzz which keeps timing out.
> https://gitlab.com/jic23/qemu/-/pipelines/460109208
> There were a few tweaks to patch descriptions after I pushed that
> out (I missed a few RB from Alex).
>=20
> Other changes (mostly from Alex's review)
> - Change component register handling to now report UNIMP and return 0
>   for 8 byte registers as we currently don't implement any of them.
>   Note that this means we need a kernel fix:
>   https://lore.kernel.org/linux-cxl/20220201153437.2873-1-Jonathan.Camero=
n@huawei.com/
> - Drop majority of the macros used in defining mailbox handlers in
>   favour of written out code.
> - Use REG64 where appropriate. This was introduced whilst this set
>   has been underdevelopment so I missed it.
> - Clarify some register access options wrt to CXL 2.0 Errata F4.
> - Change timestamp to qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
> - Use typed enums to enforce types of function arguements.
> - Default to cxl being off in machine_class_init() removing
>   need to set it to off in machines where there is no support as yet.
> - Add Alex's RB where given.
>=20
> Looking in particular for:
> * Review of the PCI interactions
> * x86 and ARM machine interactions (particularly the memory maps)
> * Review of the interleaving approach - is the basic idea
>   acceptable?
> * Review of the command line interface.
> * CXL related review welcome but much of that got reviewed
>   in earlier versions and hasn't changed substantially.
>=20
> Big TODOs:
>=20
> * Interleave boundary issues. I haven't yet solved this but didn't
>   want to futher delay the review of the rest of the series.

So... After fixing my test, it became clear that Qemu won't issue
unaligned memory accesses to device unless mr->ram =3D=3D true.
We can't set that for a CXL Fixed Memory Window (CFMW) as we have only an
indirect association with the CXL type3 memory devices and their
backing RAM. The interleave decoding has to sit in between.

So it 'kind of' works without any special handling as QEMU splits the
accesses into two anyway.

I don't yet understand fully the implications of this and whether
it in any real way restricts what can be done with the interleaved
memory under a CXL fixed memory region.  Would definitely appreciate
inputs on this aspect.

The really short background story is:

1) Host PA memory region (CFMW) to which expectation is any access that
would be fine to normal DDR/Ram or NVDIMMs should work as long
as appropriate CXL topology and decoder configuration has been done
to get the memory accesses to actual memory.
2) The actual accesses to PAs in that region are interleaved
via several decoders on path to memory - min granularity is 256
bytes so any given access can only end up hitting 1 or 2 devices.
3) Fun corner cases are unaligned access crossing the interleave
boundary.=20

Jonathan

