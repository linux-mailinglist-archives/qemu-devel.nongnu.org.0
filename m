Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045515A0161
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:32:49 +0200 (CEST)
Received: from localhost ([::1]:54978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQvBH-0005vj-Mj
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQv7J-0003Wv-IZ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:28:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQv7G-0004J2-Is
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661365717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bqlrjEpqlZZ/ehmB39PdNWM0WqXtnL/sQ95gvUoBlLw=;
 b=FnWRSAlsyEJLJDcgK6ttOURu33FutqPj57j4SVB/jF3q0rp+XBpyH+8lYKimXnre0CnyCt
 SIamAXqdEjr7EpIOwvKjX4/xF7XgrrMKwrjjsaZ6XsLUAa3bK3yvuIesMQ2CxXJDcb0gdL
 +401k/HzzXJ4vqE3vQKPLHlcbdzoSY0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-KTVLAv89PbeMFjuTOZI_dA-1; Wed, 24 Aug 2022 14:28:34 -0400
X-MC-Unique: KTVLAv89PbeMFjuTOZI_dA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0AD33C0E223;
 Wed, 24 Aug 2022 18:28:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FE8E4010D24;
 Wed, 24 Aug 2022 18:28:32 +0000 (UTC)
Date: Wed, 24 Aug 2022 14:28:31 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
Cc: qemu-devel@nongnu.org, mst@redhat.com, raphael.norwitz@nutanix.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 yc-core@yandex-team.ru
Subject: Re: [PATCH v1 5/5] vhost-user-blk: dynamically resize config space
 based on features
Message-ID: <YwZtz4z6kZMZyDRN@fedora>
References: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
 <20220824091837.301708-6-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LcuMXg1qg5b4xVPX"
Content-Disposition: inline
In-Reply-To: <20220824091837.301708-6-d-tatianin@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LcuMXg1qg5b4xVPX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 12:18:37PM +0300, Daniil Tatianin wrote:
> Make vhost-user-blk backwards compatible when migrating from older VMs
> running with modern features turned off, the same way it was done for
> virtio-blk in 20764be0421c ("virtio-blk: set config size depending on the=
 features enabled")
>=20
> It's currently impossible to migrate from an older VM with
> vhost-user-blk (with disable-legacy=3Doff) because of errors like this:
>=20
> qemu-system-x86_64: get_pci_config_device: Bad config data: i=3D0x10 read=
: 41 device: 1 cmask: ff wmask: 80 w1cmask:0
> qemu-system-x86_64: Failed to load PCIDevice:config
> qemu-system-x86_64: Failed to load virtio-blk:virtio
> qemu-system-x86_64: error while loading state for instance 0x0 of device =
'0000:00:05.0:00.0:02.0/virtio-blk'
> qemu-system-x86_64: load of migration failed: Invalid argument
>=20
> This is caused by the newer (destination) VM requiring a bigger BAR0
> alignment because it has to cover a bigger configuration space, which
> isn't actually needed since those additional config fields are not
> active (write-zeroes/discard).
>=20
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> ---
>  hw/block/vhost-user-blk.c          | 15 ++++++++-------
>  include/hw/virtio/vhost-user-blk.h |  1 +
>  2 files changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 64f3457373..d18a7a2cd4 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -23,6 +23,7 @@
>  #include "hw/qdev-core.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
> +#include "hw/virtio/virtio-blk-common.h"
>  #include "hw/virtio/vhost.h"
>  #include "hw/virtio/vhost-user-blk.h"
>  #include "hw/virtio/virtio.h"
> @@ -63,7 +64,7 @@ static void vhost_user_blk_update_config(VirtIODevice *=
vdev, uint8_t *config)
>      /* Our num_queues overrides the device backend */
>      virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
> =20
> -    memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
> +    memcpy(config, &s->blkcfg, s->config_size);

Please drop the s->config_size field introduced in this patch and use
vdev->config_len instead. When the same value is stored in multiple
places it's hard to be sure each copy remains identical and bugs can
creep in.

For example, if vdev->config_len is used consistently then it's clear
that buffer overflows and information leaks are prevented by common
code:

  uint32_t virtio_config_readb(VirtIODevice *vdev, uint32_t addr)
  {
      VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
      uint8_t val;

      if (addr + sizeof(val) > vdev->config_len) {
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
          return (uint32_t)-1;
      }

      k->get_config(vdev, vdev->config);

It's safe because vdev->config is g_malloc0(vdev->config_len).

Buf if I see s->config_size, I don't really know whether it's safe and I
need to audit the code to be sure.

--LcuMXg1qg5b4xVPX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMGbc4ACgkQnKSrs4Gr
c8hGVQgAwdA8PPUtuqrABWEnuRf7uiR5iJOIryGx2PEz9Y7TFWWvujR9fHkvjEmc
Bfu95jzMnzyjp4DNK4oZszkr8WhCdOcZn7G96DOPbTzt4t5xxT2Z2tkhVeD6v6dK
WzIV1uK+qRqHhp5eT0m770UvKKLcLCnzoO/doGjiMwpJ5XC71nze3r35fBox2bDC
AF/QAavrdWoMnIEf5dHn95L26NIpfmPwGhOR9lDv+1Ko6s2aSM+oMbK5zWaCpuiP
ng0Ad/VD9dpfD6/Tsn2ClFX4JO3Gj6+oREalkgSaRu5R9JxDeV/JQ1oDEeWm4Vck
kHzo644A50w+VNAvCFadKeWQEwj0Wg==
=a/rN
-----END PGP SIGNATURE-----

--LcuMXg1qg5b4xVPX--


