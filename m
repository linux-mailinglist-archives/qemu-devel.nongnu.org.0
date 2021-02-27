Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65823326DE0
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 17:32:59 +0100 (CET)
Received: from localhost ([::1]:51712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lG2WX-0007qa-P3
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 11:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akalita@cs.stonybrook.edu>)
 id 1lG2V0-0007Fr-87
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 11:31:22 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:46124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akalita@cs.stonybrook.edu>)
 id 1lG2Uy-0001Gb-8T
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 11:31:22 -0500
Received: by mail-oi1-x22a.google.com with SMTP id f3so13257983oiw.13
 for <qemu-devel@nongnu.org>; Sat, 27 Feb 2021 08:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stonybrook.edu; s=sbu-gmail;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MyWeBZuB75WNtlOz002yGrr09e1A5lya2+yZcRoha3U=;
 b=tb3Zj9yfzNeIJn9dMA7V7Ij+3cmEy3dvRXbY/yNk8YbN16AagjSxluYhYP8qZB/Uj0
 ePdw7Puxo5j7qlyk1lC5l0Ggbv1GZ8sCTPENLDg8AFWE8yRKusVXslF/9eCL9yb2KVT0
 TEJVsXd0VZU+fB+XAmFoAV0Xpe8IJKG8irhW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MyWeBZuB75WNtlOz002yGrr09e1A5lya2+yZcRoha3U=;
 b=d9zwOEw0eeddyPOjkqIgEO59UgOe8Jg5QgHfbLPYuRy4PoDIEnv6+w7G7GUWPNeMQv
 MnYGIfTH6NdXwlV/YTAWKIbwhQojPnNnvLQOgmE9izLq9yIVhprL9bdkJIjrpPuWoaYu
 42kz8L5eWMuz1r8EhXduAn7WJEg+vaFA3kmaKIi5W2bOmI/n8MCyEl7Jp4kLhd+fV1DS
 +ye6wnauFDmZmIR8z/exz6AftZgDmYRBlCml0Ul2BtDqO/h1PZjY6T9yd0tGl0xXsNBU
 nA2nAcS2W0s4GsceOZGBwkAvSsQFnj+m6f2P82UvorCov3v3+LXohncx6lrjI9+HHxs1
 hylQ==
X-Gm-Message-State: AOAM530SJulF2u7nsLlySrTdpTjc9AyqsIqQeLG4iWSW5cTQdgaBTEPs
 vjL2P1Ab0DZ3idUmk76tqurwvZONPmK+SAhycU15WA==
X-Google-Smtp-Source: ABdhPJwOaw1/kGjQYVQ6eECjgH0HJgHtfwxCPscLRRrkpvqrmLDaFQhp9QB5NJ2HAnxGKPZFDdTwE9HqL3BDm+N2iao=
X-Received: by 2002:aca:4ecb:: with SMTP id c194mr5882833oib.10.1614443478996; 
 Sat, 27 Feb 2021 08:31:18 -0800 (PST)
MIME-Version: 1.0
References: <CAJGDS+F0Mtv+XFXeR4wOP35UjmfKt+fiMAfraT7mg9J-4t+SiA@mail.gmail.com>
 <e4677d3d-b221-3bba-185c-5a43faf6aab7@redhat.com>
 <ffdcad8a-389a-ed22-0991-940ddeb3c8ed@ispras.ru>
 <87pn0n9mru.fsf@linaro.org>
In-Reply-To: <87pn0n9mru.fsf@linaro.org>
From: Arnabjyoti Kalita <akalita@cs.stonybrook.edu>
Date: Sat, 27 Feb 2021 22:01:07 +0530
Message-ID: <CAJGDS+HR9Ry2C_n+axC+dK=MR5wQs59nqhf-H7a3Ko+eDoH1Mg@mail.gmail.com>
Subject: Re: QEMU Clock record and replay
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000136c2205bc53eacf"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=akalita@cs.stonybrook.edu; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 qemu-devel <qemu-devel@nongnu.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000136c2205bc53eacf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The host clock refers to one of the clock types used by QEMU -

```
@QEMU_CLOCK_HOST: host clock
*
* The host clock should be used for device models that emulate accurate
* real time sources. It will continue to run when the virtual machine
* is suspended, and it will reflect system time changes the host may
* undergo (e.g. due to NTP).
```

Thanks.

Best Regards,
Arnab

On Fri, Feb 26, 2021 at 3:25 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
>
> > On 25.02.2021 18:43, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Cc'ing Pavel/Alex.
> >>
> >> On 2/25/21 4:09 PM, Arnabjyoti Kalita wrote:
> >>> Hello all,
> >>>
> >>> I am trying to understand how the clock values are recorded and
> replayed
> >>> in QEMU (when it runs in TCG mode). I have been specifically followin=
g
> >>> the document that has been provided here -
> >>> https://github.com/qemu/qemu/blob/master/docs/replay.txt
> >>> <https://github.com/qemu/qemu/blob/master/docs/replay.txt>
> >>>
> >>> I have the following 4 questions to ask-
> >>>
> >>> - Why are clock values being replayed off a cache and not directly of=
f
> >>> the file as seen here -
> >>> https://github.com/qemu/qemu/blob/stable-5.0/replay/replay-time.c#L45=
?
> >>> <https://github.com/qemu/qemu/blob/stable-5.0/replay/replay-time.c#L4=
5
> ?>?
> >
> > The cache was needed when replay does not follow the record behavior.
> > E.g., included additional deadline calculations or timer checks.
> > I'm not sure, that it is still needed, and I'll check it during future
> > refactoring session.
> >
> >>> - I have a requirement to record and replay host clock values. Can it
> so
> >>> happen that if incorrect values of the host clock are replayed, then
> the
> >>> timers in the guest start expiring incorrectly, during replay?
> >
> > This is a bug, when the host clock is replayed incorrectly.
>
> When you say host clock what do you mean? Surely all the cycle counters
> are VIRTUAL? Or do you mean things like the RTC?
>
> --
> Alex Benn=C3=A9e
>

--000000000000136c2205bc53eacf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The host clock refers to one of the clock types used =
by QEMU -<br><br>```<br><table class=3D"gmail-highlight gmail-tab-size gmai=
l-js-file-line-container"><tbody><tr><td id=3D"gmail-LC32" class=3D"gmail-b=
lob-code gmail-blob-code-inner gmail-js-file-line"><span class=3D"gmail-pl-=
c"> @QEMU_CLOCK_HOST: host clock</span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"gmail-highlight gmail-tab-size=
 gmail-js-file-line-container"><tbody><tr><td id=3D"gmail-LC33" class=3D"gm=
ail-blob-code gmail-blob-code-inner gmail-js-file-line"><span class=3D"gmai=
l-pl-c"> *</span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"gmail-highlight gmail-tab-size=
 gmail-js-file-line-container"><tbody><tr><td id=3D"gmail-LC34" class=3D"gm=
ail-blob-code gmail-blob-code-inner gmail-js-file-line"><span class=3D"gmai=
l-pl-c"> * The host clock should be used for device models that emulate acc=
urate</span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"gmail-highlight gmail-tab-size=
 gmail-js-file-line-container"><tbody><tr><td id=3D"gmail-LC35" class=3D"gm=
ail-blob-code gmail-blob-code-inner gmail-js-file-line"><span class=3D"gmai=
l-pl-c"> * real time sources. It will continue to run when the virtual mach=
ine</span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"gmail-highlight gmail-tab-size=
 gmail-js-file-line-container"><tbody><tr><td id=3D"gmail-LC36" class=3D"gm=
ail-blob-code gmail-blob-code-inner gmail-js-file-line"><span class=3D"gmai=
l-pl-c"> * is suspended, and it will reflect system time changes the host m=
ay</span></td>
      </tr>
      <tr>
        </tr></tbody></table><span class=3D"gmail-pl-c"> * undergo (e.g. du=
e to NTP).<br>```<br><br></span></div><div><span class=3D"gmail-pl-c">Thank=
s.<br><br></span></div><div><span class=3D"gmail-pl-c">Best Regards,<br></s=
pan></div><div><span class=3D"gmail-pl-c">Arnab<br></span></div><span class=
=3D"gmail-pl-c"></span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, Feb 26, 2021 at 3:25 PM Alex Benn=C3=A9e &lt=
;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Pavel Dovgalyuk &lt;<a href=3D"mailto:pavel.dovgalyuk@ispras.ru" target=3D"=
_blank">pavel.dovgalyuk@ispras.ru</a>&gt; writes:<br>
<br>
&gt; On 25.02.2021 18:43, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt;&gt; Cc&#39;ing Pavel/Alex.<br>
&gt;&gt; <br>
&gt;&gt; On 2/25/21 4:09 PM, Arnabjyoti Kalita wrote:<br>
&gt;&gt;&gt; Hello all,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I am trying to understand how the clock values are recorded an=
d replayed<br>
&gt;&gt;&gt; in QEMU (when it runs in TCG mode). I have been specifically f=
ollowing<br>
&gt;&gt;&gt; the document that has been provided here -<br>
&gt;&gt;&gt; <a href=3D"https://github.com/qemu/qemu/blob/master/docs/repla=
y.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/qemu/qemu/bl=
ob/master/docs/replay.txt</a><br>
&gt;&gt;&gt; &lt;<a href=3D"https://github.com/qemu/qemu/blob/master/docs/r=
eplay.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/qemu/qem=
u/blob/master/docs/replay.txt</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I have the following 4 questions to ask-<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - Why are clock values being replayed off a cache and not dire=
ctly off<br>
&gt;&gt;&gt; the file as seen here -<br>
&gt;&gt;&gt; <a href=3D"https://github.com/qemu/qemu/blob/stable-5.0/replay=
/replay-time.c#L45" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/qemu/qemu/blob/stable-5.0/replay/replay-time.c#L45</a>?<br>
&gt;&gt;&gt; &lt;<a href=3D"https://github.com/qemu/qemu/blob/stable-5.0/re=
play/replay-time.c#L45" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/qemu/qemu/blob/stable-5.0/replay/replay-time.c#L45</a>?&gt;?<br>
&gt;<br>
&gt; The cache was needed when replay does not follow the record behavior.<=
br>
&gt; E.g., included additional deadline calculations or timer checks.<br>
&gt; I&#39;m not sure, that it is still needed, and I&#39;ll check it durin=
g future<br>
&gt; refactoring session.<br>
&gt;<br>
&gt;&gt;&gt; - I have a requirement to record and replay host clock values.=
 Can it so<br>
&gt;&gt;&gt; happen that if incorrect values of the host clock are replayed=
, then the<br>
&gt;&gt;&gt; timers in the guest start expiring incorrectly, during replay?=
<br>
&gt;<br>
&gt; This is a bug, when the host clock is replayed incorrectly.<br>
<br>
When you say host clock what do you mean? Surely all the cycle counters<br>
are VIRTUAL? Or do you mean things like the RTC?<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div>

--000000000000136c2205bc53eacf--

