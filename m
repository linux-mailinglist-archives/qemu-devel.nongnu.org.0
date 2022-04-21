Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E3350A731
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:34:03 +0200 (CEST)
Received: from localhost ([::1]:50340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhags-0004RD-Qx
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nha9e-0001yh-GE
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:59:42 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:34306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nha9c-00069i-Ir
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:59:42 -0400
Received: by mail-qk1-x72c.google.com with SMTP id j9so4035765qkg.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ARybaRdfRU2zyGFZvJK026gdqRK0ZnsRjQr9jKOxV6M=;
 b=dddggEan8eKVHncu5x0CJCZFZXxxq8VZilwZZ2HTGeCY1YTDLYmb0Ik7Fowx6nLda5
 P1g7cA+Wa5984QwfQDrA1UsdLQhgjrPPEbMd0Sr/WrYbuR8xO1z+vqgC5wSi0UKEcymo
 V4TqB++HPtQlZyw6LEkN7EZaTVsjCIMtrVtX4J7E5v8kPEe2FF+l0ieR3dAB7/dqjxP2
 wAnWWapw2zjsgknT5vlYHGOdJae6uuMPmRUEDefRKjppyyEZ9+GWUZDaBuEQ1tPeTiWo
 rpbh0BkmVkjQU0a3W4SUPKdv9+HuJkxfb787/MueDa9cZMlMEm4Tq5LlPR8zfHq4ztD+
 sQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ARybaRdfRU2zyGFZvJK026gdqRK0ZnsRjQr9jKOxV6M=;
 b=4+ZEkQ9RLyV6eRpc6NGhYC8aHdxYSJs9V6cuV3nXAUkCFCd5AmAx5crJ2zwioNqU73
 +A0drbKqjQsDsBu9/z7OTP7CGBYU9ve4E2/31lZN2k/yGIezLlYpP29QvQfCdXrjtk2r
 Mi5bOo3bymbavy4oL6AwUrpI64xhJOcQu9pJx6/cs/VPej59sRMrcF067Xc/F4/MiFzp
 Pzx+0pL5X8kVO/ziODxRKXy2vjI7FwZoctzYokHFDsj2YeKRJ0TUfI278itzE8oCHzpE
 xBOPyG6LfREorqYWpdRV+8mCbPUwua6TmzooZ1/4o+zfTxCcHuXPjPc8R6UhwITw7BZf
 VIlQ==
X-Gm-Message-State: AOAM530HXSOPLMK4zb5Ft/tJqcu5unOMfDWtnAWc4UBX3wiS7A2eHcZO
 Sls+s1a3LZix2NwDQgXh5V63uL+XaDCW4dU6xgvcpQ==
X-Google-Smtp-Source: ABdhPJwzQIR402UAs8CN34jtzV7udIWfpjS4QXgLkJUfALQkGesCjodBTSAXkelUytf4Cme768yA3mPu2rBGRNSIxdA=
X-Received: by 2002:a05:620a:15cb:b0:69c:7933:ad3e with SMTP id
 o11-20020a05620a15cb00b0069c7933ad3emr221571qkm.755.1650560379462; Thu, 21
 Apr 2022 09:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <CAFEAcA9PCoVH_1EWTPWP_rqsOEhQZSvDZcEgw01=5W-cuyeJoA@mail.gmail.com>
 <CAGcCb12ouKaqwT5JAdysiVVmOQfz_MAYH+uukPfrz_3FqC7QdQ@mail.gmail.com>
 <CAFEAcA9P9aYrOgo08h1qS4mWt3+GmxgDYbxC-BTrG8_e67w18w@mail.gmail.com>
In-Reply-To: <CAFEAcA9P9aYrOgo08h1qS4mWt3+GmxgDYbxC-BTrG8_e67w18w@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Thu, 21 Apr 2022 09:59:28 -0700
Message-ID: <CAGcCb13ty6=8ETcvcJqUi5_o1S-3CMP_u2_wZoCvrd34siJmgg@mail.gmail.com>
Subject: Re: [PATCH for-7.1 00/11] hw/arm: Add NPCM8XX support
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Patrick Venture <venture@google.com>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>, Havard Skinnemoen <hskinnemoen@google.com>, 
 IV00 Uri Trichter <Uri.Trichter@nuvoton.com>, Vishal.Soni@microsoft.com, 
 Titus Rwantare <titusr@google.com>
Content-Type: multipart/alternative; boundary="00000000000019795905dd2d090b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=wuhaotsh@google.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--00000000000019795905dd2d090b
Content-Type: text/plain; charset="UTF-8"

Thanks!

I can add the new CPU type to virt in a separate patch set. It might take a
while before I send out
that patch set.

Since this patch set will be dependent on that I won't send out a v2 on
this patch set until that finishes.

On Thu, Apr 21, 2022 at 9:42 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 21 Apr 2022 at 17:29, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > Thanks for all the comments you gave! I'll go over and address them
> recently.
> >
> > For this question, The actual CPU should be cortex A35. However, I don't
> see
> > them supported in QEMU. If I inserted CPU with "cortex-a35" QEMU will
> complain:
> > qemu-system-aarch64: missing object type 'cortex-a35-arm-cpu'
> >
> > What should I do here?
>
> You need to implement the new CPU type first... This means adding
> something to target/arm/cpu64.c which will look similar to the
> existing CPU handling. You need to watch out for:
>  * getting all the ID register values right (check the TRM for the CPU)
>  * implementing whatever the right impdef system registers are
>  * checking whether QEMU is still missing support for any of the
>    architectural features that the A35 implements (what QEMU
>    supports is listed in docs/system/arm/emulation.rst)
>
> It's typically not much code but quite a lot of cross-checking
> against the TRM for the CPU that we're not missing pieces...
> Since you can add the A35 as a supported CPU type for the 'virt'
> board you can do A35 support as a separate patchset that doesn't
> depend on the npmc8xx work.
>
>
> https://patchew.org/QEMU/20220417174426.711829-1-richard.henderson@linaro.org/20220417174426.711829-60-richard.henderson@linaro.org/
> is an example of how to add a new CPU (in that case the A76), at
> the end of a large patchset from RTH that's still going through
> code review.
>
> -- PMM
>

--00000000000019795905dd2d090b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks!<div><br></div><div>I can add the=C2=A0new CPU type=
 to virt in a separate patch set. It might take a while before I send out</=
div><div>that patch set.</div><div><br></div><div>Since this patch set will=
 be dependent on that I won&#39;t send out a v2 on this patch set until tha=
t finishes.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, Apr 21, 2022 at 9:42 AM Peter Maydell &lt;<a href=
=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 21 Apr=
 2022 at 17:29, Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D=
"_blank">wuhaotsh@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Thanks for all the comments you gave! I&#39;ll go over and address the=
m recently.<br>
&gt;<br>
&gt; For this question, The actual CPU should be cortex A35. However, I don=
&#39;t see<br>
&gt; them supported in QEMU. If I inserted CPU with &quot;cortex-a35&quot; =
QEMU will complain:<br>
&gt; qemu-system-aarch64: missing object type &#39;cortex-a35-arm-cpu&#39;<=
br>
&gt;<br>
&gt; What should I do here?<br>
<br>
You need to implement the new CPU type first... This means adding<br>
something to target/arm/cpu64.c which will look similar to the<br>
existing CPU handling. You need to watch out for:<br>
=C2=A0* getting all the ID register values right (check the TRM for the CPU=
)<br>
=C2=A0* implementing whatever the right impdef system registers are<br>
=C2=A0* checking whether QEMU is still missing support for any of the<br>
=C2=A0 =C2=A0architectural features that the A35 implements (what QEMU<br>
=C2=A0 =C2=A0supports is listed in docs/system/arm/emulation.rst)<br>
<br>
It&#39;s typically not much code but quite a lot of cross-checking<br>
against the TRM for the CPU that we&#39;re not missing pieces...<br>
Since you can add the A35 as a supported CPU type for the &#39;virt&#39;<br=
>
board you can do A35 support as a separate patchset that doesn&#39;t<br>
depend on the npmc8xx work.<br>
<br>
<a href=3D"https://patchew.org/QEMU/20220417174426.711829-1-richard.henders=
on@linaro.org/20220417174426.711829-60-richard.henderson@linaro.org/" rel=
=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/20220417174426.7=
11829-1-richard.henderson@linaro.org/20220417174426.711829-60-richard.hende=
rson@linaro.org/</a><br>
is an example of how to add a new CPU (in that case the A76), at<br>
the end of a large patchset from RTH that&#39;s still going through<br>
code review.<br>
<br>
-- PMM<br>
</blockquote></div>

--00000000000019795905dd2d090b--

