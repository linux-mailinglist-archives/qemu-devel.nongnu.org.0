Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6AF688EA6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 05:48:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNnz0-0001UE-LD; Thu, 02 Feb 2023 23:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pNnyy-0001Tq-5t
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 23:47:28 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pNnyu-0005Kn-2z
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 23:47:27 -0500
Received: by mail-ej1-x62a.google.com with SMTP id dr8so12092848ejc.12
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 20:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zC6JgbHwJU00BijMeM+6zsDqEvFXIXQbUB69hwE5uB0=;
 b=5oER1JtjMtP18BAo2XlPXzSPRVcefdExr8+yStI6er9hlJtXGXYwHdhfSDZl3QXcRk
 e/c58YzTTDc5RdR2AZ4t02p8verf98sOa+zi+HGtGWeQkmYFwBdv6/zvXLBq3o890OTv
 rxZ7gQVsJmJyIVBxwXWwF81fETc8s6v1RBjbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zC6JgbHwJU00BijMeM+6zsDqEvFXIXQbUB69hwE5uB0=;
 b=3X1SrQBX74LwTuYa85/VzYg15PeU0DOocVjaxD0Y6S0jRYE5/JWiuZGOxoAmEuQWgS
 zYz/YRRL9YiWCiAHILqgTcEwkjaWecSs9J+Cz9nqeiOzMbmLo8SJHhjJPUiYDWhaE0WW
 sSLbtNpJZs2MpA0GEyxTX2N2lGMInIbZz+mngq2R3nMb6nBe/bthfv0wBPLIujTjAJH9
 LqWbb7qdJEx2qT25K7Ye0DizLtY3QY1k+HVhq05iGBsf00Wqjrc8yFBlaNKg5eJKgynu
 cEtSxNfM89fOatrnpnXmQCt23TX5U1lX/UYdS2bWkGj75OcQKnwRbG55cLYtUVlcb1xQ
 9rPg==
X-Gm-Message-State: AO0yUKUQjeGLss1Kq5TcHvzdCj1WA1ctWVvrlejcecHeXUjo6sZhzZzR
 Iszc4/63SNtlbe3A84ekNlR3p1gV+gQXSS6N+gBQbQ==
X-Google-Smtp-Source: AK7set/dSskKKI0s2cvkTvdCFbnykn6NEvoW0xPoYcuANnsGCHWHhb9RvwqlkFbzZmEw9qiUsfCTTg/7j7r/Leo0BR4=
X-Received: by 2002:a17:907:a055:b0:883:ba3b:ebb8 with SMTP id
 gz21-20020a170907a05500b00883ba3bebb8mr2278056ejc.308.1675399634889; Thu, 02
 Feb 2023 20:47:14 -0800 (PST)
MIME-Version: 1.0
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
 <875yckr2sf.fsf@pond.sub.org>
In-Reply-To: <875yckr2sf.fsf@pond.sub.org>
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Date: Fri, 3 Feb 2023 09:47:03 +0500
Message-ID: <CAMcjF3CAdyLCAoO5KgErdfN=0VZqAoJA+J_ZDLZ+zR3qd6JsSg@mail.gmail.com>
Subject: Re: [PATCH 1/9] Updated the FSF address in file hw/sh4/sh7750_regs.h
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, ysato@users.sourceforge.jp, 
 alex.bennee@linaro.org, pbonzini@redhat.com, fam@euphon.net, 
 peter.maydell@linaro.org, philmd@linaro.org, kwolf@redhat.com, 
 hreitz@redhat.com
Content-Type: multipart/alternative; boundary="0000000000001841a505f3c460c8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-ej1-x62a.google.com
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

--0000000000001841a505f3c460c8
Content-Type: text/plain; charset="UTF-8"

Thank you so much. I will get back to you after looking into this and
resend the email. This is great help. :)

On Thu, Feb 2, 2023, 11:37 AM Markus Armbruster <armbru@redhat.com> wrote:

> I guess this is your attempt to implement my suggestion to squash your
> series into one patch.  It came out as a concatenation of patches in a
> single e-mail.  That's not what we mean by "squashing patches" :)
>
> The common tool for squashing patches is git-rebase.  Say your series is
> on branch "work", which is based on master.  Then
>
>     $ git-rebase -i master work
>
> If master has advanced since you based branch work on it, this will
> advance your branch to be based on current master.  Hence "rebase".
>
> The -i lets you edit the list of commits to be rebased.  It'll show
> instruction right in the editor.  Relevant lines:
>
>     # c        pick <commit> = use commit
>     [...]
>     # s        squash <commit> = use commit, but meld into previous commit
>     # f        fixup [-C | -c] <commit> = like "squash" but keep only the
> previous
>     #                    commit's log message, unless -C is used, in which
> case
>     #                    keep only this commit's message; -c is same as -C
> but
>     #                    opens the editor
>
> If you keep the first (top-most) commit as "pick", and change the
> remainder to "fixup", the patches become one, using the first patch's
> commit message.
>
> You'll then have to reword that commit message.  Since you're already
> editing a rebase sequence, you may want to do that by changing "pick" to
> "reword".
>
> Hope this helps.
>
>

--0000000000001841a505f3c460c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you so much. I will get back to you after looking i=
nto this and resend the email. This is great help. :)</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 2, 2023,=
 11:37 AM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">armbru@redhat.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">I guess this is your attempt to implement my s=
uggestion to squash your<br>
series into one patch.=C2=A0 It came out as a concatenation of patches in a=
<br>
single e-mail.=C2=A0 That&#39;s not what we mean by &quot;squashing patches=
&quot; :)<br>
<br>
The common tool for squashing patches is git-rebase.=C2=A0 Say your series =
is<br>
on branch &quot;work&quot;, which is based on master.=C2=A0 Then<br>
<br>
=C2=A0 =C2=A0 $ git-rebase -i master work<br>
<br>
If master has advanced since you based branch work on it, this will<br>
advance your branch to be based on current master.=C2=A0 Hence &quot;rebase=
&quot;.<br>
<br>
The -i lets you edit the list of commits to be rebased.=C2=A0 It&#39;ll sho=
w<br>
instruction right in the editor.=C2=A0 Relevant lines:<br>
<br>
=C2=A0 =C2=A0 # c=C2=A0 =C2=A0 =C2=A0 =C2=A0 pick &lt;commit&gt; =3D use co=
mmit<br>
=C2=A0 =C2=A0 [...]<br>
=C2=A0 =C2=A0 # s=C2=A0 =C2=A0 =C2=A0 =C2=A0 squash &lt;commit&gt; =3D use =
commit, but meld into previous commit<br>
=C2=A0 =C2=A0 # f=C2=A0 =C2=A0 =C2=A0 =C2=A0 fixup [-C | -c] &lt;commit&gt;=
 =3D like &quot;squash&quot; but keep only the previous<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 commit&#39;s log message, unless -C is used, in which case<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 keep only this commit&#39;s message; -c is same as -C but<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 opens the editor<br>
<br>
If you keep the first (top-most) commit as &quot;pick&quot;, and change the=
<br>
remainder to &quot;fixup&quot;, the patches become one, using the first pat=
ch&#39;s<br>
commit message.<br>
<br>
You&#39;ll then have to reword that commit message.=C2=A0 Since you&#39;re =
already<br>
editing a rebase sequence, you may want to do that by changing &quot;pick&q=
uot; to<br>
&quot;reword&quot;.<br>
<br>
Hope this helps.<br>
<br>
</blockquote></div>

--0000000000001841a505f3c460c8--

