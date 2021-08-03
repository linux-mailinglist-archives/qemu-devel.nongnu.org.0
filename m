Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 112183DE7C4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:00:02 +0200 (CEST)
Received: from localhost ([::1]:48062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApLE-0008AD-Sa
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mApKP-0007Ta-Iy
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 03:59:09 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:36711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mApKN-0006t0-Ib
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 03:59:09 -0400
Received: by mail-ed1-x531.google.com with SMTP id b7so27904051edu.3
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 00:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fz51+upxUtAKXsFDLhNB41Q68qdlEfeuSxjdyAMi5qw=;
 b=ObVFfr115w3d0azoQ1Vw2YjF4alUTDqfOR4jblnmKbPPH2n1bchDceNCyF1dBKCz8z
 h+CymHEZFQs/OtKwcofzq6JFyn+NW7coTq9ecUriEWpT+un6lQb6v6LfJpgNIjhla3Yp
 f5CJynJWmx6hT8Bkqjfix2PEar3REO+BVu9HfYllIFNy4LnkYDUOcmxxE3g71C0pv/eR
 zZCdwogUN6wVabGyiTAI02MfTZHtZrCbhicayM6ugO48MuqIsIgMdrKPggEaAxy0Y79+
 OscpUNqpv9SaJ/nSyzDtcNXO077ezXzpGZdhs+/DwbGFw1dwzmkMj0fQrHnDpSc13sy4
 v4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fz51+upxUtAKXsFDLhNB41Q68qdlEfeuSxjdyAMi5qw=;
 b=dq82qF56FiGpkFLm8QV+v96VkxSLENtB7Cnj4nh9CTRuGmn7vI7VBogrTZnzRPs4aU
 l/sec6W/CE1Ax+G4nPAc3pm9WHSGKYzevi/1gnYAvHO7z7Ww33CDIWIUWSKhTf93F0Qs
 KWHUJM9FYc2AKxARVD9mL0E5nogKaiCx+34IIKOsHTy2vk1Rv+AkfeEKZipBGNhVHfZR
 cgST0U2Ambkfr7W+szJj5pUwf74Hvn0Lh1i0igjceGr4zRxAj/oK3nRLGY4GJED+nue6
 4Fb8OHDGfXW91kSxcgZVZW2OwRvFIP1aDf5Xe/FuLa6MDXRkbwXUfIuGhMN96mEUhIGd
 KptA==
X-Gm-Message-State: AOAM531V9QLmcJDzCa1HkCTCgVOAZvNJupeffTkX+yQAgF3lOzNLobID
 NPy5pyufDsUhN0lIvZTd72dBDRf/65Vu9jJJreM=
X-Google-Smtp-Source: ABdhPJyidugvU6eOpTA3QzJPSAtJP3+egeCF5p0HTA6MtcxneKXeZ5j32MMDzR7wMxkMuF943ktjNHcd2ehj2aYtXsI=
X-Received: by 2002:a05:6402:881:: with SMTP id
 e1mr24696264edy.53.1627977545411; 
 Tue, 03 Aug 2021 00:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210802215246.1433175-1-stefanb@linux.ibm.com>
 <20210802215246.1433175-9-stefanb@linux.ibm.com>
In-Reply-To: <20210802215246.1433175-9-stefanb@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 3 Aug 2021 11:58:53 +0400
Message-ID: <CAJ+F1C+vWD4B66R3OoNGOAG8XUy4F6nMGm=9_iX-0H_J25t9nw@mail.gmail.com>
Subject: Re: [PATCH-for-6.2 v6 08/10] tests: Use QMP to check whether a TPM
 device model is available
To: Stefan Berger <stefanb@linux.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000004beef005c8a30fcc"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004beef005c8a30fcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 3, 2021 at 1:54 AM Stefan Berger <stefanb@linux.ibm.com> wrote:

> Use QMP to check whether a given TPM device model is available and if it
> is not the case then do not register the tests that require it.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  tests/qtest/bios-tables-test.c |  8 +++----
>  tests/qtest/tpm-emu.c          | 38 ++++++++++++++++++++++++++++++++++
>  tests/qtest/tpm-emu.h          |  2 ++
>  3 files changed, 43 insertions(+), 5 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test.c
> b/tests/qtest/bios-tables-test.c
> index 4ccbe56158..89bf55c838 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1094,7 +1094,6 @@ uint64_t tpm_tis_base_addr;
>  static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>                                uint64_t base, enum TPMVersion tpm_version=
)
>  {
> -#ifdef CONFIG_TPM
>      gchar *tmp_dir_name =3D
> g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
>                                            machine, tpm_if);
>      char *tmp_path =3D g_dir_make_tmp(tmp_dir_name, NULL);
> @@ -1140,9 +1139,6 @@ static void test_acpi_tcg_tpm(const char *machine,
> const char *tpm_if,
>      g_free(tmp_dir_name);
>      g_free(args);
>      free_test_data(&data);
> -#else
> -    g_test_skip("TPM disabled");
> -#endif
>  }
>
>  static void test_acpi_q35_tcg_tpm_tis(void)
> @@ -1518,7 +1514,9 @@ int main(int argc, char *argv[])
>              return ret;
>          }
>          qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
> -        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
> +        if (tpm_model_is_available("-machine q35", "tpm-tis")) {
> +            qtest_add_func("acpi/q35/tpm2-tis",
> test_acpi_q35_tcg_tpm_tis);
> +        }
>

(I noted the test doesn't use qos)

         qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>          qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
>          qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
> diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
> index 32c704194b..2994d1cf42 100644
> --- a/tests/qtest/tpm-emu.c
> +++ b/tests/qtest/tpm-emu.c
> @@ -16,6 +16,8 @@
>  #include "backends/tpm/tpm_ioctl.h"
>  #include "io/channel-socket.h"
>  #include "qapi/error.h"
> +#include "qapi/qmp/qlist.h"
> +#include "qapi/qmp/qstring.h"
>  #include "tpm-emu.h"
>
>  void tpm_emu_test_wait_cond(TPMTestState *s)
> @@ -192,3 +194,39 @@ void *tpm_emu_ctrl_thread(void *data)
>      object_unref(OBJECT(lioc));
>      return NULL;
>  }
> +
> +bool tpm_model_is_available(const char *args, const char *tpm_if)
> +{
> +    QTestState *qts;
> +    QDict *rsp_tpm;
>
+    bool ret =3D false;
> +
> +    qts =3D qtest_init(args);
> +    if (!qts) {
> +        return false;
> +    }
>
+
> +    rsp_tpm =3D qtest_qmp(qts, "{ 'execute': 'query-tpm'}");
> +    if (!qdict_haskey(rsp_tpm, "error")) {
> +        QDict *rsp_models =3D qtest_qmp(qts,
> +                                      "{ 'execute': 'query-tpm-models'}"=
);
> +        if (qdict_haskey(rsp_models, "return")) {
> +            QList *models =3D qdict_get_qlist(rsp_models, "return");
> +            QListEntry *e;
> +
> +            QLIST_FOREACH_ENTRY(models, e) {
> +                QString *s =3D qobject_to(QString, qlist_entry_obj(e));
> +                const char *ename =3D qstring_get_str(s);
> +                if (!strcmp(ename, tpm_if)) {
> +                    ret =3D true;
> +                    break;
> +                }
> +            }
> +        }
> +        qobject_unref(rsp_models);
> +    }
> +    qobject_unref(rsp_tpm);
> +    qtest_quit(qts);
> +
> +    return ret;
> +}
> diff --git a/tests/qtest/tpm-emu.h b/tests/qtest/tpm-emu.h
> index fcb5d7a1d6..c33d99af37 100644
> --- a/tests/qtest/tpm-emu.h
> +++ b/tests/qtest/tpm-emu.h
> @@ -22,6 +22,7 @@
>  #include "qemu/sockets.h"
>  #include "io/channel.h"
>  #include "sysemu/tpm.h"
> +#include "libqos/libqtest.h"
>
>  struct tpm_hdr {
>      uint16_t tag;
> @@ -50,5 +51,6 @@ typedef struct TPMTestState {
>
>  void tpm_emu_test_wait_cond(TPMTestState *s);
>  void *tpm_emu_ctrl_thread(void *data);
> +bool tpm_model_is_available(const char *args, const char *tpm_if);
>
>  #endif /* TESTS_TPM_EMU_H */
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000004beef005c8a30fcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 1:54 AM Stef=
an Berger &lt;<a href=3D"mailto:stefanb@linux.ibm.com">stefanb@linux.ibm.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Use QMP to check whether a given TPM device model is available and if it<b=
r>
is not the case then do not register the tests that require it.<br>
<br>
Signed-off-by: Stefan Berger &lt;<a href=3D"mailto:stefanb@linux.ibm.com" t=
arget=3D"_blank">stefanb@linux.ibm.com</a>&gt;<br></blockquote><div><br></d=
iv><div>lgtm</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"m=
ailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/qtest/bios-tables-test.c |=C2=A0 8 +++----<br>
=C2=A0tests/qtest/tpm-emu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 38 ++++++++=
++++++++++++++++++++++++++<br>
=C2=A0tests/qtest/tpm-emu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<=
br>
=C2=A03 files changed, 43 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.=
c<br>
index 4ccbe56158..89bf55c838 100644<br>
--- a/tests/qtest/bios-tables-test.c<br>
+++ b/tests/qtest/bios-tables-test.c<br>
@@ -1094,7 +1094,6 @@ uint64_t tpm_tis_base_addr;<br>
=C2=A0static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t base, enum TPMVersion tpm_ve=
rsion)<br>
=C2=A0{<br>
-#ifdef CONFIG_TPM<br>
=C2=A0 =C2=A0 =C2=A0gchar *tmp_dir_name =3D g_strdup_printf(&quot;qemu-test=
_acpi_%s_tcg_%s.XXXXXX&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0machine, tpm_if);<br>
=C2=A0 =C2=A0 =C2=A0char *tmp_path =3D g_dir_make_tmp(tmp_dir_name, NULL);<=
br>
@@ -1140,9 +1139,6 @@ static void test_acpi_tcg_tpm(const char *machine, co=
nst char *tpm_if,<br>
=C2=A0 =C2=A0 =C2=A0g_free(tmp_dir_name);<br>
=C2=A0 =C2=A0 =C2=A0g_free(args);<br>
=C2=A0 =C2=A0 =C2=A0free_test_data(&amp;data);<br>
-#else<br>
-=C2=A0 =C2=A0 g_test_skip(&quot;TPM disabled&quot;);<br>
-#endif<br>
=C2=A0}<br>
<br>
=C2=A0static void test_acpi_q35_tcg_tpm_tis(void)<br>
@@ -1518,7 +1514,9 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;acpi/q35/oem-fields&=
quot;, test_acpi_oem_fields_q35);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_add_func(&quot;acpi/q35/tpm-tis&quot;, t=
est_acpi_q35_tcg_tpm_tis);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tpm_model_is_available(&quot;-machine q35&=
quot;, &quot;tpm-tis&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_add_func(&quot;acpi/q35/tp=
m2-tis&quot;, test_acpi_q35_tcg_tpm_tis);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>(I noted=
 the test doesn&#39;t use qos)</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;acpi/piix4&quot;, te=
st_acpi_piix4_tcg);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;acpi/oem-fields&quot=
;, test_acpi_oem_fields_pc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;acpi/piix4/bridge&qu=
ot;, test_acpi_piix4_tcg_bridge);<br>
diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c<br>
index 32c704194b..2994d1cf42 100644<br>
--- a/tests/qtest/tpm-emu.c<br>
+++ b/tests/qtest/tpm-emu.c<br>
@@ -16,6 +16,8 @@<br>
=C2=A0#include &quot;backends/tpm/tpm_ioctl.h&quot;<br>
=C2=A0#include &quot;io/channel-socket.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
+#include &quot;qapi/qmp/qlist.h&quot;<br>
+#include &quot;qapi/qmp/qstring.h&quot;<br>
=C2=A0#include &quot;tpm-emu.h&quot;<br>
<br>
=C2=A0void tpm_emu_test_wait_cond(TPMTestState *s)<br>
@@ -192,3 +194,39 @@ void *tpm_emu_ctrl_thread(void *data)<br>
=C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(lioc));<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
+<br>
+bool tpm_model_is_available(const char *args, const char *tpm_if)<br>
+{<br>
+=C2=A0 =C2=A0 QTestState *qts;<br>
+=C2=A0 =C2=A0 QDict *rsp_tpm; <br></blockquote><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
+=C2=A0 =C2=A0 bool ret =3D false;<br>
+<br>
+=C2=A0 =C2=A0 qts =3D qtest_init(args);<br>
+=C2=A0 =C2=A0 if (!qts) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br></blockquote><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
+<br>
+=C2=A0 =C2=A0 rsp_tpm =3D qtest_qmp(qts, &quot;{ &#39;execute&#39;: &#39;q=
uery-tpm&#39;}&quot;);<br>
+=C2=A0 =C2=A0 if (!qdict_haskey(rsp_tpm, &quot;error&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QDict *rsp_models =3D qtest_qmp(qts,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{ &#39;ex=
ecute&#39;: &#39;query-tpm-models&#39;}&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qdict_haskey(rsp_models, &quot;return&quot=
;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QList *models =3D qdict_get_qlis=
t(rsp_models, &quot;return&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QListEntry *e;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QLIST_FOREACH_ENTRY(models, e) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QString *s =3D qob=
ject_to(QString, qlist_entry_obj(e));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *ename =
=3D qstring_get_str(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strcmp(ename,=
 tpm_if)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qobject_unref(rsp_models);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qobject_unref(rsp_tpm);<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
diff --git a/tests/qtest/tpm-emu.h b/tests/qtest/tpm-emu.h<br>
index fcb5d7a1d6..c33d99af37 100644<br>
--- a/tests/qtest/tpm-emu.h<br>
+++ b/tests/qtest/tpm-emu.h<br>
@@ -22,6 +22,7 @@<br>
=C2=A0#include &quot;qemu/sockets.h&quot;<br>
=C2=A0#include &quot;io/channel.h&quot;<br>
=C2=A0#include &quot;sysemu/tpm.h&quot;<br>
+#include &quot;libqos/libqtest.h&quot;<br>
<br>
=C2=A0struct tpm_hdr {<br>
=C2=A0 =C2=A0 =C2=A0uint16_t tag;<br>
@@ -50,5 +51,6 @@ typedef struct TPMTestState {<br>
<br>
=C2=A0void tpm_emu_test_wait_cond(TPMTestState *s);<br>
=C2=A0void *tpm_emu_ctrl_thread(void *data);<br>
+bool tpm_model_is_available(const char *args, const char *tpm_if);<br>
<br>
=C2=A0#endif /* TESTS_TPM_EMU_H */<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000004beef005c8a30fcc--

