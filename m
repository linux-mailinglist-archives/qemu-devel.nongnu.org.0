Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262FC398111
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 08:23:32 +0200 (CEST)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loKHr-0001Y6-8Z
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 02:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loKGy-0000sW-Op
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 02:22:36 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:36508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loKGw-0005DE-U4
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 02:22:36 -0400
Received: by mail-il1-x12e.google.com with SMTP id e7so1131836ils.3
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 23:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xac4Fsma//Ce4J7Pn81xjKOS9OT9Di2F23ObP0Rs004=;
 b=ukvQMRMaXyXcEPWC4lS2wuN2x3WTeAkdbktGtAAAahzMT/AUVjJ5Vj7fwCfhhWTVVs
 TPmeLLqKKh3r2Dhd2jm5QFBjjxoiCz8Q2fRp3ckw5iw1Z4gW/XlqYeHDo6oxifR2P/4P
 /8YGnpqMiiixrI89IZN8oFYFfhefhe4tErhiS49KNUMxbvUtZSbMqD0yxn/Qoeva1k5e
 fvhdHMGDTktL5/d6qLfplJCvPt3M+fERpPW2wI89ThJT7QiSpmhQ9smEc9QCVYtyaYhB
 UHwt5pVFsqmsroBIoSYJ6TyOVMRv1h5MTR6ho4AZZwcqjiCsF0enpZ7LhA4JCO2+WnFL
 8yJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xac4Fsma//Ce4J7Pn81xjKOS9OT9Di2F23ObP0Rs004=;
 b=L7OCibFDPatIR/mKnbj7n6bGawTlCHTBFb9k/mIQo8hbPo0BAnoHtgfwXsExzH8pEb
 tFJtLMxfj3SMOms598bnosrxfkdbQ212HNxlOOkqvz6gt5d9ni1CTt+3wP7RPMNRsApc
 DD3nuSU5m2I4SszxtdlUlXvwzwWpfRcPVYm2rbf42p+vWjZb2urXhY1AIa1gzwnnXSCm
 KsoBlJt1C40et9BhMDpD13AQK9V6+NW4EKxxDoLFaMCAR8ueqy6uDaMffH9Xnvnc6z/M
 z7dcYT484pk1WKHHDHN27WhAlvXE7xp7LptemBxbWHX2FEb2otsheMIDbW3AayHYHqkr
 PZPw==
X-Gm-Message-State: AOAM532VM6SDxtfbF9kSj7FHNxtLdmqj+7A9+oVklhzVaQ1/GDyYuFOw
 Us/MtV250QqOK7txCp4BoagPBdNpay7Hs/QnmXQ=
X-Google-Smtp-Source: ABdhPJw2t63BaKuyWnFm4zvdwdUQ00mecRRJqWmUuB/Ns+T7sNm2wRYEf9gGGmqTXedJZ0lV5op0xkYltL8zfle0bc0=
X-Received: by 2002:a05:6e02:154d:: with SMTP id
 j13mr1165221ilu.81.1622614953884; 
 Tue, 01 Jun 2021 23:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210530063712.6832-1-ma.mandourr@gmail.com>
 <871r9ld823.fsf@linaro.org>
In-Reply-To: <871r9ld823.fsf@linaro.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 2 Jun 2021 08:22:22 +0200
Message-ID: <CAD-LL6hBCaXEFCN7Ou5vm11bWrptoK3C50sGSVr0JKBa+akcLg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] Cache modelling TCG plugin
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ef014a05c3c27b86"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x12e.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ef014a05c3c27b86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 1, 2021 at 3:32 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

>
> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>
> > In this RFC patch series, I propose an initial cache modelling TCG
> > plugin. As of now, it models separate L1 data cache and L1 instruction
> > cache. It supports three eviction policies: LRU, random, and FIFO. Once
> > a policy is chosen, it's used for both instruction and data caches.
> >
> > v1 -> v2: Unlocked dmtx on early return in vcpu_mem_access & removed a
> >           (probably?) bad InsnData free.
> >           This is probably still problematic since it does not free the
> >           ``idata`` allocated for the vcpu_mem_access callback even
> >           once, but if it's placed, it would double-free it.
> >           How do I mitigate this? I need to free the InsnData passed to
> >           vcpu_mem_access only once if we find out that it's an IO
> >           access since we do not need it anymore and it will early
> >           return every time.
>
> OK I've done my review, sorry I reviewed 1/3 from the previous series.
> I've made some comments inline in those patches but I think this is an
> excellent start to the project. I think we can get the core plugin
> up-streamed fairly quickly and then spend some time examining better
> integration and possibly enhancing the plugin API.
>
> --
> Alex Benn=C3=A9e
>

Thanks so much for taking the time to thoroughly and also quickly
review the series. The feedback is greatly appreciated and I've
implemented most of it, I want your approval about the LRU discussion
and I think that I will be able to repost a cleaner version.

Thanks,
Mahmoud

--000000000000ef014a05c3c27b86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 1, 2021 at 3:32 PM Alex Benn=
=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com" target=3D"_bla=
nk">ma.mandourr@gmail.com</a>&gt; writes:<br>
<br>
&gt; In this RFC patch series, I propose an initial cache modelling TCG<br>
&gt; plugin. As of now, it models separate L1 data cache and L1 instruction=
<br>
&gt; cache. It supports three eviction policies: LRU, random, and FIFO. Onc=
e<br>
&gt; a policy is chosen, it&#39;s used for both instruction and data caches=
.<br>
&gt;<br>
&gt; v1 -&gt; v2: Unlocked dmtx on early return in vcpu_mem_access &amp; re=
moved a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(probably?) bad InsnData free.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is probably still problem=
atic since it does not free the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0``idata`` allocated for the vc=
pu_mem_access callback even<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0once, but if it&#39;s placed, =
it would double-free it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0How do I mitigate this? I need=
 to free the InsnData passed to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vcpu_mem_access only once if w=
e find out that it&#39;s an IO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0access since we do not need it=
 anymore and it will early<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return every time.<br>
<br>
OK I&#39;ve done my review, sorry I reviewed 1/3 from the previous series.<=
br>
I&#39;ve made some comments inline in those patches but I think this is an<=
br>
excellent start to the project. I think we can get the core plugin<br>
up-streamed fairly quickly and then spend some time examining better<br>
integration and possibly enhancing the plugin API.<br>
<br>
-- <br>
Alex Benn=C3=A9e<br></blockquote><div><br></div>Thanks so much for taking t=
he time to thoroughly and also quickly<div>review=C2=A0the series. The feed=
back is greatly appreciated and I&#39;ve</div><div>implemented most of it, =
I want your approval about the LRU discussion</div><div>and I think that I =
will be able to repost a cleaner version.</div><div><br></div><div>Thanks,<=
/div><div>Mahmoud=C2=A0</div></div></div>

--000000000000ef014a05c3c27b86--

