Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1642D8163
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 22:58:49 +0100 (CET)
Received: from localhost ([::1]:33720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knqR5-0007zK-MP
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 16:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1knqOe-000749-Qx
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 16:56:16 -0500
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942]:38297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1knqOc-00035r-E3
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 16:56:16 -0500
Received: by mail-ua1-x942.google.com with SMTP id y26so3353106uan.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 13:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=coyXN2x4BlNVsfzvsFcVwdCBVk9lEyEa87g+7NNNuO8=;
 b=jZfnrgAwBgQf2VdVNzh45isjfnI9CjHXpvSDZDNbBYo47mtk+kpmhCaNyOxsZByV7e
 R+7Pab36SFzq2iPSSyRRw/U+FJQegzepd7Lm2urakOragmiKbpW+SI8BqcUFos+WCQjz
 Mk1er1f3SqJqI11XcwPZYviJuuFneTr4nUhA7RmXB7h1Pc/sqB4hcasqIXw2N0yxP849
 3gsR8IapLm0XdprZj3KjBpZRrebfFBulqWau5GvQMJMyqO0ySAqceWPN6+sDZB/Y8IBz
 5j4R96yGRc/uANeYYJRpJFvuJeSBkT6gFrO2p+8HwtfB04lehtSB57A7wzcfFn0oVgq9
 1GDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=coyXN2x4BlNVsfzvsFcVwdCBVk9lEyEa87g+7NNNuO8=;
 b=I3Vw8LTRzJ5aGDc4euW04prduj9xIz7p41AhaBNn6eQMTD3LIT4oD1WaWh0o1TBWgB
 Zi2JFhiFfVk/9KJn5WSGjLe6CA33k+HdOHSL7Im4mQ57E1WoKOr7QQaMDmtyxoCB5cvy
 Hp3UIKOsmfB6wqPKUh8mKHnT0Ba3oAKaWe36mE7HOQLVYCjvSWq2xxHIbq9VoKyS3Fz3
 9HHeaNMIgA310v9/cDHymsY8O+HM2kpgSPuF2xQquey7Mqp0/J1DaftI862OU8tEe8VN
 djkHTkEV7rwZ+P9vyF7TaVhYzI8Reo2HdAJ/XoxZ4jUkex6gyAgMUJMkaQ3DTOyZu/yT
 FTTA==
X-Gm-Message-State: AOAM531BhoTrweutbrRycvVCx1qP97adP/JHUNdRvN2gUD7Lkhbncii7
 JL0rLNzjHiFhem1WFytsF4lmKAII1tjGf60F3CPcwA==
X-Google-Smtp-Source: ABdhPJwnI2WoloB+2i9HQS75rt44gPDQFIg1lya0+9VRh/3HxZRROu5Gi82xreChxOmktjwXoW0EcOMw+6VsUhQk/cg=
X-Received: by 2002:a9f:2e0d:: with SMTP id t13mr14988685uaj.41.1607723767682; 
 Fri, 11 Dec 2020 13:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20201125215245.3514695-1-dje@google.com>
 <20201210112540.GE416119@stefanha-x1.localdomain>
In-Reply-To: <20201210112540.GE416119@stefanha-x1.localdomain>
From: Doug Evans <dje@google.com>
Date: Fri, 11 Dec 2020 13:55:31 -0800
Message-ID: <CADPb22SACmhu1h=aNC=C5Dmi738DhV_BVPq-LOVRnS0GjKKaSA@mail.gmail.com>
Subject: Re: [PATCH 1/1] trace: Send "-d trace:help" output to stdout
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001235f505b6375c04"
Received-SPF: pass client-ip=2607:f8b0:4864:20::942;
 envelope-from=dje@google.com; helo=mail-ua1-x942.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--0000000000001235f505b6375c04
Content-Type: text/plain; charset="UTF-8"

Thanks.
I gather this is a first step in getting the patch into master?
If so, OOC, how many separate "staging" trees are there for the master
branch? (is there a list?)

On Thu, Dec 10, 2020 at 3:25 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Wed, Nov 25, 2020 at 01:52:45PM -0800, Doug Evans wrote:
> > ... for consistency with "-d help".
> >
> > Signed-off-by: Doug Evans <dje@google.com>
> > ---
> >  trace/control.c | 12 ++++++------
> >  trace/control.h |  3 ++-
> >  2 files changed, 8 insertions(+), 7 deletions(-)
>
> Thanks, applied to my tracing tree:
> https://gitlab.com/stefanha/qemu/commits/tracing
>
> Stefan
>

--0000000000001235f505b6375c04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Tha=
nks.</div><div class=3D"gmail_default" style=3D"font-size:small">I gather t=
his is a first step in getting the patch into master?</div><div class=3D"gm=
ail_default" style=3D"font-size:small">If so, OOC, how many separate &quot;=
staging&quot; trees are there for the master branch? (is there a list?)</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Dec 10, 2020 at 3:25 AM Stefan Hajnoczi &lt;<a href=3D"mailto:ste=
fanha@redhat.com">stefanha@redhat.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Wed, Nov 25, 2020 at 01:52:45PM -08=
00, Doug Evans wrote:<br>
&gt; ... for consistency with &quot;-d help&quot;.<br>
&gt; <br>
&gt; Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=
=3D"_blank">dje@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 trace/control.c | 12 ++++++------<br>
&gt;=C2=A0 trace/control.h |=C2=A0 3 ++-<br>
&gt;=C2=A0 2 files changed, 8 insertions(+), 7 deletions(-)<br>
<br>
Thanks, applied to my tracing tree:<br>
<a href=3D"https://gitlab.com/stefanha/qemu/commits/tracing" rel=3D"norefer=
rer" target=3D"_blank">https://gitlab.com/stefanha/qemu/commits/tracing</a>=
<br>
<br>
Stefan<br>
</blockquote></div>

--0000000000001235f505b6375c04--

