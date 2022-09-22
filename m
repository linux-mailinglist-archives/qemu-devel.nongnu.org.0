Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1355E5E6CF4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 22:22:34 +0200 (CEST)
Received: from localhost ([::1]:42116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obSiM-0001Nr-Dx
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 16:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obScy-0006cF-SY
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 16:17:05 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:42853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obScw-0000IB-Dl
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 16:16:56 -0400
Received: by mail-lf1-x12e.google.com with SMTP id a3so16494070lfk.9
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ADagR2ZhJHjxPXnuNURUbggbK6GNtcFDoCWLW11cbQg=;
 b=d+2HCFPj8LC0h6P8KejwQs3sNo6eAv0s9fAl29SUPJ5a7s5/2Nr8yGtCn6oxHvx3Mq
 U7F3eht1OZTIcWzUQU0T5G4vXVaWZ+1fzclV1Ig1DdYhfx89TmR+26t11Qq+ZnfczEun
 JY6oulkfaRDKxb0JPcDNNVnqOLImOgRYusr188WkZkiJBLxsEzVjjNDdelJl4qSnKboa
 At0ccrs2e9ggXsGNlpyjl212P6N08hxONF4JbduP0moCSiS7FQ9VzPALnpvPADhjy47u
 Z4Jce47pAJbS+CvVI8uuO5JeoMJpa90u8iwKUT67cZLzUqr1kjUKkNpoBlsQJcqNGkAW
 KOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ADagR2ZhJHjxPXnuNURUbggbK6GNtcFDoCWLW11cbQg=;
 b=zbdFWG2ALGuER/RSoiKIgy5IgbGebiWD82ikws8noR25eNAEdhpmytzRGnC8LHJQo1
 WrRW350ABdS+jahSiYp42zeQY0ru77lUUXpbKynBescGJqmtUjpTtAjTWMsm8dyz39CE
 NsEjD/efgiVogaP/qT5RTLiGixqOHcwRa07gUj1kIKnWxsG7gNaQx+6t4Nkdx7EV3wOS
 JfiRkEWWUkkSQfaM0Zkmk6nu5NL/ltL8FpLgYb4KQ51s2vMhYW4Ah65UwdTpIhZTf+7r
 3JoLP4XBkBGM/5pH5bHT321LHDk7a0G2GsjZNoarCPbMFtHqOeKhp7gtkwPuQGFM1f8Q
 bNlA==
X-Gm-Message-State: ACrzQf3P+J2r/MP8vJTJs1NAsQMCHRbSi6bajPF1Xc1awd1MQmoT1LPF
 LoBBliuT3uFTCetFLP6wjqt8rvavAqoR0d/uCZlBdv5e6oi44A==
X-Google-Smtp-Source: AMsMyM65oyeusi1YpkXfbEuG9WPSh+7/sO9NympgmDUUnwc3BhGGFS0H4mTjlugtZUB9Sju3if2Bm415PNF9ah20pOc=
X-Received: by 2002:a05:6512:280d:b0:498:fd40:51d4 with SMTP id
 cf13-20020a056512280d00b00498fd4051d4mr2143074lfb.167.1663877812348; Thu, 22
 Sep 2022 13:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-36-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-36-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Sep 2022 22:16:40 +0200
Message-ID: <CAJ+F1C+tpDG5_DEEGmLCyW-34Zp-xq4ewPq35Qfe+_gcKvULXA@mail.gmail.com>
Subject: Re: [PATCH v2 35/39] tests/qtest: migration-test: Skip running some
 TLS cases for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f46a7a05e949bd5b"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000f46a7a05e949bd5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 20, 2022 at 3:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Some migration test cases use TLS to communicate, but they fail on
> Windows with the following error messages:
>
>   qemu-system-x86_64: TLS handshake failed: Insufficient credentials for
> that request.
>   qemu-system-x86_64: TLS handshake failed: Error in the pull function.
>   query-migrate shows failed migration: TLS handshake failed: Error in th=
e
> pull function.
>
> Disable them temporarily.
>
>
You might find a better solution for this issue with Daniel help,
nevertheless when disabling a test that can compile on the platform, please
prefer g_test_skip() usage instead. That way, we make sure the code still
compiles and we get some log in the tests :) thanks


> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> I am not familar with the gnutls and simply enabling the gnutls debug
> output does not give me an immedidate hint on why it's failing on
> Windows. Disable these cases for now until someone or maintainers
> who may want to test this on Windows.
>
> (no changes since v1)
>
>  tests/qtest/migration-test.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index aedd9ddb72..dbee9b528a 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1403,6 +1403,7 @@ static void test_precopy_unix_dirty_ring(void)
>  }
>
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>  static void test_precopy_unix_tls_psk(void)
>  {
>      g_autofree char *uri =3D g_strdup_printf("unix:%s/migsocket", tmpfs)=
;
> @@ -1415,6 +1416,7 @@ static void test_precopy_unix_tls_psk(void)
>
>      test_precopy_common(&args);
>  }
> +#endif /* _WIN32 */
>
>  #ifdef CONFIG_TASN1
>  static void test_precopy_unix_tls_x509_default_host(void)
> @@ -1523,6 +1525,7 @@ static void test_precopy_tcp_plain(void)
>  }
>
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>  static void test_precopy_tcp_tls_psk_match(void)
>  {
>      MigrateCommon args =3D {
> @@ -1533,6 +1536,7 @@ static void test_precopy_tcp_tls_psk_match(void)
>
>      test_precopy_common(&args);
>  }
> +#endif /* _WIN32 */
>
>  static void test_precopy_tcp_tls_psk_mismatch(void)
>  {
> @@ -1930,6 +1934,7 @@ static void test_multifd_tcp_zstd(void)
>  #endif
>
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>  static void *
>  test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
>                                               QTestState *to)
> @@ -1937,6 +1942,7 @@
> test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
>      test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
>      return test_migrate_tls_psk_start_match(from, to);
>  }
> +#endif /* _WIN32 */
>
>  static void *
>  test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
> @@ -1988,6 +1994,7 @@
> test_migrate_multifd_tls_x509_start_reject_anon_client(QTestState *from,
>  }
>  #endif /* CONFIG_TASN1 */
>
> +#ifndef _WIN32
>  static void test_multifd_tcp_tls_psk_match(void)
>  {
>      MigrateCommon args =3D {
> @@ -1997,6 +2004,7 @@ static void test_multifd_tcp_tls_psk_match(void)
>      };
>      test_precopy_common(&args);
>  }
> +#endif /* _WIN32 */
>
>  static void test_multifd_tcp_tls_psk_mismatch(void)
>  {
> @@ -2497,8 +2505,10 @@ int main(int argc, char **argv)
>      qtest_add_func("/migration/precopy/unix/plain",
> test_precopy_unix_plain);
>      qtest_add_func("/migration/precopy/unix/xbzrle",
> test_precopy_unix_xbzrle);
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>      qtest_add_func("/migration/precopy/unix/tls/psk",
>                     test_precopy_unix_tls_psk);
> +#endif
>
>      if (has_uffd) {
>          /*
> @@ -2524,8 +2534,10 @@ int main(int argc, char **argv)
>
>      qtest_add_func("/migration/precopy/tcp/plain",
> test_precopy_tcp_plain);
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>      qtest_add_func("/migration/precopy/tcp/tls/psk/match",
>                     test_precopy_tcp_tls_psk_match);
> +#endif
>      qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
>                     test_precopy_tcp_tls_psk_mismatch);
>  #ifdef CONFIG_TASN1
> @@ -2569,8 +2581,10 @@ int main(int argc, char **argv)
>                     test_multifd_tcp_zstd);
>  #endif
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>      qtest_add_func("/migration/multifd/tcp/tls/psk/match",
>                     test_multifd_tcp_tls_psk_match);
> +#endif
>      qtest_add_func("/migration/multifd/tcp/tls/psk/mismatch",
>                     test_multifd_tcp_tls_psk_mismatch);
>  #ifdef CONFIG_TASN1
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f46a7a05e949bd5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 3:11 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
Some migration test cases use TLS to communicate, but they fail on<br>
Windows with the following error messages:<br>
<br>
=C2=A0 qemu-system-x86_64: TLS handshake failed: Insufficient credentials f=
or that request.<br>
=C2=A0 qemu-system-x86_64: TLS handshake failed: Error in the pull function=
.<br>
=C2=A0 query-migrate shows failed migration: TLS handshake failed: Error in=
 the pull function.<br>
<br>
Disable them temporarily.<br>
<br></blockquote><div><br></div><div>You might find a better solution for t=
his issue with Daniel help, nevertheless when disabling a test that can com=
pile on the platform, please prefer g_test_skip() usage instead. That way, =
we make sure the code still compiles and we get some log in the tests :) th=
anks<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
I am not familar with the gnutls and simply enabling the gnutls debug<br>
output does not give me an immedidate hint on why it&#39;s failing on<br>
Windows. Disable these cases for now until someone or maintainers<br>
who may want to test this on Windows.<br>
<br>
(no changes since v1)<br>
<br>
=C2=A0tests/qtest/migration-test.c | 14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
<br>
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c<br=
>
index aedd9ddb72..dbee9b528a 100644<br>
--- a/tests/qtest/migration-test.c<br>
+++ b/tests/qtest/migration-test.c<br>
@@ -1403,6 +1403,7 @@ static void test_precopy_unix_dirty_ring(void)<br>
=C2=A0}<br>
<br>
=C2=A0#ifdef CONFIG_GNUTLS<br>
+#ifndef _WIN32<br>
=C2=A0static void test_precopy_unix_tls_psk(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_autofree char *uri =3D g_strdup_printf(&quot;unix:%s/=
migsocket&quot;, tmpfs);<br>
@@ -1415,6 +1416,7 @@ static void test_precopy_unix_tls_psk(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0test_precopy_common(&amp;args);<br>
=C2=A0}<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0#ifdef CONFIG_TASN1<br>
=C2=A0static void test_precopy_unix_tls_x509_default_host(void)<br>
@@ -1523,6 +1525,7 @@ static void test_precopy_tcp_plain(void)<br>
=C2=A0}<br>
<br>
=C2=A0#ifdef CONFIG_GNUTLS<br>
+#ifndef _WIN32<br>
=C2=A0static void test_precopy_tcp_tls_psk_match(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0MigrateCommon args =3D {<br>
@@ -1533,6 +1536,7 @@ static void test_precopy_tcp_tls_psk_match(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0test_precopy_common(&amp;args);<br>
=C2=A0}<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0static void test_precopy_tcp_tls_psk_mismatch(void)<br>
=C2=A0{<br>
@@ -1930,6 +1934,7 @@ static void test_multifd_tcp_zstd(void)<br>
=C2=A0#endif<br>
<br>
=C2=A0#ifdef CONFIG_GNUTLS<br>
+#ifndef _WIN32<br>
=C2=A0static void *<br>
=C2=A0test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 QTestState *to)<br>
@@ -1937,6 +1942,7 @@ test_migrate_multifd_tcp_tls_psk_start_match(QTestSta=
te *from,<br>
=C2=A0 =C2=A0 =C2=A0test_migrate_precopy_tcp_multifd_start_common(from, to,=
 &quot;none&quot;);<br>
=C2=A0 =C2=A0 =C2=A0return test_migrate_tls_psk_start_match(from, to);<br>
=C2=A0}<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0static void *<br>
=C2=A0test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,<br>
@@ -1988,6 +1994,7 @@ test_migrate_multifd_tls_x509_start_reject_anon_clien=
t(QTestState *from,<br>
=C2=A0}<br>
=C2=A0#endif /* CONFIG_TASN1 */<br>
<br>
+#ifndef _WIN32<br>
=C2=A0static void test_multifd_tcp_tls_psk_match(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0MigrateCommon args =3D {<br>
@@ -1997,6 +2004,7 @@ static void test_multifd_tcp_tls_psk_match(void)<br>
=C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 =C2=A0test_precopy_common(&amp;args);<br>
=C2=A0}<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0static void test_multifd_tcp_tls_psk_mismatch(void)<br>
=C2=A0{<br>
@@ -2497,8 +2505,10 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/migration/precopy/unix/plain&quot=
;, test_precopy_unix_plain);<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/migration/precopy/unix/xbzrle&quo=
t;, test_precopy_unix_xbzrle);<br>
=C2=A0#ifdef CONFIG_GNUTLS<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/migration/precopy/unix/tls/psk&qu=
ot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_=
precopy_unix_tls_psk);<br>
+#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (has_uffd) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
@@ -2524,8 +2534,10 @@ int main(int argc, char **argv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/migration/precopy/tcp/plain&quot;=
, test_precopy_tcp_plain);<br>
=C2=A0#ifdef CONFIG_GNUTLS<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/migration/precopy/tcp/tls/psk/mat=
ch&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_=
precopy_tcp_tls_psk_match);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/migration/precopy/tcp/tls/psk/mis=
match&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_=
precopy_tcp_tls_psk_mismatch);<br>
=C2=A0#ifdef CONFIG_TASN1<br>
@@ -2569,8 +2581,10 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_=
multifd_tcp_zstd);<br>
=C2=A0#endif<br>
=C2=A0#ifdef CONFIG_GNUTLS<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/migration/multifd/tcp/tls/psk/mat=
ch&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_=
multifd_tcp_tls_psk_match);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/migration/multifd/tcp/tls/psk/mis=
match&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_=
multifd_tcp_tls_psk_mismatch);<br>
=C2=A0#ifdef CONFIG_TASN1<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f46a7a05e949bd5b--

