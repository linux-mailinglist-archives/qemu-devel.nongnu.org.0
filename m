Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9196F0BF4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 20:31:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps6Nt-00062l-Uf; Thu, 27 Apr 2023 14:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps6No-0005y0-7K
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 14:30:22 -0400
Received: from mout.web.de ([212.227.15.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps6Nm-00061B-6b
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 14:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1682620213; i=lukasstraub2@web.de;
 bh=jJi0u76B7WJ4qwPHbWH+GZKC62pb8gR78XaPqjm7dMY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=HKZJ496+Q0sHagHpBQPQwm/rLcXcc3b2/RZZLvSGM+906RPk/a4vzvFND4tTphspt
 8dakzZGFnp+UyK0YE+wEKnXWKP8+gaKlZU2Cm2h3inxppINnHbNznhn5henZrFiKpv
 R6Fvyfi00fTMt4kUzX0qRvEr4KIqc/nLL+rmgrNmVuOh0L7UdiiIeJp/xcCk3hwwAN
 ndENBq4SJj1pbgiLQpDDYvyb+2uT+I59e/5jUrV9TG5JiVj8J5tZS/c0+ceBWvTpG+
 JXldkc1sSpO285ahlCWOT15mUQqr2loIk69groYES5z7n+N0NLgdzpjUYNu0nzlhB2
 ufnoTXWFlJvvw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.107]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mhnvw-1qVXrZ28Qq-00dnCR; Thu, 27
 Apr 2023 20:30:13 +0200
Date: Thu, 27 Apr 2023 20:30:12 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>
Subject: Re: [PATCH 02/19] migration: Move ram_stats to its own file
 migration-stats.[ch]
Message-ID: <20230427183012.247ef4cf@gecko.fritz.box>
In-Reply-To: <20230427163449.27473-3-quintela@redhat.com>
References: <20230427163449.27473-1-quintela@redhat.com>
 <20230427163449.27473-3-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PiRid/C+5Mo0SwmrgUKE0pQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:dciMlRH8Kc5jUmYgF2gnpx8A3h3Jkgdz3Hu3n/k85ornNcX+sVZ
 Kea+fYd6Vah/7xaNW6hLkBdNaLP0swAmMfTm87N8wO4uyHwTP0IKrSe4SQVpzow4SnPNxee
 jeidh87h8fo7nciWnW5yuYGVMlH/kHVTnyJI/ZZ6FeifFYhD51ilmXYdVNUzqrPXEGowltq
 HdWMgSZRJcpr66hc10yTw==
UI-OutboundReport: notjunk:1;M01:P0:aNkanzOI3LA=;iG8nTjdb7PBIb7D3JMgaVKLg+BR
 nOMCq7yzHc1VfHFp+8dq5vLT9luN+jnvqErdNzk6o9j8QgplgVi3I+Mg18RO8et8DdFB1q+jz
 C2Z9jBNOq0cDNp0X58sLeQHAC4bcDaXDrfnNT4wFrT3AkVxAeSeyA+7a3R1RqGjSijuC8mv9J
 bZ+/8ZKHyFotUcwZiWYK302pjiAoG+f5A8I/HVhuvawYVMk/IIBn3c44Y5UhvAFcmDin7pXJV
 TT747QCzO0CsDictl//IGjIYVL/41qC85BkIOo4PCIlietMbK6FTRgUYdqqN6HYP302O76pPs
 Ld4yvR/rGw8a8nxkaEFI4nxYvPMk5ZBeCleNBWsv+6HpeCakLCdIumiNqZM10PFuY8iLwN/fQ
 enoDKWANBQ9Rei8e5L7sNu47RAhIroPH0n1sZiyDdNqd11Zrwonxc6BbsHYhEqIZUfq6meiga
 yZ98MJTNt00yQo1IW7gPQD/rMVNLwbTRS9zYNwd/dW0/L8Js4Aeve0ilKvtJyrq8MomZk19up
 is3JrO/jak7JnI72wCb/yZEiGeaghw2bBL4ssfPKvuyP3TjVnPq0FsPucJGNm9LgDxXiON2+Z
 teAxdSC1FuvwAyF4jdfI+kQdYzLLKLQ6xxJE/FYT8xBclYajKSDbUhqcHuQD4227NYVLu8MH1
 g9dK3wab4ko0NHCM0Q+qpowLuAiqhUITi8MNwdQLDL0q7o8NwQfdI6DqzKo2stxEsQFGWH9lb
 zFoA7a0NSV0DxHRZtZuIlC3UlbooYnH1fuY3bmnulkl0c5CSzqW9JYkN/WmzLLuPU/cmo6PD/
 ilH5ttdH+UK4I4vtGas3xfxNzfscx9lAiIjTyn8vYJ2KYfbltyyQs7DdUrExWYQ1H+d4x8Fam
 ytFMpAxiYKMnH0S0F3KzpLwSx4jOjfsYTwKHIxNOnhfn0AHhqIqUzv8QsC4Gdv3inMVPU+tnk
 QL7zm8nL9xNBgJ5o3f36ooVvrqg=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/PiRid/C+5Mo0SwmrgUKE0pQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Apr 2023 18:34:32 +0200
Juan Quintela <quintela@redhat.com> wrote:

> There is already include/qemu/stats.h, so stats.h was a bad idea.
> We want this file to not depend on anything else, we will move all the
> migration counters/stats to this struct.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Lukas Straub <lukasstraub2@web.de>

> ---
>  migration/meson.build       |  1 +
>  migration/migration-stats.c | 17 +++++++++++++++
>  migration/migration-stats.h | 41 +++++++++++++++++++++++++++++++++++++
>  migration/migration.c       |  1 +
>  migration/multifd.c         |  1 +
>  migration/ram.c             |  3 +--
>  migration/ram.h             | 23 ---------------------
>  migration/savevm.c          |  1 +
>  8 files changed, 63 insertions(+), 25 deletions(-)
>  create mode 100644 migration/migration-stats.c
>  create mode 100644 migration/migration-stats.h
>=20
> diff --git a/migration/meson.build b/migration/meson.build
> index 480ff6854a..da1897fadf 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -19,6 +19,7 @@ softmmu_ss.add(files(
>    'fd.c',
>    'global_state.c',
>    'migration-hmp-cmds.c',
> +  'migration-stats.c',
>    'migration.c',
>    'multifd.c',
>    'multifd-zlib.c',
> diff --git a/migration/migration-stats.c b/migration/migration-stats.c
> new file mode 100644
> index 0000000000..b0eb5ae73c
> --- /dev/null
> +++ b/migration/migration-stats.c
> @@ -0,0 +1,17 @@
> +/*
> + * Migration stats
> + *
> + * Copyright (c) 2012-2023 Red Hat Inc
> + *
> + * Authors:
> + *  Juan Quintela <quintela@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/stats64.h"
> +#include "migration-stats.h"
> +
> +RAMStats ram_counters;
> diff --git a/migration/migration-stats.h b/migration/migration-stats.h
> new file mode 100644
> index 0000000000..2edea0c779
> --- /dev/null
> +++ b/migration/migration-stats.h
> @@ -0,0 +1,41 @@
> +/*
> + * Migration stats
> + *
> + * Copyright (c) 2012-2023 Red Hat Inc
> + *
> + * Authors:
> + *  Juan Quintela <quintela@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef QEMU_MIGRATION_STATS_H
> +#define QEMU_MIGRATION_STATS_H
> +
> +#include "qemu/stats64.h"
> +
> +/*
> + * These are the ram migration statistic counters.  It is loosely
> + * based on MigrationStats.  We change to Stat64 any counter that
> + * needs to be updated using atomic ops (can be accessed by more than
> + * one thread).
> + */
> +typedef struct {
> +    Stat64 dirty_bytes_last_sync;
> +    Stat64 dirty_pages_rate;
> +    Stat64 dirty_sync_count;
> +    Stat64 dirty_sync_missed_zero_copy;
> +    Stat64 downtime_bytes;
> +    Stat64 zero_pages;
> +    Stat64 multifd_bytes;
> +    Stat64 normal_pages;
> +    Stat64 postcopy_bytes;
> +    Stat64 postcopy_requests;
> +    Stat64 precopy_bytes;
> +    Stat64 transferred;
> +} RAMStats;
> +
> +extern RAMStats ram_counters;
> +
> +#endif
> diff --git a/migration/migration.c b/migration/migration.c
> index abcadbb619..5ecf3dc381 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -29,6 +29,7 @@
>  #include "migration/global_state.h"
>  #include "migration/misc.h"
>  #include "migration.h"
> +#include "migration-stats.h"
>  #include "savevm.h"
>  #include "qemu-file.h"
>  #include "channel.h"
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 6053012ad9..347999f84a 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -19,6 +19,7 @@
>  #include "qapi/error.h"
>  #include "ram.h"
>  #include "migration.h"
> +#include "migration-stats.h"
>  #include "socket.h"
>  #include "tls.h"
>  #include "qemu-file.h"
> diff --git a/migration/ram.c b/migration/ram.c
> index 89be3e3320..a6d5478ef8 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -36,6 +36,7 @@
>  #include "xbzrle.h"
>  #include "ram.h"
>  #include "migration.h"
> +#include "migration-stats.h"
>  #include "migration/register.h"
>  #include "migration/misc.h"
>  #include "qemu-file.h"
> @@ -460,8 +461,6 @@ uint64_t ram_bytes_remaining(void)
>                         0;
>  }
> =20
> -RAMStats ram_counters;
> -
>  void ram_transferred_add(uint64_t bytes)
>  {
>      if (runstate_is_running()) {
> diff --git a/migration/ram.h b/migration/ram.h
> index 04b05e1b2c..8692de6ba0 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -32,30 +32,7 @@
>  #include "qapi/qapi-types-migration.h"
>  #include "exec/cpu-common.h"
>  #include "io/channel.h"
> -#include "qemu/stats64.h"
> =20
> -/*
> - * These are the ram migration statistic counters.  It is loosely
> - * based on MigrationStats.  We change to Stat64 any counter that
> - * needs to be updated using atomic ops (can be accessed by more than
> - * one thread).
> - */
> -typedef struct {
> -    Stat64 dirty_bytes_last_sync;
> -    Stat64 dirty_pages_rate;
> -    Stat64 dirty_sync_count;
> -    Stat64 dirty_sync_missed_zero_copy;
> -    Stat64 downtime_bytes;
> -    Stat64 zero_pages;
> -    Stat64 multifd_bytes;
> -    Stat64 normal_pages;
> -    Stat64 postcopy_bytes;
> -    Stat64 postcopy_requests;
> -    Stat64 precopy_bytes;
> -    Stat64 transferred;
> -} RAMStats;
> -
> -extern RAMStats ram_counters;
>  extern XBZRLECacheStats xbzrle_counters;
>  extern CompressionStats compression_counters;
> =20
> diff --git a/migration/savevm.c b/migration/savevm.c
> index a9181b444b..8e2efb1a19 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -31,6 +31,7 @@
>  #include "net/net.h"
>  #include "migration.h"
>  #include "migration/snapshot.h"
> +#include "migration-stats.h"
>  #include "migration/vmstate.h"
>  #include "migration/misc.h"
>  #include "migration/register.h"



--=20


--Sig_/PiRid/C+5Mo0SwmrgUKE0pQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRKvzQACgkQNasLKJxd
slh1VxAAuQ4U2m76h8BLbjrUfNlTOBbKQj5atc+PiEeitrPjqjDr1wXakzF62p1s
JMCY+XjCoLK9qf3D0ugJJa2fYCaafyJRFAjHygnSm8bekagxk+1I3/QtXb0WWU9f
Egse4XNe/zljUhoIXLPEmgAg8xBED4YZg4tPh84mNDDqjQKR0XRFUm+DGbYbQ4XG
OHfjJEiLV59QN37Uvgzv66SUrmGyoCrE+FMBghotJaW0MESP6YMAE/XagIs3iToc
WYdfWryDxDTejX7BNj7a9L2c3RP3Xx1lmBXaV3XuR8DSZxhMEZvvJ1AqIcM4cpZF
rFn0UI66Y8UClwv5SMzsY9t46iPdb9GE+wDBe63w5cIkKVYSR4LB3gmScJ1sZkpt
zmqjhky6jWIHfd3VR+bITudX6xmq8o8uJSoTDn1jPBswT3NhxAMAbtncuAmRQyLt
MCKBkYbaA53C4ybE9bmIzbGQYzpKZLxvHFAZvgc7uJgMDz5NOdHVt9k9FrBnAD0F
WDgZBkN/GKtQf99aaYEqzFGlFK99cJh8BPnbe1hmuc1heUF+sbYWUbz6R1K57DZ8
koQytjVomd/z1OVMOgz40T0IlQMmdldJaFcw/yEpkIIYJU0A5NZT4lJsAdf+r7sG
mSUNaV18Jl8fQR6Va/nuxWsglaWgA/Xw2VELCDrKV8JIatabGBg=
=bEsW
-----END PGP SIGNATURE-----

--Sig_/PiRid/C+5Mo0SwmrgUKE0pQ--

