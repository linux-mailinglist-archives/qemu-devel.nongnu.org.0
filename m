Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31DE3FED96
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:13:47 +0200 (CEST)
Received: from localhost ([::1]:35608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLlbG-0007yX-Vb
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLlVe-0006No-Am
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:07:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLlVc-0000jA-80
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:07:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630584475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+b00/s5Ii9MqaS7cDjzK9XFyNukIrFWBTDlp9mV7m/s=;
 b=TPchobkaqoZd9pvGAAgl/p0L30FU2XnPJj/FhUM8DsbTDQmotc0fCR6UtcnBeBrZl9Doei
 xOGt6fXS182axFrZPc4oLdrVALGOuwZvY/MSKFa0RgVqdFOgaT5G+b0owrfT7i6XWwo6nh
 MW50TZYRAf7eXqEhfI8CS91WfZ6ISoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-0Fe4SqIONwGLIN2Awxk7HQ-1; Thu, 02 Sep 2021 08:07:53 -0400
X-MC-Unique: 0Fe4SqIONwGLIN2Awxk7HQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C054C835DE3
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 12:07:52 +0000 (UTC)
Received: from localhost (unknown [10.39.194.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F7C660853;
 Thu,  2 Sep 2021 12:07:48 +0000 (UTC)
Date: Thu, 2 Sep 2021 13:07:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/3] hw/virtio: Remove NULL check in
 virtio_free_region_cache()
Message-ID: <YTC+k+ol7y9YVvkh@stefanha-x1.localdomain>
References: <20210826172658.2116840-1-philmd@redhat.com>
 <20210826172658.2116840-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210826172658.2116840-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jUocXoSifpnX7O9g"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--jUocXoSifpnX7O9g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2021 at 07:26:57PM +0200, Philippe Mathieu-Daud=E9 wrote:
> virtio_free_region_cache() is called within call_rcu(),
> always with a non-NULL argument. Ensure new code keep it
> that way by replacing the NULL check by an assertion.
> Add a comment this function is called within call_rcu().
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/virtio/virtio.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index a5214bca612..3a1f6c520cb 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -133,12 +133,10 @@ struct VirtQueue
>      QLIST_ENTRY(VirtQueue) node;
>  };
> =20
> +/* Called within call_rcu().  */
>  static void virtio_free_region_cache(VRingMemoryRegionCaches *caches)
>  {
> -    if (!caches) {
> -        return;
> -    }
> -
> +    assert(caches !=3D NULL);
>      address_space_cache_destroy(&caches->desc);
>      address_space_cache_destroy(&caches->avail);
>      address_space_cache_destroy(&caches->used);

Looks like an artifact that was left in when the code was originally
introduced in commit c611c76417f52b335ecaab01c61743e3b705eb7c ("virtio:
add MemoryListener to cache ring translations"). Paolo could confirm
this.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--jUocXoSifpnX7O9g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEwvpMACgkQnKSrs4Gr
c8jlxQf/VxkT6nEvCU49e6+YRLwuvUrgxgWfTmdHaXJlVVoQxbeTa5dkT3ZOENXC
6iuA5VE1dnrBbLZqBARZLIMRBmdejycrqb9tEvKUQalYuVtYCkOYHtYoCpEFLQX6
kAEVdE2bo8cfwqdD32x+PayUnf4yY3ZjJbWUxnXha13PLMSeZavozA3GW4EHuuQu
7BVS6yaybtDY/TQNAv+mpfDPuyGllqIdbUUICQKpwwB2HRZqJrmchcQ6Omj+gBam
f30W4Pq3SLt7R8LKhG+xyDA+S8O7ru9B0FEG3SDFzIqNLESnRpD8gcDD+9pYleDN
jA8Ua5Waa25/0avT+m3KFwWjPFBXkw==
=xa0F
-----END PGP SIGNATURE-----

--jUocXoSifpnX7O9g--


