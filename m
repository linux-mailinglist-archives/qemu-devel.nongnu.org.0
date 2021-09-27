Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4717D419299
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:55:26 +0200 (CEST)
Received: from localhost ([::1]:59498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUoI9-0001Ie-Bb
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUoGd-0000QF-G2
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:53:52 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36]:36424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUoGY-0003p5-Ns
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:53:50 -0400
Received: by mail-vk1-xa36.google.com with SMTP id t186so6763643vkd.3
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 03:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5xbqQI0lhKymJK9dbq6bqX4ryZLG9KG2KAaatYT/eUM=;
 b=g5cnXLUEY1GWiYSr/0GTpVsy4qjy8DTAwL0rz0nA+PjeqsaF5jAGfzslhHzQV2VX2g
 SDUUEXx5YjlrfFInpafVSiHtlzhD9m4RmUmetS/L9ZAfwGoZerNB06OpO2/bosdoVMYD
 vXUk8/GievrLRLTAVLMfV4rB/TGqNKDJZKQ0ZFvJene5piyVtlD6QjjBX7q3NdDm0E03
 sg+lVmcE9/JBXVbENNcY6thUgdqQ1qx3nL41gTm77aEFpiuyTZFl82sdpEGPXEMTabc0
 9MFohS8eb/QzqZ6ar1rIQwn9dsJN+1aZJpPD4+r/bYSaRpOsQnoaHSOw5t8pR1C34VN3
 pEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5xbqQI0lhKymJK9dbq6bqX4ryZLG9KG2KAaatYT/eUM=;
 b=BG6SbS73Nvscp+qGTPv2qXyJv507L3vhooyphwasN0rLjH7vlEAGyb1yyvM2RiKz3u
 zkrlxXdPPS8KcgLgnOD13La8Ow8TuOM3dWLxt50JEXtzf1KuDVsyoVLWw9W6Po8pQl3k
 i9WOcJONJKsJDpCzr9+lWunCnVVbs0CdFzAMB3Pj8H6luN7kPMI9RL0FKjvIyX/hfB30
 zJ7frVENJ1wBYlJ1iVj3nHzn6OC/2grflSdXpqht+YauIwWytsDXAqbeBfp/ODUdSH1F
 8O0OFTzorCvr64aNbRkPYlmmiV1K9dk3QGVOnN4IcqXjDYTOhhZCN7ZbhGF/o98Dho8f
 73fg==
X-Gm-Message-State: AOAM532e0f4LauyuflnxiTO+8tl9XLI5Atfj9lXyZbDn0jHOCkC9rPp/
 3kLKOV8hSTtpJAfidMZPAuwGiWEgEIf9Fn0WE6sm9g==
X-Google-Smtp-Source: ABdhPJzuEKjvdhY8HDiW6HWvF6KW7boAC1WCWoRB0Q94s1m8h0atM9VU8K6rSoYSEVdVvsyVflKsf1W70pDBryJ0POU=
X-Received: by 2002:a1f:2914:: with SMTP id p20mr15283274vkp.5.1632740022662; 
 Mon, 27 Sep 2021 03:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
 <YVGUX6FZlFBhhgwn@redhat.com>
 <CAFEAcA_FRAHy1Hq2QxO2DWkrLZbW_4g=zzCoac18rRNf2CD0kw@mail.gmail.com>
In-Reply-To: <CAFEAcA_FRAHy1Hq2QxO2DWkrLZbW_4g=zzCoac18rRNf2CD0kw@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 27 Sep 2021 04:53:31 -0600
Message-ID: <CANCZdfrhw7i0Kd-dzy8FAWa4BW+4Tm2JSHpF4-T-ZGMhYy1EOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000fd0ad05ccf7e96b"
Received-SPF: none client-ip=2607:f8b0:4864:20::a36;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000fd0ad05ccf7e96b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 4:08 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 27 Sept 2021 at 10:59, Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
> wrote:
> > If we look at linux-user/meson.build though things are more complex.
> > There we have alot of sub-dirs, and meson.biuld in those dirs adds
> > generators for various files. So conceivably skipping linux-user
> > will mean we won't auto-generate files we don't need on non-Linux.
>
> The top level meson.build doesn't call process on the
> syscall_nr_generators[] list unless we're building linux-user
> targets, so I don't think we will auto-generate anything we
> don't need.
>

The problem is that I'm trying to add some os-specific files
to the bsd-user in a patch set I sent off. bsd-user compiles
for different BSDs, and I'd like to start pulling in per-bsd
files as I'm upstreaming.  To do that, I have this construct
in the bsd-user/meson.build file:

# Pull in the OS-specific build glue, if any
if fs.exists(targetos)
   subdir(targetos)
endif

primarily because the builds failed on Linux when it tried to
find the non-existent bsd-user/linunx directory. The question
came up on how to cope with this situation, and Philippe
sent off this series as an alternative to that construct. The
whole reason why we descend into the linux-user directory
on BSD and into the bsd-user directory on linux is unclear
to me as well.

So this is preparing the ground for my future work of upstreaming.
I'm agnostic as to how it's resolved, but it needs to be resolved.

Warner

--0000000000000fd0ad05ccf7e96b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 27, 2021 at 4:08 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, 27 Sept 2021 at 10:59, Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt; =
wrote:<br>
&gt; If we look at linux-user/meson.build though things are more complex.<b=
r>
&gt; There we have alot of sub-dirs, and meson.biuld in those dirs adds<br>
&gt; generators for various files. So conceivably skipping linux-user<br>
&gt; will mean we won&#39;t auto-generate files we don&#39;t need on non-Li=
nux.<br>
<br>
The top level meson.build doesn&#39;t call process on the<br>
syscall_nr_generators[] list unless we&#39;re building linux-user<br>
targets, so I don&#39;t think we will auto-generate anything we<br>
don&#39;t need.<br></blockquote><div><br></div><div>The problem is that I&#=
39;m trying to add some os-specific files</div><div>to the bsd-user in a pa=
tch set I sent off. bsd-user compiles</div><div>for different BSDs, and I&#=
39;d like to start pulling in per-bsd</div><div>files as I&#39;m upstreamin=
g.=C2=A0 To do that, I have this construct</div><div>in the bsd-user/meson.=
build file:</div><div><br></div><div># Pull in the OS-specific build glue, =
if any<br>if fs.exists(targetos)<br>=C2=A0 =C2=A0subdir(targetos)<br>endif<=
br></div><div><br></div><div>primarily because the builds failed on Linux w=
hen it tried to</div><div>find the non-existent bsd-user/linunx=C2=A0direct=
ory. The question</div><div>came up on how to cope with this situation, and=
 Philippe</div><div>sent off this series as an alternative to that construc=
t. The</div><div>whole reason why we descend into the linux-user directory<=
/div><div>on BSD and into the bsd-user directory on linux is unclear</div><=
div>to me as well.</div><div><br></div><div>So this is preparing the ground=
 for my future work of upstreaming.</div><div>I&#39;m agnostic as to how it=
&#39;s resolved, but it needs to be resolved.</div><div><br></div><div>Warn=
er</div></div></div>

--0000000000000fd0ad05ccf7e96b--

