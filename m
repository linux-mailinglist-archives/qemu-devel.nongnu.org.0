Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80851327CCD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:07:08 +0100 (CET)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGgOE-0005DA-08
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGgNG-0004np-VQ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:06:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGgNC-0003cQ-Jo
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614596757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VlXT4GC4LfFtUWHXIWHafJlmUzt1fm7Kh9u2Hbe2skY=;
 b=DmfaGsY42IPZ6qbhCPW4/nRIHnZR/im6u+ZrwtAqKNjW+6gyoAzS8dulof3DeInlHwxKFz
 VPet9nkH/VG6SmW1tHTHiGGinaMKcE3vLi9ndQ9RZ7R8SxSJEWaVEsdHvThbOqDD1wjhdJ
 YF40i6T2d6UYCb/ZoR5JUp2pifGA3N4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-gNTTBiTZOo6s7S97dre9ew-1; Mon, 01 Mar 2021 06:05:50 -0500
X-MC-Unique: gNTTBiTZOo6s7S97dre9ew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC2A41020C20;
 Mon,  1 Mar 2021 11:05:47 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC16B6EF59;
 Mon,  1 Mar 2021 11:05:43 +0000 (UTC)
Date: Mon, 1 Mar 2021 11:05:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [virtio-dev] [VHOST USER SPEC PATCH] vhost-user.rst: add
 clarifying language about protocol negotiation
Message-ID: <YDzKhnQa+LS01yTN@stefanha-x1.localdomain>
References: <20210226111619.21178-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210226111619.21178-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZFAzcjAen6Ge0xWX"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: virtio-dev@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>,
 viresh.kumar@linaro.org, qemu-devel@nongnu.org, rust-vmm@lists.opendev.org,
 Jiang Liu <gerry@linux.alibaba.com>, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ZFAzcjAen6Ge0xWX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 11:16:19AM +0000, Alex Benn=E9e wrote:
> In practice the protocol negotiation between vhost master and slave
> occurs before the final feature negotiation between backend and
> frontend. This has lead to an inconsistency between the rust-vmm vhost
> implementation and the libvhost-user library in their approaches to
> checking if all the requirements for REPLY_ACK processing were met.
> As this is purely a function of the protocol negotiation and not of
> interest to the frontend lets make the language clearer about the
> requirements for a successfully negotiated protocol feature.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Cc: Jiang Liu <gerry@linux.alibaba.com>
> ---
>  docs/interop/vhost-user.rst | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

I had difficulty understanding this change and its purpose. I think it's
emphasizing what the spec already says: VHOST_USER_SET_PROTOCOL_FEATURES
can be sent after VHOST_USER_F_PROTOCOL_FEATURES was reported by
VHOST_USER_GET_FEATURES.

BTW Paolo has just sent a patch here to use the terms "frontend" and
"backend" with different meanings from how you are using them:
https://lists.nongnu.org/archive/html/qemu-devel/2021-02/msg08347.html

> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index d6085f7045..3ac221a8c7 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -301,12 +301,22 @@ If *slave* detects some error such as incompatible =
features, it may also
>  close the connection. This should only happen in exceptional circumstanc=
es.
> =20
>  Any protocol extensions are gated by protocol feature bits, which
> -allows full backwards compatibility on both master and slave.  As
> -older slaves don't support negotiating protocol features, a feature
> +allows full backwards compatibility on both master and slave. As older
> +slaves don't support negotiating protocol features, a device feature
>  bit was dedicated for this purpose::
> =20
>    #define VHOST_USER_F_PROTOCOL_FEATURES 30
> =20
> +However as the protocol negotiation something that only occurs between

Missing "is". Shortening the sentence fixes that without losing clarity:
s/something that/negotiation/

> +parts of the backend implementation it is permissible to for the master

"vhost-user device backend" is often used to refer to the slave (to
avoid saying the word "slave") but "backend" is being used in a
different sense here. That is confusing.

> +to mask the feature bit from the guest.

I think this sentence effectively says "the master MAY mask the
VHOST_USER_F_PROTOCOL_FEATURES bit from the VIRTIO feature bits". That
is not really accurate since VIRTIO devices do not advertise this
feature bit and so it can never be negotiated through the VIRTIO feature
negotiation process.

How about referring to the details from the VIRTIO 1.1 specification
instead. Something like this:

  Note that VHOST_USER_F_PROTOCOL_FEATURES is the UNUSED (30) feature
  bit defined in `VIRTIO 1.1 6.3 Legacy Interface: Reserved Feature Bits
  <https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.htm=
l#x1-4130003>`_.
  VIRTIO devices do not advertise this feature bit and therefore VIRTIO
  drivers cannot negotiate it.

  This reserved feature bit was reused by the vhost-user protocol to add
  vhost-user protocol feature negotiation in a backwards compatible
  fashion. Old vhost-user master and slave implementations continue to
  work even though they are not aware of vhost-user protocol feature
  negotiation.

> As noted for the
> +``VHOST_USER_GET_PROTOCOL_FEATURES`` and
> +``VHOST_USER_SET_PROTOCOL_FEATURES`` messages this occurs before a
> +final ``VHOST_USER_SET_FEATURES`` comes from the guest.

I couldn't find any place where vhost-user.rst states that
VHOST_USER_SET_PROTOCOL_FEATURES has to come before
VHOST_USER_SET_FEATURES?

The only order I found was:

1. VHOST_USER_GET_FEATURES to determine whether protocol features are
   supported.
2. VHOST_USER_GET_PROTOCOL_FEATURES to fetch available protocol feature bit=
s.
3. VHOST_USER_SET_PROTOCOL_FEATURES to set protocol feature bits.
4. Using functionality that depends on enabled protocol feature bits.

Is the purpose of this sentence to add a new requirement to the spec
that "VHOST_USER_SET_PROTOCOL_FEATURES MUST be sent before
VHOST_USER_SET_FEATURES"?

> So the
> +enabling of protocol features need only require the advertising of the
> +feature by the slave and the successful get/set protocol features
> +sequence.

"the feature" =3D=3D VHOST_USER_F_PROTOCOL_FEATURES?

Stefan

--ZFAzcjAen6Ge0xWX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA8yoYACgkQnKSrs4Gr
c8jHNgf9G++QNiXTC4ElGB7jnVfoVd6kvc3+0LQk3QMxHgPfc8aSG97sm3RIhhiY
dnYzgBAA7KRy1NEQoPRsi16U9/EQX7gW2yJOeE7luyJo2RXXJ0/egoeGFn4Ehkln
cO0r7QL4a7ZJ65weuvkJo1cuQ6AVMr3WPvDQ/A+x4/84+GqZnpwGNFWQ2NeUvD00
ALnrWqvlaO9jlcFeLTU6oRGgAF21vw5KBxNY1/zo1tobxMxH9U13Yi5UxKYkeuI1
M1RRWj47jwRIfljyqJpYgdzFDGK0c3eqP5A0zf5M7RpTuLSXkLh3iUhKf0KUUFKL
UZLVkO43FKceEZxX33T4WjQyvkP+ZA==
=ExD2
-----END PGP SIGNATURE-----

--ZFAzcjAen6Ge0xWX--


