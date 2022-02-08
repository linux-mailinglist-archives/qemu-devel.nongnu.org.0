Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5671F4ADFAE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:32:31 +0100 (CET)
Received: from localhost ([::1]:38094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHULt-00061W-Nf
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:32:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nHTmY-00075R-I9
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:55:58 -0500
Received: from [2607:f8b0:4864:20::931] (port=37828
 helo=mail-ua1-x931.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nHTmW-0007NH-S2
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:55:58 -0500
Received: by mail-ua1-x931.google.com with SMTP id 103so11761605uag.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 08:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UxwRn46+LqpiM0nVg34Qzli9ENib652z/RD4xAV+oHs=;
 b=THEH11tmqZX+Y6W6q7lBDKLaADb2NXxbkyzdL8mYgkRZ0ktRofY6ABzxaatwhPHBSS
 dMyANcD4/7ed36qh2z1rs0LnEvdrj+QgPpPei4weLmDlgRn7h08HDtDgAeXgARR1Ieas
 +IyR8XZvgCkj/6vbSSqXB4hIz7nTK8H/DLENMkiOgegcWWFsA5kmFBckUMBJbKrYx3pi
 WPAhEwjW77xPZXY7OWI7ioHeFF5+HIzykKd3Li2DUZHsVDfL4qDi0eQvWNboDk/mLbPN
 8gE7YRKmYIwg8fyjLy5SCsQDpghhtBVq1Q09KvOnim/qbMldHQn+6MGXfdbTlu2m+YeQ
 t7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UxwRn46+LqpiM0nVg34Qzli9ENib652z/RD4xAV+oHs=;
 b=eL70WAoEVammHcu454ZnmsvUCPVMpYaqxE55vNJjo7nk0Mf0ZnwEWt6zwSdyHKE3zr
 hZrGI0YY/6YjN9Th4MB/cdkGdSFkSqBNOqJGjVxv1ojok1i9iJUjo9te4JcpPkrfFEt5
 EfJBA6OHCoijBNXEBzIbZ994nrFPNi/A+FZ/U7huISbmsqMcpeMW7pEVz6EcSXMsFzua
 1KevQd/CaCTTqUb9Cqc1+OCW/r2ZKsOnOBz4zDgsJBsVi0b3UJp7sQCC6YlP3hbH9kZI
 ZBSC04qey0/fZZdakOWnVFZUmeK1oRY5/eEcYlM/OGOrStZvXOBhvmhknBUEhhsZGHLd
 b5Nw==
X-Gm-Message-State: AOAM530HDaTnuyb3Bi4IcdHAfr+f6V+DRovzhHIKoRg/YNvgT9gONZsP
 KXoPanC+xlOB8D5K8ay8OEaG6thRyMEPNirS74o0fA==
X-Google-Smtp-Source: ABdhPJwkZlMu9ZMlAFoDtC2ckQb0WXIMO20mReaTFcnpiAaE0tYya/XExyGtnyx/oSO2AQKFPgh74QoSe4PXpDEBeQw=
X-Received: by 2002:ab0:72c2:: with SMTP id g2mr1766181uap.15.1644339352284;
 Tue, 08 Feb 2022 08:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20220206014120.2871459-1-venture@google.com>
 <CAFEAcA_k0y3gtzpi_0JG7TM=VaAa8+mb=tLSu7UHCRYhDWajZg@mail.gmail.com>
 <CAO=notxRLDdi8kyksyz2m09Hf52VK0FypmCf=g_-1S35jocnuw@mail.gmail.com>
In-Reply-To: <CAO=notxRLDdi8kyksyz2m09Hf52VK0FypmCf=g_-1S35jocnuw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 8 Feb 2022 08:55:41 -0800
Message-ID: <CAO=notw9NfXCzieGRXk-fwFjJMGHiGCX+7Q7WMx78rifsrmrfQ@mail.gmail.com>
Subject: Re: [PATCH v2] tests/qtest: add qtests for npcm7xx sdhci
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>, Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>, Shengtan Mao <stmao@google.com>,
 Hao Wu <wuhaotsh@google.com>, Chris Rauer <crauer@google.com>
Content-Type: multipart/alternative; boundary="000000000000fc208205d784967f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::931
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=venture@google.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
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

--000000000000fc208205d784967f
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 7, 2022 at 3:07 PM Patrick Venture <venture@google.com> wrote:

>
>
> On Mon, Feb 7, 2022 at 9:34 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Sun, 6 Feb 2022 at 01:41, Patrick Venture <venture@google.com> wrote:
>> >
>> > From: Shengtan Mao <stmao@google.com>
>> >
>> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
>> > Reviewed-by: Chris Rauer <crauer@google.com>
>> > Signed-off-by: Shengtan Mao <stmao@google.com>
>> > Signed-off-by: Patrick Venture <venture@google.com>
>> > ---
>> > v2:
>> >  * update copyright year
>> >  * check result of open
>> >  * use g_free instead of free
>> >  * move declarations to the top
>> >  * use g_file_open_tmp
>>
>> Fails to compile:
>>
>> ../../tests/qtest/npcm7xx_sdhci-test.c:121:32: error: use of
>> undeclared identifier 'NPCM7XX_REG_SIZE'
>>     uint64_t end_addr = addr + NPCM7XX_REG_SIZE;
>>                                ^
>>
>
> Thanks. I must have only compiled at a part-way point while tweaking it.
> I'll see if it compiles for me, and then figure out why it does when it
> doesn't, or if it doesn't, then obviously fix it.  Either way, will fix in
> v3, thanks.
>

Validated that when I build it, it's not getting built :)  So that's why
this slipped through.  I'll dig into the history to see what this value
should be now.


>
>
>>
>>
>> -- PMM
>>
>

--000000000000fc208205d784967f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 7, 2022 at 3:07 PM Patric=
k Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 7, 2022 at 9:34 AM Peter Mayde=
ll &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.=
maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Sun, 6 Feb 2022 at 01:41, Patrick Venture &lt;<a href=
=3D"mailto:venture@google.com" target=3D"_blank">venture@google.com</a>&gt;=
 wrote:<br>
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
&gt; ---<br>
&gt; v2:<br>
&gt;=C2=A0 * update copyright year<br>
&gt;=C2=A0 * check result of open<br>
&gt;=C2=A0 * use g_free instead of free<br>
&gt;=C2=A0 * move declarations to the top<br>
&gt;=C2=A0 * use g_file_open_tmp<br>
<br>
Fails to compile:<br>
<br>
../../tests/qtest/npcm7xx_sdhci-test.c:121:32: error: use of<br>
undeclared identifier &#39;NPCM7XX_REG_SIZE&#39;<br>
=C2=A0 =C2=A0 uint64_t end_addr =3D addr + NPCM7XX_REG_SIZE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br></blockquote><div><br></div><div=
>Thanks. I must have only compiled at a part-way point while tweaking it.=
=C2=A0 I&#39;ll see if it compiles for me, and then figure out why it does =
when it doesn&#39;t, or if it doesn&#39;t, then obviously fix it.=C2=A0 Eit=
her way, will fix in v3, thanks.</div></div></div></blockquote><div><br></d=
iv><div>Validated that when I build it, it&#39;s not getting built :)=C2=A0=
 So that&#39;s why this slipped through.=C2=A0 I&#39;ll dig into the histor=
y to see what this value should be now.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_q=
uote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
-- PMM<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000fc208205d784967f--

