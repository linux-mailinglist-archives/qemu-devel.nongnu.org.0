Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884F4415026
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:50:46 +0200 (CEST)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7KP-0008G3-B3
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1mT6OM-0006Rc-4N
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:50:46 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:34805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1mT6OJ-0007c6-FK
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:50:45 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 n65-20020a9d2047000000b00547334367efso4705902ota.1
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 10:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=haotaG3i7HLwPQGLhCu+xPMFntE+JWr/eXhVfw6+8qQ=;
 b=J1CF9gsbSLOl9Pdkj6z2m6BSbOmhjtroLLo9HM5kS8Y0+nJKhYg1TorYznaJTkL/zx
 2PwINGjzYMR2X8Mf0een5nEKJP+NWi4KKfzNkC4FPhYRDdks0th3JwsMjVXJWebHY1b3
 SxCLhUNGnPoZrZK53o97aDIdHU4KmxLFp5Jlh+HeigCrtX4Rwt5TPK5tXJey5ezJi7Wz
 F9hMOnEFTcGsx4RzcZPxbYQctYjnxhoShFFywmuLjOQdCrzYBiVsd2TrkpqPSyvT83jD
 BAnO8KOUn0yydTVzHNfEMUYx9PbdZbmp9CDAIMoN51SCOEq6lRuZmEELd18O7lMOBOUG
 RAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=haotaG3i7HLwPQGLhCu+xPMFntE+JWr/eXhVfw6+8qQ=;
 b=iGHVbmrMt7p5i7XujJkASZyFgu1XhPfPped5sYmjk87kJrG2BupYJWpUFwiTZWXP+P
 AhVTmwkulvq13pPv72+n578aJqmxrp027Sgxh0yJK3m5BN2jMJ+XgBSrhHuXg7aQPu1r
 MX/RC/J4UX/5UKCgRBIxsIZHasGcH7ee/cOh88mce/3VwP3Edm54X1/W1oFAXGjSIYBn
 YWhHlpSEkSbRIKd/QcFpdf/SVOog8LGi+Kl8qH8a4BFCubmOsIQFVOwLlfVvgC486+1c
 TTp9s3r587AXBs7TBdlm9QwleahQ0I/5vY8BUvmoDz+ZLK/O72T8hQpMJdCULb/KRTnk
 sL9Q==
X-Gm-Message-State: AOAM530QeyjxanObha7c4Fd+jlsT4Zrr1dxEphobLamE1z+VF3LZfJPb
 ZmQXEW4SbhcMNyp08xZnwlkY7BmSXuZbl5rdw0I=
X-Google-Smtp-Source: ABdhPJzjfYPN8LlAX+3+TzJV0ZczfjVGMHQ2HUwNUAJ9FKrL0Oko4RcGaOKfcWfqrUxsxZ/nPAvyLIrWXyK4uTs30SM=
X-Received: by 2002:a9d:192c:: with SMTP id j44mr368056ota.302.1632333042150; 
 Wed, 22 Sep 2021 10:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp9HjoCVbFmT9rwAteAVdCCMgobt1jvCLuhL3CCBKJZSsA@mail.gmail.com>
 <87a6k4op6n.fsf@linaro.org>
 <CAK7rcp_gSO+eCWOPBSbEEB3GMhj7aXrkK166eYxrUr1Yj8HKkg@mail.gmail.com>
 <875yuso6g7.fsf@linaro.org>
In-Reply-To: <875yuso6g7.fsf@linaro.org>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Wed, 22 Sep 2021 13:50:31 -0400
Message-ID: <CAK7rcp9tGBqN5xkZBcN7+9u7U8wcocaNQ1MgYyy4FfzmpY_fZg@mail.gmail.com>
Subject: Re: Change TCG cache size?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000021f07005cc992710"
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=kennethadammiller@gmail.com; helo=mail-ot1-x329.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000021f07005cc992710
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's just the overhead of running a cross architecture emulation. For Arm
to x86_64, the overhead is very high. I was wondering if there is some
command line argument that I was missing in order to reduce this. I read
somewhere that the tcg cache is defaulted to some value, and wanted to
check in to make sure that that wasn't it.

I can't see it right now, I was just looking into it.

On Wed, Sep 22, 2021 at 1:39 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Kenneth Adam Miller <kennethadammiller@gmail.com> writes:
>
> > Well, maybe I'm understanding that wrong. I am talking the cache that
> the tcg keeps of translated code. If I got that variable wrong then
> > please let me know.
>
> TB_JMP_CACHE_SIZE is used to keep a lookup of address to  translated
> blocks (TBs). This is used to find the next TB on a computed jump
> without doing a full lookup in the QHT hash.
>
> The total size of the translation cache is tb-size in MBs (as in -accel
> tcg,tb-size=3D1024). We have some heuristics to guess at a size (see
> DEFAULT_CODE_GEN_BUFFER_SIZE in tcg/region.c) but you are free to
> specify your own.
>
> > But I want to make sure that that is large enough to keep from having
> > to run TCG again. How can I do that?
>
> Specifying a large tb-size will reduce the churn caused by running out
> of translation cache but you will never be able to eliminate it
> entirely. There are a number of places where tb_flush() has to get
> called and that will require stuff to get re-translated. Also the
> translator partitions the regions up per-CPU (for softmmu) so if one
> vCPU is responsible for all code generation it will run out sooner.
>
> You can observe the total number of flushes via the HMP and "info jit".
> What is the behaviour your seeing? What workload is it?
>
> >
> > On Wed, Sep 22, 2021, 6:54 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>
> wrote:
> >
> >  Kenneth Adam Miller <kennethadammiller@gmail.com> writes:
> >
> >  > Hello all,
> >  >
> >  > I just want to ask this one question: if I change the qemu tcg cache
> >  > size (TB_JMP_CACHE_SIZE), will that force any errors at run time?
> >
> >  Hopefully not - for both user-mode and softmmu we take some care to
> >  ensure tb_jmp_cache_hash_func and tb_jmp_cache_hash_page return
> >  appropriately masked values for the table lookup.
> >
> >  What has not been done since Emilio's work in 6f1653180f (tb-hash:
> >  improve tb_jmp_cache hash function in user mode) is a deeper look at t=
he
> >  hit rate and bounce rate of the softmmu jump table hashing. Any
> >  suggested changes will need some benchmarking to show what difference =
it
> >  makes.
> >
> >  --
> >  Alex Benn=C3=A9e
>
>
> --
> Alex Benn=C3=A9e
>

--00000000000021f07005cc992710
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s just the overhead of running a cross architecture=
 emulation. For Arm to x86_64, the overhead is very high. I was wondering i=
f there is some command line argument that I was missing in order to reduce=
 this. I read somewhere that the tcg cache is defaulted to some value, and =
wanted to check in to make sure that that wasn&#39;t it.<br><br>I can&#39;t=
 see it right now, I was just looking into it.</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 22, 2021 at 1:39 =
PM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.benn=
ee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><br>
Kenneth Adam Miller &lt;<a href=3D"mailto:kennethadammiller@gmail.com" targ=
et=3D"_blank">kennethadammiller@gmail.com</a>&gt; writes:<br>
<br>
&gt; Well, maybe I&#39;m understanding that wrong. I am talking the cache t=
hat the tcg keeps of translated code. If I got that variable wrong then<br>
&gt; please let me know.<br>
<br>
TB_JMP_CACHE_SIZE is used to keep a lookup of address to=C2=A0 translated<b=
r>
blocks (TBs). This is used to find the next TB on a computed jump<br>
without doing a full lookup in the QHT hash.<br>
<br>
The total size of the translation cache is tb-size in MBs (as in -accel<br>
tcg,tb-size=3D1024). We have some heuristics to guess at a size (see<br>
DEFAULT_CODE_GEN_BUFFER_SIZE in tcg/region.c) but you are free to<br>
specify your own.<br>
<br>
&gt; But I want to make sure that that is large enough to keep from having<=
br>
&gt; to run TCG again. How can I do that?<br>
<br>
Specifying a large tb-size will reduce the churn caused by running out<br>
of translation cache but you will never be able to eliminate it<br>
entirely. There are a number of places where tb_flush() has to get<br>
called and that will require stuff to get re-translated. Also the<br>
translator partitions the regions up per-CPU (for softmmu) so if one<br>
vCPU is responsible for all code generation it will run out sooner.<br>
<br>
You can observe the total number of flushes via the HMP and &quot;info jit&=
quot;.<br>
What is the behaviour your seeing? What workload is it?<br>
<br>
&gt;<br>
&gt; On Wed, Sep 22, 2021, 6:54 AM Alex Benn=C3=A9e &lt;<a href=3D"mailto:a=
lex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; wro=
te:<br>
&gt;<br>
&gt;=C2=A0 Kenneth Adam Miller &lt;<a href=3D"mailto:kennethadammiller@gmai=
l.com" target=3D"_blank">kennethadammiller@gmail.com</a>&gt; writes:<br>
&gt;<br>
&gt;=C2=A0 &gt; Hello all,<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; I just want to ask this one question: if I change the qemu =
tcg cache<br>
&gt;=C2=A0 &gt; size (TB_JMP_CACHE_SIZE), will that force any errors at run=
 time?<br>
&gt;<br>
&gt;=C2=A0 Hopefully not - for both user-mode and softmmu we take some care=
 to<br>
&gt;=C2=A0 ensure tb_jmp_cache_hash_func and tb_jmp_cache_hash_page return<=
br>
&gt;=C2=A0 appropriately masked values for the table lookup.<br>
&gt;<br>
&gt;=C2=A0 What has not been done since Emilio&#39;s work in 6f1653180f (tb=
-hash:<br>
&gt;=C2=A0 improve tb_jmp_cache hash function in user mode) is a deeper loo=
k at the<br>
&gt;=C2=A0 hit rate and bounce rate of the softmmu jump table hashing. Any<=
br>
&gt;=C2=A0 suggested changes will need some benchmarking to show what diffe=
rence it<br>
&gt;=C2=A0 makes.<br>
&gt;<br>
&gt;=C2=A0 -- <br>
&gt;=C2=A0 Alex Benn=C3=A9e<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div>

--00000000000021f07005cc992710--

