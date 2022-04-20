Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1B2508314
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 10:01:50 +0200 (CEST)
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh5HZ-0005hV-Ux
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 04:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nh5DR-0003ju-AH
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 03:57:33 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:46978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nh5DP-0007yB-N9
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 03:57:33 -0400
Received: by mail-qv1-xf29.google.com with SMTP id i14so766837qvk.13
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 00:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z7iuu7pW2X4AEdyCfJGjp2dzq5kElJItV2JdztRekSM=;
 b=cpp7goO8OOoJk24GEg3YgtATwH144gdIEERSJm7TWzvWaEZKmwUzdpHWxG/OeQGuLI
 /pZmQTly0aPzyzTpe9Slqm1js4mo8pTrMX9g9sCYHT90PKAWevxkDyQo/UQzRFWjGFlY
 jMiGZtH4IbhdiQBtkoVrgWz3qxzUZBMvqdQxGcPUFGUWaMMm5keaRVmbtnOJMBu7zsDN
 hFmCCMgdqFHirUN2lUdfpFwOiUp5SC1R+bN+d+qIRoRSXsXXsDdcSFyodQeb6PPcArmp
 uDFxowEmfvnOiQ1J9wJKdShKL7qwQ2XhCK6oPdH61OPWnNfGNA41wm5fcDMNT06LUvGG
 /TTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z7iuu7pW2X4AEdyCfJGjp2dzq5kElJItV2JdztRekSM=;
 b=Rk7UCC7GDXfhDIbu+0881GAQ8cSRI01s4+oPrv2IvmVZs2lQH7/RXFaCnvie7LsqK3
 NpbJ+9UuzjatcFyoUwXeTTizAkBQuvxeKx/QZp1l1N10C46aS71gM6fgt9OHU37oSTWS
 C9bAPQjt0C43kDjwIGbuF66OOXHS7mHgNclFl4lEjFNZE2hVE2um2N9SZC3F9GhuPhG7
 kiiZvzfg1H3LGLFe6K6kq+mooon23z0ttvv9SSiB1fzj9QFH/BMBn2cyVYgOuNLVL+cJ
 B/2/b8MHopVTdV96n6xhML1jiy+zuREI0SKB/nsndEqNzzJ+fXSqSQmlMJF6E4HRYD/b
 3TAg==
X-Gm-Message-State: AOAM532F4EI15VK16QxMHccFeO1LnUxt3er3CoPaK4AcRa4WHe3MX80d
 IxVdxv/sZnfwgS+qO57trJvEb/fhPTNoi3cZsCI=
X-Google-Smtp-Source: ABdhPJzUyfxy3IAtHY4SsSQ+VydNTu92zJ7duYbTwIwgKT+9Hp2c7ZvUnJ1s8IU0rdJ9U1irOh9t2uoW2IB7kdIHazg=
X-Received: by 2002:a05:6214:258e:b0:44b:76d7:b10c with SMTP id
 fq14-20020a056214258e00b0044b76d7b10cmr217031qvb.8.1650441450462; Wed, 20 Apr
 2022 00:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-32-marcandre.lureau@redhat.com>
 <a5f8ae01-d1e2-2a99-e9ca-d0e5414f8674@redhat.com>
In-Reply-To: <a5f8ae01-d1e2-2a99-e9ca-d0e5414f8674@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 11:57:19 +0400
Message-ID: <CAJ+F1CL9m6WR_yp8Dw87jGi4CcFCOm7+hx9mAsyHcmR0kKF8eQ@mail.gmail.com>
Subject: Re: [PATCH 31/32] RFC: Simplify softmmu/main.c
To: Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000060a04805dd1158b9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf29.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000060a04805dd1158b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Mar 24, 2022 at 11:52 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 3/23/22 16:57, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau<marcandre.lureau@redhat.com>
> >
> > Move qemu_main() declaration to a new header.
> >
> > Simplify main.c since both cocoa & sdl cannot be enabled together.
> >
> > (there might be some small conflict with the RFC patch "cocoa: run
> qemu_init
> > in the main thread", but the two look like they could be used together
> > to improve the code)
>
> That patch enables cocoa and SDL to be in the same binary, so I think
> this one (while a good idea in theory) should be the one that loses.
>
> Akihiko has ideas on how to use the standard main() for Cocoa, by
> turning qemu_main_loop() into a function pointer, like
>
> -void qemu_main_loop()
> +static void (*qemu_main_loop)(void) =3D qemu_default_main_loop;
> +void qemu_default_main_loop()
>   {
>       ...
>   }
>
> and cocoa_display_init() would do "qemu_main_loop =3D qemu_cocoa_main_loo=
p;".
>
>
Akihiko, do you have a patch ? Since you have reviewed this patch already,
are you willing to rebase on top of this one?

thanks

--=20
Marc-Andr=C3=A9 Lureau

--00000000000060a04805dd1158b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 24, 2022 at 11:52 =
AM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 3/23/22 16:57, <a href=3D"mailto:marcandre.lureau@redhat.com" target=
=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau&lt;<a href=3D"mailto:marcandre.lureau@red=
hat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Move qemu_main() declaration to a new header.<br>
&gt; <br>
&gt; Simplify main.c since both cocoa &amp; sdl cannot be enabled together.=
<br>
&gt; <br>
&gt; (there might be some small conflict with the RFC patch &quot;cocoa: ru=
n qemu_init<br>
&gt; in the main thread&quot;, but the two look like they could be used tog=
ether<br>
&gt; to improve the code)<br>
<br>
That patch enables cocoa and SDL to be in the same binary, so I think <br>
this one (while a good idea in theory) should be the one that loses.<br>
<br>
Akihiko has ideas on how to use the standard main() for Cocoa, by <br>
turning qemu_main_loop() into a function pointer, like<br>
<br>
-void qemu_main_loop()<br>
+static void (*qemu_main_loop)(void) =3D qemu_default_main_loop;<br>
+void qemu_default_main_loop()<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 }<br>
<br>
and cocoa_display_init() would do &quot;qemu_main_loop =3D qemu_cocoa_main_=
loop;&quot;.<br>
<br></blockquote><div><br></div><div>Akihiko, do you have a patch ? Since y=
ou have reviewed this patch already, are you willing to rebase on top of th=
is one?<br></div></div><br clear=3D"all"></div><div>thanks</div><div><br></=
div><div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 =
Lureau<br></div></div></div>

--00000000000060a04805dd1158b9--

