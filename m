Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6AB6DF846
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 16:21:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmbLd-0002We-83; Wed, 12 Apr 2023 10:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pmbLa-0002Pi-Ly
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 10:21:18 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pmbLY-0006u8-8I
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 10:21:18 -0400
Received: by mail-ej1-x62f.google.com with SMTP id qa44so28959102ejc.4
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681309274;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vNcEhx53yBGkD4ySOem+7VK+jhrU/Z8Hvr87y0N+7I0=;
 b=nsUVaFGA6lfRVX1n7VkpWgmWFDH0aA5fbEgb1jvd6pmACGd/AiMZSBvSC3JTTqwAAK
 J8Bb9ka6OBFako4MHZMJGbhDgrSIxAO6dLs1CVTFBfpUCDaUBfS9X0xzJ1OK70V3Qm9i
 XbbCyhdANZMwHv5pgCOGlzHx9qpE/N72qjpoYmWYE3J9FXTge1S/RwC+3m2y6dP++m01
 SazxRwqdGCTmmMtYXGT8/4uR1fM3vBcMAIaC95+hM8p5Op6pymFddf4B/fZPmUSvSoXn
 AF6s2Ob5C7yWhfVy4E8HQYBEjEaUlf2lAGT04Zn/0ZrNeDuzpko4HgzzRH0d+GLJXGX3
 COzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681309274;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vNcEhx53yBGkD4ySOem+7VK+jhrU/Z8Hvr87y0N+7I0=;
 b=H0FQ1aQRLvgTwZWO9XdC3YOp9XurohO4tDKXQ6qeA8I9LsonMd8wG1TFxq6I3DZfnS
 3kK0TTrCsIm4UA1XWv/g59ltijtLHUjaM+a/npJcNq+PwHvR6dzCv8RRvHYxsqV+lYmq
 r93RI7D8jhxMan5kL0vac0vnRnF1SqayleSP+HvxbKzYe7l47C17fX8wDCne3RDlUTTc
 XBuRdhl54R15rwnSr5NgTj1Ys/AeXQRw8TMQkNOPO4kWkDCGzz6fZUEjpTzqMdyOEJF0
 WGDIpeaIk1XU8ZLzhaqmytTg9TYp5Gj6PwRTBE/KBgmvAp33TofWXm7OGrjrVxUdwx1G
 ojvA==
X-Gm-Message-State: AAQBX9coOzHlaw2a1On/VPH/Bfdi7VfStfiRaJP7uktStadhgo//vMb1
 kTaiy4Akl5BK7JBk/CT97MCernuA6UYmLtWhqeO9asHoIIPM00ov
X-Google-Smtp-Source: AKy350YxzoiHpALmIDl45357ztCXISJ0UR3L2vSl7O8FD14+iuBr/JGgtYy+L+DlUPI4CN6hWIOYkJg3mdbeE1Kpv7U=
X-Received: by 2002:a17:906:3617:b0:94e:4925:3c41 with SMTP id
 q23-20020a170906361700b0094e49253c41mr1806616ejb.2.1681309274209; Wed, 12 Apr
 2023 07:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230411170955.17358-1-imp@bsdimp.com>
 <20230411170955.17358-19-imp@bsdimp.com>
 <7f006fb2-d88c-61e2-d536-ba6369107972@linaro.org>
In-Reply-To: <7f006fb2-d88c-61e2-d536-ba6369107972@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 12 Apr 2023 08:21:08 -0600
Message-ID: <CANCZdfrWPxfQXBUsTqG9qezuN+qvdfamOJo2rLeO9Ass1PCPyQ@mail.gmail.com>
Subject: Re: [PATCH v3 18/20] bsd-user: Automatically generate syscall_nr.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, ryoon@netbsd.org, kevans@freebsd.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com, 
 reinoud@netbsd.org, jrtc27@jrtc27.com, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000c1a4905f92452a4"
Received-SPF: none client-ip=2a00:1450:4864:20::62f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000000c1a4905f92452a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 4:10=E2=80=AFAM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 4/11/23 19:09, Warner Losh wrote:
> > +++ b/bsd-user/syscallhdr.sh
> > @@ -0,0 +1,7 @@
> > +#!/bin/sh
> > +
> > +in=3D"$1"
> > +out=3D"$2"
> > +bsd=3D"$3"
> > +
> > +awk -v bsd=3D"$3" '{sub("SYS_", "TARGET_" bsd "_NR_", $0); print;}' < =
$in
> > $out
>
> If the host/guest syscall numbers always match, there's no point in using
> TARGET_freebsd_NR_foo at all -- just use the original SYS_foo symbol from
> <sys/syscall.h>.
>

long term, this is likely correct. Short term, though, changing to SYS_foo
would cause quite a bit
of churn that I'm looking to avoid. bsd-user has two branches, and the
newest branch has problems
with threads we've not been able to completely track down, so we can't
switch to using it just yet.
So we have to still add new system calls to the old code base, which is
made harder as the number
of differences proliferate.

This is the first step, though, towards that goal: not updating the system
call tables as much, and
generating more code where possible to reduce the load we have on
hand-coded stuff.

Warner

--0000000000000c1a4905f92452a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 12, 2023 at 4:10=E2=80=AF=
AM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">ri=
chard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 4/11/23 19:09, Warner Losh wrote:<br>
&gt; +++ b/bsd-user/syscallhdr.sh<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +in=3D&quot;$1&quot;<br>
&gt; +out=3D&quot;$2&quot;<br>
&gt; +bsd=3D&quot;$3&quot;<br>
&gt; +<br>
&gt; +awk -v bsd=3D&quot;$3&quot; &#39;{sub(&quot;SYS_&quot;, &quot;TARGET_=
&quot; bsd &quot;_NR_&quot;, $0); print;}&#39; &lt; $in &gt; $out<br>
<br>
If the host/guest syscall numbers always match, there&#39;s no point in usi=
ng <br>
TARGET_freebsd_NR_foo at all -- just use the original SYS_foo symbol from &=
lt;sys/syscall.h&gt;.<br></blockquote><div><br></div><div>long term, this i=
s likely correct. Short term, though, changing to SYS_foo would cause quite=
 a bit</div><div>of churn that I&#39;m looking to avoid. bsd-user has two b=
ranches, and the newest branch has problems</div><div>with threads we&#39;v=
e not been able to completely track down, so we can&#39;t switch to using i=
t just yet.</div><div>So we have to still add new system calls to the old c=
ode base, which is made harder as the number</div><div>of differences proli=
ferate.</div><div><br></div><div>This is the first step, though, towards th=
at goal: not updating the system call tables as much, and</div><div>generat=
ing more code where possible to reduce the load we have on hand-coded stuff=
.<br></div><div><br></div><div>Warner <br></div></div></div>

--0000000000000c1a4905f92452a4--

