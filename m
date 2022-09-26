Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC77D5EA7C5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:59:23 +0200 (CEST)
Received: from localhost ([::1]:48852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocodm-0003jD-Qa
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco5f-0003rF-Vl
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:24:08 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:45878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco5d-0003CK-UJ
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:24:07 -0400
Received: by mail-lj1-x22e.google.com with SMTP id c7so7389116ljm.12
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZQTsIT6tMjIcNhpTqL4oVUZ1l3RUEM7uwJRrDjKEKP8=;
 b=KF6tVBzgicNkHl+CCfTbIyF+CIoD7XOsW8utMJMKmM98rLzVDtWYmwYa5wWLn278r2
 iW+EjSm0jsu1sZ4g11iRHAcd59rJDZDYw74XHoPE/ZA+iUnJY6gOejZfDBUEJEQYly0x
 ZEBEb5OrW7UhKh+ynsRSUi8CgP8Uh9bNnsyEzEX1Eqj5MwwblHR+ofvFGMd/+S8Aa1/l
 W40dHOlx3Zv5BoRF5gH1CvsVXZ7EYuYBDBZjAP+RZUW6vG3JMjEO4seJ/3f2RhoxCNs2
 5wRzn7jVhNUXvAPP5SFcd5GURpcZjLzl2YBX2VwK88yiuRMMT/VyS4TocfQ3P2nGGXKj
 xR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZQTsIT6tMjIcNhpTqL4oVUZ1l3RUEM7uwJRrDjKEKP8=;
 b=ECI/C0cK/KroZU3ieBOvoP9j1EExpiUt5BDXHiqY0KwTMJItZqWvOMAawRtYDBSa8r
 C02SRdbuFPL29EDOuL9vVorAwIXJsr7tKxBJIfSMWzKqbcr4hgtGaU6orMASno+mMiof
 TFd0L9I/eY+WeAc8C9q45snuc/SjJzElpDckNlu9grh7vBuwB6gu8m6tJcsrfaDY46zT
 EbRpTPtIitFNLicZFb5ryiy7RyYK6uTTcdJ1mAsOf/eGKrAlkjIFjRoqkdV4nd1czTO4
 e5ACvwwZ0YtuYIbpr0sZFLNy28JN7vBnQMGbZN1ckFh5c063o5Yt3b7lCd0hWPsTy4CP
 gdug==
X-Gm-Message-State: ACrzQf0S0SzIn8y15cuBOfB7JBUmjoC5CCz1R+o09fbmw67Zz017UuKk
 YXRC03C9MtTPpZ9QlgyKncG2+J4TW3AnP27R35rvyd2FzI0ppsyq
X-Google-Smtp-Source: AMsMyM6d5oBuJn2wImnX7PdJCUBqLh77YlbGkgYGnWFSSv/cMX4oiwYQrmdKD2/OvQy1D6yuI8VJ8/49Oe0f9zs0bhk=
X-Received: by 2002:a2e:8917:0:b0:26a:a520:db52 with SMTP id
 d23-20020a2e8917000000b0026aa520db52mr7332571lji.289.1664198644169; Mon, 26
 Sep 2022 06:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-25-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-25-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:23:52 +0400
Message-ID: <CAJ+F1CJK5seBMCmS4fXZRED+4ZBqQDT7gKgg__G2nrf78O0V7g@mail.gmail.com>
Subject: Re: [PATCH v3 24/54] tests: vhost-user-bridge: Avoid using hardcoded
 /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000580d105e994719a"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22e.google.com
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

--0000000000000580d105e994719a
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
>
>  tests/vhost-user-bridge.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
> index 9b1dab2f28..fecdf915e7 100644
> --- a/tests/vhost-user-bridge.c
> +++ b/tests/vhost-user-bridge.c
> @@ -631,7 +631,6 @@ static void *notifier_thread(void *arg)
>  static void
>  vubr_host_notifier_setup(VubrDev *dev)
>  {
> -    char template[] =3D "/tmp/vubr-XXXXXX";
>      pthread_t thread;
>      size_t length;
>      void *addr;
> @@ -639,7 +638,7 @@ vubr_host_notifier_setup(VubrDev *dev)
>
>      length =3D qemu_real_host_page_size() * VHOST_USER_BRIDGE_MAX_QUEUES=
;
>
> -    fd =3D mkstemp(template);
> +    fd =3D g_file_open_tmp("vubr-XXXXXX", NULL, NULL);
>      if (fd < 0) {
>          vubr_die("mkstemp()");
>      }
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000580d105e994719a
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
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
<br>
=C2=A0tests/vhost-user-bridge.c | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c<br>
index 9b1dab2f28..fecdf915e7 100644<br>
--- a/tests/vhost-user-bridge.c<br>
+++ b/tests/vhost-user-bridge.c<br>
@@ -631,7 +631,6 @@ static void *notifier_thread(void *arg)<br>
=C2=A0static void<br>
=C2=A0vubr_host_notifier_setup(VubrDev *dev)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 char template[] =3D &quot;/tmp/vubr-XXXXXX&quot;;<br>
=C2=A0 =C2=A0 =C2=A0pthread_t thread;<br>
=C2=A0 =C2=A0 =C2=A0size_t length;<br>
=C2=A0 =C2=A0 =C2=A0void *addr;<br>
@@ -639,7 +638,7 @@ vubr_host_notifier_setup(VubrDev *dev)<br>
<br>
=C2=A0 =C2=A0 =C2=A0length =3D qemu_real_host_page_size() * VHOST_USER_BRID=
GE_MAX_QUEUES;<br>
<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(template);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;vubr-XXXXXX&quot;, NULL, NULL);=
<br>
=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vubr_die(&quot;mkstemp()&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000580d105e994719a--

