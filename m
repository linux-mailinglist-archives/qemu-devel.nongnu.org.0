Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC3F4CF539
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 10:26:12 +0100 (CET)
Received: from localhost ([::1]:51336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR9d5-0007Q7-JD
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 04:26:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nR9Ym-0005JK-Ii
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 04:21:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nR9Yj-0004nP-K5
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 04:21:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646644900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4tgm3DXtwnxQ0iledIMw0FZoLCwSjliTEZk67VuMUNw=;
 b=UCz12tgSzgMGXDQln7ZhnDFlxsVaXmWc1KmDy6K/XPUBooizOnfCHkvQq+51nxLvV6XJ2Y
 wXuhlLGnljq9gpwvtq+7hfiXJgTeeoTK6sRKPaXfvWRaEYLUXUF8rjkSrOI4qh6wdSqSOA
 KJsItUhZnfATg0tEyDuU0QlbxL3umOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-dCWadOQQM1OLENNWqsbryw-1; Mon, 07 Mar 2022 04:21:36 -0500
X-MC-Unique: dCWadOQQM1OLENNWqsbryw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98F95FC82;
 Mon,  7 Mar 2022 09:21:35 +0000 (UTC)
Received: from localhost (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DFFA7FCF1;
 Mon,  7 Mar 2022 09:21:34 +0000 (UTC)
Date: Mon, 7 Mar 2022 09:21:20 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: What is the correct way to handle the VirtIO config space in
 vhost-user?
Message-ID: <YiXOkOvu7W18MHFZ@stefanha-x1.localdomain>
References: <87ee3q3mos.fsf@linaro.org> <87a6ee3l5e.fsf@linaro.org>
 <YhzWMMLTZY1e24Uh@stefanha-x1.localdomain>
 <87mtiblzsc.fsf@linaro.org>
 <Yh0FV+0SfdPugRRX@stefanha-x1.localdomain>
 <87tucdhd5w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eVLyCxlSit0pJQo7"
Content-Disposition: inline
In-Reply-To: <87tucdhd5w.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--eVLyCxlSit0pJQo7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2022 at 04:49:30PM +0000, Alex Benn=E9e wrote:
>=20
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > [[PGP Signed Part:Undecided]]
> > On Mon, Feb 28, 2022 at 04:16:43PM +0000, Alex Benn=E9e wrote:
> >>=20
> >> Stefan Hajnoczi <stefanha@redhat.com> writes:
> >>=20
> >> > [[PGP Signed Part:Undecided]]
> >> > On Fri, Feb 25, 2022 at 05:32:43PM +0000, Alex Benn=E9e wrote:
> >> >>=20
> >> >> [Apologies to CC list for repost due to fat fingering the mailing l=
ist address]
> >> >>=20
> >> <snip>
> >> >>=20
> >> >> (aside: this continues my QOM confusion about when things should be=
 in a
> >> >> class or instance init, up until this point I hadn't needed it in my
> >> >> stub).
> >> >
> >> > Class init is a one-time per-class initializer function. It is mostly
> >> > used for setting up callbacks/overridden methods from the base class.
> >> >
> >> > Instance init is like an object constructor in object-oriented
> >> > programming.
> >>=20
> >> I phrased my statement poorly. What I meant to say is I sometimes find
> >> QEMUs approach to using class over instance initialisation inconsisten=
t.
> >> I think I understand the "policy" as use class init until there is a
> >> case where you can't (e.g. having individual control of each instance =
of
> >> a device).
> >>=20
> >> > This is not a .get_config() method, it's a VIRTIO configuration chan=
ge
> >> > notification handler. The vhost-user-blk device server ("slave") sen=
ds
> >> > this notification to notify the driver that configuration space cont=
ents
> >> > have been updated (e.g. the disk was resized).
> >>=20
> >> So this should come in the initial vhost-user set of handshake messages
> >> if the VHOST_USER_PROTOCOL_F_CONFIG is negotiated between the master a=
nd
> >> slave? I guess without this protocol feature vhost-user can't support
> >> writeable config spaces?
> >
> > The VHOST_USER_PROTOCOL_F_CONFIG vhost-user protocol feature bit
> > enables:
> > 1. VHOST_USER_GET_CONFIG - reading configuration space
> > 2. VHOST_USER_SET_CONFIG - writing configuration space
> > 3. VHOST_USER_SLAVE_CONFIG_CHANGE_MSG - change notifications
> >
> > If the vhost-user server is supposed to participate in configuration
> > space accesses/notifications, then it needs to implement
> > VHOST_USER_PROTOCOL_F_CONFIG.
> >
> > QEMU's vhost-user-blk assumes the vhost-user server supports
> > VHOST_USER_PROTOCOL_F_CONFIG. It's an optional vhost-user protocol
> > feature but the virtio-blk device relies on configuration space
> > (otherwise QEMU's --device vhost-user-blk wouldn't know the capacity of
> > the disk). vhost_user_blk_realize_connect() sends VHOST_USER_GET_CONFIG
> > to fetch the configuration space contents when the device is
> > instantiated.
> >
> > Some vhost-user device types don't need VHOST_USER_PROTOCOL_F_CONFIG. In
> > that case QEMU's --device vhost-user-FOO implements .get/set_config()
> > itself. virtio-net is an example where this is the case.
>=20
> I wonder when the last time this was tested was because since 1c3e5a2617
> (vhost-user: back SET/GET_CONFIG requests with a protocol feature) the
> check in vhost_user_backend_init is:
>=20
>    if (!dev->config_ops || !dev->config_ops->vhost_dev_config_notifier) {
>        /* Don't acknowledge CONFIG feature if device doesn't support it */
>        dev->protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG=
);
>    } else if (!(protocol_features &
>                (1ULL << VHOST_USER_PROTOCOL_F_CONFIG))) {
>        error_setg(errp, "Device expects VHOST_USER_PROTOCOL_F_CONFIG "
>                   "but backend does not support it.");
>        return -EINVAL;
>    }
>=20
> which means I don't think it ever asks the vhost-user backend.

Can you describe what you have in mind? The issue isn't clear to me.

Stefan

--eVLyCxlSit0pJQo7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIlzpAACgkQnKSrs4Gr
c8jvPwf9Hz8l8cIrHmR77qLM6NyM42py6vb2bi/1k6jGTpGecbWmCksZNChlYdKa
0Dm794M9PXFlErfAEN4cGPEzwKzhf75Jvb8IYWPX4p6kjBUBaXtbNQLqVSPXoBzS
X4YvyjO0z/wUem9ICmPPNDRn2EGL3mMwBBvr+pL3hjtIhbJsiOSdaT7RPxcUyQx8
gxpyta9ra81O10XZz/1Ivr8yIO8un8tP6gyqwW3X6RtbdQ7Jn/7tZv2SMyTa1MPp
qAa4retZvxFk+9ndkfW9I2EvQw3q5aG8FVj2kutvfffFJDPbBNbUzSzdqiR+7WiH
ia3fzCyfkjSj/QJb/DkIzddQP5Yewg==
=RfMn
-----END PGP SIGNATURE-----

--eVLyCxlSit0pJQo7--


