Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30638486200
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 10:20:07 +0100 (CET)
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5OwI-0002P0-0B
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 04:20:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stevie.lavern@gmail.com>)
 id 1n5Oqp-0004er-Ci
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:14:28 -0500
Received: from [2607:f8b0:4864:20::12e] (port=36376
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stevie.lavern@gmail.com>)
 id 1n5Oqi-0004ug-TU
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:14:22 -0500
Received: by mail-il1-x12e.google.com with SMTP id v10so1609392ilj.3
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 01:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=clJXU0/4IGDjVKOcqFQTBC2xDOHpb5MdN5qNHxRfmxo=;
 b=FH1+cjphDdhwoZUM5cmtxTGrn7s+xVFbzP07a8jVoP/XKCdADUUqn/DAjeGfEWMbbW
 WVLfL2vkn+FiGXjHj8Iunsu7b7GimBtIwq7bv965FNcUTXy28jOkzG44m3AVqts2KPQ+
 3H6Nj2XcOaztqPm9Gi864PcJGdQ5Q6RLTZq7A1ISsKRQtSUNg0fiVqwRRK4ojZfTl52S
 7o/WBMlME2Faqfb06LowBL/w72U9Asl7w0y0LeoQL3fW753jzIAHXNVM3PwWOYEQrGVq
 nz1Nb0mDoi+715zQkICYyOn6HFFwnS9t4pgijVIj33SNGxeP44tKqjWgBcqxAbEJctRq
 Ob4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=clJXU0/4IGDjVKOcqFQTBC2xDOHpb5MdN5qNHxRfmxo=;
 b=gNOz4SgMrlhhAZuHqncs4N5SDCVTJHlXKwUW5KsJNkWZYEX4gVVr+mHU1a0woGhcrS
 9o3ysbeFTnsHioOjg+lZ0oFEhb1JSx1d9cDTyLAJcvpV528J03lWPjeD5N7wZ2ALpZU8
 T+f1wYqgYt7xcSB2mfcwT0UITsLi/KIvAXj5fSA+z8wrixrwupc8AKtUCdeasO93dXAF
 Q2xUQ+QE8ZQx6DLO2S1sqUByBPyoHP+ddTLE+ACls1Gpdlff5i7wICQvAfD6JUSMc1v2
 DsURd+AGDuFOyT+QXvhePUs9DC5QmpkCipx/4q2LFlGA3JspB0/Miy/sQZxxmVzCJUby
 hvbQ==
X-Gm-Message-State: AOAM531mODXvT5hjRAP7HOF4Eo5azQdFuQx3vzCtpwiJfIhfuIY3iIUX
 Z5MtcoMCVOhhdrsMHxPHS16AZCTTBCcG/DmrkoM=
X-Google-Smtp-Source: ABdhPJzI7TmDnRtHahunR+mjMDChs41JjTYQCpx18IIH8tDxZ77V9XxDaVqIz/Ti39U6WIUrfV5dNZa888zrTHS0cQI=
X-Received: by 2002:a92:dc8c:: with SMTP id c12mr25416304iln.43.1641460459815; 
 Thu, 06 Jan 2022 01:14:19 -0800 (PST)
MIME-Version: 1.0
References: <CADV2EAtTPjHP=H7AMAdva7UjydjM5DwK=NDAm3HYM-MHeD9wyg@mail.gmail.com>
 <49a5b6c6-8618-a9fc-2cec-ef60b8b59d62@linaro.org>
In-Reply-To: <49a5b6c6-8618-a9fc-2cec-ef60b8b59d62@linaro.org>
From: Stevie Lavern <stevie.lavern@gmail.com>
Date: Thu, 6 Jan 2022 10:14:08 +0100
Message-ID: <CADV2EAvZ_=AJbQNr4vnFFY5W9HmZjDw8kVm3ubaQ=mvsG37=Vw@mail.gmail.com>
Subject: Re: Rational behind partial AVX support in Qemu
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009ec7f305d4e64b25"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=stevie.lavern@gmail.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009ec7f305d4e64b25
Content-Type: text/plain; charset="UTF-8"

Hello,

Thanks for you answer!
I may put together a patch to crash if VEX.L is 1 (shouldn't be hard) and
submit it to the patch list.
Do you think it qualifies as "trivial patch" or should i go on with the
full patch submission process?


On Thu, Jan 6, 2022 at 3:45 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/5/22 9:09 AM, Stevie Lavern wrote:
> > Hello,
> > I'm currently testing various binaries under qemu linux user and went
> into a strange bug.
> >
> > Here is the TLDR: is there a reason to allow VEX.L to be 1 when not
> supporting AVX
> > instructions?
>
> There are some integer instructions that use vex encoding, e.g. andn, and
> we support some
> of those, thus any support for VEX at all.  But you're probably correct
> that we could
> usefully filter VEX.L = 1 early.
>
>
> r~
>

--0000000000009ec7f305d4e64b25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>Thanks for you answer!</div><div=
>I may put together a patch to crash if VEX.L is 1 (shouldn&#39;t be hard) =
and submit it to the patch list.</div><div>Do you think it qualifies as &qu=
ot;trivial patch&quot; or should i go on with the full patch submission pro=
cess?=C2=A0</div><div><br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 6, 2022 at 3:45 AM Richard Hend=
erson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.henderson=
@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 1/5/22 9:09 AM, Stevie Lavern wrote:<br>
&gt; Hello,<br>
&gt; I&#39;m currently testing various binaries under qemu linux user and w=
ent into a strange bug.<br>
&gt; <br>
&gt; Here is the TLDR: is there a reason to allow VEX.L to be 1 when not su=
pporting AVX <br>
&gt; instructions?<br>
<br>
There are some integer instructions that use vex encoding, e.g. andn, and w=
e support some <br>
of those, thus any support for VEX at all.=C2=A0 But you&#39;re probably co=
rrect that we could <br>
usefully filter VEX.L =3D 1 early.<br>
<br>
<br>
r~<br>
</blockquote></div>

--0000000000009ec7f305d4e64b25--

