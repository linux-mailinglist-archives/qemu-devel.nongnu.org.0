Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5F42F624C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:48:10 +0100 (CET)
Received: from localhost ([::1]:34704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02yv-0005Lm-C5
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l02x5-00049U-SX
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:46:15 -0500
Received: from mout.web.de ([212.227.17.12]:58009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l02we-0000oo-Cz
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1610631938;
 bh=hU5dZez0GjNEdpUzvv0gHekAjF2GqiyNNqIeFEns3KA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Kq7le2CTDa6QRy5vcEiCYkVj3qau20bOT5DR/xDB2N5LNgoD3cjWMaLebDlrLGHFw
 8tf9RBiqPhY0cCz00BZwSN1Lq2IfEJIZWGswyZPqlKXxQaZmaLsE+LWqGFch58urFT
 i31mr//nqhyEuJtGXz3m6e5Ap4Vp65JQIj1ZGmlc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.5]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mv3Yg-1lque22trU-00r2wt; Thu, 14
 Jan 2021 14:45:38 +0100
Date: Thu, 14 Jan 2021 14:45:21 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Zhang Chen <chen.zhang@intel.com >
Subject: Re: [PATCH 3/3] net/colo-compare: Add handler for passthrough
 connection
Message-ID: <20210114144521.76a6a135@gecko.fritz.box>
In-Reply-To: <20201224010918.19275-4-chen.zhang@intel.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-4-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k59MKu+TkZK2wF6vhG24_Ga";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:XFEUnVFdJkslWBylQJSZEsVNvOu5NoY6B3CrqTJ8YZeFghDwTFS
 qZYdE4KMi31kP9aJhqjCyYoWobEVpnBr0cl6sHnd5au/IQP111YpPW4dyy+4Bwmd00VfrMt
 SWFOCk/3lxF25zW8/32VPbg6cMHKIOWPLRNNhYZ2Vt12O+BBo2EWWl3nXAwU/YnyRXDLjke
 zfdVWFYLRxbORJG0MgYNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G2vbE5PlKdk=:iPG8kG6EfhqHyUAZanPNKc
 VrShxTIcUw3NkCK7encwWau1uUPNdAeCQLFKZQQj2keTb6zK8ntsUxEYSL/AangkslT2hJx03
 EY1osTdmSCTO4wOZSSQFfox9E07Yjzxy8L3YajmoPLO/KOYr9cm15Zduu2+Ewx75UGLtJP7NU
 LLKh/BdX+/j2H6WC7XndqL4QuoOCpm/Lecs83mIizo1XY6oilY/fPXGS55Z9PulrWpjW0yv8+
 xWUYl5R4ao0EylaVva9AFNDAU4pqNlWZhHWpqx/Imc5lcSixyS/5FHPqQXy1b4JqKGPMnm5HX
 Udkygw88ogavTu/ZmWgOptwjaDDagBXZQKSd5VtTIBCGNWZgMOczm/bYN7XfMgwxptd63Ew/3
 Rb6Wte4dOkZGyQ0ZF/YBdUi4GsIZEEB2GvnHJZNDEAuolY8AFKuVudfJ1AVdvl6YK1Sf8aA9+
 uv99b7xyEYaHxR3kPIzXbZSbMgucAmeL2w/vyw7+95XdMigfuo97D8JnPBYm7KGPmeBexQV1W
 JXVrs0hFOIyPofdlOh6V7zWElGkq4tQRnMQtMgG5U6rglfKQoXlDVoetKxOjFY7X8P3Ytz6Ax
 dFzJAMCslubyM5Mj4VLv/vUlS44/3ZEzsH0Genxf7gLtAgYh9BJPG3gGJQiwLWcTq7ZGUMXWW
 UeDG1c6P9ddE7YM4aBUxOOn/oGtrhoX/Xy+ZrccJVgebM1/kYHaMyeP7InvUlXqj2WqafIoms
 QzXFzAgX0sc9FezIjAK1KP03GyZXLjw2mW9okssbuT8XmdO5HCfjokvxkPDsNyEtC3cstpXkH
 1RqvgVMZ2EUwuN3g32UdIs/Q9Tw+op78pPvHhQMRp9mGy7ywBZhZismF1I2o9a1ZckNEATyOl
 508ezdcRyFLdiBX/ZfUg==
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--Sig_/k59MKu+TkZK2wF6vhG24_Ga
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Dec 2020 09:09:18 +0800
Zhang Chen <chen.zhang@intel.com > wrote:

> From: Zhang Chen <chen.zhang@intel.com>
>=20
> Currently, we just use guest's TCP/UDP source port as the key
> to bypass certain network traffic.
>=20
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/colo-compare.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++
>  net/colo-compare.h |  2 ++
>  net/net.c          | 27 +++++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>=20
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index 337025b44f..11a32caa9b 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -46,6 +46,9 @@ static QTAILQ_HEAD(, CompareState) net_compares =3D
>  static NotifierList colo_compare_notifiers =3D
>      NOTIFIER_LIST_INITIALIZER(colo_compare_notifiers);
> =20
> +static QLIST_HEAD(, PassthroughEntry) passthroughlist =3D
> +    QLIST_HEAD_INITIALIZER(passthroughlist);
> +

Hi,
I think this should be per colo-compare instance e.g. inside 'struct Compar=
eState'.

>  #define COMPARE_READ_LEN_MAX NET_BUFSIZE
>  #define MAX_QUEUE_SIZE 1024
> =20
> @@ -103,6 +106,12 @@ typedef struct SendEntry {
>      uint8_t *buf;
>  } SendEntry;
> =20
> +typedef struct PassthroughEntry {
> +    bool is_tcp;
> +    uint16_t port;
> +    QLIST_ENTRY(PassthroughEntry) node;
> +} PassthroughEntry;
> +
>  struct CompareState {
>      Object parent;
> =20
> @@ -247,6 +256,7 @@ static int packet_enqueue(CompareState *s, int mode, =
Connection **con)
>      ConnectionKey key;
>      Packet *pkt =3D NULL;
>      Connection *conn;
> +    PassthroughEntry *bypass, *next;
>      int ret;
> =20
>      if (mode =3D=3D PRIMARY_IN) {
> @@ -264,8 +274,23 @@ static int packet_enqueue(CompareState *s, int mode,=
 Connection **con)
>          pkt =3D NULL;
>          return -1;
>      }
> +
>      fill_connection_key(pkt, &key);
> =20
> +    /* Check COLO passthrough connenction */
> +    if (!QLIST_EMPTY(&passthroughlist)) {
> +        QLIST_FOREACH_SAFE(bypass, &passthroughlist, node, next) {
> +            if (((key.ip_proto =3D=3D IPPROTO_TCP) && bypass->is_tcp) ||
> +                ((key.ip_proto =3D=3D IPPROTO_UDP) && !bypass->is_tcp)) {
> +                if (bypass->port =3D=3D key.src_port) {
> +                    packet_destroy(pkt, NULL);
> +                    pkt =3D NULL;
> +                    return -1;
> +                }
> +            }
> +        }
> +    }
> +
>      conn =3D connection_get(s->connection_track_table,
>                            &key,
>                            &s->conn_list);
> @@ -1373,6 +1398,30 @@ static void colo_flush_packets(void *opaque, void =
*user_data)
>      }
>  }
> =20
> +void colo_compare_passthrough_add(bool is_tcp, const uint16_t port)
> +{
> +    PassthroughEntry *bypass =3D NULL;
> +
> +    bypass =3D g_new0(PassthroughEntry, 1);
> +    bypass->is_tcp =3D is_tcp;
> +    bypass->port =3D port;
> +    QLIST_INSERT_HEAD(&passthroughlist, bypass, node);
> +}
> +
> +void colo_compare_passthrough_del(bool is_tcp, const uint16_t port)
> +{
> +    PassthroughEntry *bypass =3D NULL, *next =3D NULL;
> +
> +    if (!QLIST_EMPTY(&passthroughlist)) {
> +        QLIST_FOREACH_SAFE(bypass, &passthroughlist, node, next) {
> +            if ((bypass->is_tcp =3D=3D is_tcp) && (bypass->port =3D=3D p=
ort)) {
> +                QLIST_REMOVE(bypass, node);
> +                g_free(bypass);
> +            }
> +        }
> +    }
> +}
> +
>  static void colo_compare_class_init(ObjectClass *oc, void *data)
>  {
>      UserCreatableClass *ucc =3D USER_CREATABLE_CLASS(oc);
> diff --git a/net/colo-compare.h b/net/colo-compare.h
> index 22ddd512e2..1fa026c85e 100644
> --- a/net/colo-compare.h
> +++ b/net/colo-compare.h
> @@ -20,5 +20,7 @@
>  void colo_notify_compares_event(void *opaque, int event, Error **errp);
>  void colo_compare_register_notifier(Notifier *notify);
>  void colo_compare_unregister_notifier(Notifier *notify);
> +void colo_compare_passthrough_add(bool is_tcp, const uint16_t port);
> +void colo_compare_passthrough_del(bool is_tcp, const uint16_t port);
> =20
>  #endif /* QEMU_COLO_COMPARE_H */
> diff --git a/net/net.c b/net/net.c
> index eac7a92618..1f303e8309 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -55,6 +55,7 @@
>  #include "sysemu/sysemu.h"
>  #include "net/filter.h"
>  #include "qapi/string-output-visitor.h"
> +#include "net/colo-compare.h"
> =20
>  /* Net bridge is currently not supported for W32. */
>  #if !defined(_WIN32)
> @@ -1155,12 +1156,38 @@ void qmp_colo_passthrough_add(const char *prot, c=
onst uint32_t port,
>                                Error **errp)
>  {
>      /* Setup passthrough connection */
> +    if (port > 65536) {
> +        error_setg(errp, "COLO pass through get wrong port");
> +        return;
> +    }
> +
> +    if (!strcmp(prot, "tcp") || !strcmp(prot, "TCP")) {
> +        colo_compare_passthrough_add(true, (uint16_t)port);
> +    } else if (!strcmp(prot, "udp") || !strcmp(prot, "UDP")) {
> +        colo_compare_passthrough_add(false, (uint16_t)port);
> +    } else {
> +        error_setg(errp, "COLO pass through just support tcp or udp prot=
ocol");
> +        return;
> +    }
>  }
> =20
>  void qmp_colo_passthrough_del(const char *prot, const uint32_t port,
>                                Error **errp)
>  {
>      /* Delete passthrough connection */
> +    if (port > 65536) {
> +        error_setg(errp, "COLO pass through get wrong port");
> +        return;
> +    }
> +
> +    if (!strcmp(prot, "tcp") || !strcmp(prot, "TCP")) {
> +        colo_compare_passthrough_del(true, (uint16_t)port);
> +    } else if (!strcmp(prot, "udp") || !strcmp(prot, "UDP")) {
> +        colo_compare_passthrough_del(false, (uint16_t)port);
> +    } else {
> +        error_setg(errp, "COLO pass through just support tcp or udp prot=
ocol");
> +        return;
> +    }
>  }
> =20
>  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)



--=20


--Sig_/k59MKu+TkZK2wF6vhG24_Ga
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAASvEACgkQNasLKJxd
sliAAg//abf+p4UWuNEgF9WJlMNlTeC+MnHynFCKqMn5Tx9ICajEi+AGFgUZ/+ol
0Qe/xIQiJKPdJ87iBsV4/fo5pgiS9Z6qzbTUCkPhEslA0KrFaFnAby8Cqj/1GRmC
1juHdQb+7DYYIvO6M83OeLoTeMNyVftvA1vKaquP3BeZQQNfGAi4K64fp3T5GsGl
zC28o/EIPLb9s17mFtk3ealgsElPLxlOz/emkEuqc2Qb3QuvGGdGdI4nGue2MKHk
ZdK2UqnflVLGRWyGAQmhxCGFBFfps2eMeSjZYup9n1kRaH6Osm+kmQYqQpVa8Qnf
RIR5DXRY0HBBlgCWn2JYb+ublhrtwVrNXmkaPvUG2C8FUJtpKI8wNxYSrXn8vrPy
5WpLZDdcQsEK15zcSOgdlQZbZ9LvHVFohod7pyJaywYGCDojg2B4RJ8ZULQJxbs6
LFIqe0wkys/QDmUdm5FpflvjcN8zY32BOoiwPI5RBz8BJwyM9fz9PYkGn1jj4w7V
j46xzHIqMkpuUJ25+157CdqwubqyTTgLG2DDVWyz7rG4HPWH7SggduAF1bKJ/hW/
Frf7rSp47pkGgNjIoGcJ1zfL3BrzVW4/HZZDASxpqDBM91tXMZTEzW1yH5zH9ZXw
3gzhwL8LNbxTV84Mk9+L/+aYeUWNnwCNcpk++3Dl9W53GW02/pM=
=0IJW
-----END PGP SIGNATURE-----

--Sig_/k59MKu+TkZK2wF6vhG24_Ga--

