Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BA82B5B5E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 09:54:56 +0100 (CET)
Received: from localhost ([::1]:41560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kewlL-0007kM-I9
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 03:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewjX-0006gc-9w
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:53:03 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:38725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewjU-0005aL-TE
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:53:02 -0500
Received: by mail-ed1-x541.google.com with SMTP id y4so15774682edy.5
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 00:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RUfw3OgWDATACNx47PFEemsHmt1id/PvEy06GitvrrE=;
 b=jcqcPvDJMySzYhg0/bXCx1VmIhopSAnS8LRVmDitYrv+5W9vCl8tY20trtGbl2iMwG
 1PwnY6DDoJxvOV6q5kl5yjr1xU5CPMTza54QY4Cxvz3+kb+AVWk+q4rLKtPMMvUmdnZ6
 2dT634QueLdiBNqRfHSmMoEUAN6i1SbaKfIYqbgI7fRPOQ0KUR2KmMlNILG+BBu9ia4Z
 l3x6V5aGmnmIzCvd1VYm6Z1H2lbtNcr2I6vJzjmxTZdiKzPt82c45SrnFCySK5lTEGA4
 u5tAncrGcFa/FQhWdosJW3LkM6fezw6dgId0d3bCqP8EnjadGT0uj6OlNyxBb6/RFMMB
 Mk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RUfw3OgWDATACNx47PFEemsHmt1id/PvEy06GitvrrE=;
 b=tjgtWWO2F4p4TiKZexGZyofrGOulX4K0Kd7AiD5/FeJPc9Ru+ClSjNbOqV8Sdzbcxn
 07gChgERCCNl/ipe6LWeWNqLswv/FcuiqLXwSUzSz4w+cPNMJ1nMfHN/68zX0gBG9t8n
 dr0IMsyE/HpgElPeKsWfbUc/DyNYBKCMTFgLg0loEVMFTBA3wpyENlFdnTxjkXvEAi8e
 +jfHWEQDy8TMgNsFt+An76WuX3VkcIiDC7DGmkIqsr2XelfbYF6DIgk4kTltEGwFj+uV
 RhzLVUK/ol1+hkUG3K6W5cJ6VPgGC2WFDeM961UMEtKQEQLO0O7/ldT/nT7eCAPku1Q3
 4GRQ==
X-Gm-Message-State: AOAM530AC0Vu87Z0XyvWS1RLffpvOb15tz1QXgKOVPYN/N3NWziOuN9Z
 b+aUBrz5P6ilKs6UjTz2MoagHqcnu+Oo/a9pHAk=
X-Google-Smtp-Source: ABdhPJwVt4jxVbjqDfpl2e6I/XZSAQ+9Ji3kfNr1H5sxRdqUjW/RxEDdfdOyNvJ4FGJ6RF3zyeJEQgtYhfFUUFrnwxU=
X-Received: by 2002:a50:9fe6:: with SMTP id c93mr19272259edf.30.1605603179121; 
 Tue, 17 Nov 2020 00:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-6-ehabkost@redhat.com>
In-Reply-To: <20201116224143.1284278-6-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 17 Nov 2020 12:52:47 +0400
Message-ID: <CAJ+F1CJ4quGCWWSbfChj3DW-0ReMYxPM6gmFvMx9cKrTb2TeYA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] qlit: Support all types of QNums
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000024535c05b4499f85"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x541.google.com
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

--00000000000024535c05b4499f85
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 2:48 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> Use QNumValue to represent QNums, so we can also support uint64_t
> and double QNum values.  Add new QLIT_QNUM_(INT|UINT|DOUBLE)
> macros for each case.
>
> The QLIT_QNUM() macro is being kept for compatibility with
> existing code, but becomes just a wrapper for QLIT_QNUM_INT().
>

I am not sure it's worth to keep. (furthermore, it's only used in tests
afaics)


> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>


Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
> Changes v1 -> v2:
> * Coding style fix at qlit_equal_qobject()
> ---
>  include/qapi/qmp/qlit.h | 11 +++++--
>  qobject/qlit.c          |  5 +--
>  tests/check-qjson.c     | 72 ++++++++++++++++++++++++++++++++++++++---
>  3 files changed, 79 insertions(+), 9 deletions(-)
>
> diff --git a/include/qapi/qmp/qlit.h b/include/qapi/qmp/qlit.h
> index c0676d5daf..f9e356d31e 100644
> --- a/include/qapi/qmp/qlit.h
> +++ b/include/qapi/qmp/qlit.h
> @@ -15,6 +15,7 @@
>  #define QLIT_H
>
>  #include "qobject.h"
> +#include "qnum.h"
>
>  typedef struct QLitDictEntry QLitDictEntry;
>  typedef struct QLitObject QLitObject;
> @@ -23,7 +24,7 @@ struct QLitObject {
>      QType type;
>      union {
>          bool qbool;
> -        int64_t qnum;
> +        QNumValue qnum;
>          const char *qstr;
>          QLitDictEntry *qdict;
>          QLitObject *qlist;
> @@ -39,8 +40,14 @@ struct QLitDictEntry {
>      { .type =3D QTYPE_QNULL }
>  #define QLIT_QBOOL(val) \
>      { .type =3D QTYPE_QBOOL, .value.qbool =3D (val) }
> +#define QLIT_QNUM_INT(val) \
> +    { .type =3D QTYPE_QNUM, .value.qnum =3D QNUM_VAL_INT(val) }
> +#define QLIT_QNUM_UINT(val) \
> +    { .type =3D QTYPE_QNUM, .value.qnum =3D QNUM_VAL_UINT(val) }
> +#define QLIT_QNUM_DOUBLE(val) \
> +    { .type =3D QTYPE_QNUM, .value.qnum =3D QNUM_VAL_DOUBLE(val) }
>  #define QLIT_QNUM(val) \
> -    { .type =3D QTYPE_QNUM, .value.qnum =3D (val) }
> +    QLIT_QNUM_INT(val)
>  #define QLIT_QSTR(val) \
>      { .type =3D QTYPE_QSTRING, .value.qstr =3D (val) }
>  #define QLIT_QDICT(val) \
> diff --git a/qobject/qlit.c b/qobject/qlit.c
> index be8332136c..b23cdc4532 100644
> --- a/qobject/qlit.c
> +++ b/qobject/qlit.c
> @@ -71,7 +71,8 @@ bool qlit_equal_qobject(const QLitObject *lhs, const
> QObject *rhs)
>      case QTYPE_QBOOL:
>          return lhs->value.qbool =3D=3D qbool_get_bool(qobject_to(QBool, =
rhs));
>      case QTYPE_QNUM:
> -        return lhs->value.qnum =3D=3D  qnum_get_int(qobject_to(QNum, rhs=
));
> +        return qnum_value_is_equal(&lhs->value.qnum,
> +                                   qnum_get_value(qobject_to(QNum, rhs))=
);
>      case QTYPE_QSTRING:
>          return (strcmp(lhs->value.qstr,
>                         qstring_get_str(qobject_to(QString, rhs))) =3D=3D=
 0);
> @@ -94,7 +95,7 @@ QObject *qobject_from_qlit(const QLitObject *qlit)
>      case QTYPE_QNULL:
>          return QOBJECT(qnull());
>      case QTYPE_QNUM:
> -        return QOBJECT(qnum_from_int(qlit->value.qnum));
> +        return QOBJECT(qnum_from_value(qlit->value.qnum));
>      case QTYPE_QSTRING:
>          return QOBJECT(qstring_from_str(qlit->value.qstr));
>      case QTYPE_QDICT: {
> diff --git a/tests/check-qjson.c b/tests/check-qjson.c
> index 07a773e653..711030cffd 100644
> --- a/tests/check-qjson.c
> +++ b/tests/check-qjson.c
> @@ -796,20 +796,23 @@ static void simple_number(void)
>      int i;
>      struct {
>          const char *encoded;
> +        QLitObject qlit;
>          int64_t decoded;
>          int skip;
>      } test_cases[] =3D {
> -        { "0", 0 },
> -        { "1234", 1234 },
> -        { "1", 1 },
> -        { "-32", -32 },
> -        { "-0", 0, .skip =3D 1 },
> +        { "0",    QLIT_QNUM(0),    0, },
> +        { "1234", QLIT_QNUM(1234), 1234, },
> +        { "1",    QLIT_QNUM(1),    1, },
> +        { "-32",  QLIT_QNUM(-32),  -32, },
> +        { "-0",   QLIT_QNUM(0),    0, .skip =3D 1 },
>          { },
>      };
>
>      for (i =3D 0; test_cases[i].encoded; i++) {
>          QNum *qnum;
>          int64_t val;
> +        QNum *qlit_num;
> +        int64_t qlit_val;
>
>          qnum =3D qobject_to(QNum,
>                            qobject_from_json(test_cases[i].encoded,
> @@ -817,6 +820,7 @@ static void simple_number(void)
>          g_assert(qnum);
>          g_assert(qnum_get_try_int(qnum, &val));
>          g_assert_cmpint(val, =3D=3D, test_cases[i].decoded);
> +
>          if (test_cases[i].skip =3D=3D 0) {
>              QString *str;
>
> @@ -826,9 +830,66 @@ static void simple_number(void)
>          }
>
>          qobject_unref(qnum);
> +
> +        qlit_num =3D qobject_to(QNum,
> +                              qobject_from_qlit(&test_cases[i].qlit));
> +        g_assert(qlit_num);
> +        g_assert(qnum_get_try_int(qlit_num, &qlit_val));
> +        g_assert_cmpint(qlit_val, =3D=3D, test_cases[i].decoded);
> +
> +        qobject_unref(qlit_num);
>      }
>  }
>
> +static void qlit_large_number(void)
> +{
> +    QLitObject maxu64 =3D QLIT_QNUM_UINT(UINT64_MAX);
> +    QLitObject maxi64 =3D QLIT_QNUM(INT64_MAX);
> +    QLitObject mini64 =3D QLIT_QNUM(INT64_MIN);
> +    QLitObject gtu64  =3D QLIT_QNUM_DOUBLE(18446744073709552e3);
> +    QLitObject lti64  =3D QLIT_QNUM_DOUBLE(-92233720368547758e2);
> +    QNum *qnum;
> +    uint64_t val;
> +    int64_t ival;
> +
> +    qnum =3D qobject_to(QNum, qobject_from_qlit(&maxu64));
> +    g_assert(qnum);
> +    g_assert_cmpuint(qnum_get_uint(qnum), =3D=3D, UINT64_MAX);
> +    g_assert(!qnum_get_try_int(qnum, &ival));
> +
> +    qobject_unref(qnum);
> +
> +    qnum =3D qobject_to(QNum, qobject_from_qlit(&maxi64));
> +    g_assert(qnum);
> +    g_assert_cmpuint(qnum_get_uint(qnum), =3D=3D, INT64_MAX);
> +    g_assert_cmpint(qnum_get_int(qnum), =3D=3D, INT64_MAX);
> +
> +    qobject_unref(qnum);
> +
> +    qnum =3D qobject_to(QNum, qobject_from_qlit(&mini64));
> +    g_assert(qnum);
> +    g_assert(!qnum_get_try_uint(qnum, &val));
> +    g_assert_cmpuint(qnum_get_int(qnum), =3D=3D, INT64_MIN);
> +
> +    qobject_unref(qnum);
> +
> +    qnum =3D qobject_to(QNum, qobject_from_qlit(&gtu64));
> +    g_assert(qnum);
> +    g_assert_cmpfloat(qnum_get_double(qnum), =3D=3D, 18446744073709552e3=
);
> +    g_assert(!qnum_get_try_uint(qnum, &val));
> +    g_assert(!qnum_get_try_int(qnum, &ival));
> +
> +    qobject_unref(qnum);
> +
> +    qnum =3D qobject_to(QNum, qobject_from_qlit(&lti64));
> +    g_assert(qnum);
> +    g_assert_cmpfloat(qnum_get_double(qnum), =3D=3D, -92233720368547758e=
2);
> +    g_assert(!qnum_get_try_uint(qnum, &val));
> +    g_assert(!qnum_get_try_int(qnum, &ival));
> +
> +    qobject_unref(qnum);
> +}
> +
>  static void large_number(void)
>  {
>      const char *maxu64 =3D "18446744073709551615"; /* 2^64-1 */
> @@ -1472,6 +1533,7 @@ int main(int argc, char **argv)
>      g_test_add_func("/literals/string/utf8", utf8_string);
>
>      g_test_add_func("/literals/number/simple", simple_number);
> +    g_test_add_func("/literals/number/qlit_large", qlit_large_number);
>      g_test_add_func("/literals/number/large", large_number);
>      g_test_add_func("/literals/number/float", float_number);
>
> --
> 2.28.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000024535c05b4499f85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 2:48 AM Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Us=
e QNumValue to represent QNums, so we can also support uint64_t<br>
and double QNum values.=C2=A0 Add new QLIT_QNUM_(INT|UINT|DOUBLE)<br>
macros for each case.<br>
<br>
The QLIT_QNUM() macro is being kept for compatibility with<br>
existing code, but becomes just a wrapper for QLIT_QNUM_INT().<br></blockqu=
ote><div><br></div><div>I am not sure it&#39;s worth to keep. (furthermore,=
 it&#39;s only used in tests afaics)<br></div><div> <br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mai=
lto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 =
<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
Changes v1 -&gt; v2:<br>
* Coding style fix at qlit_equal_qobject()<br>
---<br>
=C2=A0include/qapi/qmp/qlit.h | 11 +++++--<br>
=C2=A0qobject/qlit.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +--<br>
=C2=A0tests/check-qjson.c=C2=A0 =C2=A0 =C2=A0| 72 +++++++++++++++++++++++++=
+++++++++++++---<br>
=C2=A03 files changed, 79 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/include/qapi/qmp/qlit.h b/include/qapi/qmp/qlit.h<br>
index c0676d5daf..f9e356d31e 100644<br>
--- a/include/qapi/qmp/qlit.h<br>
+++ b/include/qapi/qmp/qlit.h<br>
@@ -15,6 +15,7 @@<br>
=C2=A0#define QLIT_H<br>
<br>
=C2=A0#include &quot;qobject.h&quot;<br>
+#include &quot;qnum.h&quot;<br>
<br>
=C2=A0typedef struct QLitDictEntry QLitDictEntry;<br>
=C2=A0typedef struct QLitObject QLitObject;<br>
@@ -23,7 +24,7 @@ struct QLitObject {<br>
=C2=A0 =C2=A0 =C2=A0QType type;<br>
=C2=A0 =C2=A0 =C2=A0union {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool qbool;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t qnum;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QNumValue qnum;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *qstr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QLitDictEntry *qdict;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QLitObject *qlist;<br>
@@ -39,8 +40,14 @@ struct QLitDictEntry {<br>
=C2=A0 =C2=A0 =C2=A0{ .type =3D QTYPE_QNULL }<br>
=C2=A0#define QLIT_QBOOL(val) \<br>
=C2=A0 =C2=A0 =C2=A0{ .type =3D QTYPE_QBOOL, .value.qbool =3D (val) }<br>
+#define QLIT_QNUM_INT(val) \<br>
+=C2=A0 =C2=A0 { .type =3D QTYPE_QNUM, .value.qnum =3D QNUM_VAL_INT(val) }<=
br>
+#define QLIT_QNUM_UINT(val) \<br>
+=C2=A0 =C2=A0 { .type =3D QTYPE_QNUM, .value.qnum =3D QNUM_VAL_UINT(val) }=
<br>
+#define QLIT_QNUM_DOUBLE(val) \<br>
+=C2=A0 =C2=A0 { .type =3D QTYPE_QNUM, .value.qnum =3D QNUM_VAL_DOUBLE(val)=
 }<br>
=C2=A0#define QLIT_QNUM(val) \<br>
-=C2=A0 =C2=A0 { .type =3D QTYPE_QNUM, .value.qnum =3D (val) }<br>
+=C2=A0 =C2=A0 QLIT_QNUM_INT(val)<br>
=C2=A0#define QLIT_QSTR(val) \<br>
=C2=A0 =C2=A0 =C2=A0{ .type =3D QTYPE_QSTRING, .value.qstr =3D (val) }<br>
=C2=A0#define QLIT_QDICT(val) \<br>
diff --git a/qobject/qlit.c b/qobject/qlit.c<br>
index be8332136c..b23cdc4532 100644<br>
--- a/qobject/qlit.c<br>
+++ b/qobject/qlit.c<br>
@@ -71,7 +71,8 @@ bool qlit_equal_qobject(const QLitObject *lhs, const QObj=
ect *rhs)<br>
=C2=A0 =C2=A0 =C2=A0case QTYPE_QBOOL:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return lhs-&gt;value.qbool =3D=3D qbool_g=
et_bool(qobject_to(QBool, rhs));<br>
=C2=A0 =C2=A0 =C2=A0case QTYPE_QNUM:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return lhs-&gt;value.qnum =3D=3D=C2=A0 qnum_ge=
t_int(qobject_to(QNum, rhs));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qnum_value_is_equal(&amp;lhs-&gt;value.=
qnum,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qnum_get_value(qobject_=
to(QNum, rhs)));<br>
=C2=A0 =C2=A0 =C2=A0case QTYPE_QSTRING:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (strcmp(lhs-&gt;value.qstr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 qstring_get_str(qobject_to(QString, rhs))) =3D=3D 0);<br>
@@ -94,7 +95,7 @@ QObject *qobject_from_qlit(const QLitObject *qlit)<br>
=C2=A0 =C2=A0 =C2=A0case QTYPE_QNULL:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return QOBJECT(qnull());<br>
=C2=A0 =C2=A0 =C2=A0case QTYPE_QNUM:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return QOBJECT(qnum_from_int(qlit-&gt;value.qn=
um));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return QOBJECT(qnum_from_value(qlit-&gt;value.=
qnum));<br>
=C2=A0 =C2=A0 =C2=A0case QTYPE_QSTRING:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return QOBJECT(qstring_from_str(qlit-&gt;=
value.qstr));<br>
=C2=A0 =C2=A0 =C2=A0case QTYPE_QDICT: {<br>
diff --git a/tests/check-qjson.c b/tests/check-qjson.c<br>
index 07a773e653..711030cffd 100644<br>
--- a/tests/check-qjson.c<br>
+++ b/tests/check-qjson.c<br>
@@ -796,20 +796,23 @@ static void simple_number(void)<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
=C2=A0 =C2=A0 =C2=A0struct {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *encoded;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QLitObject qlit;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t decoded;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int skip;<br>
=C2=A0 =C2=A0 =C2=A0} test_cases[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;0&quot;, 0 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;1234&quot;, 1234 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;1&quot;, 1 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;-32&quot;, -32 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;-0&quot;, 0, .skip =3D 1 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;0&quot;,=C2=A0 =C2=A0 QLIT_QNUM(0),=C2=
=A0 =C2=A0 0, },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;1234&quot;, QLIT_QNUM(1234), 1234, },<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;1&quot;,=C2=A0 =C2=A0 QLIT_QNUM(1),=C2=
=A0 =C2=A0 1, },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;-32&quot;,=C2=A0 QLIT_QNUM(-32),=C2=A0=
 -32, },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;-0&quot;,=C2=A0 =C2=A0QLIT_QNUM(0),=C2=
=A0 =C2=A0 0, .skip =3D 1 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ },<br>
=C2=A0 =C2=A0 =C2=A0};<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; test_cases[i].encoded; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QNum *qnum;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QNum *qlit_num;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t qlit_val;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qnum =3D qobject_to(QNum,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qobject_from_json(test_cases[i].encoded,<br>
@@ -817,6 +820,7 @@ static void simple_number(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(qnum);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(qnum_get_try_int(qnum, &amp;val)=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_cmpint(val, =3D=3D, test_cases[i=
].decoded);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (test_cases[i].skip =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QString *str;<br>
<br>
@@ -826,9 +830,66 @@ static void simple_number(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qobject_unref(qnum);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qlit_num =3D qobject_to(QNum,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qobject_from_qlit(&amp;test_cases[i].qlit))=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(qlit_num);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(qnum_get_try_int(qlit_num, &amp;qlit_=
val));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpint(qlit_val, =3D=3D, test_cases[i=
].decoded);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qobject_unref(qlit_num);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static void qlit_large_number(void)<br>
+{<br>
+=C2=A0 =C2=A0 QLitObject maxu64 =3D QLIT_QNUM_UINT(UINT64_MAX);<br>
+=C2=A0 =C2=A0 QLitObject maxi64 =3D QLIT_QNUM(INT64_MAX);<br>
+=C2=A0 =C2=A0 QLitObject mini64 =3D QLIT_QNUM(INT64_MIN);<br>
+=C2=A0 =C2=A0 QLitObject gtu64=C2=A0 =3D QLIT_QNUM_DOUBLE(1844674407370955=
2e3);<br>
+=C2=A0 =C2=A0 QLitObject lti64=C2=A0 =3D QLIT_QNUM_DOUBLE(-922337203685477=
58e2);<br>
+=C2=A0 =C2=A0 QNum *qnum;<br>
+=C2=A0 =C2=A0 uint64_t val;<br>
+=C2=A0 =C2=A0 int64_t ival;<br>
+<br>
+=C2=A0 =C2=A0 qnum =3D qobject_to(QNum, qobject_from_qlit(&amp;maxu64));<b=
r>
+=C2=A0 =C2=A0 g_assert(qnum);<br>
+=C2=A0 =C2=A0 g_assert_cmpuint(qnum_get_uint(qnum), =3D=3D, UINT64_MAX);<b=
r>
+=C2=A0 =C2=A0 g_assert(!qnum_get_try_int(qnum, &amp;ival));<br>
+<br>
+=C2=A0 =C2=A0 qobject_unref(qnum);<br>
+<br>
+=C2=A0 =C2=A0 qnum =3D qobject_to(QNum, qobject_from_qlit(&amp;maxi64));<b=
r>
+=C2=A0 =C2=A0 g_assert(qnum);<br>
+=C2=A0 =C2=A0 g_assert_cmpuint(qnum_get_uint(qnum), =3D=3D, INT64_MAX);<br=
>
+=C2=A0 =C2=A0 g_assert_cmpint(qnum_get_int(qnum), =3D=3D, INT64_MAX);<br>
+<br>
+=C2=A0 =C2=A0 qobject_unref(qnum);<br>
+<br>
+=C2=A0 =C2=A0 qnum =3D qobject_to(QNum, qobject_from_qlit(&amp;mini64));<b=
r>
+=C2=A0 =C2=A0 g_assert(qnum);<br>
+=C2=A0 =C2=A0 g_assert(!qnum_get_try_uint(qnum, &amp;val));<br>
+=C2=A0 =C2=A0 g_assert_cmpuint(qnum_get_int(qnum), =3D=3D, INT64_MIN);<br>
+<br>
+=C2=A0 =C2=A0 qobject_unref(qnum);<br>
+<br>
+=C2=A0 =C2=A0 qnum =3D qobject_to(QNum, qobject_from_qlit(&amp;gtu64));<br=
>
+=C2=A0 =C2=A0 g_assert(qnum);<br>
+=C2=A0 =C2=A0 g_assert_cmpfloat(qnum_get_double(qnum), =3D=3D, 18446744073=
709552e3);<br>
+=C2=A0 =C2=A0 g_assert(!qnum_get_try_uint(qnum, &amp;val));<br>
+=C2=A0 =C2=A0 g_assert(!qnum_get_try_int(qnum, &amp;ival));<br>
+<br>
+=C2=A0 =C2=A0 qobject_unref(qnum);<br>
+<br>
+=C2=A0 =C2=A0 qnum =3D qobject_to(QNum, qobject_from_qlit(&amp;lti64));<br=
>
+=C2=A0 =C2=A0 g_assert(qnum);<br>
+=C2=A0 =C2=A0 g_assert_cmpfloat(qnum_get_double(qnum), =3D=3D, -9223372036=
8547758e2);<br>
+=C2=A0 =C2=A0 g_assert(!qnum_get_try_uint(qnum, &amp;val));<br>
+=C2=A0 =C2=A0 g_assert(!qnum_get_try_int(qnum, &amp;ival));<br>
+<br>
+=C2=A0 =C2=A0 qobject_unref(qnum);<br>
+}<br>
+<br>
=C2=A0static void large_number(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const char *maxu64 =3D &quot;18446744073709551615&quot;=
; /* 2^64-1 */<br>
@@ -1472,6 +1533,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/literals/string/utf8&quot;, utf8=
_string);<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/literals/number/simple&quot;, si=
mple_number);<br>
+=C2=A0 =C2=A0 g_test_add_func(&quot;/literals/number/qlit_large&quot;, qli=
t_large_number);<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/literals/number/large&quot;, lar=
ge_number);<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/literals/number/float&quot;, flo=
at_number);<br>
<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000024535c05b4499f85--

