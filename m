Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186F9327BCD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 11:18:38 +0100 (CET)
Received: from localhost ([::1]:35544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGfdN-0008GI-3i
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 05:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGfbW-0007V1-2B
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:16:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGfbU-0007c8-2X
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:16:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614593797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CXEIb9FYbxLGE3ZXGdix67IcBsKCNrdxfv9HYVgJc8w=;
 b=DBh66kDQAGOaXiOrlOjSpeEAZym59hLdxWJGU1s6W9qQ+4CzggLPwaRdxL7sKnShf1SZYl
 7AMMw0pZewzlh7HOaH3FHJUQBIzuMViBRPaPabjEazVnPy0/JdyaxULTd+zbPKEcplg5Lf
 wafOVPgiHTg0f24DlTt6W4YUfuLQQkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-PrjAD7r8NPOOo0IBGNiNwg-1; Mon, 01 Mar 2021 05:16:35 -0500
X-MC-Unique: PrjAD7r8NPOOo0IBGNiNwg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B0301868418;
 Mon,  1 Mar 2021 10:16:34 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E164518A60;
 Mon,  1 Mar 2021 10:16:33 +0000 (UTC)
Date: Mon, 1 Mar 2021 10:16:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/3] docs: vhost-user: rewrite section on ring state
 machine
Message-ID: <YDy/ABOolQwqqFOp@stefanha-x1.localdomain>
References: <20210226143413.188046-1-pbonzini@redhat.com>
 <20210226143413.188046-3-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210226143413.188046-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3fI7rheKCQXRdJer"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: mst@redhat.com, jag.raman@oracle.com, qemu-devel@nongnu.org,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3fI7rheKCQXRdJer
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 09:34:12AM -0500, Paolo Bonzini wrote:
> This section is using the word "back-end" to refer to the
> "slave's back-end", and talking about the "client" for
> what the rest of the document calls the "slave".
>=20
> Rework it to free the use of the term "back-end", which in
> the next patch will replace "slave".
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/interop/vhost-user.rst | 46 +++++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 25 deletions(-)
>=20
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 6bbc092958..028ff98eac 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -307,40 +307,36 @@ bit was dedicated for this purpose::
> =20
>    #define VHOST_USER_F_PROTOCOL_FEATURES 30
> =20
> -Starting and stopping rings
> ----------------------------
> +Ring states
> +-----------
> =20
> -Client must only process each ring when it is started.
> +Rings can be in one of three states:
> =20
> -Client must only pass data between the ring and the backend, when the
> -ring is enabled.
> +* stopped: the slave must not process the ring at all.
> =20
> -If ring is started but disabled, client must process the ring without
> -talking to the backend.
> +* started but disabled: the slave must process the ring without
> +  causing any side effects.  For example, for a networking device,
> +  in the disabled state the slave must not supply any new RX packets,
> +  but must process and discard any TX packets.
> =20
> -For example, for a networking device, in the disabled state client
> -must not supply any new RX packets, but must process and discard any
> -TX packets.
> +* started and enabled.
> =20
> -If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
> -ring is initialized in an enabled state.
> +Each ring is initialized in a stopped state.  The slave must start
> +ring upon receiving a kick (that is, detecting that file descriptor is

s/ring/the ring/

> +readable) on the descriptor specified by ``VHOST_USER_SET_VRING_KICK``
> +or receiving the in-band message ``VHOST_USER_VRING_KICK`` if negotiated=
,
> +and stop ring upon receiving ``VHOST_USER_GET_VRING_BASE``.

s/ring/the ring/

> =20
> -If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
> -initialized in a disabled state. Client must not pass data to/from the
> -backend until ring is enabled by ``VHOST_USER_SET_VRING_ENABLE`` with
> -parameter 1, or after it has been disabled by
> -``VHOST_USER_SET_VRING_ENABLE`` with parameter 0.
> +Rings can be enabled or disabled by ``VHOST_USER_SET_VRING_ENABLE``.
> =20
> -Each ring is initialized in a stopped state, client must not process
> -it until ring is started, or after it has been stopped.
> +If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
> +ring starts directly in the enabled state.

"starts" can be confused with the started ring state but is used to mean
"initialized" above. The following is clearer:
"ring is initialized to the stopped but enabled state"

> =20
> -Client must start ring upon receiving a kick (that is, detecting that
> -file descriptor is readable) on the descriptor specified by
> -``VHOST_USER_SET_VRING_KICK`` or receiving the in-band message
> -``VHOST_USER_VRING_KICK`` if negotiated, and stop ring upon receiving
> -``VHOST_USER_GET_VRING_BASE``.
> +If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
> +initialized in a disabled state and is enabled by
> +``VHOST_USER_SET_VRING_ENABLE`` with parameter 1.
> =20
> -While processing the rings (whether they are enabled or not), client
> +While processing the rings (whether they are enabled or not), the slave
>  must support changing some configuration aspects on the fly.
> =20
>  Multiple queue support
> --=20
> 2.26.2
>=20
>=20

--3fI7rheKCQXRdJer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA8vwAACgkQnKSrs4Gr
c8gH2gf+K+/sGHMX0Nw5xtq51pwjzZ5hWvcrCwnf0SZ/doLvZLWWNvvxycsoOuGB
zviWeoYSHAVRcONedecRyDwgXE0Pb/t4avkBwB/wP7wCK5fjEPpbxHPEfChu3JXX
2DjUHlcx5Jaoy952+fgmy7x5fqhtAXX7o6Gw696L7BfjZi3WL7GA1fiOSxLRoiKt
2pRqk4XnuWQELyAKrTgeO4cOEkeE8aT7B8eTfF03PL0mVWXnBMUMQy+CL3QYVMfN
TKXYz5xw3G4xl9AnAAmDqvGiek3ZyGHc4+wz1d6KD8T8JsGMac1klp04JVnDaVWy
KZ5CDzqY2Js7zCz24Cg3NETHgQuDOw==
=v8xu
-----END PGP SIGNATURE-----

--3fI7rheKCQXRdJer--


