Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087663DE40C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 03:36:03 +0200 (CEST)
Received: from localhost ([::1]:46996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAjLd-0000f0-GQ
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 21:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ctcaulfield@gmail.com>)
 id 1mAjKC-0008Kp-3w
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 21:34:32 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ctcaulfield@gmail.com>)
 id 1mAjKA-0004Is-3w
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 21:34:31 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h14so23441667wrx.10
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 18:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T61p7anie8Sn0XSb21SJo4a1aJmnaCOVoCI/mF+e6v4=;
 b=FCiyFvDMg7SWSBNakuwJe49PMbuGQQOCM8kq0CoE7sizi/uc/8Z6AijAh5a6XpidiO
 N4Zowd2nnIxlZUPd2Kn1mQ86HbaaSwfMHyPWo4I9az1v1tKIAlAuG/o8GZJntDmQJczh
 GWe9KIzEVmvdxM3WuJBjmD0/jAg/gqM0jKL+mw367wShjNoKCZoYTXGxZIOBGbz2oq+y
 JHC5ObY5trZj6USby2GeJgPgjrqsGZiKi+A7QvpxnnDi4ldMXe56GaWF/UDgGcZOiLqR
 qHkmwwlICTEZDTNP7k2X5rC/H9bwse5BTW6TSWeSCMgvm/y9AYrpY4r/SM6dulvL9gCz
 GSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T61p7anie8Sn0XSb21SJo4a1aJmnaCOVoCI/mF+e6v4=;
 b=kwuzD01J6PmvzYZIRx7IS5pNX69E3iie/PRNve7wv5a1icHbl/pyTz/zP0XzjN3aS1
 rGlBGmb5z9y/Ojqf1wOnUknwzl0WTY2plnHvE3I39fnJEgCTvPTIqT8pE7LJ8OtMVUwj
 csMRs+GCA8Q4gu9pwNMTlcEmqrxosZu1ISY1AX1+tzsuoixPIYHXZUQpv6f6Cm/XgBVK
 NtW/Rl9y3LHiijVCnyEnxzVvZVjciedAX+hJonFO49Be7LmDVwdv9GLKQQK17gF4MdPY
 H097gq9ANPBhp9mN/64Dj4tOyrl8rEe2hgG4E44mx5Mtvvn19N3GuSMeZ2xJBFuWd8+w
 ArIw==
X-Gm-Message-State: AOAM530SOxgLMAtH++d4zEZpGe8i0VhD9Zf24z7BqyhTWlshmsyf1gHO
 N7chreQEsKPqnMDDvaxxx8Ozb8XBtJHecnYtBxg=
X-Google-Smtp-Source: ABdhPJyhZwQwMj1cxRl/lgaV8arhBHYZN++GZCq8jIEyohxGKjFuQJKADNF6iLW+1Jpo2p/fM+ANhHvZFwo8+wnkkeg=
X-Received: by 2002:adf:eec9:: with SMTP id a9mr20640534wrp.157.1627954467281; 
 Mon, 02 Aug 2021 18:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAGu1Vjjot17roFD-YTWmQcDhhMD=Lzi3b3Q51cHNRnz+6JT_HQ@mail.gmail.com>
 <CAFEAcA9QexXsrXMHMQrS-aGNbA_4_G2CB+9KeRJqMEF5LQ84ig@mail.gmail.com>
 <87zgtzg33v.fsf@linaro.org>
In-Reply-To: <87zgtzg33v.fsf@linaro.org>
From: Christopher Caulfield <ctcaulfield@gmail.com>
Date: Mon, 2 Aug 2021 18:34:04 -0700
Message-ID: <CAGu1Vjix18j69s2n4VjB=zJWvH2rKUeXhhinboCVx0Ba9vuPCw@mail.gmail.com>
Subject: Re: QEMU on x64
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000bba04705c89daf58"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ctcaulfield@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 alexsmendez@live.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bba04705c89daf58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks folks! I went ahead and made a feature/issue request based on
Paolo's suggestion:
QEMU registers support on x64 (#510) =C2=B7 Issues =C2=B7 QEMU / QEMU =C2=
=B7 GitLab
<https://gitlab.com/qemu-project/qemu/-/issues/510>

Please let me know if someone has the cycles to support this.

-Christopher

On Mon, Aug 2, 2021 at 10:37 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 30 Jul 2021 at 19:05, Christopher Caulfield
> > <ctcaulfield@gmail.com> wrote:
> >> This is Christopher from the debugging experiences team at Microsoft
> focused on kernel debugging. I am reaching out with a few questions about
> QEMU on x64.
> >>
> >> Is it possible for the QEMU-x86-64 GDB Server to send the full set
> >> of x64 system registers (whether they are included in a separated
> >> system xml file or as part of the core registers xml file)?
> >
> > Do you mean "is it possible for somebody to write code for
> > QEMU to make it do that", or "does QEMU do it today if you pass
> > it the right command line option" ? The answer to the former
> > is "yes", to the latter "no". (If you want the debugger to
> > be able to write to the system registers this might be a little
> > trickier, mostly in terms of "auditing the code to make sure this
> > can't confuse QEMU if you change some sysreg under its feet.".)
> >
> >> e.g. System registers missing from i386-64bit.xml file
> >
> >> DWORD64 IDTBase;
> >> DWORD64 IDTLimit;
> >> DWORD64 GDTBase;
> >> DWORD64 GDTLimit;
> >> DWORD SelLDT;
> >> SEG64_DESC_INFO SegLDT;
> >> DWORD SelTSS;
> >> SEG64_DESC_INFO SegTSS;
> >>
> >> How can I access x64 MSR registers by using the QEMU-x86-64 GDB server=
?
> >>
> >> #define MSR_EFER 0xc0000080 // extended function enable register
> >
> > EFER is in the xml ("x64_efer") so should be already accessible.
> > For anything else you're going to need to write some code to
> > make it happen.
> >
> >>is there any plan to support reading/writing to MSRs via QEMU-x86-64
> >GDB server?
>
> Not at the moment but I am keen to see any eventual solution try to be
> generic rather than hardwired for one architecture. The ARM code
> currently builds custom XML from it's register descriptors to expose
> it's MSR registers to the gdbstub. Ideally architecture front ends
> should register their registers with a new subsystem which can then do
> the glue between gdbstub as well as other systems that also care about
> register values (logging, HMP, TCG plugins).
>
> That said I'm not going to block any patches that just fix up the
> current XML and target/i386/gdbstub code. I'm not familiar enough with
> what the internal register representation state is for x86 w.r.t to TCG
> and hypervisor based running modes.
>
> > Not that I know of. We'd be happy to review patches if you want to
> > write them.
> >
> > thanks
> > -- PMM
>
>
> --
> Alex Benn=C3=A9e
>

--000000000000bba04705c89daf58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks folks! I went ahead and made=C2=A0a feature/is=
sue request based on Paolo&#39;s suggestion:</div><a href=3D"https://gitlab=
.com/qemu-project/qemu/-/issues/510">QEMU registers support on x64 (#510) =
=C2=B7 Issues =C2=B7 QEMU / QEMU =C2=B7 GitLab</a><br><div><br></div><div>P=
lease let me know if someone has the cycles to support this.=C2=A0</div><di=
v><br></div><div>-Christopher</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 10:37 AM Alex Ben=
n=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_bl=
ank">peter.maydell@linaro.org</a>&gt; writes:<br>
<br>
&gt; On Fri, 30 Jul 2021 at 19:05, Christopher Caulfield<br>
&gt; &lt;<a href=3D"mailto:ctcaulfield@gmail.com" target=3D"_blank">ctcaulf=
ield@gmail.com</a>&gt; wrote:<br>
&gt;&gt; This is Christopher from the debugging experiences team at Microso=
ft focused on kernel debugging. I am reaching out with a few questions abou=
t QEMU on x64.<br>
&gt;&gt;<br>
&gt;&gt; Is it possible for the QEMU-x86-64 GDB Server to send the full set=
<br>
&gt;&gt; of x64 system registers (whether they are included in a separated<=
br>
&gt;&gt; system xml file or as part of the core registers xml file)?<br>
&gt;<br>
&gt; Do you mean &quot;is it possible for somebody to write code for<br>
&gt; QEMU to make it do that&quot;, or &quot;does QEMU do it today if you p=
ass<br>
&gt; it the right command line option&quot; ? The answer to the former<br>
&gt; is &quot;yes&quot;, to the latter &quot;no&quot;. (If you want the deb=
ugger to<br>
&gt; be able to write to the system registers this might be a little<br>
&gt; trickier, mostly in terms of &quot;auditing the code to make sure this=
<br>
&gt; can&#39;t confuse QEMU if you change some sysreg under its feet.&quot;=
.)<br>
&gt;<br>
&gt;&gt; e.g. System registers missing from i386-64bit.xml file<br>
&gt;<br>
&gt;&gt; DWORD64 IDTBase;<br>
&gt;&gt; DWORD64 IDTLimit;<br>
&gt;&gt; DWORD64 GDTBase;<br>
&gt;&gt; DWORD64 GDTLimit;<br>
&gt;&gt; DWORD SelLDT;<br>
&gt;&gt; SEG64_DESC_INFO SegLDT;<br>
&gt;&gt; DWORD SelTSS;<br>
&gt;&gt; SEG64_DESC_INFO SegTSS;<br>
&gt;&gt;<br>
&gt;&gt; How can I access x64 MSR registers by using the QEMU-x86-64 GDB se=
rver?<br>
&gt;&gt;<br>
&gt;&gt; #define MSR_EFER 0xc0000080 // extended function enable register<b=
r>
&gt;<br>
&gt; EFER is in the xml (&quot;x64_efer&quot;) so should be already accessi=
ble.<br>
&gt; For anything else you&#39;re going to need to write some code to<br>
&gt; make it happen.<br>
&gt;<br>
&gt;&gt;is there any plan to support reading/writing to MSRs via QEMU-x86-6=
4<br>
&gt;GDB server?<br>
<br>
Not at the moment but I am keen to see any eventual solution try to be<br>
generic rather than hardwired for one architecture. The ARM code<br>
currently builds custom XML from it&#39;s register descriptors to expose<br=
>
it&#39;s MSR registers to the gdbstub. Ideally architecture front ends<br>
should register their registers with a new subsystem which can then do<br>
the glue between gdbstub as well as other systems that also care about<br>
register values (logging, HMP, TCG plugins).<br>
<br>
That said I&#39;m not going to block any patches that just fix up the<br>
current XML and target/i386/gdbstub code. I&#39;m not familiar enough with<=
br>
what the internal register representation state is for x86 w.r.t to TCG<br>
and hypervisor based running modes.<br>
<br>
&gt; Not that I know of. We&#39;d be happy to review patches if you want to=
<br>
&gt; write them.<br>
&gt;<br>
&gt; thanks<br>
&gt; -- PMM<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div>

--000000000000bba04705c89daf58--

