Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04C630F91F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:09:48 +0100 (CET)
Received: from localhost ([::1]:51414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7i8Z-0002Lq-K7
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l7hhG-0002er-MD
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:41:34 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:35528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l7hhE-0005L9-RM
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:41:34 -0500
Received: by mail-vs1-xe29.google.com with SMTP id m13so2093719vsr.2
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 08:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SbYb75lV+1ZDNBqwij9Q6/BjDGCkbRuiq3/xLqBhgp0=;
 b=cetnX3ChEhg9qx0MaOx7P99wEu4AKUkrxrq46WLtYrGWaMaZqyocMp/Yti2I1Uzug8
 4v7OhnzXuProNXnsKSQ4yLcTLMH0xmq5Sv0TRCJ7wDxrckEoWShZ+oMmkCdye/8pBJsL
 SHlSEmwDiIYjB9BIaV0RarW8dqgbfTvGf/LL+VfGAV5cPXC9GKP2DKg/8buRGtLaJaZh
 CCArd/zV3IoVxTy3KXOhXzn2zUxaylkNfuywlaJQCqCU9n3jJQCEmwtgrfGAVDFhNatP
 u+0J/0mbaKOykRVU7DahQ3gCpT7DLYUD/lBhk+xZmezJvyjMIxEIQDb2LQh0F4mhwv5a
 076A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SbYb75lV+1ZDNBqwij9Q6/BjDGCkbRuiq3/xLqBhgp0=;
 b=CmkTJXBs0Gs1TJ6fP98AI0OpXLJfQah+ylT/qLZMR0joFvuRQy3GnWWnAm6IMK37UI
 W0VaOLzCFZvZ+de0TPsPP+DewGvxQMfFAdhaLK0+4vasfISPrXGtJA71nvMc+c/EWGvR
 lsLqa6MOj+heJtSqIEvnvk0PZ2icTqfp43rwvZEY8VyJv+RLLiAJlixLXYPFFaXe2rLy
 br1GN9HkIDsOXJMyckCp4efPV9aqO+ap8pogq6gI/hGYVG9kwX3VoYkRGdPpZ++WPXfh
 3/AVDjKBQnreRnZaSbDLN/1F2lP7e5H2ZlGJBrqIo1jGkANBfrkgFNCicja56J8gQETt
 tzOg==
X-Gm-Message-State: AOAM530cSrfS7EDB8/fzlDn9tDFY3Pk4KOOOrHaJoDXOits20EBpLDd8
 UCcjZDPBWemTAMZFhxDO59/Es31tNlFXnI19jByUKA==
X-Google-Smtp-Source: ABdhPJwyYjf4UFj3BtEa7LHo97dJ9ZjhvTWcx8nvwzb1LArtZ32Bm7hQPskQXQDYfYLNX9U165H/7WQiAul+0V6gxgE=
X-Received: by 2002:a67:310e:: with SMTP id x14mr449735vsx.46.1612456889982;
 Thu, 04 Feb 2021 08:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20210203233539.1990032-1-dje@google.com>
 <20210203233539.1990032-2-dje@google.com>
 <93a6cf6b-bb53-7b05-20a7-f2976c093f0e@redhat.com>
In-Reply-To: <93a6cf6b-bb53-7b05-20a7-f2976c093f0e@redhat.com>
From: Doug Evans <dje@google.com>
Date: Thu, 4 Feb 2021 08:40:47 -0800
Message-ID: <CADPb22S_AfBADYsj2T=Cb6G_Mk1=aHxid0VsWe+EeZwXcnJZnw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] slirp: Placeholder for libslirp ipv6 hostfwd
 support
To: Eric Blake <eblake@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="00000000000025131305ba8560cf"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=dje@google.com; helo=mail-vs1-xe29.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000025131305ba8560cf
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 8:02 AM Eric Blake <eblake@redhat.com> wrote:

> On 2/3/21 5:35 PM, dje--- via wrote:
> > This commit is intended to only contain the slirp submodule change
> > that adds ipv6 hostfwd support.
>
>
> Missing your signed-off-by, and as written, your authorship would be
> based on the From: dje--- via <qemu-devel@nongnu.org> header (that looks
> like our mailing list rewrote things due to SPF policies, but that it
> botched your name in the process), rather than your Reply-to: Doug Evans
> <dje@google.com> header.  To fix the latter, you can convince git to
> include a From: line in the first line of the body that will override
> whatever is in the headers even after mailing list rewrites.
>
> > ---
> >  slirp | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/slirp b/slirp
> > index 8f43a99191..358c0827d4 160000
> > --- a/slirp
> > +++ b/slirp
> > @@ -1 +1 @@
> > -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> > +Subproject commit 358c0827d49778f016312bfb4167fe639900681f
> >


Samuel, how do merges from the libslirp tree into the qemu tree work?
I wasn't expecting there was anything more I would do, but please correct
me if I'm wrong.

Therefore, what this patch (1/3) is is just a placeholder to solve the
problem of removing the "subproject comment" out of the other patches.
The signed-off-by line is intentionally missing.

--00000000000025131305ba8560cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Thu, Feb 4, 2021 at 8:02 AM Eric Blake &lt;<a href=3D"mail=
to:eblake@redhat.com">eblake@redhat.com</a>&gt; wrote:<br></div></div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
2/3/21 5:35 PM, dje--- via wrote:<br>
&gt; This commit is intended to only contain the slirp submodule change<br>
&gt; that adds ipv6 hostfwd support.<br>
<br>
<br>
Missing your signed-off-by, and as written, your authorship would be<br>
based on the From: dje--- via &lt;<a href=3D"mailto:qemu-devel@nongnu.org" =
target=3D"_blank">qemu-devel@nongnu.org</a>&gt; header (that looks<br>
like our mailing list rewrote things due to SPF policies, but that it<br>
botched your name in the process), rather than your Reply-to: Doug Evans<br=
>
&lt;<a href=3D"mailto:dje@google.com" target=3D"_blank">dje@google.com</a>&=
gt; header.=C2=A0 To fix the latter, you can convince git to<br>
include a From: line in the first line of the body that will override<br>
whatever is in the headers even after mailing list rewrites.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 slirp | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/slirp b/slirp<br>
&gt; index 8f43a99191..358c0827d4 160000<br>
&gt; --- a/slirp<br>
&gt; +++ b/slirp<br>
&gt; @@ -1 +1 @@<br>
&gt; -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece<br>
&gt; +Subproject commit 358c0827d49778f016312bfb4167fe639900681f<br>
&gt;</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Samuel, how do merges from the libslirp tree into the qemu=
 tree work?</div><div class=3D"gmail_default" style=3D"font-size:small">I w=
asn&#39;t expecting there was anything more I would do, but please correct =
me if I&#39;m wrong.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Ther=
efore, what this patch (1/3) is is just a placeholder to solve the problem =
of removing the &quot;subproject comment&quot; out of the other patches.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">The signed-off-by=
 line is intentionally missing.</div><br></div></div></div>

--00000000000025131305ba8560cf--

