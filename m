Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7FD5EA6F2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:18:56 +0200 (CEST)
Received: from localhost ([::1]:58934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oco0c-0006RS-Ob
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ocns3-00058m-4v
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:10:03 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:40541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ocns1-00019o-DV
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:10:02 -0400
Received: by mail-lf1-x129.google.com with SMTP id s6so10743936lfo.7
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=r177CvEfbmARPqyeNorBerUxLwLsLXcWhfnWCPP+m5M=;
 b=d6qMRhXg+xRyniFg3Wdr9LYojaBelOFDG7OI/OQxlpKcJVwwfuFQ7IYRoMr2hzYWFy
 R9NdxoAkza4wHy9qiqowdMyMgG/whTUhTqJDf25aHBXX8bS5idmSccfAsyPURc2LRPZk
 huW9wyAPl0a9vqCjkY+8Cu8sJm3MBeZ+pZwWIOYu4ndAqdd4jkYWkvRt/lvWfLhsx0RR
 heGDjBhLa09Pi9HplcR6PcCV2wnj3wmdTUJba1gqyL4L1wvUJMC7Hafq1domDUh7jAmd
 B+f375st4ID/0c0Jsu9ueQNKkz6BfvHSAtICrmMpQxVHFvmXe9v0dkJ/I1/S/GMiqD/e
 peoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=r177CvEfbmARPqyeNorBerUxLwLsLXcWhfnWCPP+m5M=;
 b=hiOpEUQ/AcPvUJUPooiVqesvUGY/9V3LDCrbiQznXqxulXTBZhshK69Q8iqILKx72/
 gB0Ux9q1uaKhmgh28qF9OKC9ot7keajwa6ZegtehNiO0KARcfZgRDoDK34JqUWs8qKuk
 30KN+EEF13kJcXJTfv6bJ7EceqgZM0NanP3IvZknD2LWTC+muK1jFzhO4wdD+cK3DwPN
 srhfclOvKVe5k6ljE75paFTbPkQfkAzdXVHEzQrb5/4O/CstjmzOgGqhKe5n2eYD75bf
 8Z7nRDjU4aIlvUZ0RKb9zjNS7iL4KxFlazkaENETmWaV+sK8Zc7qQ6o12gOUlyAF340B
 RYVw==
X-Gm-Message-State: ACrzQf21AkknCKhsVTArF7PDYPbK1j8nu5WBbafPrKEl5iD7Bu+Ca+kV
 yBBNVJzYAFTHnlwFBaNG8wtAeCK9vxOurTQih0w=
X-Google-Smtp-Source: AMsMyM6cX/aN+PykUiicZKIcQfRdE9+agfmwG/TrFln0BwZw5Oaj060DRVWp/pBOZuRUdBmERiykt3jaoQSDReUEn1U=
X-Received: by 2002:a05:6512:3d18:b0:498:fafb:229f with SMTP id
 d24-20020a0565123d1800b00498fafb229fmr9724024lfv.356.1664197799325; Mon, 26
 Sep 2022 06:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-11-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-11-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:09:47 +0400
Message-ID: <CAJ+F1CJoHHoB7BCo4WC2ECTZfBcW5djtkEeC1nhNzpdddVjnFA@mail.gmail.com>
Subject: Re: [PATCH v3 10/54] tests/qtest: generic_fuzz: Avoid using hardcoded
 /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000aa329905e9943edf"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x129.google.com
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

--000000000000aa329905e9943edf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 3:37 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_dir_make_tmp() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v3:
> - Split to a separate patch
>
>  tests/qtest/fuzz/generic_fuzz_configs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h
> b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 0775e6702b..a825b78c14 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -20,8 +20,8 @@ typedef struct generic_fuzz_config {
>  } generic_fuzz_config;
>
>  static inline gchar *generic_fuzzer_virtio_9p_args(void){
> -    char tmpdir[] =3D "/tmp/qemu-fuzz.XXXXXX";
> -    g_assert_nonnull(g_mkdtemp(tmpdir));
> +    g_autofree char *tmpdir =3D g_dir_make_tmp("qemu-fuzz.XXXXXX", NULL)=
;
> +    g_assert_nonnull(tmpdir);
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



>
>      return g_strdup_printf("-machine q35 -nodefaults "
>      "-device virtio-9p,fsdev=3Dhshare,mount_tag=3Dhshare "
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000aa329905e9943edf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 3:37 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
This case was written to use hardcoded /tmp directory for temporary<br>
files. Update to use g_dir_make_tmp() for a portable implementation.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
<br>
=C2=A0tests/qtest/fuzz/generic_fuzz_configs.h | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/gen=
eric_fuzz_configs.h<br>
index 0775e6702b..a825b78c14 100644<br>
--- a/tests/qtest/fuzz/generic_fuzz_configs.h<br>
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h<br>
@@ -20,8 +20,8 @@ typedef struct generic_fuzz_config {<br>
=C2=A0} generic_fuzz_config;<br>
<br>
=C2=A0static inline gchar *generic_fuzzer_virtio_9p_args(void){<br>
-=C2=A0 =C2=A0 char tmpdir[] =3D &quot;/tmp/qemu-fuzz.XXXXXX&quot;;<br>
-=C2=A0 =C2=A0 g_assert_nonnull(g_mkdtemp(tmpdir));<br>
+=C2=A0 =C2=A0 g_autofree char *tmpdir =3D g_dir_make_tmp(&quot;qemu-fuzz.X=
XXXXX&quot;, NULL);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(tmpdir);<br></blockquote><div><br></div><di=
v><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><br></div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0return g_strdup_printf(&quot;-machine q35 -nodefaults &=
quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-device virtio-9p,fsdev=3Dhshare,mount_tag=3Dhsha=
re &quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000aa329905e9943edf--

