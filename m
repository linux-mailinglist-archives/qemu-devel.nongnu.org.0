Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9221E5EA6EC
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:17:11 +0200 (CEST)
Received: from localhost ([::1]:53482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocnyw-0004KP-LS
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ocnty-0006td-Li
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:12:04 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:36767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ocntv-0001eV-0R
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:12:01 -0400
Received: by mail-lj1-x232.google.com with SMTP id t16so3365793ljh.3
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=c2HfkSVvCpRntoDJkaqAlIpMQHg09XdejLxKChT3CQY=;
 b=LbaU9yRgRXrcSd9Wlbo5JDSDChfAIl0C7oPKQXfQV/HMy+/Sypw5N/cpwQd68257I2
 T5Mhjv1W9aY38KlYDBx40vFNWy9llv6lTM7wbliHBBBYwxSZ8dWyYtjglUTEfu0BKw9Y
 Q5fhoXjxMOOKrvnx+wH/Vg5ZTRlC7JvZbjhmbXiPKNPmvRxekHn0fs8bZ0C1ncL1x/8e
 ywsDN0sSU9aGThqNPSSyZI0FpNjW+mq9pYpl0nkf73ftpWfrKNlhKyPA4fE5KiuXsyAM
 67cFZCxQtTst2aeWkwC1wXh3XPtKVw2ybxpJnEF2cv2SDCGI0OY+kME99XprXwLfXiPa
 osYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=c2HfkSVvCpRntoDJkaqAlIpMQHg09XdejLxKChT3CQY=;
 b=PGA7boWgDruEX0j8L5/eoAfsoxLPkhUnoI6Qtia+FFxlBsdsD8uCwHkgQU8SOSd0MQ
 elWPYVNGHDcMqcvG3KsQfMZUNNvA0CA6/EHCgj6FFy6Rc9cimuVmOzrZc9xiDCpXuUma
 6PETSZxU9KDDjlxlofbG4aKVumGcxuFtIBIQRM4V3bANVq4x6++G0cvH5bRvVIREg7lT
 QIJ5oTQ7tbG2/TOfj2gHLJYjmicMFa7FB8F5iiyDkSvquQHyu2lWBC6tRSPJ3VfZdgQi
 0OfRb8mdqJeB68wzAsB4TOJKjMDj8XbmpG6qVuaIOqXqgMxnDSWIEgMS/9IApmki8e7X
 irNg==
X-Gm-Message-State: ACrzQf2LkPSh93Fi+QJF6YvNe7SJJa+94VvM4wo8rzUPSFkWU9Vm8FqJ
 yK++WM22Oq8zbQjxZ/vYQWP/U3jXB9TELP/c/OkqnIvjwIoFGsTW
X-Google-Smtp-Source: AMsMyM6UGBs6+fPmspXCCuyMBSxEruCDuxS/aGWO2LdyLxnMoFvgVbTluyeu6QgDMsuFI2tQ1jedkXrV4pB6oDTSaWI=
X-Received: by 2002:a2e:a58a:0:b0:26c:6dce:ce4e with SMTP id
 m10-20020a2ea58a000000b0026c6dcece4emr7874353ljp.452.1664197917173; Mon, 26
 Sep 2022 06:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-13-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-13-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:11:45 +0400
Message-ID: <CAJ+F1C+-VSFmsSp2PfiwGVxTtw3tmL76YcoDevJKLuoDi2cRDA@mail.gmail.com>
Subject: Re: [PATCH v3 12/54] tests/qtest: hd-geo-test: Avoid using hardcoded
 /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b06cf005e994457f"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x232.google.com
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

--000000000000b06cf005e994457f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 3:58 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_file_open_tmp() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>
> Changes in v3:
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> - Use g_steal_pointer() in create_test_img()
>
>  tests/qtest/hd-geo-test.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 413cf964c0..455bc5db5c 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
> @@ -27,20 +27,19 @@
>
>  static char *create_test_img(int secs)
>  {
> -    char *template =3D strdup("/tmp/qtest.XXXXXX");
> +    g_autofree char *template =3D NULL;
>      int fd, ret;
>
> -    fd =3D mkstemp(template);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &template, NULL);
>      g_assert(fd >=3D 0);
>      ret =3D ftruncate(fd, (off_t)secs * 512);
>      close(fd);
>
>      if (ret) {
> -        free(template);
>          template =3D NULL;
>      }
>
> -    return template;
> +    return g_steal_pointer(&template);
>  }
>
>  typedef struct {
> @@ -422,9 +421,8 @@ static MBRpartitions empty_mbr =3D { {false, 0, 0, 0,=
 0,
> 0, 0, 0, 0},
>
>  static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
>  {
> -    const char *template =3D "/tmp/qtest.XXXXXX";
> -    char *raw_path =3D strdup(template);
> -    char *qcow2_path =3D strdup(template);
> +    g_autofree char *raw_path =3D NULL;
> +    char *qcow2_path;
>      char cmd[100 + 2 * PATH_MAX];
>      uint8_t buf[512] =3D {};
>      int i, ret, fd, offset;
> @@ -468,7 +466,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr,
> uint64_t sectors)
>          offset +=3D 0x10;
>      }
>
> -    fd =3D mkstemp(raw_path);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &raw_path, NULL);
>      g_assert(fd >=3D 0);
>      close(fd);
>
> @@ -478,7 +476,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr,
> uint64_t sectors)
>      g_assert(ret =3D=3D sizeof(buf));
>      close(fd);
>
> -    fd =3D mkstemp(qcow2_path);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &qcow2_path, NULL);
>      g_assert(fd >=3D 0);
>      close(fd);
>
> @@ -506,7 +504,6 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr,
> uint64_t sectors)
>      free(qemu_img_abs_path);
>
>      unlink(raw_path);
> -    free(raw_path);
>
>      return qcow2_path;
>  }
> @@ -714,7 +711,7 @@ static void test_override(TestArgs *args, CHSResult
> expected[])
>
>      for (i =3D 0; i < args->n_drives; i++) {
>          unlink(args->drives[i]);
> -        free(args->drives[i]);
> +        g_free(args->drives[i]);
>      }
>      g_free(args->drives);
>      g_strfreev(args->argv);
> @@ -867,7 +864,7 @@ static void test_override_scsi_hot_unplug(void)
>
>      for (i =3D 0; i < args->n_drives; i++) {
>          unlink(args->drives[i]);
> -        free(args->drives[i]);
> +        g_free(args->drives[i]);
>      }
>      g_free(args->drives);
>      g_strfreev(args->argv);
> @@ -927,7 +924,7 @@ static void test_override_virtio_hot_unplug(void)
>
>      for (i =3D 0; i < args->n_drives; i++) {
>          unlink(args->drives[i]);
> -        free(args->drives[i]);
> +        g_free(args->drives[i]);
>      }
>      g_free(args->drives);
>      g_strfreev(args->argv);
> @@ -987,7 +984,7 @@ test_add_done:
>      for (i =3D 0; i < backend_last; i++) {
>          if (img_file_name[i]) {
>              unlink(img_file_name[i]);
> -            free(img_file_name[i]);
> +            g_free(img_file_name[i]);
>          }
>      }
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b06cf005e994457f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 3:58 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
This case was written to use hardcoded /tmp directory for temporary<br>
files. Update to use g_file_open_tmp() for a portable implementation.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><br></d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
- Use g_steal_pointer() in create_test_img()<br>
<br>
=C2=A0tests/qtest/hd-geo-test.c | 25 +++++++++++--------------<br>
=C2=A01 file changed, 11 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c<br>
index 413cf964c0..455bc5db5c 100644<br>
--- a/tests/qtest/hd-geo-test.c<br>
+++ b/tests/qtest/hd-geo-test.c<br>
@@ -27,20 +27,19 @@<br>
<br>
=C2=A0static char *create_test_img(int secs)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 char *template =3D strdup(&quot;/tmp/qtest.XXXXXX&quot;);<br=
>
+=C2=A0 =C2=A0 g_autofree char *template =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0int fd, ret;<br>
<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(template);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;templa=
te, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D ftruncate(fd, (off_t)secs * 512);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(template);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0template =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 return template;<br>
+=C2=A0 =C2=A0 return g_steal_pointer(&amp;template);<br>
=C2=A0}<br>
<br>
=C2=A0typedef struct {<br>
@@ -422,9 +421,8 @@ static MBRpartitions empty_mbr =3D { {false, 0, 0, 0, 0=
, 0, 0, 0, 0},<br>
<br>
=C2=A0static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sector=
s)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 const char *template =3D &quot;/tmp/qtest.XXXXXX&quot;;<br>
-=C2=A0 =C2=A0 char *raw_path =3D strdup(template);<br>
-=C2=A0 =C2=A0 char *qcow2_path =3D strdup(template);<br>
+=C2=A0 =C2=A0 g_autofree char *raw_path =3D NULL;<br>
+=C2=A0 =C2=A0 char *qcow2_path;<br>
=C2=A0 =C2=A0 =C2=A0char cmd[100 + 2 * PATH_MAX];<br>
=C2=A0 =C2=A0 =C2=A0uint8_t buf[512] =3D {};<br>
=C2=A0 =C2=A0 =C2=A0int i, ret, fd, offset;<br>
@@ -468,7 +466,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, u=
int64_t sectors)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset +=3D 0x10;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(raw_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;raw_pa=
th, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
@@ -478,7 +476,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, u=
int64_t sectors)<br>
=C2=A0 =C2=A0 =C2=A0g_assert(ret =3D=3D sizeof(buf));<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(qcow2_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;qcow2_=
path, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
@@ -506,7 +504,6 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, u=
int64_t sectors)<br>
=C2=A0 =C2=A0 =C2=A0free(qemu_img_abs_path);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlink(raw_path);<br>
-=C2=A0 =C2=A0 free(raw_path);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return qcow2_path;<br>
=C2=A0}<br>
@@ -714,7 +711,7 @@ static void test_override(TestArgs *args, CHSResult exp=
ected[])<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; args-&gt;n_drives; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(args-&gt;drives[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(args-&gt;drives[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(args-&gt;drives[i]);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_free(args-&gt;drives);<br>
=C2=A0 =C2=A0 =C2=A0g_strfreev(args-&gt;argv);<br>
@@ -867,7 +864,7 @@ static void test_override_scsi_hot_unplug(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; args-&gt;n_drives; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(args-&gt;drives[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(args-&gt;drives[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(args-&gt;drives[i]);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_free(args-&gt;drives);<br>
=C2=A0 =C2=A0 =C2=A0g_strfreev(args-&gt;argv);<br>
@@ -927,7 +924,7 @@ static void test_override_virtio_hot_unplug(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; args-&gt;n_drives; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(args-&gt;drives[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(args-&gt;drives[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(args-&gt;drives[i]);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_free(args-&gt;drives);<br>
=C2=A0 =C2=A0 =C2=A0g_strfreev(args-&gt;argv);<br>
@@ -987,7 +984,7 @@ test_add_done:<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; backend_last; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (img_file_name[i]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(img_file_name[i]);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(img_file_name[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(img_file_name[i]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b06cf005e994457f--

