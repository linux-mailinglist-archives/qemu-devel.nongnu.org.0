Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C488D3989F1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 14:45:41 +0200 (CEST)
Received: from localhost ([::1]:41822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQFg-0005u4-Q1
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 08:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loQEa-00057T-17
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:44:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loQEX-0003C9-97
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622637868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YqxIBHSd/yhFYs2PQLePUkLXz6Koj5qrDuU5lvKwkNQ=;
 b=HFHgRr0lzeCXttuZuCA3jNCan/urEq0ZUn2ei3bekCkM4lLhMTEY7OY/q+FHElAmC7/hKg
 HVIgjbYlRhO+PaS52nCmYfEQtRgTgfGBQW9VP74KAfgv0jDSTT0jO/nfhgcW9+Eq/5HF0D
 q3Fz/FHAnMmdaUPS69OTlwZIXea8L9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-bwEZrR5JNz6WUbOP-y0ivQ-1; Wed, 02 Jun 2021 08:44:26 -0400
X-MC-Unique: bwEZrR5JNz6WUbOP-y0ivQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A8B2192203D;
 Wed,  2 Jun 2021 12:44:15 +0000 (UTC)
Received: from localhost (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC6242BFEC;
 Wed,  2 Jun 2021 12:44:14 +0000 (UTC)
Date: Wed, 2 Jun 2021 13:44:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 12/12] hw/virtio: Display error if vring flag field
 is not aligned
Message-ID: <YLd9Hb34kEU8wLN0@stefanha-x1.localdomain>
References: <20210520110919.2483190-1-philmd@redhat.com>
 <20210520110919.2483190-13-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210520110919.2483190-13-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O+zbv1wi6cjdcQWJ"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--O+zbv1wi6cjdcQWJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 01:09:19PM +0200, Philippe Mathieu-Daud=E9 wrote:
>  {
>      VRingMemoryRegionCaches *caches =3D vring_get_region_caches(vq);
>      hwaddr pa =3D offsetof(VRingAvail, flags);
> +    MemTxAttrs attrs =3D { .aligned =3D 1 };
> +    MemTxResult res;
> =20
>      if (!caches) {
>          *val =3D 0;
>          return true;
>      }
> =20
> -    *val =3D virtio_lduw_phys_cached_with_attrs(vq->vdev, &caches->avail=
, pa);
> +    *val =3D virtio_lduw_phys_cached_with_attrs(vq->vdev, &caches->avail=
,
> +                                              pa, attrs, &res);
> +    if (res =3D=3D MEMTX_UNALIGNED_ERROR) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "virtio: vring flag address 0x%" HWADDR_PRIX " "
> +                      "is not aligned\n", pa);
> +        return false;
> +    }

Performance-critical code paths could validate the cache and offset
ahead of time to avoid taking the more expensive code path that checks
MemTxAttrs.

The guest driver configures the vring addresses by writing to
virtio-pci/virtio-mmio registers. The alignment check can be performed
at that time (while/before creating the cache).

Stefan

--O+zbv1wi6cjdcQWJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC3fR0ACgkQnKSrs4Gr
c8gWWQf9Fsa1rNa/w7usmC6TmQdwSbiWTWeTtq1OnBSsEsVbZTTccqOG8wSk7AH0
gNN33+PqepILoOKd+Hd6fbHBb2fmGcl/iGGX86/SaQwjguJojMLfM5Eq7jJBn1PF
ZB8pNeGquM3emT+IWXHkMGLGyBzq7ryEcG5XJnyaQ1AA5RgUGr/qtilxqL92hRvw
mZj70OlRQ5i/QqABqcWZwXUm/VpZ1D39pygfSfb/5cXYgufflZZFKwkWvUjjK6rY
RzZtLh7JLvsG6MWO3LUrkk1tDHXt0J60PHuc1RDgvHEZNLKBo9ofnsXYElHtNu2f
jr/ZH7u0BvUVDSJDOicNsGH4zMIp1w==
=D5qC
-----END PGP SIGNATURE-----

--O+zbv1wi6cjdcQWJ--


