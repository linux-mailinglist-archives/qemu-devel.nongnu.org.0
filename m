Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A106F7A0B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 02:24:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujDJ-0007BW-BW; Thu, 04 May 2023 20:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsun@junsun.net>) id 1pujDG-00079B-W8
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:22:19 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jsun@junsun.net>) id 1pujDE-0005l4-UG
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:22:18 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6a5d9853d97so452665a34.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 17:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=junsun-net.20221208.gappssmtp.com; s=20221208; t=1683246135; x=1685838135;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5SUr3/YDfseLvAPIUr4NOga8wGQCw3WV5Lgr49hR+OU=;
 b=sJ7VlxHENFk762+8JyUVzCqbrhxruGN6fO1KMcB2oJc8u8PcQ+JJhEH04j64wDuwf1
 GYG1wJNEIYUsoeBVFMMGOtbpzf6W2ljNUuVfq6u/KwNcJ7tpTLsMVgo10rp8iz0ABSCr
 p6GmGDlwfIdWnmFFrGrDZjDGgLfW9ocyuij4r9cmmLaT2vhYQQkBSK7IK7zrr8rJZ8jy
 WfZ3VUIBqN6a+WuKiVrkJEI5NDkkwu80djITq9nFkdUgjqN15XqiNnHBOUzxDsBuZuxV
 T40kz632zR/Uh1T9GyREtdbQ0bl0NnvP8E5y9ej3Ph/vCD78Ss7O6vC6bu12BIbswKB2
 tjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683246135; x=1685838135;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5SUr3/YDfseLvAPIUr4NOga8wGQCw3WV5Lgr49hR+OU=;
 b=J9ArK+SoNKLp1k+DMw1PqdSi13DNhHu1VLumC+EMggLpHe/C+H2aCn3+xRGSo5HnaA
 tyCaMGIMH92+989my+msbR+mB2cvgifdh0dU4M4BCywkwIAlI25agzHIjjcTFRQXFLzf
 7pH5+BdVlf2lH6Xyp4GV7LFQn0Dn+VAL+EKJZmhWEcju73W/BvHsL519Fkd2L4qUGgQi
 VyU1yQJ0b2jCvugB///8ukSdCn5LfTBs/1/dxK6yl1TF4g0/mLPEFMmYxbIfjQakEYjt
 vKUko2qDMktGESqc6+b27ZSJt8+i17Cl4aiRw3HBRIJt4FgUCq8dejwW59HPg0t2sdxf
 Eyhw==
X-Gm-Message-State: AC+VfDyQyrnnE52ECRQdl6hyFCIUpVxziYxpNyP6ddH0VcP7LAWgoBp3
 sl4scBz8AJGtrgWuHhqKCv+YU9Hh09w3R4VBY0fe0Q==
X-Google-Smtp-Source: ACHHUZ5d43j6LnYctEJ2nlaPxQQTZthn20cm39pQMncptC2ukLIZZ12ijDBF4nl6C8ZitlcATzn7Vv1JGpQ6wcvHXnw=
X-Received: by 2002:a05:6808:1a9c:b0:38e:4737:fba1 with SMTP id
 bm28-20020a0568081a9c00b0038e4737fba1mr2304858oib.29.1683246135212; Thu, 04
 May 2023 17:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAP5Nno6wrz4qEMK70KFwxoZWeo89+SAyXDXFW8A30mJ-WeFi4A@mail.gmail.com>
 <87ttwts5ur.fsf@linaro.org>
In-Reply-To: <87ttwts5ur.fsf@linaro.org>
From: Jun Sun <jsun@junsun.net>
Date: Thu, 4 May 2023 17:22:03 -0700
Message-ID: <CAP5Nno4C6C-sfj73NM92Gstnw8mm7A7RwEYT=oUZm1Fh0QqFYQ@mail.gmail.com>
Subject: Re: [PATCH risu] use time() as random seed and introduce --randseed
 option
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f5955405fae747ac"
Received-SPF: none client-ip=2607:f8b0:4864:20::329;
 envelope-from=jsun@junsun.net; helo=mail-ot1-x329.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000f5955405fae747ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Agree on the usefulness of generating the same test.  That is the reason
behind adding --randseed option.  Once a seed is set, it always generates
the same sequence of instructions.

Basically with this patch,

   - by default you will generate random instruction sequences for most
   testing cases
   - you can provide a random seed option in the commandline to generate a
   deterministic instruction sequence

Without this patch,

   - we always get one fixed sequence (ie. random seed =3D=3D 0 case)
   - Otherwise we would have to manually modify code to generate random
   instruction sequences or generate a different fixed sequence.

Hope this clarifies things a little bit.

Jun

On Wed, May 3, 2023 at 10:05=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:

>
> Jun Sun <jsun@junsun.net> writes:
>
> > By default, risu currently does not generate random instruction
> sequences because it uses 0 as the random seed.
> > This patch uses time() as random seed and also introduces --randomseed
> option for deterministic sequence
> > generation.
>
> I can see the benefit for being able to change the seed but I think
> using time() by default means any given sequence won't be reproducible.
> This is useful behaviour if you want to regenerate the same test
> sequence on another machine without copying stuff about.
>
> >
> > [4. text/x-diff;
> 0008-add-randseed-option-and-use-time-as-default-seed.patch]...
>
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

--000000000000f5955405fae747ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Agree on the usefulness of generating the same test.=C2=A0=
 That is the reason behind adding --randseed option.=C2=A0 Once a seed is s=
et, it always generates the same sequence of instructions.<div><br></div><d=
iv>Basically with this patch,</div><div><ul><li>by default you will generat=
e random instruction sequences for most testing cases</li><li>you can provi=
de a random seed option in the commandline=C2=A0to generate a deterministic=
 instruction sequence</li></ul><div>Without this patch,</div></div><div><ul=
><li>we always get one fixed sequence (ie. random=C2=A0seed =3D=3D 0 case)<=
/li><li>Otherwise we would have to manually modify code to generate random =
instruction sequences or generate a different=C2=A0fixed sequence.</li></ul=
><div>Hope this clarifies things a little bit.</div></div><div><br></div><d=
iv>Jun</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, May 3, 2023 at 10:05=E2=80=AFAM Alex Benn=C3=A9e &lt;<a=
 href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Jun Sun &lt;<a href=3D"mailto:jsun@junsun.net" target=3D"_blank">jsun@junsu=
n.net</a>&gt; writes:<br>
<br>
&gt; By default, risu currently does not generate random instruction sequen=
ces because it uses 0 as the random seed. <br>
&gt; This patch uses time() as random seed and also introduces --randomseed=
 option for deterministic sequence<br>
&gt; generation.<br>
<br>
I can see the benefit for being able to change the seed but I think<br>
using time() by default means any given sequence won&#39;t be reproducible.=
<br>
This is useful behaviour if you want to regenerate the same test<br>
sequence on another machine without copying stuff about.<br>
<br>
&gt;<br>
&gt; [4. text/x-diff; 0008-add-randseed-option-and-use-time-as-default-seed=
.patch]...<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
</blockquote></div>

--000000000000f5955405fae747ac--

