Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336CD68E875
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 07:44:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPeBG-00069Y-Ne; Wed, 08 Feb 2023 01:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pPeBB-00067l-As
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 01:43:41 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pPeB9-0006GQ-3u
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 01:43:40 -0500
Received: by mail-lj1-x230.google.com with SMTP id u27so18176761ljo.12
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 22:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l6FN4vAWtZ5SSZhAzQdDpRhidC3RRdvXOPkG08SdmTI=;
 b=QnMoCgdJBIiPRUlo6xBVgDpQ2l3MfTq7K5IsV5Ypzf8cLxGgKc0XO/iNApnA+Ijbah
 KiXvdrXAr0VuI3xF8NH+Kw5DUvkkxx7rrWHeBiwI4orRH8Tl5j9tqVNd2H4ehfDjwVSS
 VN5WptoZTAM4S3gGo5a85n2+iLWG3aZROpRzNbvzZ3qc7yXh9AYXZcw52NPf4YT3ek00
 hZufs9GHJIrFBD1Zcdt2jq6IlsK9jApnI29MmGIJs9fsAuhaAmG5TpFa5RHC0vpQPW38
 U6WGK3v4s0idu9LxajlXo+q99bTXLZSdx5i7jqJnIYJ3Dn8UrqLOF2wiCtxinsQf62AK
 Y5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l6FN4vAWtZ5SSZhAzQdDpRhidC3RRdvXOPkG08SdmTI=;
 b=5oKooorquA2dCIw7+PNY72h11ppMGe/1gqgT7QGGi70tg/zwHBIrdyRtAAWPQnH1QE
 4/JQoM9LaRd0sqQJ9WekxGn+Y1NBT0Jv2AYlZojV0LNSZgRpw1xFLj/aM357O2zQvtry
 sM42LgAjzc6rB4LLssK4DR0SLqmEmJpXKSpVHc9Mva0amWuU0Ov/bNt8/aiEDpG7zQaI
 8ZpKqzSZyZFdeomUeI+QO1oDgWIfgYdcwZIg+sytKiKlZcDEkAHIhUxkMCzBpbZuA1In
 8qHFbTrjcFEnc6F3qJqM1F3bXrqnoezVt3K7Hb0tk2DdI2uy2VgIlVQLxUGwBpBwpf3W
 OhfQ==
X-Gm-Message-State: AO0yUKUOkS5G3qVXWxtuR4CYm+0QOVlFx5wGdTKrZGQO2Lx/JC6oA/DE
 riRANJ53ENtTmqTjTg4eYNyUuFaWys6jFCaM6NM=
X-Google-Smtp-Source: AK7set+Ir8ZBXP1w0ARdaEEdzuVoQ7DXhYKD109DtOY1xIs8Wez7o2u3HNXYMG0EZ3ago4y3nt50IZ28LpS/XfjWs4E=
X-Received: by 2002:a2e:88c4:0:b0:293:1cfb:a432 with SMTP id
 a4-20020a2e88c4000000b002931cfba432mr871639ljk.153.1675838617059; Tue, 07 Feb
 2023 22:43:37 -0800 (PST)
MIME-Version: 1.0
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
 <1675795727-235010-2-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1675795727-235010-2-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 8 Feb 2023 10:43:25 +0400
Message-ID: <CAJ+F1CLFMUDvaOq2QXCKpb8Zj4PRr-tKV1q9L8m2EfgORPLj7A@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] qapi: strList_from_string
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi

On Tue, Feb 7, 2023 at 10:50 PM Steve Sistare <steven.sistare@oracle.com> w=
rote:
>
> Generalize hmp_split_at_comma() to take any delimiter character, rename
> as strList_from_string(), and move it to qapi/util.c.
>
> No functional change.

The g_strsplit() version was a bit simpler, but if you want to
optimize it a bit for 1 char delimiter only, ok.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  include/monitor/hmp.h  |  1 -
>  include/qapi/util.h    |  9 +++++++++
>  monitor/hmp-cmds.c     | 19 -------------------
>  net/net-hmp-cmds.c     |  2 +-
>  qapi/qapi-util.c       | 23 +++++++++++++++++++++++
>  stats/stats-hmp-cmds.c |  2 +-
>  6 files changed, 34 insertions(+), 22 deletions(-)
>
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 2220f14..e80848f 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -19,7 +19,6 @@
>
>  bool hmp_handle_error(Monitor *mon, Error *err);
>  void hmp_help_cmd(Monitor *mon, const char *name);
> -strList *hmp_split_at_comma(const char *str);
>
>  void hmp_info_name(Monitor *mon, const QDict *qdict);
>  void hmp_info_version(Monitor *mon, const QDict *qdict);
> diff --git a/include/qapi/util.h b/include/qapi/util.h
> index 81a2b13..7d88b09 100644
> --- a/include/qapi/util.h
> +++ b/include/qapi/util.h
> @@ -22,6 +22,8 @@ typedef struct QEnumLookup {
>      const int size;
>  } QEnumLookup;
>
> +struct strList;
> +
>  const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
>  int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
>                      int def, Error **errp);
> @@ -31,6 +33,13 @@ bool qapi_bool_parse(const char *name, const char *val=
ue, bool *obj,
>  int parse_qapi_name(const char *name, bool complete);
>
>  /*
> + * Produce a strList from the character delimited string @in.
> + * All strings are g_strdup'd.
> + * A NULL or empty input string returns NULL.
> + */
> +struct strList *strList_from_string(const char *in, char delim);
> +
> +/*
>   * For any GenericList @list, insert @element at the front.
>   *
>   * Note that this macro evaluates @element exactly once, so it is safe
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 34bd8c6..9665e6e 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -39,25 +39,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
>      return false;
>  }
>
> -/*
> - * Split @str at comma.
> - * A null @str defaults to "".
> - */
> -strList *hmp_split_at_comma(const char *str)
> -{
> -    char **split =3D g_strsplit(str ?: "", ",", -1);
> -    strList *res =3D NULL;
> -    strList **tail =3D &res;
> -    int i;
> -
> -    for (i =3D 0; split[i]; i++) {
> -        QAPI_LIST_APPEND(tail, split[i]);
> -    }
> -
> -    g_free(split);
> -    return res;
> -}
> -
>  void hmp_info_name(Monitor *mon, const QDict *qdict)
>  {
>      NameInfo *info;
> diff --git a/net/net-hmp-cmds.c b/net/net-hmp-cmds.c
> index 41d326b..30422d9 100644
> --- a/net/net-hmp-cmds.c
> +++ b/net/net-hmp-cmds.c
> @@ -72,7 +72,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict=
)
>                                              migrate_announce_params());
>
>      qapi_free_strList(params->interfaces);
> -    params->interfaces =3D hmp_split_at_comma(interfaces_str);
> +    params->interfaces =3D strList_from_string(interfaces_str, ',');
>      params->has_interfaces =3D params->interfaces !=3D NULL;
>      params->id =3D g_strdup(id);
>      qmp_announce_self(params, NULL);
> diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
> index 63596e1..b61c73c 100644
> --- a/qapi/qapi-util.c
> +++ b/qapi/qapi-util.c
> @@ -15,6 +15,7 @@
>  #include "qapi/error.h"
>  #include "qemu/ctype.h"
>  #include "qapi/qmp/qerror.h"
> +#include "qapi/qapi-builtin-types.h"
>
>  CompatPolicy compat_policy;
>
> @@ -152,3 +153,25 @@ int parse_qapi_name(const char *str, bool complete)
>      }
>      return p - str;
>  }
> +
> +strList *strList_from_string(const char *in, char delim)
> +{
> +    strList *res =3D NULL;
> +    strList **tail =3D &res;
> +
> +    while (in && in[0]) {
> +        char *next =3D strchr(in, delim);
> +        char *value;
> +
> +        if (next) {
> +            value =3D g_strndup(in, next - in);
> +            in =3D next + 1; /* skip the delim */
> +        } else {
> +            value =3D g_strdup(in);
> +            in =3D NULL;
> +        }
> +        QAPI_LIST_APPEND(tail, value);
> +    }
> +
> +    return res;
> +}
> diff --git a/stats/stats-hmp-cmds.c b/stats/stats-hmp-cmds.c
> index 531e35d..4a2adf8 100644
> --- a/stats/stats-hmp-cmds.c
> +++ b/stats/stats-hmp-cmds.c
> @@ -174,7 +174,7 @@ static StatsFilter *stats_filter(StatsTarget target, =
const char *names,
>              request->provider =3D provider_idx;
>              if (names && !g_str_equal(names, "*")) {
>                  request->has_names =3D true;
> -                request->names =3D hmp_split_at_comma(names);
> +                request->names =3D strList_from_string(names, ',');
>              }
>              QAPI_LIST_PREPEND(request_list, request);
>          }
> --
> 1.8.3.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

