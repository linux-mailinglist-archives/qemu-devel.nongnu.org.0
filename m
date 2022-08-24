Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D865A0138
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:17:10 +0200 (CEST)
Received: from localhost ([::1]:54692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuw9-000810-Jo
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQusy-0004yV-7R
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:13:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQusu-00026K-He
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661364828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FepvHq8i6Ug+Vess3XzF89TlX4AMMQ3ZlxD0p4rwuXE=;
 b=UO6bjLADeKvitH4QKTaO5u1xKgqVvpnUihvPvBSiFzeU2E18+Nu4yKp09NwJNoDb8T62pK
 t5anFan0EwH+CaG7b3uG/U2oIlQDe54C7CwnWG+YdSPOE3ZvZb21gDo9zXGMSDs+FAO2S7
 KglvsubL7qo7SPFi0+jXIdM/xlhW52c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-ja6WA4cfNSS8DN9fSYTNBw-1; Wed, 24 Aug 2022 14:13:44 -0400
X-MC-Unique: ja6WA4cfNSS8DN9fSYTNBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13D88811E76;
 Wed, 24 Aug 2022 18:13:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FA5140CF8EF;
 Wed, 24 Aug 2022 18:13:43 +0000 (UTC)
Date: Wed, 24 Aug 2022 14:13:41 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
Cc: qemu-devel@nongnu.org, mst@redhat.com, raphael.norwitz@nutanix.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 yc-core@yandex-team.ru
Subject: Re: [PATCH v1 2/5] virtio-blk: move config space sizing code to
 virtio-blk-common
Message-ID: <YwZqVbnbIthrW5ov@fedora>
References: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
 <20220824091837.301708-3-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="68bCBKNN/uZBw4dJ"
Content-Disposition: inline
In-Reply-To: <20220824091837.301708-3-d-tatianin@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--68bCBKNN/uZBw4dJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 24, 2022 at 12:18:34PM +0300, Daniil Tatianin wrote:
> +size_t virtio_blk_common_get_config_size(uint64_t host_features)
> +{
> +    size_t config_size = MAX(VIRTIO_BLK_CFG_SIZE,
> +        virtio_feature_get_config_size(feature_sizes, host_features));
> +
> +    assert(config_size <= sizeof(struct virtio_blk_config));
> +    return config_size;
> +}

This logic is common to all VIRTIO devices and I think it can be moved
to virtio_feature_get_config_size(). Then
virtio_blk_common_get_config_size() is no longer necessary and the
generic virtio_feature_get_config_size() can be called directly.

The only virtio-blk common part would be the
virtio_feature_get_config_size() parameter struct that describes the
minimum and maximum config space size, as well as how the feature bits
affect the size:

  size = virtio_feature_get_config_size(virtio_blk_config_size_params, host_features)

where virtio_blk_config_size_params is:

  const VirtIOConfigSizeParams virtio_blk_config_size_params = {
      .min_size = offsetof(struct virtio_blk_config, max_discard_sectors),
      .max_size = sizeof(struct virtio_blk_config),
      .features = {
          {.flags = 1ULL << VIRTIO_BLK_F_DISCARD,
           .end = endof(struct virtio_blk_config, discard_sector_alignment)},
          ...,
      },
  };

Then virtio-blk-common.h just needs to define:

  extern const VirtIOConfigSizeParams virtio_blk_config_size_params;

Taking it one step further, maybe VirtioDeviceClass should include a
const VirtIOConfigSizeParams *config_size_params field so
vdev->config_size can be computed by common VIRTIO code and the devices
only need to describe the parameters.

Stefan

--68bCBKNN/uZBw4dJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMGalUACgkQnKSrs4Gr
c8iYNgf9GirpzGJFzCusF8GUCr5ceV4HQtGLrDR1WGbvXyX9WoGiHjIqaPQ7Pl/C
NOhsH7LP0GUD3kNYgr0VAMR8JoYRUkVhwpAwSmcJrzFIMGuIcHnjEFSP+7ZiCAzg
vwOMrSrxUvTxEJaXNXaJh0MHh7gtuMsfrMye5ZJtDC8LxJdoagZfQa6/Whe+OZF+
VmNMkmtVl/lzuDakoe4ByJUdY7R/77tOfZI4vvj1F8OFKMCmejso9ilXmepXpoyS
fAn9YIG/xeBC8xwFyUpgAEOKh9VSSIcXqWVcCWMsHwCi8cSXW59C7CpUtM2pKRz3
kYArR4W0YEO0eoMUbeqRAMJrJd7WvQ==
=XbRb
-----END PGP SIGNATURE-----

--68bCBKNN/uZBw4dJ--


