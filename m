Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC596FC998
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:54:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOik-00050v-SE; Tue, 09 May 2023 10:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwOii-00050f-RV
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwOig-00032j-Es
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683644017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7VJPthYvzIBF9vkmwmlAdrpHb4PikeTDJHkYlyRuttw=;
 b=RXRGS3X1Nif45+Y9lVT9H18qBAcTg5iBCtRaVsTZI3M5VR2P6bexe4VK0JXPscEUO6/wgZ
 87EAfatkLKOMWsvPkP5pqUgYdEEINLoCvC+vJLrZTg8KnjRb5ZIDuk0YdiGx2z6cciWOYl
 QgcqrysPSJj66JG7lUxK/tPqmIPVCug=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-SpSRyeFDMgW-ZGrmZvAvWg-1; Tue, 09 May 2023 10:53:35 -0400
X-MC-Unique: SpSRyeFDMgW-ZGrmZvAvWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A6A23C14AA1;
 Tue,  9 May 2023 14:53:35 +0000 (UTC)
Received: from localhost (unknown [10.39.195.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8E2A63F86;
 Tue,  9 May 2023 14:53:34 +0000 (UTC)
Date: Tue, 9 May 2023 10:53:32 -0400
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
Message-ID: <20230509145332.GD926999@fedora>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <e8cc4521-50a1-2e38-1fb3-8cfa7b0c967e@redhat.com>
 <CAJSP0QUFFYWwD5+8+1q41sNErJVNbkfnQ3VtB4z-HZUV8S0=zw@mail.gmail.com>
 <dfec96a1-84c3-3639-6f09-204c2d12244a@redhat.com>
 <CAJaqyWdhBq=0f-Qhbdg3AduS8zkPV5p6-uEEn24p1hRKcA3pOQ@mail.gmail.com>
 <05e9946d-f2be-f594-fea2-d1d03686b644@redhat.com>
 <20230508211002.GC926999@fedora>
 <a2e87bab-41c3-0402-927e-54d0a0e67d43@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tGVhIo4KYIiSUs8I"
Content-Disposition: inline
In-Reply-To: <a2e87bab-41c3-0402-927e-54d0a0e67d43@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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


--tGVhIo4KYIiSUs8I
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 10:53:35AM +0200, Hanna Czenczek wrote:
> On 08.05.23 23:10, Stefan Hajnoczi wrote:
> > On Fri, May 05, 2023 at 02:51:55PM +0200, Hanna Czenczek wrote:
> > > On 05.05.23 11:53, Eugenio Perez Martin wrote:
> > > > On Fri, May 5, 2023 at 11:03=E2=80=AFAM Hanna Czenczek <hreitz@redh=
at.com> wrote:
> > > > > On 04.05.23 23:14, Stefan Hajnoczi wrote:
> > > > > > On Thu, 4 May 2023 at 13:39, Hanna Czenczek <hreitz@redhat.com>=
 wrote:
> > > [...]
> > >=20
> > > > > > All state is lost and the Device Initialization process
> > > > > > must be followed to make the device operational again.
> > > > > >=20
> > > > > > Existing vhost-user backends don't implement SET_STATUS 0 (it's=
 new).
> > > > > >=20
> > > > > > It's messy and not your fault. I think QEMU should solve this by
> > > > > > treating stateful devices differently from non-stateful devices=
=2E That
> > > > > > way existing vhost-user backends continue to work and new state=
ful
> > > > > > devices can also be supported.
> > > > > It=E2=80=99s my understanding that SET_STATUS 0/RESET_DEVICE is p=
roblematic for
> > > > > stateful devices.  In a previous email, you wrote that these shou=
ld
> > > > > implement SUSPEND+RESUME so qemu can use those instead.  But thos=
e are
> > > > > separate things, so I assume we just use SET_STATUS 0 when stoppi=
ng the
> > > > > VM because this happens to also stop processing vrings as a side =
effect?
> > > > >=20
> > > > > I.e. I understand =E2=80=9Ctreating stateful devices differently=
=E2=80=9D to mean that
> > > > > qemu should use SUSPEND+RESUME instead of SET_STATUS 0 when the b=
ack-end
> > > > > supports it, and stateful back-ends should support it.
> > > > >=20
> > > > Honestly I cannot think of any use case where the vhost-user backend
> > > > did not ignore set_status(0) and had to retrieve vq states. So maybe
> > > > we can totally remove that call from qemu?
> > > I don=E2=80=99t know so I can=E2=80=99t really say; but I don=E2=80=
=99t quite understand why qemu
> > > would reset a device at any point but perhaps VM reset (and even then=
 I=E2=80=99d
> > > expect the post-reset guest to just reset the device on boot by itsel=
f,
> > > too).
> > DPDK stores the Device Status field value and uses it later:
> > https://github.com/DPDK/dpdk/blob/main/lib/vhost/vhost_user.c#L2791
> >=20
> > While DPDK performs no immediate action upon SET_STATUS 0, omitting the
> > message will change the behavior of other DPDK code like
> > virtio_is_ready().
> >=20
> > Changing the semantics of the vhost-user protocol in a way that's not
> > backwards compatible is something we should avoid unless there is no
> > other way.
>=20
> Well, I have two opinions on this:
>=20
> First, that in DPDK sounds wrong.=C2=A0 vhost_dev_stop() is called mostly=
 by
> devices that call it when set_status is called on them.=C2=A0 But they do=
n=E2=80=99t call
> it if status =3D=3D 0, they call it if virtio_device_should_start() retur=
ns
> false, which is the case when the VM is stopped.=C2=A0 So basically we se=
t a
> status value on the back-end device that is not the status value that is =
set
> in qemu. If DPDK makes actual use of this status value that differs from
> that of the front-end in qemu, that sounds like it probably actually wron=
g.
>=20
> Second, it=E2=80=99s entirely possible and probably probable that DPDK do=
esn=E2=80=99t make
> =E2=80=9Cactual use of this status value=E2=80=9D; the only use it probab=
ly has is to
> determine whether the device is supposed to be stopped, which is exactly
> what qemu has tried to confer by setting it to 0.=C2=A0 So it=E2=80=99s b=
asically two
> implementations that have agreed on abusing a value to emulate behavior t=
hat
> isn=E2=80=99t otherwise implement (SUSPEND), and that works because all d=
evices are
> stateless.=C2=A0 Then, I agree, we can=E2=80=99t change this until it get=
s SUSPEND
> support.
>=20
> > The fundamental problem is that QEMU's vhost code is designed to reset
> > vhost devices because it assumes they are stateless. If an F_SUSPEND
> > protocol feature bit is added, then it becomes possible to detect new
> > backends and suspend/resume them rather than reset them.
> >=20
> > That's the solution that I favor because it's backwards compatible and
> > the same model can be applied to stateful vDPA devices in the future.
>=20
> So basically the idea is the following: vhost_dev_stop() should just susp=
end
> the device, not reset it.=C2=A0 For devices that don=E2=80=99t support SU=
SPEND, we still
> need to do something, and just calling GET_VRING_BASE on all vrings is
> deemed inadequate, so they are reset (SET_STATUS 0) as a work-around,
> assuming that stateful devices that care (i.e. implement SET_STATUS) will
> also implement SUSPEND to not have this =E2=80=9Clegacy reset=E2=80=9D ha=
ppen to them.
>=20
> Sounds good to me.=C2=A0 (If I understood that right. :))

Yes.

Stefan

--tGVhIo4KYIiSUs8I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRaXmwACgkQnKSrs4Gr
c8g+EggAw5qZaO/U8zNYOrgoZ2fi2uB9Yz8d2xku7SQU5QZD1en32Jp9C+RmgEFb
YGSQ+GwYU+H0vgObSkoK8j26bwSl9vL4QrpnTsWqAZKiMczxiAhIX9qP1Shktt4/
Zl6d6bC5X9eBQIk5nhAfiJJFZulHXBdOMACDsqW99uZGxEFnapPhzu/ULrnB+c4+
FfIHn7eRKIOXMSHPnfJGcMQv6BFVetVETlmoQAb48dq36GsTG2V2sGTB4pCHj7hk
1PCd1cOumubcYTrjUDjmXV0b2qCy0bw5+IM/GiA8PSjryj5IKOZ2bJvorDEgJMAh
XVjJW7B/frnKgzDtPqYYnWXHz3zffQ==
=gSjc
-----END PGP SIGNATURE-----

--tGVhIo4KYIiSUs8I--


