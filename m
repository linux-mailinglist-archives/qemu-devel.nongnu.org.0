Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4463D3B6A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 15:51:45 +0200 (CEST)
Received: from localhost ([::1]:36386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6vaa-0006xG-AN
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 09:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m6vZl-0006Hv-An
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 09:50:53 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:49328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m6vZj-0002By-Bz
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 09:50:53 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AEDF61FD9F;
 Fri, 23 Jul 2021 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627048249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7wNGsmw9uQNWd8qdihPMXqtbSWNtF85Vq6Go3b7HOf8=;
 b=Rhxx9YgOUURpvpnpFItX9kE3RVN0Gi81EOtpwfTNy4g4ll/Vm2seUDhayVr4Vu2B0V8FO1
 nnqM5ie0YfpVX9sOVjvSqWktXHDNBubc7aVvHVkG3YiAZG9XqWz2GFVgrTo8WhKmFWS/p5
 sXmhrCryq4jxo3Ft8645Pf2LLFplet0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627048249;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7wNGsmw9uQNWd8qdihPMXqtbSWNtF85Vq6Go3b7HOf8=;
 b=ZPQcalb+uirnJOCzbuQ+2dOB4652DXINEvP/0X4hPgAfzrrjFBZ7CxDlM8xNDPnelh9Vfs
 WKinitmk/SIpFRDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B77D7139B8;
 Fri, 23 Jul 2021 13:50:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id RdTZHTfJ+mBGKwAAGKfGzw
 (envelope-from <jziviani@suse.de>); Fri, 23 Jul 2021 13:50:47 +0000
Date: Fri, 23 Jul 2021 10:50:41 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v2 1/1] modules: Improve error message when module is not
 found
Message-ID: <YPrJMTF+3lfeNdC5@pizza>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="56QU/I0EuxCXslcc"
Content-Disposition: inline
In-Reply-To: <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--56QU/I0EuxCXslcc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2021 at 11:41:19AM +0200, Claudio Fontana wrote:
> On 7/23/21 12:09 AM, Jose R. Ziviani wrote:
> > When a module is not found, specially accelerators, QEMU displays
> > a error message that not easy to understand[1]. This patch improves
> > the readability by offering a user-friendly message[2].
> >=20
> > This patch also moves the accelerator ops check to runtine (instead
> > of the original g_assert) because it works better with dynamic
> > modules.
> >=20
> > [1] qemu-system-x86_64 -accel tcg
> > ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion =
failed:
> > (ops !=3D NULL)
> > Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces:
> > assertion failed: (ops !=3D NULL)
> >     31964 IOT instruction (core dumped)  ./qemu-system-x86_64 ...
> >=20
> > [2] qemu-system-x86_64 -accel tcg
> > accel-tcg-x86_64 module is missing, install the package or config the l=
ibrary path correctly.
> >=20
> > Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> > ---
> >  accel/accel-softmmu.c |  5 ++++-
> >  util/module.c         | 14 ++++++++------
> >  2 files changed, 12 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
> > index 67276e4f52..52449ac2d0 100644
> > --- a/accel/accel-softmmu.c
> > +++ b/accel/accel-softmmu.c
> > @@ -79,7 +79,10 @@ void accel_init_ops_interfaces(AccelClass *ac)
> >       * all accelerators need to define ops, providing at least a manda=
tory
> >       * non-NULL create_vcpu_thread operation.
> >       */
> > -    g_assert(ops !=3D NULL);
> > +    if (ops =3D=3D NULL) {
> > +        exit(1);
> > +    }
> > +
>=20
>=20
> Ah, again, why?
> This change looks wrong to me,=20
>=20
> the ops code should be present when ops interfaces are initialized:
> it should be a code level assertion, as it has to do with the proper orde=
r of initializations in QEMU,
>=20
> why would we want to do anything else but to assert here?
>=20
> Am I blind to something obvious?

Hello!

Thank you for reviewing it!

The problem is that if your TCG module is not installed and you start
QEMU like:

=2E/qemu-system-x86_64 -accel tcg

You'll get the error message + a crash with a core dump:

accel-tcg-x86_64 module is missing, install the package or config the libra=
ry path correctly.
**
ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion fail=
ed: (ops !=3D NULL)
Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: asse=
rtion failed: (ops !=3D NULL)
[1]    5740 IOT instruction (core dumped)  ./qemu-system-x86_64 -accel tcg

I was digging a little bit more in order to move this responsibility to
module.c but there isn't enough information there to safely exit() in
all situations that a module may be loaded. As Gerd mentioned, more work
is needed in order to achieve that.

However, it's not nice to have a crash due to an optional module missing.
It's specially confusing because TCG has always been native. Considering
also that we're already in hard freeze for 6.1, I thought to have this
simpler check instead.

What do you think if we have something like:

/* FIXME: this isn't the right place to handle a missing module and
   must be reverted when the module refactoring is completely done */
#ifdef CONFIG_MODULES
if (ops =3D=3D NULL) {
    exit(1);
}
#else
g_assert(ops !=3D NULL);
#endif

Regards!

>=20
> >      if (ops->ops_init) {
> >          ops->ops_init(ops);
> >      }
> > diff --git a/util/module.c b/util/module.c
> > index 6bb4ad915a..268a8563fd 100644
> > --- a/util/module.c
> > +++ b/util/module.c
> > @@ -206,13 +206,10 @@ static int module_load_file(const char *fname, bo=
ol mayfail, bool export_symbols
> >  out:
> >      return ret;
> >  }
> > -#endif
> > =20
> >  bool module_load_one(const char *prefix, const char *lib_name, bool ma=
yfail)
> >  {
> >      bool success =3D false;
> > -
> > -#ifdef CONFIG_MODULES
> >      char *fname =3D NULL;
> >  #ifdef CONFIG_MODULE_UPGRADES
> >      char *version_dir;
> > @@ -300,6 +297,9 @@ bool module_load_one(const char *prefix, const char=
 *lib_name, bool mayfail)
> > =20
> >      if (!success) {
> >          g_hash_table_remove(loaded_modules, module_name);
> > +        fprintf(stderr, "%s module is missing, install the "
> > +                        "package or config the library path "
> > +                        "correctly.\n", module_name);
> >          g_free(module_name);
> >      }
> > =20
> > @@ -307,12 +307,9 @@ bool module_load_one(const char *prefix, const cha=
r *lib_name, bool mayfail)
> >          g_free(dirs[i]);
> >      }
> > =20
> > -#endif
> >      return success;
> >  }
> > =20
> > -#ifdef CONFIG_MODULES
> > -
> >  static bool module_loaded_qom_all;
> > =20
> >  void module_load_qom_one(const char *type)
> > @@ -384,4 +381,9 @@ void qemu_load_module_for_opts(const char *group) {}
> >  void module_load_qom_one(const char *type) {}
> >  void module_load_qom_all(void) {}
> > =20
> > +bool module_load_one(const char *prefix, const char *lib_name, bool ma=
yfail)
> > +{
> > +    return false;
> > +}
> > +
> >  #endif
> >=20
>=20

--56QU/I0EuxCXslcc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmD6yS0ACgkQaJ4wdCKK
F5Y8jw/9H3RKp1vd6Dzz//Vz1y60WMYxqy/s0K1B+gMuzOgwq1+bofEzyXqrjSY0
GH1NsvWZn+7uLZPi3GnR8ECteN3DqYLmeAVccRUrVkDxXWkKDhbRpME0655OLqQY
2xDU/doNM/0sZFqww+ZCiVOJM4QHld5COHyZutSoHN/ak4NZo6uZF0sR7mQTPe9a
gGcnvxMjYG117+aJvIlShB9iL4U3TV/OnCfjST0hUipWcyb4KA8nVlo6zH7niRMj
QRwTPwfvyAem8zRYrpKalcA/fEW2IrNcpRaGu3DdfX1jIMx/58SKAwTSy+fEaxb/
5eSdhnDSI/OQ7l/e6vrNCe/Jyo0yOveaqzpr7Qg/311JgBJMxG41jhC/a/Bey0UU
o/lUm+xTi5MgE3ILNd/2pCUHPYrqL/NIoEOSSrMOUxuXVNhW2P+wfoTrW0i6Q31g
iVhRmeHMSxGYZjU+86wUd2xytb0R1t5k4wgxrM4wjrqrQUtq+ktuUWLFhciqiu/W
UNv+5UrhgytpsgDxAUo8vy98niik1cGJrusULHVa0gIT74ZV0wSXtHwpoorsvKpd
vvnob4HhG3NNcnlDwE9g2Ha8P1m/MgI6GZY8uscye7JYxC8WlyWmUODyyvkXP3+w
xtdx1WPG0cTpbrs9seZogEl6TyMGKp9w9mWCv2bIOJNqKanIFf8=
=N3Y/
-----END PGP SIGNATURE-----

--56QU/I0EuxCXslcc--

