Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FAB389D5A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 07:51:33 +0200 (CEST)
Received: from localhost ([::1]:39544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljbam-0000er-TH
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 01:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ljbZZ-0008IB-PW
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:50:17 -0400
Received: from mga12.intel.com ([192.55.52.136]:48252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ljbZX-0003pn-Gb
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:50:17 -0400
IronPort-SDR: gYz6ABChSHHuEHCCNn2EEvWK/0oGsmbBlOEgZqEtCDbLDNt9l5MFdhbxMl2jz/t9a9hXFzBSZn
 fvygDXKjrx8g==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="180752773"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="180752773"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 22:50:12 -0700
IronPort-SDR: 0hoUGecEeqcQ4jM9RdfONDRnO46JwtuxC76daEnA6/EZm51sonjwSv8M8da8cvKhAQ6S1L03p/
 fsClpLzy6Bag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="412049829"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga002.jf.intel.com with ESMTP; 19 May 2021 22:50:11 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 19 May 2021 22:50:11 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 20 May 2021 13:50:09 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.008;
 Thu, 20 May 2021 13:50:09 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH V6 6/6] net/net.c: Add handler for COLO passthrough
 connection
Thread-Topic: [PATCH V6 6/6] net/net.c: Add handler for COLO passthrough
 connection
Thread-Index: AQHXNfjv+zy92n8UIEeI+wJLP1kuCarnxywAgARErmA=
Date: Thu, 20 May 2021 05:50:09 +0000
Message-ID: <529f2918a82b4c318c1f1af01fcaed5a@intel.com>
References: <20210420151537.64360-1-chen.zhang@intel.com>
 <20210420151537.64360-7-chen.zhang@intel.com>
 <20210517223838.5ca36e62@gecko.fritz.box>
In-Reply-To: <20210517223838.5ca36e62@gecko.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>
> Sent: Tuesday, May 18, 2021 4:39 AM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> Gilbert <dgilbert@redhat.com>; Markus Armbruster <armbru@redhat.com>;
> Daniel P. Berrang=E9 <berrange@redhat.com>; Gerd Hoffmann
> <kraxel@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Zhang Chen
> <zhangckid@gmail.com>
> Subject: Re: [PATCH V6 6/6] net/net.c: Add handler for COLO passthrough
> connection
>=20
> On Tue, 20 Apr 2021 23:15:37 +0800
> Zhang Chen <chen.zhang@intel.com> wrote:
>=20
> > Use connection protocol,src port,dst port,src ip,dst ip as the key to
> > bypass certain network traffic in COLO compare.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  net/net.c | 160
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 158 insertions(+), 2 deletions(-)
> >
> > diff --git a/net/net.c b/net/net.c
> > index 2a6e5f3886..9b0de0f332 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -56,6 +56,8 @@
> >  #include "sysemu/sysemu.h"
> >  #include "net/filter.h"
> >  #include "qapi/string-output-visitor.h"
> > +#include "net/colo-compare.h"
> > +#include "qom/object_interfaces.h"
> >
> >  /* Net bridge is currently not supported for W32. */  #if
> > !defined(_WIN32) @@ -1196,14 +1198,168 @@ void
> qmp_netdev_del(const
> > char *id, Error **errp)
> >      }
> >  }
> >
> > +static CompareState *colo_passthrough_check(IPFlowSpec *spec, Error
> > +**errp) {
> > +    Object *container;
> > +    Object *obj;
> > +    CompareState *s;
> > +
> > +    if (!spec->object_name) {
> > +        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "object-name",
> > +                   "Need input colo-compare object name");
> > +        return NULL;
> > +    }
> > +
> > +    container =3D object_get_objects_root();
> > +    obj =3D object_resolve_path_component(container, spec->object_name=
);
> > +    if (!obj) {
> > +        error_setg(errp, "colo-compare '%s' not found", spec->object_n=
ame);
> > +        return NULL;
> > +    }
> > +
> > +    s =3D COLO_COMPARE(obj);
> > +
> > +    if (!getprotobyname(spec->protocol)) {
> > +        error_setg(errp, "COLO pass through get wrong protocol");
> > +        return NULL;
> > +    }
> > +
> > +    if ((spec->source->host && !qemu_isdigit(spec->source->host[0])) |=
|
> > +        (spec->destination->host &&
> > +        !qemu_isdigit(spec->destination->host[0]))) {
> > +        error_setg(errp, "COLO pass through get wrong IP");
> > +        return NULL;
> > +    }
> > +
> > +    if (atoi(spec->source->port) > 65536 || atoi(spec->source->port) <=
 0 ||
> > +        atoi(spec->destination->port) > 65536 ||
> > +        atoi(spec->destination->port) < 0) {
> > +        error_setg(errp, "COLO pass through get wrong port");
> > +        return NULL;
> > +    }
> > +
> > +    return s;
> > +}
> > +
> > +static void compare_passthrough_add(CompareState *s,
> > +                                    IPFlowSpec *spec,
> > +                                    Error **errp) {
> > +    COLOPassthroughEntry *pass =3D NULL, *next =3D NULL, *origin =3D N=
ULL;
> > +
> > +    pass =3D g_new0(COLOPassthroughEntry, 1);
> > +
> > +    pass->l4_protocol =3D getprotobyname(spec->protocol);
> > +    pass->src_port =3D atoi(spec->source->port);
> > +    pass->dst_port =3D atoi(spec->destination->port);
> > +
> > +    if (!inet_aton(spec->source->host, &pass->src_ip)) {
> > +        pass->src_ip.s_addr =3D 0;
> > +    }
> > +
> > +    if (!inet_aton(spec->destination->host, &pass->dst_ip)) {
> > +        pass->dst_ip.s_addr =3D 0;
> > +    }
> > +
> > +    qemu_mutex_lock(&s->passthroughlist_mutex);
> > +    if (!QLIST_EMPTY(&s->passthroughlist)) {
> > +        QLIST_FOREACH_SAFE(origin, &s->passthroughlist, node, next) {
> > +            if ((pass->l4_protocol->p_proto =3D=3D origin->l4_protocol=
->p_proto)
> &&
> > +                (pass->src_port =3D=3D origin->src_port) &&
> > +                (pass->dst_port =3D=3D origin->dst_port) &&
> > +                (pass->src_ip.s_addr =3D=3D origin->src_ip.s_addr) &&
> > +                (pass->dst_ip.s_addr =3D=3D origin->dst_ip.s_addr)) {
> > +                error_setg(errp, "The pass through connection already =
exists");
> > +                g_free(pass);
> > +                qemu_mutex_unlock(&s->passthroughlist_mutex);
> > +                return;
> > +            }
> > +        }
> > +    }
>=20
> I think this searching for a existing passthrough rule should move into a
> function. The function can then be used in compare_passthrough_del too.

Good idea.
I will change it in next version.

Thanks
Chen

>=20
> > +    QLIST_INSERT_HEAD(&s->passthroughlist, pass, node);
> > +    qemu_mutex_unlock(&s->passthroughlist_mutex);
> > +}
> > +
> > +static void compare_passthrough_del(CompareState *s,
> > +                                    IPFlowSpec *spec,
> > +                                    Error **errp) {
> > +    COLOPassthroughEntry *pass =3D NULL, *next =3D NULL, *origin =3D N=
ULL;
> > +
> > +    pass =3D g_new0(COLOPassthroughEntry, 1);
> > +
> > +    pass->l4_protocol =3D getprotobyname(spec->protocol);
> > +    pass->src_port =3D atoi(spec->source->port);
> > +    pass->dst_port =3D atoi(spec->destination->port);
> > +
> > +    if (!inet_aton(spec->source->host, &pass->src_ip)) {
> > +        pass->src_ip.s_addr =3D 0;
> > +    }
> > +
> > +    if (!inet_aton(spec->destination->host, &pass->dst_ip)) {
> > +        pass->dst_ip.s_addr =3D 0;
> > +    }
> > +
> > +    qemu_mutex_lock(&s->passthroughlist_mutex);
> > +    if (!QLIST_EMPTY(&s->passthroughlist)) {
> > +        QLIST_FOREACH_SAFE(origin, &s->passthroughlist, node, next) {
> > +            if ((pass->l4_protocol->p_proto =3D=3D origin->l4_protocol=
->p_proto)
> &&
> > +                (pass->src_port =3D=3D origin->src_port) &&
> > +                (pass->dst_port =3D=3D origin->dst_port) &&
> > +                (pass->src_ip.s_addr =3D=3D origin->src_ip.s_addr) &&
> > +                (pass->dst_ip.s_addr =3D=3D origin->dst_ip.s_addr)) {
> > +                QLIST_REMOVE(origin, node);
> > +                g_free(origin);
> > +                g_free(pass);
> > +                qemu_mutex_unlock(&s->passthroughlist_mutex);
> > +                return;
> > +            }
> > +        }
> > +        error_setg(errp, "The pass through list can't find the connect=
ion");
> > +    } else {
> > +        error_setg(errp, "The pass through connection list is empty");
> > +    }
> > +
> > +    g_free(pass);
> > +    qemu_mutex_unlock(&s->passthroughlist_mutex);
> > +}
> > +
> > +
> >  void qmp_colo_passthrough_add(IPFlowSpec *spec, Error **errp)  {
> > -    /* TODO implement setup passthrough rule */
> > +    CompareState *s;
> > +    Error *err =3D NULL;
> > +
> > +    s =3D colo_passthrough_check(spec, &err);
> > +    if (err) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> > +
> > +    compare_passthrough_add(s, spec, &err);
> > +    if (err) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> >  }
> >
> >  void qmp_colo_passthrough_del(IPFlowSpec *spec, Error **errp)  {
> > -    /* TODO implement delete passthrough rule */
> > +    CompareState *s;
> > +    Error *err =3D NULL;
> > +
> > +    s =3D colo_passthrough_check(spec, &err);
> > +    if (err) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> > +
> > +    compare_passthrough_del(s, spec, &err);
> > +    if (err) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> >  }
> >
> >  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
>=20
>=20
>=20
> --


