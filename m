Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515282FD9F0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 20:47:45 +0100 (CET)
Received: from localhost ([::1]:44432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2JSB-0006xl-RV
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 14:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l2JQK-00061g-2l
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:45:48 -0500
Received: from mout.web.de ([212.227.15.3]:33999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l2JQ8-0000O3-7g
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1611171915;
 bh=2vWkD/Jo/MF2d5z6GJHOjpE2aYn5aFN8jF2sDj6tTtQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=GQ2I3dvu0jU3S5i+xy4eaN45Oy6LYU6j3s3W7Y0KHgLAlKAVqwRZ73AY/f2u7kMpq
 wIc958nhGmudeCkShFuRsTkknBbiauQf/Cbylw3aGCBINZxJF00t6ImzGgheBEE6yE
 PEr3MnuWU3BuoI6OQi7eAC96/Gy6CFZOu00rjNDM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.127]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MduO5-1lNZIM0zUb-00PaMj; Wed, 20
 Jan 2021 20:45:15 +0100
Date: Wed, 20 Jan 2021 20:45:04 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: leirao <lei.rao@intel.com>
Subject: Re: [PATCH 05/10] Optimize the function of packet_new
Message-ID: <20210120204504.7f54ad80@gecko.fritz.box>
In-Reply-To: <1610505995-144129-6-git-send-email-lei.rao@intel.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-6-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8B7pKuOTxY4YnaEU1ZzV.A1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:y0hQBMknaiyPafsniFYR1ISCrF5JIjx8RvTp4TK5C8UHog9X/sG
 T/e4vOOO5jOdW97tSqVOGBmn1es35JmbxjmVMIiNg5TFgEtOJNsOC3aG4l5iGKY7Od+ds1s
 vKdwuxk5jpf8Z4fU2034CUPumY+HLzonzb6xa3SDFnpNoYzg8jp2z96UxK3W4jxedLfyu8L
 3Vwpzhju2m6vuTy7bbfYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sTrtoLOSFWQ=:4pWm8O6ODYAL/hFAW3LgYD
 RWKhXI98aqyC44QGe8zDsjBJ1hH8vKWpQPs29EhPP20hsXeET2iyA6eeoRjH6EoYZyfjmNJ9k
 JlfJAlJZTy+hKnxFK7p5lgsGJQutBXS0hanFxcZbasntalJLlgbOkzcJ9DRXK1KEkNptYnG89
 3RoOegOFUvEumCTcFtuG+HGekhikLOKMKonEg7uI3gi0l/SawYkECBAfC3GlI4P064FoOSYbX
 gr6UGKPHvlw6UKW9lAkDB31IjaptQ+cnq6WsUOPwdryGI1ODr2Sj8WyayyC9XDn6sZXjPxvNR
 HjNdpf1FP/+6nw3O4RQpDVfYc8mvKXOQRxkbECdBiI3+ctxXk14WH4ZgUs+ssdVjk+3/BK/E6
 8JatLQzRpLKRclVZfn0YvbkpRzg3TrXrVfilqeb9Fj2Fab8sAGvjuI+GZwQ3Q0MI98n4kLHF0
 eZOH6Y7JEsDLpBg1kzyveiARk7KhjQhHz+2qp/7RQZuktQ89Q1/vN3gb4d7u61DCACPi//KSl
 mwnTQvfzn+ozqLIA+yxMR1PtsX1LdZXLQ62GDqgOnt7apyqgNOmNuOa0L9CXpb8E9JEgWeexF
 dbrwWYeoz2nGbVeZOfoOvLNGyYEZJ+yY42uukVPvH5aIoSYhTkC2Su/87z9WZALs0kbx8cU0r
 OCw8VtjvJOClfkVwYg5j9XZ4E37PDLRDtSdaS9Kzs+VWm3XTYmnMMd27Gr+GyGB8ixxIo6mrf
 L1MLtJnZcn0KDzeZ5HWaOYbrLw4v5Tw9PA6HxnGXBYX5oNDjkAmiXes0taB7VB3pnutwqR03i
 1GLN95aLdiFNSGMsB8Sl0k/BngNnqR1tonbNDLm/Tvbt9zIjL6HMOhTBY49FA0zmVjoKJdZvb
 bQU6jiu5TCuM4+MPHnNA==
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
Cc: zhang.zhanghailiang@huawei.com, lizhijian@cn.fujitsu.com,
 quintela@redhat.com, jasowang@redhat.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org, chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/8B7pKuOTxY4YnaEU1ZzV.A1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Jan 2021 10:46:30 +0800
leirao <lei.rao@intel.com> wrote:

> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> if we put the data copy outside the packet_new(), then for the
> filter-rewrite module, there will be one less memory copy in the
> processing of each network packet.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Looks good to me,

Reviewed-by: Lukas Straub <lukasstraub2@web.de>

> ---
>  net/colo-compare.c    | 7 +++++--
>  net/colo.c            | 4 ++--
>  net/colo.h            | 2 +-
>  net/filter-rewriter.c | 1 -
>  4 files changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index 9e18baa..8bdf5a8 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -247,14 +247,17 @@ static int packet_enqueue(CompareState *s, int mode=
, Connection **con)
>      ConnectionKey key;
>      Packet *pkt =3D NULL;
>      Connection *conn;
> +    char *data =3D NULL;
>      int ret;
> =20
>      if (mode =3D=3D PRIMARY_IN) {
> -        pkt =3D packet_new(s->pri_rs.buf,
> +        data =3D g_memdup(s->pri_rs.buf, s->pri_rs.packet_len);
> +        pkt =3D packet_new(data,
>                           s->pri_rs.packet_len,
>                           s->pri_rs.vnet_hdr_len);
>      } else {
> -        pkt =3D packet_new(s->sec_rs.buf,
> +        data =3D g_memdup(s->sec_rs.buf, s->sec_rs.packet_len);
> +        pkt =3D packet_new(data,
>                           s->sec_rs.packet_len,
>                           s->sec_rs.vnet_hdr_len);
>      }
> diff --git a/net/colo.c b/net/colo.c
> index ef00609..08fb37e 100644
> --- a/net/colo.c
> +++ b/net/colo.c
> @@ -155,11 +155,11 @@ void connection_destroy(void *opaque)
>      g_slice_free(Connection, conn);
>  }
> =20
> -Packet *packet_new(const void *data, int size, int vnet_hdr_len)
> +Packet *packet_new(void *data, int size, int vnet_hdr_len)
>  {
>      Packet *pkt =3D g_slice_new(Packet);
> =20
> -    pkt->data =3D g_memdup(data, size);
> +    pkt->data =3D data;
>      pkt->size =3D size;
>      pkt->creation_ms =3D qemu_clock_get_ms(QEMU_CLOCK_HOST);
>      pkt->vnet_hdr_len =3D vnet_hdr_len;
> diff --git a/net/colo.h b/net/colo.h
> index 573ab91..bd2d719 100644
> --- a/net/colo.h
> +++ b/net/colo.h
> @@ -100,7 +100,7 @@ Connection *connection_get(GHashTable *connection_tra=
ck_table,
>  bool connection_has_tracked(GHashTable *connection_track_table,
>                              ConnectionKey *key);
>  void connection_hashtable_reset(GHashTable *connection_track_table);
> -Packet *packet_new(const void *data, int size, int vnet_hdr_len);
> +Packet *packet_new(void *data, int size, int vnet_hdr_len);
>  void packet_destroy(void *opaque, void *user_data);
>  void packet_destroy_partial(void *opaque, void *user_data);
> =20
> diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
> index fc0e64c..e24afe5 100644
> --- a/net/filter-rewriter.c
> +++ b/net/filter-rewriter.c
> @@ -271,7 +271,6 @@ static ssize_t colo_rewriter_receive_iov(NetFilterSta=
te *nf,
>      }
> =20
>      pkt =3D packet_new(buf, size, vnet_hdr_len);
> -    g_free(buf);
> =20
>      /*
>       * if we get tcp packet



--=20


--Sig_/8B7pKuOTxY4YnaEU1ZzV.A1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAIiEAACgkQNasLKJxd
sljS1g/9GZlj4GKZrmAuihQ8JrvqTq4M4RiQO0KH2nAQ1rVfUsPBAJDaJ2b7gHoL
jEVmZQU7eYhqlzMexlEQ6jZrirbShSGiv7tBqODXBYaWaV/+jLjcXz5baFl7dNsm
T0SeG+kkeqt6eTXyB+/5zQzF8VgVaeoaaJOwngI+yd57YYZfS+brCRB9hPe0qz/c
FppVm+HaWtr73yTbykMSueY7iB3QJjzGEaVi6W9OSYtISm0p8itVHUDY+ScQdMFI
bFHNv+GyeBpUOenlcZ+xFA0U8wvUtzxiT9YWAsA7xVASPN9098HtKp+GXyZ5rIOe
BSAWk9uVG/0EJbTfWeNT0AKNC9tRKpr8J8ww/i/d5Dvtsh4EvGf8g6+LrXqpkXzD
NFYxGjLYB4iVydzHvghmmBq/9PCrA7klFicBcC3hfyp551figOfPCYqrbkIxfQ0r
RhhoZ/+5w8oKqzXEyPw1fyLB48H70ymufY0l7lF8/d95efBcFArtTqZ+RsoHKjlt
arlgsH2JCC2SX02/fIdGg1BeK5Jr9m4K4vKmzxftywPbJiIuCvIZGnYCzTeMIufr
H75rHF7EPryU1F9WnCf0G1FmVu3aEtpuVg6tFUoLJZ92/h5qa57CvNa0+qDaOLJl
m1d72GSUnkV+ghQBNg3PNd/5EFQbYD+XapIgUWAhnLQa9zb68Vo=
=P0O0
-----END PGP SIGNATURE-----

--Sig_/8B7pKuOTxY4YnaEU1ZzV.A1--

