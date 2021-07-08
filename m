Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5809C3C154B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:39:14 +0200 (CEST)
Received: from localhost ([::1]:52362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VBJ-0001iL-A3
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1V9n-0007mc-1i
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:37:39 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1V9l-0002k3-7t
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:37:38 -0400
Received: by mail-ej1-x632.google.com with SMTP id o5so10045393ejy.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gbxGBSpsRbT/5XHbY3hvQZXNJx9i+gbuEcoJ0VQd7pc=;
 b=kb5IRWKMGuev7eAO4n6aE24QwVkG0FkNOu9iB368ovRSsxrEuzATZIb+q2kIi5V1XS
 2jw/1RdBo/Y/9RUaERy5SuUAf6USFXmKWEy0mag5dlcr8biqGIEu7pJUb38B4jC51Tp0
 l9wPMnUlrKkDZrjY6GPr+44kcyJzLGYeGDdNXFB6hm/bKdPmBS0OwMVrZ2GpaUDOaz1L
 r+2YorPxFVylOtScp/FU4d04+4Hhs+skKLBdjGRGjPhY/u7/R6lWT/yNstdVCiadaQE3
 jmkbYqoFRQHhomBkQxUTQFQZueZicpGIAbJTYIu7Ps+yzHrogbuFtt/Q3rbi1aCquyOP
 Ib9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gbxGBSpsRbT/5XHbY3hvQZXNJx9i+gbuEcoJ0VQd7pc=;
 b=CZRuIAT9NuuqrsZHc4Utrdn2VFbxBd4Ui4ikHI3/QwE33vZb0cnn5IatA2HqWZu7b0
 0Qfy5a4g5Nr2fGkhp5sZhW6yKCsQ8tJYQlyUajPYkh62CkOiN9f+lnygwU5rGrpcoRSS
 S6i4EOafWWzuw3j2I5m4UBk6RhhpC9ka+ikaxj2+I+yFaNnAGCndpQc5n8iCoPRyiHVK
 0jBp7Q8mgV5Ljow67N/GxA5OJu4yLIztLlM/Ac92s9psqo2SiTmv66LuX6f4UQvZ8Yg2
 6+bOf0u+jAG5leLhx6s/wv2vOyq/8hjT+rb5VtljLQahV921ATExKKUaagHGxBi1nuqA
 IwiA==
X-Gm-Message-State: AOAM531KgRXrKThPYjbzEtCsQUstOrpYEDeIyg7R4cssPdaSeNbP2Mi/
 3+VU8RCnrWRtH+9K/q4lsiyH9/p6DC/IKSjyah4=
X-Google-Smtp-Source: ABdhPJzsVXxeTHTknuY2S8u1itLsJS/tYqEZHwq+DlK7jVHeJAIl9Ee7tSozUzzrmw8iCuYlNLDbfIw2lqET49D6114=
X-Received: by 2002:a17:906:dc91:: with SMTP id
 cs17mr31387058ejc.389.1625755055390; 
 Thu, 08 Jul 2021 07:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-10-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1625678434-240960-10-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Jul 2021 18:37:23 +0400
Message-ID: <CAJ+F1C+mvKNWKX+TnMnat8Cm9_GE3o-dMDY9ZdZMN9Mbqkwx_w@mail.gmail.com>
Subject: Re: [PATCH V5 09/25] string to strList
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000091882405c69d986d"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000091882405c69d986d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 7, 2021 at 9:36 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Generalize strList_from_comma_list to take any delimiter character.
> No functional change.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  monitor/hmp-cmds.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 8e80581..a56f83c 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -71,21 +71,21 @@ void hmp_handle_error(Monitor *mon, Error *err)
>  }
>
>  /*
> - * Produce a strList from a comma separated list.
> - * A NULL or empty input string return NULL.
> + * Produce a strList from a character delimited string.
> + * A NULL or empty input string returns NULL.
>   */
> -static strList *strList_from_comma_list(const char *in)
> +static strList *strList_from_string(const char *in, char delim)
>  {
>      strList *res =3D NULL;
>      strList **tail =3D &res;
>
>      while (in && in[0]) {
> -        char *comma =3D strchr(in, ',');
> +        char *next =3D strchr(in, delim);
>          char *value;
>
> -        if (comma) {
> -            value =3D g_strndup(in, comma - in);
> -            in =3D comma + 1; /* skip the , */
> +        if (next) {
> +            value =3D g_strndup(in, next - in);
> +            in =3D next + 1; /* skip the delim */
>          } else {
>              value =3D g_strdup(in);
>              in =3D NULL;
> @@ -1170,7 +1170,7 @@ void hmp_announce_self(Monitor *mon, const QDict
> *qdict)
>                                              migrate_announce_params());
>
>      qapi_free_strList(params->interfaces);
> -    params->interfaces =3D strList_from_comma_list(interfaces_str);
> +    params->interfaces =3D strList_from_string(interfaces_str, ',');
>      params->has_interfaces =3D params->interfaces !=3D NULL;
>      params->id =3D g_strdup(id);
>      params->has_id =3D !!params->id;
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000091882405c69d986d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 7, 2021 at 9:36 PM Steve =
Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@ora=
cle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Generalize strList_from_comma_list to take any delimiter character.<=
br>
No functional change.<br>
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br></blockquote><div=
><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> =
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0monitor/hmp-cmds.c | 16 ++++++++--------<br>
=C2=A01 file changed, 8 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c<br>
index 8e80581..a56f83c 100644<br>
--- a/monitor/hmp-cmds.c<br>
+++ b/monitor/hmp-cmds.c<br>
@@ -71,21 +71,21 @@ void hmp_handle_error(Monitor *mon, Error *err)<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
- * Produce a strList from a comma separated list.<br>
- * A NULL or empty input string return NULL.<br>
+ * Produce a strList from a character delimited string.<br>
+ * A NULL or empty input string returns NULL.<br>
=C2=A0 */<br>
-static strList *strList_from_comma_list(const char *in)<br>
+static strList *strList_from_string(const char *in, char delim)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0strList *res =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0strList **tail =3D &amp;res;<br>
<br>
=C2=A0 =C2=A0 =C2=A0while (in &amp;&amp; in[0]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *comma =3D strchr(in, &#39;,&#39;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *next =3D strchr(in, delim);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *value;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (comma) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D g_strndup(in, comma - =
in);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in =3D comma + 1; /* skip the , =
*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D g_strndup(in, next - i=
n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in =3D next + 1; /* skip the del=
im */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D g_strdup(in);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in =3D NULL;<br>
@@ -1170,7 +1170,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdi=
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
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000091882405c69d986d--

