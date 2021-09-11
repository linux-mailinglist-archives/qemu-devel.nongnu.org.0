Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA991407474
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 03:36:05 +0200 (CEST)
Received: from localhost ([::1]:45366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOrw4-00085z-8o
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 21:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mOrti-0007Ad-2H
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 21:33:38 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mOrte-0003V8-3D
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 21:33:35 -0400
Received: by mail-ej1-x62c.google.com with SMTP id x11so7930154ejv.0
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 18:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ajXtqRq9irp5hWUhCXJXZ5NsjsCErlpr0AP+qDwEfaI=;
 b=PFjKk28/VPkE6/O7nZL37T9+IlhtGjEgu6/qomecie6gdnsVA6q3tHQTl255QJw7Ko
 TP7h3V23fsz+rKMi/Mn7LUdc2CVASg1xM7q2g7Bq4RzwyzxG0neeHHZrx7JtZwsiRKGF
 zM/cdXNbfCJa9f53Ilu08vcIdUIJhhIN0LGfEv0xt0GA8Ae4kjDWO1HoCqrFVqoD8Jhn
 ESo9/wptRS2IxfHkyx3LYrvEUxoWaMOVRUY4jffiHWIJu+7cH4jh8SJwLwuCNKODydge
 JJLIqNQo2ftAmwp6U8tXnPoaf3Pbwml5oIWcaQC53gHdKg5MlpdwnWWhbGzx9mGF4Wtp
 BZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ajXtqRq9irp5hWUhCXJXZ5NsjsCErlpr0AP+qDwEfaI=;
 b=JoyS81Bf5y/Rmj0gazpgE3v+yr5wxzdJiAteNmVMhlrezP2/7E+f/ybNbHpb43BmGd
 jhoAJNGt8Dn6HoXVu2xXYaVM0NdMLw7KRPjSzJseCvQGe2MP/6HzX6I6seDvVDLpWVbo
 7R3ug+7mRDYGRUjjn6knvQcbTBlyzqbPBS/9NlhJBLjEvvUqqOer6u3MF6PTbKEvBcMF
 8/yFsfcn3+g3xE2cM24m15RtLPSral3IwagRXR43pKj0sVXcqywAhIDDwH1HajjVJYB9
 hUppM1HfjfbPTPgGjLhOzsdTpJvCdJZ80lGjGD79MlyrrfxDCDuGhF50UUaTtr7rAFlJ
 s5OQ==
X-Gm-Message-State: AOAM531haki7DE0/089kQGSjaspyR+xbAuSeHI1zEzMiHn+ZO3IpT2Sd
 0XqNVfGap6iFVlbKM3YJONR+VbG5O1hY4/ZY8CoSNA==
X-Google-Smtp-Source: ABdhPJwE6nuC0/Gxm1/G/rtr5DbchvUXV/lJDZA6eh/aiEZplodAU4jTeL7npom+llKVfGbMU/SnfAxkUFuR5xl2KB0=
X-Received: by 2002:a17:906:4cc1:: with SMTP id
 q1mr482566ejt.415.1631324011656; 
 Fri, 10 Sep 2021 18:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210908222157.2377282-1-philmd@redhat.com>
 <d11a3da6-c26c-1f78-ff52-e965f214cba7@t-online.de>
 <a1988342-7304-ccc9-8a5a-7da0172569ff@redhat.com>
In-Reply-To: <a1988342-7304-ccc9-8a5a-7da0172569ff@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Sat, 11 Sep 2021 07:03:20 +0530
Message-ID: <CAARzgwzr=mKp6nxsy6STs5Sy9NKCkA53pCLY7CoxhbdN4=4U3g@mail.gmail.com>
Subject: Re: [PATCH] hw/i386/acpi-build: Fix a typo
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003a8c9e05cbae3834"
Received-SPF: none client-ip=2a00:1450:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003a8c9e05cbae3834
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 11, 2021 at 1:03 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> On 9/10/21 8:54 PM, Volker R=C3=BCmelin wrote:
> >> Fix 'hotplugabble' -> 'hotpluggabble' typo.
> >
> > I'm convinced that the correct spelling is hotpluggable. Only the
> > consonant g is doubled.
>
> Lol I missed this part, thanks :>


Oops my apologies. I also did not notice the double b.


>
>

--0000000000003a8c9e05cbae3834
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Sep 11, 2021 at 1:03 AM Philippe Mathieu-Daud=C3=A9=
 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)">On 9/10/21 8:54 PM, Volker R=C3=BCmelin wrote:<br=
>
&gt;&gt; Fix &#39;hotplugabble&#39; -&gt; &#39;hotpluggabble&#39; typo.<br>
&gt; <br>
&gt; I&#39;m convinced that the correct spelling is hotpluggable. Only the<=
br>
&gt; consonant g is doubled.<br>
<br>
Lol I missed this part, thanks :&gt;</blockquote><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Oops my apologies. I also did not notice the double b.<=
/div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;pad=
ding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
</blockquote></div></div>

--0000000000003a8c9e05cbae3834--

