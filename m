Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B956A3D15EE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 20:09:48 +0200 (CEST)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6GfD-0003mf-C0
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 14:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m6GeO-000385-Ml
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 14:08:57 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:42566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m6GeM-0005zh-IL
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 14:08:56 -0400
Received: by mail-io1-xd2b.google.com with SMTP id x10so3341967ion.9
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 11:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sh8ola+UnyEcZrumDsohwf8FxZuCGuZCSARm0xC2nlQ=;
 b=fwTRbNG8J9u7wehOufMnvKzFN2oPGQcyj9NQ5alq4V8/6d4CRkSBLAL+ljdW4+HSa7
 S7S5HHv0gt859ptD/wFxexZJNJl89WT8oJc6IIQt4OlfqgxDTmSzQ4zqnGpiPwk2lrG8
 /KYe1xg96aQJTXpMuaM5WsSgZ9ObEEGWHGNQbtRMmNbllCkcJbUPPS3wU4sGhBHZ+4nK
 776kktpA5c1RJpK3pAMDE5eH/1uXAygY39Bv9eA4URd3EG8zinDcCEOCKmMXAmfBx0gs
 2X/NtqtY9pJASyYNOXk0gmeKBK2VXrrwhndS3mZgbM3nPjoSGbHBBxMd21lW26ys/eO/
 SapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sh8ola+UnyEcZrumDsohwf8FxZuCGuZCSARm0xC2nlQ=;
 b=evgfefnDFgbXJ9LNKbV9pajPBKIUWEtJ1N24DWfN8Ypf3AIL7GhY2xjv70u57VhLQt
 CMGrfZ8yJ0XQfV/VxLJitBghqLVxb3+ZGZADvskP4UQcYA4LDZ5XkT1Z5HjnBsRmNmjb
 3fezpO5GoRzE7/URaggd1BYCj4ktVSyR1VJOlpmSxfInAhFlpdlOxT1ptLlYJUBP4wyi
 W5z7eDQ+WWUgsr5OwGXb3+b86rkCpzfhHglJbUw6JGSUzvTIPZ80h47Dyh5ArK6LFov0
 K7SsrIHJS2yVMZWX4b+/LRR5RBoJS4riC0WoFqrm9DkUpP5ambRplw7FXJwNTkzVG27S
 /8nQ==
X-Gm-Message-State: AOAM532qMIfn2hPpHyxY1fuIiF+xf1ZlJyeF63MejSMqkFqHTvBdeE19
 JKYXoglxxlDpWP1uKlObUkJ/TnsKybFRiXgBsq0=
X-Google-Smtp-Source: ABdhPJzT6ysGgqzrk8UhHKl0S9wQ4m8fV38pPcg6I+53fF9CrKyxmSTanCMo5xrAm1qz82O9Uodg2D+1y+qJuy0gCXA=
X-Received: by 2002:a5d:818d:: with SMTP id u13mr7924963ion.92.1626890933175; 
 Wed, 21 Jul 2021 11:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210713220734.26302-1-niteesh.gs@gmail.com>
 <CAN6ztm97cJrVZ3=XPr9R8WoepOw81XAGXUO3fHB5nt7L9fWS4w@mail.gmail.com>
 <CAFn=p-aP5y=a56BK7X-B4KO8YL+d3O_MX3ekp3NQnGLGs8Dnww@mail.gmail.com>
In-Reply-To: <CAFn=p-aP5y=a56BK7X-B4KO8YL+d3O_MX3ekp3NQnGLGs8Dnww@mail.gmail.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Wed, 21 Jul 2021 23:38:27 +0530
Message-ID: <CAN6ztm8yqX=VZON3is8ni5a5kXr7xQrdNubA6Pj+p0fUGadOEA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] python: AQMP-TUI Prototype
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000029091405c7a61040"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000029091405c7a61040
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 21, 2021 at 12:39 AM John Snow <jsnow@redhat.com> wrote:

>
>
> On Wed, Jul 14, 2021 at 3:07 PM Niteesh G. S. <niteesh.gs@gmail.com>
> wrote:
>
>> Hello all,
>>
>> UPDATE:  The pipelines have run and all tests passed #336491916
>> Usually, the pipelines start running as soon as I push my code. But this
>> time they took longer to start and there was no sign of starting. This is
>> my
>> first experience with pipelines so I assumed I messed up something from
>> my side.
>>
>> Thanks,
>> Niteesh.
>>
>> On Wed, Jul 14, 2021 at 3:37 AM G S Niteesh Babu <niteesh.gs@gmail.com>
>> wrote:
>>
>>> GitLab:
>>> https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v1/
>>> Based-on
>>> <https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v1/Based-on>:
>>> <20210701041313.1696009-1-jsnow@redhat.com>
>>>      [PATCH 00/20] python: introduce Asynchronous QMP package
>>>
>>> Updates in V2:
>>> 1) Moved loop related initialization to 'run' function in 'App' class
>>> 2) Added a module logger with support in TUI log messages.
>>> 3) Corrected usage of logging.info and logging.debug
>>> 4) Added an option in setup.cfg to silent pylint regarding duplicate-code
>>> 4) Modified the arguments list to the TUI
>>>
>>> NOTE: I am not able to get the pipelines running after the v2 changes.
>>> I was only able to test the changes locally using *make check*.
>>>
>>>
> Why not?
>
I have already updated the status of this
https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg04059.html
All pipelines have run and all passed.

>
>
>> This patch series introduces AQMP-TUI prototype. This prototype has been
>>> helpfull in letting us try out different ideas and giving some insights
>>> into things that we had to take care of in the upcoming TUI. It was also
>>> helpfull in finding out bugs in the AQMP library.
>>>
>>> The intent for this patch series is to get comments on the architectural
>>> design of the prototype. These comments will lay down the foundation for
>>> the upcoming TUI.
>>>
>>> G S Niteesh Babu (6):
>>>   python: disable pylint errors for aqmp-tui
>>>   python: Add dependencies for AQMP TUI
>>>   python/aqmp-tui: Add AQMP TUI draft
>>>   python: add optional pygments dependency
>>>   python/aqmp-tui: add syntax highlighting
>>>   python: add entry point for aqmp-tui
>>>
>>>  python/Pipfile.lock          |  20 ++
>>>  python/qemu/aqmp/aqmp_tui.py | 342 +++++++++++++++++++++++++++++++++++
>>>  python/setup.cfg             |  36 +++-
>>>  3 files changed, 397 insertions(+), 1 deletion(-)
>>>  create mode 100644 python/qemu/aqmp/aqmp_tui.py
>>>
>>>
> Thanks Niteesh, a few general comments that don't relate directly to the
> code:
>
> 1. It would be nice to be able to highlight/copy-paste things out of the
> history window, I seemingly can't right now.
>
> 2. It would be nice if the mouse scroll wheel worked on the history panel.
>
> 3. A greeting message like the old qmp-shell might be nice to see. It
> would be good if it explained how to quit the program (esc, ctrl^c) and
> send messages (alt+enter).
>
> 4. Some control hints or reminder text in the footer might be nice, for
> how to quit, send a message, etc.
>
I'll update the status here as I start working on them one by one.

For the next revision, I may ask you to start looking into making sure that
> mypy and pylint pass without exemptions. Do the best you can, and get as
> far as you are able. You can leave the warnings disabled for V3, but I'd
> like you to start taking a look now so that you know where the trouble
> spots are.
>
Sure.



> Thanks!
> --js
>

--00000000000029091405c7a61040
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jul 21, 2021 at 12:39 AM John Snow &lt;<a h=
ref=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jul 14, 2021 at 3:07 PM Niteesh G. S.=
 &lt;<a href=3D"mailto:niteesh.gs@gmail.com" target=3D"_blank">niteesh.gs@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small">He=
llo all,</div><div style=3D"font-size:small"><br></div><div style=3D"font-s=
ize:small">UPDATE:=C2=A0 The pipelines have run and all tests passed #33649=
1916</div><div style=3D"font-size:small">Usually, the pipelines start runni=
ng as soon as I push my code. But this</div><div style=3D"font-size:small">=
time they took longer to start and there was no sign of starting. This is m=
y</div><div style=3D"font-size:small">first experience=C2=A0with pipelines =
so I assumed I messed up something from</div><div style=3D"font-size:small"=
>my side.</div><div style=3D"font-size:small"><br></div><div style=3D"font-=
size:small">Thanks,</div><div style=3D"font-size:small">Niteesh.</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On We=
d, Jul 14, 2021 at 3:37 AM G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.g=
s@gmail.com" target=3D"_blank">niteesh.gs@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">GitLab: <a href=3D"https=
://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v1/Based-on" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/niteesh.gs/qemu/-/comm=
its/aqmp-tui-prototype-v1/<br>
Based-on</a>: &lt;<a href=3D"mailto:20210701041313.1696009-1-jsnow@redhat.c=
om" target=3D"_blank">20210701041313.1696009-1-jsnow@redhat.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0[PATCH 00/20] python: introduce Asynchronous QMP packag=
e<br>
<br>
Updates in V2:<br>
1) Moved loop related initialization to &#39;run&#39; function in &#39;App&=
#39; class<br>
2) Added a module logger with support in TUI log messages.<br>
3) Corrected usage of <a href=3D"http://logging.info" rel=3D"noreferrer" ta=
rget=3D"_blank">logging.info</a> and logging.debug<br>
4) Added an option in setup.cfg to silent pylint regarding duplicate-code<b=
r>
4) Modified the arguments list to the TUI<br>
<br>
NOTE: I am not able to get the pipelines running after the v2 changes.<br>
I was only able to test the changes locally using *make check*.<br>
<br></blockquote></div></div></blockquote><div><br></div><div>Why not?<br><=
/div></div></div></blockquote><div><span class=3D"gmail_default" style=3D"f=
ont-size:small">I have already updated the status of this</span></div><div>=
<span class=3D"gmail_default" style=3D"font-size:small"><a href=3D"https://=
lists.gnu.org/archive/html/qemu-devel/2021-07/msg04059.html" target=3D"_bla=
nk">https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg04059.html</a>=
<br></span></div><div><span class=3D"gmail_default" style=3D"font-size:smal=
l">All pipelines have run and all passed.</span></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><d=
iv></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
This patch series introduces AQMP-TUI prototype. This prototype has been<br=
>
helpfull in letting us try out different ideas and giving some insights<br>
into things that we had to take care of in the upcoming TUI. It was also<br=
>
helpfull in finding out bugs in the AQMP library.<br>
<br>
The intent for this patch series is to get comments on the architectural<br=
>
design of the prototype. These comments will lay down the foundation for<br=
>
the upcoming TUI.<br>
<br>
G S Niteesh Babu (6):<br>
=C2=A0 python: disable pylint errors for aqmp-tui<br>
=C2=A0 python: Add dependencies for AQMP TUI<br>
=C2=A0 python/aqmp-tui: Add AQMP TUI draft<br>
=C2=A0 python: add optional pygments dependency<br>
=C2=A0 python/aqmp-tui: add syntax highlighting<br>
=C2=A0 python: add entry point for aqmp-tui<br>
<br>
=C2=A0python/Pipfile.lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 ++<b=
r>
=C2=A0python/qemu/aqmp/aqmp_tui.py | 342 ++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 36 +++-<br>
=C2=A03 files changed, 397 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 python/qemu/aqmp/aqmp_tui.py<br>
<br></blockquote></div></div></blockquote><div><br></div><div>Thanks Nitees=
h, a few general comments that don&#39;t relate directly to the code:</div>=
<div><br></div><div> 1. It would be nice to be able to highlight/copy-paste=
 things out of the history window, I seemingly can&#39;t right now.<br><br>=
2. It would be nice if the mouse scroll wheel worked on the history panel.<=
br><br>3. A greeting message like the old qmp-shell might be nice to see. I=
t would be good if it explained how to quit the program (esc, ctrl^c) and s=
end messages (alt+enter).<br><br>4. Some control hints or reminder text in =
the footer might be nice, for how to quit, send a message, etc.</div></div>=
</div></blockquote><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">I&#39;ll update the status here as I start working on them one by one.<=
/div></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote"><div>For the next revision, I may ask you to start look=
ing into making sure that mypy and pylint pass without exemptions. Do the b=
est you can, and get as far as you are able. You can leave the warnings dis=
abled for V3, but I&#39;d like you to start taking a look now so that you k=
now where the trouble spots are.</div></div></div></blockquote><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Sure.</div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_quote"><div>Thanks!</div><div>--js<br></div></div><=
/div>
</blockquote></div></div>

--00000000000029091405c7a61040--

