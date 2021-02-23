Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEF8322E1B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:56:50 +0100 (CET)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEa3N-0008Pb-N7
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lEa2Q-0007t0-7g
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:55:50 -0500
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:50215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lEa2N-0007xM-Rc
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:55:49 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.193])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 22AE32458DE;
 Tue, 23 Feb 2021 16:55:44 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 23 Feb
 2021 16:55:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002b39267b4-66d9-4876-b8a8-2e7443fc35ca,
 6F2917FB5EF69EFB637F8DE19110E4015BA123FD) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 23 Feb 2021 16:55:41 +0100
From: Greg Kurz <groug@kaod.org>
To: <lagarcia@linux.ibm.com>
Subject: Re: [PATCH v2] IOMMU not supported by vhost-user.
Message-ID: <20210223165541.5aafc638@bahia.lan>
In-Reply-To: <a47b7a5dafcab0f3a662414ba6cbbc7eb280d478.1613591341.git.lagarcia@br.ibm.com>
References: <a47b7a5dafcab0f3a662414ba6cbbc7eb280d478.1613591341.git.lagarcia@br.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 9f3b3f1a-651e-4740-9daf-1d45ea48eba1
X-Ovh-Tracer-Id: 2701878302335670566
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeehgdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhgrghgrrhgtihgrsegsrhdrihgsmhdrtghomh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=groug@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: farosas@br.ibm.com, Leonardo Garcia <lagarcia@br.ibm.com>,
 qemu-devel@nongnu.org, stefanha@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Leo,

Please use my personal groug@kaod.org address for upstream matters.

On Wed, 17 Feb 2021 16:55:12 -0300
lagarcia@linux.ibm.com wrote:

> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Currently, as IOMMU is not supported, if a user mistakenly set it and
> tries to mount the vhost-user filesystem (or use any other vhost-user
> based device) inside the guest, whenever the user tries to access the
> device, the system will hang forever (because virtiofsd will not be
> running anymore).
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> ---
>  hw/virtio/vhost-user-fs.c | 5 +++++
>  hw/virtio/vhost-user.c    | 7 +++++++
>  hw/virtio/vhost.c         | 1 -
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index ac4fc34b36..059b0d2ef9 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -222,6 +222,11 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
>      /* 1 high prio queue, plus the number configured */
>      fs->vhost_dev.nvqs = 1 + fs->conf.num_request_queues;
>      fs->vhost_dev.vqs = g_new0(struct vhost_virtqueue, fs->vhost_dev.nvqs);
> +    /*
> +     * vhost_user_backend_init does additional checks if VirtIODevice is defined
> +     * in vhost_dev
> +     */
> +    fs->vhost_dev.vdev = vdev;

This looks a bit like a software boundary violation to me.

Only places where ->vdev is modified are all in hw/vhost/vhost.c :
- vhost_dev_init() = NULL
- vhost_dev_start() = vdev
- vhost_dev_stop() = NULL
- vhost_dev_prepare_inflight() = vdev

The last one is interesting because it seems to be doing something
vaguely similar to what you're trying to achieve, i.e. setting ->vdev
before vhost_dev_start() is called for some reason.

commit 1b0063b3048af65dfaae6422a572c87db8575a92
Author: Jin Yu <jin.yu@intel.com>
Date:   Tue Nov 3 20:36:17 2020 +0800

    vhost-blk: set features before setting inflight feature

>      ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
>                           VHOST_BACKEND_TYPE_USER, 0);
>      if (ret < 0) {
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 2fdd5daf74..6ab760364b 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1849,6 +1849,13 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
>              }
>          }
>  
> +        if ((dev->vdev != NULL) &&
> +            virtio_host_has_feature(dev->vdev, VIRTIO_F_IOMMU_PLATFORM) &&
> +            !(features & (1ULL << VIRTIO_F_IOMMU_PLATFORM))) {
> +            error_report("IOMMU is currently not supported with vhost-user");
> +            return -1;
> +        }
> +
>          if (virtio_has_feature(features, VIRTIO_F_IOMMU_PLATFORM) &&
>                  !(virtio_has_feature(dev->protocol_features,
>                      VHOST_USER_PROTOCOL_F_SLAVE_REQ) &&
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 6e17d631f7..78e58d2148 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1293,7 +1293,6 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
>      int i, r, n_initialized_vqs = 0;
>      Error *local_err = NULL;
>  
> -    hdev->vdev = NULL;

With this change, vhost_dev_init() no longer offers the guarantee
that ->vdev is valid, which might cause problems for any device
that doesn't set ->vdev itself like this patch does for vhost-user-fs.

I suggest you to turn vhost_dev_init() into a vhost_dev_init_vdev()
with an extra vdev argument and use it for all vhost-user devices.
Introduce a vhost_dev_init() inline that does vhost_dev_init_vdev(NULL)
and call it everywhere else.

>      hdev->migration_blocker = NULL;
>  
>      r = vhost_set_backend_type(hdev, backend_type);


