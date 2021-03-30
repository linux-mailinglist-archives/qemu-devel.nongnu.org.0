Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBCB34EDBD
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 18:27:13 +0200 (CEST)
Received: from localhost ([::1]:43426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRHCy-0006VS-CR
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 12:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lRHB1-0005up-Ut
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:25:11 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:35450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lRHAz-00021i-Ua
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:25:11 -0400
Received: by mail-qk1-x72f.google.com with SMTP id i9so16429686qka.2
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vmWYFU9AAdtIkHafO7QPGzpOvRf3TLGpKl+BsJuDPPQ=;
 b=T0eV0gj2xSYUF5WEf0c7HdG4H3DrW5m4asgk/9FgP05+QXptjGbZszk3qAxHc5h2bS
 jZcA+uJQxtJob9x+G55zT1QNSXDic4cVtPgGPnAdS4ejWEcVklyyJMysaJugfqVnC0ff
 Oku8NapCF7xbStiBTsbAZxS8Mg2THmzVlUGVzounKSGXEa5+/M96ONZX45hpstzxanSW
 /Of1FJ3m3c1C2YHRAGyurInmZ6DfQpCs+d3JCN374G/lC3vp7FcChHhxfjxM++SCWK7j
 cREK4mx1gnpA/kqJmRTcrUqQI2NWPB1RBBSgdY23P/z2pUnCJNxv3KXLdlKPmIx1/zNk
 W+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vmWYFU9AAdtIkHafO7QPGzpOvRf3TLGpKl+BsJuDPPQ=;
 b=FXatvFzMqnoFbeHNoINpYbU264PJBRXKgb0fezyVB77vU9UBRl/71/L4yj3EpXns6y
 NV/T7PaFNes/ZVNReYDVjpo8UQ1Urwh8FdCctmISEQFg+60B9IBj5F6VeXYJYsMNIU4u
 82pcjY/qPeTgCvmevxIZ1JvBMfxS/YcLEmqbKlrmE7GvUsjc+SkYoEQjkBsCJ/RZMaLA
 Ne7Nx1keHW+E74wBtczzcFQLHjrl7u+4umvf9yUtYl829a5c4wv/n/SgJMSIgXfrljUE
 sFBBkyyZq3HdRc1JP2m+4gFtTabKqd3uJUL6b1BVLbGi2BwO5yBUzlRw0J+udeRvbbTJ
 BPuQ==
X-Gm-Message-State: AOAM532QXBaPNmp9KbZd7SpESu+PAKXfR1EJrerE20Rd2xj1PcZnnfzi
 B6kPxIWhccUEFb954TaV26dma5jj6ZrgV3SRPi4CFA==
X-Google-Smtp-Source: ABdhPJy2E3uLXTZk25/qopCp2/bGcKWNoY2AU3CMyvGHkS6hFBY+nuOgoOhKSwFxlmMZP7RZnqvlmQ3RK4S7IjWrsHo=
X-Received: by 2002:a37:a085:: with SMTP id
 j127mr29748387qke.206.1617121508478; 
 Tue, 30 Mar 2021 09:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain>
 <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
 <902a93ca-bd71-504b-fcf5-fec2480f9ec0@redhat.com>
 <a5a40558-4f5a-223d-a7ea-c02f7fc14eef@amsat.org>
 <1bb868bb-d9d7-3a9a-cbd4-2e1780b46442@redhat.com>
 <YGMjypzf1hHk47bC@redhat.com>
 <23fcbe91-1b9c-559d-1a61-6cce839bb390@redhat.com>
 <YGMnVy4LDHu28wW4@redhat.com>
 <CANCZdfqE9wOppe2PYco7-x630Q6xeCezG6=nh+UfbgN_j140HQ@mail.gmail.com>
 <CAFEAcA_w_XPvCgaFGgOTCX7H2DmQQu+H8GysFou--bv6Z3NehQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_w_XPvCgaFGgOTCX7H2DmQQu+H8GysFou--bv6Z3NehQ@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 30 Mar 2021 10:24:57 -0600
Message-ID: <CANCZdfo4amKfByfGQUvnrPRL0=YdfKxO9=85JF=eqc-YhJZqCg@mail.gmail.com>
Subject: Re: Serious doubts about Gitlab CI
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000012667e05bec37146"
Received-SPF: none client-ip=2607:f8b0:4864:20::72f;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72f.google.com
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000012667e05bec37146
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 30, 2021 at 10:11 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 30 Mar 2021 at 17:00, Warner Losh <imp@bsdimp.com> wrote:
> > submodules have caused me significant pain in rebasing the bsd-user work.
> > The way QEMU does things, you wind up with unclean trees after a build,
> > which causes grief at times... I for one, would shed no tears at the
> number of
> > submodules dropping to 0.
>
> I agree that submodules are bad, but in general you shouldn't have
> an unclean tree after build as a result of them. (The exception I'm
> aware of is if you have to 'git checkout' an older revision where a
> submodule that exists now didn't exist back then; git leaves the
> submodule directory in the source tree and you have to rm it manually.
> But that's "after checkout", not "after build".)
>

It may be that. I routinely have issues when switching back and forth
between
3.1 based rebase and tip of master. I chalked it up to some submodule update
that was done as part of the built, but I could well be wrong. subrepos are
a
thing I've not managed so my subrepo foo is weak.


> The main bear-trap IMHO is that you have to remember to
> "git submodule update" when checking out different revs of
> trunk to keep the submodules at the right version. I wish
> git just automatically kept submodules at the right rev for
> whatever trunk rev you're currently on.


I'll have to try it next time. Maybe it was the only hassle and I was
unaware.
But hopefully I'll be focused on doing a 'logical rebase' of committable
things
that I've started and that will ultimately render this problem obsolete for
me.

Warner

--00000000000012667e05bec37146
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 30, 2021 at 10:11 AM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue, 30 Mar 2021 at 17:00, Warner Losh &lt;<a href=3D"mailto:imp@=
bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt; submodules have caused me significant pain in rebasing the bsd-user wo=
rk.<br>
&gt; The way QEMU does things, you wind up with unclean trees after a build=
,<br>
&gt; which causes grief at times... I for one, would shed no tears at the n=
umber of<br>
&gt; submodules dropping to 0.<br>
<br>
I agree that submodules are bad, but in general you shouldn&#39;t have<br>
an unclean tree after build as a result of them. (The exception I&#39;m<br>
aware of is if you have to &#39;git checkout&#39; an older revision where a=
<br>
submodule that exists now didn&#39;t exist back then; git leaves the<br>
submodule directory in the source tree and you have to rm it manually.<br>
But that&#39;s &quot;after checkout&quot;, not &quot;after build&quot;.)<br=
></blockquote><div><br></div><div>It may be that. I routinely have issues w=
hen switching back and forth between</div><div>3.1 based rebase and tip of =
master. I chalked it up to some submodule update</div><div>that was done as=
 part of the built, but I could well be wrong. subrepos are a</div><div>thi=
ng I&#39;ve not managed so my subrepo foo is weak.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
The main bear-trap IMHO is that you have to remember to<br>
&quot;git submodule update&quot; when checking out different revs of<br>
trunk to keep the submodules at the right version. I wish<br>
git just automatically kept submodules at the right rev for<br>
whatever trunk rev you&#39;re currently on.</blockquote><div><br></div><div=
>I&#39;ll have to try it next time. Maybe it was the only hassle and I was =
unaware.</div><div>But hopefully I&#39;ll be focused on doing a &#39;logica=
l rebase&#39; of committable things</div><div>that I&#39;ve started and tha=
t will ultimately render this problem obsolete for</div><div>me.</div><div>=
<br></div><div>Warner</div></div></div>

--00000000000012667e05bec37146--

