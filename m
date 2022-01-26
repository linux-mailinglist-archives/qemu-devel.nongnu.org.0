Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2148449C664
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 10:37:34 +0100 (CET)
Received: from localhost ([::1]:49906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCek9-0001zt-4F
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 04:37:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCeiU-0000WP-NZ
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:35:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCeiP-0002OU-Ep
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643189741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VRHfWYEgFeF2hEg2jYjLzqPI6HlIBqlqYKpjMTj5wZE=;
 b=TDB3SWDp/rNvX7HY7HSpTIoz+HmVT7HlHjy+pRGHlWblcWv9JLiJW5CshbObSC2vVH5dQQ
 LmESKG0UknS1t+0rP+diVyvEtf5qYUs+bXvVBN8o+HDBGXhyURAw0TecKkgEcwjKv8zpxr
 RFhkh3CP1aeCFASz7B4JNESEToJ69HY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-YpwduQwPNd-_GxePed_zcQ-1; Wed, 26 Jan 2022 04:35:37 -0500
X-MC-Unique: YpwduQwPNd-_GxePed_zcQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E32BC8143F2;
 Wed, 26 Jan 2022 09:35:35 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E75204EC89;
 Wed, 26 Jan 2022 09:35:15 +0000 (UTC)
Date: Wed, 26 Jan 2022 09:35:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 06/18] vfio-user: add HotplugHandler for remote machine
Message-ID: <YfEV0kh8uyy3MU8V@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <fa3282607f7fed7736bfdf3c1ae9f7fce466ed44.1642626515.git.jag.raman@oracle.com>
 <Ye/Rz1bHJN2m9vCo@stefanha-x1.localdomain>
 <A037BABE-9424-4EBF-A1E2-F712DC8A89CC@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VeZEeh8bwV4Q0ppo"
Content-Disposition: inline
In-Reply-To: <A037BABE-9424-4EBF-A1E2-F712DC8A89CC@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VeZEeh8bwV4Q0ppo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 06:12:48PM +0000, Jag Raman wrote:
>=20
>=20
> > On Jan 25, 2022, at 5:32 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Wed, Jan 19, 2022 at 04:41:55PM -0500, Jagannathan Raman wrote:
> >> Allow hotplugging of PCI(e) devices to remote machine
> >>=20
> >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >> ---
> >> hw/remote/machine.c | 29 +++++++++++++++++++++++++++++
> >> 1 file changed, 29 insertions(+)
> >=20
> > Why is this code necessary? I expected the default hotplug behavior to
>=20
> I just discovered that TYPE_REMOTE_MACHINE wasn't setting up a hotplug
> handler for the root PCI bus.
>=20
> Looks like, some of the machines don=E2=80=99t support hotplugging PCI de=
vices. I see
> that the =E2=80=98pc=E2=80=99 machine does support hotplug, whereas =E2=
=80=98q35=E2=80=99 does not.

Hotplug is definitely possible with q35. I'm not familiar with the
hotplug code though so I don't know how exactly that works for q35.

> We didn=E2=80=99t check hotplug in multiprocess-qemu previously because i=
t was limited
> to one device per process, and the use cases attached the devices via
> command line.
>=20
> > pretty much handle this case - hotplugging device types that the bus
> > doesn't support should fail and unplug should already unparent/unrealize
> > the device.
>=20
> OK, that makes sense. We don=E2=80=99t need to test the device type during
> plug and unplug.
>=20
> Therefore, I don=E2=80=99t think we need a callback for the plug operatio=
n. We
> could set HotplugHandlerClass->unplug callback to the default
> qdev_simple_device_unplug_cb() callback.

Great!

Stefan

--VeZEeh8bwV4Q0ppo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxFdIACgkQnKSrs4Gr
c8iQyAf/XR7GH2zrTEmJqV2v7jkRQc/cf2mVlF+bq7iWKAa5Gb7/yjSc3ZDk0G3O
UbZ+U+4jKdrIfiIt39ytkm04j2C4Et8QipX2h6ubrISvkOujJqgcoetvJQuyLZOW
I4o13N+NY0PqYaKTsSi6avYSNROSgKafH8tlPuhKZQuvKKcHBwkNVJl+kTNKSjA8
601d/6wEZdlZwjAEZwSdV5yzqA/YqUAAt4U70kq+j48xzpk1w9ruXSL/gmlVvZ9+
AA3igQokS1wJ4NlPj0OcMIqlscoKMj5tH1rrlu1iL7A83nrAMTwMb08DQsAbKHTY
rQsYVo0ETIYqilKYIgem2qaYh/hWrw==
=lb9r
-----END PGP SIGNATURE-----

--VeZEeh8bwV4Q0ppo--


