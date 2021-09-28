Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB4741B183
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 16:02:50 +0200 (CEST)
Received: from localhost ([::1]:35724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDh3-0004Ee-Ji
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 10:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mVDYk-0003kv-Mo
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:54:17 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:40886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mVDYj-00057P-28
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:54:14 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B73AB1FD6E;
 Tue, 28 Sep 2021 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632837250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ECmuK5KquJiwAKh5lb5mnfCxsbc2VGZ9gAgYLJby4Tc=;
 b=0KTV5qGXOONcYTV+cEQ0jcDZb2Q/qf/SuZiJUFmne65tGWxbs1Ack1+b6sLMl+6KHJvxD6
 npLFKV+Umq7zOvhFiuK2onQbe/6uUOzFZAFQN62D1tKE76wY/67hKprx3kwVQk3WATwr99
 6IQ082xxu9V2b4ZAtwcp+9O4z9Abr98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632837250;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ECmuK5KquJiwAKh5lb5mnfCxsbc2VGZ9gAgYLJby4Tc=;
 b=mfhDiFk4NRIilLMDJA2bJ62QRN+DoP2cynGoQsEjA0E4kbu5jT2J9ZUIQScvGv1CvlVsCT
 TInyLU8VosPPhPBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64A6B13CCC;
 Tue, 28 Sep 2021 13:54:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ewpPCYEeU2GoOgAAMHmgww
 (envelope-from <jziviani@suse.de>); Tue, 28 Sep 2021 13:54:09 +0000
Date: Tue, 28 Sep 2021 10:54:06 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 0/2] modules: Improve modinfo.c support
Message-ID: <YVMefnvHATyjBChA@pizza>
References: <20210927141201.21833-1-jziviani@suse.de>
 <20210928050628.l344ydhuzr25rsox@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Q8FHhblit1Yuuiwz"
Content-Disposition: inline
In-Reply-To: <20210928050628.l344ydhuzr25rsox@sirius.home.kraxel.org>
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Q8FHhblit1Yuuiwz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello, Gerd!

On Tue, Sep 28, 2021 at 07:06:28AM +0200, Gerd Hoffmann wrote:
> On Mon, Sep 27, 2021 at 11:11:58AM -0300, Jose R. Ziviani wrote:
> > This patchset introduces the modinfo_need and changes
> > modinfo-generate.py/meson.build to generate/link one modinfo per target.
> >=20
> > modinfo-generate.py will know, thanks to modinfo_need, which modules are
> > currently enabled for a given target before adding it in the array of
> > modules. It will give a hint about why some modules failed, so
> > developers can have a clue about it:
>=20
> The approach looks good to me.

Awesome, I'll apply your review and send a new version.

Thank you!

>=20
> >     /* hw-display-qxl.modinfo */
> >     /* module  QXL is missing. */
>=20
> You are using kconfig symbols here, so the comment should say so ;)
>=20
> Renaming modinfo_need to modinfo_kconfig will probably also help
> to make that clear.
>=20
> >     /* hw-display-virtio-gpu.modinfo */
> >     .name =3D "hw-display-virtio-gpu",
> >     .objs =3D ((const char*[]){  "virtio-gpu-base",  "virtio-gpu-device=
",  "vhost-user-gpu", NULL }),
>=20
> Hmm?  Leftover from an older version of the series?
>=20
> >  - accelerators can be filtered as well (this only covers the device
> >    part), then the field QemuModinfo.arch can be removed.
>=20
> It's target-specific modules.  Although accelerators are the only
> in-tree users right this is not limited to accelerators.
>=20
> take care,
>   Gerd
>=20

--Q8FHhblit1Yuuiwz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmFTHnoACgkQaJ4wdCKK
F5YRsg//ez4jr0k3JUBpdYKzy4FKTSJ61Yc6tDckSfE1grRjj0c+JF4UO81k1H5u
JJgBiEf/3tRrNZu00SIxrbjXUXi4Um3ff+Q7qYoaw5Q9Fdg7SUCKCooXVhmwHGhe
qo82h9+w+TCXYn/aHeLMjnSkhpsb+rTq34XVwcq7S26qXwg8jHUfjElzrAY+8cZN
XHeY94pCUuZFQq+FOpdm/tnqbbFsn3CWcbGub86onb514RbQ8BQtzL8HNlggY28r
mQSGmtxzOd3tnTilHZGmoSbRMOIIhIsq8rn7a5979ybtBSzQ68hRp1beN0gCuZor
Nk5+c0I8hjmPnaliAuOvIODmnWpwBHCK1eyCct2SwmZPv0da+tNZpLigs6e5unGq
MrwkiYkQlC6rOCCpX3ZghfRkd+6qT1mKFy8pYx/acyodvD0oLSvTr6gwS+yy3Xcw
YHQ0Ie+fh6Z2QlBbRysXcXbXlPxuQR/4iiVV+Q2aK3Ij3bU4x9Wsdp4jRmLQDXiX
jrr3MzE+hh/USS1pIG0eiQYSIckxPqceQjgBqtKfhP7ZOlJYZITPGmyf6wcmVGsr
jYnIs1kKZKVAB6lYRUDsSfghNhcniwt6mbvR8W0jDQkHQy0ZQ2rfuzsq9YeAu6PK
VpRt2vZaug/FLFo/oYtIomH27+oEwb6ofCwbhyj/h6W2/wBGz3c=
=lu/b
-----END PGP SIGNATURE-----

--Q8FHhblit1Yuuiwz--

