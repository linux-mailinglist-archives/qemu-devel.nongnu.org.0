Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606A44ED991
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 14:23:47 +0200 (CEST)
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtq6-0006Xm-6T
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 08:23:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nZtn2-0004Te-Mn
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:20:38 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nZtmz-0007Rf-5G
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:20:34 -0400
Received: from fraeml740-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KTj5T690xz685N3;
 Thu, 31 Mar 2022 20:18:53 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml740-chm.china.huawei.com (10.206.15.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 31 Mar 2022 14:20:23 +0200
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 31 Mar
 2022 13:20:22 +0100
Date: Thu, 31 Mar 2022 13:20:21 +0100
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, Alex =?ISO-8859-1?Q?Be?=
 =?ISO-8859-1?Q?nn=E9e?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, Philippe =?ISO-8859-1?Q?Mathieu-D?=
 =?ISO-8859-1?Q?aud=E9?= <f4bug@amsat.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, 
 Chris Browy <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, 
 Dan Williams <dan.j.williams@intel.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v8 02/46] hw/cxl/component: Introduce CXL components
 (8.1.x, 8.2.5)
Message-ID: <20220331132021.000014c4@huawei.com>
In-Reply-To: <20220318150635.24600-3-Jonathan.Cameron@huawei.com>
References: <20220318150635.24600-1-Jonathan.Cameron@huawei.com>
 <20220318150635.24600-3-Jonathan.Cameron@huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml717-chm.china.huawei.com (10.201.108.68) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On Fri, 18 Mar 2022 15:05:51 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> From: Ben Widawsky <ben.widawsky@intel.com>
>=20
> A CXL 2.0 component is any entity in the CXL topology. All components
> have a analogous function in PCIe. Except for the CXL host bridge, all
> have a PCIe config space that is accessible via the common PCIe
> mechanisms. CXL components are enumerated via DVSEC fields in the
> extended PCIe header space. CXL components will minimally implement some
> subset of CXL.mem and CXL.cache registers defined in 8.2.5 of the CXL
> 2.0 specification. Two headers and a utility library are introduced to
> support the minimum functionality needed to enumerate components.
>=20
> The cxl_pci header manages bits associated with PCI, specifically the
> DVSEC and related fields. The cxl_component.h variant has data
> structures and APIs that are useful for drivers implementing any of the
> CXL 2.0 components. The library takes care of making use of the DVSEC
> bits and the CXL.[mem|cache] registers. Per spec, the registers are
> little endian.
>=20
> None of the mechanisms required to enumerate a CXL capable hostbridge
> are introduced at this point.
>=20
> Note that the CXL.mem and CXL.cache registers used are always 4B wide.
> It's possible in the future that this constraint will not hold.
>=20
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
There will be one other addition to this in v9 which is to add
the device GPF dvsec structure definition.

I'll also add the relevant instantiation of this to the type 3 device
and the Port GPF instantiation for the root port and switch
DSP as these are mandatory (Even if they aren't that interesting to an OS)

>

