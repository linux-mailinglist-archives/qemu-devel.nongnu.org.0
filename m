Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B87FE030
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 15:35:23 +0100 (CET)
Received: from localhost ([::1]:40004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVch0-0000qf-LV
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 09:35:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33395)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gengdongjiu@huawei.com>) id 1iVcej-0007Qd-NB
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 09:33:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gengdongjiu@huawei.com>) id 1iVcei-0004OC-EH
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 09:33:01 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2050 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
 id 1iVcef-0004C3-KE; Fri, 15 Nov 2019 09:32:57 -0500
Received: from lhreml705-cah.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id EC45E68D6C269495430B;
 Fri, 15 Nov 2019 14:32:51 +0000 (GMT)
Received: from lhreml712-chm.china.huawei.com (10.201.108.63) by
 lhreml705-cah.china.huawei.com (10.201.108.46) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 15 Nov 2019 14:32:51 +0000
Received: from dggeme755-chm.china.huawei.com (10.3.19.101) by
 lhreml712-chm.china.huawei.com (10.201.108.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1713.5; Fri, 15 Nov 2019 14:32:50 +0000
Received: from dggeme755-chm.china.huawei.com ([10.7.64.71]) by
 dggeme755-chm.china.huawei.com ([10.7.64.71]) with mapi id 15.01.1713.004;
 Fri, 15 Nov 2019 22:32:47 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>, "zhengxiang (A)"
 <zhengxiang9@huawei.com>
Subject: Re: [RESEND PATCH v21 3/6] ACPI: Add APEI GHES table generation
 support
Thread-Topic: [RESEND PATCH v21 3/6] ACPI: Add APEI GHES table generation
 support
Thread-Index: AdWbwWSZ/1gyxkpeREeYn2g+7NgH+g==
Date: Fri, 15 Nov 2019 14:32:47 +0000
Message-ID: <19b1b4b9ceb24aad9f34ab4e58bccab3@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.148.208.87]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 185.176.76.210
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 "mtosatti@redhat.com" <mtosatti@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "james.morse@arm.com" <james.morse@arm.com>, "xuwei \(O\)" <xuwei5@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "lersek@redhat.com" <lersek@redhat.com>, "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > + */
> > +static void acpi_ghes_build_notify(GArray *table, const uint8_t type)
>=20
> typically format should be build_WHAT(), so
>  build_ghes_hw_error_notification()
>=20
> And I'd move this out into its own patch.
> this applies to other trivial in-depended sub-tables, that take all data =
needed to construct them from supplied arguments.

I very used your suggested method in previous series[1], but other maintain=
er suggested to move this function to this file, because he think only GHES=
 used it

[1]:
https://patchwork.ozlabs.org/cover/1099428/

>=20
> > +{
> > +        /* Type */
> > +        build_append_int_noprefix(table, type, 1);
> > +        /*
> > +         * Length:
> > +         * Total length of the structure in bytes
> > +         */
> > +        build_append_int_noprefix(table, 28, 1);
> > +        /* Configuration Write Enable */
> > +        build_append_int_noprefix(table, 0, 2);
> > +        /* Poll Interval */
> > +        build_append_int_noprefix(table, 0, 4);
> > +        /* Vector */
> > +        build_append_int_noprefix(table, 0, 4);
> > +        /* Switch To Polling Threshold Value */
> > +        build_append_int_noprefix(table, 0, 4);
> > +        /* Switch To Polling Threshold Window */
> > +        build_append_int_noprefix(table, 0, 4);
> > +        /* Error Threshold Value */
> > +        build_append_int_noprefix(table, 0, 4);
> > +        /* Error Threshold Window */
> > +        build_append_int_noprefix(table, 0, 4); }
> > +
>=20
> /*
>   Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fwcfg b=
lobs.
>   See docs/specs/acpi_hest_ghes.rst for blobs format */
> > +void acpi_ghes_build_error_table(GArray *hardware_errors, BIOSLinker
> > +*linker)
> build_ghes_error_table()
>=20
> also I'd move this function into its own patch along with other related c=
ode that initializes and wires it into virt board.

I ever use your suggested method[1], but other maintainer, it seems Michael=
, suggested to move these functions to this file that used it, because he t=
hink only GHES used it.

[1]:
https://patchwork.ozlabs.org/patch/1099424/
https://patchwork.ozlabs.org/patch/1099425/
https://patchwork.ozlabs.org/patch/1099430/



