Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC7B494381
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 00:08:19 +0100 (CET)
Received: from localhost ([::1]:34706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAK3r-00062P-Ro
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 18:08:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1nAK0n-0004a4-NS
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 18:05:05 -0500
Received: from [2607:f8b0:4864:20::22a] (port=36392
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1nAK0l-0006Wu-LY
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 18:05:05 -0500
Received: by mail-oi1-x22a.google.com with SMTP id r138so6761217oie.3
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 15:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A2KC0ZvqYQILAacx7KrT4trqGgaff5wn4tj/MmWfkS8=;
 b=XZICIdmSCPiD0e07suR+LJUBtAHqFgt9627FAKbltFhnjRl9oWb6u5n2y0oojk6XGj
 TXlx9cspHtNULHDnGwnI5DIuAv3Zu6JAJtKERaM4SRr8r8H8ijsLoq02Q4Da9Bt7DG1m
 v7ZPiEYOft915FTcQyDffAveOtez+m1/JyUKEf8amtq+9WpNYKDaSenc+wiuGWQtbS8p
 52C9oThQfE7op8jfj/OD+MYmjvw1f/Ge8h62O+pxlYB4OyR2Ah3+fiXK30EhjjW/88ht
 9gknSvL7/Mxf+3AsgCICDWJ6JFGoIAmI3kxaaT5oUcb6YjhxGrz59JWOkuJVpwcJvgnq
 Gcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A2KC0ZvqYQILAacx7KrT4trqGgaff5wn4tj/MmWfkS8=;
 b=I1C1sU0nzyzEPuctHwnA2SQTEVoAPh6EDMkOLbMkjCgr8MFS0S+G3t2Vxgqrm8fl9j
 6SvVNv9Nr5AqWKSXlV7sxHDpCfFm0WaX9qsAImqjgPl0Uf9L9Rhe6C/TJW+BfDvVUZyB
 6vox4SwgObe8PNWP1wQBt88QOgvWQM5AImaudD5tk4EyI927YmyEOmMSp/ZeD0dIlmiN
 78L4syAXiJlyMyBHVn/SmvRxmexbpIwIOjNo9wJdE6AR9bVZx3waXhQVFV7RTPW1J+Ko
 KWVTg5GqJsqDPrrbJT5qPxacmSsjtsXMrS7kIw8vbW79yP8gXyUINPTg5izUqZdtRU09
 qbhg==
X-Gm-Message-State: AOAM530PK8nHn2sCBSYmn5SxYuwKV0aQ0c/3H6e34wnVt2oIomYu4ZuZ
 jhowPGxfl2O8XeKS8ep/fDtm1hBev4bEtk5H1U8=
X-Google-Smtp-Source: ABdhPJyDy0X45gv4z6BvvdWR++R4WQfpO3LUSOyp1xZCSsO7OS9dtw+N0l/WZobxpYO5V/Gj3gFFS/WTSS8rSOccU5U=
X-Received: by 2002:a05:6808:13d5:: with SMTP id
 d21mr5239758oiw.111.1642633499215; 
 Wed, 19 Jan 2022 15:04:59 -0800 (PST)
MIME-Version: 1.0
References: <CAK7rcp9rnggAvaDxRV4m_KcR1afmquJsR+=khKw4B1UG1+V7yw@mail.gmail.com>
 <87czkn8rzp.fsf@linaro.org>
 <CAK7rcp84B0MXfeGsPnd9oM6cqxGUUSNL0GmLiWYwZzPhLkvfxw@mail.gmail.com>
In-Reply-To: <CAK7rcp84B0MXfeGsPnd9oM6cqxGUUSNL0GmLiWYwZzPhLkvfxw@mail.gmail.com>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Wed, 19 Jan 2022 18:04:48 -0500
Message-ID: <CAK7rcp-jCvvf2HdzOgsrkTEDM+x_nYi61Gz+K5At5MwKBZAdSg@mail.gmail.com>
Subject: Re: Cross Architecture Kernel Modules?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000378a3f05d5f76a01"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000378a3f05d5f76a01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Would it be possible somehow to save the TCG cache, as with user binaries,
but for a kernel module, before then loading that kernel module into memory
the target architecture whether in or outside of QEMU?

On Wed, Jan 19, 2022 at 2:42 PM Kenneth Adam Miller <
kennethadammiller@gmail.com> wrote:

> The source for it isn't available in order that it be compiled to the
> desired architecture.
>
> What 3rd party forks take this approach?
>
> On Wed, Jan 19, 2022 at 2:06 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>
> wrote:
>
>>
>> Kenneth Adam Miller <kennethadammiller@gmail.com> writes:
>>
>> > Hello all,
>> >
>> > I just want to pose the following problem:
>> >
>> > There is a kernel module for a non-native architecture, say, arch 1.
>> For performance reasons, the rest of all of the software needs to run
>> > natively on a different arch, arch 2. Is there any way to perhaps run
>> multiple QEMU instances for the different architectures in such a way
>> > to minimize the cross architecture performance penalty? For example, I
>> would like the kernel module in one (non-native) QEMU instance to
>> > be made available, literally equivalently, in the second (native) QEMU
>> instance. Would there be any API or way to map across the QEMU
>> > instances so that the non native arch kernel module could be mapped to
>> > the native QEMU instance?
>>
>> What you are describing sounds like heterogeneous system modelling which
>> QEMU only supports in a very limited way (all vCPUs must be the same
>> base architecture). You can link QEMU's together by way of shared memory
>> but there is no other wiring together done in that case although some
>> 3rd party forks take this approach.
>>
>> The kernel module sounds confusing - why would you have a kernel module
>> that wasn't the same architecture as the kernel you are running?
>>
>> --
>> Alex Benn=C3=A9e
>>
>

--000000000000378a3f05d5f76a01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Would it be possible somehow to save the TCG cache, as wit=
h user binaries, but for a kernel module, before then loading that kernel m=
odule into memory the target architecture whether in or outside of QEMU?</d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Jan 19, 2022 at 2:42 PM Kenneth Adam Miller &lt;<a href=3D"mailto:kenn=
ethadammiller@gmail.com">kennethadammiller@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">The so=
urce for it isn&#39;t available in order that it be compiled to the desired=
 architecture.<br><br>What 3rd party forks take this approach?</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 1=
9, 2022 at 2:06 PM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linar=
o.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><br>
Kenneth Adam Miller &lt;<a href=3D"mailto:kennethadammiller@gmail.com" targ=
et=3D"_blank">kennethadammiller@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hello all,<br>
&gt;<br>
&gt; I just want to pose the following problem: <br>
&gt;<br>
&gt; There is a kernel module for a non-native architecture, say, arch 1. F=
or performance reasons, the rest of all of the software needs to run<br>
&gt; natively on a different arch, arch 2. Is there any way to perhaps run =
multiple QEMU instances for the different architectures in such a way<br>
&gt; to minimize the cross architecture performance penalty? For example, I=
 would like the kernel module in one (non-native) QEMU instance to<br>
&gt; be made available, literally equivalently, in the second (native) QEMU=
 instance. Would there be any API or way to map across the QEMU<br>
&gt; instances so that the non native arch kernel module could be mapped to=
<br>
&gt; the native QEMU instance?<br>
<br>
What you are describing sounds like heterogeneous system modelling which<br=
>
QEMU only supports in a very limited way (all vCPUs must be the same<br>
base architecture). You can link QEMU&#39;s together by way of shared memor=
y<br>
but there is no other wiring together done in that case although some<br>
3rd party forks take this approach.<br>
<br>
The kernel module sounds confusing - why would you have a kernel module<br>
that wasn&#39;t the same architecture as the kernel you are running?<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div>
</blockquote></div>

--000000000000378a3f05d5f76a01--

