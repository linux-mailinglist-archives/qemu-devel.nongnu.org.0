Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D820B6A4D45
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:34:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWl8f-000866-8I; Mon, 27 Feb 2023 16:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pWl8d-00085X-4N
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:34:27 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pWl8b-0004Qv-CN
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:34:26 -0500
Received: by mail-ed1-x531.google.com with SMTP id i34so31561001eda.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tqrLY2WdS281sIf7D4uqNDQP8P4y/ZmDflR5bGXbqO0=;
 b=WcokwnAE9GJIJNojGOY4v3gwfIPqIBHExf+kRZXuI3jW4lSOvAFuug0WQn4dIw5Z+W
 p+MHywNTTatzbv60UpcJfz2R1H56tsyTNlXriZ1gOc02GmvUP7g71wcDfLITIN9IGq3v
 tSaxJLMuq/1uzv95NP6hxTyMe9zTyqdDWH0AHEWEb7t05Qeh3i6BhQvMnz/d0EFHbk00
 WNvfTkk8WNopmWfKx52FgPcApEOEEK/0koHgt5jw4rxy+AbUl0Jga5IA3Ds1NRCp96F9
 4t33KrcDPJ2w++acoFEXd1nxwdSk4LPOA0I0Qo5aap0shL05C94K6SgCOAQ+7sM6CDs3
 uChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tqrLY2WdS281sIf7D4uqNDQP8P4y/ZmDflR5bGXbqO0=;
 b=TjB/jQfsfOPahWqKHZY6gJZr1ibqAX8DwwBVHP6+RW22brXyhQmBLrSUktS1sphPgA
 zu5KQw/l2Z4pLH4osicgB4vPaajmEJJJmKpoRXNaHylXFawIXQ7jx4V5nzLUFEfrHGme
 NOE8IY718SHRjTAXBMJu7tX8dr1d3XlD+KinCsJZFoILWP183FZ+xyAmD5XlBZiFYLtn
 +74AnJ/tNY8434a/k5YZRZ9/DVlbmtUi4cqNXpK/O59sYUtmX7UBoUhUEghlTOFf3IIv
 1UNyhTlMyqxaBNWEt53edXnyViNji3r1zIoJECS4+e+91pdzRzgLqKgxTzVFJFgRQawZ
 gIGg==
X-Gm-Message-State: AO0yUKUt1BrHKj+eu4uL29VQcvRvyfSsiEcZXAfk9y8yUqa812S3FaxB
 VcifoXj/BwrDlJkDqpxZ4p2je9EHEi1J8snXbR8=
X-Google-Smtp-Source: AK7set9ItNw8x4e8qeq/WznsJbOy0Jk76FmiDO3mEBco80UHYIedA9YfZwmmDEvX/pKJWe2Q7MnjNbEph8vDuG0+v9M=
X-Received: by 2002:a50:ab58:0:b0:4ad:7943:f4b9 with SMTP id
 t24-20020a50ab58000000b004ad7943f4b9mr570034edc.2.1677533663629; Mon, 27 Feb
 2023 13:34:23 -0800 (PST)
MIME-Version: 1.0
References: <CAH50XRfsWih++5yoZSx-3L9mzf+vGPRz2Che=_6TAuATphvXbQ@mail.gmail.com>
 <874jr7juo5.fsf@linaro.org>
 <CAH50XRddEDTxJeCMXmbNg417vRojEuYpb8GzDrw75rt=OmF_uQ@mail.gmail.com>
In-Reply-To: <CAH50XRddEDTxJeCMXmbNg417vRojEuYpb8GzDrw75rt=OmF_uQ@mail.gmail.com>
From: Dinah B <dinahbaum123@gmail.com>
Date: Mon, 27 Feb 2023 16:34:12 -0500
Message-ID: <CAH50XRe5EJG_CecVjwNJDuMbO4D-dJC4e8wrkR2G0Rn0VFF+oQ@mail.gmail.com>
Subject: Re: Adopting abandoned patch?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001e9b9e05f5b53eea"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=dinahbaum123@gmail.com; helo=mail-ed1-x531.google.com
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

--0000000000001e9b9e05f5b53eea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It looks like the author didn't include a "Signed off" in their patch draft
and it doesn't look like Debian qemu-kvm maintainers ever merged it.
Does this change the patch adoption process?

Thanks,
-Dinah

On Mon, Feb 27, 2023 at 4:23=E2=80=AFPM Dinah B <dinahbaum123@gmail.com> wr=
ote:

> Thanks, here's the original patch:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?att=3D2;bug=3D621529;filena=
me=3Dmultiboot2.patch;msg=3D15
>
> On Mon, Feb 27, 2023 at 4:59=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@lin=
aro.org>
> wrote:
>
>>
>> Dinah B <dinahbaum123@gmail.com> writes:
>>
>> > Hi,
>> >
>> > I'm looking to get more involved in contributing to QEMU. I noticed
>> that there are some issues in the tracker
>> > where a sample patch has been contributed but never got merged, like a
>> proposal to add multiboot2 support:
>> > https://gitlab.com/qemu-project/qemu/-/issues/389
>>
>> I couldn't see a patch attached to the bug report. Is it elsewhere?
>>
>> >
>> > Is another dev allowed to "adopt" the patch as-is, with proper
>> attribution to the original dev and drive it to
>> > completion/merging (there are some features missing)? Or is "starting
>> from scratch" required for legal
>> > reasons?
>>
>> It's certainly possible to pick up a patch from someone else and take it
>> forward. Aside from addressing any review comments I think the minimum
>> requirement is the authors original Signed-off-by is intact which
>> asserts they could contribute code to the project.
>>
>> --
>> Alex Benn=C3=A9e
>> Virtualisation Tech Lead @ Linaro
>>
>

--0000000000001e9b9e05f5b53eea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It looks like the author didn&#39;t include a &quot;S=
igned off&quot; in their patch draft and it doesn&#39;t look like Debian qe=
mu-kvm maintainers ever merged it.</div><div>Does this change the patch ado=
ption process?<br></div><div><br></div><div>Thanks,</div><div>-Dinah<br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Feb 27, 2023 at 4:23=E2=80=AFPM Dinah B &lt;<a href=3D"mailto:di=
nahbaum123@gmail.com">dinahbaum123@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Thanks, here&#=
39;s the original patch: <a href=3D"https://bugs.debian.org/cgi-bin/bugrepo=
rt.cgi?att=3D2;bug=3D621529;filename=3Dmultiboot2.patch;msg=3D15" target=3D=
"_blank">https://bugs.debian.org/cgi-bin/bugreport.cgi?att=3D2;bug=3D621529=
;filename=3Dmultiboot2.patch;msg=3D15</a></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 27, 2023 at 4:59=E2=80=
=AFAM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=
=3D"_blank">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
Dinah B &lt;<a href=3D"mailto:dinahbaum123@gmail.com" target=3D"_blank">din=
ahbaum123@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; I&#39;m looking to get more involved in contributing to QEMU. I notice=
d that there are some issues in the tracker<br>
&gt; where a sample patch has been contributed but never got merged, like a=
 proposal to add multiboot2 support:<br>
&gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/389" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/issues/=
389</a><br>
<br>
I couldn&#39;t see a patch attached to the bug report. Is it elsewhere?<br>
<br>
&gt;<br>
&gt; Is another dev allowed to &quot;adopt&quot; the patch as-is, with prop=
er attribution to the original dev and drive it to<br>
&gt; completion/merging (there are some features missing)? Or is &quot;star=
ting from scratch&quot; required for legal<br>
&gt; reasons?<br>
<br>
It&#39;s certainly possible to pick up a patch from someone else and take i=
t<br>
forward. Aside from addressing any review comments I think the minimum<br>
requirement is the authors original Signed-off-by is intact which<br>
asserts they could contribute code to the project.<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
</blockquote></div>
</blockquote></div>

--0000000000001e9b9e05f5b53eea--

