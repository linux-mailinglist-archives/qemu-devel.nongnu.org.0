Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B10658CD56
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 20:06:56 +0200 (CEST)
Received: from localhost ([::1]:60238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL79T-0007Bn-F2
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 14:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oL74A-0003kF-OH
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 14:01:28 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:42982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oL748-0002Oz-Ja
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 14:01:26 -0400
Received: by mail-vs1-xe36.google.com with SMTP id b124so9576353vsc.9
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 11:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Q38ED6uBiOaMaUgrWEmCZ9B9V2cpD4kN6BpN+lMzLXk=;
 b=zQKxBDxa8lvT0BnEPufrzJW2qWTKOX2i+SzKYaeAR5/BlvFV2+6kq7Y6dNdzP7eFJv
 hzcF2SJ0dZYEFV0aIvCfAaV0AW9c7sG3/Ng3f9HgReSXgGecukw2k+H55v0XpWNb7HZa
 gE6QJP6ydZ7Jx+bzBuglAT6AwGfu97PxYJh9tjKKmqzw58Jj+7AOKop0YI8wvrsgEZav
 BxUbMY495b1AkE7MISe/5KF7BvY8culeA11Ov6kKLaQ5aIO4D/16Aaa4jQXn7qiE3k+L
 Q99rT6HU/9nBmsrvnCGdc3dBHOh8/6/icOd2+c+3IK26NB7rb5V/ZT3JlkFf9gcN/bWm
 5TxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Q38ED6uBiOaMaUgrWEmCZ9B9V2cpD4kN6BpN+lMzLXk=;
 b=4WPNM11CliyK/FYLtj4vb1hbsH+zrp4BGmBwzXh2Z/hLCxyPq6dcwKVOuPU02Q2zG5
 dgB9tg4Vhjx11Y5Z+1BkUlGHK4ZGEU1qyb36IdnX0ue/nfkcHku2tNTYe8JVSluUE5cB
 2cb10zgWu9gN3yIqJCSAmWFXXVXEAE2Y99BYFyxsjf1HRisFM1K4tjplhNBZeT0hpgBi
 JyeFBQjMFZ7aB7m0xBcCYYn2ONWA7ZVOP1AfxxzPZp9MvxmAkvM4cWeat/K99Q26RuSn
 crgCogmChYbV1xQFEzxX6qbiNRvkZoO8UbnzAmDLEaIdO9C8JihE4kcJoAppUR8THfr0
 Rcog==
X-Gm-Message-State: ACgBeo1MGky7O5gVSj0Z56O0U+0E69PjsVmBYrJsgZoF2SPOV3/M9oFV
 scQ/QrII7mceWqG77PmXMvtwdl6RZkvnuAPGJCCw/Q==
X-Google-Smtp-Source: AA6agR7UmYM8FTCCj6s6j3uhhRBBzvkgb6w1fNuU5uKcLBNlNCJ1amd3Ebco/bFaxeb+R0RAMwNRUIP5uP8ztWOmaZ8=
X-Received: by 2002:a67:e456:0:b0:37c:13d5:c3b9 with SMTP id
 n22-20020a67e456000000b0037c13d5c3b9mr8423901vsm.82.1659981682863; Mon, 08
 Aug 2022 11:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_Y=ugD=Oh=fJhi=9GE73zpWnp0YC9dOoJazHg1PgXu=w@mail.gmail.com>
In-Reply-To: <CAFEAcA_Y=ugD=Oh=fJhi=9GE73zpWnp0YC9dOoJazHg1PgXu=w@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 8 Aug 2022 12:01:11 -0600
Message-ID: <CANCZdfpp1yqPXkR05aJJH-WcbvbcWgFBi6qvzKBph9ef05Hy8w@mail.gmail.com>
Subject: Re: how long do we need to retain gitlab CI job stdout logs?
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Daniel P. Berrange" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000008a8a4a05e5be9a64"
Received-SPF: none client-ip=2607:f8b0:4864:20::e36;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe36.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008a8a4a05e5be9a64
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 8, 2022, 11:49 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Hi; I just reduced QEMU's storage usage on gitlab by 130GB (no typo!)
> using https://gitlab.com/eskultety/gitlab_cleaner, which Dan helpfully
> pointed me at. This script removes old pipelines, which take up a
> lot of storage space for QEMU because they include the stdout logs
> for all the CI jobs in the pipeline. (Gitlab doesn't expire these,
> either by default or configurably -- you have to either manually delete
> the pipeline in the UI or else use the API, as this script does.)
>
> I somewhat conservatively only blew away pipelines from before the
> 1st January 2022. I feel like we don't really even need 6 months worth
> of CI job logs, though -- any views on whether we should be pruning
> them more aggressively ?
>

My finger in the air says "more than a month, less than a year."

It can often take a while to notice problems, especially non fatal ones. If
we had a one month retention we'd likely find we'd need older logs fairly
often. If we expire after a year, we'd never wish we hadn't. Nearly all
problems CI would be helpful to address are found in that time.

Usually, in other project, almost all issues like this are fixed within a
couple months (often much sooner). That suggests that 4-6 months likely is
the right balance with my personal bias to 6 months unless there is
significant financial or other savings from 4 months.

Warner

thanks
> -- PMM
>
>

--0000000000008a8a4a05e5be9a64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Aug 8, 2022, 11:49 AM Peter Maydell &lt;<a hre=
f=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Hi; I just reduced QEMU&#39;s st=
orage usage on gitlab by 130GB (no typo!)<br>
using <a href=3D"https://gitlab.com/eskultety/gitlab_cleaner" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://gitlab.com/eskultety/gitlab_clea=
ner</a>, which Dan helpfully<br>
pointed me at. This script removes old pipelines, which take up a<br>
lot of storage space for QEMU because they include the stdout logs<br>
for all the CI jobs in the pipeline. (Gitlab doesn&#39;t expire these,<br>
either by default or configurably -- you have to either manually delete<br>
the pipeline in the UI or else use the API, as this script does.)<br>
<br>
I somewhat conservatively only blew away pipelines from before the<br>
1st January 2022. I feel like we don&#39;t really even need 6 months worth<=
br>
of CI job logs, though -- any views on whether we should be pruning<br>
them more aggressively ?<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">My finger in the air says &quot;more than a month, =
less than a year.&quot;</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
It can often take a while to notice problems, especially non fatal ones. If=
 we had a one month retention we&#39;d likely find we&#39;d need older logs=
 fairly often. If we expire after a year, we&#39;d never wish we hadn&#39;t=
. Nearly all problems CI would be helpful to address are found in that time=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Usually, in other proj=
ect, almost all issues like this are fixed within a couple months (often mu=
ch sooner). That suggests that 4-6 months likely is the right balance with =
my personal bias to 6 months unless there is significant financial or other=
 savings from 4 months.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Warner=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--0000000000008a8a4a05e5be9a64--

