Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030874075FB
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 11:56:10 +0200 (CEST)
Received: from localhost ([::1]:44402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOzk2-0004ow-2b
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 05:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mOzic-0003p5-Cy
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 05:54:42 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:33736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mOzia-0002E4-Is
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 05:54:42 -0400
Received: by mail-ed1-x52f.google.com with SMTP id s25so6291279edw.0
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 02:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0UlZw5aMYzgna19SS/ykEHOfKco6D9vlyCRmbxJ2y7o=;
 b=qYnLANCy/yVcTnrheg4tu2qES/FGAVmzkzVkOco3R6yBKCql78PCpyYf+D9xWD5DEQ
 qa+Ryca5UIRMys1Qsb8OXlA6wbia8br1SzBR6zUAWYV3La/ryHLC1EMsDyEjiVVXLUkW
 xbQZ0Q6lmOEA6NTcbnFiqXaVZfQyZZCiAaGFU+CR0gtz5VR39FP6QsipHbVryQ/x+vVa
 vJQPJ7Ag3jqMj8hmOQiE22STYIEO7xiuNqoun+4GtL+DJE9I6LP1ypCXW3kqYcTWtEbo
 n+mnvrTL6KYdPCgQ32MoHp+qEG6VRFCe71DS9GJnXLoEa4CUW6C1ZINhqxzbjB3lT6QY
 Weyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0UlZw5aMYzgna19SS/ykEHOfKco6D9vlyCRmbxJ2y7o=;
 b=rtLolUeb80kxDtn2QPDDA+ZjALj/zAECirObC55Pb3rdiWPFQEh9ftHI3FN97P5KCs
 zU1IkOCfdnag7KCaQBXSXdIfnjqyDxh2BnEGqP+qd/fAkWI0JO4XhbJCYt4XlpJnY+QQ
 O46AoThSuampgVzr1fVlE5re4mtNbSjpaguRp9gaC7HSGMhDeunJgpI21itqF/IZBI6P
 qUpVwX7sExtUj8nwutQ8UHQvlHXxwL5HnXwWFwjEsRCzvkaebcigR9gEKAVOVa4tnSRV
 RM5P1GvU/QOBHRJxn8/vUcAIlZjBSvOdZ2/c3Dr3Dg2OYDwxRbPFsAOZe/xr1tWOK0BN
 a5JQ==
X-Gm-Message-State: AOAM530ySDYCT/SmOZ0CAwA22UjDBajYLpK8cz2B9C04YsE9kOqRQ2A4
 /431kgBbGp06P4ZOShiY7dxTUnJK2jBWTwFvk6gNnw==
X-Google-Smtp-Source: ABdhPJyHrfqdpPUitK8HydmvW1aXJbkK0Je9QO7lqfFRykRmNZlL8igQSKjDMNc9tQGhUmJUhhgP5AjhLmtXMWLiMok=
X-Received: by 2002:a05:6402:2cd:: with SMTP id
 b13mr2433664edx.267.1631354078793; 
 Sat, 11 Sep 2021 02:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210908222157.2377282-1-philmd@redhat.com>
 <d11a3da6-c26c-1f78-ff52-e965f214cba7@t-online.de>
 <a1988342-7304-ccc9-8a5a-7da0172569ff@redhat.com>
 <CAARzgwzr=mKp6nxsy6STs5Sy9NKCkA53pCLY7CoxhbdN4=4U3g@mail.gmail.com>
 <cc0cebd1-43a3-17c7-f52a-db4db0161855@redhat.com>
In-Reply-To: <cc0cebd1-43a3-17c7-f52a-db4db0161855@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Sat, 11 Sep 2021 15:24:27 +0530
Message-ID: <CAARzgwxLf0hfxLaOs6mEWm05zGkXJWJLT6qETAgkYyPuWP7JEQ@mail.gmail.com>
Subject: Re: [PATCH] hw/i386/acpi-build: Fix a typo
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005ea9bf05cbb53812"
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52f.google.com
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

--0000000000005ea9bf05cbb53812
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 11, 2021 at 13:56 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> On 9/11/21 3:33 AM, Ani Sinha wrote:
> > On Sat, Sep 11, 2021 at 1:03 AM Philippe Mathieu-Daud=C3=A9
> > <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
> >
> >     On 9/10/21 8:54 PM, Volker R=C3=BCmelin wrote:
> >     >> Fix 'hotplugabble' -> 'hotpluggabble' typo.
> >     >
> >     > I'm convinced that the correct spelling is hotpluggable. Only the
> >     > consonant g is doubled.
> >
> >     Lol I missed this part, thanks :>
> >
> >
> > Oops my apologies. I also did not notice the double b.
>
> Typoglycemia++


Will have to experiment with this

https://www.tenderisthebyte.com/blog/2019/06/09/spell-checking-emacs/

--0000000000005ea9bf05cbb53812
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Sep 11, 2021 at 13:56 Philippe Mathieu-Daud=C3=A9 &=
lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On 9/11/21 3:33 AM, Ani Sinha wrote:<=
br>
&gt; On Sat, Sep 11, 2021 at 1:03 AM Philippe Mathieu-Daud=C3=A9<br>
&gt; &lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redh=
at.com</a> &lt;mailto:<a href=3D"mailto:philmd@redhat.com" target=3D"_blank=
">philmd@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 9/10/21 8:54 PM, Volker R=C3=BCmelin wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Fix &#39;hotplugabble&#39; -&gt; &#39;hotp=
luggabble&#39; typo.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;m convinced that the correct spelling is=
 hotpluggable. Only the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; consonant g is doubled.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Lol I missed this part, thanks :&gt;<br>
&gt; <br>
&gt; <br>
&gt; Oops my apologies. I also did not notice the double b.<br>
<br>
Typoglycemia++</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Wi=
ll have to experiment with this=C2=A0</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div><a href=3D"https://www.tenderisthebyte.com/blog/2019/06/=
09/spell-checking-emacs/">https://www.tenderisthebyte.com/blog/2019/06/09/s=
pell-checking-emacs/</a></div><div dir=3D"auto"><br></div></div></div></div=
>

--0000000000005ea9bf05cbb53812--

