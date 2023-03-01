Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B186A7029
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:48:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOgB-00081j-Jf; Wed, 01 Mar 2023 10:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXOg9-00081b-UE
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:47:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXOg7-0006ed-MG
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677685658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ZcyCRC5iYwgEQEDm61qvHfK7mK/edmDx0UhuNcF9whk=;
 b=YO0FM82JDm/hTXU6irxEv6qB0tybSS1nQd6bUIPIxBYDv4jqimif5W3IC8vW1uewLR9VQB
 5eBDWj1XwGjIq9/1FZ8MLIV+hi0G9Z02P0Okfn6vxOnvImqbITBz4CLc2/MJq48kfPo+La
 hWFFTFBpQFse9nwV9cpSE81tDeIgT4Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-189UUaEtMpOJYaipxaj5jQ-1; Wed, 01 Mar 2023 10:47:35 -0500
X-MC-Unique: 189UUaEtMpOJYaipxaj5jQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08774800B23;
 Wed,  1 Mar 2023 15:47:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FE412166B2A;
 Wed,  1 Mar 2023 15:47:32 +0000 (UTC)
Date: Wed, 1 Mar 2023 10:47:28 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [virtio-dev] [RFC QEMU] docs: vhost-user: Add custom memory
 mapping support
Message-ID: <Y/9zkDAS4odz93GM@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="REA+6g3fXhuAA0Hw"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--REA+6g3fXhuAA0Hw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Resend - for some reason my email didn't make it out.

----- Forwarded message from Stefan Hajnoczi <stefanha@redhat.com> -----

Date: Tue, 21 Feb 2023 10:17:01 -0500
=46rom: Stefan Hajnoczi <stefanha@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org, "Michael S. Tsi=
rkin" <mst@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Alex =
Benn=E9e <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org, Oleksandr Tyshchenko <olekstysh@gmail.com=
>, xen-devel@lists.xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, Juer=
gen Gross <jgross@suse.com>, Sebastien Boeuf
	<sebastien.boeuf@intel.com>, Liu Jiang <gerry@linux.alibaba.com>, Mathieu =
Poirier <mathieu.poirier@linaro.org>
Subject: Re: [virtio-dev] [RFC QEMU] docs: vhost-user: Add custom memory ma=
pping support
Message-ID: <Y/TgbZLY894p4a1S@fedora>

On Tue, Feb 21, 2023 at 03:20:41PM +0530, Viresh Kumar wrote:
> The current model of memory mapping at the back-end works fine with
> Qemu, where a standard call to mmap() for the respective file
> descriptor, passed from front-end, is generally all we need to do before
> the front-end can start accessing the guest memory.
>=20
> There are other complex cases though, where we need more information at
> the backend and need to do more than just an mmap() call. For example,
> Xen, a type-1 hypervisor, currently supports memory mapping via two
> different methods, foreign-mapping (via /dev/privcmd) and grant-dev (via
> /dev/gntdev). In both these cases, the back-end needs to call mmap()
> followed by an ioctl() (or vice-versa), and need to pass extra
> information via the ioctl(), like the Xen domain-id of the guest whose
> memory we are trying to map.
>=20
> Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_CUSTOM_MMAP', which
> lets the back-end know about the additional memory mapping requirements.
> When this feature is negotiated, the front-end can send the
> 'VHOST_USER_CUSTOM_MMAP' message type to provide the additional
> information to the back-end.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  docs/interop/vhost-user.rst | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

The alternative to an in-band approach is to configure these details
out-of-band. For example, via command-line options to the vhost-user
back-end:

  $ my-xen-device --mapping-type=3Dforeign-mapping --domain-id=3D123

I was thinking about both approaches and don't see an obvious reason to
choose one or the other. What do you think?

> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 3f18ab424eb0..f2b1d705593a 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -258,6 +258,23 @@ Inflight description
> =20
>  :queue size: a 16-bit size of virtqueues
> =20
> +Custom mmap description
> +^^^^^^^^^^^^^^^^^^^^^^^
> +
> ++-------+-------+
> +| flags | value |
> ++-------+-------+
> +
> +:flags: 64-bit bit field
> +
> +- Bit 0 is Xen foreign memory access flag - needs Xen foreign memory map=
ping.
> +- Bit 1 is Xen grant memory access flag - needs Xen grant memory mapping.
> +
> +:value: a 64-bit hypervisor specific value.
> +
> +- For Xen foreign or grant memory access, this is set with guest's xen d=
omain
> +  id.

This is highly Xen-specific. How about naming the feature XEN_MMAP
instead of CUSTOM_MMAP? If someone needs to add other mmap data later,
they should define their own struct instead of trying to squeeze into
the same fields as Xen.

There is an assumption in this design that a single
VHOST_USER_CUSTOM_MMAP message provides the information necessary for
all mmaps. Are you sure the limitation that every mmap belongs to the
same domain will be workable in the future?

> +
>  C structure
>  -----------
> =20
> @@ -867,6 +884,7 @@ Protocol features
>    #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
>    #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
>    #define VHOST_USER_PROTOCOL_F_STATUS               16
> +  #define VHOST_USER_PROTOCOL_F_CUSTOM_MMAP          17
> =20
>  Front-end message types
>  -----------------------
> @@ -1422,6 +1440,20 @@ Front-end message types
>    query the back-end for its device status as defined in the Virtio
>    specification.
> =20
> +``VHOST_USER_CUSTOM_MMAP``

Most vhost-user protocol messages have a verb like
get/set/close/add/listen/etc. I suggest renaming this to
VHOST_USER_SET_XEN_MMAP_INFO.

> +  :id: 41
> +  :equivalent ioctl: N/A
> +  :request payload: Custom mmap description
> +  :reply payload: N/A
> +
> +  When the ``VHOST_USER_PROTOCOL_F_CUSTOM_MMAP`` protocol feature has be=
en
> +  successfully negotiated, this message is submitted by the front-end to
> +  notify the back-end of the special memory mapping requirements, that t=
he
> +  back-end needs to take care of, while mapping any memory regions sent
> +  over by the front-end. The front-end must send this message before
> +  any memory-regions are sent to the back-end via ``VHOST_USER_SET_MEM_T=
ABLE``
> +  or ``VHOST_USER_ADD_MEM_REG`` message types.
> +
> =20
>  Back-end message types
>  ----------------------
> --=20
> 2.31.1.272.g89b43f80a514
>=20
>=20
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>=20



----- End forwarded message -----

--REA+6g3fXhuAA0Hw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmP/c5AACgkQnKSrs4Gr
c8j7xQgAvP7ofHadadItgG48Mx2Y5ZxqGbcYrkWl9Z3LFplSdvSL57D89nu+U3I6
YHEQTjc/aXyZHAQJfeQbTMfjAcLzsaLD5dGpmypZN6nwMwMdjkNDIVMgJiac2hau
cqRAcrZcmGYvODag1LKvbofZvYcHspHO/IGF6BMbpFV98d9gpVJFS5NaE+I67Em7
6abQUP4VmzhyO9vqAYxtCjTo+Wt5mCOjHXCBbHFrCS1SeknZDReUQcoE9fmZZjOq
5wxk221ccSUwRM+bRvugkEKi0jzpc9TFJt7sR+hcgHPatPBi/KeLjojHBrRInnfx
CDcx43fMekxlUmcVrsH0AYySsoS0wg==
=zYpW
-----END PGP SIGNATURE-----

--REA+6g3fXhuAA0Hw--


