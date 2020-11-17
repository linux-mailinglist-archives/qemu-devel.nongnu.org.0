Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B262B5B2D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 09:44:59 +0100 (CET)
Received: from localhost ([::1]:58166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kewbi-0002LT-5u
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 03:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewZr-00018X-46
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:43:03 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:38972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewZp-0001sf-40
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:43:02 -0500
Received: by mail-ej1-x641.google.com with SMTP id s25so28261933ejy.6
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 00:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YugqglauNbig2wcmSCpAMVSbp/xRVTWpcbzvHXpWtWg=;
 b=MR3tr2Hzm7wM6LGRzOR45zB0LTLxDaR+axmW64TVVItyPAIUNjDYJkgKXA8f5Ws/HF
 idTR7SBQhhVvANuwVK4H/DNovyKblbbltZnQ8ML7C7sz5ihDssoTVeIMEsRS3F4EIJ2y
 MEhH3b3wgxqn11vDB55x42a6EvY1p4YtGO6HXYQUpVAF540N4QhtkA6t8LOU6FhVncvr
 4QGB2D+wQIc+20jbfpo+4k4kohJ6r1N+BOK8sOCQ2+y1dsE5vyDYaaSNqu3WnMNTpF7h
 USn+eV7j6ReaBFgiWA4CKtCYLXW+LDtZhAggF03x5DesWOOasBnY5zdIslS8+LQ41X0K
 F9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YugqglauNbig2wcmSCpAMVSbp/xRVTWpcbzvHXpWtWg=;
 b=V2fEokMTzXRcxKia7Pzx6vwX++5JSOvbilcL6ggsLk4FI1HeMzNLUpspMKvYZ+Enhg
 gShNJJ7PYvKjxzc7Kc0E2Z794+TEOzjs2kBPXkwjbQ/Go13ALV9DXNJwZgnQbiEyZXt8
 uAked9PH2w7uj1pmH1cyX1GNvr570n6v1o4IKU35z11nAWbLM0qM5qpXNXIlOD3V0xwB
 PqCN2k+fgwi4w4fyrllzFJgQDf9OojJHtEYhgNKXP7tpH3i9wnrymofYt2cD1K2zEBva
 YBZnoPikAiuFgY+J4qy+4OhUAz5fGH+lionr4BkoIgc8jqzB4VGG/EFYuIKDJjOIndPY
 CZeg==
X-Gm-Message-State: AOAM533HZT3fHJlRdkPJstQOjVsU32Nac0ioL+ABuy6tdYKMZJcySuo2
 W+ZYCev9dwyTF62kRhWCpWPTTW0hqH1EEchQnRw=
X-Google-Smtp-Source: ABdhPJyJyYpGGFrhFI2RyF7mTV1MvrmfMHuLGB3ea6zK2IXkzrMs+E89+tyAt7Rz3Q7G7uASNcn5LQdnjqUromyr9GE=
X-Received: by 2002:a17:906:af47:: with SMTP id
 ly7mr19325208ejb.532.1605602579248; 
 Tue, 17 Nov 2020 00:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-5-ehabkost@redhat.com>
In-Reply-To: <20201116224143.1284278-5-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 17 Nov 2020 12:42:47 +0400
Message-ID: <CAJ+F1CJYPfYa+3acEQVJAnKxtOG7rx1uJG+siqEQX6h=F9p8kA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] qnum: qnum_value_is_equal() function
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000631c2f05b4497bb4"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000631c2f05b4497bb4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 2:42 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> Extract the QNum value comparison logic to a function that takes
> QNumValue* as argument.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  include/qapi/qmp/qnum.h |  1 +
>  qobject/qnum.c          | 29 +++++++++++++++++++----------
>  2 files changed, 20 insertions(+), 10 deletions(-)
>
> diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
> index 62fbdfda68..0327ecd0f0 100644
> --- a/include/qapi/qmp/qnum.h
> +++ b/include/qapi/qmp/qnum.h
> @@ -106,6 +106,7 @@ double qnum_get_double(const QNum *qn);
>
>  char *qnum_to_string(QNum *qn);
>
> +bool qnum_value_is_equal(const QNumValue *num_x, const QNumValue *num_y)=
;
>  bool qnum_is_equal(const QObject *x, const QObject *y);
>  void qnum_destroy_obj(QObject *obj);
>
> diff --git a/qobject/qnum.c b/qobject/qnum.c
> index f80d4efd76..6a0f948b16 100644
> --- a/qobject/qnum.c
> +++ b/qobject/qnum.c
> @@ -207,9 +207,9 @@ char *qnum_to_string(QNum *qn)
>  }
>
>  /**
> - * qnum_is_equal(): Test whether the two QNums are equal
> - * @x: QNum object
> - * @y: QNum object
> + * qnum_value_is_equal(): Test whether two QNumValues are equal
> + * @num_x: QNum value
> + * @num_y: QNum value
>

val_x: a QNumValue ?

  *
>   * Negative integers are never considered equal to unsigned integers,
>   * but positive integers in the range [0, INT64_MAX] are considered
> @@ -217,13 +217,8 @@ char *qnum_to_string(QNum *qn)
>   *
>   * Doubles are never considered equal to integers.
>   */
> -bool qnum_is_equal(const QObject *x, const QObject *y)
> +bool qnum_value_is_equal(const QNumValue *num_x, const QNumValue *num_y)
>  {
> -    const QNum *qnum_x =3D qobject_to(QNum, x);
> -    const QNum *qnum_y =3D qobject_to(QNum, y);
> -    const QNumValue *num_x =3D &qnum_x->value;
> -    const QNumValue *num_y =3D &qnum_y->value;
> -
>      switch (num_x->kind) {
>      case QNUM_I64:
>          switch (num_y->kind) {
> @@ -241,7 +236,7 @@ bool qnum_is_equal(const QObject *x, const QObject *y=
)
>      case QNUM_U64:
>          switch (num_y->kind) {
>          case QNUM_I64:
> -            return qnum_is_equal(y, x);
> +            return qnum_value_is_equal(num_y, num_x);
>          case QNUM_U64:
>              /* Comparison in native uint64_t type */
>              return num_x->u.u64 =3D=3D num_y->u.u64;
> @@ -264,6 +259,20 @@ bool qnum_is_equal(const QObject *x, const QObject *=
y)
>      abort();
>  }
>
> +/**
> + * qnum_is_equal(): Test whether the two QNums are equal
> + * @x: QNum object
> + * @y: QNum object
> + *
> + * See qnum_value_is_equal() for details on the comparison rules.
> + */
> +bool qnum_is_equal(const QObject *x, const QObject *y)
> +{
> +    const QNum *qnum_x =3D qobject_to(QNum, x);
> +    const QNum *qnum_y =3D qobject_to(QNum, y);
> +    return qnum_value_is_equal(&qnum_x->value, &qnum_y->value);
> +}
> +
>  /**
>   * qnum_destroy_obj(): Free all memory allocated by a QNum object
>   *
> --
> 2.28.0
>
>
>
beside that,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000631c2f05b4497bb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr"><br></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 2:42 AM =
Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Extract the QNum value comparison logic to a function that takes<br>
QNumValue* as argument.<br>
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qapi/qmp/qnum.h |=C2=A0 1 +<br>
=C2=A0qobject/qnum.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 29 +++++++++++++++=
++++----------<br>
=C2=A02 files changed, 20 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h<br>
index 62fbdfda68..0327ecd0f0 100644<br>
--- a/include/qapi/qmp/qnum.h<br>
+++ b/include/qapi/qmp/qnum.h<br>
@@ -106,6 +106,7 @@ double qnum_get_double(const QNum *qn);<br>
<br>
=C2=A0char *qnum_to_string(QNum *qn);<br>
<br>
+bool qnum_value_is_equal(const QNumValue *num_x, const QNumValue *num_y);<=
br>
=C2=A0bool qnum_is_equal(const QObject *x, const QObject *y);<br>
=C2=A0void qnum_destroy_obj(QObject *obj);<br>
<br>
diff --git a/qobject/qnum.c b/qobject/qnum.c<br>
index f80d4efd76..6a0f948b16 100644<br>
--- a/qobject/qnum.c<br>
+++ b/qobject/qnum.c<br>
@@ -207,9 +207,9 @@ char *qnum_to_string(QNum *qn)<br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
- * qnum_is_equal(): Test whether the two QNums are equal<br>
- * @x: QNum object<br>
- * @y: QNum object<br>
+ * qnum_value_is_equal(): Test whether two QNumValues are equal<br>
+ * @num_x: QNum value<br>
+ * @num_y: QNum value<br></blockquote><div><br></div><div>val_x: a QNumVal=
ue ?</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
=C2=A0 *<br>
=C2=A0 * Negative integers are never considered equal to unsigned integers,=
<br>
=C2=A0 * but positive integers in the range [0, INT64_MAX] are considered<b=
r>
@@ -217,13 +217,8 @@ char *qnum_to_string(QNum *qn)<br>
=C2=A0 *<br>
=C2=A0 * Doubles are never considered equal to integers.<br>
=C2=A0 */<br>
-bool qnum_is_equal(const QObject *x, const QObject *y)<br>
+bool qnum_value_is_equal(const QNumValue *num_x, const QNumValue *num_y)<b=
r>
=C2=A0{<br>
-=C2=A0 =C2=A0 const QNum *qnum_x =3D qobject_to(QNum, x);<br>
-=C2=A0 =C2=A0 const QNum *qnum_y =3D qobject_to(QNum, y);<br>
-=C2=A0 =C2=A0 const QNumValue *num_x =3D &amp;qnum_x-&gt;value;<br>
-=C2=A0 =C2=A0 const QNumValue *num_y =3D &amp;qnum_y-&gt;value;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0switch (num_x-&gt;kind) {<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_I64:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (num_y-&gt;kind) {<br>
@@ -241,7 +236,7 @@ bool qnum_is_equal(const QObject *x, const QObject *y)<=
br>
=C2=A0 =C2=A0 =C2=A0case QNUM_U64:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (num_y-&gt;kind) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case QNUM_I64:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return qnum_is_equal(y, x);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return qnum_value_is_equal(num_y=
, num_x);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case QNUM_U64:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Comparison in native uin=
t64_t type */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return num_x-&gt;u.u64 =3D=
=3D num_y-&gt;u.u64;<br>
@@ -264,6 +259,20 @@ bool qnum_is_equal(const QObject *x, const QObject *y)=
<br>
=C2=A0 =C2=A0 =C2=A0abort();<br>
=C2=A0}<br>
<br>
+/**<br>
+ * qnum_is_equal(): Test whether the two QNums are equal<br>
+ * @x: QNum object<br>
+ * @y: QNum object<br>
+ *<br>
+ * See qnum_value_is_equal() for details on the comparison rules.<br>
+ */<br>
+bool qnum_is_equal(const QObject *x, const QObject *y)<br>
+{<br>
+=C2=A0 =C2=A0 const QNum *qnum_x =3D qobject_to(QNum, x);<br>
+=C2=A0 =C2=A0 const QNum *qnum_y =3D qobject_to(QNum, y);<br>
+=C2=A0 =C2=A0 return qnum_value_is_equal(&amp;qnum_x-&gt;value, &amp;qnum_=
y-&gt;value);<br>
+}<br>
+<br>
=C2=A0/**<br>
=C2=A0 * qnum_destroy_obj(): Free all memory allocated by a QNum object<br>
=C2=A0 *<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"></div><div>beside that,</div><div>Revi=
ewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redh=
at.com">marcandre.lureau@redhat.com</a>&gt; <br></div><div><br></div><div>-=
- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br>=
</div></div></div>

--000000000000631c2f05b4497bb4--

