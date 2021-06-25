Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66F83B3C03
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 07:13:19 +0200 (CEST)
Received: from localhost ([::1]:60106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwe9X-0006Kv-1Y
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 01:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lwe6K-0004q3-Do
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 01:10:00 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:42842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lwe6I-0003cD-A2
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 01:10:00 -0400
Received: by mail-qk1-x72f.google.com with SMTP id w21so17852163qkb.9
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 22:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oSKGwHLQGs7q5ZOatSrdJicnoPASFHxHl4kSe/b3gts=;
 b=qePwBeXXvgloxkG8I6/YkoKtoKM6llXLvSCwt+EqfMW9ULf23nnSYg9dufmdK9KpCi
 c1sIrr4PM8O19BROpzXKeoeElG+VZOZd9iSy5BelSyXg8qmgt1ugkr5kbl7sMqCtLi1y
 3j1EKv8I9sIgYTfXTA6NTyfQmDVjVR2CO1M51NTuP4AZC3tAbPneoA6R1Y2vB8O7Bq/U
 6LAPGn/UvXKcqwZ8ANFcUCoa1tzCWfSjEuHNWw1uWbUb+6EKUgBbHz3XReAOSdpQ74ro
 XqbjrAG0y1dI1md6pEwOpsXkkdkzjhDweokoaMl1CYVS2lDTZ7h06HWzjkfsUZ2NA6vv
 44lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oSKGwHLQGs7q5ZOatSrdJicnoPASFHxHl4kSe/b3gts=;
 b=bAfiTz3nLkTo1PD6DxfeKTCna1DLO8MLF+dL5cIIakVm/Z766elXERISaN7uK4sygG
 wPQqLoipD3kChRLgSLCXI0sbUMLrdE+wVgFXUxu/C10MzD0uHwSJdG6C2f5fgB/4WyfB
 5h76EwrK2g8SKCgW5Jr+cqTGp0xrISk/ydpA+MoHHtn0VTYtnTG1n14YIe8KI1Y93Rfo
 NIy5WdS7mcmySCWHweqDreuVWgYsbXFRGh6WGPgoPtGLnCSuNsnd28kBLs106hUx+nEt
 7+LqrmBd55IDs1IRO40DvQV+kpQBjiIGe+AWVplS21zjOY1jBF6DxE7P37UOUjfdJE3U
 0uRQ==
X-Gm-Message-State: AOAM531rpXmJzkF2tGcugLeDnv5HZAjqySvUfWkh2NKhNJFK5TStBTDG
 aD/DN2bAjvYscfkpYWYXXjQWB4E4mwTKHDy2jxjiDiTWhDbQHQ==
X-Google-Smtp-Source: ABdhPJwP8P0I1RbJk39xJ0fXwMpLZybFahJc5NvN4hgPPd8oewu4QZeeqPWH7hiGJuQYVNli+2u74PYXCSuv0dMm+Gk=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr9398354qke.44.1624597794205; 
 Thu, 24 Jun 2021 22:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210625045707.84534-1-imp@bsdimp.com>
In-Reply-To: <20210625045707.84534-1-imp@bsdimp.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 24 Jun 2021 23:09:43 -0600
Message-ID: <CANCZdfqip6b09uP0=jNvN-fVk6817ZSFfG5cxK9rOL1Jj-=LWg@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Use correct trap number for *BSD
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000006d43ea05c5902665"
Received-SPF: none client-ip=2607:f8b0:4864:20::72f;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006d43ea05c5902665
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 24, 2021 at 10:57 PM Warner Losh <imp@bsdimp.com> wrote:

> This is a resend of a patch I sent back in March that was missing the
> proper
> includes due to a rebasing mistake.
>
> The issue is that all the BSDs use T_PAGEFLT to signal a page fault on x86,
> while linux uses 0xe. The patch harmonizes the different ways this can be
> spelled, as explained in the patch itself.
>

I forgot to mention that I've setup NetBSD and OpenBSD bhyve instances
to compile and test these changes to make double sure that they will pass
through the qemu CI.


> Warner Losh (1):
>   tcg: Use correct trap number for page faults on *BSD systems
>
>  accel/tcg/user-exec.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> --
> 2.22.1
>
>

--0000000000006d43ea05c5902665
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 24, 2021 at 10:57 PM Warn=
er Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is a resen=
d of a patch I sent back in March that was missing the proper<br>
includes due to a rebasing mistake.<br>
<br>
The issue is that all the BSDs use T_PAGEFLT to signal a page fault on x86,=
<br>
while linux uses 0xe. The patch harmonizes the different ways this can be<b=
r>
spelled, as explained in the patch itself.<br></blockquote><div><br></div><=
div>I forgot to mention that I&#39;ve setup NetBSD and OpenBSD bhyve instan=
ces</div><div>to compile and test these changes to make double sure that th=
ey will pass</div><div>through the qemu CI.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Warner Losh (1):<br>
=C2=A0 tcg: Use correct trap number for page faults on *BSD systems<br>
<br>
=C2=A0accel/tcg/user-exec.c | 20 ++++++++++++++++++--<br>
=C2=A01 file changed, 18 insertions(+), 2 deletions(-)<br>
<br>
-- <br>
2.22.1<br>
<br>
</blockquote></div></div>

--0000000000006d43ea05c5902665--

