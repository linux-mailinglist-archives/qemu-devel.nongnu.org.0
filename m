Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB7386B8A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 22:39:45 +0200 (CEST)
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lik1f-0006zy-Qy
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 16:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lik0v-0006KW-4s
 for qemu-devel@nongnu.org; Mon, 17 May 2021 16:38:57 -0400
Received: from mout.web.de ([217.72.192.78]:32991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lik0t-0001FK-7V
 for qemu-devel@nongnu.org; Mon, 17 May 2021 16:38:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1621283922;
 bh=Wss2ZKTBgpchl6BGU9C7x3cSoeBE+dAmFBi118+ruH4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Jz6g6GZRB4zd1JpBgZsAQV+5kPZ2K/ljXKOdb08F/1OZcGeAyuubvcjxqA0og/Wji
 QJsggrsy5nk3T9JGjAg2XrhY5oPwKzPkpm6phP2rYRzXzIp0scWg/KU7BLRWMuxfex
 i2Ri3TbC4KLoB9pNpB5UVBseli6lTmxJFrd9Lyeo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.102]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MS2LO-1ltAOe2NCs-00TBc0; Mon, 17
 May 2021 22:38:42 +0200
Date: Mon, 17 May 2021 22:38:38 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH V6 6/6] net/net.c: Add handler for COLO passthrough
 connection
Message-ID: <20210517223838.5ca36e62@gecko.fritz.box>
In-Reply-To: <20210420151537.64360-7-chen.zhang@intel.com>
References: <20210420151537.64360-1-chen.zhang@intel.com>
 <20210420151537.64360-7-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wcQzUZ=sCIhYz4SzOh1H1Q_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:TbhYAA5tI7AhaSHZ4z/bL0lJKOxDAWJ/zD/P8tdeta1u1DXbOuu
 w4qHLHVufvNLSUvl5BojgeKAMHBzNLu8cyhYSAyTo5y3RgqPuB90MaW4qStkdSv8JwpI5eU
 B9RSLH9uK3tXMLR5SEIuX92JNLATjQVk+e2tojnFBIq8jBJbmefh9dbNwvSB1UNJ+DXA5rK
 ym8U9lUz4To2d9lawUPmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/w7PNb1PvZ0=:R3ir5AtgLEetVz7m15IFkl
 ami3zypNpiZmyC64Gg1ac/8mTSEgPRl7Wu15e0nt3OAvfIpPFwBQCES7JqJBlxt95OdxUvppu
 gsrA5XJNSVNjAoKRCTXBzPkU3kSly/LCtmrLAdmnH5Neg1rfjO9M3PfXD4APogzemegrE6f+I
 efEC3nYM6hsCW2t2cFJo9knPZHogYuSk5AI5nUekS5uVIFYvDNGNHMMxKNEil12dal1sGGppl
 XC731IAnU3xYLefv2DIhwlJVNc5bj2DOZSdrPQ0jtgP8lO2u2sBmQFk9JQeVm5I3iXzZsoOyS
 GWvX/YgXASMIbYZIkqtxZnUA2ytIdYzXrEagXjDdTddEToG6MPTH57cintJkyfdd8djDG9tX0
 WsQsTePAIP/2rPImUKWH4Dvm7Qebbr1COk/a3mmbMInifWT38jNelCR7IaC4cAq3U3kIU8DDh
 SCFgWVtdxSCtBzUorKMa2HXsxjPPB0n9Eruc2kdiv9zi7NRitBGUPyaU/LP+mVSxrvs5fArwn
 DVdgALTmQPPncFMMj8jc7g29X5IkKRc/TXcmO/zMrpy5SapfaC4uNtoOsLqMXbXeqNHkWJ335
 HrysR4+laB3ONOYPtDoVo1MMlgwPXCUeK0kOGnGXcE+gpibSmDZ/2p+yug2BpkLDkNHF1gQE3
 zZqCIwnpifleSM7dSO4NazlLo7faUXraDipwI+P8si06351DrjGER5epb4Wss7NHLLq3Gd2Db
 jusscrovEckwEBddBKeJRlDnexE4XifOPeWQMNLC6uQsXNeYIGfibWbsHUr3QkKGRf3Nq4ejf
 2Gne3kutQuA2qMKEhBR1UpDHzmMIJIQaokGNWXwWXdcLPkb8yoT4772HKETgGKkFHwZB701jY
 BwACoNcHve/eBpjCp0j6buva8VCyeXtiKwhHMesgpKVRzfApe+emBcN9gAJpclM0uCpzZLXBz
 4I9ZPo/XuvdqnyAtFgh1o1DmumgQ5gVnmvhwuDBmvZCmQugwuRFgpLX8wxiycdapqp8rlxBt3
 bhbS/nxaPwUHfPolRp/wHO4yVjG2DdKsFbMq0ODvSgVkL5nsQR2lGP/ZlgZckJuKeGLoikmWm
 Pwd8xgv8CGgNKAfYoKNFw4/09N4yHr7kfnIukQQaRsZu8jkkStDX6hbSpy7tGdwAq744WPYKt
 /h3qtbSJVx53fbA9AlP4omfi6XN+P5aILolQ1i8VxGL5djhRWVwRMyLQYuGzxOGyRBT4Y=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
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

--Sig_/wcQzUZ=sCIhYz4SzOh1H1Q_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Apr 2021 23:15:37 +0800
Zhang Chen <chen.zhang@intel.com> wrote:

> Use connection protocol,src port,dst port,src ip,dst ip as the key
> to bypass certain network traffic in COLO compare.
>=20
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/net.c | 160 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 158 insertions(+), 2 deletions(-)
>=20
> diff --git a/net/net.c b/net/net.c
> index 2a6e5f3886..9b0de0f332 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -56,6 +56,8 @@
>  #include "sysemu/sysemu.h"
>  #include "net/filter.h"
>  #include "qapi/string-output-visitor.h"
> +#include "net/colo-compare.h"
> +#include "qom/object_interfaces.h"
> =20
>  /* Net bridge is currently not supported for W32. */
>  #if !defined(_WIN32)
> @@ -1196,14 +1198,168 @@ void qmp_netdev_del(const char *id, Error **errp)
>      }
>  }
> =20
> +static CompareState *colo_passthrough_check(IPFlowSpec *spec, Error **er=
rp)
> +{
> +    Object *container;
> +    Object *obj;
> +    CompareState *s;
> +
> +    if (!spec->object_name) {
> +        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "object-name",
> +                   "Need input colo-compare object name");
> +        return NULL;
> +    }
> +
> +    container =3D object_get_objects_root();
> +    obj =3D object_resolve_path_component(container, spec->object_name);
> +    if (!obj) {
> +        error_setg(errp, "colo-compare '%s' not found", spec->object_nam=
e);
> +        return NULL;
> +    }
> +
> +    s =3D COLO_COMPARE(obj);
> +
> +    if (!getprotobyname(spec->protocol)) {
> +        error_setg(errp, "COLO pass through get wrong protocol");
> +        return NULL;
> +    }
> +
> +    if ((spec->source->host && !qemu_isdigit(spec->source->host[0])) ||
> +        (spec->destination->host &&
> +        !qemu_isdigit(spec->destination->host[0]))) {
> +        error_setg(errp, "COLO pass through get wrong IP");
> +        return NULL;
> +    }
> +
> +    if (atoi(spec->source->port) > 65536 || atoi(spec->source->port) < 0=
 ||
> +        atoi(spec->destination->port) > 65536 ||
> +        atoi(spec->destination->port) < 0) {
> +        error_setg(errp, "COLO pass through get wrong port");
> +        return NULL;
> +    }
> +
> +    return s;
> +}
> +
> +static void compare_passthrough_add(CompareState *s,
> +                                    IPFlowSpec *spec,
> +                                    Error **errp)
> +{
> +    COLOPassthroughEntry *pass =3D NULL, *next =3D NULL, *origin =3D NUL=
L;
> +
> +    pass =3D g_new0(COLOPassthroughEntry, 1);
> +
> +    pass->l4_protocol =3D getprotobyname(spec->protocol);
> +    pass->src_port =3D atoi(spec->source->port);
> +    pass->dst_port =3D atoi(spec->destination->port);
> +
> +    if (!inet_aton(spec->source->host, &pass->src_ip)) {
> +        pass->src_ip.s_addr =3D 0;
> +    }
> +
> +    if (!inet_aton(spec->destination->host, &pass->dst_ip)) {
> +        pass->dst_ip.s_addr =3D 0;
> +    }
> +
> +    qemu_mutex_lock(&s->passthroughlist_mutex);
> +    if (!QLIST_EMPTY(&s->passthroughlist)) {
> +        QLIST_FOREACH_SAFE(origin, &s->passthroughlist, node, next) {
> +            if ((pass->l4_protocol->p_proto =3D=3D origin->l4_protocol->=
p_proto) &&
> +                (pass->src_port =3D=3D origin->src_port) &&
> +                (pass->dst_port =3D=3D origin->dst_port) &&
> +                (pass->src_ip.s_addr =3D=3D origin->src_ip.s_addr) &&
> +                (pass->dst_ip.s_addr =3D=3D origin->dst_ip.s_addr)) {
> +                error_setg(errp, "The pass through connection already ex=
ists");
> +                g_free(pass);
> +                qemu_mutex_unlock(&s->passthroughlist_mutex);
> +                return;
> +            }
> +        }
> +    }

I think this searching for a existing passthrough rule should move into
a function. The function can then be used in compare_passthrough_del
too.

> +    QLIST_INSERT_HEAD(&s->passthroughlist, pass, node);
> +    qemu_mutex_unlock(&s->passthroughlist_mutex);
> +}
> +
> +static void compare_passthrough_del(CompareState *s,
> +                                    IPFlowSpec *spec,
> +                                    Error **errp)
> +{
> +    COLOPassthroughEntry *pass =3D NULL, *next =3D NULL, *origin =3D NUL=
L;
> +
> +    pass =3D g_new0(COLOPassthroughEntry, 1);
> +
> +    pass->l4_protocol =3D getprotobyname(spec->protocol);
> +    pass->src_port =3D atoi(spec->source->port);
> +    pass->dst_port =3D atoi(spec->destination->port);
> +
> +    if (!inet_aton(spec->source->host, &pass->src_ip)) {
> +        pass->src_ip.s_addr =3D 0;
> +    }
> +
> +    if (!inet_aton(spec->destination->host, &pass->dst_ip)) {
> +        pass->dst_ip.s_addr =3D 0;
> +    }
> +
> +    qemu_mutex_lock(&s->passthroughlist_mutex);
> +    if (!QLIST_EMPTY(&s->passthroughlist)) {
> +        QLIST_FOREACH_SAFE(origin, &s->passthroughlist, node, next) {
> +            if ((pass->l4_protocol->p_proto =3D=3D origin->l4_protocol->=
p_proto) &&
> +                (pass->src_port =3D=3D origin->src_port) &&
> +                (pass->dst_port =3D=3D origin->dst_port) &&
> +                (pass->src_ip.s_addr =3D=3D origin->src_ip.s_addr) &&
> +                (pass->dst_ip.s_addr =3D=3D origin->dst_ip.s_addr)) {
> +                QLIST_REMOVE(origin, node);
> +                g_free(origin);
> +                g_free(pass);
> +                qemu_mutex_unlock(&s->passthroughlist_mutex);
> +                return;
> +            }
> +        }
> +        error_setg(errp, "The pass through list can't find the connectio=
n");
> +    } else {
> +        error_setg(errp, "The pass through connection list is empty");
> +    }
> +
> +    g_free(pass);
> +    qemu_mutex_unlock(&s->passthroughlist_mutex);
> +}
> +
> +
>  void qmp_colo_passthrough_add(IPFlowSpec *spec, Error **errp)
>  {
> -    /* TODO implement setup passthrough rule */
> +    CompareState *s;
> +    Error *err =3D NULL;
> +
> +    s =3D colo_passthrough_check(spec, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    compare_passthrough_add(s, spec, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>  }
> =20
>  void qmp_colo_passthrough_del(IPFlowSpec *spec, Error **errp)
>  {
> -    /* TODO implement delete passthrough rule */
> +    CompareState *s;
> +    Error *err =3D NULL;
> +
> +    s =3D colo_passthrough_check(spec, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    compare_passthrough_del(s, spec, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>  }
> =20
>  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)



--=20


--Sig_/wcQzUZ=sCIhYz4SzOh1H1Q_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmCi1E4ACgkQNasLKJxd
sliHqA/+JtaxT3ERzlrhSocFEclUEGZ+8x2QyB1uy65S6X/hRrATAtAwE/yuShoE
kB64A1NZim5NGgIhrq6/VZnVj7lo3JSjRQSYpMHc9dZfytWYqB+fg8BfqTtKzkAw
GfGFyDDmPaVmHE7Wan72CUpNEGGVSGJ7OCITVE1pl6j7cLy7jAHvGfOaLXHnErC0
5C2FkEQ4iEFV/KHC7Tsx3KDHUmfcrqGOv9uIVNBxPnxX/Ky22TsN1tDLkx8oQYkD
d96AFY7AtV/vQCdUtr9W0UfwhFP0Il04/td61Ec2WjK8CBaXdmTayiCckUrr4RtB
+cISrVxKkYP3bqv4icrnYvjPJVQ+ZViSF6myVQm5e2lEfm+r9LM1VQkkT143XAFc
9l/RblOt1bMqYPwxNMmzMAO6RuaMjQXHITcwZTAz5T/LcUOdHlqalx9S7mP8ewQV
ncHrufzx2nbxPFGJhY/zHuzZDg7hpcQr5pJA4Wf37ITxzswpQ3bBu7M92yidCq4r
3LGqUOr41XD4n4AcwE8uWCaGfv8uNBrAKIUsY4HaTcxQKNfojVKT7XuMnQnaeXPR
Jj7Ewv+ghkh+RaT6S7lJQUehwWWr8vIrmWv9Hhu+SwyoirFD1xL8BwHtHLI4Uqwu
mpKgZB6DBQo+4RG+xh85T4Sazfy4ahsykJkoXh+RB9zlAuYrg9E=
=ITVZ
-----END PGP SIGNATURE-----

--Sig_/wcQzUZ=sCIhYz4SzOh1H1Q_--

