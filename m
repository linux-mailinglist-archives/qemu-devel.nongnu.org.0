Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0683330FC29
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:04:16 +0100 (CET)
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jvL-0000QX-2l
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l7jKu-0001tE-1r
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:26:36 -0500
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:38879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l7jKs-0000v7-2d
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:26:35 -0500
Received: by mail-ua1-x935.google.com with SMTP id g13so1266803uaw.5
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 10:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=roSxhYBaaaHZd3eGT9/mpbiKarQ/sDcHGSrdtebxqq0=;
 b=INJIX26MO36eC/w7n0/YluN0TS70zlz3H7W0wra0W57YqQd1mjT1qJKXbvog1HZGnA
 2HiysISIYsKiGYXud+REazKZilSQ6aIVXibkIZLZIQPGN/ZvzF1nQ5zNUsGMArjyw9jL
 8vYITKVbX7o/7inRyIqPCx1/4kePW95pj8/KfwW5n3cM0SXgOgjNxX0B2TMqh5SLtzya
 SOfLT5zw/hL/ThdfPaTwfDJvtJr6DbShNwxPHIbKFtcZeyKNI4w1R8Gtpz6+jw/1ksMW
 eAFw/kxaYUKed5NoPE95NEyNUMY4i7x5Tazjv0rKUgvzcMO/1po1Z4jFcnzPYIUPBr2c
 wLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=roSxhYBaaaHZd3eGT9/mpbiKarQ/sDcHGSrdtebxqq0=;
 b=MsFg5VtWWCkU0sSjLiE8hdUNFLBNBJMKbn3XWap2ygGNJrvMULOTHr4X3g3XReG3uO
 s6U+F3cN2GnGHTttPEWVbCj6m30mMuxzoeKzi8mtp4YL9z4fP/DOuDu4+i4R92LyVekU
 lk2rAKaxKGHfV5bIkfyYcRxR0K95TF3CrV9ea2dh4em0aConUj3Ayq7tIpT9udNt8/hn
 oOLzX0NipawbIBYuUcdpJoSUadxzZ7+P/dN6t4qK4OtyyzxJdivctpaFF9qQ1nEj5Xvl
 gcgvuEFJkp0/fAp0FsjhjFKD387pAMhxeLpNNURxCmN+DK9PwbBpeBUhErd1wcqyJBqs
 AjyQ==
X-Gm-Message-State: AOAM530j/WdEq8KCpOBp9ISJ5Ssvnj5UgTrRQZSB0ysampsdecuVWJRo
 aCB0VADgdqKj/V+YZXWhY6cQji8ak9tpuokYX4qb1A==
X-Google-Smtp-Source: ABdhPJz2e+Sklrlv190sey1fNXhzt0jLNpKXG1PU8K9TStSNmr3QQvWe1zqCVSki4Sh4QnoVCy2/wZA/g5lbfjySovU=
X-Received: by 2002:ab0:760b:: with SMTP id o11mr490018uap.91.1612463192750;
 Thu, 04 Feb 2021 10:26:32 -0800 (PST)
MIME-Version: 1.0
References: <20210203233539.1990032-1-dje@google.com>
 <20210204100349.GF549438@redhat.com>
In-Reply-To: <20210204100349.GF549438@redhat.com>
From: Doug Evans <dje@google.com>
Date: Thu, 4 Feb 2021 10:25:56 -0800
Message-ID: <CADPb22THtnaRgz3MAa+=U+dgZeZR4+FDO_SvpfsqKbnSJRnOmA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3]
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="000000000000d1e32f05ba86d7d8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=dje@google.com; helo=mail-ua1-x935.google.com
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

--000000000000d1e32f05ba86d7d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 4, 2021 at 2:03 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Wed, Feb 03, 2021 at 03:35:36PM -0800, dje--- via wrote:
> > Add support for ipv6 host forwarding
> >
> > This patchset takes the original patch from Maxim,
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
> > and updates it.
> >
> > New option: -ipv6-hostfwd
> >
> > New commands: ipv6_hostfwd_add, ipv6_hostfwd_remove
> >
> > These are the ipv6 equivalents of their ipv4 counterparts.
>
> Before I noticed this v3, I send a reply to your v2 sugesting
> that we don't need to add any new commands/options. We can
> use existing inet_parse() helper function to parse the address
> info and transparently support IPv4/6 in the existing commands
> and options. This matches normal practice elsewhere in QEMU
> for IP dual stack.
>

I'm all for this, fwiw.

--000000000000d1e32f05ba86d7d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Thu, Feb 4, 2021 at 2:03 AM Daniel P. Berrang=C3=A9 &lt;<a=
 href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br>=
</div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Wed, Feb 03, 2021 at 03:35:36PM -0800, dje--- via wrote:<b=
r>
&gt; Add support for ipv6 host forwarding<br>
&gt; <br>
&gt; This patchset takes the original patch from Maxim,<br>
&gt; <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg56957=
3.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/q=
emu-devel@nongnu.org/msg569573.html</a><br>
&gt; and updates it.<br>
&gt; <br>
&gt; New option: -ipv6-hostfwd<br>
&gt; <br>
&gt; New commands: ipv6_hostfwd_add, ipv6_hostfwd_remove<br>
&gt; <br>
&gt; These are the ipv6 equivalents of their ipv4 counterparts.<br>
<br>
Before I noticed this v3, I send a reply to your v2 sugesting<br>
that we don&#39;t need to add any new commands/options. We can<br>
use existing inet_parse() helper function to parse the address<br>
info and transparently support IPv4/6 in the existing commands<br>
and options. This matches normal practice elsewhere in QEMU<br>
for IP dual stack.<br></blockquote><div><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">I&#39;m all for this, fwiw.</div></div></div>

--000000000000d1e32f05ba86d7d8--

