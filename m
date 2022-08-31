Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE65A7F16
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:42:09 +0200 (CEST)
Received: from localhost ([::1]:44880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNyq-0003iO-AQ
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNxG-0001mJ-Mi
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:40:30 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:38676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNxA-0000z5-BW
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:40:30 -0400
Received: by mail-lf1-x131.google.com with SMTP id q7so19994319lfu.5
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=OE5najel9Uz9w82RmO6ObHxIex4gwPJGcnKGyoHXr9Y=;
 b=G9CNg5hOofJGTx3OOq4UOtkD6d9pBZ2NhRyztedcdClh3WhAZ07NN/PTCK9fO0Wkyt
 hjz6ikT8Pzlh2VkqF5V148Xqn7d9ovmS8/X+J/WisRBsfYMkLH9Nlr5cexroYovGKKX2
 71xW1VghwqOkZq/dxjztZHIiX7/uasnc66H/iMLSIq9SOcvojZxdwpc324fzuKPX4qIw
 m1hDeRc96bG7of4yyIm47pPHsMX9/34Z946cbX5FFd+QEtQTVSbPV3lyYkYcPl/BAMt+
 2buFi8MH1aYAG9TlXaiqyhGCa4fiHs49DfcYu7OWFAOcB5xmwJE5OHfnGaZm3z40WJ7C
 OM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=OE5najel9Uz9w82RmO6ObHxIex4gwPJGcnKGyoHXr9Y=;
 b=6uAZWGpk3b71w6LqQgsyKBNQYE3yPVVA0Lm5YiRZhY8wShXEikPTq4V5GDcsgjsdQC
 VaVoKTNpXgnLvYfgZvrxu12Ho31jpBGs33Hycgf6loLdTaTM+jYCOye4v3A7/5WkxZif
 HSTprFGaRCWf87vb6JIsA+mlF92sGK7RAtG23+KlhFdGyXcEj5slODdgWbAip1HoW5eC
 KEbUoNyKpP0IrkcJGa2q4ZWOhNkIBFdapiR0XRqoejCctWFezoTDNNIDhdKB3uAUzkln
 T+kZN6vFHG+SQt4Y/XCwET4qR6vm+3zhRRJpOd7pdzmTux6BhPSZl+yFyILRI/AdJoB0
 cHaA==
X-Gm-Message-State: ACgBeo0sY6W/9TyiF/c9j5nP5Ta3FwKLD1wiVCGodZ1dOTU2E4pNzK0e
 brLovxdhTAWMyUsBSS/mwwnlW10AFRtzPVO1Rsk=
X-Google-Smtp-Source: AA6agR6JywpXhSqkiR1Xg/jZHSKsyRnyX+ffx+bcljI41SS/vevCClNPLCzUuQuEghetUFKLKfRDL/dAtpxuxNxq5Yk=
X-Received: by 2002:ac2:4f03:0:b0:48b:2179:5249 with SMTP id
 k3-20020ac24f03000000b0048b21795249mr10688538lfr.356.1661953221025; Wed, 31
 Aug 2022 06:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-21-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-21-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 17:40:09 +0400
Message-ID: <CAJ+F1C+iDMHYA6WFsCSiY5XnAWF0dBhGjE-qPSCCrdoXaQZHog@mail.gmail.com>
Subject: Re: [PATCH 20/51] tests/qtest: i440fx-test: Skip running
 request_{bios, pflash} for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005f689e05e789a3de"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
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

--0000000000005f689e05e789a3de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 2:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> The request_{bios,pflash} test cases call mmap() which does not
> exist on win32. Exclude them.
>
>
We can fairly easily rewrite the create_blob_file() function to be portable
though, something like:

static char *create_blob_file(void)
{
    g_autofree uint8_t *buf =3D g_malloc(BLOB_SIZE);
    GError *error =3D NULL;
    char *pathname;
    int fd;
    size_t i;

    fd =3D g_file_open_tmp("blob_XXXXXX", &pathname, &error);
    g_assert_no_error(error);

    for (i =3D 0; i < BLOB_SIZE; ++i) {
        buf[i] =3D i;
    }

    g_file_set_contents(pathname, (char *)buf, BLOB_SIZE, &error);
    g_assert_no_error(error);
    close(fd);

    return pathname;
}

Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  tests/qtest/i440fx-test.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c
> index 6d7d4d8d8f..3890f1237c 100644
> --- a/tests/qtest/i440fx-test.c
> +++ b/tests/qtest/i440fx-test.c
> @@ -278,6 +278,8 @@ static void test_i440fx_pam(gconstpointer opaque)
>      qtest_end();
>  }
>
> +#ifndef _WIN32
> +
>  #define BLOB_SIZE ((size_t)65536)
>  #define ISA_BIOS_MAXSZ ((size_t)(128 * 1024))
>
> @@ -396,6 +398,8 @@ static void request_pflash(FirmwareTestFixture
> *fixture,
>      fixture->is_bios =3D false;
>  }
>
> +#endif /* _WIN32 */
> +
>  int main(int argc, char **argv)
>  {
>      TestData data;
> @@ -406,8 +410,10 @@ int main(int argc, char **argv)
>
>      qtest_add_data_func("i440fx/defaults", &data, test_i440fx_defaults);
>      qtest_add_data_func("i440fx/pam", &data, test_i440fx_pam);
> +#ifndef _WIN32
>      add_firmware_test("i440fx/firmware/bios", request_bios);
>      add_firmware_test("i440fx/firmware/pflash", request_pflash);
> +#endif
>
>      return g_test_run();
>  }
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005f689e05e789a3de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:15 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
The request_{bios,pflash} test cases call mmap() which does not<br>
exist on win32. Exclude them.<br>
<br></blockquote><div><br></div><div>We can fairly easily rewrite the creat=
e_blob_file() function to be portable though, something like:</div><div><br=
></div><div>static char *create_blob_file(void)<br>{<br>=C2=A0 =C2=A0 g_aut=
ofree uint8_t *buf =3D g_malloc(BLOB_SIZE);<br>=C2=A0 =C2=A0 GError *error =
=3D NULL;<br>=C2=A0 =C2=A0 char *pathname;<br>=C2=A0 =C2=A0 int fd;<br>=C2=
=A0 =C2=A0 size_t i;<br><br>=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;blob=
_XXXXXX&quot;, &amp;pathname, &amp;error);<br>=C2=A0 =C2=A0 g_assert_no_err=
or(error);<br><br>=C2=A0 =C2=A0 for (i =3D 0; i &lt; BLOB_SIZE; ++i) {<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf[i] =3D i;<br>=C2=A0 =C2=A0 }<br><br>=C2=A0 =
=C2=A0 g_file_set_contents(pathname, (char *)buf, BLOB_SIZE, &amp;error);<b=
r>=C2=A0 =C2=A0 g_assert_no_error(error);<br>=C2=A0 =C2=A0 close(fd);<br><b=
r>=C2=A0 =C2=A0 return pathname;<br>}</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0tests/qtest/i440fx-test.c | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c<br>
index 6d7d4d8d8f..3890f1237c 100644<br>
--- a/tests/qtest/i440fx-test.c<br>
+++ b/tests/qtest/i440fx-test.c<br>
@@ -278,6 +278,8 @@ static void test_i440fx_pam(gconstpointer opaque)<br>
=C2=A0 =C2=A0 =C2=A0qtest_end();<br>
=C2=A0}<br>
<br>
+#ifndef _WIN32<br>
+<br>
=C2=A0#define BLOB_SIZE ((size_t)65536)<br>
=C2=A0#define ISA_BIOS_MAXSZ ((size_t)(128 * 1024))<br>
<br>
@@ -396,6 +398,8 @@ static void request_pflash(FirmwareTestFixture *fixture=
,<br>
=C2=A0 =C2=A0 =C2=A0fixture-&gt;is_bios =3D false;<br>
=C2=A0}<br>
<br>
+#endif /* _WIN32 */<br>
+<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0TestData data;<br>
@@ -406,8 +410,10 @@ int main(int argc, char **argv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_data_func(&quot;i440fx/defaults&quot;, &amp;d=
ata, test_i440fx_defaults);<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_data_func(&quot;i440fx/pam&quot;, &amp;data, =
test_i440fx_pam);<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0add_firmware_test(&quot;i440fx/firmware/bios&quot;, req=
uest_bios);<br>
=C2=A0 =C2=A0 =C2=A0add_firmware_test(&quot;i440fx/firmware/pflash&quot;, r=
equest_pflash);<br>
+#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0return g_test_run();<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005f689e05e789a3de--

