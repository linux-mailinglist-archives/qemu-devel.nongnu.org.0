Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5FD5A939D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 11:52:02 +0200 (CEST)
Received: from localhost ([::1]:46984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTgrh-0005kz-73
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 05:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTg8Z-00062E-5u
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 05:05:23 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:34644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTg8W-00065h-9o
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 05:05:22 -0400
Received: by mail-lj1-x232.google.com with SMTP id z23so14329434ljk.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 02:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=l4mQr0rKf79oNY1Ct6p5bxtvMWDxa8e0ajf1qs01Yic=;
 b=ncIqfSGkSebz1kZTpBUsLZqvkxGRJW5qSBcW3m8tN+wTG2NW1nZsyD7OpVkZQ26eXk
 uPBq9205xybYxYXQqODcWC5TCHRLAf9eo3b6UQgYp4/x/lMPsuVAOz/11WiUpHWIRMcx
 GzFn1/2DfltN5s/7PbSJpnX9e893v9YtPpMsJWU05c7LIn6k1prjwVBB2o1pS9oAzAzy
 m6CVoU/cZowOQ4faSEcbT2AuFGQmtOngWhINQqaX2W/x1ryU1SLZDA1E3m6arFRiD3mZ
 CeqlzYCY4BoKJV4Eb0TJ+LDSvf6UED7Mlg9Fa+cxeQfU+vVc/5P0J1yxuS9g3Q1qCVzS
 NBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=l4mQr0rKf79oNY1Ct6p5bxtvMWDxa8e0ajf1qs01Yic=;
 b=2M4iL/wepZPDihqUgiYj0QOBZ/mu8wYh2REuuLbw12GhP0ije2zH+qh6NiWJuJoC9J
 MM+3DlueXVVFn9vxA79qexe85hyBGaIKyq2W2FidDgeKtV0VmUQvWAz/ZP+O0WtcabHa
 YIzEjB0rBAcuTIph1NtKLVLDLFewNd1j69wtUmbA6ASRNtoAtmx4wEcfnUmwuoej5uKi
 sz5MvRIbcQuuvMlPjMhhGc2nmVryWxVGIJCco7YU5ClLl83+XjXblpKiZayZjns1E8sI
 aBP1OF/sjqrV9G+f2v61pEzCelNZmpuN6Yuh7bVX0wX5Tqo+ALtZZI1etCjKnqGFmYun
 /RPA==
X-Gm-Message-State: ACgBeo2M2tGsebZuwG5sbYx+ez0YuBWZCj4XC8MKFFEOLbYlohQcNqjy
 rVGI9FLYsgvjq85iLtp0yKBiqcVn5dYtLwrKZKo=
X-Google-Smtp-Source: AA6agR7fPNNcwR4orRhHE7HBs0xKecZA2G7GXVLsy75+awjvMAfsffWMMMU0uEKvoVBY/zCE4zIL/mkqxFJrT8QWaKg=
X-Received: by 2002:a05:651c:a04:b0:25e:753b:db42 with SMTP id
 k4-20020a05651c0a0400b0025e753bdb42mr9458681ljq.529.1662023116909; Thu, 01
 Sep 2022 02:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-35-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-35-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Sep 2022 13:05:05 +0400
Message-ID: <CAJ+F1CLErt2=rNA5B6RtH4GzhGr=+3Hkyk==J4bTpcaNUUaZzg@mail.gmail.com>
Subject: Re: [PATCH 34/51] tests/qtest: bios-tables-test: Adapt the case for
 win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007df08505e799e924"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x232.google.com
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

--0000000000007df08505e799e924
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 3:02 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Single quotes in the arguments (oem_id=3D'CRASH ') are not removed in
> the Windows environment before it is passed to the QEMU executable.
> The space in the argument causes the "-acpitable" option parser to
> think that all of its parameters are done, hence it complains:
>
>   '-acpitable' requires one of 'data' or 'file'
>
> Change to use double quotes which works fine on all platforms.
>
> Also /dev/null does not work on win32, and nul should be used.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  tests/qtest/bios-tables-test.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test.c
> b/tests/qtest/bios-tables-test.c
> index 36783966b0..0148ce388c 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1615,6 +1615,12 @@ static void test_acpi_virt_viot(void)
>      free_test_data(&data);
>  }
>
> +#ifndef _WIN32
> +# define DEV_NULL "/dev/null"
> +#else
> +# define DEV_NULL "nul"
> +#endif
> +
>  static void test_acpi_q35_slic(void)
>  {
>      test_data data =3D {
> @@ -1622,9 +1628,9 @@ static void test_acpi_q35_slic(void)
>          .variant =3D ".slic",
>      };
>
> -    test_acpi_one("-acpitable sig=3DSLIC,oem_id=3D'CRASH ',oem_table_id=
=3D'ME',"
> -                  "oem_rev=3D00002210,asl_compiler_id=3D'qemu',"
> -                  "asl_compiler_rev=3D00000000,data=3D/dev/null",
> +    test_acpi_one("-acpitable sig=3DSLIC,oem_id=3D\"CRASH \",oem_table_i=
d=3DME,"
> +                  "oem_rev=3D00002210,asl_compiler_id=3Dqemu,"
> +                  "asl_compiler_rev=3D00000000,data=3D" DEV_NULL,
>                    &data);
>      free_test_data(&data);
>  }
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007df08505e799e924
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 3:02 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
Single quotes in the arguments (oem_id=3D&#39;CRASH &#39;) are not removed =
in<br>
the Windows environment before it is passed to the QEMU executable.<br>
The space in the argument causes the &quot;-acpitable&quot; option parser t=
o<br>
think that all of its parameters are done, hence it complains:<br>
<br>
=C2=A0 &#39;-acpitable&#39; requires one of &#39;data&#39; or &#39;file&#39=
;<br>
<br>
Change to use double quotes which works fine on all platforms.<br>
<br>
Also /dev/null does not work on win32, and nul should be used.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
=C2=A0tests/qtest/bios-tables-test.c | 12 +++++++++---<br>
=C2=A01 file changed, 9 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.=
c<br>
index 36783966b0..0148ce388c 100644<br>
--- a/tests/qtest/bios-tables-test.c<br>
+++ b/tests/qtest/bios-tables-test.c<br>
@@ -1615,6 +1615,12 @@ static void test_acpi_virt_viot(void)<br>
=C2=A0 =C2=A0 =C2=A0free_test_data(&amp;data);<br>
=C2=A0}<br>
<br>
+#ifndef _WIN32<br>
+# define DEV_NULL &quot;/dev/null&quot;<br>
+#else<br>
+# define DEV_NULL &quot;nul&quot;<br>
+#endif<br>
+<br>
=C2=A0static void test_acpi_q35_slic(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0test_data data =3D {<br>
@@ -1622,9 +1628,9 @@ static void test_acpi_q35_slic(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.variant =3D &quot;.slic&quot;,<br>
=C2=A0 =C2=A0 =C2=A0};<br>
<br>
-=C2=A0 =C2=A0 test_acpi_one(&quot;-acpitable sig=3DSLIC,oem_id=3D&#39;CRAS=
H &#39;,oem_table_id=3D&#39;ME&#39;,&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oem_r=
ev=3D00002210,asl_compiler_id=3D&#39;qemu&#39;,&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;asl_c=
ompiler_rev=3D00000000,data=3D/dev/null&quot;,<br>
+=C2=A0 =C2=A0 test_acpi_one(&quot;-acpitable sig=3DSLIC,oem_id=3D\&quot;CR=
ASH \&quot;,oem_table_id=3DME,&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oem_r=
ev=3D00002210,asl_compiler_id=3Dqemu,&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;asl_c=
ompiler_rev=3D00000000,data=3D&quot; DEV_NULL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;d=
ata);<br>
=C2=A0 =C2=A0 =C2=A0free_test_data(&amp;data);<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007df08505e799e924--

