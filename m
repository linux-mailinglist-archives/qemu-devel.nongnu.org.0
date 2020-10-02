Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7C4281909
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 19:19:31 +0200 (CEST)
Received: from localhost ([::1]:52192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOOiQ-0001yn-7q
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 13:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kOOfq-000740-95; Fri, 02 Oct 2020 13:16:50 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:35805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kOOfo-00016V-GO; Fri, 02 Oct 2020 13:16:49 -0400
Received: by mail-ej1-x644.google.com with SMTP id u21so3017145eja.2;
 Fri, 02 Oct 2020 10:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cMa4HcF1qD//+Q9EjGI9OvrlBKY3nCOhDzrnwd/FzsE=;
 b=n8cYeEqJKgL6sbxEcNG7CePo8fkSjgEMjjdRn3UZBJuWOlaz5Ivsf0k7pMyIJxtGwr
 /KbKVqcPsD4+cQ5G3kwZ/wIBn7VLnZasFKqmC+EI4UuAuw7h4Z8SUYOROE0ZJg3I+McY
 1TXT7Vlk/w5hP2F868VY0pf6M0koYoWhbmuPO5Bzc5CHSWtqa9jh5XUmXl2KaHfzUoO3
 rxtoAw1Dmg8pai6l3ruNqYSZWzBFBqtW8srQr8Yfwexp1IP1h/L+l4YxRqM4vgwwUNF7
 7wuUyVAqOJAGcdenW8qqLhb/CUfHgEYKfJqkq6GOu6Gb5Y9UScm+CqkClgZywHz8ZKDX
 s/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cMa4HcF1qD//+Q9EjGI9OvrlBKY3nCOhDzrnwd/FzsE=;
 b=pshnZFK+SKl0OV+nObXiTrX0XQl70ll2stqyMofLgTQsKnPGiMnIrq1YIUv6F/HbX0
 WaextI6bClFEHp0b47FGtGrm2+Poyr1A8fYKZ7Zhy7G3jWEQE+zm5N62YP8r8Ht2MNIm
 NBam0QZFacey1mNn7nr8Bdo5tV3nJqcD9Iaq/3tuH0orGZdlxKoUDR4InIcnqI200HDm
 itOUli1QYZlTPBchn5EB62UGMR6HY+VP4VkYk0T7xTGSQmBwb7w58ZMhYl0xvghSgiSV
 kiRq1Pct29xY/zCNko38q6jau5oSb0ByfTPr8IQ6jXE5FLOSwXyIA4SlZWS6L6Wbnul4
 m0Rg==
X-Gm-Message-State: AOAM530YsSlTAFlpLVOG2KTELbM30sQnD7eOcdbOex9QH/IN99xbFJkI
 VFoDPQV4pKX5pF7BhYqRsxiT24nA2ARjruBftuQ=
X-Google-Smtp-Source: ABdhPJxYGKhhbzWJOV0ffHoKRoFj/lEMArKkN8rAx/M/ThGx2PMwmeAhwKd1FfLws+tZpmvK4NUyFJVITssvQWp0Ums=
X-Received: by 2002:a17:906:a88a:: with SMTP id
 ha10mr3505350ejb.532.1601659006094; 
 Fri, 02 Oct 2020 10:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201002171343.283426-1-thuth@redhat.com>
In-Reply-To: <20201002171343.283426-1-thuth@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 2 Oct 2020 21:16:34 +0400
Message-ID: <CAJ+F1CKzAR3s+1W6BZHNVV531N7RY4NMDPo86+69rxmDWna7zQ@mail.gmail.com>
Subject: Re: [PATCH] tests/test-char: Use a proper fallthrough comment
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001c10af05b0b34c1b"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu trival <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001c10af05b0b34c1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2020 at 9:14 PM Thomas Huth <thuth@redhat.com> wrote:

> For being able to compile with -Werror=3Dimplicit-fallthrough we need
> to use comments that the compiler recognizes. Use "fallthrough" instead
> of "no break" here.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  tests/test-char.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/test-char.c b/tests/test-char.c
> index d35cc839bc..9196e566e9 100644
> --- a/tests/test-char.c
> +++ b/tests/test-char.c
> @@ -70,7 +70,7 @@ static void fe_event(void *opaque, QEMUChrEvent event)
>              h->openclose_mismatch =3D true;
>          }
>          h->is_open =3D new_open_state;
> -        /* no break */
> +        /* fallthrough */
>      default:
>          quit =3D true;
>          break;
> --
> 2.18.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001c10af05b0b34c1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 2, 2020 at 9:14 PM Thomas=
 Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">For being abl=
e to compile with -Werror=3Dimplicit-fallthrough we need<br>
to use comments that the compiler recognizes. Use &quot;fallthrough&quot; i=
nstead<br>
of &quot;no break&quot; here.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Re=
viewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/test-char.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/tests/test-char.c b/tests/test-char.c<br>
index d35cc839bc..9196e566e9 100644<br>
--- a/tests/test-char.c<br>
+++ b/tests/test-char.c<br>
@@ -70,7 +70,7 @@ static void fe_event(void *opaque, QEMUChrEvent event)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h-&gt;openclose_mismatch =
=3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h-&gt;is_open =3D new_open_state;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* no break */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fallthrough */<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0quit =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-- <br>
2.18.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000001c10af05b0b34c1b--

