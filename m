Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BC254E6B9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 18:12:45 +0200 (CEST)
Received: from localhost ([::1]:35668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1s6u-0003jE-Ry
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 12:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1ryn-0007pp-I9
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:04:21 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:45681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1ryk-0006aI-TE
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:04:20 -0400
Received: by mail-lj1-x22b.google.com with SMTP id s10so1955082ljh.12
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VUGigFM5VQxoqclH9OOU+J9eGfjkWOZE1mwyN8sEcXc=;
 b=RV4fd1iaWqTkTnh8tLmT3sUAs3wcoq4RkwsaMWDKz1oxLQ3c5aKfWdp5stn6J5YOGs
 MLbENSx53hLe6X4+3U5f//g/oALQYPLikUMn0ZO/AlsOYZvZF5DKGClkbz3IE20Kcefl
 k6/xaoYzDhjKx87e/MgERA9ggyYhTAioA6sJ1h/3IXBFNSAaiWH4EhKNGg6LNURy0v+C
 9YsNWjqLHDH2TXhNsUyHIExQGHB0lr4C+7af/LNuJgVPmcjCVHhWhsxg9XDkcojyIULD
 Xt83PjEwzZ1SaTD3UFhtt2x74nisRzJDL9Anfk8BSbV02dRN4fabOgcPRgOAYKE11lsm
 TNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VUGigFM5VQxoqclH9OOU+J9eGfjkWOZE1mwyN8sEcXc=;
 b=j/DYOC82ZciCd0TNkRz2NCETmDoLedAyPbUT/ktZptoDfpmAToumAC71F4KXS3lrGr
 njHHbWnsQ/rvwFX8qppRdyiPIeCsOLoYzcV7pcbN8ZBKCOI68Uqc06A9W17MXvA/mEC9
 gXyJZhIBl+IKUEEeRR0kUrQJuW8rovm7sVVw/wOdDPIPRv3s1PJ1VJ3SInQIbgYvpLtW
 zMGQ1eUPT9ZNmfhTfxWCLOz5MlHhsFZwcj9RiRDzBM74nwZi/oj6Ev5BU3bHndgHQaa8
 1fY89ZKynT63C2SVbuSWyeRk8Ey++rC1noiKGpAp7lNfV6VbCYeeZenHNQIEyxB4gAI0
 MA2g==
X-Gm-Message-State: AJIora9FcknvYC4X+pxdSQfYbU1vOVVvYolZaCvPRgK8DxDS2Y283P1w
 ZVUD/S/4RY6TcNLdoTRKYTFqEPOVhbvWToFCpCE=
X-Google-Smtp-Source: AGRyM1uODdodnPR9G3cKI39SvjIrirZueSJoSBKGKGDb8ATVD3CkflttPICOCx26OMG0MAIUvcQBLdvY/KIsuEP7cIg=
X-Received: by 2002:a2e:a54d:0:b0:255:9cf4:5bea with SMTP id
 e13-20020a2ea54d000000b002559cf45beamr2761484ljn.524.1655395456731; Thu, 16
 Jun 2022 09:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-15-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1655304746-102776-15-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 16 Jun 2022 20:04:05 +0400
Message-ID: <CAJ+F1CL8Pi5PFX+4Uop88ONjXozSS1cArWUt6UrnmPkrUHB3ew@mail.gmail.com>
Subject: Re: [PATCH V8 14/39] qapi: strList_from_string
To: Steve Sistare <steven.sistare@oracle.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Jason Zeng <jason.zeng@linux.intel.com>, Zheng Chuan <zhengchuan@huawei.com>, 
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000294fdc05e192cae6"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000294fdc05e192cae6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jun 15, 2022 at 7:04 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Generalize strList_from_comma_list() to take any delimiter character,
> rename
> as strList_from_string(), and move it to qapi/util.c.
>
> No functional change.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  include/qapi/util.h |  9 +++++++++
>  monitor/hmp-cmds.c  | 29 ++---------------------------
>  qapi/qapi-util.c    | 23 +++++++++++++++++++++++
>  3 files changed, 34 insertions(+), 27 deletions(-)
>
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
>

suspicious, you can't include qapi/qapi-builtin-types.h here?

 const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
>  int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
>                      int def, Error **errp);
> @@ -31,6 +33,13 @@ bool qapi_bool_parse(const char *name, const char
> *value, bool *obj,
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
> index bb12589..9f58b1f 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -43,6 +43,7 @@
>  #include "qapi/qapi-commands-run-state.h"
>  #include "qapi/qapi-commands-tpm.h"
>  #include "qapi/qapi-commands-ui.h"
> +#include "qapi/util.h"
>  #include "qapi/qapi-visit-net.h"
>  #include "qapi/qapi-visit-migration.h"
>  #include "qapi/qmp/qdict.h"
> @@ -70,32 +71,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
>      return false;
>  }
>
> -/*
> - * Produce a strList from a comma separated list.
> - * A NULL or empty input string return NULL.
> - */
> -static strList *strList_from_comma_list(const char *in)
> -{
> -    strList *res =3D NULL;
> -    strList **tail =3D &res;
> -
> -    while (in && in[0]) {
> -        char *comma =3D strchr(in, ',');
> -        char *value;
> -
> -        if (comma) {
> -            value =3D g_strndup(in, comma - in);
> -            in =3D comma + 1; /* skip the , */
> -        } else {
> -            value =3D g_strdup(in);
> -            in =3D NULL;
> -        }
> -        QAPI_LIST_APPEND(tail, value);
> -    }
> -
> -    return res;
> -}
> -
>  void hmp_info_name(Monitor *mon, const QDict *qdict)
>  {
>      NameInfo *info;
> @@ -1115,7 +1090,7 @@ void hmp_announce_self(Monitor *mon, const QDict
> *qdict)
>                                              migrate_announce_params());
>
>      qapi_free_strList(params->interfaces);
> -    params->interfaces =3D strList_from_comma_list(interfaces_str);
> +    params->interfaces =3D strList_from_string(interfaces_str, ',');
>      params->has_interfaces =3D params->interfaces !=3D NULL;
>      params->id =3D g_strdup(id);
>      params->has_id =3D !!params->id;
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
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000294fdc05e192cae6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, 2022 at 7:04 PM Ste=
ve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@=
oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Generalize strList_from_comma_list() to take any delimiter chara=
cter, rename<br>
as strList_from_string(), and move it to qapi/util.c.<br>
<br>
No functional change.<br>
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0include/qapi/util.h |=C2=A0 9 +++++++++<br>
=C2=A0monitor/hmp-cmds.c=C2=A0 | 29 ++---------------------------<br>
=C2=A0qapi/qapi-util.c=C2=A0 =C2=A0 | 23 +++++++++++++++++++++++<br>
=C2=A03 files changed, 34 insertions(+), 27 deletions(-)<br>
<br>
diff --git a/include/qapi/util.h b/include/qapi/util.h<br>
index 81a2b13..7d88b09 100644<br>
--- a/include/qapi/util.h<br>
+++ b/include/qapi/util.h<br>
@@ -22,6 +22,8 @@ typedef struct QEnumLookup {<br>
=C2=A0 =C2=A0 =C2=A0const int size;<br>
=C2=A0} QEnumLookup;<br>
<br>
+struct strList;<br>
+<br></blockquote><div><br></div><div>suspicious, you can&#39;t include qap=
i/qapi-builtin-types.h here?</div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
=C2=A0const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);<br>
=C2=A0int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0int def, Error **errp);<br>
@@ -31,6 +33,13 @@ bool qapi_bool_parse(const char *name, const char *value=
, bool *obj,<br>
=C2=A0int parse_qapi_name(const char *name, bool complete);<br>
<br>
=C2=A0/*<br>
+ * Produce a strList from the character delimited string @in.<br>
+ * All strings are g_strdup&#39;d.<br>
+ * A NULL or empty input string returns NULL.<br>
+ */<br>
+struct strList *strList_from_string(const char *in, char delim);<br>
+<br>
+/*<br>
=C2=A0 * For any GenericList @list, insert @element at the front.<br>
=C2=A0 *<br>
=C2=A0 * Note that this macro evaluates @element exactly once, so it is saf=
e<br>
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c<br>
index bb12589..9f58b1f 100644<br>
--- a/monitor/hmp-cmds.c<br>
+++ b/monitor/hmp-cmds.c<br>
@@ -43,6 +43,7 @@<br>
=C2=A0#include &quot;qapi/qapi-commands-run-state.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-commands-tpm.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-commands-ui.h&quot;<br>
+#include &quot;qapi/util.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-visit-net.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-visit-migration.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
@@ -70,32 +71,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
<br>
-/*<br>
- * Produce a strList from a comma separated list.<br>
- * A NULL or empty input string return NULL.<br>
- */<br>
-static strList *strList_from_comma_list(const char *in)<br>
-{<br>
-=C2=A0 =C2=A0 strList *res =3D NULL;<br>
-=C2=A0 =C2=A0 strList **tail =3D &amp;res;<br>
-<br>
-=C2=A0 =C2=A0 while (in &amp;&amp; in[0]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *comma =3D strchr(in, &#39;,&#39;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *value;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (comma) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D g_strndup(in, comma - =
in);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in =3D comma + 1; /* skip the , =
*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D g_strdup(in);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, value);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return res;<br>
-}<br>
-<br>
=C2=A0void hmp_info_name(Monitor *mon, const QDict *qdict)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0NameInfo *info;<br>
@@ -1115,7 +1090,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdi=
ct)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0migrate_announce_params());<br>
<br>
=C2=A0 =C2=A0 =C2=A0qapi_free_strList(params-&gt;interfaces);<br>
-=C2=A0 =C2=A0 params-&gt;interfaces =3D strList_from_comma_list(interfaces=
_str);<br>
+=C2=A0 =C2=A0 params-&gt;interfaces =3D strList_from_string(interfaces_str=
, &#39;,&#39;);<br>
=C2=A0 =C2=A0 =C2=A0params-&gt;has_interfaces =3D params-&gt;interfaces !=
=3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0params-&gt;id =3D g_strdup(id);<br>
=C2=A0 =C2=A0 =C2=A0params-&gt;has_id =3D !!params-&gt;id;<br>
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c<br>
index 63596e1..b61c73c 100644<br>
--- a/qapi/qapi-util.c<br>
+++ b/qapi/qapi-util.c<br>
@@ -15,6 +15,7 @@<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/ctype.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qerror.h&quot;<br>
+#include &quot;qapi/qapi-builtin-types.h&quot;<br>
<br>
=C2=A0CompatPolicy compat_policy;<br>
<br>
@@ -152,3 +153,25 @@ int parse_qapi_name(const char *str, bool complete)<br=
>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return p - str;<br>
=C2=A0}<br>
+<br>
+strList *strList_from_string(const char *in, char delim)<br>
+{<br>
+=C2=A0 =C2=A0 strList *res =3D NULL;<br>
+=C2=A0 =C2=A0 strList **tail =3D &amp;res;<br>
+<br>
+=C2=A0 =C2=A0 while (in &amp;&amp; in[0]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *next =3D strchr(in, delim);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *value;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D g_strndup(in, next - i=
n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in =3D next + 1; /* skip the del=
im */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D g_strdup(in);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, value);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return res;<br>
+}<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000294fdc05e192cae6--

