Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8FE3A0434
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:53:07 +0200 (CEST)
Received: from localhost ([::1]:55374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhmc-0008NO-1g
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lqhlV-0007iw-Hh
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:51:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lqhlR-0001MR-2Y
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623181909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eZLIC/QNbah6MxxKEZxHZYf0R0MgusHf4MieqgC9lro=;
 b=aec+B4OGWac2KQtA9c/yJwvwyW+udIu55vwD0dvGhJ6kyO2oK/lPFSUzJMNkOHkVqAeW6B
 NwGUq7asMhsr/Hqd1FOasbsw13qtGZMAUwjAb06143fwfzi0e8qIu5Li4PXDNh22hHqzux
 N6JFhsrYE93pdFcGkNdodate+Bl+5j8=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-dkIa1CBbOrqo67zk7J8dMQ-1; Tue, 08 Jun 2021 15:51:48 -0400
X-MC-Unique: dkIa1CBbOrqo67zk7J8dMQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 x7-20020a63db470000b029022199758419so724821pgi.11
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 12:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eZLIC/QNbah6MxxKEZxHZYf0R0MgusHf4MieqgC9lro=;
 b=WU6gBAYbfM19zrPrrvFbG7lVk19fL2/4+71DuNOYL9p8saRjxZol/meMcVvURusUj9
 A10MIyENCwIIEyQzcmlPLb9k7CcDgpNU+KPdZcasb1rlM4dpC4NCxEpXOxkDMdbWTfNL
 Br5TyDKCMBxElpjKfO+iFbD8mZIshMIi4dEYi0ForPcDknKzJ1ELpz2+vEZgo0VpqE1m
 VjUnnMP8PDBg+L0JonMiabwIgxQJMvFUz3gHZq6RVv4sBTD8N6fp2baHA8udQdNw98j4
 omvgEtIKIf/BbuwPRWMw+QFTfw0WjBUzUHaNWYBog431op2lESVhj5IX7SUz4F67w5zb
 BYZA==
X-Gm-Message-State: AOAM533he+OI5sdvrhR4DNOx+COT4nL6uKL2z65YGRX+gPy0yhny1W2x
 SSEXxyOYUS5f0GTyY2xhvQllMCr57YkeCzDBARSkSkmgzAufR/n+qmZ4eKkn18pUknoOKfCLXrj
 q/ytvFou683Xt8VaorHekgMfh2/O4sug=
X-Received: by 2002:a65:638e:: with SMTP id h14mr24392953pgv.108.1623181906807; 
 Tue, 08 Jun 2021 12:51:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIpwOhS58KCUXJ6YR1EVgztb4GD4PNuRkyruP6Jg8XWVUBmpDEjLzmUZoMmMcCZb3XF/CTs3J39XzjI5j29Vo=
X-Received: by 2002:a65:638e:: with SMTP id h14mr24392924pgv.108.1623181906512; 
 Tue, 08 Jun 2021 12:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210608170607.21902-1-peter.maydell@linaro.org>
In-Reply-To: <20210608170607.21902-1-peter.maydell@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 8 Jun 2021 23:51:35 +0400
Message-ID: <CAMxuvay_bMs_hRzMjc-bVfFJaqk_Zui8anU-dNam4tUztxcvWQ@mail.gmail.com>
Subject: Re: [PATCH] tests/unit/test-char.c: Fix error handling issues
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f19fde05c4467c18"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f19fde05c4467c18
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, Jun 8, 2021 at 9:06 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Coverity spots some minor error-handling issues in this test code.
> These are mostly due to the test code assuming that the glib test
> macros g_assert_cmpint() and friends will always abort on failure.
> This is not the case: if the test case chooses to call
> g_test_set_nonfatal_assertions() then they will mark the test case as
> a failure and continue.  (This is different to g_assert(),
> g_assert_not_reached(), and assert(), which really do all always kill
> the process.) The idea is that you use g_assert() for things
> which are really assertions, as you would in normal QEMU code,
> and g_assert_cmpint() and friends for "this check is the thing
> this test case is testing" checks.
>
> In fact this test case does not currently set assertions to be
> nonfatal, but we should ideally be aiming to get to a point where we
> can set that more generally, because the test harness gives much
> better error reporting (including minor details like "what was the
> name of the test case that actually failed") than a raw assert/abort
> does.  So we mostly fix the Coverity nits by making the error-exit
> path return early if necessary, rather than by converting the
> g_assert_cmpint()s to g_assert()s.
>
> Fixes: Coverity CID 1432505, 1432514, 1432600, 1451384
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> We had some previous not-very-conclusive discussion about
> g_assert_foo vs g_assert in this thread:
>
> https://lore.kernel.org/qemu-devel/CAFEAcA9juOChqrh5orybJQwpQsyEZ5z3Dvmy7fjX0DW4Nbgmrg@mail.gmail.com/
> This patch is in some sense me asserting my opinion about the
> right thing to do. You might disagree...
>
> I think that improving the quality of the failure reporting
> in 'make check' is useful, and that we should probably turn
> on g_test_set_nonfatal_assertions() everywhere. (The worst that
> can happen is that instead of crashing on the assert we proceed
> and crash a bit later, I think.) Awkwardly we don't have a single
> place where we could put that call, so I guess it's a coccinelle
> script to add it to every test's main() function.
>
>
I don't have any strong opinion on this. But I don't see much sense in
having extra code for things that should never happen. I would teach
coverity instead that those asserts are always fatal. aborting right where
the assert is reached is easier for the developer, as you get a direct
backtrace. Given that tests are usually grouped in domains, it doesn't help
much to keep running the rest of the tests in that group anyway.

Fwiw, none of the tests in glib or gtk seem to use
g_test_set_nonfatal_assertions(), probably for similar considerations.

 tests/unit/test-char.c | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c
> index 5b3b48ebacd..43630ab57f8 100644
> --- a/tests/unit/test-char.c
> +++ b/tests/unit/test-char.c
> @@ -214,6 +214,10 @@ static void char_mux_test(void)
>      qemu_chr_fe_take_focus(&chr_be2);
>
>      base = qemu_chr_find("mux-label-base");
> +    g_assert_nonnull(base);
> +    if (base == 0) {
> +        goto fail;
> +    }
>      g_assert_cmpint(qemu_chr_be_can_write(base), !=, 0);
>
>      qemu_chr_be_write(base, (void *)"hello", 6);
> @@ -333,6 +337,7 @@ static void char_mux_test(void)
>      g_assert_cmpint(strlen(data), !=, 0);
>      g_free(data);
>
> +fail:
>      qemu_chr_fe_deinit(&chr_be1, false);
>      qemu_chr_fe_deinit(&chr_be2, true);
>  }
> @@ -486,6 +491,9 @@ static void char_pipe_test(void)
>      chr = qemu_chr_new("pipe", tmp, NULL);
>      g_assert_nonnull(chr);
>      g_free(tmp);
> +    if (!chr) {
> +        goto fail;
> +    }
>
>      qemu_chr_fe_init(&be, chr, &error_abort);
>
> @@ -493,12 +501,20 @@ static void char_pipe_test(void)
>      g_assert_cmpint(ret, ==, 9);
>
>      fd = open(out, O_RDWR);
> +    g_assert_cmpint(fd, >=, 0);
> +    if (fd < 0) {
> +        goto fail;
> +    }
>      ret = read(fd, buf, sizeof(buf));
>      g_assert_cmpint(ret, ==, 9);
>      g_assert_cmpstr(buf, ==, "pipe-out");
>      close(fd);
>
>      fd = open(in, O_WRONLY);
> +    g_assert_cmpint(fd, >=, 0);
> +    if (fd < 0) {
> +        goto fail;
> +    }
>      ret = write(fd, "pipe-in", 8);
>      g_assert_cmpint(ret, ==, 8);
>      close(fd);
> @@ -518,6 +534,7 @@ static void char_pipe_test(void)
>
>      qemu_chr_fe_deinit(&be, true);
>
> +fail:
>      g_assert(g_unlink(in) == 0);
>      g_assert(g_unlink(out) == 0);
>      g_assert(g_rmdir(tmp_path) == 0);
> @@ -556,7 +573,10 @@ static int make_udp_socket(int *port)
>      socklen_t alen = sizeof(addr);
>      int ret, sock = qemu_socket(PF_INET, SOCK_DGRAM, 0);
>
> -    g_assert_cmpint(sock, >, 0);
> +    g_assert_cmpint(sock, >=, 0);
> +    if (sock < 0) {
> +        return sock;
> +    }
>      addr.sin_family = AF_INET ;
>      addr.sin_addr.s_addr = htonl(INADDR_ANY);
>      addr.sin_port = 0;
> @@ -586,6 +606,9 @@ static void char_udp_test_internal(Chardev *reuse_chr,
> int sock)
>      } else {
>          int port;
>          sock = make_udp_socket(&port);
> +        if (sock < 0) {
> +            return;
> +        }
>          tmp = g_strdup_printf("udp:127.0.0.1:%d", port);
>          chr = qemu_chr_new("client", tmp, NULL);
>          g_assert_nonnull(chr);
> @@ -1224,6 +1247,10 @@ static void char_file_fifo_test(void)
>      }
>
>      fd = open(fifo, O_RDWR);
> +    g_assert_cmpint(fd, >=, 0);
> +    if (fd < 0) {
> +        goto fail;
> +    }
>      ret = write(fd, "fifo-in", 8);
>      g_assert_cmpint(ret, ==, 8);
>
> @@ -1253,6 +1280,7 @@ static void char_file_fifo_test(void)
>
>      qemu_chr_fe_deinit(&be, true);
>
> +fail:
>      g_unlink(fifo);
>      g_free(fifo);
>      g_unlink(out);
> @@ -1371,7 +1399,7 @@ static int chardev_change_denied(void *opaque)
>
>  static void char_hotswap_test(void)
>  {
> -    char *chr_args;
> +    char *chr_args = NULL;
>      Chardev *chr;
>      CharBackend be;
>
> @@ -1385,6 +1413,9 @@ static void char_hotswap_test(void)
>      int port;
>      int sock = make_udp_socket(&port);
>      g_assert_cmpint(sock, >, 0);
> +    if (sock < 0) {
> +        goto fail;
> +    }
>
>      chr_args = g_strdup_printf("udp:127.0.0.1:%d", port);
>
> @@ -1422,6 +1453,7 @@ static void char_hotswap_test(void)
>      object_unparent(OBJECT(chr));
>
>      qapi_free_ChardevReturn(ret);
> +fail:
>      g_unlink(filename);
>      g_free(filename);
>      g_rmdir(tmp_path);
> --
> 2.20.1
>
>

--000000000000f19fde05c4467c18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 8, 2021 at 9:06 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Coverity spots some minor error-handling issues in this test code.<b=
r>
These are mostly due to the test code assuming that the glib test<br>
macros g_assert_cmpint() and friends will always abort on failure.<br>
This is not the case: if the test case chooses to call<br>
g_test_set_nonfatal_assertions() then they will mark the test case as<br>
a failure and continue.=C2=A0 (This is different to g_assert(),<br>
g_assert_not_reached(), and assert(), which really do all always kill<br>
the process.) The idea is that you use g_assert() for things<br>
which are really assertions, as you would in normal QEMU code,<br>
and g_assert_cmpint() and friends for &quot;this check is the thing<br>
this test case is testing&quot; checks.<br>
<br>
In fact this test case does not currently set assertions to be<br>
nonfatal, but we should ideally be aiming to get to a point where we<br>
can set that more generally, because the test harness gives much<br>
better error reporting (including minor details like &quot;what was the<br>
name of the test case that actually failed&quot;) than a raw assert/abort<b=
r>
does.=C2=A0 So we mostly fix the Coverity nits by making the error-exit<br>
path return early if necessary, rather than by converting the<br>
g_assert_cmpint()s to g_assert()s.<br>
<br>
Fixes: Coverity CID 1432505, 1432514, 1432600, 1451384<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
---<br>
We had some previous not-very-conclusive discussion about<br>
g_assert_foo vs g_assert in this thread:<br>
<a href=3D"https://lore.kernel.org/qemu-devel/CAFEAcA9juOChqrh5orybJQwpQsyE=
Z5z3Dvmy7fjX0DW4Nbgmrg@mail.gmail.com/" rel=3D"noreferrer" target=3D"_blank=
">https://lore.kernel.org/qemu-devel/CAFEAcA9juOChqrh5orybJQwpQsyEZ5z3Dvmy7=
fjX0DW4Nbgmrg@mail.gmail.com/</a><br>
This patch is in some sense me asserting my opinion about the<br>
right thing to do. You might disagree...<br>
<br>
I think that improving the quality of the failure reporting<br>
in &#39;make check&#39; is useful, and that we should probably turn<br>
on g_test_set_nonfatal_assertions() everywhere. (The worst that<br>
can happen is that instead of crashing on the assert we proceed<br>
and crash a bit later, I think.) Awkwardly we don&#39;t have a single<br>
place where we could put that call, so I guess it&#39;s a coccinelle<br>
script to add it to every test&#39;s main() function.<br>
<br></blockquote><div><br></div><div>I don&#39;t have any strong opinion on=
 this. But I don&#39;t see much sense in having extra code for things that =
should never happen. I would teach coverity instead that those asserts are =
always fatal. aborting right where the assert is reached is easier for the =
developer, as you get a direct backtrace. Given that tests are usually grou=
ped in domains, it doesn&#39;t help much to keep running the rest of the te=
sts in that group anyway.<br></div><div><br></div><div>Fwiw, none of the te=
sts in glib or gtk seem to use g_test_set_nonfatal_assertions(), probably f=
or similar considerations.</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
=C2=A0tests/unit/test-char.c | 36 ++++++++++++++++++++++++++++++++++--<br>
=C2=A01 file changed, 34 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c<br>
index 5b3b48ebacd..43630ab57f8 100644<br>
--- a/tests/unit/test-char.c<br>
+++ b/tests/unit/test-char.c<br>
@@ -214,6 +214,10 @@ static void char_mux_test(void)<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_fe_take_focus(&amp;chr_be2);<br>
<br>
=C2=A0 =C2=A0 =C2=A0base =3D qemu_chr_find(&quot;mux-label-base&quot;);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(base);<br>
+=C2=A0 =C2=A0 if (base =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(qemu_chr_be_can_write(base), !=3D, 0);<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_be_write(base, (void *)&quot;hello&quot;, 6);<=
br>
@@ -333,6 +337,7 @@ static void char_mux_test(void)<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(strlen(data), !=3D, 0);<br>
=C2=A0 =C2=A0 =C2=A0g_free(data);<br>
<br>
+fail:<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_fe_deinit(&amp;chr_be1, false);<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_fe_deinit(&amp;chr_be2, true);<br>
=C2=A0}<br>
@@ -486,6 +491,9 @@ static void char_pipe_test(void)<br>
=C2=A0 =C2=A0 =C2=A0chr =3D qemu_chr_new(&quot;pipe&quot;, tmp, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_nonnull(chr);<br>
=C2=A0 =C2=A0 =C2=A0g_free(tmp);<br>
+=C2=A0 =C2=A0 if (!chr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_fe_init(&amp;be, chr, &amp;error_abort);<br>
<br>
@@ -493,12 +501,20 @@ static void char_pipe_test(void)<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(ret, =3D=3D, 9);<br>
<br>
=C2=A0 =C2=A0 =C2=A0fd =3D open(out, O_RDWR);<br>
+=C2=A0 =C2=A0 g_assert_cmpint(fd, &gt;=3D, 0);<br>
+=C2=A0 =C2=A0 if (fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0ret =3D read(fd, buf, sizeof(buf));<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(ret, =3D=3D, 9);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpstr(buf, =3D=3D, &quot;pipe-out&quot;);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0fd =3D open(in, O_WRONLY);<br>
+=C2=A0 =C2=A0 g_assert_cmpint(fd, &gt;=3D, 0);<br>
+=C2=A0 =C2=A0 if (fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0ret =3D write(fd, &quot;pipe-in&quot;, 8);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(ret, =3D=3D, 8);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
@@ -518,6 +534,7 @@ static void char_pipe_test(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_fe_deinit(&amp;be, true);<br>
<br>
+fail:<br>
=C2=A0 =C2=A0 =C2=A0g_assert(g_unlink(in) =3D=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(g_unlink(out) =3D=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(g_rmdir(tmp_path) =3D=3D 0);<br>
@@ -556,7 +573,10 @@ static int make_udp_socket(int *port)<br>
=C2=A0 =C2=A0 =C2=A0socklen_t alen =3D sizeof(addr);<br>
=C2=A0 =C2=A0 =C2=A0int ret, sock =3D qemu_socket(PF_INET, SOCK_DGRAM, 0);<=
br>
<br>
-=C2=A0 =C2=A0 g_assert_cmpint(sock, &gt;, 0);<br>
+=C2=A0 =C2=A0 g_assert_cmpint(sock, &gt;=3D, 0);<br>
+=C2=A0 =C2=A0 if (sock &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sock;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0addr.sin_family =3D AF_INET ;<br>
=C2=A0 =C2=A0 =C2=A0addr.sin_addr.s_addr =3D htonl(INADDR_ANY);<br>
=C2=A0 =C2=A0 =C2=A0addr.sin_port =3D 0;<br>
@@ -586,6 +606,9 @@ static void char_udp_test_internal(Chardev *reuse_chr, =
int sock)<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int port;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sock =3D make_udp_socket(&amp;port);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sock &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D g_strdup_printf(&quot;udp:127.0.0=
.1:%d&quot;, port);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chr =3D qemu_chr_new(&quot;client&quot;, =
tmp, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_nonnull(chr);<br>
@@ -1224,6 +1247,10 @@ static void char_file_fifo_test(void)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0fd =3D open(fifo, O_RDWR);<br>
+=C2=A0 =C2=A0 g_assert_cmpint(fd, &gt;=3D, 0);<br>
+=C2=A0 =C2=A0 if (fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0ret =3D write(fd, &quot;fifo-in&quot;, 8);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(ret, =3D=3D, 8);<br>
<br>
@@ -1253,6 +1280,7 @@ static void char_file_fifo_test(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_fe_deinit(&amp;be, true);<br>
<br>
+fail:<br>
=C2=A0 =C2=A0 =C2=A0g_unlink(fifo);<br>
=C2=A0 =C2=A0 =C2=A0g_free(fifo);<br>
=C2=A0 =C2=A0 =C2=A0g_unlink(out);<br>
@@ -1371,7 +1399,7 @@ static int chardev_change_denied(void *opaque)<br>
<br>
=C2=A0static void char_hotswap_test(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 char *chr_args;<br>
+=C2=A0 =C2=A0 char *chr_args =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0Chardev *chr;<br>
=C2=A0 =C2=A0 =C2=A0CharBackend be;<br>
<br>
@@ -1385,6 +1413,9 @@ static void char_hotswap_test(void)<br>
=C2=A0 =C2=A0 =C2=A0int port;<br>
=C2=A0 =C2=A0 =C2=A0int sock =3D make_udp_socket(&amp;port);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(sock, &gt;, 0);<br>
+=C2=A0 =C2=A0 if (sock &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0chr_args =3D g_strdup_printf(&quot;udp:127.0.0.1:%d&quo=
t;, port);<br>
<br>
@@ -1422,6 +1453,7 @@ static void char_hotswap_test(void)<br>
=C2=A0 =C2=A0 =C2=A0object_unparent(OBJECT(chr));<br>
<br>
=C2=A0 =C2=A0 =C2=A0qapi_free_ChardevReturn(ret);<br>
+fail:<br>
=C2=A0 =C2=A0 =C2=A0g_unlink(filename);<br>
=C2=A0 =C2=A0 =C2=A0g_free(filename);<br>
=C2=A0 =C2=A0 =C2=A0g_rmdir(tmp_path);<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div></div>

--000000000000f19fde05c4467c18--


