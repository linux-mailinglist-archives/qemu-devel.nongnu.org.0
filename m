Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D773758F3A0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 22:45:08 +0200 (CEST)
Received: from localhost ([::1]:45386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLsZf-0002W6-Sa
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 16:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitalybuka@google.com>)
 id 1oLsNq-000336-UO
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:32:58 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vitalybuka@google.com>)
 id 1oLsNm-0007Ps-F6
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:32:52 -0400
Received: by mail-ed1-x531.google.com with SMTP id b96so20653844edf.0
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 13:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=TTulQ3YO/CzEPVPJ4IAzgqP9p38NHbJewrEmD+X7kbk=;
 b=XOXNZDZd0h5Usr/PGrmwIac9ipK85oH5PuhmZdJZQmpihKhWc6Vyde3s6jxeR949eg
 2iIgEtJ6/etd+eBwhpeWQ0gy+E4eG82eXmI/GLjc7OPCgzLqVrG/iGlQmL1DtnNzxStV
 N7sZ41beOh+H02VBkRjQF3MH+VzvD0MG0b4NnmYHOgkLEAJlBQQmSnPUgwE+t9ofY4RJ
 le3j0zc0GbueP4dX72VJI52kNAJIzJjMBsgg+Wv18vky+3Q6t1Wc8MIjjNZdcg7tni7L
 IR3TiJs7yF2bf5kN1fu0q4lu5dMaCEgDECVfEZAdiul2prijN1jPYYkETdoAM0pe0dF8
 GPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=TTulQ3YO/CzEPVPJ4IAzgqP9p38NHbJewrEmD+X7kbk=;
 b=KeDHswDCUAqnMof705I3ccT9h9O5Zt3Ytm6+69fg9gw28/XRQKKCt40ev3hW3JcrSg
 nM3S5vmgEWwlymcPzlgq8I6Zi5bMmYWHTdGrt0IS2upzqfJGRc8M0GdZH32UOKlqKeS8
 CWFipS+p8fmSsLF4o2juPtIthDz2OBv9OGMoCFCkpYcCo+tacHPPwA7JFoBHTY5yKycc
 V7Z9p2c2Jl7iFRc0SQmlU1lfVpRrRv7ATgKFivGxe4TW+aAaYmsXA0uJxyZO2TjglSMG
 mARcRuSQOYqqJ/jpZaHCWTLLhmzBfgMLnwdxaAMqwO8LQPvDvRWhHJZ98g+R0+SGmEUH
 QwOQ==
X-Gm-Message-State: ACgBeo1N+gAwcAxVIWc6IV6jL/AP4BK599odzzgQSaoeXRepylRQ9rm3
 2lFxsmVyBVKh+tZOnsoISQTaD6xsADljac4W6VlIAw==
X-Google-Smtp-Source: AA6agR4233t3w7mFk+BwwLtXjHiyxh/f6x1UJ1OG2eclKpWK1OphZmmD78G/mQvkgBDhrIkxTl87S9hyleU9eO6XH4A=
X-Received: by 2002:aa7:cd51:0:b0:440:595d:aeed with SMTP id
 v17-20020aa7cd51000000b00440595daeedmr20069393edw.143.1660163566875; Wed, 10
 Aug 2022 13:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
 <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
In-Reply-To: <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
From: Vitaly Buka <vitalybuka@google.com>
Date: Wed, 10 Aug 2022 13:32:09 -0700
Message-ID: <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000aca42205e5e8f319"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=vitalybuka@google.com; helo=mail-ed1-x531.google.com
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

--000000000000aca42205e5e8f319
Content-Type: text/plain; charset="UTF-8"

Sorry, I only noticed today that it's not submitted.
Version is not critical for us, as we build from masters anyway.
Richard, do you know a reason to consider this critical?

On Wed, 10 Aug 2022 at 13:04, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com> wrote:
> >
> > How can we land this one?
>
> Pinging it a week ago rather than now would have been a good start :-(
> I think it got missed because you didn't cc the linux-user maintainer.
>
> Is this a critical fix for 7.1 or can we let it slip to 7.2 ?
>
> thanks
> -- PMM
>

--000000000000aca42205e5e8f319
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry, I only noticed today that it&#39;s not=C2=A0su=
bmitted.</div><div>Version is not critical for us, as we build from masters=
 anyway.<br></div><div>Richard, do you know a reason to consider this criti=
cal?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Wed, 10 Aug 2022 at 13:04, Peter Maydell &lt;<a href=3D"mailto=
:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 10 Aug 2022 at 2=
1:00, Vitaly Buka &lt;<a href=3D"mailto:vitalybuka@google.com" target=3D"_b=
lank">vitalybuka@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; How can we land this one?<br>
<br>
Pinging it a week ago rather than now would have been a good start :-(<br>
I think it got missed because you didn&#39;t cc the linux-user maintainer.<=
br>
<br>
Is this a critical fix for 7.1 or can we let it slip to 7.2 ?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000aca42205e5e8f319--

