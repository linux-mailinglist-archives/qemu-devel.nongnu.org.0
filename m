Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D079232CA59
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 03:11:35 +0100 (CET)
Received: from localhost ([::1]:47432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHdSg-0005OM-TA
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 21:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akalita@cs.stonybrook.edu>)
 id 1lHdR2-0004Ok-V3
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:09:53 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:45013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akalita@cs.stonybrook.edu>)
 id 1lHdQs-0004iz-Gr
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:09:47 -0500
Received: by mail-ot1-x32a.google.com with SMTP id f33so25689306otf.11
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 18:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stonybrook.edu; s=sbu-gmail;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mht4wdwP/zTvo7nKmm6aQ4fYDWJjeMM1TltGrFBNzkU=;
 b=B9EGMNOCs5M+9h3HC9HGV0zcn7Cfkj3F2e7Jh5Tg0HIn3fF6RjWzBg99hTNmBjdHVd
 AKxSXF9fJYjOGnCBFc7AK9kZxCrIdb6XW+pTGQCB9QJJweBWsiWoK4GoUAai70RRN4nJ
 HdDoHFaIgYhDnEzYXmuTafoP9pQjRBzHiUSZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mht4wdwP/zTvo7nKmm6aQ4fYDWJjeMM1TltGrFBNzkU=;
 b=hGVHj7LYENW1td1iUQTA4UCfq8V6n4pSbDiYVD3XAgchgnbAmIldft9Amh5+PSSkMt
 QJik6ZLPpH/NiSKC3Xs7IYZdm+mn6vu5PAtzJnjPsRRw+9Jd27jeDROsY+1hHV70TZbF
 XkGkjzUVt/G5DWvzt3BNn+MubVS/hM7+tUOq/io3ax2SSI4ir/1yBVyoNiYgQTJDpMvX
 7zTQj0ppFlCdvyDp3BwO6TbqIUQq8zyuoq4dun0Ck1woL/cP6dpUTEPa7Yq7G+qhmf22
 Y1f4SdB4q0C7RGBjl/zNSPgOCh78svmF4FFOm4RUos8tvsrnwmeUYWjt2P2rvcQZAvob
 wSfg==
X-Gm-Message-State: AOAM533WkyMHbbVRjQJ9SG5lVjytc1O6CSr8BpAyrDa7km0fzc5w1/vF
 BsLYxGY8FaMeJL/qE9mnYsICu5xXOgRMTZSvkHik2A==
X-Google-Smtp-Source: ABdhPJzsLccgADMfBWEzY/OOv8iYV1b65XaJ8A8H3jGnTOXhtrhIh+JjxORNsrUr24BknOfDs+NtTUOV8WPJsULCZNg=
X-Received: by 2002:a05:6830:13c6:: with SMTP id
 e6mr1765565otq.26.1614823776761; 
 Wed, 03 Mar 2021 18:09:36 -0800 (PST)
MIME-Version: 1.0
References: <CAJGDS+E24RdLWii1GbuxW4pBabpu9wboacMkT+qQ+0VL3-qyQw@mail.gmail.com>
 <d4da90ae-3500-a1ae-728b-d4a4c5313900@ispras.ru>
In-Reply-To: <d4da90ae-3500-a1ae-728b-d4a4c5313900@ispras.ru>
From: Arnabjyoti Kalita <akalita@cs.stonybrook.edu>
Date: Thu, 4 Mar 2021 07:39:24 +0530
Message-ID: <CAJGDS+FZj7F4TE2D7U1EAGLxGs6mV23MXL37XjBkN=xZD6QPwQ@mail.gmail.com>
Subject: Re: Some more questions with regards to QEMU clock record and replay
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Content-Type: multipart/alternative; boundary="00000000000096cb5105bcac755e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=akalita@cs.stonybrook.edu; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000096cb5105bcac755e
Content-Type: text/plain; charset="UTF-8"

Thank you Pavel.

Your answers make the clock record-replay process much clearer to me now.

Best Regards,
Arnab

On Tue, Mar 2, 2021 at 12:49 PM Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
wrote:

> On 01.03.2021 20:16, Arnabjyoti Kalita wrote:
> > Hello all,
> >
> > I am really thankful for the wonderful answers in my last post linked
> below-
> >
> > https://lists.nongnu.org/archive/html/qemu-discuss/2021-02/msg00131.html
> >
> > In continuation with the last post, I have a few more questions to ask -
> >
> > My experiment is still, mostly the same. I record clock values in KVM
> > mode, and then replay the clock values in TCG mode. However, now I am
> > recording and replaying all of the clock values (I was only
> > recording/replaying the host clock previously). However, I do not use
> > the -icount feature.
> >
> > - Why are clock values being replayed at checkpoints?
>
> Timers are replayed at checkpoints to be synchronized with vCPU.
> Other clock requests (e.g., caused by vCPU instruction) are replayed
> immediately.
>
> > - Can we ignore replaying at checkpoints and do a dumb replay as and
> > when the clock read actually happens?
>
> I think we can, if we need just clock synchronization.
>
> > - Based on the documentation available, I can see that checkpoints are
> > necessary for thread synchronization. Does this mean, if I do not replay
> > clock values at checkpoints, the guest kernel scheduler might behave
> > incorrectly during replay ?
>
> Checkpoints are related to QEMU threads, not guest threads.
> Timers are needed for virtual devices, that can generate interrupts, DMA
> requests and so on. Therefore we synchronize them with vCPU to make
> execution deterministic.
>
>
> Pavel Dovgalyuk
>

--00000000000096cb5105bcac755e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Thank you Pavel.<br><br></div>Your answers =
make the clock record-replay process much clearer to me now. <br><br></div>=
Best Regards,<br></div>Arnab<br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 2, 2021 at 12:49 PM Pavel Dovga=
lyuk &lt;<a href=3D"mailto:pavel.dovgalyuk@ispras.ru">pavel.dovgalyuk@ispra=
s.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 01.03.2021 20:16, Arnabjyoti Kalita wrote:<br>
&gt; Hello all,<br>
&gt; <br>
&gt; I am really thankful for the wonderful answers in my last post linked =
below-<br>
&gt; <br>
&gt; <a href=3D"https://lists.nongnu.org/archive/html/qemu-discuss/2021-02/=
msg00131.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.or=
g/archive/html/qemu-discuss/2021-02/msg00131.html</a><br>
&gt; <br>
&gt; In continuation with the last post, I have a few more questions to ask=
 -<br>
&gt; <br>
&gt; My experiment is still, mostly the same. I record clock values in KVM =
<br>
&gt; mode, and then replay the clock values in TCG mode. However, now I am =
<br>
&gt; recording and replaying all of the clock values (I was only <br>
&gt; recording/replaying the host clock previously). However, I do not use =
<br>
&gt; the -icount feature.<br>
&gt; <br>
&gt; - Why are clock values being replayed at checkpoints?<br>
<br>
Timers are replayed at checkpoints to be synchronized with vCPU.<br>
Other clock requests (e.g., caused by vCPU instruction) are replayed <br>
immediately.<br>
<br>
&gt; - Can we ignore replaying at checkpoints and do a dumb replay as and <=
br>
&gt; when the clock read actually happens?<br>
<br>
I think we can, if we need just clock synchronization.<br>
<br>
&gt; - Based on the documentation available, I can see that checkpoints are=
 <br>
&gt; necessary for thread synchronization. Does this mean, if I do not repl=
ay <br>
&gt; clock values at checkpoints, the guest kernel scheduler might behave <=
br>
&gt; incorrectly during replay ?<br>
<br>
Checkpoints are related to QEMU threads, not guest threads.<br>
Timers are needed for virtual devices, that can generate interrupts, DMA <b=
r>
requests and so on. Therefore we synchronize them with vCPU to make <br>
execution deterministic.<br>
<br>
<br>
Pavel Dovgalyuk<br>
</blockquote></div>

--00000000000096cb5105bcac755e--

