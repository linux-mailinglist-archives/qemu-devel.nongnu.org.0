Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988802F8234
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 18:26:10 +0100 (CET)
Received: from localhost ([::1]:36146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0SrR-0006Ub-Nl
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 12:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l0SpL-0005XG-SP
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:24:01 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:43913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l0SpI-00028H-N0
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:23:59 -0500
Received: by mail-lf1-x129.google.com with SMTP id 23so14205091lfg.10
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 09:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nTWCFIx555kNR1BR9spGpBMkFuzsAF0RkFSwD+yTyMU=;
 b=kY00Nm8L3NWrJe1hogEatH7P3xaAXv+hTSNZssBdUlqFMIRk5YDDMs4OovZ12Oghyr
 XLNxz//YauhU4t9X8ISTx01y2i1KWAEjeOREkeWULp7dazJu4yWHXisY9ARlX6+fjlTU
 GpgLZx0KJrkLmvwUlb/JmHo5UbWZsiJ4GIfkrBA9gRgRHTn98Hxbu/TLGELcEz64Xbmh
 E5+cfcnP72CjdVXzoB//JqYrmD7wSAVL8VRTMmHUGQjhRK2+blWNfAdDXaqhETpsmdQB
 bLbHB5pgirszeGoJV7I+G75tPtaNzkFkliwkYBKEtH4mq7XNU6bVprz8V+wZF3zgZzOR
 Hy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nTWCFIx555kNR1BR9spGpBMkFuzsAF0RkFSwD+yTyMU=;
 b=FpJHLFZDrjSR78JjRE7ud9sBD+PpWmoPyjU39NF6E0glJ3zhKDEpd+4w4swQciU5pL
 XGdnv23euCYSruig4aybqDWZpoYAsdkXaw3NLDhWVe0RBr4wQyC/uAxPmhpP9tnAZYC6
 RdAkmIaOghtieDFALSJDMYB5OUYesXDlWCQwZv4gyGIQXtzLtz7YHs3DMmcaTDFx5nvD
 Ua9pdA3Dy35/nZ7BUMTS+mk9RgXI9ei9+4vcV8dz/JKA880m85hCQaydXhWQoVMDoJ9i
 SThzwPhG9HiAQPBwNG0/Lbd4bEUqtvk2rM0Q64y0Tn8mI56/QDXMOJpujx59LFxxLpr7
 S6Yw==
X-Gm-Message-State: AOAM530jqeqd3km6Q5V6yJf7pib4KnSNAPjavz3plHeztssr70KIB5+4
 dB8D5EpZdmIdBSoQOrKt8ptZqFnetQNlFk4JbpngJA==
X-Google-Smtp-Source: ABdhPJwCFOgHBTzfQbasUmmf1Nu9wdk4Sd4bPVHcx16gEkKCTi6dEvdeTURMjFHIBSMd2RFaxmQZ6fDvfyHKjbfLXIM=
X-Received: by 2002:ac2:59ce:: with SMTP id x14mr6180833lfn.545.1610731433378; 
 Fri, 15 Jan 2021 09:23:53 -0800 (PST)
MIME-Version: 1.0
References: <20210115075634.717909-1-ganqixin@huawei.com>
 <74ba9c97-4d1f-111a-cffe-7aff18ac3f7c@amsat.org>
 <CAFQmdRa8=O7QLHHFahxoSONw5iNtFZBBo_+A6yq-VJjw5Smc+g@mail.gmail.com>
In-Reply-To: <CAFQmdRa8=O7QLHHFahxoSONw5iNtFZBBo_+A6yq-VJjw5Smc+g@mail.gmail.com>
Date: Fri, 15 Jan 2021 09:23:41 -0800
Message-ID: <CAGcCb10nuW72ZyyJxgLumNdQ3w5=1uFj2BkrZvL7Xhfczq-S4Q@mail.gmail.com>
Subject: Re: [PATCH] qtest/npcm7xx_pwm-test: Fix memleak in pwm_qom_get
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: multipart/alternative; boundary="000000000000eace8a05b8f3a273"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Tyrone Ting <kfting@nuvoton.com>,
 Gan Qixin <ganqixin@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

--000000000000eace8a05b8f3a273
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 9:17 AM Havard Skinnemoen <hskinnemoen@google.com>
wrote:

> +Hao Wu
>
> On Fri, Jan 15, 2021 at 1:15 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org>
> wrote:
> >
> > On 1/15/21 8:56 AM, Gan Qixin wrote:
> > > The pwm_qom_get function didn't free "response", which caused an
> indirect
> > > memory leak. So use qobject_unref() to fix it.
> > >
> > > ASAN shows memory leak stack:
> > >
> > > Indirect leak of 74160000 byte(s) in 18000 object(s) allocated from:
> > >     #0 0x7f96e2f79d4e in __interceptor_calloc
> (/lib64/libasan.so.5+0x112d4e)
> > >     #1 0x7f96e2d98a50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a50)
> > >     #2 0x556313112180 in qdict_new ../qobject/qdict.c:30
> > >     #3 0x556313115bca in parse_object ../qobject/json-parser.c:318
> > >     #4 0x556313117810 in parse_value ../qobject/json-parser.c:546
> > >     #5 0x556313117bda in json_parser_parse ../qobject/json-parser.c:5=
80
> > >     #6 0x55631310fe67 in json_message_process_token
> ../qobject/json-streamer.c:92
> > >     #7 0x5563131210b7 in json_lexer_feed_char
> ../qobject/json-lexer.c:313
> > >     #8 0x556313121662 in json_lexer_feed ../qobject/json-lexer.c:350
> > >     #9 0x5563131101e9 in json_message_parser_feed
> ../qobject/json-streamer.c:121
> > >     #10 0x5563130cb81e in qmp_fd_receive ../tests/qtest/libqtest.c:61=
4
> > >     #11 0x5563130cba2b in qtest_qmp_receive_dict
> ../tests/qtest/libqtest.c:636
> > >     #12 0x5563130cb939 in qtest_qmp_receive
> ../tests/qtest/libqtest.c:624
> > >     #13 0x5563130cbe0d in qtest_vqmp ../tests/qtest/libqtest.c:715
> > >     #14 0x5563130cc40f in qtest_qmp ../tests/qtest/libqtest.c:756
> > >     #15 0x5563130c5623 in pwm_qom_get
> ../tests/qtest/npcm7xx_pwm-test.c:180
> > >     #16 0x5563130c595e in pwm_get_duty
> ../tests/qtest/npcm7xx_pwm-test.c:210
> > >     #17 0x5563130c7529 in test_toggle
> ../tests/qtest/npcm7xx_pwm-test.c:447
> > >
> > > Reported-by: Euler Robot <euler.robot@huawei.com>
> > > Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> > > ---
> > > Cc: Havard Skinnemoen <hskinnemoen@google.com>
> > > Cc: Tyrone Ting <kfting@nuvoton.com>
> > > Cc: Thomas Huth <thuth@redhat.com>
> > > Cc: Laurent Vivier <lvivier@redhat.com>
> > > ---
> > >  tests/qtest/npcm7xx_pwm-test.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

Thank you for finding this out!

>
> Thanks!
>

--000000000000eace8a05b8f3a273
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 15, 2021 at 9:17 AM Havar=
d Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com">hskinnemoen@goog=
le.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">+Hao Wu<br>
<br>
On Fri, Jan 15, 2021 at 1:15 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"=
mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt; wrote:<br=
>
&gt;<br>
&gt; On 1/15/21 8:56 AM, Gan Qixin wrote:<br>
&gt; &gt; The pwm_qom_get function didn&#39;t free &quot;response&quot;, wh=
ich caused an indirect<br>
&gt; &gt; memory leak. So use qobject_unref() to fix it.<br>
&gt; &gt;<br>
&gt; &gt; ASAN shows memory leak stack:<br>
&gt; &gt;<br>
&gt; &gt; Indirect leak of 74160000 byte(s) in 18000 object(s) allocated fr=
om:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#0 0x7f96e2f79d4e in __interceptor_calloc (/li=
b64/libasan.so.5+0x112d4e)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#1 0x7f96e2d98a50 in g_malloc0 (/lib64/libglib=
-2.0.so.0+0x55a50)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#2 0x556313112180 in qdict_new ../qobject/qdic=
t.c:30<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#3 0x556313115bca in parse_object ../qobject/j=
son-parser.c:318<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#4 0x556313117810 in parse_value ../qobject/js=
on-parser.c:546<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#5 0x556313117bda in json_parser_parse ../qobj=
ect/json-parser.c:580<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#6 0x55631310fe67 in json_message_process_toke=
n ../qobject/json-streamer.c:92<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#7 0x5563131210b7 in json_lexer_feed_char ../q=
object/json-lexer.c:313<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#8 0x556313121662 in json_lexer_feed ../qobjec=
t/json-lexer.c:350<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#9 0x5563131101e9 in json_message_parser_feed =
../qobject/json-streamer.c:121<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#10 0x5563130cb81e in qmp_fd_receive ../tests/=
qtest/libqtest.c:614<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#11 0x5563130cba2b in qtest_qmp_receive_dict .=
./tests/qtest/libqtest.c:636<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#12 0x5563130cb939 in qtest_qmp_receive ../tes=
ts/qtest/libqtest.c:624<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#13 0x5563130cbe0d in qtest_vqmp ../tests/qtes=
t/libqtest.c:715<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#14 0x5563130cc40f in qtest_qmp ../tests/qtest=
/libqtest.c:756<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#15 0x5563130c5623 in pwm_qom_get ../tests/qte=
st/npcm7xx_pwm-test.c:180<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#16 0x5563130c595e in pwm_get_duty ../tests/qt=
est/npcm7xx_pwm-test.c:210<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0#17 0x5563130c7529 in test_toggle ../tests/qte=
st/npcm7xx_pwm-test.c:447<br>
&gt; &gt;<br>
&gt; &gt; Reported-by: Euler Robot &lt;<a href=3D"mailto:euler.robot@huawei=
.com" target=3D"_blank">euler.robot@huawei.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Gan Qixin &lt;<a href=3D"mailto:ganqixin@huawei.co=
m" target=3D"_blank">ganqixin@huawei.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; Cc: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.co=
m" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
&gt; &gt; Cc: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" target=
=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
&gt; &gt; Cc: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D=
"_blank">thuth@redhat.com</a>&gt;<br>
&gt; &gt; Cc: Laurent Vivier &lt;<a href=3D"mailto:lvivier@redhat.com" targ=
et=3D"_blank">lvivier@redhat.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 tests/qtest/npcm7xx_pwm-test.c | 5 ++++-<br>
&gt; &gt;=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@a=
msat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
<br>
Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com=
" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br></blockquote><div>Rev=
iewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google=
.com</a>&gt;</div><div><br></div><div>Thank you for finding this out!=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks!<br>
</blockquote></div></div>

--000000000000eace8a05b8f3a273--

