Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D617950A004
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:50:33 +0200 (CEST)
Received: from localhost ([::1]:45704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhWGU-0005RF-OK
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhWAg-0001d4-9P
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:44:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhWAP-0002KI-Ab
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650545051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h3ZC6kW6+XdNdmJTcQMxggn3kYbx6LWagtob/JsWBmQ=;
 b=DUTuswiP/wB9UwH8+kJppxXfqVOeFyDzr0IKTepsUeR77Ndhd9aGWnDS6bsr7MR/InZxuz
 t0EoJ42TweVmz/pz614bghnDvNTSCS8sHeXBwXpzJOYCItAFhdYqHlX/iBTD3GKR8ug4jh
 mSZcEP5hodZ6UK35cI5BNveSEoxHrW8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-Ua6raPZLP5SM7jIe3k5KIQ-1; Thu, 21 Apr 2022 08:44:06 -0400
X-MC-Unique: Ua6raPZLP5SM7jIe3k5KIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB1793C1618B;
 Thu, 21 Apr 2022 12:44:05 +0000 (UTC)
Received: from localhost (unknown [10.39.194.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A85F145BEE1;
 Thu, 21 Apr 2022 12:44:05 +0000 (UTC)
Date: Thu, 21 Apr 2022 14:44:03 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Auger <eauger@redhat.com>
Subject: Re: [RFC PATCH] tests/qtest: pass stdout/stderr down to subtests
Message-ID: <YmFRk5Nkd/AesL1C@stefanha-x1.localdomain>
References: <20220407150042.2338562-1-alex.bennee@linaro.org>
 <738a5f8a-a14b-ad07-5d4d-ece8b6ddbd2c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="giDq9THpm1U0dmMR"
Content-Disposition: inline
In-Reply-To: <738a5f8a-a14b-ad07-5d4d-ece8b6ddbd2c@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--giDq9THpm1U0dmMR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 14, 2022 at 07:25:54PM +0200, Eric Auger wrote:
> Hi Alex,
>=20
> On 4/7/22 5:00 PM, Alex Benn=E9e wrote:
> > When trying to work out what the virtio-net-tests where doing it was
> > hard because the g_test_trap_subprocess redirects all output to
> > /dev/null. Lift this restriction by using the appropriate flags so you
> > can see something similar to what the vhost-user-blk tests show when
> > running.
> >=20
> > While we are at it remove the g_test_verbose() check so we always show
> > how the QEMU is run.
> >=20
> > Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> > ---
> >  tests/qtest/qos-test.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
> > index f97d0a08fd..c6c196cc95 100644
> > --- a/tests/qtest/qos-test.c
> > +++ b/tests/qtest/qos-test.c
> > @@ -89,9 +89,7 @@ static void qos_set_machines_devices_available(void)
> > =20
> >  static void restart_qemu_or_continue(char *path)
> >  {
> > -    if (g_test_verbose()) {
> > -        qos_printf("Run QEMU with: '%s'\n", path);
> > -    }
> > +    qos_printf("Run QEMU with: '%s'\n", path);
> >      /* compares the current command line with the
> >       * one previously executed: if they are the same,
> >       * don't restart QEMU, if they differ, stop previous
> > @@ -185,7 +183,8 @@ static void run_one_test(const void *arg)
> >  static void subprocess_run_one_test(const void *arg)
> >  {
> >      const gchar *path =3D arg;
> > -    g_test_trap_subprocess(path, 0, 0);
> > +    g_test_trap_subprocess(path, 0,
> > +                           G_TEST_SUBPROCESS_INHERIT_STDOUT | G_TEST_S=
UBPROCESS_INHERIT_STDERR);
> While workling on libqos/pci tests on aarch64 I also did that but I
> noticed there were a bunch of errors such as:
>=20
> /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/virtio-net-pci/virt=
io-net/virtio-net-tests/vhost-user/multiqueue:
> qemu-system-aarch64: Failed to set msg fds.
> qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid
> argument (22)
> qemu-system-aarch64: Failed to set msg fds.
> qemu-system-aarch64: vhost VQ 1 ring restore failed: -22: Invalid
> argument (22)
> qemu-system-aarch64: Failed to set msg fds.
> qemu-system-aarch64: vhost VQ 2 ring restore failed: -22: Invalid
> argument (22)
> qemu-system-aarch64: Failed to set msg fds.
> qemu-system-aarch64: vhost VQ 3 ring restore failed: -22: Invalid
> argument (22)
>=20
> I see those also when running with x86_64-softmmu/qemu-system-x86_64
> (this is no aarch64 specific).
>=20
> I don't know if it is an issue to get those additional errors?

I see the same errors on
/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virt=
io-net-tests/vhost-user/.

On the other hand, "make check" is happy (and silent) when run on the
command-line.

If the CI enables more verbose output then these messages might be
diffed and interpreted as failures, but I didn't check the CI scripts.

As long as GitLab CI is happy I think it's okay to merge this patch, but
it would be interesting to investigate the reason for these messages.

Stefan

--giDq9THpm1U0dmMR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJhUZMACgkQnKSrs4Gr
c8jDIQgAyWzkfybYqa6WV2MxklfLvulJYNZBgiI5oogqaIAKT9WHMYJLtgmyTR2l
4HeEnh3okHKRY3lwd6fYhS02mgt8IPicGkhnzqhm2YMtX5KPHNia7UAaotPyO9BH
tn7+EQn78TgNnN9Gru900ZD6AMHdkbViBr1M3lb82thkD9oM2XGVsdTBjp5kUE71
W4zsRjlMDVP5LrggyqW3JK4SN/2Q7hUXPbDvfflUhiCMmbzrWZ5mt4ux6FRwD2iu
B/gWFTmi2RBxFg+Yk1j3Iqe81ea0ljG3byZna6NCBlaXtUvzyyCbVr0gOPvHuDs2
xpetHx5TZpCqM5RXRlaDmeIx2CIVFQ==
=Bg3r
-----END PGP SIGNATURE-----

--giDq9THpm1U0dmMR--


