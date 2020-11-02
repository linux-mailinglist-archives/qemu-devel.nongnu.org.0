Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8B12A2B88
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 14:30:39 +0100 (CET)
Received: from localhost ([::1]:53462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZZuw-0006gC-5y
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 08:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kZZtN-0005tv-HU
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 08:29:01 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kZZtL-0002N1-5y
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 08:29:01 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4CPtzS06FRz51SY;
 Mon,  2 Nov 2020 21:28:52 +0800 (CST)
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.225]) by
 DGGEMM404-HUB.china.huawei.com ([10.3.20.212]) with mapi id 14.03.0487.000;
 Mon, 2 Nov 2020 21:28:49 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] vhost: fix up trailing whitespace
Thread-Topic: [PATCH] vhost: fix up trailing whitespace
Thread-Index: AQHWsQGrgbGGjaSyiU6peXAiC3t0Sqm01hcw
Date: Mon, 2 Nov 2020 13:28:48 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BA22281@dggemm531-mbx.china.huawei.com>
References: <20201102101301.1101378-1-mst@redhat.com>
In-Reply-To: <20201102101301.1101378-1-mst@redhat.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga02-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 08:28:53
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Qemu-devel
> [mailto:qemu-devel-bounces+kuhn.chenqun=3Dhuawei.com@nongnu.org] On
> Behalf Of Michael S. Tsirkin
> Sent: Monday, November 2, 2020 6:13 PM
> To: qemu-devel@nongnu.org
> Subject: [PATCH] vhost: fix up trailing whitespace
>=20
> Drop trailing whitespace in vhost.c
>=20
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/virtio/vhost.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c index
> f2482378c6..2e904bbd62 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1648,12 +1648,12 @@ int vhost_dev_load_inflight(struct vhost_inflight
> *inflight, QEMUFile *f)  int vhost_dev_prepare_inflight(struct vhost_dev =
*hdev)
> {
>      int r;
> -
> +
>      if (hdev->vhost_ops->vhost_get_inflight_fd =3D=3D NULL ||
>          hdev->vhost_ops->vhost_set_inflight_fd =3D=3D NULL) {
>          return 0;
>      }
> -
> +
>      r =3D vhost_dev_set_features(hdev, hdev->log_enabled);
>      if (r < 0) {
>          VHOST_OPS_DEBUG("vhost_dev_prepare_inflight failed");
> --
> MST
>=20
Reviewed-by: Chen Qun <kuhn.chenqun@huawei.com>

