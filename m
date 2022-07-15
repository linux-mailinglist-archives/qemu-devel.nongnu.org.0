Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514F357611C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 14:05:50 +0200 (CEST)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCK4r-0002km-0S
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 08:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oCK1Z-00018H-1A
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 08:02:25 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:44850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oCK1X-0006g0-5t
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 08:02:24 -0400
Received: by mail-lf1-x133.google.com with SMTP id a9so7435812lfk.11
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 05:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YMkyv0d7ujessLOB6YD6ICwqjxLmuRR8ochTsAswm+4=;
 b=IacoBv07FQzfCu+sn6zt2E9MNEGjil6HnQks+kB+AezDGcUB9S3qFM8m2+H4g14UE/
 AS6ZyZooKsMW1TiLduyl0F7bB3LMm95PXovr2HulBFigImuFVPLrELTMRka8UoZxQ2fP
 ycW+EeiVBaVCkT46fPbjvQgr9P+srrg8z8UrBSfVSjIBeBR3kNlKHrCjSH/FIv3VJJlo
 kf9PddhN7sIR41fwb7S50qtcGEDCk2WgmPAcvq3ZzpTlzVULy3pz0hLJUZWdlUj8c39K
 RP/nPYk0oQ0y9BFDQkbanygbdF72wNV3VGgI7gIY/eGa2JEFTxo2CR2WRFUhrT8YExhH
 8lOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YMkyv0d7ujessLOB6YD6ICwqjxLmuRR8ochTsAswm+4=;
 b=6SzSApkJUaj//JhIcIbgZR0MTXhgEpvfTv9qfg1wyGjZUmmb+TE3BLmZvJj9pqZyFM
 alNzMGutxZJeiJrfBHjjo3IXJQeGkQTGm/0vdxFCB1ETzSpKdyL0rIhc7fOBs8Yp/JSP
 BIj9/tRJ2cl72GTYqGxjNvQs3ITjtMhF1Ss048SFBYsHcqNeVTukvo0dIN++dH1bkNV+
 OJithpLKN1vBFdld1XSvwZ4OZXheV16onixFGqQAmD6jzrwAJVMzFNAjHiLFEoe3xQ/a
 R0TJXNrpKAGRJvQrqoxyhRhJCk9Q8Zy870nMhd5Egyoi/WEvJg2viVA2PeGcMoLvJkzt
 4hdA==
X-Gm-Message-State: AJIora+YGJRMsFH0bMzCZVCjZ1dXTNYOUIlPxIX4nT8076FcpLMYnR/A
 1Lev4mjxgwEosVAcTCRlPwnHz9scfl0sd3r3MOI=
X-Google-Smtp-Source: AGRyM1vlsTwZmoEe0hBP/S2rkiupLJ4R/SXYwxcrkBA8Qg/TbgXZmqSZURzKeEnA0IRrkxACzQA6r09FHvqxy+GYIOw=
X-Received: by 2002:a05:6512:31d1:b0:489:cfee:3600 with SMTP id
 j17-20020a05651231d100b00489cfee3600mr7792535lfe.432.1657886540362; Fri, 15
 Jul 2022 05:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220711075643.3744153-1-marcandre.lureau@redhat.com>
 <ec9ce92e-4e91-6ff6-49d0-bc694eef5fa8@linaro.org>
 <61f9c4ac-5600-46ef-9c4d-724c1d7bf400@linaro.org>
 <CAMxuvaxobAZdKZtNY3yc_n00zUWCgiiD5GNdTF=7ZfJM8MODRQ@mail.gmail.com>
In-Reply-To: <CAMxuvaxobAZdKZtNY3yc_n00zUWCgiiD5GNdTF=7ZfJM8MODRQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 15 Jul 2022 16:02:08 +0400
Message-ID: <CAJ+F1C+3FYh6GrEC=St38QkmUd=G_TrQPVmQc99bjw1XkSHB1A@mail.gmail.com>
Subject: Re: [PATCH 0/2] gitlab-ci: msys2 improvements
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000050f99b05e3d6caf7"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000050f99b05e3d6caf7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard

On Tue, Jul 12, 2022 at 3:38 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@redhat.com> wrote:

> Hi
>
> On Tue, Jul 12, 2022 at 10:10 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 7/12/22 09:24, Richard Henderson wrote:
> > > On 7/11/22 13:26, marcandre.lureau@redhat.com wrote:
> > >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >>
> > >> Hi
> > >>
> > >> This is a small series to attempt to debug "Intermittent meson
> failures on
> > >> msys2" and improve a bit msys2/gitlab reports.
> > >
> > > Thanks.  I've pushed this to staging for a test run:
> > >
> > > https://gitlab.com/qemu-project/qemu/-/pipelines/585473909
> >
> > Amusingly, both msys2 jobs passed the first time, but I reran and now
> have a failure for
> > your investigation:
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/2707801937
> >
>
> Hmm, there are no artifacts. How come? meson-logs/ should be there..
> Anyway, I am not sure it would have more details about the failing
> command.
>
> Sadly we don't have any stderr output, and ninja doesn't log the
> failing command exit code either. I guess I will try with a custom
> ninja build now.
>

I think I have triggered 10x times the build now, but I am not reaching the
build error, only random build time over 1h10 limit...

No idea.. Maybe you can try it?
https://gitlab.com/marcandre.lureau/qemu/-/tree/msys2

I have simply patched ninja with
https://github.com/msys2/MINGW-packages/compare/master...elmarco:MINGW-pack=
ages:master


--=20
Marc-Andr=C3=A9 Lureau

--00000000000050f99b05e3d6caf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Richard<br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 12, 2022 at 3:3=
8 PM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.c=
om">marcandre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi<br>
<br>
On Tue, Jul 12, 2022 at 10:10 AM Richard Henderson<br>
&lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richa=
rd.henderson@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 7/12/22 09:24, Richard Henderson wrote:<br>
&gt; &gt; On 7/11/22 13:26, <a href=3D"mailto:marcandre.lureau@redhat.com" =
target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; &gt;&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Hi<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This is a small series to attempt to debug &quot;Intermittent=
 meson failures on<br>
&gt; &gt;&gt; msys2&quot; and improve a bit msys2/gitlab reports.<br>
&gt; &gt;<br>
&gt; &gt; Thanks.=C2=A0 I&#39;ve pushed this to staging for a test run:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/pipelines/58547=
3909" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/=
qemu/-/pipelines/585473909</a><br>
&gt;<br>
&gt; Amusingly, both msys2 jobs passed the first time, but I reran and now =
have a failure for<br>
&gt; your investigation:<br>
&gt;<br>
&gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/2707801937" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/jo=
bs/2707801937</a><br>
&gt;<br>
<br>
Hmm, there are no artifacts. How come? meson-logs/ should be there..<br>
Anyway, I am not sure it would have more details about the failing<br>
command.<br>
<br>
Sadly we don&#39;t have any stderr output, and ninja doesn&#39;t log the<br=
>
failing command exit code either. I guess I will try with a custom<br>
ninja build now.<br></blockquote><div><br></div><div>I think I have trigger=
ed 10x times the build now, but I am not reaching the build error, only ran=
dom build time over 1h10 limit...</div><div><br></div><div>No idea.. Maybe =
you can try it? <a href=3D"https://gitlab.com/marcandre.lureau/qemu/-/tree/=
msys2">https://gitlab.com/marcandre.lureau/qemu/-/tree/msys2</a></div><div>=
<br></div><div>I have simply patched ninja with <a href=3D"https://github.c=
om/msys2/MINGW-packages/compare/master...elmarco:MINGW-packages:master">htt=
ps://github.com/msys2/MINGW-packages/compare/master...elmarco:MINGW-package=
s:master</a></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000050f99b05e3d6caf7--

