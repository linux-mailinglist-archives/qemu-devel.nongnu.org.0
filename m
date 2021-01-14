Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B832F626D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:53:34 +0100 (CET)
Received: from localhost ([::1]:48454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0349-00033n-2z
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l031b-0001Ct-WA
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:50:56 -0500
Received: from mout.web.de ([212.227.17.11]:60853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l031U-000309-CQ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:50:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1610632239;
 bh=UOM3NHUf24YfZ36Hzp/MUjFGqD7ANoTep92jtmFDqus=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=RrFI0IPuO+cJFKhiG5CzjzQSwZrdvEwW5PZwiT+xgLZC/unjEWBCZ9mekCMhU1WKY
 m3ysbG2U7uag0U2YMGUSKBU7iWqEzHYNr2curt18D2wPlWkhoVBdmEM38yGWFJhrCp
 6/BtUpdWVFIVHSG8tXb233m7/uq4A93jHFZg/XY4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.5]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MBkPj-1lAnyy2hZH-00AjMM; Thu, 14
 Jan 2021 14:50:39 +0100
Date: Thu, 14 Jan 2021 14:50:37 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Zhang Chen <chen.zhang@intel.com >
Subject: Re: [PATCH 3/3] net/colo-compare: Add handler for passthrough
 connection
Message-ID: <20210114145037.706fe8c7@gecko.fritz.box>
In-Reply-To: <20201224010918.19275-4-chen.zhang@intel.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-4-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dgJMVhT3V8ekfaOKMzDD0IE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:ktlI3lkQfAqa0lGdB3HLTnOh4JQQrWcFMEPnmLaalndYeS6xGXV
 EyHA/lYJplGg5F6HhIJQv5DyjvIj95zvWx73mskkI3DvoqvLD04RAk4Aijz4qcS1G6HmvGX
 sW3Vd4W2E6rqZdfnTuqOfDSUc48i7oS5/5zYh+FsDbm4wQBSt0gHkUk9OBx0gEyPsNka2Me
 9hMdcLXi1YrYenLjdq3CQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:roT15MqYRCg=:RNI+h4KvlCF+qYtg2g4avn
 eNd4xSguh/njlL1ynIwjhK2yLYn9IWdknRgEtOyK+nbHsy5FJGfGzVwxyIOqMhfHe9elQnsJu
 bDftZngNrKn0/KmEJo2Eo3/Gl/0xIZEXQLqe6RRFwQDKs7egm5z+oXuhW7aLfPCvDK1yF5kPW
 rnsL773sQD4JSKvWOWhn2hCvWugNBpsZ6f3zI9W6otlTArFMUavYqm6lxVRXeHVfp8StA9bU3
 cQeinDW4VPa4xR69ShRE75OvjLXuDl1Vv6OmdbYG2+RNYVDD2Ld2zePP2h0s6OYucddvvY63q
 gebAzT/wV2OGFaoicVsf8iD3mKwZgN763A7IIlmyEcA199IjqxXMKWkoYS5Zx5TexG9qYAORS
 uMFg+iWRk80IgZfOZ83v1nGCwziPbqc2NiXi8faXvXUcwB/RHsA/9jJJRjH60u7G46NcX4XSj
 dBHjZD1LEoUB9EL/aLBotxMIAk+5feC9OZlOLU3rDi0CSy4HIlM5SKQTBnEmSgFxIEB8fvEhk
 kCzSUDk6Iqc4S/O9Fls3Cq3noeif9e/m0ToT9Yp+oBq/6hl6FEyk76IXKeLQd55gY+kAkTLiY
 DjWjdnN0+V6Ry4tJ5BYTRgUzrXFJ8FUgiYC6WCgeqUnlit8gMLvS8mdU+gJkodsAY2JYNRwgG
 dCMpX9RAnlGCXeeeN9p4AYCKTOZITHOalt/1haEOtlUXI9/40CdFPSaD2HC6eWjKocMBr+JvI
 TJJzHvETwrxiGoqTyrFQ02fUG+pyYdXr3RQCloG8kSFHwLfc+NeT8lnh+65NJ6W6m0UwsHkRl
 814BAwIWXqClPhjeyN5s2xj6MNgfI1ijl/skoigYW0nzVIkHp10GTb5FpDPNX+cuoPoDhAOne
 VHq9ZLy48hOWbwGabBpw==
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
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

--Sig_/dgJMVhT3V8ekfaOKMzDD0IE
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

Access to "passtroughlist" needs to be protected by a lock, as "packet_enqu=
eue" is called from a different iothread.

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


--Sig_/dgJMVhT3V8ekfaOKMzDD0IE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAATC0ACgkQNasLKJxd
sliGVw/+IrVY1HnGk5SDlHWIgWWgJY+fL42x7YyXS6zQMoIl44PiwrF8G2k5jAmD
LM0hWm9Of7/bwnbePZNEjaj/DiFR8azZSevz7aLLvh3qJh8fdw1yoK9yQxnlyXww
hWYRLnHI40LPMsFZ+a5SfCjxXPC3XEf+VwI6Xovc3sWG8uOuBbhomSmvusF0IJrs
P47iRLBk1RSYjoQNX7IDwi6eJWRq4nGxU0D+uA+84Ldn+8mj07zGSJPiJk32lMgt
UJKMe+TxPZ5yy63RJJjeJaJGkHxoi1r2txDxwG+kaSQxGTefI4a0qcq2FbOmtE25
AP/WJzDRa5/04Nr6cJ6nxv/rJtMsV9Ju2iQpfon8OlbMr93QSFEYkFHWNTcxJwRW
LnNziO/tv5gA+iM1v9iYUeoOW09WLvCCNB0Uooy9IyKXk+SjImv/luakNol/1BOu
2LuC/SXnyV3VlibcCISDkK+hwakh16Z9y5O74/imBuEAnygds/gH1U1paWTn+WpS
4dIy+Q2J1oDbqqwi3YlyteRgnVgL5vwAOzVqmsVethPdvtRbdTvCHuhYaj3aHPiV
T2gZcRQ+GfXLHyMeLCgc/kLt4SFAMeS0MI3OThvUFdfqqvS2D+R64K6SxlxZqY7N
ZZyghAE/JrW0DR2RPQMVpaHpLHj4Ld7w3zygwvoY0JxC4W6lv7Q=
=tu3h
-----END PGP SIGNATURE-----

--Sig_/dgJMVhT3V8ekfaOKMzDD0IE--

