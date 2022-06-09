Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33F654567F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:32:36 +0200 (CEST)
Received: from localhost ([::1]:38808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPlb-0003oi-D8
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nzPfK-0007L4-Fr
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 17:26:06 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:42953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nzPfH-0000RY-6K
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 17:26:06 -0400
Received: by mail-qv1-xf33.google.com with SMTP id j2so17423855qvp.9
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 14:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j25t1EHex6Nz7LLqX73h6Ki6+7SnNbh3pvKYcQm8SR0=;
 b=ntEbfIvYWJfQEtXEishJGKVA5rhhivgCx0C22xWjl1kkND9Sm+Y82oWdp5Y7CrdR34
 dPN2uyCwYtl2gwSFVYjtZ4CuLQo8Pq4SvrNo6O+OTcQKLXsjmc8JK76KJF5hpfd4LOiP
 CK1eTpngk1jv0Q61d3J8gYepwueljlClFCdR0a6kQVDWa7iyvIVl/2SFJRWSwJ/wt3ou
 lcCEERXPqC1327TJ7baJ1Bv1c5pGvgJSlKwF+LMPJdcwWuPNFrQfCpBkXgmP1+YqK1cN
 JZa0mn6xIJbJEJf7tzFs4+WCyuEaUAE0+tRWhuXb0du56PIMFKoafAL5WGvObSHzdB+n
 KaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j25t1EHex6Nz7LLqX73h6Ki6+7SnNbh3pvKYcQm8SR0=;
 b=12zueaWVzLYw0Sr9rpiHQtb51YTXQ/Ef24bdgj61LTHxHW4TcvVD18nZUJcdr4hGcU
 BAeymJzt+32cgcwfjdBYNPShHV9JRYJXiT+XktJq89k+Y9e1zIhcpF+5IMxNuqKqyl0X
 C/O/en5AAmfgrxEYSMCMrfRtveWAej68kV4kOwTAoyB8F8fXBvF41LZWmObk3ic9eHNn
 ZtLbp7jup1unZU0TFPEFzFKr2EMu5/l1xQD3iQ6AWoMeUF/oDlNVV8QeACkUpPDPQkou
 GSGKUMXaadU7fwjuaKEOCaf5jY9mw5L7qixNGb4AaHxbG3yp/klMCNt13hMJDsSb0fR+
 Uq8g==
X-Gm-Message-State: AOAM532Unaao/cC3V/ZxylB5tLhdaEa6mw3DFvpSpoCy4034jDlkoKqO
 uwOEtwULKVnhUpohfN/FL4mpXbTBVQPxpcWkV77PwQ==
X-Google-Smtp-Source: ABdhPJykmQn80PgkGDj2RXgyGpFmWLpg+Wl+Gr599Umxa9wegQM19+cB7akMKip3r7XSXx2NL8ZxTSpnNAxxevWNUYI=
X-Received: by 2002:ad4:5bc1:0:b0:42c:531c:ef12 with SMTP id
 t1-20020ad45bc1000000b0042c531cef12mr88387890qvt.15.1654809961323; Thu, 09
 Jun 2022 14:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220225174451.192304-1-wuhaotsh@google.com>
 <CAFEAcA8vcRme05raLOhtaxmvbbLhLrSZwEaz1BVk5uUYSdmL6w@mail.gmail.com>
 <CAO=notyz+SjAoomWGubV5pBuc4qSmNdJF5cmMBf7J8DevF9T4A@mail.gmail.com>
In-Reply-To: <CAO=notyz+SjAoomWGubV5pBuc4qSmNdJF5cmMBf7J8DevF9T4A@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Thu, 9 Jun 2022 14:25:49 -0700
Message-ID: <CAGcCb13k1RtJ7VVhp3goYhUrD61ScWMWrhGuARtuUOH17GozCg@mail.gmail.com>
Subject: Re: [PATCH v5] tests/qtest: add qtests for npcm7xx sdhci
To: Patrick Venture <venture@google.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Chris Rauer <crauer@google.com>, 
 Shengtan Mao <stmao@google.com>, John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000eabdeb05e10a7789"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=wuhaotsh@google.com; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--000000000000eabdeb05e10a7789
Content-Type: text/plain; charset="UTF-8"

Hi,

We did some experiments on this issue. It looks like the image size
restriction is in firmware. So in qtest we can make it
much smaller (e.g. 1MB) and the test still passes. We can send a patch with
this change if necessary.

On Thu, May 26, 2022 at 9:21 AM Patrick Venture <venture@google.com> wrote:

>
>
> On Thu, May 26, 2022 at 8:54 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Fri, 25 Feb 2022 at 17:45, Hao Wu <wuhaotsh@google.com> wrote:
>> >
>> > From: Shengtan Mao <stmao@google.com>
>> >
>> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
>> > Reviewed-by: Chris Rauer <crauer@google.com>
>> > Signed-off-by: Shengtan Mao <stmao@google.com>
>> > Signed-off-by: Patrick Venture <venture@google.com>
>>
>> Hi; John Snow tells me that this test fails in the tests/vm/netbsd
>> VM (you can test this with 'make vm-build-netbsd') because the
>> assert() on the ftruncate() call fails:
>>
>> > +    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
>> > +    g_assert_cmpint(ret, ==, 0);
>>
>> > +#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
>>
>> I haven't investigated the exact cause, but this is a
>> gigabyte, right? That's a pretty massive file for a test case to
>> create -- can we make the test use a more sensible size of
>> sd card image ?
>>
>
> It looks like the nuvoton part had an issue with a smaller image size, but
> we can resurrect that thread and poke at it a bit and see what shakes out.
>
>
>>
>> thanks
>> -- PMM
>>
>

--000000000000eabdeb05e10a7789
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>We did some experiments on this iss=
ue. It looks like the image size restriction is in firmware. So in qtest we=
 can make it</div><div>much smaller (e.g. 1MB) and the test still passes. W=
e can send a patch with this change if necessary.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 26, 2022=
 at 9:21 AM Patrick Venture &lt;<a href=3D"mailto:venture@google.com">ventu=
re@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 26, 2022 at =
8:54 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" targe=
t=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Fri, 25 Feb 2022 at 17:45, Hao Wu &=
lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@google=
.com</a>&gt; wrote:<br>
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
<br>
Hi; John Snow tells me that this test fails in the tests/vm/netbsd<br>
VM (you can test this with &#39;make vm-build-netbsd&#39;) because the<br>
assert() on the ftruncate() call fails:<br>
<br>
&gt; +=C2=A0 =C2=A0 ret =3D ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpint(ret, =3D=3D, 0);<br>
<br>
&gt; +#define NPCM7XX_TEST_IMAGE_SIZE (1 &lt;&lt; 30)<br>
<br>
I haven&#39;t investigated the exact cause, but this is a<br>
gigabyte, right? That&#39;s a pretty massive file for a test case to<br>
create -- can we make the test use a more sensible size of<br>
sd card image ?<br></blockquote><div><br></div><div>It looks like the nuvot=
on part had an=C2=A0issue with a smaller image size, but we can resurrect t=
hat thread and poke at it a bit and see what shakes out.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>
</blockquote></div>

--000000000000eabdeb05e10a7789--

