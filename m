Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E726EB099
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 19:34:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppudV-00015I-TI; Fri, 21 Apr 2023 13:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppudO-00011c-K0
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:33:22 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppudL-0002rp-HD
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:33:22 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q31mh462yz67FD1;
 Sat, 22 Apr 2023 01:32:04 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 21 Apr
 2023 18:33:15 +0100
Date: Fri, 21 Apr 2023 18:33:14 +0100
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Fan Ni
 <fan.ni@samsung.com>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 "Ira Weiny" <ira.weiny@intel.com>, Alison Schofield
 <alison.schofield@intel.com>, Michael Roth <michael.roth@amd.com>, Dave Jiang
 <dave.jiang@intel.com>, Markus Armbruster <armbru@redhat.com>, "Daniel P .
 =?ISO-8859-1?Q?Berrang?= =?ISO-8859-1?Q?=E9?=" <berrange@redhat.com>, Eric
 Blake <eblake@redhat.com>, Mike Maslenkin <mike.maslenkin@gmail.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>, "Thomas
 Huth" <thuth@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>
Subject: Re: [PATCH v4 5/6] hw/cxl: Add poison injection via the mailbox.
Message-ID: <20230421183314.000011d9@Huawei.com>
In-Reply-To: <c5332793-f062-e4e7-9579-8eeb416e57ab@linaro.org>
References: <20230303150908.27889-1-Jonathan.Cameron@huawei.com>
 <20230303150908.27889-6-Jonathan.Cameron@huawei.com>
 <c5332793-f062-e4e7-9579-8eeb416e57ab@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 14 Mar 2023 07:27:52 +0100
Philippe Mathieu-Daud=E9 <philmd@linaro.org> wrote:

> On 3/3/23 16:09, Jonathan Cameron wrote:
> > Very simple implementation to allow testing of corresponding
> > kernel code. Note that for now we track each 64 byte section
> > independently.  Whilst a valid implementation choice, it may
> > make sense to fuse entries so as to prove out more complex
> > corners of the kernel code.
> >=20
> > Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> > v4: No change
> > ---
> >   hw/cxl/cxl-mailbox-utils.c | 41 ++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 41 insertions(+) =20
>=20
>=20
> > +static CXLRetCode cmd_media_inject_poison(struct cxl_cmd *cmd,
> > +                                          CXLDeviceState *cxl_dstate,
> > +                                          uint16_t *len)
> > +{
> > +    CXLType3Dev *ct3d =3D container_of(cxl_dstate, CXLType3Dev, cxl_ds=
tate); =20
>=20
> This makes me wonder why CXLDeviceState isn't QDev based.

Interesting question that I'll look into, but I hope you don't mind if
I separate that question from this series.

Logically it's a one of a couple of different subsets of functionality and
different CXL components have a different mix of those. I'm not sure
that will map to a QDev based approach. I'll need to take more time to look=
 into
this.

>=20
> (Also, why include/hw/cxl/cxl_device.h is under GPL-2.0-only license?)

Not a clue.   Ben, any comment?




