Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563C2386570
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 22:08:56 +0200 (CEST)
Received: from localhost ([::1]:40252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lijXr-000753-A2
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 16:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lijWQ-0005sR-RE
 for qemu-devel@nongnu.org; Mon, 17 May 2021 16:07:26 -0400
Received: from mout.web.de ([212.227.17.12]:49515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lijWL-0005t6-Tp
 for qemu-devel@nongnu.org; Mon, 17 May 2021 16:07:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1621282026;
 bh=8mPPcAu7xTvLGkK7kRsXFI2vmSyQ8IpmIfRoO2j267M=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=EmG2Xnlayted/WiLdbvwZCpaEeCWwQ2f14HfI2KF8MKuE+GNvA0UlBg4kCmE+3iko
 gaBgmx7oiJX9W2csWvtE3fmZlj837NATsukhfYqW8c8r4rgaOdZ6k27tKMKaNd3fkM
 9haarbDU++ui9hZyUdpC5PkDEDZQ9Q/FmtKgmhLk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.102]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M7KZO-1lVtMq2fTy-00x0eu; Mon, 17
 May 2021 22:07:06 +0200
Date: Mon, 17 May 2021 22:07:04 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH V6 5/6] net/colo-compare: Add passthrough list to
 CompareState
Message-ID: <20210517220704.50f86bfd@gecko.fritz.box>
In-Reply-To: <20210420151537.64360-6-chen.zhang@intel.com>
References: <20210420151537.64360-1-chen.zhang@intel.com>
 <20210420151537.64360-6-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.Ll/HiAbWag_Xg2L/YMbhGH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:8TyjMYcVP5xujUCL+eHtdJKJtdHijaRiLjgoINvVVDY8QcxmuPT
 iztutUKEXpTfmz5NM0f3hHKv4HQMGHEtDuNqaEWAGoEIbyjdeCQ2a4zSZOvYfVTJlsSH/dT
 pQASmTq47MvuB+CV4l+cr0fWvVgYFuaDx0qWPhMArpHg9T8K96NvyApAIPocSvfIGpXa9dB
 ZrvhlaWMEbRcUgRPDnk8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qmu6qW169aY=:3C/Efh/AkWbInHQF+njNEV
 3QRMdyW95uvxsarPU45WnVzd4GG8Cov1b1uaNYcoimE/5VM5CCnWgyXUGWacYtzNxQ7sTifQs
 B0lajXwoCQ0agYY6ZDizR4AcncIyS3UlYMfd3TVkh7hG7J5vKpziM96J0+c3/9ONAATx1csZ9
 YKMPGwFdEmINIEOodqduIvZ2VdEycOXkKUgqtE8R3nl6tBrOyCsn3ie13egV9kHKpyu2FucsQ
 YBeLJOmNaZzfsgj2s9IgTQ976zrDyv8CGRCoFVVOtgXFoTpUFKadPNV0N1cz7rlZ8BaIZ5Pvh
 Exu8GC1L6xb9DUw6W0iXdTtcOmFMS7os8O28bleXJXrclvB4OnH7EPHmmuce8M1iMoOLDS1Ff
 UallSf4d3JltNOYv9Z9n2un3qHkChAFYE2YfPbTOQ7Ii241UJj5htQQ5xD5L3/n+Zwn3tmxhT
 u4+dpEbxr7ipP7ARMve3pC7c7enqEcNeK0moxleADRr0B1e12/1JHsumXy9EFb4nT+K6Xsw1+
 gGMyau4bCbUf6cR4x0fEG6oiiLztWP74YTkyNkSmMpbE5/T8YYKT4a163Ij0RByh22J3+fXam
 1lwAYBtI6jsaTzZ5XEVjSLdGnHVmjrqf3gL70kS2PpQo9P2a+a4aeHvIpSdrwvpsPjwOi74kD
 izcf/4PsWBBpml0O4Zivw68IP87jrc/cirAAbC/ZLOWVNajPGkdMd7OnwvtOgg5Am7LwF2R4+
 EZaB2KbjHmpLjzDH4AJtVJLL8nTDfdGlRs5McIRT8rxEqiyKKUuY0qoH/xG8j8Ri8mFJ4Gy+R
 Nz7hFKARz6EyfweLOWZl0aCuMa1+a/aoA2i9y7IQTr4g5ta8XJa9uuITddrVaif38VAvcSwU7
 F9gIE/0V/WjRakaa6T32j6eTWEGjUaiOBXNZfwu1iiq0jQaf5R9+fLxeiNOhoP6Wd2DTLB4B8
 jkU5aiDvm911uwz/fj0SJJXUgUDOE3aEZepfPHopVju+DVKPKXhvvrerVZyKdrwjbx3/Isvqd
 d9qthUg4w932hPIwfU9uas1DdpUwwihydYrtSQSOG0F7BrMmy/cS4DKxfZvegSY+AKb4SFWn/
 ZZdeIP8MjubCSEozb4R1tP1M5cnutSfol3JfOA/dPPImpoXNTs/62Gwze4Iqu/6+CQ8wfr8g2
 HoyHINA5M9LcmyKVAYElDEhGZwZCGcNXOX3d2sez9/Fm6ILP+fiCTybWDyGP7nY4sAnBI=
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
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/.Ll/HiAbWag_Xg2L/YMbhGH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Apr 2021 23:15:36 +0800
Zhang Chen <chen.zhang@intel.com> wrote:

> Add passthrough list for each CompareState.
>=20
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/colo-compare.c | 28 ++++++++++++++++++++++++++++
>  net/colo-compare.h | 12 ++++++++++++
>  2 files changed, 40 insertions(+)
>=20
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index b51b1437ef..7109e2ed30 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -141,6 +141,7 @@ static int packet_enqueue(CompareState *s, int mode, =
Connection **con)
>      ConnectionKey key;
>      Packet *pkt =3D NULL;
>      Connection *conn;
> +    COLOPassthroughEntry *pass, *next;
>      int ret;
> =20
>      if (mode =3D=3D PRIMARY_IN) {
> @@ -160,6 +161,31 @@ static int packet_enqueue(CompareState *s, int mode,=
 Connection **con)
>      }
>      fill_connection_key(pkt, &key);
> =20
> +    /* Check COLO passthrough specifications */
> +    qemu_mutex_lock(&s->passthroughlist_mutex);
> +    if (!QLIST_EMPTY(&s->passthroughlist)) {
> +        QLIST_FOREACH_SAFE(pass, &s->passthroughlist, node, next) {
> +            if (key.ip_proto =3D=3D pass->l4_protocol->p_proto) {
> +                if (pass->src_port =3D=3D 0 || pass->src_port =3D=3D key=
.dst_port) {
> +                    if (pass->src_ip.s_addr =3D=3D 0 ||
> +                        pass->src_ip.s_addr =3D=3D key.src.s_addr) {
> +                        if (pass->dst_port =3D=3D 0 ||
> +                            pass->dst_port =3D=3D key.src_port) {
> +                            if (pass->dst_ip.s_addr =3D=3D 0 ||
> +                                pass->dst_ip.s_addr =3D=3D key.dst.s_add=
r) {
> +                                packet_destroy(pkt, NULL);
> +                                pkt =3D NULL;
> +                                qemu_mutex_unlock(&s->passthroughlist_mu=
tex);
> +                                return -1;
> +                            }
> +                        }
> +                    }
> +                }
> +            }
> +        }
> +    }
> +    qemu_mutex_unlock(&s->passthroughlist_mutex);
> +
>      conn =3D connection_get(s->connection_track_table,
>                            &key,
>                            &s->conn_list);
> @@ -1225,6 +1251,7 @@ static void colo_compare_complete(UserCreatable *uc=
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
> @@ -1237,6 +1264,7 @@ static void colo_compare_complete(UserCreatable *uc=
, Error **errp)
>      if (!colo_compare_active) {
>          qemu_mutex_init(&event_mtx);
>          qemu_cond_init(&event_complete_cond);
> +        qemu_mutex_init(&s->passthroughlist_mutex);

This initializes the mutex only for the first colo-compare object that is c=
reated. The mutex has to be initialized every time, as it separate for each
colo-compare object.

>          colo_compare_active =3D true;
>      }
>      QTAILQ_INSERT_TAIL(&net_compares, s, next);
> diff --git a/net/colo-compare.h b/net/colo-compare.h
> index ab649c9dbe..7ca74de840 100644
> --- a/net/colo-compare.h
> +++ b/net/colo-compare.h
> @@ -23,6 +23,7 @@
>  #include "migration/migration.h"
>  #include "sysemu/iothread.h"
>  #include "colo.h"
> +#include <netdb.h>
> =20
>  #define TYPE_COLO_COMPARE "colo-compare"
>  typedef struct CompareState CompareState;
> @@ -54,6 +55,15 @@ typedef struct COLOSendEntry {
>      uint8_t *buf;
>  } COLOSendEntry;
> =20
> +typedef struct COLOPassthroughEntry {
> +    struct protoent *l4_protocol;
> +    int src_port;
> +    int dst_port;
> +    struct in_addr src_ip;
> +    struct in_addr dst_ip;
> +    QLIST_ENTRY(COLOPassthroughEntry) node;
> +} COLOPassthroughEntry;
> +
>  /*
>   *  + CompareState ++
>   *  |               |
> @@ -110,6 +120,8 @@ struct CompareState {
> =20
>      QEMUBH *event_bh;
>      enum colo_event event;
> +    QLIST_HEAD(, COLOPassthroughEntry) passthroughlist;
> +    QemuMutex passthroughlist_mutex;
> =20
>      QTAILQ_ENTRY(CompareState) next;
>  };



--=20


--Sig_/.Ll/HiAbWag_Xg2L/YMbhGH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmCizOgACgkQNasLKJxd
sli4Rw//bIFMRB8Dtl+bdkEYVRaLIkncT0lBbMvyRs0nGsIov1oM4O7BJ9jRbr9o
y+WRDdVK1UwJqZ1sHLN2vjWzS6YFzm846yi0EYvDe1wwL5N2fzAV3JWApDdqLFi1
IDPjgDGHHcGUMZUgpTzZZOp8K67T/CHdTl3KZtDB9uvgUQAKxnD9O6bgi4hDpJDc
fe/GsKstZHvQ+bEq9b7p+lG6TCU+f10Y6HMcEJStH/HjSqeIgTdY0lMj8r+LOZy9
nLoDd0JTS6NkzONboidfoQj9M7ilgxScWl3IcbGBnN4CA6jpQuZGkGIU1egGiWkp
EQmJztWY01+/yTbRGYRBW0okOf8BP3fo8OXkG8TIYY2vynrO9G1vh4wvRWlaDvyU
i6/j+ts7t5CbP7uSuIj91H2YlDYkIm7v2xKoEshdRTrVh9wd9DhJH1tFwAmsAJEI
2CibBTbIVrLyZwwgJUyuHoD5Pc2zCgoiuwKDSfGc8Y0TXA/qiTMHFI3u0m+4STiJ
Z+A13TWlEY5fDcX9aRm1mezXGQi3mmbDe7hOo3CEVO6UY0GSOLhPBEFO0Ct6PbNf
zQzhBS235COm31UV6nRZVMa6uuH79yPnMZUanmIH9bZxy7D6KY+IwIok/AK/5MVU
ZACUmSOERI360zPM/BL4lQ+hhYza3ty6O45uOlQTAqeJuL4yZig=
=4OyP
-----END PGP SIGNATURE-----

--Sig_/.Ll/HiAbWag_Xg2L/YMbhGH--

