Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E835A96ED
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:31:37 +0200 (CEST)
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTjM2-0007K7-Gu
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTico-0007Xo-65; Thu, 01 Sep 2022 07:44:51 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:39529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTicl-0000XZ-Bn; Thu, 01 Sep 2022 07:44:45 -0400
Received: by mail-lj1-x22d.google.com with SMTP id bn9so17576980ljb.6;
 Thu, 01 Sep 2022 04:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=g/aIzI+GnRYsT9J3xhVYtxUQAaj8WEFfhS3yV7LCLU4=;
 b=JLkgcKufyI5t6GropYGPN47qd3ed50TkEp3+uw+ilc89HR3FmrSWTRbH0jWfYQIdA7
 tj1Pk16ecfuxqHPgTeaMdmMimbvFUmUVHvobt0tP0lN3xoIs5uKonvnJYo/c/hKXaOtJ
 EiuYx97DHmn1GVkJ7LaoitwzmQvw2qw99289hbkfrGq40etmEJO7W8tp+hTUR3WdYrA8
 K1OEVYzJ++APWa2LJwoGztLl7rJrls/12a/zOCOV7AUeRra4mczIHEv32cSwkEUmySh/
 8+loqGF1NUGqYliq0NeNR9a9kHv3V99PnQJ9SHkDF8eYDL68bLR7LgPN6xWetlejl0dh
 Y54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=g/aIzI+GnRYsT9J3xhVYtxUQAaj8WEFfhS3yV7LCLU4=;
 b=45afum4wzu9fgShh7SC2CQ+9fxc/v+2FzeXzEZ42FHfyA5yTAq/s7tfE7BbuR3st0z
 H5BuliSvwGqL4mKkYxU/gXWT6O/uTGVTeoVDktZpzvqv5ogQ1M/eE6+3KTbq3YyVdulL
 cF4c86QBFb0dx/aONoHMPHhqBiQaEqHV4Yk9pcaajFTrmzCW+/7CBDhdHwYNPRUrKi9E
 Ywj8UykzBEPwCB0JsyEMk1WtfpQmmi6PRT0ruaAjaR/03toi8zxbXdg9UaSSKLCcLo+7
 IPl4LUgRy/9rECh/DZUiPrsyQRhrcZTk1SHCr0ErDaNV58RKTh31RmZhS0LkHg8HWoId
 WuCA==
X-Gm-Message-State: ACgBeo3HMFcHcZ/LO9ILZ3/x0LDvpRiBdh0ld5pWfcR1n5G4CCg3hdRG
 zIETla7vWvpmj2iwRmggRZuYu8I9xqa2UKE1+jk=
X-Google-Smtp-Source: AA6agR5UoTTTaWDjJkJCB3lLaMGkQshf77bmVxYN+uuFyFF2kE4qc0OaQLN57TyG9cuH7MHmw9DNntFO58X0YlOxX48=
X-Received: by 2002:a2e:596:0:b0:264:1a1e:469b with SMTP id
 144-20020a2e0596000000b002641a1e469bmr5847560ljf.463.1662032679673; Thu, 01
 Sep 2022 04:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-45-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-45-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Sep 2022 15:44:28 +0400
Message-ID: <CAJ+F1CLD0P+neLMxD1hZuVkpR0TafNCY0y+rVrTsQvC=XNFhTQ@mail.gmail.com>
Subject: Re: [PATCH 44/51] tests/qtest: microbit-test: Fix socket access for
 win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Joel Stanley <joel@jms.id.au>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000007a23d505e79c23d5"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22d.google.com
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

--0000000000007a23d505e79c23d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 3:27 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Sockets on Windows do not use *nix-style file descriptors, so
> write()/read()/close() do not work on Windows.
>
> Switch over to use send()/recv()/closesocket() which work with
> sockets on all platforms.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  tests/qtest/microbit-test.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tests/qtest/microbit-test.c b/tests/qtest/microbit-test.c
> index b71daae9a9..4bc267020b 100644
> --- a/tests/qtest/microbit-test.c
> +++ b/tests/qtest/microbit-test.c
> @@ -51,7 +51,7 @@ static void uart_rw_to_rxd(QTestState *qts, int sock_fd=
,
> const char *in,
>  {
>      int i, in_len =3D strlen(in);
>
> -    g_assert_true(write(sock_fd, in, in_len) =3D=3D in_len);
> +    g_assert_true(send(sock_fd, in, in_len, 0) =3D=3D in_len);
>      for (i =3D 0; i < in_len; i++) {
>          g_assert_true(uart_wait_for_event(qts, NRF51_UART_BASE +
>                                                 A_UART_RXDRDY));
> @@ -77,7 +77,7 @@ static void test_nrf51_uart(void)
>      char s[10];
>      QTestState *qts =3D qtest_init_with_serial("-M microbit", &sock_fd);
>
> -    g_assert_true(write(sock_fd, "c", 1) =3D=3D 1);
> +    g_assert_true(send(sock_fd, "c", 1, 0) =3D=3D 1);
>      g_assert_cmphex(qtest_readl(qts, NRF51_UART_BASE + A_UART_RXD), =3D=
=3D,
> 0x00);
>
>      qtest_writel(qts, NRF51_UART_BASE + A_UART_ENABLE, 0x04);
> @@ -97,17 +97,17 @@ static void test_nrf51_uart(void)
>
>      qtest_writel(qts, NRF51_UART_BASE + A_UART_STARTTX, 0x01);
>      uart_w_to_txd(qts, "d");
> -    g_assert_true(read(sock_fd, s, 10) =3D=3D 1);
> +    g_assert_true(recv(sock_fd, s, 10, 0) =3D=3D 1);
>      g_assert_cmphex(s[0], =3D=3D, 'd');
>
>      qtest_writel(qts, NRF51_UART_BASE + A_UART_SUSPEND, 0x01);
>      qtest_writel(qts, NRF51_UART_BASE + A_UART_TXD, 'h');
>      qtest_writel(qts, NRF51_UART_BASE + A_UART_STARTTX, 0x01);
>      uart_w_to_txd(qts, "world");
> -    g_assert_true(read(sock_fd, s, 10) =3D=3D 5);
> +    g_assert_true(recv(sock_fd, s, 10, 0) =3D=3D 5);
>      g_assert_true(memcmp(s, "world", 5) =3D=3D 0);
>
> -    close(sock_fd);
> +    closesocket(sock_fd);
>
>      qtest_quit(qts);
>  }
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007a23d505e79c23d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 3:27 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
Sockets on Windows do not use *nix-style file descriptors, so<br>
write()/read()/close() do not work on Windows.<br>
<br>
Switch over to use send()/recv()/closesocket() which work with<br>
sockets on all platforms.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
=C2=A0tests/qtest/microbit-test.c | 10 +++++-----<br>
=C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/tests/qtest/microbit-test.c b/tests/qtest/microbit-test.c<br>
index b71daae9a9..4bc267020b 100644<br>
--- a/tests/qtest/microbit-test.c<br>
+++ b/tests/qtest/microbit-test.c<br>
@@ -51,7 +51,7 @@ static void uart_rw_to_rxd(QTestState *qts, int sock_fd, =
const char *in,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i, in_len =3D strlen(in);<br>
<br>
-=C2=A0 =C2=A0 g_assert_true(write(sock_fd, in, in_len) =3D=3D in_len);<br>
+=C2=A0 =C2=A0 g_assert_true(send(sock_fd, in, in_len, 0) =3D=3D in_len);<b=
r>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; in_len; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_true(uart_wait_for_event(qts, NR=
F51_UART_BASE +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 A_UART_RXDRDY));<br>
@@ -77,7 +77,7 @@ static void test_nrf51_uart(void)<br>
=C2=A0 =C2=A0 =C2=A0char s[10];<br>
=C2=A0 =C2=A0 =C2=A0QTestState *qts =3D qtest_init_with_serial(&quot;-M mic=
robit&quot;, &amp;sock_fd);<br>
<br>
-=C2=A0 =C2=A0 g_assert_true(write(sock_fd, &quot;c&quot;, 1) =3D=3D 1);<br=
>
+=C2=A0 =C2=A0 g_assert_true(send(sock_fd, &quot;c&quot;, 1, 0) =3D=3D 1);<=
br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmphex(qtest_readl(qts, NRF51_UART_BASE + A_UA=
RT_RXD), =3D=3D, 0x00);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qtest_writel(qts, NRF51_UART_BASE + A_UART_ENABLE, 0x04=
);<br>
@@ -97,17 +97,17 @@ static void test_nrf51_uart(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qtest_writel(qts, NRF51_UART_BASE + A_UART_STARTTX, 0x0=
1);<br>
=C2=A0 =C2=A0 =C2=A0uart_w_to_txd(qts, &quot;d&quot;);<br>
-=C2=A0 =C2=A0 g_assert_true(read(sock_fd, s, 10) =3D=3D 1);<br>
+=C2=A0 =C2=A0 g_assert_true(recv(sock_fd, s, 10, 0) =3D=3D 1);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmphex(s[0], =3D=3D, &#39;d&#39;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qtest_writel(qts, NRF51_UART_BASE + A_UART_SUSPEND, 0x0=
1);<br>
=C2=A0 =C2=A0 =C2=A0qtest_writel(qts, NRF51_UART_BASE + A_UART_TXD, &#39;h&=
#39;);<br>
=C2=A0 =C2=A0 =C2=A0qtest_writel(qts, NRF51_UART_BASE + A_UART_STARTTX, 0x0=
1);<br>
=C2=A0 =C2=A0 =C2=A0uart_w_to_txd(qts, &quot;world&quot;);<br>
-=C2=A0 =C2=A0 g_assert_true(read(sock_fd, s, 10) =3D=3D 5);<br>
+=C2=A0 =C2=A0 g_assert_true(recv(sock_fd, s, 10, 0) =3D=3D 5);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_true(memcmp(s, &quot;world&quot;, 5) =3D=3D 0)=
;<br>
<br>
-=C2=A0 =C2=A0 close(sock_fd);<br>
+=C2=A0 =C2=A0 closesocket(sock_fd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qtest_quit(qts);<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007a23d505e79c23d5--

