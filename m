Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C365E6BCF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:37:51 +0200 (CEST)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obS17-0002Yf-NS
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obRw0-00065Z-KU
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:32:32 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:41915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obRvw-0002bu-TU
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:32:31 -0400
Received: by mail-lj1-x235.google.com with SMTP id a14so12203011ljj.8
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 12:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=AEBmJvnizK5Fya/dLIgPHijL06hQIl+8YjWJVLI8w5M=;
 b=ZGk3MRfzdQAB91Cj6hxZoae5l9G/nhYBMHOw5/+1zIQv4/3xEaH95PW7UxqcYCRXy9
 th2eqbWnSkJiI5UvH7MjvIXU7WhYS8pnlX9R/Z14eqH+aTLregzS1mq5vzm83vlLcOkS
 uLaB5AWLar31lfq+fq7Ux3rZ93oOZD2RFkCNkWZwG9SfM229vG8oHndVbddDP9+6ZRcK
 MlKFMCAvxnndru50PGGb4D59cMUJGdIaKa+sIturvjr4g/NQRDqBRpohwXv1vNVBr6w/
 Oc+BgXta4PQrioWtcFw8E0fRZOvdmxgNRABKBUvtg+aOO4yeNh3yTznlsw4cCd+mnJ1b
 vb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=AEBmJvnizK5Fya/dLIgPHijL06hQIl+8YjWJVLI8w5M=;
 b=FhohPDQhaLR8zJ7ZIrD0ZbZI6J06B1y2YyIqLhPpn8ARfKoZ1KuqFL46Q0gzAh9mLI
 hGHA1v3rNQNxOQduWtwFlbnnYB4numBgkffbVA2wgPuKxFVbBU7HM4dq2peMoy/hJh1B
 e906UupFkhR05Uecd/oljf+3rumPO5y7OffAAc+72wqLFLwcajkKhQGYUF4M0OY1j2Md
 q+Ma6/Jf7y33Hy5j3k6o5ilT3/WcLvQ5i1hDwChXXaWQkEpcmTu0MRCpdB6n/DBpLyHg
 RGT88g8x6mJk6T3JbMPyCJgb3un/ETYhX2yDnIkA9HoImRqlwSxelyL/4cRAVQBKGc1u
 AzOg==
X-Gm-Message-State: ACrzQf1wJuzsDF3NO3fwQURb6ODpYxFzcvT8sCOtTSUSwOJBCyRRtwNC
 Fnbyue/UMSgp1EWqaDNeh4azv1HbdTLllQr/9SU=
X-Google-Smtp-Source: AMsMyM65cw0VEIodFBm98vVwxc/+kOlNl2XVFFVnbTgFRPWQ95lRqj/HHDEsC35QFqQJvRyoiOdAklxbWOk8Wwg0fgc=
X-Received: by 2002:a2e:8917:0:b0:26a:a520:db52 with SMTP id
 d23-20020a2e8917000000b0026aa520db52mr1589388lji.289.1663875146046; Thu, 22
 Sep 2022 12:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-2-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-2-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Sep 2022 21:32:14 +0200
Message-ID: <CAJ+F1CKiCiWBwr5CGAODZukJ8eYoJerhQ01AQYqWMLktsVDM2Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/39] tests: Change to use g_mkdir()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000007e1a905e9491f47"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
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

--00000000000007e1a905e9491f47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 20, 2022 at 1:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Commit 413bebc04603 ("tests: Use g_mkdir_with_parents()") replaces
> the mkdir() call in the test codes with glib's g_mkdir_with_parents(),
> but the exact portable replacement for mkdir() should be g_mkdir().
>
> I probably was misled by the GTK glib doc [1] before, thinking that
> g_mkdir() is not a supported API from glib. But the glib sources do
> not support this statement. It is probably that the GTK documentation
> was not built to include all APIs.
>
> [1] https://docs.gtk.org/glib/?q=3Dmkdir
>
> Fixes: 413bebc04603 ("tests: Use g_mkdir_with_parents()")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

I wouldn't bother anymore, I'd keep mkdir_with_parents for now. YMMV

---
>
> Changes in v2:
> - new patch: "tests: Change to use g_mkdir()"
>
>  tests/migration/stress.c              | 3 ++-
>  tests/qtest/migration-test.c          | 7 ++++---
>  tests/unit/test-crypto-tlscredsx509.c | 5 +++--
>  tests/unit/test-crypto-tlssession.c   | 7 ++++---
>  tests/unit/test-io-channel-tls.c      | 7 ++++---
>  5 files changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/tests/migration/stress.c b/tests/migration/stress.c
> index 88acf8dc25..76b91851ad 100644
> --- a/tests/migration/stress.c
> +++ b/tests/migration/stress.c
> @@ -19,6 +19,7 @@
>
>  #include "qemu/osdep.h"
>  #include <getopt.h>
> +#include <glib/gstdio.h>
>  #include <sys/reboot.h>
>  #include <sys/syscall.h>
>  #include <linux/random.h>
> @@ -232,7 +233,7 @@ static void stress(unsigned long long ramsizeGB, int
> ncpus)
>
>  static int mount_misc(const char *fstype, const char *dir)
>  {
> -    if (g_mkdir_with_parents(dir, 0755) < 0 && errno !=3D EEXIST) {
> +    if (g_mkdir(dir, 0755) < 0 && errno !=3D EEXIST) {
>          fprintf(stderr, "%s (%05d): ERROR: cannot create %s: %s\n",
>                  argv0, gettid(), dir, strerror(errno));
>          return -1;
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 4728d528bb..55892b3798 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -11,6 +11,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include <glib/gstdio.h>
>
>  #include "libqtest.h"
>  #include "qapi/error.h"
> @@ -761,14 +762,14 @@ test_migrate_tls_psk_start_common(QTestState *from,
>      data->workdir =3D g_strdup_printf("%s/tlscredspsk0", tmpfs);
>      data->pskfile =3D g_strdup_printf("%s/%s", data->workdir,
>                                      QCRYPTO_TLS_CREDS_PSKFILE);
> -    g_mkdir_with_parents(data->workdir, 0700);
> +    g_mkdir(data->workdir, 0700);
>      test_tls_psk_init(data->pskfile);
>
>      if (mismatch) {
>          data->workdiralt =3D g_strdup_printf("%s/tlscredspskalt0", tmpfs=
);
>          data->pskfilealt =3D g_strdup_printf("%s/%s", data->workdiralt,
>                                             QCRYPTO_TLS_CREDS_PSKFILE);
> -        g_mkdir_with_parents(data->workdiralt, 0700);
> +        g_mkdir(data->workdiralt, 0700);
>          test_tls_psk_init_alt(data->pskfilealt);
>      }
>
> @@ -873,7 +874,7 @@ test_migrate_tls_x509_start_common(QTestState *from,
>          data->clientcert =3D g_strdup_printf("%s/client-cert.pem",
> data->workdir);
>      }
>
> -    g_mkdir_with_parents(data->workdir, 0700);
> +    g_mkdir(data->workdir, 0700);
>
>      test_tls_init(data->keyfile);
>  #ifndef _WIN32
> diff --git a/tests/unit/test-crypto-tlscredsx509.c
> b/tests/unit/test-crypto-tlscredsx509.c
> index 3c25d75ca1..03fa48a3c5 100644
> --- a/tests/unit/test-crypto-tlscredsx509.c
> +++ b/tests/unit/test-crypto-tlscredsx509.c
> @@ -19,6 +19,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include <glib/gstdio.h>
>
>  #include "crypto-tls-x509-helpers.h"
>  #include "crypto/tlscredsx509.h"
> @@ -75,7 +76,7 @@ static void test_tls_creds(const void *opaque)
>      QCryptoTLSCreds *creds;
>
>  #define CERT_DIR "tests/test-crypto-tlscredsx509-certs/"
> -    g_mkdir_with_parents(CERT_DIR, 0700);
> +    g_mkdir(CERT_DIR, 0700);
>
>      unlink(CERT_DIR QCRYPTO_TLS_CREDS_X509_CA_CERT);
>      if (data->isServer) {
> @@ -141,7 +142,7 @@ int main(int argc, char **argv)
>      g_test_init(&argc, &argv, NULL);
>      g_setenv("GNUTLS_FORCE_FIPS_MODE", "2", 1);
>
> -    g_mkdir_with_parents(WORKDIR, 0700);
> +    g_mkdir(WORKDIR, 0700);
>
>      test_tls_init(KEYFILE);
>
> diff --git a/tests/unit/test-crypto-tlssession.c
> b/tests/unit/test-crypto-tlssession.c
> index 615a1344b4..356afbadfb 100644
> --- a/tests/unit/test-crypto-tlssession.c
> +++ b/tests/unit/test-crypto-tlssession.c
> @@ -19,6 +19,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include <glib/gstdio.h>
>
>  #include "crypto-tls-x509-helpers.h"
>  #include "crypto-tls-psk-helpers.h"
> @@ -249,8 +250,8 @@ static void test_crypto_tls_session_x509(const void
> *opaque)
>
>  #define CLIENT_CERT_DIR "tests/test-crypto-tlssession-client/"
>  #define SERVER_CERT_DIR "tests/test-crypto-tlssession-server/"
> -    g_mkdir_with_parents(CLIENT_CERT_DIR, 0700);
> -    g_mkdir_with_parents(SERVER_CERT_DIR, 0700);
> +    g_mkdir(CLIENT_CERT_DIR, 0700);
> +    g_mkdir(SERVER_CERT_DIR, 0700);
>
>      unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_CA_CERT);
>      unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_SERVER_CERT);
> @@ -398,7 +399,7 @@ int main(int argc, char **argv)
>      g_test_init(&argc, &argv, NULL);
>      g_setenv("GNUTLS_FORCE_FIPS_MODE", "2", 1);
>
> -    g_mkdir_with_parents(WORKDIR, 0700);
> +    g_mkdir(WORKDIR, 0700);
>
>      test_tls_init(KEYFILE);
>      test_tls_psk_init(PSKFILE);
> diff --git a/tests/unit/test-io-channel-tls.c
> b/tests/unit/test-io-channel-tls.c
> index cc39247556..1d95c9f61d 100644
> --- a/tests/unit/test-io-channel-tls.c
> +++ b/tests/unit/test-io-channel-tls.c
> @@ -22,6 +22,7 @@
>
>
>  #include "qemu/osdep.h"
> +#include <glib/gstdio.h>
>
>  #include "crypto-tls-x509-helpers.h"
>  #include "io/channel-tls.h"
> @@ -125,8 +126,8 @@ static void test_io_channel_tls(const void *opaque)
>
>  #define CLIENT_CERT_DIR "tests/test-io-channel-tls-client/"
>  #define SERVER_CERT_DIR "tests/test-io-channel-tls-server/"
> -    g_mkdir_with_parents(CLIENT_CERT_DIR, 0700);
> -    g_mkdir_with_parents(SERVER_CERT_DIR, 0700);
> +    g_mkdir(CLIENT_CERT_DIR, 0700);
> +    g_mkdir(SERVER_CERT_DIR, 0700);
>
>      unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_CA_CERT);
>      unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_SERVER_CERT);
> @@ -273,7 +274,7 @@ int main(int argc, char **argv)
>      g_test_init(&argc, &argv, NULL);
>      g_setenv("GNUTLS_FORCE_FIPS_MODE", "2", 1);
>
> -    g_mkdir_with_parents(WORKDIR, 0700);
> +    g_mkdir(WORKDIR, 0700);
>
>      test_tls_init(KEYFILE);
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000007e1a905e9491f47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 1:48 PM Bin Meng &lt;=
<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin Meng &lt;=
<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.meng@windri=
ver.com</a>&gt;<br>
<br>
Commit 413bebc04603 (&quot;tests: Use g_mkdir_with_parents()&quot;) replace=
s<br>
the mkdir() call in the test codes with glib&#39;s g_mkdir_with_parents(),<=
br>
but the exact portable replacement for mkdir() should be g_mkdir().<br>
<br>
I probably was misled by the GTK glib doc [1] before, thinking that<br>
g_mkdir() is not a supported API from glib. But the glib sources do<br>
not support this statement. It is probably that the GTK documentation<br>
was not built to include all APIs.<br>
<br>
[1] <a href=3D"https://docs.gtk.org/glib/?q=3Dmkdir" rel=3D"noreferrer" tar=
get=3D"_blank">https://docs.gtk.org/glib/?q=3Dmkdir</a><br>
<br>
Fixes: 413bebc04603 (&quot;tests: Use g_mkdir_with_parents()&quot;)<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>I wouldn&#39;t bother anymore, I&#39;d keep mkdir_with_parents for now=
. YMMV<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
---<br>
<br>
Changes in v2:<br>
- new patch: &quot;tests: Change to use g_mkdir()&quot;<br>
<br>
=C2=A0tests/migration/stress.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 3 ++-<br>
=C2=A0tests/qtest/migration-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 ++=
++---<br>
=C2=A0tests/unit/test-crypto-tlscredsx509.c | 5 +++--<br>
=C2=A0tests/unit/test-crypto-tlssession.c=C2=A0 =C2=A0| 7 ++++---<br>
=C2=A0tests/unit/test-io-channel-tls.c=C2=A0 =C2=A0 =C2=A0 | 7 ++++---<br>
=C2=A05 files changed, 17 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/tests/migration/stress.c b/tests/migration/stress.c<br>
index 88acf8dc25..76b91851ad 100644<br>
--- a/tests/migration/stress.c<br>
+++ b/tests/migration/stress.c<br>
@@ -19,6 +19,7 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &lt;getopt.h&gt;<br>
+#include &lt;glib/gstdio.h&gt;<br>
=C2=A0#include &lt;sys/reboot.h&gt;<br>
=C2=A0#include &lt;sys/syscall.h&gt;<br>
=C2=A0#include &lt;linux/random.h&gt;<br>
@@ -232,7 +233,7 @@ static void stress(unsigned long long ramsizeGB, int nc=
pus)<br>
<br>
=C2=A0static int mount_misc(const char *fstype, const char *dir)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (g_mkdir_with_parents(dir, 0755) &lt; 0 &amp;&amp; errno =
!=3D EEXIST) {<br>
+=C2=A0 =C2=A0 if (g_mkdir(dir, 0755) &lt; 0 &amp;&amp; errno !=3D EEXIST) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;%s (%05d): ERROR: c=
annot create %s: %s\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv0, gettid=
(), dir, strerror(errno));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c<br=
>
index 4728d528bb..55892b3798 100644<br>
--- a/tests/qtest/migration-test.c<br>
+++ b/tests/qtest/migration-test.c<br>
@@ -11,6 +11,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &lt;glib/gstdio.h&gt;<br>
<br>
=C2=A0#include &quot;libqtest.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
@@ -761,14 +762,14 @@ test_migrate_tls_psk_start_common(QTestState *from,<b=
r>
=C2=A0 =C2=A0 =C2=A0data-&gt;workdir =3D g_strdup_printf(&quot;%s/tlscredsp=
sk0&quot;, tmpfs);<br>
=C2=A0 =C2=A0 =C2=A0data-&gt;pskfile =3D g_strdup_printf(&quot;%s/%s&quot;,=
 data-&gt;workdir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QCRYPTO_TLS_CRED=
S_PSKFILE);<br>
-=C2=A0 =C2=A0 g_mkdir_with_parents(data-&gt;workdir, 0700);<br>
+=C2=A0 =C2=A0 g_mkdir(data-&gt;workdir, 0700);<br>
=C2=A0 =C2=A0 =C2=A0test_tls_psk_init(data-&gt;pskfile);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (mismatch) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;workdiralt =3D g_strdup_printf(&=
quot;%s/tlscredspskalt0&quot;, tmpfs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;pskfilealt =3D g_strdup_printf(&=
quot;%s/%s&quot;, data-&gt;workdiralt,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 QCRYPTO_TLS_CREDS_PSKFILE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mkdir_with_parents(data-&gt;workdiralt, 0700=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mkdir(data-&gt;workdiralt, 0700);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_tls_psk_init_alt(data-&gt;pskfilealt=
);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -873,7 +874,7 @@ test_migrate_tls_x509_start_common(QTestState *from,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;clientcert =3D g_strdup_printf(&=
quot;%s/client-cert.pem&quot;, data-&gt;workdir);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 g_mkdir_with_parents(data-&gt;workdir, 0700);<br>
+=C2=A0 =C2=A0 g_mkdir(data-&gt;workdir, 0700);<br>
<br>
=C2=A0 =C2=A0 =C2=A0test_tls_init(data-&gt;keyfile);<br>
=C2=A0#ifndef _WIN32<br>
diff --git a/tests/unit/test-crypto-tlscredsx509.c b/tests/unit/test-crypto=
-tlscredsx509.c<br>
index 3c25d75ca1..03fa48a3c5 100644<br>
--- a/tests/unit/test-crypto-tlscredsx509.c<br>
+++ b/tests/unit/test-crypto-tlscredsx509.c<br>
@@ -19,6 +19,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &lt;glib/gstdio.h&gt;<br>
<br>
=C2=A0#include &quot;crypto-tls-x509-helpers.h&quot;<br>
=C2=A0#include &quot;crypto/tlscredsx509.h&quot;<br>
@@ -75,7 +76,7 @@ static void test_tls_creds(const void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0QCryptoTLSCreds *creds;<br>
<br>
=C2=A0#define CERT_DIR &quot;tests/test-crypto-tlscredsx509-certs/&quot;<br=
>
-=C2=A0 =C2=A0 g_mkdir_with_parents(CERT_DIR, 0700);<br>
+=C2=A0 =C2=A0 g_mkdir(CERT_DIR, 0700);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlink(CERT_DIR QCRYPTO_TLS_CREDS_X509_CA_CERT);<br>
=C2=A0 =C2=A0 =C2=A0if (data-&gt;isServer) {<br>
@@ -141,7 +142,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0g_test_init(&amp;argc, &amp;argv, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_setenv(&quot;GNUTLS_FORCE_FIPS_MODE&quot;, &quot;2&qu=
ot;, 1);<br>
<br>
-=C2=A0 =C2=A0 g_mkdir_with_parents(WORKDIR, 0700);<br>
+=C2=A0 =C2=A0 g_mkdir(WORKDIR, 0700);<br>
<br>
=C2=A0 =C2=A0 =C2=A0test_tls_init(KEYFILE);<br>
<br>
diff --git a/tests/unit/test-crypto-tlssession.c b/tests/unit/test-crypto-t=
lssession.c<br>
index 615a1344b4..356afbadfb 100644<br>
--- a/tests/unit/test-crypto-tlssession.c<br>
+++ b/tests/unit/test-crypto-tlssession.c<br>
@@ -19,6 +19,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &lt;glib/gstdio.h&gt;<br>
<br>
=C2=A0#include &quot;crypto-tls-x509-helpers.h&quot;<br>
=C2=A0#include &quot;crypto-tls-psk-helpers.h&quot;<br>
@@ -249,8 +250,8 @@ static void test_crypto_tls_session_x509(const void *op=
aque)<br>
<br>
=C2=A0#define CLIENT_CERT_DIR &quot;tests/test-crypto-tlssession-client/&qu=
ot;<br>
=C2=A0#define SERVER_CERT_DIR &quot;tests/test-crypto-tlssession-server/&qu=
ot;<br>
-=C2=A0 =C2=A0 g_mkdir_with_parents(CLIENT_CERT_DIR, 0700);<br>
-=C2=A0 =C2=A0 g_mkdir_with_parents(SERVER_CERT_DIR, 0700);<br>
+=C2=A0 =C2=A0 g_mkdir(CLIENT_CERT_DIR, 0700);<br>
+=C2=A0 =C2=A0 g_mkdir(SERVER_CERT_DIR, 0700);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_CA_CERT);=
<br>
=C2=A0 =C2=A0 =C2=A0unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_SERVER_CE=
RT);<br>
@@ -398,7 +399,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0g_test_init(&amp;argc, &amp;argv, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_setenv(&quot;GNUTLS_FORCE_FIPS_MODE&quot;, &quot;2&qu=
ot;, 1);<br>
<br>
-=C2=A0 =C2=A0 g_mkdir_with_parents(WORKDIR, 0700);<br>
+=C2=A0 =C2=A0 g_mkdir(WORKDIR, 0700);<br>
<br>
=C2=A0 =C2=A0 =C2=A0test_tls_init(KEYFILE);<br>
=C2=A0 =C2=A0 =C2=A0test_tls_psk_init(PSKFILE);<br>
diff --git a/tests/unit/test-io-channel-tls.c b/tests/unit/test-io-channel-=
tls.c<br>
index cc39247556..1d95c9f61d 100644<br>
--- a/tests/unit/test-io-channel-tls.c<br>
+++ b/tests/unit/test-io-channel-tls.c<br>
@@ -22,6 +22,7 @@<br>
<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &lt;glib/gstdio.h&gt;<br>
<br>
=C2=A0#include &quot;crypto-tls-x509-helpers.h&quot;<br>
=C2=A0#include &quot;io/channel-tls.h&quot;<br>
@@ -125,8 +126,8 @@ static void test_io_channel_tls(const void *opaque)<br>
<br>
=C2=A0#define CLIENT_CERT_DIR &quot;tests/test-io-channel-tls-client/&quot;=
<br>
=C2=A0#define SERVER_CERT_DIR &quot;tests/test-io-channel-tls-server/&quot;=
<br>
-=C2=A0 =C2=A0 g_mkdir_with_parents(CLIENT_CERT_DIR, 0700);<br>
-=C2=A0 =C2=A0 g_mkdir_with_parents(SERVER_CERT_DIR, 0700);<br>
+=C2=A0 =C2=A0 g_mkdir(CLIENT_CERT_DIR, 0700);<br>
+=C2=A0 =C2=A0 g_mkdir(SERVER_CERT_DIR, 0700);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_CA_CERT);=
<br>
=C2=A0 =C2=A0 =C2=A0unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_SERVER_CE=
RT);<br>
@@ -273,7 +274,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0g_test_init(&amp;argc, &amp;argv, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_setenv(&quot;GNUTLS_FORCE_FIPS_MODE&quot;, &quot;2&qu=
ot;, 1);<br>
<br>
-=C2=A0 =C2=A0 g_mkdir_with_parents(WORKDIR, 0700);<br>
+=C2=A0 =C2=A0 g_mkdir(WORKDIR, 0700);<br>
<br>
=C2=A0 =C2=A0 =C2=A0test_tls_init(KEYFILE);<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000007e1a905e9491f47--

