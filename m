Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09589485E17
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 02:23:50 +0100 (CET)
Received: from localhost ([::1]:41308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5HVM-0003E2-Rh
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 20:23:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n5HU8-0002YQ-S1
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 20:22:32 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n5HU4-0005Us-Qx
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 20:22:31 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JTpQg5nq5zZf1f;
 Thu,  6 Jan 2022 09:18:51 +0800 (CST)
Received: from dggpeml100025.china.huawei.com (7.185.36.37) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 09:22:19 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml100025.china.huawei.com (7.185.36.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 09:22:19 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Thu, 6 Jan 2022 09:22:19 +0800
To: Stefan Hajnoczi <stefanha@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>
CC: "mst@redhat.com" <mst@redhat.com>, "sgarzare@redhat.com"
 <sgarzare@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, Yechuan <yechuan@huawei.com>, Huangzhichao
 <huangzhichao@huawei.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [RFC 03/10] vdpa: add the infrastructure of vdpa-dev
Thread-Topic: [RFC 03/10] vdpa: add the infrastructure of vdpa-dev
Thread-Index: AQHYAc9wQcBMOaZJ8E6jHjTcTX4/g6xTqSWAgAGCdDA=
Date: Thu, 6 Jan 2022 01:22:19 +0000
Message-ID: <21147b9ccec84deabbd1dcf32f19f05e@huawei.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-4-longpeng2@huawei.com>
 <YdVpgaq/mFEZQpT7@stefanha-x1.localdomain>
In-Reply-To: <YdVpgaq/mFEZQpT7@stefanha-x1.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>



> -----Original Message-----
> From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> Sent: Wednesday, January 5, 2022 5:49 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: mst@redhat.com; jasowang@redhat.com; sgarzare@redhat.com;
> cohuck@redhat.com; pbonzini@redhat.com; Gonglei (Arei)
> <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>; Huangzhichao
> <huangzhichao@huawei.com>; qemu-devel@nongnu.org
> Subject: Re: [RFC 03/10] vdpa: add the infrastructure of vdpa-dev
>=20
> On Wed, Jan 05, 2022 at 08:58:53AM +0800, Longpeng(Mike) wrote:
> > +static const VirtioPCIDeviceTypeInfo vhost_vdpa_device_pci_info =3D {
> > +    .base_name               =3D TYPE_VHOST_VDPA_DEVICE_PCI,
> > +    .generic_name            =3D "vhost-vdpa-device-pci",
> > +    .transitional_name       =3D "vhost-vdpa-device-pci-transitional",
> > +    .non_transitional_name   =3D "vhost-vdpa-device-pci-non-transition=
al",
>=20
> Does vDPA support Transitional VIRTIO devices?
>=20
> I expected this device to support Modern devices only.
>=20

There's already a 0.95 vdpa driver (Alibaba ENI) in the kernel source and
supporting 0.95 devices is necessary for some older GuestOS.

I'm OK if other guys also approve of supporting 1.0+ devices only :)

> Stefan

