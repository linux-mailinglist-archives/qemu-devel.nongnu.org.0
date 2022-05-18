Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0B052BB59
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:09:27 +0200 (CEST)
Received: from localhost ([::1]:42812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJQb-0003bM-To
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nrJKL-0006id-VC
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:02:59 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:34224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nrJKJ-0005xh-Ft
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:02:57 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 311781F8C9;
 Wed, 18 May 2022 13:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652878970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nf8R7PdhHe+kNdclTonqhAMEjif0bYO3f2nc5hqZzWw=;
 b=mYvSanaPs9Ok35HK3cYv10r8yuTwlHhUeO0kFFgbbDUqwHd1aRqSaZP75gXXvAzCrghIAN
 WRk0x7ykOXlPy0NU797p0Biypap3OXt/x6CGeSyCHG+6vL7Ek0CNC2utZgf/qe+FaiLYne
 PMJGcjaDyS4yOPiOQAPaAEDUP9bITy8=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D397513A6D;
 Wed, 18 May 2022 13:02:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Zh+MMHnuhGLRAgAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Wed, 18 May 2022 13:02:49 +0000
Message-ID: <843da9ebf73d89a5084d4e29d972fdaa8b79bfae.camel@suse.com>
Subject: Re: [PATCH] hostmem: default the amount of prealloc-threads to
 smp-cpus
From: Dario Faggioli <dfaggioli@suse.com>
To: Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: dzejrou@gmail.com, qemu-devel@nongnu.org, david@redhat.com
Date: Wed, 18 May 2022 15:02:48 +0200
In-Reply-To: <20220518121716.658ec569@redhat.com>
References: <20220517123858.7933-1-dzejrou@gmail.com>
 <3994597b-c559-f62f-504d-3cde3493b713@redhat.com>
 <20220518121716.658ec569@redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-nUf+24jUPUdaQ0elcIZb"
User-Agent: Evolution 3.44.1 (by Flathub.org)) 
MIME-Version: 1.0
Received-SPF: pass client-ip=195.135.220.29; envelope-from=dfaggioli@suse.com;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--=-nUf+24jUPUdaQ0elcIZb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-05-18 at 12:17 +0200, Igor Mammedov wrote:
> On Tue, 17 May 2022 20:46:50 +0200
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> > > diff --git a/backends/hostmem.c b/backends/hostmem.c
> > > index a7bae3d713..624bb7ecd3 100644
> > > --- a/backends/hostmem.c
> > > +++ b/backends/hostmem.c
> > > @@ -274,7 +274,7 @@ static void host_memory_backend_init(Object
> > > *obj)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 backend->merge =3D machine_mem_merge(m=
achine);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 backend->dump =3D machine_dump_guest_c=
ore(machine);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 backend->reserve =3D true;
> > > -=C2=A0=C2=A0=C2=A0 backend->prealloc_threads =3D 1;
> > > +=C2=A0=C2=A0=C2=A0 backend->prealloc_threads =3D machine->smp.cpus;
> > > =C2=A0 }
> > > =C2=A0=20
> > > =C2=A0 static void host_memory_backend_post_init(Object *obj)=C2=A0=
=20
> >=20
> > Queued, thanks.
>=20
> PS:
> There is no good default in this case (whatever number is picked
> it could be good or bad depending on usecase).
>=20
That is fair enough. What we observed, however, is that, with QEMU 5.2,
starting a 1024G VM takes ~34s.

Then you just update QEMU to > 5.2 (and don't do/changing anything
else) and the same VM now takes ~4m30s to start.

If users are managing QEMU via Libvirt *and* have _at_least_ Libvirt
8.2, they can indeed set, e.g., <allocation mode=3D'immediate'
threads=3D'NNN'/> (provided they can understand where the problem is, and
figure out that this is the solution).

If they have Libvirt < 8.2 (e.g., people/distros that have, say, QEMU
6.2 and Libvirt 8.0.0, or something like that), there's basically
nothing they can do... Except perhaps command line passthrough [1], but
that's really rather tricky!

So, I personally don't know where any default should be set and how,
but the above situation is not nice for users to have to handle.

[1] https://libvirt.org/kbase/qemu-passthrough-security.html

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-nUf+24jUPUdaQ0elcIZb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmKE7ngACgkQFkJ4iaW4
c+5vQw/9E0Eh6s2MRFmxFXT/Lrd8wFoLs3pf0Jak50oEbmR0DljXPlurGpYQAiKM
qnB39rba+zOxKsd4b+nnAlRX7rh0vWiuHKcAsn3csTjmsPr/dkgLoOKlmIoWl9OB
xsgTxE7ydDDbMTxbXRE/u84QNQub5eyda/wKgKeRNU5OZprzyktC2CGyO7sW4hzF
ZJVgViWLCcx/HuAN3WApdtTXd17Lqd70SGKQnbEXv/DqFkHYWbkGCKc57VAiprxt
w+AkPOxrUvGUnn7BaoMu0uiJhra7FFxKOFquIdtA5zF8ta2z5xGPJ5eElvsdQVpT
2pGUyqI4FuNxv4nT2uiGIQdoBiswpjaJsgU8Yzx96hLQgkTts/Rw/kgGnRQ+2U/8
kHiTZajpyU7/ExDTLLBFpiRRj/y2LrlhIFAPIT4cSiZ6VMH+EVshuXXSlcNYahkQ
98UQWdJxyM8KsD2RkYOhffPsXaAYWLDFjYgt1cjShMzpqpdz4amgT+Jp5a/5ysF9
RQTz13GJSf69yPRrKD6O92N9ZGl4VYVAzy24Wrw+ULZcJimXavjpqoVbAlEauBeh
x/ZLE7lkIi77xlGpVh4LM3CqabZe2WAsRDsxV0BT3QeewIFS0nCrEVWQS+dE3M14
hXcysv7i8+9XB1TKuLti5qRi0ZvXrpmPxBgc3i/PmudCkZmqf/8=
=46sc
-----END PGP SIGNATURE-----

--=-nUf+24jUPUdaQ0elcIZb--

