Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F42342B5B18
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 09:39:49 +0100 (CET)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kewWi-00087l-Kv
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 03:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewVB-0007El-2p
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:38:13 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:37082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewV8-0000Ad-Cb
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:38:12 -0500
Received: by mail-ej1-x642.google.com with SMTP id f20so28274629ejz.4
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 00:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z3qXdgHUpP9cO4D+N9uCVmpTab18j2cDC52nmUKZjhc=;
 b=qyRo/ijY6Pr9fGGBtDQo5o0n0nAYbFrFhk7FLhiu6FTP0u/3bpRoObGqd+vvrgWalF
 Adw2tB1O6AzPfMYexvL/3j4/ywlvqNlTMZSglyd84Qe31P7d+gmVYZOBH+BTx9/hf6we
 92rpc3mOfe6fIEMO67DtNeasn/qRnQ+7kriAq8ism5z1xP8ffdlGE49ZI6h9nuMkNBXn
 PagsPjnZfwdHLDcEkaUkg92n4CU25TuMssro28gjmmtYLIlvo7NQ/6BUC3hKb8fIOelg
 R+KsOT6biF8GUeH6+ORU/+g8VzitYdb+RDXgzMN0yMF09n7edHu3rcRgoB6DewYL1HNG
 yO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z3qXdgHUpP9cO4D+N9uCVmpTab18j2cDC52nmUKZjhc=;
 b=nDdXOQaYKJ/LNA2lNtRMSxNzggDn13LtCeh84D7MxdAEHUAT4NPMmC+7Uolzmz3hyb
 zALdNNVKIptqjRvtxUhu0ciTdzdPlk+anAiFHV5mc6DFKmVVRPYxgyZRWkYhfDSZGQdS
 yxP9c/RRTfBKRuuTYC7H/tyhbFfmaXrmmXrVQHPzA6B7Y01L/IHDOEXKwCI94PeqzlUx
 1Yoj0Yf/higMrY4o0bv8jvQlaA2ypk6/ZzCkRpi1Yw1X7LEoLVUTvmv1cPBNRZQ9fs1R
 S/pGoTCTvykR+lmX7Qe7yfF/K3E9PGEu1IJUbEvs/7cMcEWDbz1kCOcIn5Pv3XnSziKZ
 GH1Q==
X-Gm-Message-State: AOAM530/U3mPpH2Out7pAXOzNyrYbaVzDRF/HOvuh2Br2EGA/LWoQkAG
 4GrxnMmhcPPRfdP0vc7YdRkLqwZe2j3lF2rxNrQ=
X-Google-Smtp-Source: ABdhPJyBW6AmYRJPCKPoZrtxTJHFBWUueB2x4aAe2A8Wn/7Umg5OFNepPvfm/lAlDSlxphEzVB+V1M3vLx3k157q9GY=
X-Received: by 2002:a17:906:57ca:: with SMTP id
 u10mr19038649ejr.389.1605602288602; 
 Tue, 17 Nov 2020 00:38:08 -0800 (PST)
MIME-Version: 1.0
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-4-ehabkost@redhat.com>
In-Reply-To: <20201116224143.1284278-4-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 17 Nov 2020 12:37:56 +0400
Message-ID: <CAJ+F1C+YUZdP56MuLtZbO0fK6rPsDosgxXG4zaDq=mjwqsV74A@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] qnum: QNumValue type for QNum value literals
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000010154f05b4496a7d"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x642.google.com
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

--00000000000010154f05b4496a7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 2:43 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> Provide a separate QNumValue type that can be used for QNum value
> literals without the referencing counting and memory allocation
> features provided by QObject.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v1 -> v2:
> * Fix "make check" failure, by updating check-qnum unit test to
>   use the new struct fields
> ---
>  include/qapi/qmp/qnum.h | 40 +++++++++++++++++++--
>  qobject/qnum.c          | 78 ++++++++++++++++++++---------------------
>  tests/check-qnum.c      | 14 ++++----
>  3 files changed, 84 insertions(+), 48 deletions(-)
>
> diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
> index 55c27b1c24..62fbdfda68 100644
> --- a/include/qapi/qmp/qnum.h
> +++ b/include/qapi/qmp/qnum.h
> @@ -46,20 +46,56 @@ typedef enum {
>   * in range: qnum_get_try_int() / qnum_get_try_uint() check range and
>   * convert under the hood.
>   */
> -struct QNum {
> -    struct QObjectBase_ base;
> +
> +/**
> + * struct QNumValue: the value of a QNum
> + *
> + * QNumValue literals can be constructed using the `QNUM_VAL_INT`,
> + * `QNUM_VAL_UINT`, and `QNUM_VAL_DOUBLE` macros.
> + */
> +typedef struct QNumValue {
> +    /* private: */
>      QNumKind kind;
>      union {
>          int64_t i64;
>          uint64_t u64;
>          double dbl;
>      } u;
> +} QNumValue;
> +
> +#define QNUM_VAL_INT(value) \
> +    { .kind =3D QNUM_I64, .u.i64 =3D value }
> +#define QNUM_VAL_UINT(value) \
> +    { .kind =3D QNUM_U64, .u.u64 =3D value }
> +#define QNUM_VAL_DOUBLE(value) \
> +    { .kind =3D QNUM_DOUBLE, .u.dbl =3D value }
> +
> +struct QNum {
> +    struct QObjectBase_ base;
> +    QNumValue value;
>  };
>
> +/**
> + * qnum_from_int(): Create a new QNum from a QNumValue
>

Copy-pasta qnum_from_int() -> qnum_from_value()

I wonder if there is a check for that kind of mistake, as it may be common.

+ * @value: QNumValue
> + *
> + * Return strong reference.
> + */
> +QNum *qnum_from_value(QNumValue value);
>
+
>  QNum *qnum_from_int(int64_t value);
>  QNum *qnum_from_uint(uint64_t value);
>  QNum *qnum_from_double(double value);
>
> +/**
> + * qnum_get_value(): Get QNumValue from QNum
> + * @qn: QNum object
> + */
> +static inline const QNumValue *qnum_get_value(const QNum *qn)
> +{
> +    return &qn->value;
> +}
> +
>

Nothing uses that function in this patch. Should be put into use.

 bool qnum_get_try_int(const QNum *qn, int64_t *val);
>  int64_t qnum_get_int(const QNum *qn);
>
> diff --git a/qobject/qnum.c b/qobject/qnum.c
> index 69fd9a82d9..f80d4efd76 100644
> --- a/qobject/qnum.c
> +++ b/qobject/qnum.c
> @@ -15,6 +15,15 @@
>  #include "qemu/osdep.h"
>  #include "qapi/qmp/qnum.h"
>
> +QNum *qnum_from_value(QNumValue value)
>

I wonder if it shouldn't be made "inline" in header too (if that can help
avoid argument copy).

+{
> +    QNum *qn =3D g_new(QNum, 1);
> +
> +    qobject_init(QOBJECT(qn), QTYPE_QNUM);
> +    qn->value =3D value;
> +    return qn;
> +}
> +
>  /**
>   * qnum_from_int(): Create a new QNum from an int64_t
>   * @value: int64_t value
> @@ -23,13 +32,7 @@
>   */
>  QNum *qnum_from_int(int64_t value)
>  {
> -    QNum *qn =3D g_new(QNum, 1);
> -
> -    qobject_init(QOBJECT(qn), QTYPE_QNUM);
> -    qn->kind =3D QNUM_I64;
> -    qn->u.i64 =3D value;
> -
> -    return qn;
> +    return qnum_from_value((QNumValue) QNUM_VAL_INT(value));
>  }
>
>  /**
> @@ -40,13 +43,7 @@ QNum *qnum_from_int(int64_t value)
>   */
>  QNum *qnum_from_uint(uint64_t value)
>  {
> -    QNum *qn =3D g_new(QNum, 1);
> -
> -    qobject_init(QOBJECT(qn), QTYPE_QNUM);
> -    qn->kind =3D QNUM_U64;
> -    qn->u.u64 =3D value;
> -
> -    return qn;
> +    return qnum_from_value((QNumValue) QNUM_VAL_UINT(value));
>  }
>
>  /**
> @@ -57,13 +54,7 @@ QNum *qnum_from_uint(uint64_t value)
>   */
>  QNum *qnum_from_double(double value)
>  {
> -    QNum *qn =3D g_new(QNum, 1);
> -
> -    qobject_init(QOBJECT(qn), QTYPE_QNUM);
> -    qn->kind =3D QNUM_DOUBLE;
> -    qn->u.dbl =3D value;
> -
> -    return qn;
> +    return qnum_from_value((QNumValue) QNUM_VAL_DOUBLE(value));
>  }
>
>  /**
> @@ -75,15 +66,17 @@ QNum *qnum_from_double(double value)
>   */
>  bool qnum_get_try_int(const QNum *qn, int64_t *val)
>  {
> -    switch (qn->kind) {
> +    const QNumValue *qv =3D &qn->value;
> +
> +    switch (qv->kind) {
>      case QNUM_I64:
> -        *val =3D qn->u.i64;
> +        *val =3D qv->u.i64;
>          return true;
>      case QNUM_U64:
> -        if (qn->u.u64 > INT64_MAX) {
> +        if (qv->u.u64 > INT64_MAX) {
>              return false;
>          }
> -        *val =3D qn->u.u64;
> +        *val =3D qv->u.u64;
>          return true;
>      case QNUM_DOUBLE:
>          return false;
> @@ -116,15 +109,17 @@ int64_t qnum_get_int(const QNum *qn)
>   */
>  bool qnum_get_try_uint(const QNum *qn, uint64_t *val)
>  {
> -    switch (qn->kind) {
> +    const QNumValue *qv =3D &qn->value;
> +
> +    switch (qv->kind) {
>      case QNUM_I64:
> -        if (qn->u.i64 < 0) {
> +        if (qv->u.i64 < 0) {
>              return false;
>          }
> -        *val =3D qn->u.i64;
> +        *val =3D qv->u.i64;
>          return true;
>      case QNUM_U64:
> -        *val =3D qn->u.u64;
> +        *val =3D qv->u.u64;
>          return true;
>      case QNUM_DOUBLE:
>          return false;
> @@ -156,13 +151,15 @@ uint64_t qnum_get_uint(const QNum *qn)
>   */
>  double qnum_get_double(const QNum *qn)
>  {
> -    switch (qn->kind) {
> +    const QNumValue *qv =3D &qn->value;
> +
> +    switch (qv->kind) {
>      case QNUM_I64:
> -        return qn->u.i64;
> +        return qv->u.i64;
>      case QNUM_U64:
> -        return qn->u.u64;
> +        return qv->u.u64;
>      case QNUM_DOUBLE:
> -        return qn->u.dbl;
> +        return qv->u.dbl;
>      }
>
>      assert(0);
> @@ -171,14 +168,15 @@ double qnum_get_double(const QNum *qn)
>
>  char *qnum_to_string(QNum *qn)
>  {
> +    const QNumValue *qv =3D &qn->value;
>

qnum_get_value() ?

     char *buffer;
>      int len;
>
> -    switch (qn->kind) {
> +    switch (qv->kind) {
>      case QNUM_I64:
> -        return g_strdup_printf("%" PRId64, qn->u.i64);
> +        return g_strdup_printf("%" PRId64, qv->u.i64);
>      case QNUM_U64:
> -        return g_strdup_printf("%" PRIu64, qn->u.u64);
> +        return g_strdup_printf("%" PRIu64, qv->u.u64);
>      case QNUM_DOUBLE:
>          /* FIXME: snprintf() is locale dependent; but JSON requires
>           * numbers to be formatted as if in the C locale. Dependence
> @@ -189,7 +187,7 @@ char *qnum_to_string(QNum *qn)
>           * rounding errors; we should be using DBL_DECIMAL_DIG (17),
>           * and only rounding to a shorter number if the result would
>           * still produce the same floating point value.  */
> -        buffer =3D g_strdup_printf("%f" , qn->u.dbl);
> +        buffer =3D g_strdup_printf("%f" , qv->u.dbl);
>          len =3D strlen(buffer);
>          while (len > 0 && buffer[len - 1] =3D=3D '0') {
>              len--;
> @@ -221,8 +219,10 @@ char *qnum_to_string(QNum *qn)
>   */
>  bool qnum_is_equal(const QObject *x, const QObject *y)
>  {
> -    QNum *num_x =3D qobject_to(QNum, x);
> -    QNum *num_y =3D qobject_to(QNum, y);
> +    const QNum *qnum_x =3D qobject_to(QNum, x);
> +    const QNum *qnum_y =3D qobject_to(QNum, y);
> +    const QNumValue *num_x =3D &qnum_x->value;
> +    const QNumValue *num_y =3D &qnum_y->value;
>
>      switch (num_x->kind) {
>      case QNUM_I64:
> diff --git a/tests/check-qnum.c b/tests/check-qnum.c
> index 4105015872..9499b0d845 100644
> --- a/tests/check-qnum.c
> +++ b/tests/check-qnum.c
> @@ -30,8 +30,8 @@ static void qnum_from_int_test(void)
>
>      qn =3D qnum_from_int(value);
>      g_assert(qn !=3D NULL);
> -    g_assert_cmpint(qn->kind, =3D=3D, QNUM_I64);
> -    g_assert_cmpint(qn->u.i64, =3D=3D, value);
> +    g_assert_cmpint(qn->value.kind, =3D=3D, QNUM_I64);
> +    g_assert_cmpint(qn->value.u.i64, =3D=3D, value);
>      g_assert_cmpint(qn->base.refcnt, =3D=3D, 1);
>      g_assert_cmpint(qobject_type(QOBJECT(qn)), =3D=3D, QTYPE_QNUM);
>
> @@ -45,8 +45,8 @@ static void qnum_from_uint_test(void)
>
>      qn =3D qnum_from_uint(value);
>      g_assert(qn !=3D NULL);
> -    g_assert_cmpint(qn->kind, =3D=3D, QNUM_U64);
> -    g_assert(qn->u.u64 =3D=3D value);
> +    g_assert_cmpint(qn->value.kind, =3D=3D, QNUM_U64);
> +    g_assert(qn->value.u.u64 =3D=3D value);
>      g_assert(qn->base.refcnt =3D=3D 1);
>      g_assert(qobject_type(QOBJECT(qn)) =3D=3D QTYPE_QNUM);
>
> @@ -60,8 +60,8 @@ static void qnum_from_double_test(void)
>
>      qn =3D qnum_from_double(value);
>      g_assert(qn !=3D NULL);
> -    g_assert_cmpint(qn->kind, =3D=3D, QNUM_DOUBLE);
> -    g_assert_cmpfloat(qn->u.dbl, =3D=3D, value);
> +    g_assert_cmpint(qn->value.kind, =3D=3D, QNUM_DOUBLE);
> +    g_assert_cmpfloat(qn->value.u.dbl, =3D=3D, value);
>      g_assert_cmpint(qn->base.refcnt, =3D=3D, 1);
>      g_assert_cmpint(qobject_type(QOBJECT(qn)), =3D=3D, QTYPE_QNUM);
>
> @@ -74,7 +74,7 @@ static void qnum_from_int64_test(void)
>      const int64_t value =3D 0x1234567890abcdefLL;
>
>      qn =3D qnum_from_int(value);
> -    g_assert_cmpint((int64_t) qn->u.i64, =3D=3D, value);
> +    g_assert_cmpint((int64_t) qn->value.u.i64, =3D=3D, value);
>
>      qobject_unref(qn);
>  }
> --
> 2.28.0
>
>
>
lgtm otherwise

--=20
Marc-Andr=C3=A9 Lureau

--00000000000010154f05b4496a7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr"><br></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 2:43 AM =
Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Provide a separate QNumValue type that can be used for QNum value<br>
literals without the referencing counting and memory allocation<br>
features provided by QObject.<br>
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br>
---<br>
Changes v1 -&gt; v2:<br>
* Fix &quot;make check&quot; failure, by updating check-qnum unit test to<b=
r>
=C2=A0 use the new struct fields<br>
---<br>
=C2=A0include/qapi/qmp/qnum.h | 40 +++++++++++++++++++--<br>
=C2=A0qobject/qnum.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 78 +++++++++++++++=
+++++---------------------<br>
=C2=A0tests/check-qnum.c=C2=A0 =C2=A0 =C2=A0 | 14 ++++----<br>
=C2=A03 files changed, 84 insertions(+), 48 deletions(-)<br>
<br>
diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h<br>
index 55c27b1c24..62fbdfda68 100644<br>
--- a/include/qapi/qmp/qnum.h<br>
+++ b/include/qapi/qmp/qnum.h<br>
@@ -46,20 +46,56 @@ typedef enum {<br>
=C2=A0 * in range: qnum_get_try_int() / qnum_get_try_uint() check range and=
<br>
=C2=A0 * convert under the hood.<br>
=C2=A0 */<br>
-struct QNum {<br>
-=C2=A0 =C2=A0 struct QObjectBase_ base;<br>
+<br>
+/**<br>
+ * struct QNumValue: the value of a QNum<br>
+ *<br>
+ * QNumValue literals can be constructed using the `QNUM_VAL_INT`,<br>
+ * `QNUM_VAL_UINT`, and `QNUM_VAL_DOUBLE` macros.<br>
+ */<br>
+typedef struct QNumValue {<br>
+=C2=A0 =C2=A0 /* private: */<br>
=C2=A0 =C2=A0 =C2=A0QNumKind kind;<br>
=C2=A0 =C2=A0 =C2=A0union {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t i64;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t u64;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0double dbl;<br>
=C2=A0 =C2=A0 =C2=A0} u;<br>
+} QNumValue;<br>
+<br>
+#define QNUM_VAL_INT(value) \<br>
+=C2=A0 =C2=A0 { .kind =3D QNUM_I64, .u.i64 =3D value }<br>
+#define QNUM_VAL_UINT(value) \<br>
+=C2=A0 =C2=A0 { .kind =3D QNUM_U64, .u.u64 =3D value }<br>
+#define QNUM_VAL_DOUBLE(value) \<br>
+=C2=A0 =C2=A0 { .kind =3D QNUM_DOUBLE, .u.dbl =3D value }<br>
+<br>
+struct QNum {<br>
+=C2=A0 =C2=A0 struct QObjectBase_ base;<br>
+=C2=A0 =C2=A0 QNumValue value;<br>
=C2=A0};<br>
<br>
+/**<br>
+ * qnum_from_int(): Create a new QNum from a QNumValue<br></blockquote><di=
v><br></div><div>Copy-pasta qnum_from_int() -&gt; qnum_from_value()</div><d=
iv><br></div><div>I wonder if there is a check for that kind of mistake, as=
 it may be common.<br></div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+ * @value: QNumValue<br>
+ *<br>
+ * Return strong reference.<br>
+ */<br>
+QNum *qnum_from_value(QNumValue value);<br></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+<br>
=C2=A0QNum *qnum_from_int(int64_t value);<br>
=C2=A0QNum *qnum_from_uint(uint64_t value);<br>
=C2=A0QNum *qnum_from_double(double value);<br>
<br>
+/**<br>
+ * qnum_get_value(): Get QNumValue from QNum<br>
+ * @qn: QNum object<br>
+ */<br>
+static inline const QNumValue *qnum_get_value(const QNum *qn)<br>
+{<br>
+=C2=A0 =C2=A0 return &amp;qn-&gt;value;<br>
+}<br>
+<br></blockquote><div><br></div><div>Nothing uses that function in this pa=
tch. Should be put into use.</div><div> <br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
=C2=A0bool qnum_get_try_int(const QNum *qn, int64_t *val);<br>
=C2=A0int64_t qnum_get_int(const QNum *qn);<br>
<br>
diff --git a/qobject/qnum.c b/qobject/qnum.c<br>
index 69fd9a82d9..f80d4efd76 100644<br>
--- a/qobject/qnum.c<br>
+++ b/qobject/qnum.c<br>
@@ -15,6 +15,15 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qnum.h&quot;<br>
<br>
+QNum *qnum_from_value(QNumValue value)<br></blockquote><div><br></div><div=
>I wonder if it shouldn&#39;t be made &quot;inline&quot; in header too (if =
that can help avoid argument copy).</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+{<br>
+=C2=A0 =C2=A0 QNum *qn =3D g_new(QNum, 1);<br>
+<br>
+=C2=A0 =C2=A0 qobject_init(QOBJECT(qn), QTYPE_QNUM);<br>
+=C2=A0 =C2=A0 qn-&gt;value =3D value;<br>
+=C2=A0 =C2=A0 return qn;<br>
+}<br>
+<br>
=C2=A0/**<br>
=C2=A0 * qnum_from_int(): Create a new QNum from an int64_t<br>
=C2=A0 * @value: int64_t value<br>
@@ -23,13 +32,7 @@<br>
=C2=A0 */<br>
=C2=A0QNum *qnum_from_int(int64_t value)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 QNum *qn =3D g_new(QNum, 1);<br>
-<br>
-=C2=A0 =C2=A0 qobject_init(QOBJECT(qn), QTYPE_QNUM);<br>
-=C2=A0 =C2=A0 qn-&gt;kind =3D QNUM_I64;<br>
-=C2=A0 =C2=A0 qn-&gt;u.i64 =3D value;<br>
-<br>
-=C2=A0 =C2=A0 return qn;<br>
+=C2=A0 =C2=A0 return qnum_from_value((QNumValue) QNUM_VAL_INT(value));<br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
@@ -40,13 +43,7 @@ QNum *qnum_from_int(int64_t value)<br>
=C2=A0 */<br>
=C2=A0QNum *qnum_from_uint(uint64_t value)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 QNum *qn =3D g_new(QNum, 1);<br>
-<br>
-=C2=A0 =C2=A0 qobject_init(QOBJECT(qn), QTYPE_QNUM);<br>
-=C2=A0 =C2=A0 qn-&gt;kind =3D QNUM_U64;<br>
-=C2=A0 =C2=A0 qn-&gt;u.u64 =3D value;<br>
-<br>
-=C2=A0 =C2=A0 return qn;<br>
+=C2=A0 =C2=A0 return qnum_from_value((QNumValue) QNUM_VAL_UINT(value));<br=
>
=C2=A0}<br>
<br>
=C2=A0/**<br>
@@ -57,13 +54,7 @@ QNum *qnum_from_uint(uint64_t value)<br>
=C2=A0 */<br>
=C2=A0QNum *qnum_from_double(double value)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 QNum *qn =3D g_new(QNum, 1);<br>
-<br>
-=C2=A0 =C2=A0 qobject_init(QOBJECT(qn), QTYPE_QNUM);<br>
-=C2=A0 =C2=A0 qn-&gt;kind =3D QNUM_DOUBLE;<br>
-=C2=A0 =C2=A0 qn-&gt;u.dbl =3D value;<br>
-<br>
-=C2=A0 =C2=A0 return qn;<br>
+=C2=A0 =C2=A0 return qnum_from_value((QNumValue) QNUM_VAL_DOUBLE(value));<=
br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
@@ -75,15 +66,17 @@ QNum *qnum_from_double(double value)<br>
=C2=A0 */<br>
=C2=A0bool qnum_get_try_int(const QNum *qn, int64_t *val)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 switch (qn-&gt;kind) {<br>
+=C2=A0 =C2=A0 const QNumValue *qv =3D &amp;qn-&gt;value;<br>
+<br>
+=C2=A0 =C2=A0 switch (qv-&gt;kind) {<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_I64:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qn-&gt;u.i64;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qv-&gt;u.i64;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_U64:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qn-&gt;u.u64 &gt; INT64_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qv-&gt;u.u64 &gt; INT64_MAX) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qn-&gt;u.u64;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qv-&gt;u.u64;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_DOUBLE:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
@@ -116,15 +109,17 @@ int64_t qnum_get_int(const QNum *qn)<br>
=C2=A0 */<br>
=C2=A0bool qnum_get_try_uint(const QNum *qn, uint64_t *val)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 switch (qn-&gt;kind) {<br>
+=C2=A0 =C2=A0 const QNumValue *qv =3D &amp;qn-&gt;value;<br>
+<br>
+=C2=A0 =C2=A0 switch (qv-&gt;kind) {<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_I64:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qn-&gt;u.i64 &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qv-&gt;u.i64 &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qn-&gt;u.i64;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qv-&gt;u.i64;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_U64:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qn-&gt;u.u64;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qv-&gt;u.u64;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_DOUBLE:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
@@ -156,13 +151,15 @@ uint64_t qnum_get_uint(const QNum *qn)<br>
=C2=A0 */<br>
=C2=A0double qnum_get_double(const QNum *qn)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 switch (qn-&gt;kind) {<br>
+=C2=A0 =C2=A0 const QNumValue *qv =3D &amp;qn-&gt;value;<br>
+<br>
+=C2=A0 =C2=A0 switch (qv-&gt;kind) {<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_I64:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qn-&gt;u.i64;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qv-&gt;u.i64;<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_U64:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qn-&gt;u.u64;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qv-&gt;u.u64;<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_DOUBLE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qn-&gt;u.dbl;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qv-&gt;u.dbl;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0assert(0);<br>
@@ -171,14 +168,15 @@ double qnum_get_double(const QNum *qn)<br>
<br>
=C2=A0char *qnum_to_string(QNum *qn)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 const QNumValue *qv =3D &amp;qn-&gt;value;<br></blockquote><=
div><br></div><div>qnum_get_value() ?</div><div> <br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0char *buffer;<br>
=C2=A0 =C2=A0 =C2=A0int len;<br>
<br>
-=C2=A0 =C2=A0 switch (qn-&gt;kind) {<br>
+=C2=A0 =C2=A0 switch (qv-&gt;kind) {<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_I64:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;%&quot; PRId64, q=
n-&gt;u.i64);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;%&quot; PRId64, q=
v-&gt;u.i64);<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_U64:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;%&quot; PRIu64, q=
n-&gt;u.u64);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;%&quot; PRIu64, q=
v-&gt;u.u64);<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_DOUBLE:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: snprintf() is locale dependent;=
 but JSON requires<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * numbers to be formatted as if in the C=
 locale. Dependence<br>
@@ -189,7 +187,7 @@ char *qnum_to_string(QNum *qn)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * rounding errors; we should be using DB=
L_DECIMAL_DIG (17),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * and only rounding to a shorter number =
if the result would<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * still produce the same floating point =
value.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer =3D g_strdup_printf(&quot;%f&quot; , qn=
-&gt;u.dbl);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer =3D g_strdup_printf(&quot;%f&quot; , qv=
-&gt;u.dbl);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D strlen(buffer);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (len &gt; 0 &amp;&amp; buffer[len -=
 1] =3D=3D &#39;0&#39;) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len--;<br>
@@ -221,8 +219,10 @@ char *qnum_to_string(QNum *qn)<br>
=C2=A0 */<br>
=C2=A0bool qnum_is_equal(const QObject *x, const QObject *y)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 QNum *num_x =3D qobject_to(QNum, x);<br>
-=C2=A0 =C2=A0 QNum *num_y =3D qobject_to(QNum, y);<br>
+=C2=A0 =C2=A0 const QNum *qnum_x =3D qobject_to(QNum, x);<br>
+=C2=A0 =C2=A0 const QNum *qnum_y =3D qobject_to(QNum, y);<br>
+=C2=A0 =C2=A0 const QNumValue *num_x =3D &amp;qnum_x-&gt;value;<br>
+=C2=A0 =C2=A0 const QNumValue *num_y =3D &amp;qnum_y-&gt;value;<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch (num_x-&gt;kind) {<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_I64:<br>
diff --git a/tests/check-qnum.c b/tests/check-qnum.c<br>
index 4105015872..9499b0d845 100644<br>
--- a/tests/check-qnum.c<br>
+++ b/tests/check-qnum.c<br>
@@ -30,8 +30,8 @@ static void qnum_from_int_test(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qn =3D qnum_from_int(value);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(qn !=3D NULL);<br>
-=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;kind, =3D=3D, QNUM_I64);<br>
-=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;u.i64, =3D=3D, value);<br>
+=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;value.kind, =3D=3D, QNUM_I64);<br>
+=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;value.u.i64, =3D=3D, value);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(qn-&gt;base.refcnt, =3D=3D, 1);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(qobject_type(QOBJECT(qn)), =3D=3D, QTYP=
E_QNUM);<br>
<br>
@@ -45,8 +45,8 @@ static void qnum_from_uint_test(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qn =3D qnum_from_uint(value);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(qn !=3D NULL);<br>
-=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;kind, =3D=3D, QNUM_U64);<br>
-=C2=A0 =C2=A0 g_assert(qn-&gt;u.u64 =3D=3D value);<br>
+=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;value.kind, =3D=3D, QNUM_U64);<br>
+=C2=A0 =C2=A0 g_assert(qn-&gt;value.u.u64 =3D=3D value);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(qn-&gt;base.refcnt =3D=3D 1);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(qobject_type(QOBJECT(qn)) =3D=3D QTYPE_QNUM);<=
br>
<br>
@@ -60,8 +60,8 @@ static void qnum_from_double_test(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qn =3D qnum_from_double(value);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(qn !=3D NULL);<br>
-=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;kind, =3D=3D, QNUM_DOUBLE);<br>
-=C2=A0 =C2=A0 g_assert_cmpfloat(qn-&gt;u.dbl, =3D=3D, value);<br>
+=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;value.kind, =3D=3D, QNUM_DOUBLE);<br>
+=C2=A0 =C2=A0 g_assert_cmpfloat(qn-&gt;value.u.dbl, =3D=3D, value);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(qn-&gt;base.refcnt, =3D=3D, 1);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(qobject_type(QOBJECT(qn)), =3D=3D, QTYP=
E_QNUM);<br>
<br>
@@ -74,7 +74,7 @@ static void qnum_from_int64_test(void)<br>
=C2=A0 =C2=A0 =C2=A0const int64_t value =3D 0x1234567890abcdefLL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0qn =3D qnum_from_int(value);<br>
-=C2=A0 =C2=A0 g_assert_cmpint((int64_t) qn-&gt;u.i64, =3D=3D, value);<br>
+=C2=A0 =C2=A0 g_assert_cmpint((int64_t) qn-&gt;value.u.i64, =3D=3D, value)=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(qn);<br>
=C2=A0}<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"></div><div>lgtm otherwise</div><div><b=
r></div><div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=
=A9 Lureau<br></div></div></div>

--00000000000010154f05b4496a7d--

