Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592136FB927
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 23:11:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw87c-0001Ko-Cr; Mon, 08 May 2023 17:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pw87Z-0001Kg-Rv
 for qemu-devel@nongnu.org; Mon, 08 May 2023 17:10:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pw87V-0005IB-2r
 for qemu-devel@nongnu.org; Mon, 08 May 2023 17:10:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683580207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vqq9G2RsH54/RWb0wikQyTqY6Bym3rwJsnVtUtpJixo=;
 b=PQRwCtHNqogr9L72eKuLTatExWzhdOsTpq0uOeeiNrV4yfAJgO2JcbA50Q4KLGOV7HzYNH
 gOvZx2EjeN7Ppn0G2EqrkdL63O8HvxxQ8GX7h040hufIdg3uEoiGoQdSbB/6Vd9IH3941A
 3aHKf6ZT1tJvprGC4BlhiIbRxFXOlsQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-IzC-TBTRO867goX9SXuhaQ-1; Mon, 08 May 2023 17:10:05 -0400
X-MC-Unique: IzC-TBTRO867goX9SXuhaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E03262802284;
 Mon,  8 May 2023 21:10:04 +0000 (UTC)
Received: from localhost (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AB70C15BA0;
 Mon,  8 May 2023 21:10:03 +0000 (UTC)
Date: Mon, 8 May 2023 17:10:02 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 0/4] vhost-user-fs: Internal migration
Message-ID: <20230508211002.GC926999@fedora>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <e8cc4521-50a1-2e38-1fb3-8cfa7b0c967e@redhat.com>
 <CAJSP0QUFFYWwD5+8+1q41sNErJVNbkfnQ3VtB4z-HZUV8S0=zw@mail.gmail.com>
 <dfec96a1-84c3-3639-6f09-204c2d12244a@redhat.com>
 <CAJaqyWdhBq=0f-Qhbdg3AduS8zkPV5p6-uEEn24p1hRKcA3pOQ@mail.gmail.com>
 <05e9946d-f2be-f594-fea2-d1d03686b644@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aTpnGGsPmSuxR1Ft"
Content-Disposition: inline
In-Reply-To: <05e9946d-f2be-f594-fea2-d1d03686b644@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--aTpnGGsPmSuxR1Ft
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2023 at 02:51:55PM +0200, Hanna Czenczek wrote:
> On 05.05.23 11:53, Eugenio Perez Martin wrote:
> > On Fri, May 5, 2023 at 11:03=E2=80=AFAM Hanna Czenczek <hreitz@redhat.c=
om> wrote:
> > > On 04.05.23 23:14, Stefan Hajnoczi wrote:
> > > > On Thu, 4 May 2023 at 13:39, Hanna Czenczek <hreitz@redhat.com> wro=
te:
>=20
> [...]
>=20
> > > > All state is lost and the Device Initialization process
> > > > must be followed to make the device operational again.
> > > >=20
> > > > Existing vhost-user backends don't implement SET_STATUS 0 (it's new=
).
> > > >=20
> > > > It's messy and not your fault. I think QEMU should solve this by
> > > > treating stateful devices differently from non-stateful devices. Th=
at
> > > > way existing vhost-user backends continue to work and new stateful
> > > > devices can also be supported.
> > > It=E2=80=99s my understanding that SET_STATUS 0/RESET_DEVICE is probl=
ematic for
> > > stateful devices.  In a previous email, you wrote that these should
> > > implement SUSPEND+RESUME so qemu can use those instead.  But those are
> > > separate things, so I assume we just use SET_STATUS 0 when stopping t=
he
> > > VM because this happens to also stop processing vrings as a side effe=
ct?
> > >=20
> > > I.e. I understand =E2=80=9Ctreating stateful devices differently=E2=
=80=9D to mean that
> > > qemu should use SUSPEND+RESUME instead of SET_STATUS 0 when the back-=
end
> > > supports it, and stateful back-ends should support it.
> > >=20
> > Honestly I cannot think of any use case where the vhost-user backend
> > did not ignore set_status(0) and had to retrieve vq states. So maybe
> > we can totally remove that call from qemu?
>=20
> I don=E2=80=99t know so I can=E2=80=99t really say; but I don=E2=80=99t q=
uite understand why qemu
> would reset a device at any point but perhaps VM reset (and even then I=
=E2=80=99d
> expect the post-reset guest to just reset the device on boot by itself,
> too).

DPDK stores the Device Status field value and uses it later:
https://github.com/DPDK/dpdk/blob/main/lib/vhost/vhost_user.c#L2791

While DPDK performs no immediate action upon SET_STATUS 0, omitting the
message will change the behavior of other DPDK code like
virtio_is_ready().

Changing the semantics of the vhost-user protocol in a way that's not
backwards compatible is something we should avoid unless there is no
other way.

The fundamental problem is that QEMU's vhost code is designed to reset
vhost devices because it assumes they are stateless. If an F_SUSPEND
protocol feature bit is added, then it becomes possible to detect new
backends and suspend/resume them rather than reset them.

That's the solution that I favor because it's backwards compatible and
the same model can be applied to stateful vDPA devices in the future.

Stefan

--aTpnGGsPmSuxR1Ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRZZSoACgkQnKSrs4Gr
c8hXZQf/em9+DY2ZVNYUT2VD8sp2kxRGmI4ow553rKKvkwPR2I1pndq4ELB9ysdy
DwUbmayREaMe4XZThcJrZnPjp/PcercjmkwplblClT1L0eZwsj5OTS/+5JOR1e6l
br9J5pWMIp1f2b7UTDQ1K32WfrlMk2ZN5TTk7m396SgriRea91Ss6V17rTfs+t1Q
9J9fHbBokJxKqRiXlb+knso5I48HeAENBW4z6C1ov8Yw0xYPFzrnMhMrb7mMuBR3
r1Eae4DBqd/5SOnmkgDtVDZRJ3loACH2PxPC4bA6l27sSyjkR5W5ZceqNb8oTPWQ
xf5l4OaH825RzvCzg2wLpokE9T7H1g==
=NoyL
-----END PGP SIGNATURE-----

--aTpnGGsPmSuxR1Ft--


