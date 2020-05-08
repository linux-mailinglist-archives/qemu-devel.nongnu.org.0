Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C561CAF6E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 15:19:28 +0200 (CEST)
Received: from localhost ([::1]:56716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX2uV-0006HT-4Q
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 09:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miaoyubo@huawei.com>)
 id 1jX2su-00052a-L2
 for qemu-devel@nongnu.org; Fri, 08 May 2020 09:17:48 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2462 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miaoyubo@huawei.com>)
 id 1jX2st-0003p8-5f
 for qemu-devel@nongnu.org; Fri, 08 May 2020 09:17:48 -0400
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 5EAFF417C297D3D916AE;
 Fri,  8 May 2020 21:17:35 +0800 (CST)
Received: from dggeme707-chm.china.huawei.com (10.1.199.103) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 8 May 2020 21:17:35 +0800
Received: from dggeme756-chm.china.huawei.com (10.3.19.102) by
 dggeme707-chm.china.huawei.com (10.1.199.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Fri, 8 May 2020 21:17:35 +0800
Received: from dggeme756-chm.china.huawei.com ([10.6.80.68]) by
 dggeme756-chm.china.huawei.com ([10.6.80.68]) with mapi id 15.01.1913.007;
 Fri, 8 May 2020 21:17:34 +0800
From: miaoyubo <miaoyubo@huawei.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH v6 5/8] acpi: Align the size to 128k
Thread-Topic: [PATCH v6 5/8] acpi: Align the size to 128k
Thread-Index: AQHWDaWUvFhviwtWwUqLPdmf4WCHnKiXmCuAgAbBSRA=
Date: Fri, 8 May 2020 13:17:34 +0000
Message-ID: <b53dd2bb80554ad19a424477fa4e8951@huawei.com>
References: <20200408125816.955-1-miaoyubo@huawei.com>
 <20200408125816.955-6-miaoyubo@huawei.com>
 <20200504100317-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200504100317-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.173.221.29]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=miaoyubo@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 09:17:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Xiexiangyou <xiexiangyou@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Michael S. Tsirkin [mailto:mst@redhat.com]
> Sent: Monday, May 4, 2020 10:03 PM
> To: miaoyubo <miaoyubo@huawei.com>
> Cc: peter.maydell@linaro.org; shannon.zhaosl@gmail.com;
> lersek@redhat.com; imammedo@redhat.com; qemu-devel@nongnu.org;
> berrange@redhat.com; Xiexiangyou <xiexiangyou@huawei.com>
> Subject: Re: [PATCH v6 5/8] acpi: Align the size to 128k
>=20
> On Wed, Apr 08, 2020 at 08:58:13PM +0800, Yubo Miao wrote:
> > From: miaoyubo <miaoyubo@huawei.com>
> >
> > If table size is changed between virt_acpi_build and
> > virt_acpi_build_update, the table size would not be updated to UEFI,
> > therefore, just align the size to 128kb, which is enough and same with
> > x86. It would warn if 64k is not enough and the align size should be
> > updated.
> >
> > Signed-off-by: miaoyubo <miaoyubo@huawei.com>
>=20
> does this affect migration in any way?
>=20

No, it would not affect migration.
I migrated one vm between two qemus(one with tables aligned to 128k and one=
 not)
and the vm could be migrated.=20

> > ---
> >  hw/arm/virt-acpi-build.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c index
> > 7bcd04dfb7..89bb768b0c 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -54,6 +54,8 @@
> >  #include "hw/pci/pci_bridge.h"
> >  #define ARM_SPI_BASE 32
> >
> > +#define ACPI_BUILD_TABLE_SIZE             0x20000
> > +
> >  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)  {
> >      uint16_t i;
> > @@ -883,6 +885,15 @@ struct AcpiBuildState {
> >      bool patched;
> >  } AcpiBuildState;
> >
> > +static void acpi_align_size(GArray *blob, unsigned align) {
> > +    /*
> > +     * Align size to multiple of given size. This reduces the chance
> > +     * we need to change size in the future (breaking cross version
> migration).
> > +     */
> > 2.19.1
> >

Regards,
Miao

