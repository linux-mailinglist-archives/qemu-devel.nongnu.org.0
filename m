Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1079E39BB70
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:08:04 +0200 (CEST)
Received: from localhost ([::1]:45036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBQZ-0004If-5q
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1lpBPV-0002up-Nk; Fri, 04 Jun 2021 11:06:57 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32]:40599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1lpBPQ-00006L-On; Fri, 04 Jun 2021 11:06:57 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 j17-20020a0568200231b029024900620310so1032943oob.7; 
 Fri, 04 Jun 2021 08:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TjjX2Rnv95rJTzf3m9Yuf2udKchqjycu38PflHn6i+g=;
 b=bFYEC4yHLiexoM6CxYI8cbXzh7yXcC/kQaOdTI7X51xofE2rveMWb2hbPiUK0CapEO
 UzFeTAssGz1h3o30ROq7eGJT1CpDgPSl2KkLpVHXA2K1H6aIDFERJWMTqGgA8MeLG9Mw
 9UqPyVHHFGL0brY86Go2AZJc/WTwel8hm39xuVQNAbaLgVWrHiyEUCwTCLTvEGxLABXC
 3WGyVkYUneg8bM9WcOM89KzDs9UiZZ0O9pq4+uCnOOOX4DboXrXT/3G8Ne7/Y1MjcZoq
 qwt/n83C3uiIKL5VU1gXihLchH2v6VWwd5HgEzV2kC1vYqGd60wM2+M9OIirtifCm8TS
 vnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TjjX2Rnv95rJTzf3m9Yuf2udKchqjycu38PflHn6i+g=;
 b=B2eg9h+stzqjVNEpPSU8pulCBc81QVxDKXmi820aR7MxTxd+/6aN5zsWsnmxpC52PB
 tNNbDW9ZjxqQ9tfsHVCrzTS6wKhhJfVpDJgSMAwzMyRSCHlA1TWm3OZF+3ijKRoKpM6h
 seSWgzeboCMQ5UuXMY8bX5lOc/Cr23YOjZWW7L4vy9AYqkgrIjW40ZfGOMlhh5R+fEjJ
 J03CdVoK1Apmsp0wVyv9PUlkBUju1Msyurt2na1BduhKYidWJ2V3gQtn6cYM2+K1LZAT
 ScEin/uEuaDvThBqSI+BLqs6IDCKeJ/F5lcBWtwe4w6fsFkeUGBdu9VBF1Lzl81HL/NG
 tCPw==
X-Gm-Message-State: AOAM532LdfAWpPJgjc6Wfx/Ms+YkLwr4y4tQdpyNCujoaktEksTc/y3Z
 bJYlFUOeVz0rBSP6o3k5EF8E0Y+/9YcbhZfUx+U=
X-Google-Smtp-Source: ABdhPJx+3xntftUBlLr9FKrCBHZ46/kuIsX08yA74WAEpV7MtKji/ovRmNaVjJHo1xwV22h1hth1VrL03+0kTBjMOcQ=
X-Received: by 2002:a05:6820:386:: with SMTP id
 r6mr3951873ooj.25.1622819211043; 
 Fri, 04 Jun 2021 08:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
 <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
 <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
 <CAFEAcA9E4s3dST0GJkdg24DDAn90WU1FEmXwoKD6oQmNSB1vVA@mail.gmail.com>
 <CABSBigR1L9sE36eYA0Mq4smx1E9A4umTOKTe_x97foSMkryRnw@mail.gmail.com>
 <CALf2nmLOqtwacgrQ91TTz9_QRUmFS9ZNii2Kk7-tQ7LNp9vw2Q@mail.gmail.com>
 <CAFEAcA8oAtjVom+BXtcgao4O252ipmFzv-iNTSzDaJChcQkr9g@mail.gmail.com>
 <CALf2nmKgaZiBOfEWpMt4Yq-NyCYrsFNPwb1hZ0adwoXUs4T6pA@mail.gmail.com>
 <CALf2nmLLZ5smxqYJyA+_MPunaQqaM7-Ub9CVurTE1pM0ErOS+w@mail.gmail.com>
 <CAFEAcA9GM72tvOLDZfW=TmvV=DN1cAeXJ_MScWb3oivAR7X9LQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9GM72tvOLDZfW=TmvV=DN1cAeXJ_MScWb3oivAR7X9LQ@mail.gmail.com>
From: Swetha Joshi <swethajoshi139@gmail.com>
Date: Fri, 4 Jun 2021 08:06:38 -0700
Message-ID: <CALf2nmJ-uRf=8Bq2hotai7MOD9uRVUQ0YHS667AjfVKJDYd4Qg@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009be5d505c3f20ab6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=swethajoshi139@gmail.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009be5d505c3f20ab6
Content-Type: text/plain; charset="UTF-8"

Can y oh I let me know once it goes in mainline? Thanks!

On Fri, Jun 4, 2021 at 2:03 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 4 Jun 2021 at 06:26, Swetha Joshi <swethajoshi139@gmail.com>
> wrote:
> >
> > Hello, I have tested this patch with our qemu and it works, thank you.
>
> Thanks for testing.
>
> > What are the next steps for this patch? So is it approved and ready to
> go in mainline?
>
> It will go in once it has been code-reviewed.
>
> -- PMM
>
-- 
Regards

Swetha Joshi.

--0000000000009be5d505c3f20ab6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can y oh I let me know once it goes in mainline? Thanks!=
=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, Jun 4, 2021 at 2:03 AM Peter Maydell &lt;<a href=3D"mail=
to:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-colo=
r:rgb(204,204,204)">On Fri, 4 Jun 2021 at 06:26, Swetha Joshi &lt;<a href=
=3D"mailto:swethajoshi139@gmail.com" target=3D"_blank">swethajoshi139@gmail=
.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello, I have tested this patch with our qemu and it works, thank you.=
<br>
<br>
Thanks for testing.<br>
<br>
&gt; What are the next steps for this patch? So is it approved and ready to=
 go in mainline?<br>
<br>
It will go in once it has been code-reviewed.<br>
<br>
-- PMM<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Regards<div><br></div><=
div>Swetha Joshi.</div></div></div>

--0000000000009be5d505c3f20ab6--

