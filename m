Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BFC2870EE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 10:47:42 +0200 (CEST)
Received: from localhost ([::1]:53118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQRaP-0002bW-Gl
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 04:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kQRYV-0001id-AF
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 04:45:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kQRYT-0008RT-Ab
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 04:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602146740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tfK1BSi5gobsjx746TCQZvOS3597UrXPyJDRhmRpAM0=;
 b=IWe7ub6yWARFlj2aYeW5AdQGKgafVzgu2BUtDHa4ecq6dm8b0tjUwWyDlvbmsLBR/Fs4lO
 YRCaXA56bj+eSy8dAOv9N2jhWlGz6yelTfSVXG+lqW5n99L7W70yx5c/wKyy/C5fliZBBW
 +GY9qh8TpNViQWhHehVNnbwVkH7eTBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-HKg8SBmwOUylHbo5pLAyGw-1; Thu, 08 Oct 2020 04:45:38 -0400
X-MC-Unique: HKg8SBmwOUylHbo5pLAyGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 881B918CB731;
 Thu,  8 Oct 2020 08:45:37 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-68.ams2.redhat.com [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C3C75C1C2;
 Thu,  8 Oct 2020 08:45:32 +0000 (UTC)
Date: Thu, 8 Oct 2020 10:45:31 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/4] keyval: Parse help options
Message-ID: <20201008084531.GC4672@linux.fritz.box>
References: <20201007164903.282198-1-kwolf@redhat.com>
 <20201007164903.282198-2-kwolf@redhat.com>
 <609ce08c-35d5-ca85-ac15-bdbc56c28465@redhat.com>
MIME-Version: 1.0
In-Reply-To: <609ce08c-35d5-ca85-ac15-bdbc56c28465@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 01:56:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: armbru@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 07.10.2020 um 19:29 hat Eric Blake geschrieben:
> On 10/7/20 11:49 AM, Kevin Wolf wrote:
> > This adds a special meaning for 'help' and '?' as options to the keyval
> > parser. Instead of being an error (because of a missing value) or a
> > value for an implied key, they now request help, which is a new boolean
> > ouput of the parser in addition to the QDict.
>=20
> output
>=20
> >=20
> > A new parameter 'p_help' is added to keyval_parse() that contains on
> > return whether help was requested. If NULL is passed, requesting help
> > results in an error and all other cases work like before.
> >=20
> > Turning previous error cases into help is a compatible extension. The
> > behaviour potentially changes for implied keys: They could previously
> > get 'help' as their value, which is now interpreted as requesting help.
> >=20
> > This is not a problem in practice because 'help' and '?' are not a vali=
d
> > values for the implied key of any option parsed with keyval_parse():
> >=20
> > * audiodev: union Audiodev, implied key "driver" is enum AudiodevDriver=
,
> >   "help" and "?" are not among its values
> >=20
> > * display: union DisplayOptions, implied key "type" is enum
> >   DisplayType, "help" and "?" are not among its values
> >=20
> > * blockdev: union BlockdevOptions, implied key "driver is enum
> >   BlockdevDriver, "help" and "?" are not among its values
> >=20
> > * export: union BlockExport, implied key "type" is enum BlockExportType=
,
> >   "help" and "?" are not among its values
> >=20
> > * monitor: struct MonitorOptions, implied key "mode"is enum MonitorMode=
,
>=20
> missing space
>=20
> >   "help" and "?" are not among its values
> >=20
> > * nbd-server: struct NbdServerOptions, no implied key.
>=20
> Including the audit is nice (and thanks to Markus for helping derive the
> list).
>=20
> >=20
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
>=20
> > +++ b/util/keyval.c
> > @@ -14,7 +14,7 @@
> >   * KEY=3DVALUE,... syntax:
> >   *
> >   *   key-vals     =3D [ key-val { ',' key-val } [ ',' ] ]
> > - *   key-val      =3D key '=3D' val
> > + *   key-val      =3D 'help' | key '=3D' val
>=20
> Maybe: =3D 'help' | '?' | key =3D '=3D' val
>=20
> >   *   key          =3D key-fragment { '.' key-fragment }
> >   *   key-fragment =3D / [^=3D,.]* /
> >   *   val          =3D { / [^,]* / | ',,' }
> > @@ -73,10 +73,14 @@
> >   *
> >   * Additional syntax for use with an implied key:
> >   *
> > - *   key-vals-ik  =3D val-no-key [ ',' key-vals ]
> > + *   key-vals-ik  =3D 'help' | val-no-key [ ',' key-vals ]
>=20
> and again for '?' here.

Ah, true, I should mention '?', too.

> Actually, this should probably be:
>=20
> key-vals-ik  =3D 'help' [ ',' key-vals ]
>              | '?' [ ',' key-vals ]
>              | val-no-key [ ',' key-vals ]

I noticed that the grammar was wrong even before my patch (because
making use of the implied key is optional), but the right fix wasn't
obvious to me, so I decided to just leave that part as it is.

Even your version is wrong because it's valid to a value with implied
key and help at the same time.

Thinking a bit more about it, I feel it should simply be something like:

    key-vals-ik =3D val-no-key [ ',' key-vals ] | key-vals

And then key-vals automatically covers the help case.

> >   *   val-no-key   =3D / [^=3D,]* /
>=20
> This is now slightly inaccurate, but I don't know how to concisely
> express the regex [^=3D,]* but not '?' or 'help', and the prose covers th=
e
> ambiguity.
>=20
>=20
> > @@ -410,6 +442,14 @@ QDict *keyval_parse(const char *params, const char=
 *implied_key,
> >          implied_key =3D NULL;
> >      }
> > =20
> > +    if (p_help) {
> > +        *p_help =3D help;
> > +    } else if (help) {
> > +        error_setg(errp, "Help is not available for this option");
> > +        qobject_unref(qdict);
> > +        return NULL;
> > +    }
>=20
> This part is a definite improvement over v2.
>=20
> I'm assuming Markus can help touch up the comments and spelling errors, s=
o:
>=20
> Reviewed-by: Eric Blake <eblake@redhat.com>

I assumed that as a qsd series this would go through my own tree anyway,
so if all of you agree that you don't want to see the corrected version
on the list, I can fix them while applying the series.

Kevin

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAl9+0asACgkQfwmycsiP
L9bsSA//ZMIW3XHPhcip3zTQGXp1Ir4LzEHme05khchKLTnOUA2BL8EHb7ODx5AB
6ajwS1tIz1LmmgPxQlCKwXg660z5ZPfhcy6v0NBWQr09cv8TR+TwWobGWothXsMc
N3aOmc0b7iJTueEkX+w86uppYyjrnofg/8Ktul+o1lvuuLu4aSCBZxpygtdhLGMo
iSx54fiIiQSEmG7QXL6sxiGVivYDe2JvMWocXBzK76NskAPCMY3+EPR39Nd6z2FU
aIlrgvdxbCUy9USHPKEzeSYJ+9dqMvzMHts2U2VPE/gU0MJkuJtJXrx00KNIV47F
Jh8HuAZNW4x24urOCa/u3m/e9KZ5M09i64OV77v9KU+okIHho+mMv07g+ZS3CpeX
slJ8fMKgLuGmtQeuxoY4Y62ZauG4jzTXruZitUNpAxrYFir2TWhpMEw9nPJhadyD
Q2KhMJaxDk+3pWYkRZqkTDkrKEWxZXDClXW5ktp1j/DkBOLgqwfZx0XEUG3QM50v
8altKdgW3S97mi3hqCMBP2Xl45Wl6Sw0sn2IJiuIQIyg7Cr4C9CL/4Z0l7otJ6tu
nFlXuKY9t7dIvrLhrZCAzzMiHx+3hghMYNZOu2EB7YdiwgGzNnU/9Absyq+cGKtD
AShP8ow56TbbakXp2nVuqW4F0wAh7+R55Zz0b5xXcykmpugxGmE=
=zlci
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--


