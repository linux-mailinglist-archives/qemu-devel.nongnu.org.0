Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2D14CC48C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 19:02:39 +0100 (CET)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpmf-00077M-NR
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 13:02:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nPplR-0006OF-QR; Thu, 03 Mar 2022 13:01:21 -0500
Received: from [2607:f8b0:4864:20::22d] (port=33569
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nPplQ-0004jk-3f; Thu, 03 Mar 2022 13:01:21 -0500
Received: by mail-oi1-x22d.google.com with SMTP id x193so5557852oix.0;
 Thu, 03 Mar 2022 10:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZzQodKIY82fDvx/huLb1a1OG3qXVY/5HHSfiZz7DQ2o=;
 b=pg4PqklHP6s/QdDmJrFb8ggIaVb1PtiEIZqkM847PBYk1QSNXrLPxuNYY0p/W6WCoG
 WcVVlPlzccPNBgNanVKxjX9Oot/PmW2WFGxl89zpT5kyRxb2VDnyoXOu8+jK3wXZMGT4
 aRcWhUxQ6LFarMJ+3cuxTJhlmmsxEmgvMuoaWY1/WmTkyfJPuPqgqhdZLaR5/1AKn4nc
 SDVcUBsne3vo9XWwkD0YCrwQVXeUkX3MZ78/L0iQmV7jsiPxP+AYARFMdFand8kYuYti
 b7FRWWZM3dcmr3tb/lrLm3soxcuI0JIum4eCG4qyOwR2O7XfmW4NZxY35D/Y9uVhbSXj
 jGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZzQodKIY82fDvx/huLb1a1OG3qXVY/5HHSfiZz7DQ2o=;
 b=xP+4jDxfW/m5k+YGY9KXvFrjsi+ISySvUs2ZOIW2HEpUNXGt//GU2giKVa33YSwy/Q
 eGkFNIaoFA6Ayayyno8hiuJcYFzd3RfaR938ph8qjyoauRYsA2arcBNy/XiLbawfw9Jx
 xB4waw/fK0ZmNRcpbiLqsrBJGFySgyPfah9iJ4O7a6JBt/uLA6dqLQvW0GPMCjVusyaL
 rrwa60DSrPtDRaKN4QZfJW1p2w3qm4GLUDCaCuQnTM0khaLEWPqm1SdsXLPtxUQmHTVE
 mM/8eF0DSjrJn4gAl5NrrwfWvdZMy6/qCA0AQP3Y9I+IDWM7hf5nei8D+A+8aFtLA+pm
 +LAw==
X-Gm-Message-State: AOAM533yCzdBdv0GRtV52JUscmRRSUPR+RJwZ6q+GclmjVvgPwR/ymJB
 0Z6pecwIoU13SBgsXQSnJFko5ojdCvHTphdbxFg=
X-Google-Smtp-Source: ABdhPJxxrA7kCwkmozdmgnA2PgpktbXXP1fb1M/qCT4T4SBhKBBOJ4/lS3/oRfvRnqcbHA+/0PFyX4862XmCadkjSt0=
X-Received: by 2002:a05:6808:3091:b0:2d4:c180:d586 with SMTP id
 bl17-20020a056808309100b002d4c180d586mr5573147oib.120.1646330478530; Thu, 03
 Mar 2022 10:01:18 -0800 (PST)
MIME-Version: 1.0
References: <20220303032219.17631-1-dmiller423@gmail.com>
 <20220303032219.17631-2-dmiller423@gmail.com>
 <9ad00abf-4380-4efc-4012-aee5a36ff6e6@linaro.org>
 <CAEgyohXjXw-aZJX0qm3dReAUkMax-SmS9oAfR90XFX_q2i1msQ@mail.gmail.com>
 <9fa82035-b273-9c44-16e4-c859a6de5b6b@linaro.org>
In-Reply-To: <9fa82035-b273-9c44-16e4-c859a6de5b6b@linaro.org>
From: David Miller <dmiller423@gmail.com>
Date: Thu, 3 Mar 2022 13:01:06 -0500
Message-ID: <CAEgyohUZjHp0b5Ku9AvmNM48WRCaQWeji49OMXdT9euBn63rHQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] s390x/tcg: Implement Vector-Enhancements Facility
 2 for s390x
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005b149405d9542f1f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dmiller423@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 farman@linux.ibm.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005b149405d9542f1f
Content-Type: text/plain; charset="UTF-8"

Makes sense,  thanks for the quick reply.
Last question,  the patches can depend on others in the same set right?
IE:  all of the additions to insn-data.def in one, implementations in
separate patches.


Thanks
- David Miller

On Thu, Mar 3, 2022 at 12:42 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 3/3/22 06:50, David Miller wrote:
> >
> >  > Too many changes in one patch.
> >  > You need to split these into smaller, logical units.
> >
> > Can you give some guideline on that?
> > IE: change to two,  the shifts and reversed loads into two patches or
> more on line count
> > of each patch?
>
> Your best guide is line count: < 50 is ideal, though of course that can't
> always be done.
>   For bug fixes or code reorg you may find yourself constrained by not
> breaking bisection.
>
> But for new code, like this, one patch per feature is easiest to review.
> In this case
> you've got:
>
>    - load/store elements reversed,
>    - load/store byte reversed elements,
>    - shift double
>    - string search
>    - modify fp convert
>    - modify shift
>
> > I wasn't sure if there was a reason MO_TE was used so just kept with the
> existing code flow.
>
> We have to put some indication of endianness there, and "target" endian
> was the easiest to
> replicate across all targets.  Especially with those that are bi-endian.
>
> I've just noticed that we haven't propagated this to the integer
> load/store reversed.  I
> presume that code pre-dates the existence of the feature.  But it would be
> good to change
>
>      C(0xe31f, LRVH,    RXY_a, Z,   0, m2_16u, new, r1_16, rev16, 0)
>      C(0xe31e, LRV,     RXY_a, Z,   0, m2_32u, new, r1_32, rev32, 0)
>      C(0xe30f, LRVG,    RXY_a, Z,   0, m2_64, r1, 0, rev64, 0)
> ...
>      C(0xe33f, STRVH,   RXY_a, Z,   la2, r1_16u, new, m1_16, rev16, 0)
>      C(0xe33e, STRV,    RXY_a, Z,   la2, r1_32u, new, m1_32, rev32, 0)
>      C(0xe32f, STRVG,   RXY_a, Z,   la2, r1_o, new, m1_64, rev64, 0)
>
> to use little-endian memory ops, rather than separately reversing the
> bytes.
>
>
> r~
>

--0000000000005b149405d9542f1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Makes sense, =C2=A0thanks for the quick reply.<br>Last=
 question, =C2=A0the patches can depend on others in the same set right?<br=
>IE: =C2=A0all of the additions to insn-data.def in one, implementations in=
 separate patches.<div class=3D"gmail_default" style=3D"font-family:georgia=
,serif;font-size:small;color:#073763"><br></div><div class=3D"gmail_default=
" style=3D"font-family:georgia,serif;font-size:small;color:#073763"><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-siz=
e:small;color:#073763">Thanks</div><div class=3D"gmail_default" style=3D"fo=
nt-family:georgia,serif;font-size:small;color:#073763">- David Miller</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Thu, Mar 3, 2022 at 12:42 PM Richard Henderson &lt;<a href=3D"mailto:ric=
hard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On 3/3/22 06:50, Dav=
id Miller wrote:<br>
&gt; <br>
&gt;=C2=A0 &gt; Too many changes in one patch.<br>
&gt;=C2=A0 &gt; You need to split these into smaller, logical units.<br>
&gt; <br>
&gt; Can you give some guideline on that?<br>
&gt; IE: change to two, =C2=A0the shifts and reversed loads into two patche=
s or more on line count <br>
&gt; of each patch?<br>
<br>
Your best guide is line count: &lt; 50 is ideal, though of course that can&=
#39;t always be done. <br>
=C2=A0 For bug fixes or code reorg you may find yourself constrained by not=
 breaking bisection.<br>
<br>
But for new code, like this, one patch per feature is easiest to review.=C2=
=A0 In this case <br>
you&#39;ve got:<br>
<br>
=C2=A0 =C2=A0- load/store elements reversed,<br>
=C2=A0 =C2=A0- load/store byte reversed elements,<br>
=C2=A0 =C2=A0- shift double<br>
=C2=A0 =C2=A0- string search<br>
=C2=A0 =C2=A0- modify fp convert<br>
=C2=A0 =C2=A0- modify shift<br>
<br>
&gt; I wasn&#39;t sure if there was a reason MO_TE was used so just kept wi=
th the existing code flow.<br>
<br>
We have to put some indication of endianness there, and &quot;target&quot; =
endian was the easiest to <br>
replicate across all targets.=C2=A0 Especially with those that are bi-endia=
n.<br>
<br>
I&#39;ve just noticed that we haven&#39;t propagated this to the integer lo=
ad/store reversed.=C2=A0 I <br>
presume that code pre-dates the existence of the feature.=C2=A0 But it woul=
d be good to change<br>
<br>
=C2=A0 =C2=A0 =C2=A0C(0xe31f, LRVH,=C2=A0 =C2=A0 RXY_a, Z,=C2=A0 =C2=A00, m=
2_16u, new, r1_16, rev16, 0)<br>
=C2=A0 =C2=A0 =C2=A0C(0xe31e, LRV,=C2=A0 =C2=A0 =C2=A0RXY_a, Z,=C2=A0 =C2=
=A00, m2_32u, new, r1_32, rev32, 0)<br>
=C2=A0 =C2=A0 =C2=A0C(0xe30f, LRVG,=C2=A0 =C2=A0 RXY_a, Z,=C2=A0 =C2=A00, m=
2_64, r1, 0, rev64, 0)<br>
...<br>
=C2=A0 =C2=A0 =C2=A0C(0xe33f, STRVH,=C2=A0 =C2=A0RXY_a, Z,=C2=A0 =C2=A0la2,=
 r1_16u, new, m1_16, rev16, 0)<br>
=C2=A0 =C2=A0 =C2=A0C(0xe33e, STRV,=C2=A0 =C2=A0 RXY_a, Z,=C2=A0 =C2=A0la2,=
 r1_32u, new, m1_32, rev32, 0)<br>
=C2=A0 =C2=A0 =C2=A0C(0xe32f, STRVG,=C2=A0 =C2=A0RXY_a, Z,=C2=A0 =C2=A0la2,=
 r1_o, new, m1_64, rev64, 0)<br>
<br>
to use little-endian memory ops, rather than separately reversing the bytes=
.<br>
<br>
<br>
r~<br>
</blockquote></div>

--0000000000005b149405d9542f1f--

