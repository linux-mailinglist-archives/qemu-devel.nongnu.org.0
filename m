Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1975BD785
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 00:39:15 +0200 (CEST)
Received: from localhost ([::1]:34802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaPQ2-0008DR-5V
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 18:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1oaPOi-0006aj-Tf
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 18:37:52 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:43542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1oaPOh-0004Le-4d
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 18:37:52 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id 129so1124167vsi.10
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 15:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=+IjiRBw4RHnLFEPq634fYMzMwaglPiw8vd3gcYXLVqU=;
 b=DbcRLdXaN6J3AnHEt8KekatdRVaGlro7EfZRAgjE4Sf+JQUKqOBe2x29ZusDEEz1FB
 lKBuOkS2RWZtnroDkGr0rHm+nJUmWAPxWVIh0G3oGSYV5Qf3/IgVqG2Z+5+Z9tDHeLaj
 dxDjIT7347A1Y54zMTWfDxod0SJu/eahxVmc8JBwyMcKAV12eM0UaNCSk30V2pvnRENR
 sxEP9uexyoBraBHwmY9Klth2og5xIBIVjgpk+IaTs0XeXvrpKQTHATgyzHhakYN0Jvr+
 juS31fudmB1nHImn9UUIfNIQcVPdAsU1es3TLbcZ39ooR7mmlAu4csuICRHVUMa7/PPs
 Fceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=+IjiRBw4RHnLFEPq634fYMzMwaglPiw8vd3gcYXLVqU=;
 b=VDlXdwbVSOSFzzHlkGg0XFHEj4EJ2ZYebJBlDc9f61wjb8hyI2iRfRE2YgjU6O+WJ5
 9HIgqiS+ZvsbXyff8NwWMunwvZT/3Du7GCKkJD/66HBpHeS2UsRYKBNanZXp0kX3nycj
 S5fOvaJRMykxqYzm/y8dBTT4hVDHzeNf3AWzUcg4yuPm/GSMEFeTdFQ1iSq+io286vX0
 8x77DP/RR9j6bjQZOBfWg8d9fDQTvvgKEPgNCM0M4zZXfuM63npvN6O+mPiwrjsoIZMm
 iVsyxvNyMciILNuJziH7eiBdiYw1qF5AXHKav4C1OUWbZToh3MUAOxB4tgEoJhJoxY8Q
 t2UQ==
X-Gm-Message-State: ACrzQf0vqVTwoX9/BxnuwKX2OrJkLx6rj4Qm4mKfXSp44aiq300ck2Kr
 BE/HXg9umEUP6L+Z95EwiBVQyC2mFVyYXPkPqI/Ilw==
X-Google-Smtp-Source: AMsMyM5aKos+MaOryNaZdJJdHu7fzvc7Id+S8q3cFPzSPF/hJK3QZzXUTjSI+QDT0IGMAlTgqOTntxd5oqFsSDOCtVs=
X-Received: by 2002:a05:6102:3309:b0:39a:e5eb:8508 with SMTP id
 v9-20020a056102330900b0039ae5eb8508mr3874703vsc.65.1663627069309; Mon, 19 Sep
 2022 15:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163138.2831353-1-venture@google.com>
 <98b23697-00ec-2952-31c1-258419bd5440@redhat.com>
In-Reply-To: <98b23697-00ec-2952-31c1-258419bd5440@redhat.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 19 Sep 2022 15:37:37 -0700
Message-ID: <CAO=notzNRHaJvqnBx34qN0ovvwiwXNPRt73VnWqxyYhvnZMXnA@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: npcm7xx-emc-test: Skip checking MAC
To: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="000000000000821dde05e90f5c24"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=venture@google.com; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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

--000000000000821dde05e90f5c24
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 19, 2022 at 5:44 AM Thomas Huth <thuth@redhat.com> wrote:

> On 06/09/2022 18.31, Patrick Venture wrote:
> > The register tests walks all the registers to verify they are initially
> > 0 when appropriate.  However, if the MAC address is set in the register
> >    space, this should not be checked against 0.
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Change-Id: I02426e39bdab33ceedd42c49d233e8680d4ec058
>
> What's that change-id good for?
>

Oops, sorry about that.  I can send out a v2 without it, or during
application someone can nicely trim it? :)


>
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> >   tests/qtest/npcm7xx_emc-test.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/qtest/npcm7xx_emc-test.c
> b/tests/qtest/npcm7xx_emc-test.c
> > index 7c435ac915..207d8515b7 100644
> > --- a/tests/qtest/npcm7xx_emc-test.c
> > +++ b/tests/qtest/npcm7xx_emc-test.c
> > @@ -378,7 +378,8 @@ static void test_init(gconstpointer test_data)
> >
> >   #undef CHECK_REG
> >
> > -    for (i = 0; i < NUM_CAMML_REGS; ++i) {
> > +    /* Skip over the MAC address registers, which is BASE+0 */
> > +    for (i = 1; i < NUM_CAMML_REGS; ++i) {
> >           g_assert_cmpuint(emc_read(qts, mod, REG_CAMM_BASE + i * 2), ==,
> >                            0);
> >           g_assert_cmpuint(emc_read(qts, mod, REG_CAML_BASE + i * 2), ==,
>
> Basically ack, but one question: Where should that non-zero MAC address
> come
> from / when did you hit a problem here? If QEMU is started without any mac
> settings at all (like it is done here), the register never contains a
> non-zero value, does it?
>

So, there's a bug in the emc device presently where that value isn't set
when it should be.  I have that bug fixed, but for whatever reason,
probably not enough caffeine, I didn't bundle the two patches together.


>
>   Thomas
>
>

--000000000000821dde05e90f5c24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 19, 2022 at 5:44 AM Thoma=
s Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 06/09/202=
2 18.31, Patrick Venture wrote:<br>
&gt; The register tests walks all the registers to verify they are initiall=
y<br>
&gt; 0 when appropriate.=C2=A0 However, if the MAC address is set in the re=
gister<br>
&gt;=C2=A0 =C2=A0 space, this should not be checked against 0.<br>
&gt; <br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Change-Id: I02426e39bdab33ceedd42c49d233e8680d4ec058<br>
<br>
What&#39;s that change-id good for?<br></blockquote><div><br></div><div>Oop=
s, sorry about that.=C2=A0 I can send out a v2 without it, or during applic=
ation someone can nicely trim it? :)</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qtest/npcm7xx_emc-test.c | 3 ++-<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-=
test.c<br>
&gt; index 7c435ac915..207d8515b7 100644<br>
&gt; --- a/tests/qtest/npcm7xx_emc-test.c<br>
&gt; +++ b/tests/qtest/npcm7xx_emc-test.c<br>
&gt; @@ -378,7 +378,8 @@ static void test_init(gconstpointer test_data)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#undef CHECK_REG<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 for (i =3D 0; i &lt; NUM_CAMML_REGS; ++i) {<br>
&gt; +=C2=A0 =C2=A0 /* Skip over the MAC address registers, which is BASE+0=
 */<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 1; i &lt; NUM_CAMML_REGS; ++i) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_cmpuint(emc_read(qts,=
 mod, REG_CAMM_BASE + i * 2), =3D=3D,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_cmpuint(emc_read(qts,=
 mod, REG_CAML_BASE + i * 2), =3D=3D,<br>
<br>
Basically ack, but one question: Where should that non-zero MAC address com=
e <br>
from / when did you hit a problem here? If QEMU is started without any mac =
<br>
settings at all (like it is done here), the register never contains a <br>
non-zero value, does it?<br></blockquote><div><br></div><div>So, there&#39;=
s a bug in the emc device presently where that value isn&#39;t set when it =
should be.=C2=A0 I have that bug fixed, but for whatever reason, probably n=
ot enough caffeine, I didn&#39;t bundle the two patches together.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div></div>

--000000000000821dde05e90f5c24--

