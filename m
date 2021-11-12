Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F8944E0EF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 05:01:27 +0100 (CET)
Received: from localhost ([::1]:47992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlNkj-0006tJ-VE
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 23:01:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mlNjL-0006B0-VL
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 22:59:59 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mlNjI-0001XA-PL
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 22:59:59 -0500
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hr4Y66YfzzZd1X;
 Fri, 12 Nov 2021 11:57:30 +0800 (CST)
Received: from dggpemm100007.china.huawei.com (7.185.36.116) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 11:59:47 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm100007.china.huawei.com (7.185.36.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 11:59:46 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.015;
 Fri, 12 Nov 2021 11:59:46 +0800
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
To: "pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: RE: [PATCH v5 4/6] kvm: irqchip: extract
 kvm_irqchip_add_deferred_msi_route
Thread-Topic: [PATCH v5 4/6] kvm: irqchip: extract
 kvm_irqchip_add_deferred_msi_route
Thread-Index: AQHX0IsxWviLXRP53kGau6vBqNcnCav/UFjg
Date: Fri, 12 Nov 2021 03:59:46 +0000
Message-ID: <dcdeba83881c4fe289092ed55cb9500b@huawei.com>
References: <20211103081657.1945-1-longpeng2@huawei.com>
 <20211103081657.1945-5-longpeng2@huawei.com>
In-Reply-To: <20211103081657.1945-5-longpeng2@huawei.com>
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

Ping...

Do you have any suggestions about this change ? It seems Alex has no
objection on this series now, but we need your ACK, thanks.


> -----Original Message-----
> From: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> Sent: Wednesday, November 3, 2021 4:17 PM
> To: alex.williamson@redhat.com; pbonzini@redhat.com
> Cc: qemu-devel@nongnu.org; kvm@vger.kernel.org; Gonglei (Arei)
> <arei.gonglei@huawei.com>; Longpeng (Mike, Cloud Infrastructure Service
> Product Dept.) <longpeng2@huawei.com>
> Subject: [PATCH v5 4/6] kvm: irqchip: extract
> kvm_irqchip_add_deferred_msi_route
>=20
> Extract a common helper that add MSI route for specific vector
> but does not commit immediately.
>=20
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  accel/kvm/kvm-all.c  | 15 +++++++++++++--
>  include/sysemu/kvm.h |  6 ++++++
>  2 files changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index db8d83b..8627f7c 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -1953,7 +1953,7 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage ms=
g)
>      return kvm_set_irq(s, route->kroute.gsi, 1);
>  }
>=20
> -int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
> +int kvm_irqchip_add_deferred_msi_route(KVMState *s, int vector, PCIDevic=
e
> *dev)
>  {
>      struct kvm_irq_routing_entry kroute =3D {};
>      int virq;
> @@ -1996,7 +1996,18 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vec=
tor,
> PCIDevice *dev)
>=20
>      kvm_add_routing_entry(s, &kroute);
>      kvm_arch_add_msi_route_post(&kroute, vector, dev);
> -    kvm_irqchip_commit_routes(s);
> +
> +    return virq;
> +}
> +
> +int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
> +{
> +    int virq;
> +
> +    virq =3D kvm_irqchip_add_deferred_msi_route(s, vector, dev);
> +    if (virq >=3D 0) {
> +        kvm_irqchip_commit_routes(s);
> +    }
>=20
>      return virq;
>  }
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index a1ab1ee..8de0d9a 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -476,6 +476,12 @@ void kvm_init_cpu_signals(CPUState *cpu);
>   * @return: virq (>=3D0) when success, errno (<0) when failed.
>   */
>  int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev);
> +/**
> + * Add MSI route for specific vector but does not commit to KVM
> + * immediately
> + */
> +int kvm_irqchip_add_deferred_msi_route(KVMState *s, int vector,
> +                                       PCIDevice *dev);
>  int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
>                                   PCIDevice *dev);
>  void kvm_irqchip_commit_routes(KVMState *s);
> --
> 1.8.3.1


