Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECCE57D38B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 20:44:56 +0200 (CEST)
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEbAN-00071J-Qv
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 14:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1oEb9F-0005TF-8v
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 14:43:45 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1oEb9D-0003C7-MW
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 14:43:45 -0400
Received: by mail-ej1-x62d.google.com with SMTP id mf4so4700971ejc.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 11:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KJGFonokiIgul564QGpILiM71KhZjv8G0jbDcrZyBM8=;
 b=poqbciA+KV3SttywQMLXhTpwSk37W1Xp2/HlyneKISNeJe3tfMBwAJxld7g/xKaETA
 KbU4AZB/CFmYt+ndb5ucOrfzAgtnDHIVesWRoRGCAYVYDJacvk+iKvDLDfclQ1Lk+dvA
 ME03wcR9xir7OLNfhOMpFTmirSZZzg46QgS+fco2oWGta+PfmcP9XJlH7zIlcZ6w8E2O
 T+qgkB4WJpIyEWTyNNG9LNpoRhsxNGQzQG4V9K2w7onueLlPkcBMlmO00ZGzIk1MQXRJ
 wgRf7/14uaN3GL9KOHNIPmQqvO8S8QrTZn7/CnhO+y7YzyiKOFrons1tfauftRn2sAPI
 iW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KJGFonokiIgul564QGpILiM71KhZjv8G0jbDcrZyBM8=;
 b=h1+XYi4MFI7zCWDlayh4PBDm2Vrx6cREaJtpKLsUlUpGCf/YQjHYr24Cw2qcWNVZvZ
 oMa+sSZQpobEFMeFbgEhjHQ6Cz5bMmvVkyYuPjWEnD0aWM49tCvrOPfA6Q8kKr03nJV2
 sBONCI3o7yxcgxOPnTJKEXPF17vH256Xh8mV0gPsli6TljExG/+O445IUuFJ4GGd8C+x
 02EpBVc45ELN5Y63hNnW4XdYsuumvnKfbra7VlJBgQIYgTUrX+8h/5fDK8vM2Fu+PNBN
 M/IRW1kext0dlQM8LJq80qFvBQwUIuQv1YuDI2MssxCqP0nmIndHt3ALOtt4vbbVboIo
 tR2A==
X-Gm-Message-State: AJIora/700XDFRykjh2gj9M0iERADHgNgh1Nw9Ppaw1Dm63XXtlXtwg9
 /1f1EdDqdFJPrX0K3bO7eUXuapJUXFMZhbt1Zyc=
X-Google-Smtp-Source: AGRyM1tkNZAs4SfnIX1eBnmSHLFSkYOdw+iybMrELMw9P5RNUGEeRMz4KpNNcZT3X5ZM9o7j1+FGMHRrCzHnudABIH8=
X-Received: by 2002:a17:907:7396:b0:72d:a080:86a9 with SMTP id
 er22-20020a170907739600b0072da08086a9mr39238350ejc.49.1658429021471; Thu, 21
 Jul 2022 11:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220719122334.136290-1-Jason@zx2c4.com>
 <CAJy5ezq7_F6uDrY6RuXe5ru0mAbmx-pBTQoFCtZj4DhEM7EZpw@mail.gmail.com>
 <CAHmME9opYzwtK4oJo1bZo+9FDbXt6TfgybtFTfQpxqx6pOoGWA@mail.gmail.com>
In-Reply-To: <CAHmME9opYzwtK4oJo1bZo+9FDbXt6TfgybtFTfQpxqx6pOoGWA@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 21 Jul 2022 20:43:29 +0200
Message-ID: <CAJy5ezp-x2R=4yg=S6Tq2U67N8J2mkXNJ=wkv1oqB3r37hiunQ@mail.gmail.com>
Subject: Re: [PATCH] hw/microblaze: pass random seed to fdt
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b5c62905e4551882"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ej1-x62d.google.com
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

--000000000000b5c62905e4551882
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 21, 2022, 6:44 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hey Edgar,
>
> On Wed, Jul 20, 2022 at 9:13 AM Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> >
> > On Tue, Jul 19, 2022 at 2:23 PM Jason A. Donenfeld <Jason@zx2c4.com>
> wrote:
> >>
> >> If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
> >> initialize early. Set this using the usual guest random number
> >> generation function. This FDT node is part of the DT specification.
> >
> >
> > Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>
> Thanks for looking at this. Paolo (CC'd) just sent a few similar
> changes for different archs in a pull, but not this one, on the
> supposition that you'd roll this into your next pull. If this isn't
> the case, please pipe up so Paolo can take it instead later.
>
> Jason
>


Ah OK, Paolo, it would be great if you would take this via your tree!

Thanks,
Edgar

>

--000000000000b5c62905e4551882
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Jul 21, 2022, 6:44 PM Jason A. Donenfeld &lt;<=
a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Hey Edgar,<br>
<br>
On Wed, Jul 20, 2022 at 9:13 AM Edgar E. Iglesias<br>
&lt;<a href=3D"mailto:edgar.iglesias@gmail.com" target=3D"_blank" rel=3D"no=
referrer">edgar.iglesias@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Jul 19, 2022 at 2:23 PM Jason A. Donenfeld &lt;<a href=3D"mail=
to:Jason@zx2c4.com" target=3D"_blank" rel=3D"noreferrer">Jason@zx2c4.com</a=
>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; If the FDT contains /chosen/rng-seed, then the Linux RNG will use =
it to<br>
&gt;&gt; initialize early. Set this using the usual guest random number<br>
&gt;&gt; generation function. This FDT node is part of the DT specification=
.<br>
&gt;<br>
&gt;<br>
&gt; Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@am=
d.com" target=3D"_blank" rel=3D"noreferrer">edgar.iglesias@amd.com</a>&gt;<=
br>
<br>
Thanks for looking at this. Paolo (CC&#39;d) just sent a few similar<br>
changes for different archs in a pull, but not this one, on the<br>
supposition that you&#39;d roll this into your next pull. If this isn&#39;t=
<br>
the case, please pipe up so Paolo can take it instead later.<br>
<br>
Jason<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Ah OK, Paolo, it would be great if you wou=
ld take this via your tree!=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto">Edgar</div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000b5c62905e4551882--

