Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8450A33FA60
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 22:17:40 +0100 (CET)
Received: from localhost ([::1]:60582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMdXv-0006N2-1v
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 17:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lMdW6-0005p3-A0
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:15:46 -0400
Received: from mout.web.de ([212.227.17.12]:44261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lMdW4-0005WN-Db
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616015735;
 bh=ajkcK2lkV7BHbIqCtjAb4KTO2AoirmeItZzGPlJwfe0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=HoWPxcdKYmkxrXthEvQ6Raatm+G9tkf4gLI+Nb3wwBXyHGf1sX7bf0TesQHRp04GL
 AlrqcIbyPsvclNeNqCmhlq3mHQ8Tyf0A8Di5bMXdRXCm/7P1sdQ2QBtFgCBUCguvwA
 veelBbKxuu2ewNkBT1WPCM1xx4Z/NZknVSMzvjl0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.38]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M9ons-1lXbri3NSS-00B4WP; Wed, 17
 Mar 2021 22:15:34 +0100
Date: Wed, 17 Mar 2021 22:15:32 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Zhang Chen <chen.zhang@intel.com >
Subject: Re: [PATCH V2 6/7] net/colo-compare: Add passthrough list to
 CompareState
Message-ID: <20210317221532.164526d5@gecko.fritz.box>
In-Reply-To: <20210303041539.1032415-7-chen.zhang@intel.com>
References: <20210303041539.1032415-1-chen.zhang@intel.com>
 <20210303041539.1032415-7-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xAPJ5Ows2irX=QokT/3g_GP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:JewIfYc/prAkZzBZlzIiAsUqon2DvMhC5/g8Nlg7FU3q8c7KTme
 8RxfxknWOZI7gsQZVokST0HVkCWl4ZbSWDPwVMa9meub/3qySFuaMrSSMURWlT4dOk/ZOEX
 r6vdJw2nWgxYyfPUcB12AgaQrr1NLtsPpI1WOmXJQZ8l/pyreyFH/TYfsHMAgFsGe4oCChl
 yeRhhiDyKXLSEi+gKM6dQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DgVX21TT8P8=:y8Lccmt5/KgT8xIqC9K0kn
 U96HjuLguCGU6Y0w1x2+KzBrAJm17eTB0aVDsOKsPLB9gvGxZmAJdxpxkv520mklNmOKF9cyQ
 t46/11mMRj5oM2UXWefUKJ7TOD8wRYo+icsD15tB+GqugIomgUT273cG4ph7x7QmmVR1NWG92
 uNvKY4QhSAFsE40gDS/2z08HzecSN16ikBCAWraULCxmVx1i1h21bpmjeG2f0U636Q4hqdKKw
 JFLmy2RxtzRkYNWcuckXJ836Er6n80dJh6YYDuYoEmw5GgkWdXUSKtthRFj8IaIJd6ettsSuO
 x/i9KJ/UGuP0X1ms/3ykyQKvmX+Iz+kiZI/mSB2DSGKRvvzFli7SNlaQ7LUPUUUd46LlLs6Hi
 9oMl/92mBF2DXdI1NKs7tRKCOJZ4VZQ+FvsAn5YHeSdJZJ6hrWRj4Zuzy/MiWSIP40cqannIX
 k8aVW7FkO44yFqHZNKm17Qf2jUOcRq8U9y6N/DiW8tVTSAJO7LeMfgvFKCtgWLPn0FnrOR+zJ
 bR6RjMncADUjSOetVvBxeyZKdvQW4Pnvw7LvddCxwcMRFpkatqwV5zXoYUoLCrwkYmkqwYc6N
 7Kzaj9b5rEtzYDylFuAWz+EWwBTVcnVZHo3BSDRn7gyIQvDQUVdHOOx8qp01ZcUZIYfbzFWGy
 OW9d4l5BIzZ8HohivuuNCC3EsHJ3d7JwbIp9py8HwZEwqzrD0iKADdgl/mGUtJjiHrcAsmQAw
 DCewLcmVtghhVGEVIPf78hr4WP4qWW/K94q4zVIqodz2oyfgqGx2+PhaT78Qiq/owWaGg+TvT
 3rk35E4FTYWYKzJqkvPsnhc0+TF8nUbMuiHKXafsPrv5RBUAIkvmn8PUbpoATfQZ45OJCGWyE
 najqMiNe8Z5etD1Z818g==
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
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
Cc: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Zhang Chen <zhangckid@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/xAPJ5Ows2irX=QokT/3g_GP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed,  3 Mar 2021 12:15:38 +0800
Zhang Chen <chen.zhang@intel.com > wrote:

> From: Zhang Chen <chen.zhang@intel.com>
>=20
> Add passthrough list for each CompareState.
>=20
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/colo-compare.c | 25 +++++++++++++++++++++++++
>  net/colo-compare.h | 10 ++++++++++
>  2 files changed, 35 insertions(+)
>=20
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index a803f8b888..80cea32c20 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -141,6 +141,7 @@ static int packet_enqueue(CompareState *s, int mode, =
Connection **con)
>      ConnectionKey key;
>      Packet *pkt =3D NULL;
>      Connection *conn;
> +    PassthroughEntry *bypass, *next;
>      int ret;
> =20
>      if (mode =3D=3D PRIMARY_IN) {
> @@ -160,6 +161,29 @@ static int packet_enqueue(CompareState *s, int mode,=
 Connection **con)
>      }
>      fill_connection_key(pkt, &key);
> =20
> +    /* Check COLO passthrough connenction */
> +    if (!QLIST_EMPTY(&s->passthroughlist)) {
> +        QLIST_FOREACH_SAFE(bypass, &s->passthroughlist, node, next) {
> +            if (((key.ip_proto =3D=3D IPPROTO_TCP) && (bypass->l4_protoc=
ol =3D=3D 0)) ||
> +                ((key.ip_proto =3D=3D IPPROTO_UDP) && (bypass->l4_protoc=
ol =3D=3D 1))) {
> +                if (bypass->src_port =3D=3D 0 || bypass->src_port =3D=3D=
 key.dst_port) {
> +                    if (bypass->src_ip.s_addr =3D=3D 0 ||
> +                        bypass->src_ip.s_addr =3D=3D key.src.s_addr) {
> +                        if (bypass->dst_port =3D=3D 0 ||
> +                            bypass->dst_port =3D=3D key.src_port) {
> +                            if (bypass->dst_ip.s_addr =3D=3D 0 ||
> +                                bypass->dst_ip.s_addr =3D=3D key.dst.s_a=
ddr) {
> +                                packet_destroy(pkt, NULL);
> +                                pkt =3D NULL;
> +                                return -1;
> +                            }
> +                        }
> +                    }
> +                }
> +            }
> +        }
> +    }
> +

Hi,
Access to s->passthroughlist still needs to be protected by a lock.

Regards,
Lukas Straub

>      conn =3D connection_get(s->connection_track_table,
>                            &key,
>                            &s->conn_list);
> @@ -1224,6 +1248,7 @@ static void colo_compare_complete(UserCreatable *uc=
, Error **errp)
>      }
> =20
>      g_queue_init(&s->conn_list);
> +    QLIST_INIT(&s->passthroughlist);
> =20
>      s->connection_track_table =3D g_hash_table_new_full(connection_key_h=
ash,
>                                                        connection_key_equ=
al,
> diff --git a/net/colo-compare.h b/net/colo-compare.h
> index 2a9dcac0a7..31644f145b 100644
> --- a/net/colo-compare.h
> +++ b/net/colo-compare.h
> @@ -54,6 +54,15 @@ typedef struct SendEntry {
>      uint8_t *buf;
>  } SendEntry;
> =20
> +typedef struct PassthroughEntry {
> +    int l4_protocol;
> +    int src_port;
> +    int dst_port;
> +    struct in_addr src_ip;
> +    struct in_addr dst_ip;
> +    QLIST_ENTRY(PassthroughEntry) node;
> +} PassthroughEntry;
> +
>  /*
>   *  + CompareState ++
>   *  |               |
> @@ -110,6 +119,7 @@ struct CompareState {
> =20
>      QEMUBH *event_bh;
>      enum colo_event event;
> +    QLIST_HEAD(, PassthroughEntry) passthroughlist;
> =20
>      QTAILQ_ENTRY(CompareState) next;
>  };



--=20


--Sig_/xAPJ5Ows2irX=QokT/3g_GP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBScXQACgkQNasLKJxd
slgYzA/+JtbfsTM+BbSOS+SztGjJ2KxSENBgkY+BFYT1Xkadd79Qf8AOuXGhWeCw
flgO6UsEa4ujP/GHR/XTtHQwDYf3OgdNYCG7Tzea4x8TEy/7pi112G7vGGU+rxc/
B4EwwPtfK34AZLL9c8CSOOpGuJzQBMqksB6V2t5419uB8h2PPwM+VsE+SeQ4xKZl
+LzCWzf7LNZdds6eULFBqDk1HfxmK5FCtvo9LeoaxhGB+3IoV4Rob4DPyAdoDX4r
G1MP0OJA4bQbzn0axK4ao1FuBhOrqB0+lnMvYtgQ4orVBvkJcMOo6JXs4pWzhsAj
OpT2rH5JWKRBw55NHWc8k9IP36j3Aox9zw4zxE0c/Dx9OF6mYwrMbbOoB9yhrrru
N0EyyZwSAvgci1wbblKyo2SIVNjImf5upcox+7NLyy7tmL4mDTe5UinDBn+aSRuS
2y/7c9lx8zqpqlN4R2smac01uM6lv/SOwcjYqx4ibhzQltUbBR41u7tsb8i5do9o
5qgyBEsWfuVTzBMcCQ1/gaTd+wD9KiTKb9+1jAcYCCf5yxdBd846biX6TkIPz0Zi
gYvJ26/+bRRZYzGHFGdITuglaacD05norHnbOeGtB2fJZWmyHjmYhDi4iBRkrqF5
aOKTbOLdEfDrMivbEIyPWr3rotHmsxKjkUemUksoiftcm7eU350=
=d71N
-----END PGP SIGNATURE-----

--Sig_/xAPJ5Ows2irX=QokT/3g_GP--

