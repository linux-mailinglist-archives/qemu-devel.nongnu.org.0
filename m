Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E2141492C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:41:24 +0200 (CEST)
Received: from localhost ([::1]:38896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT1Yx-0007qg-Hn
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1mT1QN-0006XF-Hq
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:32:31 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:40909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1mT1QL-0000fT-IY
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:32:30 -0400
Received: by mail-oi1-x231.google.com with SMTP id t189so4161173oie.7
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 05:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fe3SbneugNk0wpXAOC0PlxgT6D9Ry3o5OQOEEjDtcVY=;
 b=O/qrbZUTBu4zuEsK1rTO3gbOC+OXdYnuJqrc8dF2gFeewMb7RSSW0TRmTutsEHuZ0R
 PanGJmdyVRccg4KcIliUIjzBiEYZnhiNlCwbeHYHIPs0OfXafMSQRuUAJ5buAhP4ZJ3R
 5bCIpkBIV2qHLZsdOdGf/CAo2w+7TW2ybZypstMB07gzenBz5SyPrzPoAUB6FPxwxOl8
 03HbXymPmIoDvt5t68hGxkHgrvXLr+B1dXWisCnDGA50o8th4oBlsdmsWmulKNHCfFpV
 EnfyC1kDlgqOWW3z2Gw631NhIJOOOaY3yWu/f5RZKq6wKxrODTUise4cbEQ1u2KGvYnE
 qV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fe3SbneugNk0wpXAOC0PlxgT6D9Ry3o5OQOEEjDtcVY=;
 b=VOq2l6SxZ1p+n4kEKz08mj95S+TdLEd6WNvH+pQU4Qk1w/X396Zs7UJIqR+xhf3INN
 c0yTa1ejlwEAT89T80CD6/oRvLhuiLVjGlJOmT3/JNylLEijOBP+YbiR9qpMy0MaDFVG
 qucXaTQv+Ptl1ut8ITkRQhbCesAb1EvUtset86Y3Ty7G0HXKTsnw2TScE3leGp6sRqCj
 u/jE0eRmD3KyBylve6IcHRNfnouFLHkIyg+WEiqWrm/dqXPon8B5bQgkorYxFWLOsg6e
 k29pUsapBuSmWZaqxod2yPiz7/yUxudFNMubYkKOOsjTf1As7D+TaEWknWsZH3gzYlxJ
 T0fA==
X-Gm-Message-State: AOAM530i4FGphyZJVL/5kAP/CYiU6dH1+sUR0z6fI2kx5NHPgHL1Le03
 HhvHa500raa3qUt8ae0sCs+WX2oN6PRiAp2qitTIDn6x
X-Google-Smtp-Source: ABdhPJyQjAq+WVNLsHerGzhBiNgu4R1QiYG9k89DfBBxtNqMwVFGO2rGphOKjGjprK/wRNb9+k4VahkSTMdR5DTRKTY=
X-Received: by 2002:aca:7c5:: with SMTP id 188mr8061309oih.60.1632313948333;
 Wed, 22 Sep 2021 05:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp9HjoCVbFmT9rwAteAVdCCMgobt1jvCLuhL3CCBKJZSsA@mail.gmail.com>
 <87a6k4op6n.fsf@linaro.org>
In-Reply-To: <87a6k4op6n.fsf@linaro.org>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Wed, 22 Sep 2021 08:32:18 -0400
Message-ID: <CAK7rcp_gSO+eCWOPBSbEEB3GMhj7aXrkK166eYxrUr1Yj8HKkg@mail.gmail.com>
Subject: Re: Change TCG cache size?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000d6bca05cc94b508"
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oi1-x231.google.com
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

--0000000000000d6bca05cc94b508
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Well, maybe I'm understanding that wrong. I am talking the cache that the
tcg keeps of translated code. If I got that variable wrong then please let
me know. But I want to make sure that that is large enough to keep from
having to run TCG again. How can I do that?

On Wed, Sep 22, 2021, 6:54 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

>
> Kenneth Adam Miller <kennethadammiller@gmail.com> writes:
>
> > Hello all,
> >
> > I just want to ask this one question: if I change the qemu tcg cache
> > size (TB_JMP_CACHE_SIZE), will that force any errors at run time?
>
> Hopefully not - for both user-mode and softmmu we take some care to
> ensure tb_jmp_cache_hash_func and tb_jmp_cache_hash_page return
> appropriately masked values for the table lookup.
>
> What has not been done since Emilio's work in 6f1653180f (tb-hash:
> improve tb_jmp_cache hash function in user mode) is a deeper look at the
> hit rate and bounce rate of the softmmu jump table hashing. Any
> suggested changes will need some benchmarking to show what difference it
> makes.
>
> --
> Alex Benn=C3=A9e
>

--0000000000000d6bca05cc94b508
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Well, maybe I&#39;m understanding that wrong. I am talkin=
g the cache that the tcg keeps of translated code. If I got that variable w=
rong then please=C2=A0let me know. But I want to make sure that that is lar=
ge enough to keep from having to run TCG again. How can I do that?</div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, S=
ep 22, 2021, 6:54 AM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@lin=
aro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
Kenneth Adam Miller &lt;<a href=3D"mailto:kennethadammiller@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">kennethadammiller@gmail.com</a>&gt; writes=
:<br>
<br>
&gt; Hello all,<br>
&gt;<br>
&gt; I just want to ask this one question: if I change the qemu tcg cache<b=
r>
&gt; size (TB_JMP_CACHE_SIZE), will that force any errors at run time?<br>
<br>
Hopefully not - for both user-mode and softmmu we take some care to<br>
ensure tb_jmp_cache_hash_func and tb_jmp_cache_hash_page return<br>
appropriately masked values for the table lookup.<br>
<br>
What has not been done since Emilio&#39;s work in 6f1653180f (tb-hash:<br>
improve tb_jmp_cache hash function in user mode) is a deeper look at the<br=
>
hit rate and bounce rate of the softmmu jump table hashing. Any<br>
suggested changes will need some benchmarking to show what difference it<br=
>
makes.<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div>

--0000000000000d6bca05cc94b508--

