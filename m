Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886F34DB7CF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 19:14:42 +0100 (CET)
Received: from localhost ([::1]:48686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUYAT-0004gZ-D0
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 14:14:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nUY9I-0003IH-5c
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 14:13:28 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:34564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nUY9G-0002zB-HA
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 14:13:27 -0400
Received: by mail-vs1-f49.google.com with SMTP id v62so3116414vsv.1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 11:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8wDFW3WPEMMD/DBZmFIy6ka0pXvr30h8DchqX1+INWE=;
 b=OBLcfPPd9fvfNSCaHhcPDeHML4N3w3cEMhJ0RScnoBKbFQFGi4ehB/ike5/Vt4RmxD
 zGwFmhMrlzCQqbe4b0NcaqbTrmD3a38qEBLZPhdtm6s4/bKv8P0VJztDl8GptxdVizI3
 Qizi2P9tiMRDcnWirZ+tWTNF+jnGf8hGXTq4nGX09IuaqihoCVb8TxS+0Hni0bqKSFA1
 JwdKjUgPORWkUgF7OO//9r7dJC9lUfl2KawOpRPtbVSRjKQUC1hx5IVGABR2RjX8ZwQn
 SJ9gB1dhkhQkjgjhBdrdARUcefmv1YQg1pc2orXkgn9pAIMJF3bJfVmXsjq0A4eMJJSD
 AdnA==
X-Gm-Message-State: AOAM530mepZAUAmz1VbnvHZ7c+WlnAPtDHMP2J4cmEaq0dIPMkCV24gY
 dCmEptoto8iNgIelfLl/+K8v3LNzvrcvWQ==
X-Google-Smtp-Source: ABdhPJwjsBJdjm1W2O7EuqTt7dExIT8ITFst0qr1McoHZmX5Q+9M86Qr1qD6pg9Bx1eea+n0rg5Ipw==
X-Received: by 2002:a67:ef41:0:b0:320:9ac5:b5b0 with SMTP id
 k1-20020a67ef41000000b003209ac5b5b0mr500379vsr.45.1647454405211; 
 Wed, 16 Mar 2022 11:13:25 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com.
 [209.85.221.171]) by smtp.gmail.com with ESMTPSA id
 c62-20020a1f4e41000000b0033e7de85c7esm13859vkb.49.2022.03.16.11.13.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 11:13:24 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id q64so1643327vkb.6
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 11:13:24 -0700 (PDT)
X-Received: by 2002:a05:6122:134b:b0:337:bfb0:4ec7 with SMTP id
 f11-20020a056122134b00b00337bfb04ec7mr333932vkp.10.1647454404512; Wed, 16 Mar
 2022 11:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220316124012.1413954-1-cmuellner@linux.com>
 <87sfri2b76.fsf@linaro.org>
In-Reply-To: <87sfri2b76.fsf@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <cmuellner@linux.com>
Date: Wed, 16 Mar 2022 19:13:13 +0100
X-Gmail-Original-Message-ID: <CAHB2gtTtAcL+cZfsiGKSY28LJ13V2Su=PYTjJnBAWuukitPC5A@mail.gmail.com>
Message-ID: <CAHB2gtTtAcL+cZfsiGKSY28LJ13V2Su=PYTjJnBAWuukitPC5A@mail.gmail.com>
Subject: Re: [PATCH] docs/tcg-plugins: document QEMU_PLUGIN behaviour
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009091d105da59dee4"
Received-SPF: pass client-ip=209.85.217.49;
 envelope-from=christophm30@gmail.com; helo=mail-vs1-f49.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009091d105da59dee4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022 at 4:01 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Christoph Muellner <cmuellner@linux.com> writes:
>
> > QEMU plugins can be loaded via command line arguments or via
> > the QEMU_PLUGIN environment variable. Currently, only the first method
> > is documented. Let's document QEMU_PLUGIN.
> >
> > Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> > ---
> >  docs/devel/tcg-plugins.rst | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> > index f93ef4fe52..ba48be18d0 100644
> > --- a/docs/devel/tcg-plugins.rst
> > +++ b/docs/devel/tcg-plugins.rst
> > @@ -34,6 +34,10 @@ Arguments are plugin specific and can be used to
> modify their
> >  behaviour. In this case the howvec plugin is being asked to use inline
> >  ops to count and break down the hint instructions by type.
> >
> > +QEMU also evaluates the environment variable ``QEMU_PLUGIN``::
>
> You should also make it clear this only works for *-user builds of QEMU.
> For system emulation you still need to use the CLI interface.


Looks like this is even more restrictive as I can see support only in
linux-user/main.c.
I'll reword this to only be available for Linux user-mode emulation.

Thanks!


>
>
> > +
> > +  QEMU_PLUGIN=3D"file=3Dtests/plugin/libhowec.so,inline=3Don,count=3Dh=
int" $QEMU
> > +
> >  Writing plugins
> >  ---------------
>
>
> --
> Alex Benn=C3=A9e
>

--0000000000009091d105da59dee4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 16, 2022 at 4:01 PM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Christoph Muellner &lt;<a href=3D"mailto:cmuellner@linux.com" target=3D"_bl=
ank">cmuellner@linux.com</a>&gt; writes:<br>
<br>
&gt; QEMU plugins can be loaded via command line arguments or via<br>
&gt; the QEMU_PLUGIN environment variable. Currently, only the first method=
<br>
&gt; is documented. Let&#39;s document QEMU_PLUGIN.<br>
&gt;<br>
&gt; Signed-off-by: Christoph Muellner &lt;<a href=3D"mailto:cmuellner@linu=
x.com" target=3D"_blank">cmuellner@linux.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/devel/tcg-plugins.rst | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst<b=
r>
&gt; index f93ef4fe52..ba48be18d0 100644<br>
&gt; --- a/docs/devel/tcg-plugins.rst<br>
&gt; +++ b/docs/devel/tcg-plugins.rst<br>
&gt; @@ -34,6 +34,10 @@ Arguments are plugin specific and can be used to mo=
dify their<br>
&gt;=C2=A0 behaviour. In this case the howvec plugin is being asked to use =
inline<br>
&gt;=C2=A0 ops to count and break down the hint instructions by type.<br>
&gt;=C2=A0 <br>
&gt; +QEMU also evaluates the environment variable ``QEMU_PLUGIN``::<br>
<br>
You should also make it clear this only works for *-user builds of QEMU.<br=
>
For system emulation you still need to use the CLI interface.</blockquote><=
div><br></div><div>Looks like this is even more restrictive as I can see su=
pport only in linux-user/main.c.</div><div>I&#39;ll reword this to only be =
available for Linux user-mode emulation.</div><div><br></div><div>Thanks!</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> <br=
>
<br>
&gt; +<br>
&gt; +=C2=A0 QEMU_PLUGIN=3D&quot;file=3Dtests/plugin/libhowec.so,inline=3Do=
n,count=3Dhint&quot; $QEMU<br>
&gt; +<br>
&gt;=C2=A0 Writing plugins<br>
&gt;=C2=A0 ---------------<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--0000000000009091d105da59dee4--

