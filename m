Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A087349BAA6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 18:54:17 +0100 (CET)
Received: from localhost ([::1]:44262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCQ1I-0001H5-BQ
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 12:54:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nCPyu-0007VU-5d
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:51:48 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nCPyl-0002xx-HC
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:51:47 -0500
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JjvTN6TK1z689wD;
 Wed, 26 Jan 2022 01:48:08 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 25 Jan 2022 18:51:34 +0100
Received: from localhost (10.47.28.100) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Tue, 25 Jan
 2022 17:51:33 +0000
Date: Tue, 25 Jan 2022 17:51:30 +0000
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 29/42] hw/cxl/host: Add support for CXL Fixed Memory
 Windows.
Message-ID: <20220125175130.00005a46@Huawei.com>
In-Reply-To: <87sftbd9y9.fsf@linaro.org>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-30-Jonathan.Cameron@huawei.com>
 <87sftbd9y9.fsf@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.28.100]
X-ClientProxiedBy: lhreml729-chm.china.huawei.com (10.201.108.80) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Tue, 25 Jan 2022 17:02:32 +0000
Alex Benn=E9e <alex.bennee@linaro.org> wrote:

> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>=20
> > From: Jonathan Cameron <jonathan.cameron@huawei.com>
> >
> > The concept of these is introduced in [1] in terms of the
> > description the CEDT ACPI table. The principal is more general.
> > Unlike once traffic hits the CXL root bridges, the host system
> > memory address routing is implementation defined and effectively
> > static once observable by standard / generic system software.
> > Each CXL Fixed Memory Windows (CFMW) is a region of PA space
> > which has fixed system dependent routing configured so that
> > accesses can be routed to the CXL devices below a set of target
> > root bridges. The accesses may be interleaved across multiple
> > root bridges. =20
>=20
> This breaks the linux-user builds...
> > diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> > index 0eca715d10..27dff3868b 100644
> > --- a/hw/cxl/meson.build
> > +++ b/hw/cxl/meson.build
> > @@ -1,5 +1,9 @@
> > -softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
> > -  'cxl-component-utils.c',
> > -  'cxl-device-utils.c',
> > -  'cxl-mailbox-utils.c',
> > +specific_ss.add(when: 'CONFIG_CXL', if_true: files(
> > +      'cxl-component-utils.c',
> > +      'cxl-device-utils.c',
> > +      'cxl-mailbox-utils.c',
> > +      'cxl-host.c',
> > +))
> > +specific_ss.add(when: 'CONFIG_CXL', if_false: files(
> > +      'cxl-host-stubs.c',
> >  )) =20
>=20
> I think you want this:
>=20
>   softmmu_ss.add(when: 'CONFIG_CXL',
>                  if_true: files(
>                    'cxl-component-utils.c',
>                    'cxl-device-utils.c',
>                    'cxl-mailbox-utils.c',
>                    'cxl-host.c'),
>                  if_false: files(
>                    'cxl-host-stubs.c',
>                  ))
>=20
>   # This is required as well:
>   softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('cxl-host-stubs.c'))

Ah.  I'd started with the first block and got incomprehensible error
message.  Second block fixes it.

I'll not pretend to understand the 'why' :)

Thanks,

Jonathan

>=20
>=20


