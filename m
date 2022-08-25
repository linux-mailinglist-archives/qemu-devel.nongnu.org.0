Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7415A12AB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 15:48:37 +0200 (CEST)
Received: from localhost ([::1]:41630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRDDo-0002O7-0D
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 09:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oRDAy-0000eJ-P9
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:45:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oRDAt-0005DE-SC
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661435135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fjks5oLGp5FYVcWWgkhpJs9BEH0zeoAT9qQRUv/0JC0=;
 b=eY5BT/9GFGxxZyI0jSPjZeCWZOk3RO4BthEdAmxq/UfiVvJcHSMKMNLKuogF/vDfH3L7j9
 r7PnmKRX7usuk4KjBzVdpsrZGLDKsup15NuOWopJ8n54jY7W9+StC8OMC+q8L1G8RWyoCJ
 ny/jZNASPZZR2B5KG29PjJb/ERk/49A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-FwJgiZHpPyqMMhEaBqmqOg-1; Thu, 25 Aug 2022 09:45:31 -0400
X-MC-Unique: FwJgiZHpPyqMMhEaBqmqOg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14B061C006B3;
 Thu, 25 Aug 2022 13:45:31 +0000 (UTC)
Received: from localhost (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A4471121315;
 Thu, 25 Aug 2022 13:45:30 +0000 (UTC)
Date: Thu, 25 Aug 2022 09:45:28 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
Cc: qemu-devel@nongnu.org, mst@redhat.com, raphael.norwitz@nutanix.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 yc-core@yandex-team.ru
Subject: Re: [PATCH v1 2/5] virtio-blk: move config space sizing code to
 virtio-blk-common
Message-ID: <Ywd8+Dy3mmOTBVJE@fedora>
References: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
 <20220824091837.301708-3-d-tatianin@yandex-team.ru>
 <YwZqVbnbIthrW5ov@fedora>
 <e39fda2b-4660-2ecd-31f3-c0aa6d5374d7@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vU4LhDcuFQ1QnQRz"
Content-Disposition: inline
In-Reply-To: <e39fda2b-4660-2ecd-31f3-c0aa6d5374d7@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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


--vU4LhDcuFQ1QnQRz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2022 at 12:11:10AM +0300, Daniil Tatianin wrote:
>=20
>=20
> On 8/24/22 9:13 PM, Stefan Hajnoczi wrote:
> > On Wed, Aug 24, 2022 at 12:18:34PM +0300, Daniil Tatianin wrote:
> > > +size_t virtio_blk_common_get_config_size(uint64_t host_features)
> > > +{
> > > +    size_t config_size =3D MAX(VIRTIO_BLK_CFG_SIZE,
> > > +        virtio_feature_get_config_size(feature_sizes, host_features)=
);
> > > +
> > > +    assert(config_size <=3D sizeof(struct virtio_blk_config));
> > > +    return config_size;
> > > +}
> >=20
> > This logic is common to all VIRTIO devices and I think it can be moved
> > to virtio_feature_get_config_size(). Then
> > virtio_blk_common_get_config_size() is no longer necessary and the
> > generic virtio_feature_get_config_size() can be called directly.
> >=20
> > The only virtio-blk common part would be the
> > virtio_feature_get_config_size() parameter struct that describes the
> > minimum and maximum config space size, as well as how the feature bits
> > affect the size:
> >=20
> >    size =3D virtio_feature_get_config_size(virtio_blk_config_size_param=
s, host_features)
> >=20
> > where virtio_blk_config_size_params is:
> >=20
> >    const VirtIOConfigSizeParams virtio_blk_config_size_params =3D {
> >        .min_size =3D offsetof(struct virtio_blk_config, max_discard_sec=
tors),
> >        .max_size =3D sizeof(struct virtio_blk_config),
> >        .features =3D {
> >            {.flags =3D 1ULL << VIRTIO_BLK_F_DISCARD,
> >             .end =3D endof(struct virtio_blk_config, discard_sector_ali=
gnment)},
> >            ...,
> >        },
> >    };
> >=20
> > Then virtio-blk-common.h just needs to define:
> >=20
> >    extern const VirtIOConfigSizeParams virtio_blk_config_size_params;
> >=20
> > Taking it one step further, maybe VirtioDeviceClass should include a
> > const VirtIOConfigSizeParams *config_size_params field so
> > vdev->config_size can be computed by common VIRTIO code and the devices
> > only need to describe the parameters.
>=20
> I think that's a great idea! Do you think it should be done automatically=
 in
> 'virtio_init' if this field is not NULL? One problem I see with that is t=
hat
> you would have to make all virtio devices use 'parent_obj.host_features' =
for
> feature properties, which is currently far from true, but then again this=
 is
> very much opt-in. Another thing you could do is add a separate helper for
> that, which maybe defeats the purpose a little bit?

Yes, a helper is probably not necessary.

Refactoring virtio_feature_get_config_size() is enough for this patch
series. That way devices can still use their own host_features variables
as needed.

The virtio_init()/VirtioDeviceClass refactoring is probably a step too
far and I just wanted to share the idea :).

Stefan

--vU4LhDcuFQ1QnQRz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMHfPgACgkQnKSrs4Gr
c8gh/gf/WrDCFOwCgHw9IX2trbaNovs98c2iWt8zeK6knmybBZRGI1/feBoGLWfT
zg94DguYcAzIF9UEJ3BhCyXbTW5G1cWqVZOrryPzMBvFoMUOupRnNYJXOxDKpg7J
4LDN2qa87oR4QQp/2TVkmjSdwsYrHIV+mMdnwW4DwgSs2S6yx7GPhjVGiVMYtg52
tHmgTyrThcEJiqktPuxDnopaL2J+aYLM7dZ+jlUo58KNWPQqjo8xf7NxGngOscq2
8x8g0Sb8oPThHyUCjzOGq4K2+Eemecit1DI/ectuhyUI7PiwHAG0yzGGCoEanpvO
N+wDCzCf1U+0Z+UpfhZN0ZaPuTwnZQ==
=O7OR
-----END PGP SIGNATURE-----

--vU4LhDcuFQ1QnQRz--


