Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C59F4D30D8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 15:13:27 +0100 (CET)
Received: from localhost ([::1]:46932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRx4A-0001ao-4X
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 09:13:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRx2f-0000Zq-LW
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 09:11:54 -0500
Received: from [2a00:1450:4864:20::336] (port=53086
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRx2d-0003n5-Iy
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 09:11:53 -0500
Received: by mail-wm1-x336.google.com with SMTP id r65so1455838wma.2
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 06:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AOJIUbhOIF5HWWxAWvTpMhivAJ0hyu6bzJtFzR1gwSA=;
 b=PTm0T9p9EuS1N2RtDL/NpkKI3AEYd0n0Bt/fWtMgmHcrN/UrfF8xT6sl21vT1gBToJ
 kK4rXd2YKqUgCHWa82clm+JzVssiFUsDk5bC8zBoVUyAN2vzvzqtuKH7X3WY2JBz4oMb
 sIm/XZ4bbMmUd0n1A7rW++0gpI4v73dGcmIjGx6ONUEC4yqcbl0G+ojjTT1vdv/nhRTb
 py3E4RyKlMEp9WOfJSfqa9HM+r3KfegVKMMQpW5XrnKxEDyPteu2oBiAd6H2tBUHUzw0
 SyPOtSspDYjOydQS7cgxwFExOyjIIFQMZjAg3h22p8CjSEgCC1T3Ycl0skgCuOxS7dss
 y/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AOJIUbhOIF5HWWxAWvTpMhivAJ0hyu6bzJtFzR1gwSA=;
 b=fW2Nm41GnEMRvSHbi+v+AGQxurLCfSMTw3XUCFJYAuD+FKGLXplsR5IkfFxaICR+3y
 Xq2+XC48R184hdyIoWinOWyGdm/69pMyiIV5BoIN12mUpF9/EEksEvFLRlMn4I/041Lh
 zdyD4eFeb3rUmvizJQ09GjdSRFrKYmI3YXQ/2if+F+UmFtp4EVMjyeg02aen1N/XwA2l
 4zfx0bZh60kQOquuGmSFNsIpY6ZbcV3sypRTfE8U5uSY0WV74K5HIgjICGjzs8g+NS52
 dDeIzwCluvicLnGLJiOKw/LhdhFPJiw8qo2DBfAm5lqCFAXNewHh7722/K9+f0vvzXbO
 UzLw==
X-Gm-Message-State: AOAM5315+geg2tD2zA/f3DUXtXAKslfCgn1SCpJomJVlOoAvW36xhOH2
 JQSFp8DvSw08Xn5BCQr0451YCOHyooTwS6pXhAo=
X-Google-Smtp-Source: ABdhPJyJFUpYqMsHtVhD3NG+XoTEkEHFy5tBazFNyUdYS6tzLAWHl9cp7RsgecBeo2w8qt1RcqG8t2ZZ/6TJGdbK5qU=
X-Received: by 2002:a05:600c:154e:b0:381:81d1:8e78 with SMTP id
 f14-20020a05600c154e00b0038181d18e78mr7927018wmg.51.1646835109451; Wed, 09
 Mar 2022 06:11:49 -0800 (PST)
MIME-Version: 1.0
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-12-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1640199934-455149-12-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Mar 2022 18:11:37 +0400
Message-ID: <CAJ+F1C+O91Hohh6MLEaQ3e-3De2Ru1U+OemhX3B3DrJqXzuTMg@mail.gmail.com>
Subject: Re: [PATCH V7 11/29] qapi: list utility functions
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000b3dae005d9c9ad2d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b3dae005d9c9ad2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 22, 2021 at 11:42 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Generalize strList_from_comma_list() to take any delimiter character,
> rename
> as strList_from_string(), and move it to qapi/util.c.  Also add
> strv_from_strList() and QAPI_LIST_LENGTH().
>

Looks like you could easily split, and add some tests.


>
> No functional change.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  include/qapi/util.h | 28 ++++++++++++++++++++++++++++
>  monitor/hmp-cmds.c  | 29 ++---------------------------
>  qapi/qapi-util.c    | 37 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+), 27 deletions(-)
>
> diff --git a/include/qapi/util.h b/include/qapi/util.h
> index 81a2b13..c249108 100644
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
> @@ -31,6 +33,19 @@ bool qapi_bool_parse(const char *name, const char
> *value, bool *obj,
>  int parse_qapi_name(const char *name, bool complete);
>
>  /*
> + * Produce and return a NULL-terminated array of strings from @args.
> + * All strings are g_strdup'd.
> + */
> +char **strv_from_strList(const struct strList *args);
>
+
>

I'd suggest to use the dedicated glib type GStrv


> +/*
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
> @@ -56,4 +71,17 @@ int parse_qapi_name(const char *name, bool complete);
>      (tail) =3D &(*(tail))->next; \
>  } while (0)
>
> +/*
> + * For any GenericList @list, return its length.
> + */
> +#define QAPI_LIST_LENGTH(list) \
> +    ({ \
> +        int len =3D 0; \
> +        typeof(list) elem; \
> +        for (elem =3D list; elem !=3D NULL; elem =3D elem->next) { \
> +            len++; \
> +        } \
> +        len; \
> +    })
> +
>  #endif
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index b8c22da..5ca8b4b 100644
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
> @@ -1103,7 +1078,7 @@ void hmp_announce_self(Monitor *mon, const QDict
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
> index fda7044..edd51b3 100644
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
> @@ -152,3 +153,39 @@ int parse_qapi_name(const char *str, bool complete)
>      }
>      return p - str;
>  }
> +
> +char **strv_from_strList(const strList *args)
> +{
> +    const strList *arg;
> +    int i =3D 0;
> +    char **argv =3D g_malloc((QAPI_LIST_LENGTH(args) + 1) * sizeof(char =
*));
> +
> +    for (arg =3D args; arg !=3D NULL; arg =3D arg->next) {
> +        argv[i++] =3D g_strdup(arg->value);
> +    }
> +    argv[i] =3D NULL;
> +
> +    return argv;
> +}
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

--000000000000b3dae005d9c9ad2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 22, 2021 at 11:42 PM St=
eve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare=
@oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Generalize strList_from_comma_list() to take any delimiter chara=
cter, rename<br>
as strList_from_string(), and move it to qapi/util.c.=C2=A0 Also add<br>
strv_from_strList() and QAPI_LIST_LENGTH().<br></blockquote><div><br></div>=
<div>Looks like you could easily split, and add some tests.<br></div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
No functional change.<br>
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0include/qapi/util.h | 28 ++++++++++++++++++++++++++++<br>
=C2=A0monitor/hmp-cmds.c=C2=A0 | 29 ++---------------------------<br>
=C2=A0qapi/qapi-util.c=C2=A0 =C2=A0 | 37 ++++++++++++++++++++++++++++++++++=
+++<br>
=C2=A03 files changed, 67 insertions(+), 27 deletions(-)<br>
<br>
diff --git a/include/qapi/util.h b/include/qapi/util.h<br>
index 81a2b13..c249108 100644<br>
--- a/include/qapi/util.h<br>
+++ b/include/qapi/util.h<br>
@@ -22,6 +22,8 @@ typedef struct QEnumLookup {<br>
=C2=A0 =C2=A0 =C2=A0const int size;<br>
=C2=A0} QEnumLookup;<br>
<br>
+struct strList;<br>
+<br>
=C2=A0const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);<br>
=C2=A0int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0int def, Error **errp);<br>
@@ -31,6 +33,19 @@ bool qapi_bool_parse(const char *name, const char *value=
, bool *obj,<br>
=C2=A0int parse_qapi_name(const char *name, bool complete);<br>
<br>
=C2=A0/*<br>
+ * Produce and return a NULL-terminated array of strings from @args.<br>
+ * All strings are g_strdup&#39;d.<br>
+ */<br>
+char **strv_from_strList(const struct strList *args); <br></blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">+<br></blockquote><div><br><=
/div><div>I&#39;d suggest to use the dedicated glib type GStrv<br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+/*<br>
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
@@ -56,4 +71,17 @@ int parse_qapi_name(const char *name, bool complete);<br=
>
=C2=A0 =C2=A0 =C2=A0(tail) =3D &amp;(*(tail))-&gt;next; \<br>
=C2=A0} while (0)<br>
<br>
+/*<br>
+ * For any GenericList @list, return its length.<br>
+ */<br>
+#define QAPI_LIST_LENGTH(list) \<br>
+=C2=A0 =C2=A0 ({ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D 0; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 typeof(list) elem; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (elem =3D list; elem !=3D NULL; elem =3D e=
lem-&gt;next) { \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len++; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len; \<br>
+=C2=A0 =C2=A0 })<br>
+<br>
=C2=A0#endif<br>
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c<br>
index b8c22da..5ca8b4b 100644<br>
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
@@ -1103,7 +1078,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdi=
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
index fda7044..edd51b3 100644<br>
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
@@ -152,3 +153,39 @@ int parse_qapi_name(const char *str, bool complete)<br=
>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return p - str;<br>
=C2=A0}<br>
+<br>
+char **strv_from_strList(const strList *args)<br>
+{<br>
+=C2=A0 =C2=A0 const strList *arg;<br>
+=C2=A0 =C2=A0 int i =3D 0;<br>
+=C2=A0 =C2=A0 char **argv =3D g_malloc((QAPI_LIST_LENGTH(args) + 1) * size=
of(char *));<br>
+<br>
+=C2=A0 =C2=A0 for (arg =3D args; arg !=3D NULL; arg =3D arg-&gt;next) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 argv[i++] =3D g_strdup(arg-&gt;value);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 argv[i] =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 return argv;<br>
+}<br>
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

--000000000000b3dae005d9c9ad2d--

