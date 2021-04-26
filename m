Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D3236B569
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 17:08:07 +0200 (CEST)
Received: from localhost ([::1]:51242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb2qE-0005fm-Ev
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 11:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lb2oN-0004f4-3x
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lb2oD-0008CY-4j
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619449554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IOO0ZVAYiK3cMRUh90h6lZCuu3Dbh5EDWWdXk2pgj2o=;
 b=fL1K/ZuLWMmT3PEUVLY2ekgVi1sFmDSsBtmJiSGhLjnQdezwrIbP8CROKao3JyeN/px7+k
 GbUUc/PU5ZpGmhDzsiJH8g/ASGjXRMdxZsc7g5dHOaJgodWFOBTjTQVxymxUZ/64f0f+9c
 epd4M7OWin53MrcFQaDhEORIdrrVn3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-Nos9RS4_MI-uuWmjqvdwHg-1; Mon, 26 Apr 2021 11:05:50 -0400
X-MC-Unique: Nos9RS4_MI-uuWmjqvdwHg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF73D802B5B;
 Mon, 26 Apr 2021 15:05:48 +0000 (UTC)
Received: from localhost (ovpn-114-158.ams2.redhat.com [10.36.114.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68CF760243;
 Mon, 26 Apr 2021 15:05:42 +0000 (UTC)
Date: Mon, 26 Apr 2021 16:05:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 3/3] vhost-vdpa-blk: Introduce vhost-vdpa-blk host device
Message-ID: <YIbWxUaoP3yvad2t@stefanha-x1.localdomain>
References: <20210408101252.552-1-xieyongji@bytedance.com>
 <20210408101252.552-4-xieyongji@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210408101252.552-4-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Er6GaBYzTMI95OPB"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, raphael.norwitz@nutanix.com, lingshan.zhu@intel.com,
 mreitz@redhat.com, changpeng.liu@intel.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Er6GaBYzTMI95OPB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 08, 2021 at 06:12:52PM +0800, Xie Yongji wrote:
> +static const int vdpa_feature_bits[] = {
> +    VIRTIO_BLK_F_SIZE_MAX,
> +    VIRTIO_BLK_F_SEG_MAX,
> +    VIRTIO_BLK_F_GEOMETRY,
> +    VIRTIO_BLK_F_BLK_SIZE,
> +    VIRTIO_BLK_F_TOPOLOGY,
> +    VIRTIO_BLK_F_MQ,
> +    VIRTIO_BLK_F_RO,
> +    VIRTIO_BLK_F_FLUSH,
> +    VIRTIO_BLK_F_CONFIG_WCE,
> +    VIRTIO_BLK_F_DISCARD,
> +    VIRTIO_BLK_F_WRITE_ZEROES,
> +    VIRTIO_F_VERSION_1,
> +    VIRTIO_RING_F_INDIRECT_DESC,
> +    VIRTIO_RING_F_EVENT_IDX,
> +    VIRTIO_F_NOTIFY_ON_EMPTY,
> +    VHOST_INVALID_FEATURE_BIT
> +};

Please add VIRTIO_F_RING_PACKED so it can be implemented in vDPA in the
future without changes to the QEMU vhost-vdpa-blk.c code.

> +static void vhost_vdpa_blk_device_realize(DeviceState *dev, Error **errp)
> +{
> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> +    VHostVdpaBlk *s = VHOST_VDPA_BLK(vdev);
> +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
> +    Error *err = NULL;
> +    int ret;
> +
> +    s->vdpa.device_fd = qemu_open_old(s->vdpa_dev, O_RDWR);
> +    if (s->vdpa.device_fd == -1) {
> +        error_setg(errp, "vhost-vdpa-blk: open %s failed: %s",
> +                   s->vdpa_dev, strerror(errno));
> +        return;
> +    }
> +
> +    vhost_blk_common_realize(vbc, vhost_vdpa_blk_handle_output, &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        goto blk_err;
> +    }
> +
> +    vbc->vhost_vqs = g_new0(struct vhost_virtqueue, vbc->num_queues);

This is already done by vhost_blk_common_realize(). The old pointer is
overwritten and leaked here.

> +static const VMStateDescription vmstate_vhost_vdpa_blk = {
> +    .name = "vhost-vdpa-blk",
> +    .minimum_version_id = 1,
> +    .version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_VIRTIO_DEVICE,
> +        VMSTATE_END_OF_LIST()
> +    },
> +};

vdpa-blk does not support live migration yet. Please remove this.

Does hw/virtio/vhost.c should automatically register a migration
blocker? If not, please register one.

> +#define TYPE_VHOST_VDPA_BLK "vhost-vdpa-blk"

At this stage vdpa-blk is still very new and in development. I suggest
naming it x-vhost-vdpa-blk so that incompatible changes can still be
made to the command-line/APIs. "x-" can be removed later when the
feature has matured.

--Er6GaBYzTMI95OPB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCG1sUACgkQnKSrs4Gr
c8hQBwf8Cff1ik5+1BTl7EYtdqR4HEUFxNDXUq0D/Y/7dM1hdY3f1vngx7XDMSpG
onLJH9UTLYHMgipLx+6iXQW+s+rhk0BdnBmPROW4UvoF68QzNZqQbPl3xwn7ywoy
w6+6jXetsgVIXkjfwjWnZ3GB97gMQgL2KbCJIhv961bGzvwWE42pmo8f+9tm51iE
my+YyCDwAM+ZDUSJBWR6IedQpfqZD2DG2Sh6PGgUB+KNhGY08FzDPCmR20r7yE78
ypGORT5HeWh/T0KvVy5cc9LhlKaipmYbcgf78xQdYTmzR4uloVpjQHqTAUByJEKl
X3CVAttqJMMjSAOEjjga1Qmn+3Kbwg==
=JUrl
-----END PGP SIGNATURE-----

--Er6GaBYzTMI95OPB--


