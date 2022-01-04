Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FA7483F37
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:31:30 +0100 (CET)
Received: from localhost ([::1]:34938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4gAD-0005ed-L5
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:31:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1n4g8L-0004du-Li
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:29:33 -0500
Received: from [2a00:1450:4864:20::536] (port=39535
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1n4g8K-0000xj-5F
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:29:33 -0500
Received: by mail-ed1-x536.google.com with SMTP id f5so146036039edq.6
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 01:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BGyZyXkOdeHhbU/m35LCjyUAZrlwGxTsJKJvLQqzAeA=;
 b=OggMNbhJzKEyjOV9dEmagkr6ge/VYjMkqdAswwsYl4CZi1gvXUPxuJJdmh+8Pbw5/t
 6cwoRbse8lGxhXsC9XWopGPUcRpYnuSprXR1ch4xtVyHzn+rwmFQeubS2f8FEKZ4mWps
 OJS16dbqWHIEGHJ/F1gTQ0Xq+MqQQlwLwkeS+KKFyFA+QHbdcz63eupPE+DEsxHGlZ3I
 GfcYWpuiykaH2fvACQWLenWC5petyBH3sd/yFV5/BsRFJQq9uzsRSrkRg2tWNtREH2Pb
 jUGT/T7VP6BzHdP3aKcsLyMQrmMKS2CPN8CMX82r4q/NeCK3PGSW+XofLFUmja6bARHl
 526g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BGyZyXkOdeHhbU/m35LCjyUAZrlwGxTsJKJvLQqzAeA=;
 b=MHMl+cGF6BSYaFMvpcpQCBoPV2+ItqCrcZiNvJkDxMUEiA8PXHbdfMnYR4AGj+KaSe
 CJYdWpI4yXn4QDGJUafGZFSL1kPjK4xcJG2JtfoM/ptguQMPHW4Mt6xWIjjN4ojcucBy
 EY01bvvnkLOM8PA+UL3v8RUekxPmjLEAbJnBZxOXiC6mR4LwHpHBsvr3CtbBkxHU60m7
 nkmeoEcqObZPMkAY0MMIDVXkdi5LTsp87+AdN6XU9rHbJbCS90xiIUmMdCG55Uq4GAuv
 72lV1a94UOoou6Maa2J9oopVWwEk9cYVuEm9j9h5iRqPOHoi7i6hFV4lLxlGC3jNFF9D
 jdvg==
X-Gm-Message-State: AOAM531M7jXTJuo1SosT+q6SFrsfyZwR/M+3LPog+dkundMmp7YPwjwC
 dikxnVoNFlQT0CVC6QipFxq22upqUPnfVKghbTIOrwOkKnQ=
X-Google-Smtp-Source: ABdhPJzBcNt9etanLwNp8vxfD57h9mgIvewygjRV12JDElpTWFj5GFfOTaP7OUG1sfIqGiZPg3ST0AiyOfMXn8V632g=
X-Received: by 2002:a17:906:7044:: with SMTP id
 r4mr38615527ejj.351.1641288569553; 
 Tue, 04 Jan 2022 01:29:29 -0800 (PST)
MIME-Version: 1.0
References: <YbJU5vVdesoGuug9@redhat.com> <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <YbeL7EjoTtrUrGa2@redhat.com>
 <e33c3d09-b507-798c-b18e-df684ec797e2@redhat.com>
 <YbeWxAn6Zw7rH+5K@redhat.com>
 <CC132B60-3F08-4F03-B328-4C33407BB944@greensocs.com>
 <87lf0nto1k.fsf@dusky.pond.sub.org>
 <YbiS8Zc7fcoeoSyC@redhat.com> <87bl1jqm1a.fsf@dusky.pond.sub.org>
In-Reply-To: <87bl1jqm1a.fsf@dusky.pond.sub.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 4 Jan 2022 10:29:18 +0100
Message-ID: <CAJy5ezofpy09ZOtVHFofGTzt3U8MEA_ddpBHifuF50sVDFXULA@mail.gmail.com>
Subject: Re: Meeting today?
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000029878505d4be4671"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000029878505d4be4671
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2021 at 3:49 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>
> > On Tue, Dec 14, 2021 at 12:37:43PM +0100, Markus Armbruster wrote:
> >> Mark Burton <mark.burton@greensocs.com> writes:
> >>
> >> > I realise it=E2=80=99s very short notice, but what about having a di=
scussion
> today at 15:00 ?
> >>
> >> I have a conflict today.  I could try to reschedule, but I'd prefer to
> >> talk next week instead.  Less stress, better prep.
> >
> > I fear we've run out of time for this year if we want all interested
> > parties to be able to attend.  I'll be off on PTO from end of this
> > week until the new year, and I know alot of folk are doing similar.
>
> Right.  I'll be off from Dec 23 to Jan 9.  Can we all make Jan 11?
>

Jan 11th works for me!

Thanks,
Edgar

--00000000000029878505d4be4671
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 14, 2021 at 3:49 PM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Dani=
el P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_b=
lank">berrange@redhat.com</a>&gt; writes:<br>
<br>
&gt; On Tue, Dec 14, 2021 at 12:37:43PM +0100, Markus Armbruster wrote:<br>
&gt;&gt; Mark Burton &lt;<a href=3D"mailto:mark.burton@greensocs.com" targe=
t=3D"_blank">mark.burton@greensocs.com</a>&gt; writes:<br>
&gt;&gt; <br>
&gt;&gt; &gt; I realise it=E2=80=99s very short notice, but what about havi=
ng a discussion today at 15:00 ?<br>
&gt;&gt; <br>
&gt;&gt; I have a conflict today.=C2=A0 I could try to reschedule, but I&#3=
9;d prefer to<br>
&gt;&gt; talk next week instead.=C2=A0 Less stress, better prep.<br>
&gt;<br>
&gt; I fear we&#39;ve run out of time for this year if we want all interest=
ed<br>
&gt; parties to be able to attend.=C2=A0 I&#39;ll be off on PTO from end of=
 this<br>
&gt; week until the new year, and I know alot of folk are doing similar.<br=
>
<br>
Right.=C2=A0 I&#39;ll be off from Dec 23 to Jan 9.=C2=A0 Can we all make Ja=
n 11?<br></blockquote><div><br></div><div>Jan 11th works for me!</div><div>=
<br></div><div>Thanks,</div><div>Edgar<br></div></div></div>

--00000000000029878505d4be4671--

