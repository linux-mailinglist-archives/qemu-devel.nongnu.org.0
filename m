Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BA939222D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:38:22 +0200 (CEST)
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1EL-0005fG-EZ
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lm0y5-0005gj-VT
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:21:35 -0400
Received: from mout.web.de ([212.227.15.14]:58823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lm0y2-0001DD-Sn
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1622064080;
 bh=iXHvGbXA7tGFQho1KCVqhaNqLxu7O90quGHbyop1PTw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=qKKSa+Z+E2llN+af6C+MuexMjc23A4YC69cnpaeGtR9GeTH7+oaGWds1ttmrCBdS+
 XNZTw5ouHot4U6eV+BnZ9ESsNrz7yqrkNujQe3oqrngX14dwkMvYSlz0spO/vstgvL
 0W1SMQHrKT3YW6OMfyNI3i6nFeJd9sJt05UoYL54=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.235]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Ls92l-1lHvjj0Npv-013rMG; Wed, 26
 May 2021 23:21:20 +0200
Date: Wed, 26 May 2021 23:21:03 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/1] yank: Unregister function when using TLS migration
Message-ID: <20210526232103.39e2a7d0@gecko.fritz.box>
In-Reply-To: <YK6yQ9EVNlVPDMaS@t490s>
References: <20210526200540.1088333-1-leobras.c@gmail.com>
 <YK6yQ9EVNlVPDMaS@t490s>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ue.jSvxYCJTWoyHnLgHyBQo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:VYMaADCL+rP0KZ+SWXG8Qi4LxGdrfkqjSGUV7KCO4AoiV9X8jUa
 gekP7Zp2KiU91tTiNcWvkq+Uxc17YgisdS079NULiS4N30wk65m0A13NnY4FVyO+TqZJNQ1
 28U2zpQmOOQPnirKQttUFuJnGxS5B+xXLCzm0vSDM3Os6404xqpgfTvV4AOM8YCoAT76UNy
 SuVpFqivAgY7pzeM3A5sw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2aaFnz11leg=:BPl0pab7c8wJqgUOecM2d/
 3tXBZlv2z2nx/XhuYkzfZeASBFCOzruBxuMDTb9WmQurfNnNpcE7QgKCHC5OfTA/KqdZXgkx2
 G2uRDa5ibhl4NwxW6w8ni3uySSzg/SkNTo+P6PfzIMgDSayn2EHeS/IwEmRfO7SXZlN4xm/2U
 prUConQaij1zTs9mDu+u+HrnitSOlanzWtgKfsiM9j6G1yDQKLl0zrb2Enm+OokYJirAgiWWw
 HqabFJ2+wB25DRswfJ2Hnjx0/Gq4AOftG8aFYmvOeriqxR2DVSADyiKkdT0pUCWEFsxo1cqA8
 Qv5p9JXdC3L63qBojLmm6g5VrYOVQh90RAlP56k1Ra6P7HSg06563/vRqdlrG3ESgnm5G1AxY
 5MakIot8EIq2p036SpMVI03u8B+QQsUb/nidZnOj1z30I9sbqEQiVP3YZIjAR5kp75Vt5GJ2C
 0rqqbL0zpG3OnFtPD2z94t92yo1dC2I3QCuhBw84eugh4T4gtOGKQG0x1Adfnf1lvEYcdjIC2
 RwCIBG4/pmYoTSgYr4mQNrG5WsYR8gFwDlMvRDTxE52Kfnlpb5OZZZGTC6sGUN1lGxtUwk4r4
 q4Oa4Pz1xhu5qcAS4JmQ2nsAsL8YBFJmUR0kUQnlbDaoxfI5i4KNymAoyuXQJnKhvEw/iZopR
 0Oyl4IIQqS8TuTaGzDW9slX0xi7bJe8Qaom4Wq2Q7Ho2TlIAua6t34EZtg0iQV3vB5Nho+MvC
 C23CHpZacrDgjsmhoBJAhhJ4J0lz4z+utTFaRm3jdJJthRCcKsIZ0DHvjFVu2yYbrv94bcGeE
 sEn9iijeRuhsNSbPGEShayA6UyOh3nVA8mZa9YCU3YP5W18T5zaC6AjS+cN5fKFFTS1i4boLS
 z5K1cDAjCLt8n0/R+Tv4xwDre8xObqoWolSvyagIQBWv6b6v05r3cXESQ5fwAH3je398MEgiz
 URjAWmgEtC9bDvT88ItsnwvHUCPreFU97uardhfNYor4FVVDFFvwfRtOcIkRldZoyjw9tcNcP
 9/f1+z6YTqzuLPlrk1KG9h/9miSA5nb/wMY+ZFGuDIFblyFT4GZ6mvk1Ikm4ew5VbZbEcenJb
 Y+ymVn+X1ggAnyl0fmOHTxTVntGOV2A+prY9Yjc1nGeLkTrva6yXPFm6E60a9u173anph/V5F
 97UwHkTWq+76mmgaC0CmXGIawj+eeWX9xwqFIX75sqA57rxWUkS9zNg0FyEklErScc3J0=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras.c@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/ue.jSvxYCJTWoyHnLgHyBQo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 26 May 2021 16:40:35 -0400
Peter Xu <peterx@redhat.com> wrote:

> On Wed, May 26, 2021 at 05:05:40PM -0300, Leonardo Bras wrote:
> > After yank feature was introduced, whenever migration is started using =
TLS,
> > the following error happens in both source and destination hosts:
> >=20
> > (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> > Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> >=20
> > This happens because of a missing yank_unregister_function() when using
> > qio-channel-tls.
> >=20
> > Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
> > yank_unregister_function() in channel_close() and multifd_load_cleanup(=
).
> >=20
> > Fixes: 50186051f ("Introduce yank feature")
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1964326
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com> =20
>=20
> Leo,
>=20
> Thanks for looking into it!
>=20
> So before looking int the fix... I do have a doubt on why we only enable =
yank
> on socket typed, as I think tls should also work with qio_channel_shutdow=
n().
>=20
> IIUC the confused thing here is we register only for qio-socket, however =
tls
> will actually call migration_channel_connect() twice, first with a qio-so=
cket,
> then with the real tls-socket.  For tls I feel like we have registered wi=
th the
> wrong channel - instead of the wrapper socket ioc, we should register to =
the
> final tls ioc?
>=20
> Lukas, is there a reason?
>=20

Hi,
There is no specific reason. Both ways work equally well in preventing
qemu from hanging. shutdown() for tls-channel just makes it abort a
little sooner (by not attempting to encrypt and send data anymore).

I don't lean either way. I guess registering it on the tls-channel
makes is a bit more explicit and clearer.

What do you think?

Regards,
Lukas Straub

--=20


--Sig_/ue.jSvxYCJTWoyHnLgHyBQo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmCuu78ACgkQNasLKJxd
slg6fQ//bJ40k2C+vQD6MWsone1CX2e+mRFOhYx9H5jS4tcG9TjlxCjKc2qow0bL
UR7GGO1Ebd9oETJ8mpVVyRjjyM31Y/hxhh2MWdYm6wpi5Pn1xfGfLdfv5zyamP9/
SDi+TXDNI050QvmtXsDRnyeKReHgta+DxroCBe1XqKpprnHqDcJb1TA3AVnTt4dM
V3XljzGVRAp6t3zRm7cYuHoJGxPv1et+bymwawM6v960BBrrIMN1fqou5ACDy61A
xgeGDEVj7PtU82+e4oCS4Wt+/RHKdbHaoeW+OexTYLBU5mIiuiCqKe/gOB3/kKPp
//HuxfiuGIVZVBt1ivP33h0gS4EgfcTeBuWtFhgb2zroDo8xlnzdPtEuFuPR9zn/
dmJ0NmenyS5BCZoYTrlfaEA3glKu67i74mdsxIB/ie8mdlEwdpJMbxd5V2gt+slJ
3TkgPPhez/Y6JZHDYu3CL8RCjcBPp666JTmqbEwkFvDR7rodxrlC5Fv+E+uhgujx
Hpnv69FeZBfgY8MMOZ/jSNVZWCEVGkfNxh7PF/mmpfUct/BVLG5z/xWZNZW1WP9/
DG7DLCeLxr8Te6tg6ZPilpT1La/YImmYtlIkq6785a4d1EksKuIbyo6mymkVDtwV
Y0bW3ROyecmkQ4DlC0wpLUbJbQd/9YJYIVNK9e0LpaSdemQE7KI=
=imj/
-----END PGP SIGNATURE-----

--Sig_/ue.jSvxYCJTWoyHnLgHyBQo--

