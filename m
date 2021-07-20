Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374983CF155
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:28:41 +0200 (CEST)
Received: from localhost ([::1]:34238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eYq-0005Js-9V
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m5eWY-0000hc-DX
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:26:18 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:42162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m5eWW-0008NX-Fk
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:26:18 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F08AB202BF;
 Tue, 20 Jul 2021 01:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626744372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1x9/rWsRxAI8XsjwvoU5Yq6xgfuAHSknD8+m3thbIMg=;
 b=yA4gaqEnYuMPIkgN9/EjyeP9bUh/PgQC3dl3rnJ3EIZSwOZ6/JoFRKy1aqfXn0qeB45Qaa
 W0JgYqfJifs4vAz9bNhelawxwMaRudOunYwfibHcJ3kWYoOWodMmhUzX8qnj21d01ew2hh
 UiT33lb+QZzi9pByLSP4IFE5qLNmePQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626744372;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1x9/rWsRxAI8XsjwvoU5Yq6xgfuAHSknD8+m3thbIMg=;
 b=xdRrdEGdoEzIB8LzI/C0pjnCGBG6KqimqddxVPcnUSgcxKwx2CWt5Tpfj55uF/mBBdoxer
 pSoB2u2ieMfAyHAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0161E1368F;
 Tue, 20 Jul 2021 01:26:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 89IMLTIm9mAlJQAAGKfGzw
 (envelope-from <jziviani@suse.de>); Tue, 20 Jul 2021 01:26:10 +0000
Date: Mon, 19 Jul 2021 22:26:04 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC 3/3] qom: Improve error message in
 module_object_class_by_name()
Message-ID: <YPYmLEuJ165xy5aR@pizza>
References: <20210630232749.21873-1-jziviani@suse.de>
 <20210630232749.21873-4-jziviani@suse.de>
 <c82bb889-a3a8-6870-ca79-108ec9a104d1@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1hrcdWnQZl5FKqKS"
Content-Disposition: inline
In-Reply-To: <c82bb889-a3a8-6870-ca79-108ec9a104d1@suse.de>
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: pbonzini@redhat.com, kraxel@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1hrcdWnQZl5FKqKS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 05:29:49PM +0200, Claudio Fontana wrote:
> On 7/1/21 1:27 AM, Jose R. Ziviani wrote:
> > module_object_class_by_name() calls module_load_qom_one if the object
> > is provided by a dynamically linked library. Such library might not be
> > available at this moment - for instance, it can be a package not yet
> > installed. Thus, instead of assert error messages, this patch outputs
> > more friendly messages.
> >=20
> > Current error messages:
> > $ ./qemu-system-x86_64 -machine q35 -accel tcg -kernel /boot/vmlinuz
> > ...
> > ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion =
failed: (ops !=3D NULL)
> > Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: =
assertion failed: (ops !=3D NULL)
> > [1]    31964 IOT instruction (core dumped)  ./qemu-system-x86_64 ...
> >=20
> > New error message:
> > $ ./qemu-system-x86_64 -machine q35 -accel tcg -kernel /boot/vmlinuz
> > accel-tcg-x86_64 module is missing, install the package or config the l=
ibrary path correctly.
> >=20
> > $ make check
> > ...
> > Running test qtest-x86_64/test-filter-mirror
> > Running test qtest-x86_64/endianness-test
> > accel-qtest-x86_64 module is missing, install the package or config the=
 library path correctly.
> > accel-qtest-x86_64 module is missing, install the package or config the=
 library path correctly.
> > accel-qtest-x86_64 module is missing, install the package or config the=
 library path correctly.
> > accel-qtest-x86_64 module is missing, install the package or config the=
 library path correctly.
> > accel-qtest-x86_64 module is missing, install the package or config the=
 library path correctly.
> > accel-tcg-x86_64 module is missing, install the package or config the l=
ibrary path correctly.
> > ...
> >=20
> > Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> > ---
> >  qom/object.c | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >=20
> > diff --git a/qom/object.c b/qom/object.c
> > index 6a01d56546..2d40245af9 100644
> > --- a/qom/object.c
> > +++ b/qom/object.c
> > @@ -1024,6 +1024,24 @@ ObjectClass *object_class_by_name(const char *ty=
pename)
> >      return type->class;
> >  }
> > =20
> > +char *get_accel_module_name(const char *ac_name);
> > +
> > +char *get_accel_module_name(const char *ac_name)
> > +{
> > +    size_t len =3D strlen(ac_name);
> > +    char *module_name =3D NULL;
> > +
> > +    if (strncmp(ac_name, "tcg-accel-ops", len) =3D=3D 0) {
> > +#ifdef CONFIG_TCG_MODULAR
> > +        module_name =3D g_strdup_printf("%s%s", "accel-tcg-", "x86_64"=
);
> > +#endif
> > +    } else if (strncmp(ac_name, "qtest-accel-ops", len) =3D=3D 0) {
> > +        module_name =3D g_strdup_printf("%s%s", "accel-qtest-", "x86_6=
4");
> > +    }
> > +
> > +    return module_name;
> > +}
> > +
> >  ObjectClass *module_object_class_by_name(const char *typename)
> >  {
> >      ObjectClass *oc;
> > @@ -1031,8 +1049,20 @@ ObjectClass *module_object_class_by_name(const c=
har *typename)
> >      oc =3D object_class_by_name(typename);
> >  #ifdef CONFIG_MODULES
> >      if (!oc) {
> > +        char *module_name;
> >          module_load_qom_one(typename);
> >          oc =3D object_class_by_name(typename);
> > +        module_name =3D get_accel_module_name(typename);
> > +        if (module_name) {
> > +            if (!module_is_loaded(module_name)) {
> > +                fprintf(stderr, "%s module is missing, install the "
> > +                                "package or config the library path "
> > +                                "correctly.\n", module_name);
> > +                g_free(module_name);
> > +                exit(1);
> > +            }
> > +            g_free(module_name);
> > +        }
> >      }
> >  #endif
> >      return oc;
> >=20
>=20
> Hi Jose,
>=20
> this inserts accel logic into module_object_class_by_name,
> maybe some other place would be better to insert this check,
> like when trying to select an accelerator?


Hello Claudio,

Yes, I think that 'get_accel_module_name()' may be a more generic
'get_module_name()' to handle any module failure (not only
accelerators).

I'll improve it and send a v2. Thank you for reviewing it.

>=20
> Thanks,
>=20
> CLaudio

--1hrcdWnQZl5FKqKS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmD2JiYACgkQaJ4wdCKK
F5ZUmQ//cGsCkYBvp7QIO1s5LWaxreUE6iAkWmUPFeArwu4RQEaVQnDlsjcxe/dP
Lp6/dCmowxpwnlg2/6vpXAbYuYLxZNlvq2AUxcl4+9XaMhbpqdE5Svbr9mic1eE4
c7LiwFct6UORr5Z0U/bRJWPp4nKaKuitR7M51JzHUi8ojDs4RS6o0UIaavqm216Q
6Az9+jt1Y1LDlIIbuyFIJQ7Y2DF/8ZT+80CYo4gpgI7NGsBdbAMUZdDKazVl0dYV
oWkdWaJKtpVFqlLTq+Qp/OB47cpF9wt3HgctLZ3Dp7CKf8UC9Y3omySARzuzAQUO
W1YBjZ2FSCQ79gUfgQH7LfsB1uYLQPIjH1Eez75mPMysdPWCiOR4BzXRPFPie73D
WSsHkJnK76grdVO5jr5XI0uITuM8C0OLzwEMqPMalofovvEOH6HkMdg7t+JiW146
1NqxZB9ZN7hb+/70gNeLBr3DbrCPJ7XBpOAXxZ08zsYbYysYpwbC3Ya3xvq847pq
M9nnE+gprGck8CeitTwLqctc733VH34WGdp+wvpbok+GrwakKemAxB2p/0qoERlz
GJVm8loFT6jIhHMMuLRY3nYbo3bjP1o+LIzsfm+ewJzkNz8IQIG+kfEU40aNiIq5
82veMd70Bue0XzG6+oiyaoLoI5OCjkPDj0ZlGtUM6Qv+RdkNYb0=
=bxpn
-----END PGP SIGNATURE-----

--1hrcdWnQZl5FKqKS--

