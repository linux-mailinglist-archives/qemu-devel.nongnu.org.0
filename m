Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8A84EA710
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 07:22:22 +0200 (CEST)
Received: from localhost ([::1]:60582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ4JA-0004A9-Nc
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 01:22:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nZ4HG-0003Ta-LQ
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 01:20:22 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:5139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nZ4HE-00036J-Sm
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 01:20:22 -0400
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KSHrt3nS7zCr5f;
 Tue, 29 Mar 2022 13:18:06 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 29 Mar 2022 13:20:18 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.021;
 Tue, 29 Mar 2022 13:20:18 +0800
To: Stefano Garzarella <sgarzare@redhat.com>
CC: "stefanha@redhat.com" <stefanha@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, Yechuan <yechuan@huawei.com>, Huangzhichao
 <huangzhichao@huawei.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 00/10] add generic vDPA device support
Thread-Topic: [PATCH v3 00/10] add generic vDPA device support
Thread-Index: AQHYO2HIELk+OCocVkyo/UOIXyon/qzUb3MAgAFyTbA=
Date: Tue, 29 Mar 2022 05:20:18 +0000
Message-ID: <376adc7b42cd4e14a2bcc4c9e70bd63d@huawei.com>
References: <20220319072012.525-1-longpeng2@huawei.com>
 <20220328151156.gr6bzybthgs2kop6@sgarzare-redhat>
In-Reply-To: <20220328151156.gr6bzybthgs2kop6@sgarzare-redhat>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>



> -----Original Message-----
> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> Sent: Monday, March 28, 2022 11:12 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
> qemu-devel@nongnu.org
> Subject: Re: [PATCH v3 00/10] add generic vDPA device support
>=20
> On Sat, Mar 19, 2022 at 03:20:02PM +0800, Longpeng(Mike) wrote:
> >From: Longpeng <longpeng2@huawei.com>
> >
> >Hi guys,
> >
> >With the generic vDPA device, QEMU won't need to touch the device
> >types any more, such like vfio.
> >
> >We can use the generic vDPA device as follow:
> >  -device vhost-vdpa-device-pci,vdpa-dev=3D/dev/vhost-vdpa-X
> >
> >I've done some simple tests on Huawei's offloading card (net, 0.95)
> >and vdpa_sim_blk (1.0);
>=20
> The whole seems almost okay, I left you some comments, but for the next
> version maybe it's better to reorganize the series differently.
>=20
> Instead of adding vdpa-dev and vdpa-dev-pci incrementally, with stub
> functions and untestable parts, I would make a patch that adds vdpa-dev
> in full and then one that adds vdpa-dev-pci.

Ok, will do in next version.

> The first 2 patches on the other hand are okay, maybe patch 2 won't be
> needed since I think we will sync the headers after the 7.0 release, but
> is better to keep it for now to simplify the review.
>=20

Yes, that's also my original intent. Thanks.

> Thanks,
> Stefano


