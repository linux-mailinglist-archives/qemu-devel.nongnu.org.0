Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD55354E6BE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 18:15:26 +0200 (CEST)
Received: from localhost ([::1]:39692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1s9V-0006QZ-64
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 12:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1s34-0002Et-Q7
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:08:47 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:41544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1s31-00082n-D0
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:08:46 -0400
Received: by mail-lj1-x234.google.com with SMTP id v8so1988927ljj.8
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a3QsxEqAMlFdrW5o4+DiJWZeLE0jwDmUOc5ewIsU3M8=;
 b=eyVlBoPFgSmvygKwBTSnOke00QJ4DntyEVXiSmyJZ1Md0UG1UwBVS/ezb6tC1uach2
 cFffnTEBDRd8sP/LsmSTud2HxuNSMtCkKcaPx7u9kxX9nsqQ4ZO17wYLLFLJuh9tmU4Y
 r4f2kb8FaJKyBfqSASoU69oj5f+rEnau1tX4zYcwXoUbdsyjwA9711gdym5nhuEv018O
 FO0R/ljsHBGdyKXkwZZLm/EsfFv9/Eyn4ZcdSIrgF4KIUQhX3gF0Gkh+rMdyZQ6csyNb
 4QXnZcg0n30uZE78kCUEWASF2iyU8jox4TGdirEUOiF5sXxVLv5zZwKsqIiGeWD6WPC7
 cCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a3QsxEqAMlFdrW5o4+DiJWZeLE0jwDmUOc5ewIsU3M8=;
 b=Nl5sJM7woMEJYKKzcT19JB9P17OBYd0J5UPtCzv7yRZPXqBNO5Fd5idTIPdwSc+cNk
 nLW4YbQwFXa1/+zPIcnAcfMFdWMDfbUOjR6vqFm53/0/I1nI3tA6NtKBTQV1+vko+YJ6
 f1iT1YDMO9j6nA2vGigp7iIRI15guc0sMYtKy1fvLmfCqo3+IaIPNaGZgTOSUiIRT59S
 qRMVCAg7ojMNlgejhb69oEoXch3zuYK4YANhQXln5p/k+HTvoWTqkJ1WnjyRNf4BtlsU
 skLf6awJNCRwj+TwGR1Zq95+iq8btr0o9E1Ot8UvGotkJh+aC9QIws7Xwo/GYXxwH4Qe
 71/w==
X-Gm-Message-State: AJIora/JFP3nXtOf+a0qq2at9tdEfx9nlCITRMPwHnr8HELPnrH0OHdF
 Q7z3ScQiaZO1ErWL5z4jLQXOinYwyF2RKDohKYo=
X-Google-Smtp-Source: AGRyM1vZgvrsmhQni4rN7xJuoruSlOxM/COsjmFHebefyePdOE1YtkD1BaFgEbLe4F8h9Xlo6oUVIsvkVmGeQ/AOk9c=
X-Received: by 2002:a2e:a801:0:b0:24a:ff0b:ae7a with SMTP id
 l1-20020a2ea801000000b0024aff0bae7amr2761227ljq.287.1655395718901; Thu, 16
 Jun 2022 09:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-17-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1655304746-102776-17-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 16 Jun 2022 20:08:27 +0400
Message-ID: <CAJ+F1CL3=Q66LC9OqMTD+ffC7p5gu4K1V9Yg+_y+qv8CH48b4Q@mail.gmail.com>
Subject: Re: [PATCH V8 16/39] qapi: strv_from_strList
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
Content-Type: multipart/alternative; boundary="000000000000c9b42d05e192d9fa"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x234.google.com
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

--000000000000c9b42d05e192d9fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jun 15, 2022 at 7:30 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  include/qapi/util.h |  6 ++++++
>  qapi/qapi-util.c    | 14 ++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/include/qapi/util.h b/include/qapi/util.h
> index 75dddca..51ff64e 100644
> --- a/include/qapi/util.h
> +++ b/include/qapi/util.h
> @@ -33,6 +33,12 @@ bool qapi_bool_parse(const char *name, const char
> *value, bool *obj,
>  int parse_qapi_name(const char *name, bool complete);
>
>  /*
> + * Produce and return a NULL-terminated array of strings from @args.
> + * All strings are g_strdup'd.
> + */
> +GStrv strv_from_strList(const struct strList *args);
> +
> +/*
>   * Produce a strList from the character delimited string @in.
>   * All strings are g_strdup'd.
>   * A NULL or empty input string returns NULL.
> diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
> index b61c73c..8c96cab 100644
> --- a/qapi/qapi-util.c
> +++ b/qapi/qapi-util.c
> @@ -154,6 +154,20 @@ int parse_qapi_name(const char *str, bool complete)
>      return p - str;
>  }
>
> +GStrv strv_from_strList(const strList *args)
> +{
> +    const strList *arg;
> +    int i =3D 0;
> +    GStrv argv =3D g_malloc((QAPI_LIST_LENGTH(args) + 1) * sizeof(char *=
));
> +
>

Better use g_new() here. Otherwise:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> +    for (arg =3D args; arg !=3D NULL; arg =3D arg->next) {
> +        argv[i++] =3D g_strdup(arg->value);
> +    }
> +    argv[i] =3D NULL;
> +
> +    return argv;
> +}
> +
>  strList *strList_from_string(const char *in, char delim)
>  {
>      strList *res =3D NULL;
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c9b42d05e192d9fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, 2022 at 7:30 PM Ste=
ve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@=
oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistar=
e@oracle.com" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0include/qapi/util.h |=C2=A0 6 ++++++<br>
=C2=A0qapi/qapi-util.c=C2=A0 =C2=A0 | 14 ++++++++++++++<br>
=C2=A02 files changed, 20 insertions(+)<br>
<br>
diff --git a/include/qapi/util.h b/include/qapi/util.h<br>
index 75dddca..51ff64e 100644<br>
--- a/include/qapi/util.h<br>
+++ b/include/qapi/util.h<br>
@@ -33,6 +33,12 @@ bool qapi_bool_parse(const char *name, const char *value=
, bool *obj,<br>
=C2=A0int parse_qapi_name(const char *name, bool complete);<br>
<br>
=C2=A0/*<br>
+ * Produce and return a NULL-terminated array of strings from @args.<br>
+ * All strings are g_strdup&#39;d.<br>
+ */<br>
+GStrv strv_from_strList(const struct strList *args);<br>
+<br>
+/*<br>
=C2=A0 * Produce a strList from the character delimited string @in.<br>
=C2=A0 * All strings are g_strdup&#39;d.<br>
=C2=A0 * A NULL or empty input string returns NULL.<br>
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c<br>
index b61c73c..8c96cab 100644<br>
--- a/qapi/qapi-util.c<br>
+++ b/qapi/qapi-util.c<br>
@@ -154,6 +154,20 @@ int parse_qapi_name(const char *str, bool complete)<br=
>
=C2=A0 =C2=A0 =C2=A0return p - str;<br>
=C2=A0}<br>
<br>
+GStrv strv_from_strList(const strList *args)<br>
+{<br>
+=C2=A0 =C2=A0 const strList *arg;<br>
+=C2=A0 =C2=A0 int i =3D 0;<br>
+=C2=A0 =C2=A0 GStrv argv =3D g_malloc((QAPI_LIST_LENGTH(args) + 1) * sizeo=
f(char *));<br>
+<br></blockquote><div><br></div><div>Better use g_new() here. Otherwise: <=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 for (arg =3D args; arg !=3D NULL; arg =3D arg-&gt;next) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 argv[i++] =3D g_strdup(arg-&gt;value);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 argv[i] =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 return argv;<br>
+}<br>
+<br>
=C2=A0strList *strList_from_string(const char *in, char delim)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0strList *res =3D NULL;<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c9b42d05e192d9fa--

