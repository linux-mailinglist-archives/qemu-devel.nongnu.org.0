Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940593976C7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:34:45 +0200 (CEST)
Received: from localhost ([::1]:55720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6Pk-0006Jv-L1
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lo6O3-0004Gd-3e
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:33:00 -0400
Received: from mout.web.de ([212.227.15.4]:59441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lo6Nz-0005zg-Ay
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1622561569;
 bh=68lWrxjWUx2/2v3pRrdrYEdQ2i8mU0S2MMML2Icotjk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=GCN6tDE/ln9FR0mgmjaoBJidwPdecyBJlXLHKhYHGiIDEaj8stc9QXUHtOlpzAn8L
 1DA2NPohhwRaGxhNbP4Xf0GrXI8LosMaa85d3cgxmouLnoxJN+uor/LA+zM/SODUmA
 4zt7pZbjwUXMK9d01C7JuRUPpW0rIxuEp2YBUHNo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.200]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MNfUF-1m396Q1hqV-00OkPz; Tue, 01
 Jun 2021 17:32:49 +0200
Date: Tue, 1 Jun 2021 17:32:33 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 1/1] yank: Unregister function when using TLS migration
Message-ID: <20210601173233.3a742bd8@gecko.fritz.box>
In-Reply-To: <YLZJME3kiFe0rMRe@t490s>
References: <20210601054030.1153249-1-leobras.c@gmail.com>
 <YLZJME3kiFe0rMRe@t490s>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GUoLyyl1wm4EY.sM.1VrlGC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:yatCn/cljsS5Xj57/4U8kP0Xckdc81hTGkdfAf9D3QawX+XzqVI
 W2wRC7ffB8yu2tGxHkGEQZlNWhf6ww4cm9xeIDrYkWCOwZ++2RVuT8HyN4Rul0yR7VCZsvH
 4sD2g9EehyEycuvJ/X8gB0YV7t5BHEzgLrGhpyo60XcSDXi+v2LkuoUuh7gMsjccGLcTtQX
 9DQwne7eo1+kvu09r+Z6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GC4EgF/Niww=:Kuju3oz8nBlu2BXr+8XsT9
 s6tLQg0y4+eIOMyAPb2rjXSDTdVUKiMMbSavpEbhZ1Vztm8VSeQvTuhWTlqcKQuToxzVvj8sQ
 tisNCAAR93fTWgCoxDCPyYqhQuxwxDJKtDaJC/YnmNtQq6ogpjtw0llmf8v9Rn+0n5rnVLaln
 eCRpTdkE36RDD1dsJSs0jGfEGBxEDWlmLK3buS+emNF/2AOI+ZKZ+v2fyxUahyA+HYf7GJ0aL
 QUtIKXzcKE0iMbcWDghqX5EFUbS42XxZEHVn2TjHpLTUWsmd0PNrLM6Ip7PMIMbd6FTnD5awR
 GNekq/yX5HwNq9ONKIoV+HI/dGUQ1JvkFgLwAlw2/RVLOAr8mO9aB8PTLwIDU/AYsFcaJIspx
 z64sxEa4NYf87yb3UMS9hul9F8GT8rgiK+JPZtyyMobzFa7T+pV1Y1tQAwDvWJCmeqoscINJI
 xKvLHybT4dsTlD7WY4lDifepgU/6lbWZUJGjglFFOK8YOWgafgHkjLyPLvgO8aPDkj5g3OpHe
 gfBR0UdgKh8pzmEmWwK8jDGH0I+60hllqXz1Zj6dBD6P887edwdSrjKfCLH/Xnksr6t2Ursbo
 SjZSsPkyWex4msq8K/rhkDWP7YSDM56Oqu9cODeGnYCNvpXoHffcT9DyEV/8YQ4/6QK31b4ik
 GYrajRk1KyfwP2S/logcCHiIuH2BPlAenSBmji1PfWKq566lDgNfaZ/dHHBLUmlXu/a9WRnDt
 o6GOj+bfRkoY0AjlKFYG1xHj4VOYCYnhsYhEYHYwDt/McA9GRCgoC0Sg53VpUV/X8iE7xsnDB
 hm1cUIFfe5czTLryAhxYh+ysGcWa1TZkQvKiTcveZ1fjklGoG6TFybLAyBlbgKXaiK3N+FBzX
 610Q/KuzG7SdWD856n2+GOFFa6jshnLO9aEqvxDG0qVLVNUen2FAmUV0hmhXnnJ5rLJ06poG0
 +hJU0URlpg4rtEjTRF64ifoFj69HPl5pYJVpDn+IFymYQDQ6U41TauLnZh6KnwPiqnoO4ufX/
 IsUZ4s5UGuxxeEnGAHR5QWuvQXCXSCSlPBLQv00T6+CYkXdo4O/BMNma4Eci9KiiybeYxPoij
 v81xB9LcW8LuX5c6XkneOjTT9hKE8xpYhFv
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 berrange@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/GUoLyyl1wm4EY.sM.1VrlGC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Jun 2021 10:50:24 -0400
Peter Xu <peterx@redhat.com> wrote:

> On Tue, Jun 01, 2021 at 02:40:31AM -0300, Leonardo Bras wrote:
> > After yank feature was introduced in migration, whenever migration
> > is started using TLS, the following error happens in both source and
> > destination hosts:
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
> > Also, inside migration_channel_connect() and
> > migration_channel_process_incoming() move yank_register_function() so
> > it only runs once on a TLS migration. =20
>=20
> Slightly inaccurate I guess, as it was run once too before this patch, bu=
t not
> paired for tls?
>=20
> IIUC when we call the 2nd time at below chunk we won't register again:
>=20
>         if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
>             yank_register_function(MIGRATION_YANK_INSTANCE,
>                                    migration_yank_iochannel,
>                                    QIO_CHANNEL(ioc));
>         }
>=20
> Because the 2nd call will be TYPE_QIO_CHANNEL_TLS, so object_dynamic_cast=
()
> will return with a failure, I think (note, TYPE_QIO_CHANNEL_TLS's parent =
is
> TYPE_QIO_CHANNEL, not TYPE_QIO_CHANNEL_SOCKET).
>=20
> >=20
> > Fixes: b5eea99ec2f ("migration: Add yank feature", 2021-01-13)
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1964326
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com> =20
>=20
> Reviewed-by: Peter Xu <peterx@redhat.com>
>=20
> Thanks Leo!
>=20
> I have one pure question not directly related to Leo's patch (probably for
> Lukas?): we check OBJECT(ioc)->ref =3D=3D 1 when unregister each function=
.  In what
> case will the ref be not one?
>=20

If a return path is opened with qemu_file_get_return_path(), it will
take additional references:

qemu_file_get_return_path() (qemu-file.c)
 f->ops->get_return_path() -> channel_get_input_return_path() (qemu-file-ch=
annel.c)
  qemu_fopen_channel_input() (qemu-file-channel.c)
   object_ref(OBJECT(ioc))

Regards,
Lukas Straub

--=20


--Sig_/GUoLyyl1wm4EY.sM.1VrlGC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmC2UxEACgkQNasLKJxd
sliAfA//Uce2b/HMrIImRIm+3xCbrewBTkjVkh5eSsk4zJiQYl85Ah0w6X0Odrxi
Sc5uD3JUxfdcqa1PYwidPaLJFHsX/h2nmZiA9Pr5GDpMe9h4Df25JDBrajyKWTEH
Oelq884hXKMzLThM3+n6ZFvxpw7PxRzWUxp6CvFPoBv0EDJ7uu+mKDZ6Eu2NZ1/7
zXb2rnuDjyRJSdSfotrf8A59hrBPyUsmXIc5jWrRPhGMTOkwB5SiLmBHZcUdB/38
hXu6xRJqclh3gq78QBPJCWZyWA3NzgBUqM+goxl+ReTsFAGtG68CziL+xxU5l78y
jdCTqKoYNnU6WYT6k9n7w2VgiwE1XCKa8buoAPYFbUFvbOHfEiy/NcHamGO+B385
L4O4gfyCnxhzoto3IreOpSIBnrAc+ex11PbSO9eNMM4GflTR/SzgPlm48ize/qew
hn8gSRaq1cnTZN81ktaBVC6lhhO4oRWRh0p9g/qQuBssOE5gDpJJrIE2uX6uHogQ
h+PP+UgBOAO/AoFQO3rzzZgdYtb3Nr+ta2BxkSHLm8wBsR/cI7z+5ittLkukmR0U
kAsO+IDxAh6HwwhjCCcIaGKPcs53cAMST0R3InVZLZ/4giDJRfw1HmP3e+738v8K
OUU8UJ9s2GCVOqGNMSNaaVOugrVk0wLRoqbkPyuQab+5wr1f+yI=
=ftVd
-----END PGP SIGNATURE-----

--Sig_/GUoLyyl1wm4EY.sM.1VrlGC--

