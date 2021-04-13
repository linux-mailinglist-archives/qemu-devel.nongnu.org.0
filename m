Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EA335DA77
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 10:56:15 +0200 (CEST)
Received: from localhost ([::1]:36186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEqF-0006iz-33
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 04:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWEnt-0005wq-T4
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:53:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWEns-0000LZ-6p
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618304027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bvbNGiCRXqN2VqIhzCf4hzcEHO+7DuAu4HAQ5ik1hTc=;
 b=W+InvAWxvZlwexBHy/hs/cl24z4jYhCm1uwseHjpOC7zMKOfhoqKJejg3aMMRhsvrc8l6L
 v3TMSPIN/JrBe0xAED7JPWE1PEPJuSaLQBS36akAWFEDUaDCVthOKKiBLH6r6TepBdZQlG
 H5KMXUnUyTf6TlcD5qCJvsdergzr4hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-XxjpJGfYNmu_kEVznaDkKA-1; Tue, 13 Apr 2021 04:53:44 -0400
X-MC-Unique: XxjpJGfYNmu_kEVznaDkKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B7E89F92A;
 Tue, 13 Apr 2021 08:53:43 +0000 (UTC)
Received: from localhost (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 451C160CF0;
 Tue, 13 Apr 2021 08:53:36 +0000 (UTC)
Date: Tue, 13 Apr 2021 09:53:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] vhost-user-fs: fix features handling
Message-ID: <YHVcDwX7bCW6T1B2@stefanha-x1.localdomain>
References: <20210408195534.647895-1-antonkuchin@yandex-team.ru>
 <20210409155657.GE1111800@redhat.com>
 <14f05a3d-7db6-2c01-7fe0-f83586ff1fd6@yandex-team.ru>
 <20210412184316.GF1184147@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210412184316.GF1184147@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QSTS3cQwv5Jgiqij"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--QSTS3cQwv5Jgiqij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 02:43:16PM -0400, Vivek Goyal wrote:
> On Sun, Apr 11, 2021 at 09:21:54AM +0300, Anton Kuchin wrote:
> >=20
> > On 09/04/2021 18:56, Vivek Goyal wrote:
> > > On Thu, Apr 08, 2021 at 10:55:34PM +0300, Anton Kuchin wrote:
> > > > Make virtio-fs take into account server capabilities.
> > > >=20
> > > > Just returning requested features assumes they all of then are impl=
emented
> > > > by server and results in setting unsupported configuration if some =
of them
> > > > are absent.
> > > >=20
> > > > Signed-off-by: Anton Kuchin<antonkuchin@yandex-team.ru>
> > > [CC stefan and qemu-devel.]
> > >=20
> > > Can you give more details of what problem exactly you are facing. Or
> > > this fix is about avoiding a future problem where device can refuse
> > > to support a feature qemu is requesting for.
> >=20
> > This fixes existing problem that qemu ignores features (un)supported by
> > backend and this works fine only if backend features match features of =
qemu.
> > Otherwise qemu incorrectly assumes that backend suports all of them and
> > calls vhost_set_features() not taking into account result of previous
> > vhost_get_features() call. This breaks protocol and can crash server or
> > cause incorrect behavior.
> >=20
> > This is why I hope it to be accepted in time for 6.0 release.
> >=20
> > > IIUC, this patch is preparing a list of features vhost-user-fs device
> > > can support. Then it calls vhost_get_features() which makes sure that
> > > all these features are support by real vhost-user device (hdev->featu=
res).
> > > If not, then corresponding feature is reset and remaining features
> > > are returned to caller.
> > When this callback is executed in virtio_bus_device_plugged() list of
> > features that vhost-backend supports has been already obtained earlier =
by
> > vhost_user_get_features() in vuf_device_realize() and stored in
> > hdev->features.
>=20
> > vuf_get_features() should return bitmask of features that
> > are common for vhost backend (hdev->features) and frontend
> > (vdev->host_features).
>=20
> But that's not what exactly this patch seems to be doing.
> IIUC, It only resets some of the features from list passed from
> the caller. So whatever has been defined in user_feature_bits[],
> and if these features are not supported by vhost-user backend, then
> that feature will be reset before returning to caller.
>=20
> So the question is what are those features which should be in
> user_feature_bits[]? For example, by default libvhost-user
> also supports.
>=20
>         /* vhost-user feature bits */
>         1ULL << VHOST_F_LOG_ALL |
>         1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
>=20
> Should that be in user_feature_bits[] too. So that if a customer
> vhost-user-fs backend does not support VHOST_F_LOG_ALL or
> VHOST_USER_F_PROTOCOL_FEATURES, it is reset.
>=20
> IIUC, your current patch is not going to reset these features if
> caller passed you those in vuf_get_features(,requested_features).
>=20
> So to me this becomes more of a question that what are those common
> features which both the ends of vhost-user device should support for
> it to work and should be checked in vuf_get_features().=20

VHOST_F_LOG_ALL and VHOST_USER_F_PROTOCOL_FEATURES are controlled by
hw/virtio/vhost.c and hw/virtio/vhost-user.c. These feature bits are
part of the vhost-user protocol and are not involved in guest-visible
VIRTIO feature negotiation. It's confusing because these bits use the
same namespace as VIRTIO features but it is correct to omit it from
user_feature_bits[].

Stefan

--QSTS3cQwv5Jgiqij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB1XA8ACgkQnKSrs4Gr
c8g02ggArV+Wj1NH9XK5UCF5iuSo0MOaFnV+MEiTNa8WIdo7AuuLaEj55B7IEwQZ
dm1x0s0cEEi8DOI8Ru+a3jPqupe3i0BrOFQELdWVgtVCFmkOZBeBo4RDHUWFM9Ay
g44WLpS0bbwuMdqCTfKsVEA6TlqT7xW+CJlWI+e580/kGFZNUoQkFh+ogf0ySG30
cuMMXNBw5nzv7sUJiGD4cU6LUvfbhNlGrolFDpSU4HDRKXYpTsYcohOK2Ak+JebK
gGnNpTnggo/S1VQzGS8NlEtu+7D29h4dQGPSzYj5bsyVSDUjXn1EBICdIrQtBHbk
XtOP+wqprnkmvaxsN6AldWqw35U/2A==
=o6ac
-----END PGP SIGNATURE-----

--QSTS3cQwv5Jgiqij--


