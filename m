Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7AB3971FC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:02:42 +0200 (CEST)
Received: from localhost ([::1]:45154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo2AT-00011u-NT
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lo28V-0008JV-4I
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:00:39 -0400
Received: from mout.web.de ([212.227.15.3]:42271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lo28O-00017g-Sr
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1622545226;
 bh=zAX1P9ux0N/Hx4HJi+NLQAgybqffd8T+RAD4qlcNc84=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=jq/MnPhscar3CNiZU9TrxfRauHwV4Jsbt3j2mcNCHr9RADct+wLjBTmkHjOrLpjNN
 mA37xGnH2QGMDS9pi44SntPSOZxSyBaUVPa7M6G2dlHwk/Sd0X6XgbsGVWRVaFC0gD
 GupOp+Ef7BaqAtGUbHkXzAte4lrOYJ45/OXoOvmI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.200]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQxs3-1lzuUH0h2l-00Nx2F; Tue, 01
 Jun 2021 13:00:26 +0200
Date: Tue, 1 Jun 2021 13:00:13 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH v3 1/1] yank: Unregister function when using TLS migration
Message-ID: <20210601130013.7bde3a8f@gecko.fritz.box>
In-Reply-To: <20210601054030.1153249-1-leobras.c@gmail.com>
References: <20210601054030.1153249-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oecOvleefy5DGnoPGE_lbcv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:2t2BdWzCfrSqEMnZFYdsu9AQkUOlM5Rh7gEzHVhSED7pAKWaK5H
 p4pNjexMNfkQooLB35IhQx3WWSKpnxRxh+8p4poa7oVQBfkDEl6hxC5O9/5b4bca7ZSPrbc
 f9pMTqGeHj3UBP2FI4nlEXEHmXzDIbgYIptNWkcxOGsBxa8faxOyFcLw+2Cfs6A8id4vqNJ
 MEgYdvw5RjTb4AsxY0UaQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WrSrHOk2mlo=:ZQ8eey+GUP+MBl7U5RrMTP
 FAtYIkLyh1R/AEVDFm8v580LSllMNTS275rgH1hrsbqUjZHvcXKDcg6NA3P/+jSaBBpA7lYTd
 4TtAkEGYE7bAZOeVgJj7PaMfzb2J/r8Qq+RwHSFKtMSiP0nKY9H4KYnBqv0BhqA+EDbwRmeEO
 YbHAQ4ajrkQq3kBfIB8X3aupv4uByxov0Vy7Kputf/GBGTNQePqALhcw+vekZFoxKrymLYeBh
 bY/ldz4vBPfA5HtvokSWzGxT3zytHIxflMmHwJAb2nICcLgECxKXYAx4JXK4WuLqIaF2LmpvL
 AfyqNCMwQnkVRtGHLwg+zAdanAvQFaELcM9efQdUImSAORycA6WiJV8PZOZxpUPeIusNyeFvy
 xK6MaJ5qoKGZnHseOzMrzSSkCr+Lk9xvIuA/RQqHAg+5ZP99Y6TV2dyYmPbNWVzkfat4sRodf
 cvZhlzf3+fOjX50XjfBmEfL5VijZ23Xtm6WsiErYnO9XRwZnrpVnjuau8uFtKP2ojBWlRppJd
 Us4teiSFH/PEl0bCyrH2zUmN081C5LV1wOJ2uJU5vQqX28K2GNNukdiV3zisw0JpM96BqXIPq
 oNVw6kWeEumajYam/oQTHOJPxmiWE9qsE5FGMMJ/JMFblVuFHVS/YkBfEb1VODUx3YufDU8ew
 tqOLRVst0yCE/TE8O7/XcLf2aRwHreunCpLTUBDKawIBtSa7my/GwFnke1ZGNXXrL1TodP/oP
 9FyYkQhOVA1K7M4JwT8UeAzP/OnC6DsrtBOlVuqEow5HlTYH67trDv3FAgFWk159it9DlRKBM
 vOxPLrKwwvKH2l7Ia7UeZPdssD8jrVESpAFc/vtCzlnyqHTRQFgOuhijAc2y0v3PlJePbZhKr
 +vHeooT86MPjlJiDnmpYL8WNIoWKwooZdCX1sTSV4/o1Sv4wdEQHggMVjdZCTHf+afeR2fXaX
 K9LoAJ03NdQmOm9k+JwDHadU3G+yIWHNJueIne7OvVEhorIPp9+OdMkJozB0QatyFMGfP20XW
 KuCOxustKIqfkBTGMXL4d7POzNH8C5nMS8M9SWJJH2KQaK18GjR/VtxlEPZFhRGIy1F7bSlhC
 5thWQhpMx+tDplntJNFatLPf3IAR/6z4O1l
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
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
Cc: qemu-devel@nongnu.org, berrange@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/oecOvleefy5DGnoPGE_lbcv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  1 Jun 2021 02:40:31 -0300
Leonardo Bras <leobras.c@gmail.com> wrote:

> After yank feature was introduced in migration, whenever migration
> is started using TLS, the following error happens in both source and
> destination hosts:
>=20
> (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
>=20
> This happens because of a missing yank_unregister_function() when using
> qio-channel-tls.
>=20
> Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
> yank_unregister_function() in channel_close() and multifd_load_cleanup().
>=20
> Also, inside migration_channel_connect() and
> migration_channel_process_incoming() move yank_register_function() so
> it only runs once on a TLS migration.
>=20
> Fixes: b5eea99ec2f ("migration: Add yank feature", 2021-01-13)
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1964326
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
>

Looks good to me,
Reviewed-by: Lukas Straub <lukasstraub2@web.de>

> --
> Changes since v2:
> - Dropped all references to ioc->master
> - yank_register_function() and yank_unregister_function() now only run
>   once in a TLS migration.
>=20
> Changes since v1:
> - Cast p->c to QIOChannelTLS into multifd_load_cleanup()
> ---
>  migration/channel.c           | 26 ++++++++++++++------------
>  migration/multifd.c           |  3 ++-
>  migration/qemu-file-channel.c |  4 +++-
>  3 files changed, 19 insertions(+), 14 deletions(-)
>=20
> diff --git a/migration/channel.c b/migration/channel.c
> index c9ee902021..01275a9162 100644
> --- a/migration/channel.c
> +++ b/migration/channel.c
> @@ -38,18 +38,19 @@ void migration_channel_process_incoming(QIOChannel *i=
oc)
>      trace_migration_set_incoming_channel(
>          ioc, object_get_typename(OBJECT(ioc)));
> =20
> -    if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
> -        yank_register_function(MIGRATION_YANK_INSTANCE,
> -                               migration_yank_iochannel,
> -                               QIO_CHANNEL(ioc));
> -    }
> -
>      if (s->parameters.tls_creds &&
>          *s->parameters.tls_creds &&
>          !object_dynamic_cast(OBJECT(ioc),
>                               TYPE_QIO_CHANNEL_TLS)) {
>          migration_tls_channel_process_incoming(s, ioc, &local_err);
>      } else {
> +        if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
> +            object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)) {
> +            yank_register_function(MIGRATION_YANK_INSTANCE,
> +                                   migration_yank_iochannel,
> +                                   QIO_CHANNEL(ioc));
> +        }
> +
>          migration_ioc_process_incoming(ioc, &local_err);
>      }
> =20
> @@ -76,12 +77,6 @@ void migration_channel_connect(MigrationState *s,
>          ioc, object_get_typename(OBJECT(ioc)), hostname, error);
> =20
>      if (!error) {
> -        if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
> -            yank_register_function(MIGRATION_YANK_INSTANCE,
> -                                   migration_yank_iochannel,
> -                                   QIO_CHANNEL(ioc));
> -        }
> -
>          if (s->parameters.tls_creds &&
>              *s->parameters.tls_creds &&
>              !object_dynamic_cast(OBJECT(ioc),
> @@ -99,6 +94,13 @@ void migration_channel_connect(MigrationState *s,
>          } else {
>              QEMUFile *f =3D qemu_fopen_channel_output(ioc);
> =20
> +            if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET=
) ||
> +                object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)) {
> +                yank_register_function(MIGRATION_YANK_INSTANCE,
> +                                       migration_yank_iochannel,
> +                                       QIO_CHANNEL(ioc));
> +            }
> +
>              qemu_mutex_lock(&s->qemu_file_lock);
>              s->to_dst_file =3D f;
>              qemu_mutex_unlock(&s->qemu_file_lock);
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 0a4803cfcc..2e8f001bc0 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -987,7 +987,8 @@ int multifd_load_cleanup(Error **errp)
>      for (i =3D 0; i < migrate_multifd_channels(); i++) {
>          MultiFDRecvParams *p =3D &multifd_recv_state->params[i];
> =20
> -        if (object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET)
> +        if ((object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET) =
||
> +             object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_TLS))
>              && OBJECT(p->c)->ref =3D=3D 1) {
>              yank_unregister_function(MIGRATION_YANK_INSTANCE,
>                                       migration_yank_iochannel,
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index 876d05a540..fad340ea7a 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -26,6 +26,7 @@
>  #include "qemu-file-channel.h"
>  #include "qemu-file.h"
>  #include "io/channel-socket.h"
> +#include "io/channel-tls.h"
>  #include "qemu/iov.h"
>  #include "qemu/yank.h"
>  #include "yank_functions.h"
> @@ -106,7 +107,8 @@ static int channel_close(void *opaque, Error **errp)
>      int ret;
>      QIOChannel *ioc =3D QIO_CHANNEL(opaque);
>      ret =3D qio_channel_close(ioc, errp);
> -    if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)
> +    if ((object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
> +         object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS))
>          && OBJECT(ioc)->ref =3D=3D 1) {
>          yank_unregister_function(MIGRATION_YANK_INSTANCE,
>                                   migration_yank_iochannel,



--=20


--Sig_/oecOvleefy5DGnoPGE_lbcv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmC2Ez0ACgkQNasLKJxd
slggOBAAidh78e9Hm900ww+xVp9L8+JbBQh0AY1zup9jW7k1s5nU/Cu+jL7xJmMm
URJjjmYZFV4L/t6m/2oZA8IgdGodH4b2knl2Gjo4JwlQrRzD3yEojscLttbCKHA0
Klaz9TrPa+zENM6JsVU0AUdaN7c8r+r9sXr7/8mxFBy4gq+ejjEK2vKXsruIOIeI
q3KFdMemOvPzhh+760/c0EZ9Y86V3GL37JBpqzBhkimDQe4d5oeYmAu+LzF6J308
GGSInwvK76RGv0emoKWJaFrnivhS2qeP8Y8H3PyPYf3UuTzBjWh3UzRHo9eNSFDH
/sF8Rdi8tsEsvgAVkBd53F5chFKr3hbfz30t9+ZyzPCZm6GlPQEcF2yYWtQs1eEo
lLCuvODU2pbKCpz6M/lxXDk7gT6PsZTpS2QivCB0tpBePtFeDKpJvuRRKzb/mtVq
0W0tXuRGN+PSgOOxcHS+/dYvqCEru/visu1QiDVMmjtqVU9E1WUJeWobgyazAN8N
vJUxPksJfSAyGLgvol+Dgx8SOqzD+vJHX6quDMctjxY1zuWN/MaRwBjm4q8nPyei
3tq+jetUgRLg0uSKoH/fU4m6HxeLgeFn3pgSefW4RjdTkUWGeMtCHpSOqqFPSBH8
xFMacCius4uQAUyyZTuqWWd50lLWO8u5J7eXXhBJv6YU+Aziz+g=
=XNqS
-----END PGP SIGNATURE-----

--Sig_/oecOvleefy5DGnoPGE_lbcv--

