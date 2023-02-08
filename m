Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713E868FADA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 00:05:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPtUQ-0006pq-8I; Wed, 08 Feb 2023 18:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pPtUO-0006pi-Ap
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 18:04:32 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pPtUL-0000gF-Mx
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 18:04:32 -0500
Received: by mail-ej1-x62e.google.com with SMTP id p26so1321571ejx.13
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 15:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wnBO0HKiGO2cY07PCPApWxiaGbT46I+EXNC7GAj/bC0=;
 b=zutwcpW212JtErNb2ni3gJPmrk+W0t/rq6IsCa1IuqpaIzV+q13qxmLh/K3IN327oN
 KjcG+LG0mtfIFPo//kvq/PO3mT/HwU8sIQ/eGU7OLVOcKF9rz0Urq1poIe1xpQaDNMde
 ttNBR+vLmv9XjwY5s5PM3NaDAUsYmd+gnJg+emg6qYMcUQ3I+951Iv/Li8/hVglP4+na
 HsXZXVmuv5TeFj+e98QIdA3TzAUaB49/bU6e6D7JegVIMAzvOR6Ejby/veOFPoGH4Uio
 0iEcKdgd3Mvq6fn/O+nBL506YXSksFn8FNVqGqte9blj+oO98H1xLKtu9sSmWvvQmLmP
 crsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wnBO0HKiGO2cY07PCPApWxiaGbT46I+EXNC7GAj/bC0=;
 b=v8SK4ljGK+bDjKOqpqjqGRDuY19Xp/hGiAUm/lJMCiUtrcbyDfGcrThT7OnLNQ3Y/H
 P2Haa9RRI4LbY5oh8fqdmnXO5SYthq25NvnUrkiTfc5z8Vp0Gx1wFj0aRna564vgh1q1
 yrp5U/IUwCSBH2U+JqzRyzhzUr/PfRiansZAZ+6UlMlz4MAyCKJ8xZwMR86k7Zl71xgP
 Vh+v6nWlpA8Pg0vSj+xau3jV29MWt3dNCzsjpCvCcj5uwMr+mZ/qjH4o7iFmr8B40gd3
 ml+6/mG3eFpnLFVmZWmJ6sHRVWutbeY+WxSvQQb+/klmcsPiKpRLrzTxZ8kcJ/m4D5MA
 NBRg==
X-Gm-Message-State: AO0yUKUwio5PAZbFygLt0AUeFxP1E62YjhDqENutgzq4mkmeHa3rLNV2
 Fqo/ZzQHRBGN6ZM0+exDy1CBfC35jBFywP9dTEwH2A==
X-Google-Smtp-Source: AK7set+m/LjSIjQeheoeZjxldkP9XFSYNrh4ZPLYHFh7T/DAPSn9qJO2T+307i9ox/hJ+GnoWBvhgB1QslL1j+LrjPo=
X-Received: by 2002:a17:906:a242:b0:895:58be:964 with SMTP id
 bi2-20020a170906a24200b0089558be0964mr77868ejb.2.1675897467915; Wed, 08 Feb
 2023 15:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
 <87h6vxo4em.fsf@pond.sub.org>
In-Reply-To: <87h6vxo4em.fsf@pond.sub.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 8 Feb 2023 16:04:16 -0700
Message-ID: <CANCZdfrsW3g4KH2CNSh8e_ApPGBO80BHLWRbSiVEkzkiUgB68A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Deprecate/rename singlestep command line option
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>, 
 Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000416c4305f438493f"
Received-SPF: none client-ip=2a00:1450:4864:20::62e;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x62e.google.com
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

--000000000000416c4305f438493f
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 7, 2023 at 8:56 AM Markus Armbruster <armbru@redhat.com> wrote:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The command line option '-singlestep' and its HMP equivalent
> > the 'singlestep' command are very confusingly named, because
> > they have nothing to do with single-stepping the guest (either
> > via the gdb stub or by emulation of guest CPU architectural
> > debug facilities). What they actually do is put TCG into a
> > mode where it puts only one guest instruction into each
> > translation block. This is useful for some circumstances
> > such as when you want the -d debug logging to be easier to
> > interpret, or if you have a finicky guest binary that wants
> > to see interrupts delivered at something other than the end
> > of a basic block.
> >
> > The confusing name is made worse by the fact that our
> > documentation for these is so minimal as to be useless
> > for telling users what they really do.
> >
> > This series:
> >  * renames the 'singlestep' global variable to 'one_insn_per_tb'
> >  * Adds new '-one-insn-per-tb' command line options and a
> >    HMP 'one-insn-per-tb' command
> >  * Documents the '-singlestep' options and 'singlestep'
> >    HMP command as deprecated synonyms for the new ones
> >
> > It does not do anything about the other place where we surface
> > 'singlestep', which is in the QMP StatusInfo object returned by the
> > 'query-status' command.  This is incorrectly documented as "true if
> > VCPUs are in single-step mode" and "singlestep is enabled through
> > the GDB stub", because what it's actually returning is the
> > one-insn-per-tb state.
> >
> > Things I didn't bother with because this is only an RFC but
> > will do if it turns into a non-RFC patchset:
> >  * test the bsd-user changes :-)
> >  * add text to deprecated.rst
> >
> > So, questions:
> >
> > (1) is this worth bothering with at all? We could just
> >     name our global variable etc better, and document what
> >     -singlestep actually does, and not bother with the new
> >     names for the options/commands.
>
> The feature is kind of esoteric.  Rather weak excuse for not fixing bad
> UI, in my opinion.  Weaker still since you already did a good part of
> the actual work.
>
> > (2) if we do do it, do we retain the old name indefinitely,
> >     or actively put it on the deprecate-and-drop list?
>
> By "the old name", you mean the CLI option name, right?
>
> I'd prefer deprecate and drop.
>
> > (3) what should we do about the HMP StatusInfo object?
> >     I'm not sure how we handle compatibility for HMP.
>
> Uh, you mean *QMP*, don't you?
>
> As you wrote above, StatusInfo is returned by query-status, which is a
> stable interface.  Changes to members therefore require the usual
> deprecation grace period.  We'd add a new member with a sane name, and
> deprecate the old one.
>
> The matching HMP command is "info status".  It shows member @singlestep
> as " (single step mode)".  Changing that is fine; HMP is not a stable
> interface.
>

We don't use this feature on bsd-user, so I'm happy to follow whatever is
decided
here. I can test things once the suggestion in this and other threads have
played out
and there's another RFC set of patches.

Warner

--000000000000416c4305f438493f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 7, 2023 at 8:56 AM Markus=
 Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">=
peter.maydell@linaro.org</a>&gt; writes:<br>
<br>
&gt; The command line option &#39;-singlestep&#39; and its HMP equivalent<b=
r>
&gt; the &#39;singlestep&#39; command are very confusingly named, because<b=
r>
&gt; they have nothing to do with single-stepping the guest (either<br>
&gt; via the gdb stub or by emulation of guest CPU architectural<br>
&gt; debug facilities). What they actually do is put TCG into a<br>
&gt; mode where it puts only one guest instruction into each<br>
&gt; translation block. This is useful for some circumstances<br>
&gt; such as when you want the -d debug logging to be easier to<br>
&gt; interpret, or if you have a finicky guest binary that wants<br>
&gt; to see interrupts delivered at something other than the end<br>
&gt; of a basic block.<br>
&gt;<br>
&gt; The confusing name is made worse by the fact that our<br>
&gt; documentation for these is so minimal as to be useless<br>
&gt; for telling users what they really do.<br>
&gt;<br>
&gt; This series:<br>
&gt;=C2=A0 * renames the &#39;singlestep&#39; global variable to &#39;one_i=
nsn_per_tb&#39;<br>
&gt;=C2=A0 * Adds new &#39;-one-insn-per-tb&#39; command line options and a=
<br>
&gt;=C2=A0 =C2=A0 HMP &#39;one-insn-per-tb&#39; command<br>
&gt;=C2=A0 * Documents the &#39;-singlestep&#39; options and &#39;singleste=
p&#39;<br>
&gt;=C2=A0 =C2=A0 HMP command as deprecated synonyms for the new ones<br>
&gt;<br>
&gt; It does not do anything about the other place where we surface<br>
&gt; &#39;singlestep&#39;, which is in the QMP StatusInfo object returned b=
y the<br>
&gt; &#39;query-status&#39; command.=C2=A0 This is incorrectly documented a=
s &quot;true if<br>
&gt; VCPUs are in single-step mode&quot; and &quot;singlestep is enabled th=
rough<br>
&gt; the GDB stub&quot;, because what it&#39;s actually returning is the<br=
>
&gt; one-insn-per-tb state.<br>
&gt;<br>
&gt; Things I didn&#39;t bother with because this is only an RFC but<br>
&gt; will do if it turns into a non-RFC patchset:<br>
&gt;=C2=A0 * test the bsd-user changes :-)<br>
&gt;=C2=A0 * add text to deprecated.rst<br>
&gt;<br>
&gt; So, questions:<br>
&gt;<br>
&gt; (1) is this worth bothering with at all? We could just<br>
&gt;=C2=A0 =C2=A0 =C2=A0name our global variable etc better, and document w=
hat<br>
&gt;=C2=A0 =C2=A0 =C2=A0-singlestep actually does, and not bother with the =
new<br>
&gt;=C2=A0 =C2=A0 =C2=A0names for the options/commands.<br>
<br>
The feature is kind of esoteric.=C2=A0 Rather weak excuse for not fixing ba=
d<br>
UI, in my opinion.=C2=A0 Weaker still since you already did a good part of<=
br>
the actual work.<br>
<br>
&gt; (2) if we do do it, do we retain the old name indefinitely,<br>
&gt;=C2=A0 =C2=A0 =C2=A0or actively put it on the deprecate-and-drop list?<=
br>
<br>
By &quot;the old name&quot;, you mean the CLI option name, right?<br>
<br>
I&#39;d prefer deprecate and drop.<br>
<br>
&gt; (3) what should we do about the HMP StatusInfo object?<br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m not sure how we handle compatibility for HM=
P.<br>
<br>
Uh, you mean *QMP*, don&#39;t you?<br>
<br>
As you wrote above, StatusInfo is returned by query-status, which is a<br>
stable interface.=C2=A0 Changes to members therefore require the usual<br>
deprecation grace period.=C2=A0 We&#39;d add a new member with a sane name,=
 and<br>
deprecate the old one.<br>
<br>
The matching HMP command is &quot;info status&quot;.=C2=A0 It shows member =
@singlestep<br>
as &quot; (single step mode)&quot;.=C2=A0 Changing that is fine; HMP is not=
 a stable<br>
interface.<br></blockquote><div><br></div><div>We don&#39;t use this featur=
e on bsd-user, so I&#39;m happy to follow whatever is decided</div><div>her=
e. I can test things once the suggestion in this and other threads have pla=
yed out</div><div>and there&#39;s another RFC set of patches.</div><div><br=
></div><div>Warner=C2=A0</div></div></div>

--000000000000416c4305f438493f--

