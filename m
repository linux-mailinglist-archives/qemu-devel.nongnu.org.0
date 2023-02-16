Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66A6699117
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 11:24:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSbR7-0006Yx-E0; Thu, 16 Feb 2023 05:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSbQz-0006YG-Q8
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:24:13 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSbQx-0001gF-R4
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:24:13 -0500
Received: by mail-ej1-x62e.google.com with SMTP id my5so3973329ejc.7
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 02:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4vY3dDqyTKg0WIhjq5wjc7jlfupJ1FQ/URlx4jmvaok=;
 b=rC7gkVfrDCDZYm7IXBCXnqpzS2DmKNucsd32hepc8BPTH5WxLs5GSDsccVhDllZD4Y
 UiNxLI7voINaRhU5e61nifWr3UHRjxbhZZdURWj8Z5p0E0oVkinZQKLx1jPZDlINQWRH
 q6VbKIrQ3+9rCsgeFaVYFe0bx4g3iKhMd+vNA+VE1ypWxxuD/nV/O6IlUjNWO0ltZX1H
 l3uhVZvOb1cTudFk/WF0MEBfnvHW0771gvQ9i7f3j7+1rgtppevgbudUErvkJYwq7krk
 kPLOI9KX06WdwoTJB01EdiwFxhRpcbBj6XgUfI7gJWihvfwKx8hg7XDLWp0cJpBw37zG
 YzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4vY3dDqyTKg0WIhjq5wjc7jlfupJ1FQ/URlx4jmvaok=;
 b=WwMxVzBo1DZJk30TnpG8UxtnaLh3IbTTOaQKYo/jhmjdCtkb2SFOJ8QOEQetJarWyT
 87Zma2ogYNZ5wD0rBcvWMAXPjY2JN3qf3hndYXYeR9dFSloql1/05e1nM0lIZHC1mIPu
 iRpwmii4Xw6BN8eE3QQYypJEiZhOclJgqA2tIrGJRhTUchNR3a28yZfMr8kFd1Lfe+Vp
 2oCOSlqWh1v4oEhLjoYPSi9SJSay8P55tWhzzylZBcw/rI1Xgy5FgBbDAziWRJBoA1AY
 xMGy9gY/UtCZLiUZsgrHK4YViJTwzWCiJLOMexk+ZtAhORwZnKy0UHi0UUny3/AwvmhA
 lOVQ==
X-Gm-Message-State: AO0yUKUYjFGcTjcT8Bp6Th/pQwgarVBOzcIOiyVIj/4yWUnElolyX8Pl
 0TKRJ/65PzxmNlEIbF7XD6DLvYOzUEzgHffsNNMY9Q==
X-Google-Smtp-Source: AK7set89xkUa2kFDpogmdapNKBlMqzQAo3jc7AEaYfO7kOPcsQ6dS+xUB4VSECrcvEzNF9J5/mvKhlvK7tzDOCQ16N4=
X-Received: by 2002:a17:907:7630:b0:87b:d79f:9953 with SMTP id
 jy16-20020a170907763000b0087bd79f9953mr2554934ejc.11.1676543050052; Thu, 16
 Feb 2023 02:24:10 -0800 (PST)
MIME-Version: 1.0
References: <87bklt9alc.fsf@linaro.org>
In-Reply-To: <87bklt9alc.fsf@linaro.org>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Thu, 16 Feb 2023 10:23:58 +0000
Message-ID: <CAHDbmO3QSbpKLWKt9uj+2Yo_fT-dC-E4M1Nb=iWHqMSBw35-3w@mail.gmail.com>
Subject: Re: Future of icount discussion for next KVM call?
To: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>, 
 Bill Mills <bill.mills@linaro.org>, Marco Liebel <mliebel@qti.qualcomm.com>, 
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Emilio Cota <cota@braap.org>
Content-Type: multipart/alternative; boundary="000000000000f30d1005f4ce9835"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000f30d1005f4ce9835
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(replying all because qemu-devel rejected my email again)

On Thu, 16 Feb 2023 at 10:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

> Hi Juan,
>
> Do we have an agenda for next weeks KVM call yet? If there is space I'd
> like to take some time to discuss the future direction of icount.
>
> Specifically I believe there might be some proposals for how we could
> support icount with MTTCG worth discussing. From my point of view icount
> provides too things:
>
>   - a sense of time vaguely related to execution rather than wall clock
>   - determinism
>
> I would love to divorce the former from icount and punt it to plugins.
> The plugin would be free to instrument as heavily or lightly as it sees
> fit and provide its best guess as to guest time on demand. I wrote this
> idea up as a card in Linaro's JIRA if anyone is interested:
>
>   https://linaro.atlassian.net/browse/QEMU-481
>
> Being able to punt cost modelling and sense of time into plugins would
> allow the core icount support to concentrate on determinism. Then any
> attempt to enable icount for MTTCG would then have to ensure it stays
> deterministic.
>
> Richard and I have discussed the problem a few times and weren't sure it
> was solvable but I'm totally open to hearing ideas on how to do it.
> Fundamentally I think we would have to ensure any TB's doing IO would
> have to execute in an exclusive context. The TCG code already has
> mechanisms to ensure all IO is only done at the end of blocks so it
> doesn't seem a huge leap to ensure we execute those blocks exclusively.
> However there is still the problem of what to do about other pure
> computation threads getting ahead or behind of the IO blocks on
> subsequent runs.
>
> Anyway does anyone else have ideas to bring to the discussion?
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>


--=20
Alex Benn=C3=A9e
Emulation and Virtualisation Tech Lead @ Linaro

--000000000000f30d1005f4ce9835
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">(replying all because qemu-devel rejected my email again)<=
br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, 16 Feb 2023 at 10:19, Alex Benn=C3=A9e &lt;<a href=3D"mailto:ale=
x.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi Juan,<br>
<br>
Do we have an agenda for next weeks KVM call yet? If there is space I&#39;d=
<br>
like to take some time to discuss the future direction of icount.<br>
<br>
Specifically I believe there might be some proposals for how we could<br>
support icount with MTTCG worth discussing. From my point of view icount<br=
>
provides too things:<br>
<br>
=C2=A0 - a sense of time vaguely related to execution rather than wall cloc=
k<br>
=C2=A0 - determinism <br>
<br>
I would love to divorce the former from icount and punt it to plugins.<br>
The plugin would be free to instrument as heavily or lightly as it sees<br>
fit and provide its best guess as to guest time on demand. I wrote this<br>
idea up as a card in Linaro&#39;s JIRA if anyone is interested:<br>
<br>
=C2=A0 <a href=3D"https://linaro.atlassian.net/browse/QEMU-481" rel=3D"nore=
ferrer" target=3D"_blank">https://linaro.atlassian.net/browse/QEMU-481</a>=
=C2=A0 <br>
<br>
Being able to punt cost modelling and sense of time into plugins would<br>
allow the core icount support to concentrate on determinism. Then any<br>
attempt to enable icount for MTTCG would then have to ensure it stays<br>
deterministic.<br>
<br>
Richard and I have discussed the problem a few times and weren&#39;t sure i=
t<br>
was solvable but I&#39;m totally open to hearing ideas on how to do it.<br>
Fundamentally I think we would have to ensure any TB&#39;s doing IO would<b=
r>
have to execute in an exclusive context. The TCG code already has<br>
mechanisms to ensure all IO is only done at the end of blocks so it<br>
doesn&#39;t seem a huge leap to ensure we execute those blocks exclusively.=
<br>
However there is still the problem of what to do about other pure<br>
computation threads getting ahead or behind of the IO blocks on<br>
subsequent runs.<br>
<br>
Anyway does anyone else have ideas to bring to the discussion?<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr">Alex Benn=C3=A9e<br>Emulation and Virtuali=
sation Tech Lead @ Linaro</div></div>

--000000000000f30d1005f4ce9835--

