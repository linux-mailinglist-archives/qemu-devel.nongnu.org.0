Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B373927F0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 08:42:05 +0200 (CEST)
Received: from localhost ([::1]:59044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm9iW-00058T-6e
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 02:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lm9hO-0004Jv-IY
 for qemu-devel@nongnu.org; Thu, 27 May 2021 02:40:54 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:35493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lm9hK-000593-VT
 for qemu-devel@nongnu.org; Thu, 27 May 2021 02:40:53 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-jixavwZTMh6zP1fPoIXMOw-1; Thu, 27 May 2021 02:40:44 -0400
X-MC-Unique: jixavwZTMh6zP1fPoIXMOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 289211883520;
 Thu, 27 May 2021 06:40:42 +0000 (UTC)
Received: from bahia.lan (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A165F61156;
 Thu, 27 May 2021 06:40:39 +0000 (UTC)
Date: Thu, 27 May 2021 08:40:38 +0200
From: Greg Kurz <groug@kaod.org>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 4/5] monitor: removed cpustats command
Message-ID: <20210527084038.512c5270@bahia.lan>
In-Reply-To: <20210526202104.127910-5-bruno.larsen@eldorado.org.br>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-5-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 May 2021 17:21:03 -0300
"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> wrote:

> Since ppc was the last architecture to collect these statistics and
> it is currently phasing this collection out, the command that would query
> this information is being removed.
>=20

So this is removing an obviously user visible feature. This should be
mentioned in docs/system/removed-features.rst... but, wait, I don't
see anything for it in docs/system/deprecated.rst. This is dropping
a feature without following the usual deprecation policy, i.e.
marking the feature as deprecated and only remove it 2 QEMU versions
later. Any justification for that ?

David,

Unrelated, I saw that you already applied this to ppc-for-6.1 on gitlab
but the commit title appears to be broken:

'65;6401;1cmonitor: removed cpustats command

https://gitlab.com/dgibson/qemu/-/commit/532be563eae6b8ae834ff7e9ebb1428f53=
569a69

> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  hmp-commands-info.hx | 13 -------------
>  monitor/misc.c       | 11 -----------
>  2 files changed, 24 deletions(-)
>=20
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index ab0c7aa5ee..b2347a6aea 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -500,19 +500,6 @@ SRST
>      Show the current VM UUID.
>  ERST
> =20
> -    {
> -        .name       =3D "cpustats",
> -        .args_type  =3D "",
> -        .params     =3D "",
> -        .help       =3D "show CPU statistics",
> -        .cmd        =3D hmp_info_cpustats,
> -    },
> -
> -SRST
> -  ``info cpustats``
> -    Show CPU statistics.
> -ERST
> -
>  #if defined(CONFIG_SLIRP)
>      {
>          .name       =3D "usernet",
> diff --git a/monitor/misc.c b/monitor/misc.c
> index f3a393ea59..1539e18557 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -369,17 +369,6 @@ static void hmp_info_history(Monitor *mon, const QDi=
ct *qdict)
>      }
>  }
> =20
> -static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
> -{
> -    CPUState *cs =3D mon_get_cpu(mon);
> -
> -    if (!cs) {
> -        monitor_printf(mon, "No CPU available\n");
> -        return;
> -    }
> -    cpu_dump_statistics(cs, 0);
> -}
> -
>  static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
>  {
>      const char *name =3D qdict_get_try_str(qdict, "name");


