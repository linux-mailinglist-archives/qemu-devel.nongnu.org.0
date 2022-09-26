Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E36A5EA77A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:39:37 +0200 (CEST)
Received: from localhost ([::1]:43426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoKd-0002N3-Jg
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco4n-0002cZ-Kq
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:23:15 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:43614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco4g-00039p-Hx
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:23:13 -0400
Received: by mail-lf1-x12a.google.com with SMTP id o2so10778280lfc.10
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=KkMNqeejyfIoKo9ezFJ6KkXf5g5JMlEu5igo07FHaGU=;
 b=PD40itcEtcOMvyqUVIB7zXIED/uH+nhofMZ2Z43Gea2BwdH6PRWvhYgoDorYoYg32V
 ao74zRShOQCvAoRgyqgFPcEp5L4JuPiRKSzj+0UDXucAzuq+oTkLE/lX1sSS/LPihQXT
 8FpX6fIPcxR1OrMLpXY4JvQtpu30+RjtGO0cKyNPCL12S7O6MxmmRGFlALg7JAOhcppH
 4e0BS4gWnB+1zVp6+MkPINxE2gNauDupWAGqK3dchxgruNIbiu07qNvy/y14HVg2XV0S
 JeOYJIUKmnm71EHudsQ0olW6wIUs1d/zbibXSRRad2Q0hILiky4w+2f1tKIsrgUB+GkA
 zBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=KkMNqeejyfIoKo9ezFJ6KkXf5g5JMlEu5igo07FHaGU=;
 b=yohArL6WZC/MbjStaBNVYx2LHj8KtLL1Iw+ZYUSBY9HvxwAIhXQW6FzjNc0W9qRgz2
 6kYxVMwRy3jXHcvmzxS81QcTM0VIGTyThaWOgxcx+DzNlElSbDe6w1Ag6cx3IS0YhCzv
 rpPGHcDwLrUydVljm9eJVamLeygesueeIyzFJOzHJPnbdtJIYpfxms3VGJE6lIvTwlfz
 cMlsdaxdV+RIBQvHa8Czlh0e719Rzo6UiG18ABErl/Ph+7CZrYN6u1sXDRj3ah2sWBIa
 0l8BxJAAl0w/SjxX9jf0PcI9ecgySJYSJRYh//rHtG1QQPgspQOi+AbWHdTea75/XM0W
 exRA==
X-Gm-Message-State: ACrzQf0rzj/jThdydWPz0e50c61WfIfMdwj802c+fBcI/25O5ZoDgM/B
 p6NzyHWByWJMx/wWgv/2Olpk4tZ9PQOGSNcVg3xV7K5Jfk5bvbEP
X-Google-Smtp-Source: AMsMyM5ZtpDpq4MyvTTi/ugSZ+Dk6xbjBvPO7/5h9c5GeHvqt6TftJCJK2mBwKEUmY7LRqVTXIrXT5HpLkgdW8TuYQc=
X-Received: by 2002:a05:6512:201b:b0:497:a29d:25c1 with SMTP id
 a27-20020a056512201b00b00497a29d25c1mr9415653lfb.276.1664198584533; Mon, 26
 Sep 2022 06:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-23-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-23-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:22:53 +0400
Message-ID: <CAJ+F1CJMjgQv4=P10qY6s7ASzaAo-wBp8HtSczaFisMK-Qw0+w@mail.gmail.com>
Subject: Re: [PATCH v3 22/54] tests/unit: test-image-locking: Avoid using
 hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000077867a05e9946d53"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--00000000000077867a05e9946d53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 3:49 PM Bin Meng <bmeng.cn@gmail.com> wrote:

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
>
>  tests/unit/test-image-locking.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/unit/test-image-locking.c
> b/tests/unit/test-image-locking.c
> index ba057bd66c..a47299c247 100644
> --- a/tests/unit/test-image-locking.c
> +++ b/tests/unit/test-image-locking.c
> @@ -76,10 +76,10 @@ static void check_locked_bytes(int fd, uint64_t
> perm_locks,
>  static void test_image_locking_basic(void)
>  {
>      BlockBackend *blk1, *blk2, *blk3;
> -    char img_path[] =3D "/tmp/qtest.XXXXXX";
> +    g_autofree char *img_path =3D NULL;
>      uint64_t perm, shared_perm;
>
> -    int fd =3D mkstemp(img_path);
> +    int fd =3D g_file_open_tmp("qtest.XXXXXX", &img_path, NULL);
>      assert(fd >=3D 0);
>
>      perm =3D BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;
> @@ -117,10 +117,10 @@ static void test_image_locking_basic(void)
>  static void test_set_perm_abort(void)
>  {
>      BlockBackend *blk1, *blk2;
> -    char img_path[] =3D "/tmp/qtest.XXXXXX";
> +    g_autofree char *img_path =3D NULL;
>      uint64_t perm, shared_perm;
>      int r;
> -    int fd =3D mkstemp(img_path);
> +    int fd =3D g_file_open_tmp("qtest.XXXXXX", &img_path, NULL);
>      assert(fd >=3D 0);
>
>      perm =3D BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000077867a05e9946d53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 3:49 PM Bin M=
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
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
<br>
=C2=A0tests/unit/test-image-locking.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/tests/unit/test-image-locking.c b/tests/unit/test-image-lockin=
g.c<br>
index ba057bd66c..a47299c247 100644<br>
--- a/tests/unit/test-image-locking.c<br>
+++ b/tests/unit/test-image-locking.c<br>
@@ -76,10 +76,10 @@ static void check_locked_bytes(int fd, uint64_t perm_lo=
cks,<br>
=C2=A0static void test_image_locking_basic(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0BlockBackend *blk1, *blk2, *blk3;<br>
-=C2=A0 =C2=A0 char img_path[] =3D &quot;/tmp/qtest.XXXXXX&quot;;<br>
+=C2=A0 =C2=A0 g_autofree char *img_path =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t perm, shared_perm;<br>
<br>
-=C2=A0 =C2=A0 int fd =3D mkstemp(img_path);<br>
+=C2=A0 =C2=A0 int fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;im=
g_path, NULL);<br>
=C2=A0 =C2=A0 =C2=A0assert(fd &gt;=3D 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0perm =3D BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;<br>
@@ -117,10 +117,10 @@ static void test_image_locking_basic(void)<br>
=C2=A0static void test_set_perm_abort(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0BlockBackend *blk1, *blk2;<br>
-=C2=A0 =C2=A0 char img_path[] =3D &quot;/tmp/qtest.XXXXXX&quot;;<br>
+=C2=A0 =C2=A0 g_autofree char *img_path =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t perm, shared_perm;<br>
=C2=A0 =C2=A0 =C2=A0int r;<br>
-=C2=A0 =C2=A0 int fd =3D mkstemp(img_path);<br>
+=C2=A0 =C2=A0 int fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;im=
g_path, NULL);<br>
=C2=A0 =C2=A0 =C2=A0assert(fd &gt;=3D 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0perm =3D BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000077867a05e9946d53--

