Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E6C42D77A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 12:51:41 +0200 (CEST)
Received: from localhost ([::1]:53684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mayKq-0000Cj-AL
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 06:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1mayIP-0007BC-NL
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 06:49:09 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:46630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1mayIN-0007Mg-Ft
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 06:49:09 -0400
Received: by mail-ua1-x931.google.com with SMTP id u5so10274720uao.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 03:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ov25GcwH6B0udxIb9V07AO36RmWbyjEBmJGBco99uIM=;
 b=QB0JjJ58lzmpZk0hrX0A2eNhj0v6PvBGuJQbMHpyiKiseX7jXiWUartMWmF5Ut1YkK
 k9DD8EaS1j45N8Gl6uf3oDQUL0y5ETtIQgdKOJD4R8lJNW5pHjalZtGm3zo3EMzTQ1u5
 37lCQa63pL1qy3DmYjrc8/HUXIs010/Ffyyz0T2Lr2hUR8/P8Uf6UGna7aE73jmiq3Dq
 ZAueuMiGfcJVhrIjG7wFjYATKO46waDaGUqFxsrkB4TajClSlMvD93oxz45uMT3SZDAV
 FQoqYNIpO7tipDIJXE0CNnc5v1Uca6Fu5G91udM0HqMKJ5cmOZxNgzbJ/L1tEP1saORR
 xF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ov25GcwH6B0udxIb9V07AO36RmWbyjEBmJGBco99uIM=;
 b=m7ZCf0bI2q9KGqZZP9jen+stlKelKPxtmiahDyfCOnacyJ9FI2xx5jN+zh8G5IHhXx
 4TT0jtmjgNllKkI5RduuS80V00dRRqLo6I3T8OmiWXAKMs+66DmYUVmJgzEO0+2iJJyo
 wRQjZtv4iTo3iBAhi7QXpp91JRTB7uCEZh9Fz1EcOSSIPhbYpsiCyCj7qgIc40a+CIwr
 yXSFdfHBahq2cTpsLsOPCtf58T7YmcoWrgyPOsMFdFHvhbK89IVZDwjN6Q01HCUj7LRB
 jRBy3LC4KhQEEGCYmspj8bo9JUwxpG+8/7AhTD4XOW0HznNjspKecrvaGDbPa7x7GQ0r
 OwTg==
X-Gm-Message-State: AOAM531j4IZlMPSZMRK0HQYD4rAwZnLOS77BHkAZWPu+JzpQJ45sXCFu
 TCO5/UXONx+0IFLkO+fBoPTXhBAhceysNYgkHuDSPZKOPeE=
X-Google-Smtp-Source: ABdhPJxpAxHEZugHMs2/j9c2uK9hHp2LMGiC+nuH/iRuvLrtBxcFkgU9SuuzT+WXAjqVtdEwXS4AdV4Q02VOrOf7bPE=
X-Received: by 2002:ab0:7688:: with SMTP id v8mr5209693uaq.77.1634208546461;
 Thu, 14 Oct 2021 03:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211013230405.32170-1-wwcohen@gmail.com>
 <20211014090359.0c0f7b4f@bahia.huguette>
In-Reply-To: <20211014090359.0c0f7b4f@bahia.huguette>
From: Will Cohen <wwcohen@gmail.com>
Date: Thu, 14 Oct 2021 06:48:55 -0400
Message-ID: <CAB26zV1pHqEChqUd6UXMhGyhZbtHOo3DM=v_S0Vc3496xF4byg@mail.gmail.com>
Subject: Re: [PATCH 00/11] 9p: Add support for Darwin
To: Greg Kurz <groug@kaod.org>
Content-Type: multipart/alternative; boundary="000000000000e6994c05ce4dd315"
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=wwcohen@gmail.com; helo=mail-ua1-x931.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e6994c05ce4dd315
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Many thanks for all the clarifications =E2=80=94 it=E2=80=99s my first time=
 using
git-send-email and first time with mailing-list-based devel workflows. Will
adjust accordingly, work through gitlab, and eventually resend via
git-publish as v2.

On Thu, Oct 14, 2021 at 3:04 AM Greg Kurz <groug@kaod.org> wrote:

> Hi Will,
>
> It is strongly recommended that you Cc maintainers to increase the odds
> they notice your patches in the flood of qemu-devel. FYI I only noticed
> them because git-send-email Cc'd me thanks to the Reviewed-by: tags and
> my address didn't change in the meantime. I'm thus Cc'ing Christian
> who is the primary maintainer now (i.e. the person that can merge
> your patches and send a PR for upstream inclusion).
>
> FWIW git-publish [1] can Cc the relevant people for free.
>
> [1] https://github.com/stefanha/git-publish
>
> On Wed, 13 Oct 2021 19:03:54 -0400
> Will Cohen <wwcohen@gmail.com> wrote:
>
> > This is a continuation of a patch series adding 9p server support for
> Darwin,
> > originally submitted by Keno Fischer in mid-2018
> > (https://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg04643.html=
).
> In
> > some sense, this could be considered [PATCH v4] of that process, but I
> assume
> > that the multi-year gap merits a fresh start..
> >
>
> This makes sense. For consistency with that assumption, it would also
> make sense to clear all preexisting Reviewed-by: tags.
>
> > It has since been updated and rebased for NixOS by Michael Roitzsch
> > (https://github.com/NixOS/nixpkgs/pull/122420) with a goal of
> resubmitting
> > upstream. I am submitting his patch set as suggested, as developed by
> Michael,
> > with his Signed-off-by headers included in full.
> >
>
> QEMU cares about tracking of who did what and follows a policy inspired
> from the linux kernel [2] [3].
>
> Michael's Signed-off-by: should then appear on all patches, with a
> mention of the extra changes that he made, e.g.
>
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> [Michael Roitzsch: - rebased for NixOS
>                    - some other change]
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
>
> If no changes were made, you still need to add a Signed-off-by: tag.
>
> [2] https://wiki.qemu.org/Contribute/SubmitAPatch
> [3]
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Docum=
entation/SubmittingPatches?id=3Df6f94e2ab1b33f0082ac22d71f66385a60d8157f#n2=
97
>
> > Additionally, I have run the patches through checkpatch.pl and adjusted
> coding
> > style accordingly (with the exception of ignoring warnings about avoid
>
> Good ! If you have an account on gitlab, you can also push a branch there=
.
> It will be submitted to gitlab CI and maybe give you the opportunity to
> polish the patches some more before submission.
>
> > architecture specific defines in hw/9pfs/9p-util-darwin.c, where they
> seem
> > unavoidable), and have signed off on those modified commits.
> >
>
> As explained above, your Signed-off-by: is also needed in all patches,
> even if you didn't change them.
>
> Cheers,
>
> --
> Greg
>
> >
> >
>
>

--000000000000e6994c05ce4dd315
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Many thanks for all the clarifications =E2=80=94 it=E2=80=
=99s my first time using git-send-email and first time with mailing-list-ba=
sed devel workflows. Will adjust accordingly, work through gitlab, and even=
tually resend via git-publish as v2.</div><div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 3:04 AM Gr=
eg Kurz &lt;<a href=3D"mailto:groug@kaod.org">groug@kaod.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)">Hi Will,<br>
<br>
It is strongly recommended that you Cc maintainers to increase the odds<br>
they notice your patches in the flood of qemu-devel. FYI I only noticed<br>
them because git-send-email Cc&#39;d me thanks to the Reviewed-by: tags and=
<br>
my address didn&#39;t change in the meantime. I&#39;m thus Cc&#39;ing Chris=
tian<br>
who is the primary maintainer now (i.e. the person that can merge<br>
your patches and send a PR for upstream inclusion).<br>
<br>
FWIW git-publish [1] can Cc the relevant people for free.<br>
<br>
[1] <a href=3D"https://github.com/stefanha/git-publish" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/stefanha/git-publish</a><br>
<br>
On Wed, 13 Oct 2021 19:03:54 -0400<br>
Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" target=3D"_blank">wwcoh=
en@gmail.com</a>&gt; wrote:<br>
<br>
&gt; This is a continuation of a patch series adding 9p server support for =
Darwin,<br>
&gt; originally submitted by Keno Fischer in mid-2018<br>
&gt; (<a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2018-06/m=
sg04643.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org=
/archive/html/qemu-devel/2018-06/msg04643.html</a>). In<br>
&gt; some sense, this could be considered [PATCH v4] of that process, but I=
 assume<br>
&gt; that the multi-year gap merits a fresh start..<br>
&gt; <br>
<br>
This makes sense. For consistency with that assumption, it would also<br>
make sense to clear all preexisting Reviewed-by: tags.<br>
<br>
&gt; It has since been updated and rebased for NixOS by Michael Roitzsch<br=
>
&gt; (<a href=3D"https://github.com/NixOS/nixpkgs/pull/122420" rel=3D"noref=
errer" target=3D"_blank">https://github.com/NixOS/nixpkgs/pull/122420</a>) =
with a goal of resubmitting<br>
&gt; upstream. I am submitting his patch set as suggested, as developed by =
Michael,<br>
&gt; with his Signed-off-by headers included in full.<br>
&gt; <br>
<br>
QEMU cares about tracking of who did what and follows a policy inspired<br>
from the linux kernel [2] [3].<br>
<br>
Michael&#39;s Signed-off-by: should then appear on all patches, with a<br>
mention of the extra changes that he made, e.g.<br>
<br>
Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" =
target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
[Michael Roitzsch: - rebased for NixOS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- some=
 other change]<br>
Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@icloud=
.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br>
<br>
If no changes were made, you still need to add a Signed-off-by: tag.<br>
<br>
[2] <a href=3D"https://wiki.qemu.org/Contribute/SubmitAPatch" rel=3D"norefe=
rrer" target=3D"_blank">https://wiki.qemu.org/Contribute/SubmitAPatch</a><b=
r>
[3] <a href=3D"http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.g=
it/tree/Documentation/SubmittingPatches?id=3Df6f94e2ab1b33f0082ac22d71f6638=
5a60d8157f#n297" rel=3D"noreferrer" target=3D"_blank">http://git.kernel.org=
/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatc=
hes?id=3Df6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297</a><br>
<br>
&gt; Additionally, I have run the patches through <a href=3D"http://checkpa=
tch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> and adjusted=
 coding<br>
&gt; style accordingly (with the exception of ignoring warnings about avoid=
<br>
<br>
Good ! If you have an account on gitlab, you can also push a branch there.<=
br>
It will be submitted to gitlab CI and maybe give you the opportunity to<br>
polish the patches some more before submission.<br>
<br>
&gt; architecture specific defines in hw/9pfs/9p-util-darwin.c, where they =
seem<br>
&gt; unavoidable), and have signed off on those modified commits.<br>
&gt; <br>
<br>
As explained above, your Signed-off-by: is also needed in all patches,<br>
even if you didn&#39;t change them.<br>
<br>
Cheers,<br>
<br>
--<br>
Greg<br>
<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000e6994c05ce4dd315--

