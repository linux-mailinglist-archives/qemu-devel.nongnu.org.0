Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0B82B831B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:26:39 +0100 (CET)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfRE6-000470-EV
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kfRAk-0001pF-02
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:23:10 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:37179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kfRAd-0002bB-5Q
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:23:09 -0500
Received: by mail-lf1-x143.google.com with SMTP id s30so4088921lfc.4
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 09:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2lfoSW2sbW1lHHM4PCy9dp+RZAodDdnL5scMmnD29Dw=;
 b=Xdx5WfOAXThluO5YC7PJHYJAC/h02nKP0BlEr1fiq9DCPoDgUxkRHygLG1YWrkFkPM
 NV58zur/fonudy+OOgiFsSpo8ebb+5dS2ZBqnxyS+2q9oPpCtQA964SKlpvAhL8kzKCJ
 +bkVAbs5Gnveas6pb6Rmym9GlmV2/8utttUvM16b4OBlXFQ2vr+L7nWkHhhlzjKdNcbw
 DT5ciOPfIa662wReybS4kr7pj83wTBTskfOawJ0O534dS6U4qV0r70RUj5w8lBNrAFh0
 ZPG5iGW3Y6dd5jFag4ruMUOl4iMmLx0Kk/N2wSJgZarjC0k8PrU8RILYyrVcwl+DUkbp
 hA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2lfoSW2sbW1lHHM4PCy9dp+RZAodDdnL5scMmnD29Dw=;
 b=HT+LKKpIIshByLA32lHn79dAZ4fYyF5KroaPq3P5vjPIxlAayrpUvzeseiVkaa2TEx
 q0JkiWfOzRhgiwI1zw/qmyDvgRcxVruTQoGjPB5mwHbBzUb+2Qkw5sXNWSxsu4IIqrhr
 OqS82unUndf8iZlwitXYPPEh7NDNdwQip99Dg927ME2OII+7DTa54YWv4bcFncMCEC4L
 AkueMQXBdEnjV6StUnKATKxFdqoWU4R2e33LUxmlZDujhbxoApwKsxmHOjbcvxy9zBNp
 Gs7l2VGAG8ZM7z9QZWs7dHUrP92r97bca1Nut1XjyDnGHB2KvjB5q7bBSzm7Z17xLd9r
 KQhA==
X-Gm-Message-State: AOAM531xNLqH3i9vTVQcQaXiVUjxJ1DoIj+Uc+37MGiWR1gyNZv5iwHH
 sBnHD0YRTNH2uu+2HsLomJzhS4y8NANKL0sDWTAx6Q==
X-Google-Smtp-Source: ABdhPJzNBStCeidgceIBTZODpG34DsIa7PDsBOc7+/gZ169+TyflyJCnduGtttwAlHH2v59LBJmKCpSYsD59lyiJNPg=
X-Received: by 2002:ac2:562a:: with SMTP id b10mr4290896lff.227.1605720173930; 
 Wed, 18 Nov 2020 09:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
 <20201118115646.2461726-3-kuhn.chenqun@huawei.com>
 <CAFQmdRbaivcgHt=dQ_nysZ=zpCM=d5K+-MY1129WDa3G=E9MCg@mail.gmail.com>
In-Reply-To: <CAFQmdRbaivcgHt=dQ_nysZ=zpCM=d5K+-MY1129WDa3G=E9MCg@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 18 Nov 2020 09:22:41 -0800
Message-ID: <CAGcCb11Jpb2Bceb6vz6Q1bU_6M9R3dhYy5ezKc=Y2FoLjVZMHA@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 2/2] tests/qtest: fix memleak in
 npcm7xx_watchdog_timer-test
To: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Chen Qun <kuhn.chenqun@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 zhang.zhanghailiang@huawei.com, Thomas Huth <thuth@redhat.com>,
 lvivier@redhat.com, Euler Robot <euler.robot@huawei.com>
Content-Type: multipart/alternative; boundary="0000000000009465e905b464dc37"
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009465e905b464dc37
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2020 at 9:14 AM Havard Skinnemoen <hskinnemoen@google.com>
wrote:

> On Wed, Nov 18, 2020 at 3:57 AM Chen Qun <kuhn.chenqun@huawei.com> wrote:
> >
> > Properly free resp for get_watchdog_action() to avoid memory leak.
> > ASAN shows memory leak stack:
> >
> > Indirect leak of 12360 byte(s) in 3 object(s) allocated from:
> >     #0 0x7f41ab6cbd4e in __interceptor_calloc
> (/lib64/libasan.so.5+0x112d4e)
> >     #1 0x7f41ab4eaa50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a50)
> >     #2 0x556487d5374b in qdict_new ../qobject/qdict.c:29
> >     #3 0x556487d65e1a in parse_object ../qobject/json-parser.c:318
> >     #4 0x556487d65cb6 in parse_pair ../qobject/json-parser.c:287
> >     #5 0x556487d65ebd in parse_object ../qobject/json-parser.c:343
> >     #6 0x556487d661d5 in json_parser_parse ../qobject/json-parser.c:580
> >     #7 0x556487d513df in json_message_process_token
> ../qobject/json-streamer.c:92
> >     #8 0x556487d63919 in json_lexer_feed_char ../qobject/json-lexer.c:313
> >     #9 0x556487d63d75 in json_lexer_feed ../qobject/json-lexer.c:350
> >     #10 0x556487d28b2a in qmp_fd_receive ../tests/qtest/libqtest.c:613
> >     #11 0x556487d2a16f in qtest_qmp_eventwait_ref
> ../tests/qtest/libqtest.c:827
> >     #12 0x556487d248e2 in get_watchdog_action
> ../tests/qtest/npcm7xx_watchdog_timer-test.c:94
> >     #13 0x556487d25765 in test_enabling_flags
> ../tests/qtest/npcm7xx_watchdog_timer-test.c:243
> >
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>

> > ---
> >  tests/qtest/npcm7xx_watchdog_timer-test.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/qtest/npcm7xx_watchdog_timer-test.c
> b/tests/qtest/npcm7xx_watchdog_timer-test.c
> > index 54d5d6d8f2..3aae5a0438 100644
> > --- a/tests/qtest/npcm7xx_watchdog_timer-test.c
> > +++ b/tests/qtest/npcm7xx_watchdog_timer-test.c
> > @@ -204,6 +204,7 @@ static void test_enabling_flags(gconstpointer
> watchdog)
> >  {
> >      const Watchdog *wd = watchdog;
> >      QTestState *qts;
> > +    QDict *rsp;
> >
> >      /* Neither WTIE or WTRE is set, no interrupt or reset should happen
> */
> >      qts = qtest_init("-machine quanta-gsj");
> > @@ -240,8 +241,9 @@ static void test_enabling_flags(gconstpointer
> watchdog)
> >      g_assert_false(qtest_get_irq(qts, wd->irq));
> >      qtest_clock_step(qts, watchdog_calculate_steps(RESET_CYCLES,
> >                  watchdog_prescaler(qts, wd)));
> > -    g_assert_false(strcmp(qdict_get_str(get_watchdog_action(qts),
> "action"),
> > -                "reset"));
> > +    rsp = get_watchdog_action(qts);
> > +    g_assert_false(strcmp(qdict_get_str(rsp, "action"), "reset"));
> > +    qobject_unref(rsp);
> >      qtest_qmp_eventwait(qts, "RESET");
> >      qtest_quit(qts);
> >
> > --
> > 2.23.0
> >
>

--0000000000009465e905b464dc37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 18, 2020 at 9:14 AM Havar=
d Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com" target=3D"_blank=
">hskinnemoen@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Wed, Nov 18, 2020 at 3:57 AM Chen Qun &lt;<a hre=
f=3D"mailto:kuhn.chenqun@huawei.com" target=3D"_blank">kuhn.chenqun@huawei.=
com</a>&gt; wrote:<br>
&gt;<br>
&gt; Properly free resp for get_watchdog_action() to avoid memory leak.<br>
&gt; ASAN shows memory leak stack:<br>
&gt;<br>
&gt; Indirect leak of 12360 byte(s) in 3 object(s) allocated from:<br>
&gt;=C2=A0 =C2=A0 =C2=A0#0 0x7f41ab6cbd4e in __interceptor_calloc (/lib64/l=
ibasan.so.5+0x112d4e)<br>
&gt;=C2=A0 =C2=A0 =C2=A0#1 0x7f41ab4eaa50 in g_malloc0 (/lib64/libglib-2.0.=
so.0+0x55a50)<br>
&gt;=C2=A0 =C2=A0 =C2=A0#2 0x556487d5374b in qdict_new ../qobject/qdict.c:2=
9<br>
&gt;=C2=A0 =C2=A0 =C2=A0#3 0x556487d65e1a in parse_object ../qobject/json-p=
arser.c:318<br>
&gt;=C2=A0 =C2=A0 =C2=A0#4 0x556487d65cb6 in parse_pair ../qobject/json-par=
ser.c:287<br>
&gt;=C2=A0 =C2=A0 =C2=A0#5 0x556487d65ebd in parse_object ../qobject/json-p=
arser.c:343<br>
&gt;=C2=A0 =C2=A0 =C2=A0#6 0x556487d661d5 in json_parser_parse ../qobject/j=
son-parser.c:580<br>
&gt;=C2=A0 =C2=A0 =C2=A0#7 0x556487d513df in json_message_process_token ../=
qobject/json-streamer.c:92<br>
&gt;=C2=A0 =C2=A0 =C2=A0#8 0x556487d63919 in json_lexer_feed_char ../qobjec=
t/json-lexer.c:313<br>
&gt;=C2=A0 =C2=A0 =C2=A0#9 0x556487d63d75 in json_lexer_feed ../qobject/jso=
n-lexer.c:350<br>
&gt;=C2=A0 =C2=A0 =C2=A0#10 0x556487d28b2a in qmp_fd_receive ../tests/qtest=
/libqtest.c:613<br>
&gt;=C2=A0 =C2=A0 =C2=A0#11 0x556487d2a16f in qtest_qmp_eventwait_ref ../te=
sts/qtest/libqtest.c:827<br>
&gt;=C2=A0 =C2=A0 =C2=A0#12 0x556487d248e2 in get_watchdog_action ../tests/=
qtest/npcm7xx_watchdog_timer-test.c:94<br>
&gt;=C2=A0 =C2=A0 =C2=A0#13 0x556487d25765 in test_enabling_flags ../tests/=
qtest/npcm7xx_watchdog_timer-test.c:243<br>
&gt;<br>
&gt; Reported-by: Euler Robot &lt;<a href=3D"mailto:euler.robot@huawei.com"=
 target=3D"_blank">euler.robot@huawei.com</a>&gt;<br>
&gt; Signed-off-by: Chen Qun &lt;<a href=3D"mailto:kuhn.chenqun@huawei.com"=
 target=3D"_blank">kuhn.chenqun@huawei.com</a>&gt;<br>
<br>
Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com=
" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
<br></blockquote><div>Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@go=
ogle.com" target=3D"_blank">wuhaotsh@google.com</a>&gt;=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 tests/qtest/npcm7xx_watchdog_timer-test.c | 6 ++++--<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/qtest/npcm7xx_watchdog_timer-test.c b/tests/qtest/n=
pcm7xx_watchdog_timer-test.c<br>
&gt; index 54d5d6d8f2..3aae5a0438 100644<br>
&gt; --- a/tests/qtest/npcm7xx_watchdog_timer-test.c<br>
&gt; +++ b/tests/qtest/npcm7xx_watchdog_timer-test.c<br>
&gt; @@ -204,6 +204,7 @@ static void test_enabling_flags(gconstpointer watc=
hdog)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const Watchdog *wd =3D watchdog;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QTestState *qts;<br>
&gt; +=C2=A0 =C2=A0 QDict *rsp;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Neither WTIE or WTRE is set, no interrupt or re=
set should happen */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qts =3D qtest_init(&quot;-machine quanta-gsj&quot;=
);<br>
&gt; @@ -240,8 +241,9 @@ static void test_enabling_flags(gconstpointer watc=
hdog)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_assert_false(qtest_get_irq(qts, wd-&gt;irq));<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 qtest_clock_step(qts, watchdog_calculate_steps(RES=
ET_CYCLES,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 watchdog=
_prescaler(qts, wd)));<br>
&gt; -=C2=A0 =C2=A0 g_assert_false(strcmp(qdict_get_str(get_watchdog_action=
(qts), &quot;action&quot;),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;reset&q=
uot;));<br>
&gt; +=C2=A0 =C2=A0 rsp =3D get_watchdog_action(qts);<br>
&gt; +=C2=A0 =C2=A0 g_assert_false(strcmp(qdict_get_str(rsp, &quot;action&q=
uot;), &quot;reset&quot;));<br>
&gt; +=C2=A0 =C2=A0 qobject_unref(rsp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qtest_qmp_eventwait(qts, &quot;RESET&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qtest_quit(qts);<br>
&gt;<br>
&gt; --<br>
&gt; 2.23.0<br>
&gt;<br>
</blockquote></div></div>

--0000000000009465e905b464dc37--

