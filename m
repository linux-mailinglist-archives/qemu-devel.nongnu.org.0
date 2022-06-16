Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDEF54E6D9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 18:19:06 +0200 (CEST)
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1sD4-0002ZJ-2X
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 12:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1s5G-0003qK-UV
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:11:03 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:41870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1s5D-0000LG-QI
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:11:02 -0400
Received: by mail-lf1-x12c.google.com with SMTP id e17so116959lfq.8
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EzPkKzoYY0UtxFbHRIq0eaSbh/0HBWOCStYnigDWa+k=;
 b=S2VMVxB9yYrw8szaubkGeq5N0FiWPFJ3859Vad2gbW5e2FHaSkBujSxdnGhSxRoEv+
 N//5RTdL81NMcu/s1ztcJf3Co3go4C7Us7HHOPGny/qQNo51ufVlcWjzDEQlpgXvcHJY
 9+r+5VtWwtc33O7y7KN2lgihuTiYBd6JWEBq5lOrO/vYUs9/gicB0yFw6H88V4/kefQl
 NvK/pE0yYpeTH/r8rSseKf1CpLTjV7vHmGYae1dThX2jhodVPTF1RsPK+ubxIirf2b/t
 wjPbFReY6sZUwZdUZtGrx5wQ0RWySVLV8aWLunluS9ScIqjAmaFhdmDHBsoXlV9GJfUB
 WVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EzPkKzoYY0UtxFbHRIq0eaSbh/0HBWOCStYnigDWa+k=;
 b=dldSikgw4W93h2YdR+5dXdlFS5IMiiz0sEQmQiB4fg8Jy8Xfepl1CCLgqxOrw7DeNQ
 CBtn2w5nI08zTTX1E/yEfCwnczOrZ6E5AvLr3IQ1+RDw9kQ1F5k4lui0uu4Rz7oVV7Fv
 EToS4pZtrrQjOlxnma9DV8Fxah0UzwhE+OmbkGm88lA616UsW4viR59+tQKTXITE9Qsv
 zTzYzHUYg4AfUbKS/wHY2sW3UphPOFVadrgb4bEoNH7kdfTe2eNbda6UizK54wxj4kVz
 V8Wh/vSg6KRmdomNYRlcuDF3KbMEbF64GEcxLIkJjRrUsKxBnY4JDjM3SKsz/WCTG+5t
 WzGg==
X-Gm-Message-State: AJIora+vXPPKr89xFNbxd9KqVHaXxY33FUvw6ZuKjYpq7EusIuVkio9Z
 Fc0QCTjoncTjJ+GiAR991eCtosTwehKVihSPfaU=
X-Google-Smtp-Source: AGRyM1seMsQ0UUVVYjaL20Wj/2SCaxXrq9n5i92UeI8FgTIbANxAKwza2tHeOmnVIPVOrvnD6umGdM7eAVFo2j6dsMw=
X-Received: by 2002:a05:6512:108b:b0:479:4cce:7ab1 with SMTP id
 j11-20020a056512108b00b004794cce7ab1mr3111088lfg.94.1655395856739; Thu, 16
 Jun 2022 09:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-18-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1655304746-102776-18-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 16 Jun 2022 20:10:44 +0400
Message-ID: <CAJ+F1CKFiesTzFhQRa6XJrraO2bRV+j59kegZuCg0CZB3cepCQ@mail.gmail.com>
Subject: Re: [PATCH V8 17/39] qapi: strList unit tests
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
Content-Type: multipart/alternative; boundary="00000000000000f1ac05e192e2e7"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
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

--00000000000000f1ac05e192e2e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2022 at 6:58 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  MAINTAINERS               |  1 +
>  tests/unit/meson.build    |  1 +
>  tests/unit/test-strlist.c | 81
> +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 83 insertions(+)
>  create mode 100644 tests/unit/test-strlist.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e4e72f..f9a6362 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3160,6 +3160,7 @@ F: include/migration/cpr.h
>  F: migration/cpr.c
>  F: qapi/cpr.json
>  F: stubs/cpr.c
> +F: tests/unit/test-strlist.c
>
>  Record/replay
>  M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
> diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> index 287b367..57d48d5 100644
> --- a/tests/unit/meson.build
> +++ b/tests/unit/meson.build
> @@ -17,6 +17,7 @@ tests =3D {
>    'test-forward-visitor': [testqapi],
>    'test-string-input-visitor': [testqapi],
>    'test-string-output-visitor': [testqapi],
> +  'test-strlist': [testqapi],
>    'test-opts-visitor': [testqapi],
>    'test-visitor-serialization': [testqapi],
>    'test-bitmap': [],
> diff --git a/tests/unit/test-strlist.c b/tests/unit/test-strlist.c
> new file mode 100644
> index 0000000..ef740dc
> --- /dev/null
> +++ b/tests/unit/test-strlist.c
> @@ -0,0 +1,81 @@
> +/*
> + * Copyright (c) 2022 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/util.h"
> +#include "qapi/qapi-builtin-types.h"
> +
> +static strList *make_list(int length)
> +{
> +    strList *head =3D 0, *list, **prev =3D &head;
> +
> +    while (length--) {
> +        list =3D *prev =3D g_new0(strList, 1);
> +        list->value =3D g_strdup("aaa");
> +        prev =3D &list->next;
> +    }
> +    return head;
> +}
> +
> +static void test_length(void)
> +{
> +    strList *list;
> +    int i;
> +
> +    for (i =3D 0; i < 5; i++) {
> +        list =3D make_list(i);
> +        g_assert_cmpint(i, =3D=3D, QAPI_LIST_LENGTH(list));
> +        qapi_free_strList(list);
> +    }
> +}
> +
> +struct {
> +    const char *string;
> +    char delim;
> +    const char *args[5];
> +} list_data[] =3D {
> +    { 0, ',', { 0 } },
> +    { "", ',', { 0 } },
> +    { "a", ',', { "a", 0 } },
> +    { "a,b", ',', { "a", "b", 0 } },
> +    { "a,b,c", ',', { "a", "b", "c", 0 } },
> +    { "first last", ' ', { "first", "last", 0 } },
> +    { "a:", ':', { "a", 0 } },
> +    { "a::b", ':', { "a", "", "b", 0 } },
> +    { ":", ':', { "", 0 } },
> +    { ":a", ':', { "", "a", 0 } },
> +    { "::a", ':', { "", "", "a", 0 } },
> +};
> +
> +static void test_strv(void)
> +{
> +    int i, j;
> +    const char **expect;
> +    strList *list;
> +    GStrv args;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(list_data); i++) {
> +        expect =3D list_data[i].args;
> +        list =3D strList_from_string(list_data[i].string,
> list_data[i].delim);
> +        args =3D strv_from_strList(list);
> +        qapi_free_strList(list);
> +        for (j =3D 0; expect[j] && args[j]; j++) {
> +            g_assert_cmpstr(expect[j], =3D=3D, args[j]);
> +        }
> +        g_assert_null(expect[j]);
> +        g_assert_null(args[j]);
> +        g_strfreev(args);
> +    }
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    g_test_init(&argc, &argv, NULL);
> +    g_test_add_func("/test-string/length", test_length);
> +    g_test_add_func("/test-string/strv", test_strv);
> +    return g_test_run();
> +}
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000000f1ac05e192e2e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, 2022 at 6:58 PM Steve=
 Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@or=
acle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@o=
racle.com" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br></blockqu=
ote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"=
mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
=C2=A0tests/unit/meson.build=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0tests/unit/test-strlist.c | 81 ++++++++++++++++++++++++++++++++++++++=
+++++++++<br>
=C2=A03 files changed, 83 insertions(+)<br>
=C2=A0create mode 100644 tests/unit/test-strlist.c<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 1e4e72f..f9a6362 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3160,6 +3160,7 @@ F: include/migration/cpr.h<br>
=C2=A0F: migration/cpr.c<br>
=C2=A0F: qapi/cpr.json<br>
=C2=A0F: stubs/cpr.c<br>
+F: tests/unit/test-strlist.c<br>
<br>
=C2=A0Record/replay<br>
=C2=A0M: Pavel Dovgalyuk &lt;<a href=3D"mailto:pavel.dovgaluk@ispras.ru" ta=
rget=3D"_blank">pavel.dovgaluk@ispras.ru</a>&gt;<br>
diff --git a/tests/unit/meson.build b/tests/unit/meson.build<br>
index 287b367..57d48d5 100644<br>
--- a/tests/unit/meson.build<br>
+++ b/tests/unit/meson.build<br>
@@ -17,6 +17,7 @@ tests =3D {<br>
=C2=A0 =C2=A0&#39;test-forward-visitor&#39;: [testqapi],<br>
=C2=A0 =C2=A0&#39;test-string-input-visitor&#39;: [testqapi],<br>
=C2=A0 =C2=A0&#39;test-string-output-visitor&#39;: [testqapi],<br>
+=C2=A0 &#39;test-strlist&#39;: [testqapi],<br>
=C2=A0 =C2=A0&#39;test-opts-visitor&#39;: [testqapi],<br>
=C2=A0 =C2=A0&#39;test-visitor-serialization&#39;: [testqapi],<br>
=C2=A0 =C2=A0&#39;test-bitmap&#39;: [],<br>
diff --git a/tests/unit/test-strlist.c b/tests/unit/test-strlist.c<br>
new file mode 100644<br>
index 0000000..ef740dc<br>
--- /dev/null<br>
+++ b/tests/unit/test-strlist.c<br>
@@ -0,0 +1,81 @@<br>
+/*<br>
+ * Copyright (c) 2022 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/util.h&quot;<br>
+#include &quot;qapi/qapi-builtin-types.h&quot;<br>
+<br>
+static strList *make_list(int length)<br>
+{<br>
+=C2=A0 =C2=A0 strList *head =3D 0, *list, **prev =3D &amp;head;<br>
+<br>
+=C2=A0 =C2=A0 while (length--) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 list =3D *prev =3D g_new0(strList, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 list-&gt;value =3D g_strdup(&quot;aaa&quot;);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev =3D &amp;list-&gt;next;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return head;<br>
+}<br>
+<br>
+static void test_length(void)<br>
+{<br>
+=C2=A0 =C2=A0 strList *list;<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; 5; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 list =3D make_list(i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpint(i, =3D=3D, QAPI_LIST_LENGTH(li=
st));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_free_strList(list);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+struct {<br>
+=C2=A0 =C2=A0 const char *string;<br>
+=C2=A0 =C2=A0 char delim;<br>
+=C2=A0 =C2=A0 const char *args[5];<br>
+} list_data[] =3D {<br>
+=C2=A0 =C2=A0 { 0, &#39;,&#39;, { 0 } },<br>
+=C2=A0 =C2=A0 { &quot;&quot;, &#39;,&#39;, { 0 } },<br>
+=C2=A0 =C2=A0 { &quot;a&quot;, &#39;,&#39;, { &quot;a&quot;, 0 } },<br>
+=C2=A0 =C2=A0 { &quot;a,b&quot;, &#39;,&#39;, { &quot;a&quot;, &quot;b&quo=
t;, 0 } },<br>
+=C2=A0 =C2=A0 { &quot;a,b,c&quot;, &#39;,&#39;, { &quot;a&quot;, &quot;b&q=
uot;, &quot;c&quot;, 0 } },<br>
+=C2=A0 =C2=A0 { &quot;first last&quot;, &#39; &#39;, { &quot;first&quot;, =
&quot;last&quot;, 0 } },<br>
+=C2=A0 =C2=A0 { &quot;a:&quot;, &#39;:&#39;, { &quot;a&quot;, 0 } },<br>
+=C2=A0 =C2=A0 { &quot;a::b&quot;, &#39;:&#39;, { &quot;a&quot;, &quot;&quo=
t;, &quot;b&quot;, 0 } },<br>
+=C2=A0 =C2=A0 { &quot;:&quot;, &#39;:&#39;, { &quot;&quot;, 0 } },<br>
+=C2=A0 =C2=A0 { &quot;:a&quot;, &#39;:&#39;, { &quot;&quot;, &quot;a&quot;=
, 0 } },<br>
+=C2=A0 =C2=A0 { &quot;::a&quot;, &#39;:&#39;, { &quot;&quot;, &quot;&quot;=
, &quot;a&quot;, 0 } },<br>
+};<br>
+<br>
+static void test_strv(void)<br>
+{<br>
+=C2=A0 =C2=A0 int i, j;<br>
+=C2=A0 =C2=A0 const char **expect;<br>
+=C2=A0 =C2=A0 strList *list;<br>
+=C2=A0 =C2=A0 GStrv args;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(list_data); i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expect =3D list_data[i].args;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 list =3D strList_from_string(list_data[i].stri=
ng, list_data[i].delim);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 args =3D strv_from_strList(list);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_free_strList(list);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0; expect[j] &amp;&amp; args[j]; j+=
+) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpstr(expect[j], =3D=
=3D, args[j]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_null(expect[j]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_null(args[j]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_strfreev(args);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+int main(int argc, char **argv)<br>
+{<br>
+=C2=A0 =C2=A0 g_test_init(&amp;argc, &amp;argv, NULL);<br>
+=C2=A0 =C2=A0 g_test_add_func(&quot;/test-string/length&quot;, test_length=
);<br>
+=C2=A0 =C2=A0 g_test_add_func(&quot;/test-string/strv&quot;, test_strv);<b=
r>
+=C2=A0 =C2=A0 return g_test_run();<br>
+}<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000000f1ac05e192e2e7--

