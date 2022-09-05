Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7EC5AD1F8
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:59:55 +0200 (CEST)
Received: from localhost ([::1]:51278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAle-00008K-Vl
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oVAOq-0002zU-V0
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:36:30 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:44826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oVAOp-00024H-1i
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:36:20 -0400
Received: by mail-lj1-x22b.google.com with SMTP id by6so8916102ljb.11
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=SBW1Ibk7LK/fB8dRT8E6MTfaPs3sM3yOQy2mE14A3dA=;
 b=I0Q3N37eNXI8TKUNC/2tYJpLVbYqsosneVAHMUC36d3VnexiYrXHf8KIHea+ZNrBVz
 Yijk8EK6nmDLqF/Y5lYZiWRBE8Gxcty0EBY0PVp21Muomm5Pk4D+NArB9kcB6ohH9Vwa
 9+ZO/FASjaiVSPeThm8/DviX0HO44IDaQAfAigllrnm2W+h29lNc35nt/XBXotcC3s1n
 GVT6/Sv4AEvityNGNDehJ2pBKbtwKOCoEUKBRDYP0Nq3xxrY3aAghawzlieqX6E4dUh6
 iZTESmVGcAzL+r5HCeYY93NoOixnxfKFSx/wVGd+8HlNlw7KWngvJQG5Rc1Ct89T8nuH
 ToCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=SBW1Ibk7LK/fB8dRT8E6MTfaPs3sM3yOQy2mE14A3dA=;
 b=J6SDi1LqZKbIxzkj3vmyGcdGHKvtaE004Km0SIXSNiKItHS8nOKE/kugdZOtKCRhqA
 F4UBuzIszqKm6sZ6NN7E6xMp7tfp93a4Q+pt3K2p/NbZR94N4/pXHgLHQgXIg+lbr0h3
 gSZnis/DrbHS5PgO+U26m/C9JaI2kfU3oNeu6aTaiGNjSne0iAizcSH1Nsl2j3uv418/
 CD1ZlrHpvRQfchshzcqIobeTIGFpqW8549NpGIbRpciIOnR0zxJneO5ThxoQtD9y97LS
 A+fdFGaLbEZeR8nx3PYw7ETYi+bhlIgImDjDHYF5UPOxJ9Hj94VoEwwvogeSfUgN55G4
 yWlg==
X-Gm-Message-State: ACgBeo3Sb5dLxD2UN35ftbDWbuGKjoN0Ovbg+gGsxDHn4bQPyvQnjTvE
 i6CKSotiKizer0+VbOrCGUacJu0sbaNjWc6ND0w=
X-Google-Smtp-Source: AA6agR7fKSH5vNsin/4biJjhNOWCxUs3T2magj2e/xIFt//5IEV2AmWANDRK4FvyakLVYHR0E0Vg8GGnOkA739ZwCZI=
X-Received: by 2002:a2e:9915:0:b0:26a:6213:3567 with SMTP id
 v21-20020a2e9915000000b0026a62133567mr1269439lji.289.1662377777086; Mon, 05
 Sep 2022 04:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220905110151.32225-1-pbonzini@redhat.com>
In-Reply-To: <20220905110151.32225-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 5 Sep 2022 15:36:05 +0400
Message-ID: <CAJ+F1CKdHhZA8Lc_j85B4EzqHNoCvsejLZUP36GWzH=_1uAiEQ@mail.gmail.com>
Subject: Re: [PATCH] tests: test-qga: close socket on failure to connect
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e2c75505e7ec7c94"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
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

--000000000000e2c75505e7ec7c94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Sep 5, 2022 at 3:27 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Reported by Coverity as CID 1432543.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/unit/test-qga.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
> index a05a4628ed..d27ff94d13 100644
> --- a/tests/unit/test-qga.c
> +++ b/tests/unit/test-qga.c
> @@ -32,6 +32,7 @@ static int connect_qga(char *path)
>              g_usleep(G_USEC_PER_SEC);
>          }
>          if (i++ =3D=3D 10) {
> +            close(s);
>

We may want to be a bit safer and use g_close(), which handles EINTR too.
Anyway

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


>              return -1;
>          }
>      } while (ret =3D=3D -1);
> --
> 2.37.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e2c75505e7ec7c94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 5, 2022 at 3:27 PM Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Rep=
orted by Coverity as CID 1432543.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/unit/test-qga.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c<br>
index a05a4628ed..d27ff94d13 100644<br>
--- a/tests/unit/test-qga.c<br>
+++ b/tests/unit/test-qga.c<br>
@@ -32,6 +32,7 @@ static int connect_qga(char *path)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_usleep(G_USEC_PER_SEC);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i++ =3D=3D 10) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(s);<br></blockquote><div><=
br></div><div>We may want to be a bit safer and use g_close(), which handle=
s EINTR too. Anyway<br></div><div><br></div><div>Reviewed-by: Marc-Andr=C3=
=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lur=
eau@redhat.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} while (ret =3D=3D -1);<br>
-- <br>
2.37.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e2c75505e7ec7c94--

