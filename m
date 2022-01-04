Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0230B483989
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 01:50:47 +0100 (CET)
Received: from localhost ([::1]:50206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Y2I-0000LZ-K4
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 19:50:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4Y0b-000832-BA
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 19:49:01 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4Y0Y-0005zw-I2
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 19:49:01 -0500
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JSYmz5H06zZdxm;
 Tue,  4 Jan 2022 08:45:23 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 08:48:49 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 08:48:48 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Tue, 4 Jan 2022 08:48:48 +0800
To: "pbonzini@redhat.com" <pbonzini@redhat.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "mtosatti@redhat.com" <mtosatti@redhat.com>
CC: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: RE: [PATCH 0/2] kvm/msi: do explicit commit when adding msi routes
Thread-Topic: [PATCH 0/2] kvm/msi: do explicit commit when adding msi routes
Thread-Index: AQHX7psu1N6+1Tf/akGsiLQxqZd2LaxSLE7Q
Date: Tue, 4 Jan 2022 00:48:48 +0000
Message-ID: <c9eba7e294ae4bc68bf1095ace98fa34@huawei.com>
References: <20211211142703.1941-1-longpeng2@huawei.com>
In-Reply-To: <20211211142703.1941-1-longpeng2@huawei.com>
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
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi guys,

Ping...

> -----Original Message-----
> From: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> Sent: Saturday, December 11, 2021 10:27 PM
> To: pbonzini@redhat.com; alex.williamson@redhat.com; mst@redhat.com;
> mtosatti@redhat.com
> Cc: kvm@vger.kernel.org; qemu-devel@nongnu.org; Gonglei (Arei)
> <arei.gonglei@huawei.com>; Longpeng (Mike, Cloud Infrastructure Service
> Product Dept.) <longpeng2@huawei.com>
> Subject: [PATCH 0/2] kvm/msi: do explicit commit when adding msi routes
>=20
> From: Longpeng <longpeng2@huawei.com>
>=20
> This patchset moves the call to kvm_irqchip_commit_routes() out of
> kvm_irqchip_add_msi_route(). An optimization of vfio migration [1]
> depends on this changes.
>=20
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00968.html
>=20
> Longpeng (Mike) (2):
>   kvm-irqchip: introduce new API to support route change
>   kvm/msi: do explicit commit when adding msi routes
>=20
>  accel/kvm/kvm-all.c    |  7 ++++---
>  accel/stubs/kvm-stub.c |  2 +-
>  hw/misc/ivshmem.c      |  5 ++++-
>  hw/vfio/pci.c          |  5 ++++-
>  hw/virtio/virtio-pci.c |  4 +++-
>  include/sysemu/kvm.h   | 23 +++++++++++++++++++++--
>  target/i386/kvm/kvm.c  |  4 +++-
>  7 files changed, 40 insertions(+), 10 deletions(-)
>=20
> --
> 2.23.0


