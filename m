Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2B017E78C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 19:51:58 +0100 (CET)
Received: from localhost ([::1]:48118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBNVN-0002iz-0U
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 14:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jBNUM-0002DS-SV
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:50:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1jBNUK-00034D-9S
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:50:53 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37179
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1jBNUK-00032d-1d
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583779851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ZM40ghvh2zt4A2aPhfkeOzoesLPNOGh0c1rZYAyxyc=;
 b=gWW1L91FNfHMb9yL6FJdCSLO0Nuk5ITGhYW7qiRayo2YMIDMdy/ZB1lVjToSzQNgsWY01R
 NCmdjqKS6dixtB8l8KuUyvYaQaSvIIOzUsXFy3ubS2+CGYe04lhM5ORYOvZObYkzxkLrw2
 D7dOdIjYko35V2ucS9UCjrcEHxsk/Wg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-uExUZ74MMfOBubuE04P13Q-1; Mon, 09 Mar 2020 14:50:47 -0400
X-MC-Unique: uExUZ74MMfOBubuE04P13Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85CA7A0CC3;
 Mon,  9 Mar 2020 18:50:46 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 772F660304;
 Mon,  9 Mar 2020 18:50:42 +0000 (UTC)
Date: Mon, 9 Mar 2020 18:50:39 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] net: Remove deprecated [hub_id name] tuple of
 'hostfwd_add' / 'hostfwd_remove'
Message-ID: <20200309185039.GB20693@work-vm>
References: <20191205104109.18680-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191205104109.18680-1-thuth@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: libvir-list@redhat.com, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Thomas Huth (thuth@redhat.com) wrote:
> It's been deprecated since QEMU v3.1.0. Time to finally remove it now.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued, via HMP, I've reworked the qemu-deprecated into the new rst
world.

> ---
>  hmp-commands.hx      |  8 ++++----
>  net/hub.c            | 23 -----------------------
>  net/hub.h            |  2 --
>  net/slirp.c          | 44 ++++++++++++--------------------------------
>  qemu-deprecated.texi | 13 ++++++++-----
>  5 files changed, 24 insertions(+), 66 deletions(-)
>=20
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index cfcc044ce4..14ccc685d7 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1463,8 +1463,8 @@ ETEXI
>  #ifdef CONFIG_SLIRP
>      {
>          .name       =3D "hostfwd_add",
> -        .args_type  =3D "arg1:s,arg2:s?,arg3:s?",
> -        .params     =3D "[hub_id name]|[netdev_id] [tcp|udp]:[hostaddr]:=
hostport-[guestaddr]:guestport",
> +        .args_type  =3D "arg1:s,arg2:s?",
> +        .params     =3D "[netdev_id] [tcp|udp]:[hostaddr]:hostport-[gues=
taddr]:guestport",
>          .help       =3D "redirect TCP or UDP connections from host to gu=
est (requires -net user)",
>          .cmd        =3D hmp_hostfwd_add,
>      },
> @@ -1478,8 +1478,8 @@ ETEXI
>  #ifdef CONFIG_SLIRP
>      {
>          .name       =3D "hostfwd_remove",
> -        .args_type  =3D "arg1:s,arg2:s?,arg3:s?",
> -        .params     =3D "[hub_id name]|[netdev_id] [tcp|udp]:[hostaddr]:=
hostport",
> +        .args_type  =3D "arg1:s,arg2:s?",
> +        .params     =3D "[netdev_id] [tcp|udp]:[hostaddr]:hostport",
>          .help       =3D "remove host-to-guest TCP or UDP redirection",
>          .cmd        =3D hmp_hostfwd_remove,
>      },
> diff --git a/net/hub.c b/net/hub.c
> index 5795a678ed..88cfb876f3 100644
> --- a/net/hub.c
> +++ b/net/hub.c
> @@ -193,29 +193,6 @@ NetClientState *net_hub_add_port(int hub_id, const c=
har *name,
>      return &port->nc;
>  }
> =20
> -/**
> - * Find a specific client on a hub
> - */
> -NetClientState *net_hub_find_client_by_name(int hub_id, const char *name=
)
> -{
> -    NetHub *hub;
> -    NetHubPort *port;
> -    NetClientState *peer;
> -
> -    QLIST_FOREACH(hub, &hubs, next) {
> -        if (hub->id =3D=3D hub_id) {
> -            QLIST_FOREACH(port, &hub->ports, next) {
> -                peer =3D port->nc.peer;
> -
> -                if (peer && strcmp(peer->name, name) =3D=3D 0) {
> -                    return peer;
> -                }
> -            }
> -        }
> -    }
> -    return NULL;
> -}
> -
>  /**
>   * Find a available port on a hub; otherwise create one new port
>   */
> diff --git a/net/hub.h b/net/hub.h
> index 66d3322fac..ce45f7b399 100644
> --- a/net/hub.h
> +++ b/net/hub.h
> @@ -15,10 +15,8 @@
>  #ifndef NET_HUB_H
>  #define NET_HUB_H
> =20
> -
>  NetClientState *net_hub_add_port(int hub_id, const char *name,
>                                   NetClientState *hubpeer);
> -NetClientState *net_hub_find_client_by_name(int hub_id, const char *name=
);
>  void net_hub_info(Monitor *mon);
>  void net_hub_check_clients(void);
>  bool net_hub_flush(NetClientState *nc);
> diff --git a/net/slirp.c b/net/slirp.c
> index c4334ee876..77042e6df7 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -610,25 +610,13 @@ error:
>      return -1;
>  }
> =20
> -static SlirpState *slirp_lookup(Monitor *mon, const char *hub_id,
> -                                const char *name)
> +static SlirpState *slirp_lookup(Monitor *mon, const char *id)
>  {
> -    if (name) {
> -        NetClientState *nc;
> -        if (hub_id) {
> -            nc =3D net_hub_find_client_by_name(strtol(hub_id, NULL, 0), =
name);
> -            if (!nc) {
> -                monitor_printf(mon, "unrecognized (hub-id, stackname) pa=
ir\n");
> -                return NULL;
> -            }
> -            warn_report("Using 'hub-id' is deprecated, specify the netde=
v id "
> -                        "directly instead");
> -        } else {
> -            nc =3D qemu_find_netdev(name);
> -            if (!nc) {
> -                monitor_printf(mon, "unrecognized netdev id '%s'\n", nam=
e);
> -                return NULL;
> -            }
> +    if (id) {
> +        NetClientState *nc =3D qemu_find_netdev(id);
> +        if (!nc) {
> +            monitor_printf(mon, "unrecognized netdev id '%s'\n", id);
> +            return NULL;
>          }
>          if (strcmp(nc->model, "user")) {
>              monitor_printf(mon, "invalid device specified\n");
> @@ -655,16 +643,12 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *=
qdict)
>      int err;
>      const char *arg1 =3D qdict_get_str(qdict, "arg1");
>      const char *arg2 =3D qdict_get_try_str(qdict, "arg2");
> -    const char *arg3 =3D qdict_get_try_str(qdict, "arg3");
> =20
> -    if (arg3) {
> -        s =3D slirp_lookup(mon, arg1, arg2);
> -        src_str =3D arg3;
> -    } else if (arg2) {
> -        s =3D slirp_lookup(mon, NULL, arg1);
> +    if (arg2) {
> +        s =3D slirp_lookup(mon, arg1);
>          src_str =3D arg2;
>      } else {
> -        s =3D slirp_lookup(mon, NULL, NULL);
> +        s =3D slirp_lookup(mon, NULL);
>          src_str =3D arg1;
>      }
>      if (!s) {
> @@ -784,16 +768,12 @@ void hmp_hostfwd_add(Monitor *mon, const QDict *qdi=
ct)
>      SlirpState *s;
>      const char *arg1 =3D qdict_get_str(qdict, "arg1");
>      const char *arg2 =3D qdict_get_try_str(qdict, "arg2");
> -    const char *arg3 =3D qdict_get_try_str(qdict, "arg3");
> =20
> -    if (arg3) {
> -        s =3D slirp_lookup(mon, arg1, arg2);
> -        redir_str =3D arg3;
> -    } else if (arg2) {
> -        s =3D slirp_lookup(mon, NULL, arg1);
> +    if (arg2) {
> +        s =3D slirp_lookup(mon, arg1);
>          redir_str =3D arg2;
>      } else {
> -        s =3D slirp_lookup(mon, NULL, NULL);
> +        s =3D slirp_lookup(mon, NULL);
>          redir_str =3D arg1;
>      }
>      if (s) {
> diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
> index 66d2b22a94..e407cc085e 100644
> --- a/qemu-deprecated.texi
> +++ b/qemu-deprecated.texi
> @@ -206,11 +206,6 @@ the 'wait' field, which is only applicable to socket=
s in server mode
> =20
>  @section Human Monitor Protocol (HMP) commands
> =20
> -@subsection The hub_id parameter of 'hostfwd_add' / 'hostfwd_remove' (si=
nce 3.1)
> -
> -The @option{[hub_id name]} parameter tuple of the 'hostfwd_add' and
> -'hostfwd_remove' HMP commands has been replaced by @option{netdev_id}.
> -
>  @subsection cpu-add (since 4.0)
> =20
>  Use ``device_add'' for hotplugging vCPUs instead of ``cpu-add''.  See
> @@ -376,6 +371,14 @@ What follows is a record of recently removed, former=
ly deprecated
>  features that serves as a record for users who have encountered
>  trouble after a recent upgrade.
> =20
> +@section Human Monitor Protocol (HMP) commands
> +
> +@subsection The hub_id parameter of 'hostfwd_add' / 'hostfwd_remove' (re=
moved in 5.0)
> +
> +The @option{[hub_id name]} parameter tuple of the 'hostfwd_add' and
> +'hostfwd_remove' HMP commands has been replaced by the single option
> +@option{netdev_id}.
> +
>  @section QEMU Machine Protocol (QMP) commands
> =20
>  @subsection block-dirty-bitmap-add "autoload" parameter (since 4.2.0)
> --=20
> 2.18.1
>=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


