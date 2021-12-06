Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2575046A687
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 21:04:50 +0100 (CET)
Received: from localhost ([::1]:41026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muKEC-0003cH-NV
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 15:04:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muKBq-0002pj-Ob
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 15:02:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muKBn-0007ie-O5
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 15:02:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638820938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nWIE/0qoxO/ZQ/x2sfBfRkIw4LKtjuaOYnGbSaIn3KY=;
 b=E15NpAGqC0xUfG55Rg3nn2j+f/quq6mHXQN8yXsGPla5TnBQUnqZwlfwF0FwRqT/tCEWG8
 ySYQrbqy0JLDuQiaaiP9rdqtySgT+uZ2QHPD7BKMX3Ovc9fej3ecJjIzIjEQX0lnyIriWo
 aqBiG31FILiPMT0fuRYciPFy+W/+gzo=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-hCVboA5vMCeNz5HJTIZUnA-1; Mon, 06 Dec 2021 15:02:17 -0500
X-MC-Unique: hCVboA5vMCeNz5HJTIZUnA-1
Received: by mail-ua1-f69.google.com with SMTP id
 106-20020a9f2473000000b002d0671b34efso6685776uaq.10
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 12:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nWIE/0qoxO/ZQ/x2sfBfRkIw4LKtjuaOYnGbSaIn3KY=;
 b=VNDzG3vAqptlMUlqiAWHBxQcZpJKnmkBQLYsX3jReJE/cCa/6Ly4duqJe5x/JKfXLA
 3DYizDxI/WKqgq/X2DyDZBRT/aU2ewDEX/DI99HQz+sIsCF5WxYNusMQlY2OkBH5Uzoi
 cUai08b6tvOgLkjqynr7JS1Gx4AscwlX8a6hXsfmShHVIlliW7unmYg6GPVI/mS+DUX2
 33uQxTrctH42uV2cFRh+A6QLSc454gFSC9Gku+o2xtdBUW2D/KgtDH1BAuv9ksufdwxd
 cCnJI0CQMkzM6UMZ6hyq8ubqdfQr6nsGbCeWWp2s5aXVqKBqm3SIGJCQePsTL0Rl7Qkx
 w4Rg==
X-Gm-Message-State: AOAM530TjD2g9fbC5x+CzHJ/DCRaKwbpgLhB0DrkrDqclPO5IgxxBPrF
 7Mjorb+1x2104Z4iB2QqPGidOc7o33j9qc9exSlipv5DCtSA04tGvAMyfm2V/9wzlzU61+RzkVu
 cDxbCsXCQk3CVQmG5xrmtIpGTO5OaO+Q=
X-Received: by 2002:a1f:a4c5:: with SMTP id n188mr44906351vke.35.1638820936713; 
 Mon, 06 Dec 2021 12:02:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfQ40dYt2QoGCc4c1WuH1kGvVLCLDXc5pB3l0T/UY3hNGaD8+LqpTtwk7pM8kqjCgMjdZIDCg+HX5T5qgR5/A=
X-Received: by 2002:a1f:a4c5:: with SMTP id n188mr44906322vke.35.1638820936539; 
 Mon, 06 Dec 2021 12:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20211201104347.51922-1-thuth@redhat.com>
 <20211201104347.51922-5-thuth@redhat.com>
In-Reply-To: <20211201104347.51922-5-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 6 Dec 2021 15:02:05 -0500
Message-ID: <CAFn=p-bzqXqJZqnMT-+mOUJK2DEWi0JM4crWZZy+MC_xCDk95w@mail.gmail.com>
Subject: Re: [PATCH for-7.0 4/4] tests/qtest: Add a function to check whether
 a machine is available
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c5f16a05d27fbbd0"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c5f16a05d27fbbd0
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 1, 2021 at 5:44 AM Thomas Huth <thuth@redhat.com> wrote:

> It is nowadays possible to build QEMU with a reduced set of machines
> in each binary. However, the qtests still hard-code the expected
> machines and fail if the binary does not feature the required machine.
> Let's get a little bit more flexible here: Add a function that can be
> used to query whether a certain machine is available or not, and use
> it in some tests as an example (more work has to be done in other
> tests which will follow later).
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/boot-serial-test.c |  3 ++-
>  tests/qtest/cdrom-test.c       |  8 +++++---
>  tests/qtest/libqos/libqtest.h  |  8 ++++++++
>  tests/qtest/libqtest.c         | 17 +++++++++++++++++
>  tests/qtest/prom-env-test.c    |  8 +++++---
>  5 files changed, 37 insertions(+), 7 deletions(-)
>
> diff --git a/tests/qtest/boot-serial-test.c
> b/tests/qtest/boot-serial-test.c
> index 83828ba270..4d8e1343bd 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -285,7 +285,8 @@ int main(int argc, char *argv[])
>      g_test_init(&argc, &argv, NULL);
>
>      for (i = 0; tests[i].arch != NULL; i++) {
> -        if (strcmp(arch, tests[i].arch) == 0) {
> +        if (g_str_equal(arch, tests[i].arch) &&
> +            qtest_has_machine(tests[i].machine)) {
>              char *name = g_strdup_printf("boot-serial/%s",
> tests[i].machine);
>              qtest_add_data_func(name, &tests[i], test_machine);
>              g_free(name);
> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> index 5af944a5fb..c1fcac5c45 100644
> --- a/tests/qtest/cdrom-test.c
> +++ b/tests/qtest/cdrom-test.c
> @@ -109,9 +109,11 @@ static void test_cdrom_param(gconstpointer data)
>  static void add_cdrom_param_tests(const char **machines)
>  {
>      while (*machines) {
> -        char *testname = g_strdup_printf("cdrom/param/%s", *machines);
> -        qtest_add_data_func(testname, *machines, test_cdrom_param);
> -        g_free(testname);
> +        if (qtest_has_machine(*machines)) {
> +            char *testname = g_strdup_printf("cdrom/param/%s", *machines);
> +            qtest_add_data_func(testname, *machines, test_cdrom_param);
> +            g_free(testname);
> +        }
>          machines++;
>      }
>  }
> diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
> index 59e9271195..dff6b31cf0 100644
> --- a/tests/qtest/libqos/libqtest.h
> +++ b/tests/qtest/libqos/libqtest.h
> @@ -710,6 +710,14 @@ QDict *qmp_fd(int fd, const char *fmt, ...)
> GCC_FMT_ATTR(2, 3);
>  void qtest_cb_for_every_machine(void (*cb)(const char *machine),
>                                  bool skip_old_versioned);
>
> +/**
> + * qtest_has_machine:
> + * @machine: The machine to look for
> + *
> + * Returns: true if the machine is available in the target binary.
> + */
> +bool qtest_has_machine(const char *machine);
> +
>  /**
>   * qtest_qmp_device_add_qdict:
>   * @qts: QTestState instance to operate on
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 7ae2dc4e1d..65ed949685 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -1401,6 +1401,23 @@ void qtest_cb_for_every_machine(void (*cb)(const
> char *machine),
>      }
>  }
>
> +bool qtest_has_machine(const char *machine)
> +{
> +    struct MachInfo *machines;
> +    int i;
> +
> +    machines = qtest_get_machines();
> +
> +    for (i = 0; machines[i].name != NULL; i++) {
> +        if (g_str_equal(machine, machines[i].name) ||
> +            (machines[i].alias && g_str_equal(machine,
> machines[i].alias))) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
>  /*
>   * Generic hot-plugging test via the device_add QMP commands.
>   */
> diff --git a/tests/qtest/prom-env-test.c b/tests/qtest/prom-env-test.c
> index f41d80154a..bdbb01d8e5 100644
> --- a/tests/qtest/prom-env-test.c
> +++ b/tests/qtest/prom-env-test.c
> @@ -71,9 +71,11 @@ static void add_tests(const char *machines[])
>      char *name;
>
>      for (i = 0; machines[i] != NULL; i++) {
> -        name = g_strdup_printf("prom-env/%s", machines[i]);
> -        qtest_add_data_func(name, machines[i], test_machine);
> -        g_free(name);
> +        if (qtest_has_machine(machines[i])) {
> +            name = g_strdup_printf("prom-env/%s", machines[i]);
> +            qtest_add_data_func(name, machines[i], test_machine);
> +            g_free(name);
> +        }
>      }
>  }
>
>
I wonder if the arch-specific CDROM tests should be split out into their
own file, because IIRC it's not really about testing the *cdrom* itself,
it's just a test that uses the CDROM.

Eh.

cdrom test bits: Acked-by: John Snow <jsnow@redhat.com>

--js

--000000000000c5f16a05d27fbbd0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 1, 2021 at 5:44 AM Thomas=
 Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It is nowaday=
s possible to build QEMU with a reduced set of machines<br>
in each binary. However, the qtests still hard-code the expected<br>
machines and fail if the binary does not feature the required machine.<br>
Let&#39;s get a little bit more flexible here: Add a function that can be<b=
r>
used to query whether a certain machine is available or not, and use<br>
it in some tests as an example (more work has to be done in other<br>
tests which will follow later).<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/qtest/boot-serial-test.c |=C2=A0 3 ++-<br>
=C2=A0tests/qtest/cdrom-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +++++---=
<br>
=C2=A0tests/qtest/libqos/libqtest.h=C2=A0 |=C2=A0 8 ++++++++<br>
=C2=A0tests/qtest/libqtest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 ++++++++=
+++++++++<br>
=C2=A0tests/qtest/prom-env-test.c=C2=A0 =C2=A0 |=C2=A0 8 +++++---<br>
=C2=A05 files changed, 37 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.=
c<br>
index 83828ba270..4d8e1343bd 100644<br>
--- a/tests/qtest/boot-serial-test.c<br>
+++ b/tests/qtest/boot-serial-test.c<br>
@@ -285,7 +285,8 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0g_test_init(&amp;argc, &amp;argv, NULL);<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; tests[i].arch !=3D NULL; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(arch, tests[i].arch) =3D=3D 0) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_str_equal(arch, tests[i].arch) &amp;&amp=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_has_machine(tests[i].machi=
ne)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *name =3D g_strdup_pri=
ntf(&quot;boot-serial/%s&quot;, tests[i].machine);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_add_data_func(name, &=
amp;tests[i], test_machine);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(name);<br>
diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c<br>
index 5af944a5fb..c1fcac5c45 100644<br>
--- a/tests/qtest/cdrom-test.c<br>
+++ b/tests/qtest/cdrom-test.c<br>
@@ -109,9 +109,11 @@ static void test_cdrom_param(gconstpointer data)<br>
=C2=A0static void add_cdrom_param_tests(const char **machines)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0while (*machines) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *testname =3D g_strdup_printf(&quot;cdrom=
/param/%s&quot;, *machines);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_add_data_func(testname, *machines, test_=
cdrom_param);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(testname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qtest_has_machine(*machines)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *testname =3D g_strdup_prin=
tf(&quot;cdrom/param/%s&quot;, *machines);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_add_data_func(testname, *m=
achines, test_cdrom_param);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(testname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0machines++;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h<=
br>
index 59e9271195..dff6b31cf0 100644<br>
--- a/tests/qtest/libqos/libqtest.h<br>
+++ b/tests/qtest/libqos/libqtest.h<br>
@@ -710,6 +710,14 @@ QDict *qmp_fd(int fd, const char *fmt, ...) GCC_FMT_AT=
TR(2, 3);<br>
=C2=A0void qtest_cb_for_every_machine(void (*cb)(const char *machine),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool skip_old_versioned);<br>
<br>
+/**<br>
+ * qtest_has_machine:<br>
+ * @machine: The machine to look for<br>
+ *<br>
+ * Returns: true if the machine is available in the target binary.<br>
+ */<br>
+bool qtest_has_machine(const char *machine);<br>
+<br>
=C2=A0/**<br>
=C2=A0 * qtest_qmp_device_add_qdict:<br>
=C2=A0 * @qts: QTestState instance to operate on<br>
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
index 7ae2dc4e1d..65ed949685 100644<br>
--- a/tests/qtest/libqtest.c<br>
+++ b/tests/qtest/libqtest.c<br>
@@ -1401,6 +1401,23 @@ void qtest_cb_for_every_machine(void (*cb)(const cha=
r *machine),<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+bool qtest_has_machine(const char *machine)<br>
+{<br>
+=C2=A0 =C2=A0 struct MachInfo *machines;<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 machines =3D qtest_get_machines();<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; machines[i].name !=3D NULL; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_str_equal(machine, machines[i].name) ||<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (machines[i].alias &amp;&amp; g_=
str_equal(machine, machines[i].alias))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
=C2=A0/*<br>
=C2=A0 * Generic hot-plugging test via the device_add QMP commands.<br>
=C2=A0 */<br>
diff --git a/tests/qtest/prom-env-test.c b/tests/qtest/prom-env-test.c<br>
index f41d80154a..bdbb01d8e5 100644<br>
--- a/tests/qtest/prom-env-test.c<br>
+++ b/tests/qtest/prom-env-test.c<br>
@@ -71,9 +71,11 @@ static void add_tests(const char *machines[])<br>
=C2=A0 =C2=A0 =C2=A0char *name;<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; machines[i] !=3D NULL; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D g_strdup_printf(&quot;prom-env/%s&quo=
t;, machines[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_add_data_func(name, machines[i], test_ma=
chine);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qtest_has_machine(machines[i])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D g_strdup_printf(&quot;p=
rom-env/%s&quot;, machines[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_add_data_func(name, machin=
es[i], test_machine);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br></blockquote><div><br></div><div>I wonder if the arch-specific CDROM te=
sts should be split out into their own file, because IIRC it&#39;s not real=
ly about testing the *cdrom* itself, it&#39;s just a test that uses the CDR=
OM.</div><div><br></div><div>Eh.</div><div><br></div><div>cdrom test bits: =
Acked-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.co=
m</a>&gt;</div><div><br></div><div>--js<br></div></div></div>

--000000000000c5f16a05d27fbbd0--


