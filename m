Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E677A3D3BE0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 16:38:06 +0200 (CEST)
Received: from localhost ([::1]:49142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6wJR-0003tX-IH
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 10:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m6wI6-0002AS-2N
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:36:42 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:59318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m6wI4-0000jZ-1x
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:36:41 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5539321BC7;
 Fri, 23 Jul 2021 14:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627050998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UhQts+8Hf/ZaIzrKL1FlvSTN9cZ2Y4FDWU7XI2krSeg=;
 b=NyvBxmrq7UUJmliZbbisw+PIJ3QpYn52aHRNzU8JcXRw7+tTlM+FbtHmdYN/gX69TZcx6O
 SdG+dK9k5+O0mKXq8rpO775kzfQq/k1//nAyRF4ZzEVqeARmDvlwkUU1b8W3XebN+/063v
 ZbTchOu5iD2XH1LTtRiqGrPRCKG6HsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627050998;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UhQts+8Hf/ZaIzrKL1FlvSTN9cZ2Y4FDWU7XI2krSeg=;
 b=K4DhnENsK0YuhARm7qTbEkwz9ymHXcvNp3cj5U5nR6/XNLMzxjO2nDItQy1HSS4p2MI5/K
 iXgE6MWTi+4x4wDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8171613697;
 Fri, 23 Jul 2021 14:36:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id IlbJEfTT+mAWNgAAGKfGzw
 (envelope-from <jziviani@suse.de>); Fri, 23 Jul 2021 14:36:36 +0000
Date: Fri, 23 Jul 2021 11:36:34 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v2 1/1] modules: Improve error message when module is not
 found
Message-ID: <YPrT8skFWqzJIccG@pizza>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
 <YPrJMTF+3lfeNdC5@pizza>
 <1dec44e9-3587-ff96-f8c4-81399f689e58@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wk5jco55MWpdojGe"
Content-Disposition: inline
In-Reply-To: <1dec44e9-3587-ff96-f8c4-81399f689e58@suse.de>
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
 helo=smtp-out1.suse.de
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


--wk5jco55MWpdojGe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2021 at 04:02:26PM +0200, Claudio Fontana wrote:
> On 7/23/21 3:50 PM, Jose R. Ziviani wrote:
> > On Fri, Jul 23, 2021 at 11:41:19AM +0200, Claudio Fontana wrote:
> >> On 7/23/21 12:09 AM, Jose R. Ziviani wrote:
> >>> When a module is not found, specially accelerators, QEMU displays
> >>> a error message that not easy to understand[1]. This patch improves
> >>> the readability by offering a user-friendly message[2].
> >>>
> >>> This patch also moves the accelerator ops check to runtine (instead
> >>> of the original g_assert) because it works better with dynamic
> >>> modules.
> >>>
> >>> [1] qemu-system-x86_64 -accel tcg
> >>> ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertio=
n failed:
> >>> (ops !=3D NULL)
> >>> Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces:
> >>> assertion failed: (ops !=3D NULL)
> >>>     31964 IOT instruction (core dumped)  ./qemu-system-x86_64 ...
> >>>
> >>> [2] qemu-system-x86_64 -accel tcg
> >>> accel-tcg-x86_64 module is missing, install the package or config the=
 library path correctly.
> >>>
> >>> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> >>> ---
> >>>  accel/accel-softmmu.c |  5 ++++-
> >>>  util/module.c         | 14 ++++++++------
> >>>  2 files changed, 12 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
> >>> index 67276e4f52..52449ac2d0 100644
> >>> --- a/accel/accel-softmmu.c
> >>> +++ b/accel/accel-softmmu.c
> >>> @@ -79,7 +79,10 @@ void accel_init_ops_interfaces(AccelClass *ac)
> >>>       * all accelerators need to define ops, providing at least a man=
datory
> >>>       * non-NULL create_vcpu_thread operation.
> >>>       */
> >>> -    g_assert(ops !=3D NULL);
> >>> +    if (ops =3D=3D NULL) {
> >>> +        exit(1);
> >>> +    }
> >>> +
> >>
> >>
> >> Ah, again, why?
> >> This change looks wrong to me,=20
> >>
> >> the ops code should be present when ops interfaces are initialized:
> >> it should be a code level assertion, as it has to do with the proper o=
rder of initializations in QEMU,
> >>
> >> why would we want to do anything else but to assert here?
> >>
> >> Am I blind to something obvious?
> >=20
> > Hello!
> >=20
> > Thank you for reviewing it!
> >=20
> > The problem is that if your TCG module is not installed and you start
> > QEMU like:
> >=20
> > ./qemu-system-x86_64 -accel tcg
> >=20
> > You'll get the error message + a crash with a core dump:
> >=20
> > accel-tcg-x86_64 module is missing, install the package or config the l=
ibrary path correctly.
> > **
> > ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion =
failed: (ops !=3D NULL)
> > Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: =
assertion failed: (ops !=3D NULL)
> > [1]    5740 IOT instruction (core dumped)  ./qemu-system-x86_64 -accel =
tcg
> >=20
> > I was digging a little bit more in order to move this responsibility to
> > module.c but there isn't enough information there to safely exit() in
> > all situations that a module may be loaded. As Gerd mentioned, more work
> > is needed in order to achieve that.
> >=20
> > However, it's not nice to have a crash due to an optional module missin=
g.
> > It's specially confusing because TCG has always been native. Considering
> > also that we're already in hard freeze for 6.1, I thought to have this
> > simpler check instead.
> >=20
> > What do you think if we have something like:
> >=20
> > /* FIXME: this isn't the right place to handle a missing module and
> >    must be reverted when the module refactoring is completely done */
> > #ifdef CONFIG_MODULES
> > if (ops =3D=3D NULL) {
> >     exit(1);
> > }
> > #else
> > g_assert(ops !=3D NULL);
> > #endif
> >=20
> > Regards!
>=20
>=20
> For the normal builds (without modular tcg), this issue does not appear r=
ight?

Yes, but OpenSUSE already builds with --enable-modules, we've already been =
shipping
several modules as optional RPMs, like qemu-hw-display-virtio-gpu for examp=
le. I sent
a patch some weeks ago to add "--enable-tcg-builtin" in the build system bu=
t there're
more work required in that area as well.

> So maybe there is no pressure to change anything for 6.1, and we can work=
 on the right solution on master?
>=20
> Not sure how we consider this feature for 6.1, I guess it is still not a =
supported option,
> (is there any CI for this? Probably not right?),
>=20
> so I would consider building modular tcg in 6.1 as "experimental", and we=
 can proceed to do the right thing on master?

For OpenSUSE Tumbleweed, when we release QEMU 6.1, I can add my patch to
"--enable-tcg-builtin" for downstream only. I'm fine with it too.

Thank you!!!

>=20
> Thanks,
>=20
> Claudio
>=20
> >=20
> >>
> >>>      if (ops->ops_init) {
> >>>          ops->ops_init(ops);
> >>>      }
> >>> diff --git a/util/module.c b/util/module.c
> >>> index 6bb4ad915a..268a8563fd 100644
> >>> --- a/util/module.c
> >>> +++ b/util/module.c
> >>> @@ -206,13 +206,10 @@ static int module_load_file(const char *fname, =
bool mayfail, bool export_symbols
> >>>  out:
> >>>      return ret;
> >>>  }
> >>> -#endif
> >>> =20
> >>>  bool module_load_one(const char *prefix, const char *lib_name, bool =
mayfail)
> >>>  {
> >>>      bool success =3D false;
> >>> -
> >>> -#ifdef CONFIG_MODULES
> >>>      char *fname =3D NULL;
> >>>  #ifdef CONFIG_MODULE_UPGRADES
> >>>      char *version_dir;
> >>> @@ -300,6 +297,9 @@ bool module_load_one(const char *prefix, const ch=
ar *lib_name, bool mayfail)
> >>> =20
> >>>      if (!success) {
> >>>          g_hash_table_remove(loaded_modules, module_name);
> >>> +        fprintf(stderr, "%s module is missing, install the "
> >>> +                        "package or config the library path "
> >>> +                        "correctly.\n", module_name);
> >>>          g_free(module_name);
> >>>      }
> >>> =20
> >>> @@ -307,12 +307,9 @@ bool module_load_one(const char *prefix, const c=
har *lib_name, bool mayfail)
> >>>          g_free(dirs[i]);
> >>>      }
> >>> =20
> >>> -#endif
> >>>      return success;
> >>>  }
> >>> =20
> >>> -#ifdef CONFIG_MODULES
> >>> -
> >>>  static bool module_loaded_qom_all;
> >>> =20
> >>>  void module_load_qom_one(const char *type)
> >>> @@ -384,4 +381,9 @@ void qemu_load_module_for_opts(const char *group)=
 {}
> >>>  void module_load_qom_one(const char *type) {}
> >>>  void module_load_qom_all(void) {}
> >>> =20
> >>> +bool module_load_one(const char *prefix, const char *lib_name, bool =
mayfail)
> >>> +{
> >>> +    return false;
> >>> +}
> >>> +
> >>>  #endif
> >>>
> >>
>=20

--wk5jco55MWpdojGe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmD60+4ACgkQaJ4wdCKK
F5b1mw/+LFQ4cHlG1cHqL7yL/0G0zV6PAGBX2rHD1FGh74ETGzcUPwy9BBfNuOrh
IHvztCEe6zoA8+puh2nP9ralyPu+qCzpds/xuST6/sfNbH9tzptlAQ1h0U4osdX8
SYUJchHNLLa4XEr6lyDYrxJ3kefTmVrsSxAzYJ/44tIiGK2NoCny3zZArLaM8l1j
zcwcIYhm98MNG3rcg1dLPhWM/q1n6QUXmWyer7shrDr/pQ4TmPrh1na6WhJw3hO9
12Yqa6BotV5ADKpQMum/DRiihqNX2hJ4C/OLZLHgHyg85koEG8JAUHlcv10UCkV9
dJ8eLCSLl1mf5EK9MQ3IrUSd9tyVQztJf7DllpW19AooJ/6h0jBqiTpgD90AVfbZ
ftA1/UcwAKTLwcP2MbpoDoBtL1EfFc1nKMjyk4RnobaHZwwVtEHcKn/r/WDGpmpQ
ORk0kFuowgrUR/2pd+XS94CoY4ehEAETmPTJ3OQ7wTIvxiFySwTk2dCGeB1RCoGs
Bh9AbWmG0sRkZm00jE/fkKOXa33WYaYS6u3pNPfENVzF/9hsk4CagQkDCT+zwFxt
7ZwQtY1EiyXoIAwC7sn11oU07KqZ4ElhwO9bsN7e2MpAOjpLi7Uqb1J3anCUIrni
2ZbXHJ3HRvI8J8kyU5hS7w+cHUZQyRZeWxkjmCIlfuB6mcbZFIc=
=TS6i
-----END PGP SIGNATURE-----

--wk5jco55MWpdojGe--

