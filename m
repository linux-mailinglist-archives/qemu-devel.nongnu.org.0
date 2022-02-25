Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC154C4DEA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:36:37 +0100 (CET)
Received: from localhost ([::1]:37100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNfSG-0006Oy-Dc
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:36:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nNfQW-0005WJ-Va
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 13:34:48 -0500
Received: from [2607:f8b0:4864:20::92d] (port=45008
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nNfQT-0005IM-Pb
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 13:34:48 -0500
Received: by mail-ua1-x92d.google.com with SMTP id g15so2851987ual.11
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 10:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xuJ9qnpl5Qtqj40p5Y47v2PTOZUuKtUIobtQkgPCABw=;
 b=Hi9H7ouenhNO5nBH4By4MQ+BSF+PCmm9BvHJIM1FvNoDT89fScuPQCj6EPRB75GndQ
 TguUAeIGLkNIf7+pal7eFaqewbbLg3gnH2ahHXU+OoudvxCiEZIMzQK+BJ85n9hzR0W8
 ApQH1A6YI13jv+vZ1gTl8MClVZ0QCP4oB9Frgl3BsnFzxcAvCjR7GvEI4CWaoy1IktGO
 gCK4kkjTrSMqOHaXvl8j+eDBD4eHZrdVc6dI8zZ/yBDqT46gTOKCushat9vGUU++iI3U
 7vMzwIalumZZkVpQJN1QRvF54bPm71001KGwNkYpkLNkt9D6KYyv56xmvYb+/el4DWGA
 yUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xuJ9qnpl5Qtqj40p5Y47v2PTOZUuKtUIobtQkgPCABw=;
 b=XBV1ahlHM2sgwPnbKgthT9s/bac3c3N7S/sqfZAKT7BOqqdxM83CLtAiJuvO9tvZoI
 cQQbPY0NXc/FhpNxI4iAL6FyTe6O4e3nFi71ON3vjC7AHu5WuWiuPje5RD+P8WIVIx5D
 QntiUcbJafsn2aw/pqWGahZeG3K8O3W2g7mWhEqLUBVaheauTQj1lETg+jgRmkHkozhj
 Lx0odbj0AfO/2gQS+0pEe7vCz+bAfi2ouhWAoLGiHbG/uXjzEpjgAPK5JS+Q54I+nOoX
 cT6a9mljRI5qeQmqOytFy46f/8zE12dtvhOJgltwwGByttk8NxSSlcg5ujOawgIGiT2V
 CWcQ==
X-Gm-Message-State: AOAM530zrZMZWa8DdeAqk1JxL/fh56+qOMEpgf/Np0Y9Ji0N3XrYZokI
 W/fHW6okNNY0dPXhzbYImADUcnF20oefixrKth8iOw==
X-Google-Smtp-Source: ABdhPJwiV1uN+32d1MJBwEB5pimRDKEJWFMcJegCqb1FJZxrAaV2WHYXLHgePZsDSK/C+bFnNFaSp8EmnPQuqS4pwpk=
X-Received: by 2002:ab0:3046:0:b0:33c:7679:3141 with SMTP id
 x6-20020ab03046000000b0033c76793141mr3786753ual.15.1645814084466; Fri, 25 Feb
 2022 10:34:44 -0800 (PST)
MIME-Version: 1.0
References: <20220224190325.2990336-1-wuhaotsh@google.com>
 <CAFEAcA_hzOkgLaYv=Zy338zfv3WsvSyKVEgzS6bn03o0=ed1VA@mail.gmail.com>
 <CAGcCb10AbftohExf2-2u6gAs+MeOj8gYceDoJ59t4pcX3rz_Pg@mail.gmail.com>
In-Reply-To: <CAGcCb10AbftohExf2-2u6gAs+MeOj8gYceDoJ59t4pcX3rz_Pg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 25 Feb 2022 10:34:33 -0800
Message-ID: <CAO=notwttZXf5Qg429YiBPiY22HGApntahSpup72CD+Rrp4gGw@mail.gmail.com>
Subject: Re: [PATCH v4] tests/qtest: add qtests for npcm7xx sdhci
To: Hao Wu <wuhaotsh@google.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>, Havard Skinnemoen <hskinnemoen@google.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 bin.meng@windriver.com, qemu-block@nongnu.org, 
 Shengtan Mao <maoshengtan2011@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>
Content-Type: multipart/alternative; boundary="000000000000df760105d8dbf338"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=venture@google.com; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--000000000000df760105d8dbf338
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 25, 2022 at 9:45 AM Hao Wu <wuhaotsh@google.com> wrote:

> I have sent an updated version that uses memcmp()
>
> On Fri, Feb 25, 2022 at 3:44 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Thu, 24 Feb 2022 at 19:03, Hao Wu <wuhaotsh@google.com> wrote:
>> >
>> > From: Shengtan Mao <stmao@google.com>
>> >
>> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
>> > Reviewed-by: Chris Rauer <crauer@google.com>
>> > Signed-off-by: Shengtan Mao <stmao@google.com>
>> > Signed-off-by: Patrick Venture <venture@google.com>
>> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
>> > ---
>> > v4:
>> >  * use strncmp to compare fixed length strings
>> > v3:
>> >  * fixup compilation from missing macro value
>> > v2:
>> >  * update copyright year
>> >  * check result of open
>> >  * use g_free instead of free
>> >  * move declarations to the top
>> >  * use g_file_open_tmp
>> > ---
>>
>> > +static void write_sdread(QTestState *qts, const char *msg)
>> > +{
>> > +    int fd, ret;
>> > +    size_t len = strlen(msg);
>> > +    char *rmsg = g_malloc(len);
>> > +
>> > +    /* write message to sd */
>> > +    fd = open(sd_path, O_WRONLY);
>> > +    g_assert(fd >= 0);
>> > +    ret = write(fd, msg, len);
>> > +    close(fd);
>> > +    g_assert(ret == len);
>> > +
>> > +    /* read message using sdhci */
>> > +    ret = sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);
>> > +    g_assert(ret == len);
>> > +    g_assert(!strncmp(rmsg, msg, len));
>>
>> We always know we want to compare exactly 'len' bytes here, and we know
>> the buffers in each case are at least that large. The right function
>> for that is memcmp(), I think.
>>
>
Thanks Hao for picking this up :)


>
>> thanks
>> -- PMM
>>
>

--000000000000df760105d8dbf338
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 25, 2022 at 9:45 AM Hao W=
u &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr">I have sent an updated version that uses memcmp()</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 25, 2022=
 at 3:44 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" t=
arget=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Thu, 24 Feb 2022 at 19:03, Hao =
Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@go=
ogle.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" target=3D"_=
blank">stmao@google.com</a>&gt;<br>
&gt;<br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Reviewed-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" targ=
et=3D"_blank">crauer@google.com</a>&gt;<br>
&gt; Signed-off-by: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" ta=
rget=3D"_blank">stmao@google.com</a>&gt;<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; ---<br>
&gt; v4:<br>
&gt;=C2=A0 * use strncmp to compare fixed length strings<br>
&gt; v3:<br>
&gt;=C2=A0 * fixup compilation from missing macro value<br>
&gt; v2:<br>
&gt;=C2=A0 * update copyright year<br>
&gt;=C2=A0 * check result of open<br>
&gt;=C2=A0 * use g_free instead of free<br>
&gt;=C2=A0 * move declarations to the top<br>
&gt;=C2=A0 * use g_file_open_tmp<br>
&gt; ---<br>
<br>
&gt; +static void write_sdread(QTestState *qts, const char *msg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int fd, ret;<br>
&gt; +=C2=A0 =C2=A0 size_t len =3D strlen(msg);<br>
&gt; +=C2=A0 =C2=A0 char *rmsg =3D g_malloc(len);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* write message to sd */<br>
&gt; +=C2=A0 =C2=A0 fd =3D open(sd_path, O_WRONLY);<br>
&gt; +=C2=A0 =C2=A0 g_assert(fd &gt;=3D 0);<br>
&gt; +=C2=A0 =C2=A0 ret =3D write(fd, msg, len);<br>
&gt; +=C2=A0 =C2=A0 close(fd);<br>
&gt; +=C2=A0 =C2=A0 g_assert(ret =3D=3D len);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* read message using sdhci */<br>
&gt; +=C2=A0 =C2=A0 ret =3D sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);=
<br>
&gt; +=C2=A0 =C2=A0 g_assert(ret =3D=3D len);<br>
&gt; +=C2=A0 =C2=A0 g_assert(!strncmp(rmsg, msg, len));<br>
<br>
We always know we want to compare exactly &#39;len&#39; bytes here, and we =
know<br>
the buffers in each case are at least that large. The right function<br>
for that is memcmp(), I think.<br></blockquote></div></blockquote><div><br>=
</div><div>Thanks Hao for picking this up :)</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div>
</blockquote></div></div>

--000000000000df760105d8dbf338--

