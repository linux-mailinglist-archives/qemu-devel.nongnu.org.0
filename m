Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BE819A26
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 10:59:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP1NH-00044e-DG
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 04:59:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hP1MJ-0003kh-Ai
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:58:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hP1MI-0003mX-DJ
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:58:27 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43762)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hP1MI-0003lw-6x
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:58:26 -0400
Received: by mail-oi1-x241.google.com with SMTP id t187so676576oie.10
	for <qemu-devel@nongnu.org>; Fri, 10 May 2019 01:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R0CYBy45P62CYPJd2SVkb1XFFLimvyPkwi+qTI6OSMA=;
	b=XtPGaQk7FvCesHaB8R264j0zk93ElyIDN46eoI16IetrW/7XA/ddprUczwZzzLyIRm
	LJq99gPkajSXnzNHDHcat++z+ED6sztjSIVrVKxJQuT2Fczwinsu8c5K9o3XHZ/HxT5L
	mAuAtbZFotK8eaUnm3midIY/9fSeszZSkVuWvNxnqCX28TuHsEYLLJuXI7tYjXgkMMhC
	q1uSGbOZ4sGger03qKDKXvAIU9R0UH6daYUcOaImPls+9079iXHIDiu1gOpafqhdkovU
	MWzsFxwDzy5/hEa2FML1lnbeXWaL4dj0bkLVebbmmykQAHGAg1GAib0pKKqtnuT4elOW
	l0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R0CYBy45P62CYPJd2SVkb1XFFLimvyPkwi+qTI6OSMA=;
	b=gzconQawhnw3rtpD8PL2soMj1vazSDnFOoxRXKxnj11sxoB5UZnHQXyssgUD7yhn1E
	81JCwkg0nt6b+C0RYGW4/EwtGzWbxC9UF55noFDFx0iPtzMwnYGPkzdFG+2QOSSRJ0GH
	LVIZlwG/y8Oo3+rT1qxMtjcQWFmgTABMJIf90bveGMxTQliJAUL6XQ62XLoLHYWx66Xg
	ym5IulAYRyYKaN+ojXX1Dw2nBgFX2gMI18TVJhvcwPMNE3TxIgi24tSGoOnD6uWihOsG
	QLILu2QFQdYNVTD4RObDK7QpL0cBppZHrLPbTy2eewxWY+2d7JE3blqy1/NKfM7sVtDT
	G+2w==
X-Gm-Message-State: APjAAAWp3KkoAYU9d/heZtMG2f3TfCnxV/aOCaJUZ2mx16ukfxI7njeu
	oQyU18sG8ZY9MzxVmsvb4AIaR6VqfyrIevyoB5rnZw==
X-Google-Smtp-Source: APXvYqxQ18attBmsoiihnOwmb5HuYxPc68ry9Oc5kIsnY143DTV/uGRg0bFx2ABS+Ja2zxdxTSiupL8pJHGb+vWKmaY=
X-Received: by 2002:aca:110f:: with SMTP id 15mr4444937oir.163.1557478704177; 
	Fri, 10 May 2019 01:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190509222631.14271-1-richard.henderson@linaro.org>
	<20190509222631.14271-15-richard.henderson@linaro.org>
In-Reply-To: <20190509222631.14271-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 May 2019 09:58:13 +0100
Message-ID: <CAFEAcA-GiD1OegiQexBx5JAP7yqKGZp+JWUbzPm92LXKT=LvTw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v3 14/27] target/nios2: Convert to
 CPUClass::tlb_fill
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 May 2019 at 23:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the leftover debugging cpu_dump_state.
>
> Cc: Chris Wulff <crwulff@gmail.com>
> Cc: Marek Vasut <marex@denx.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Keep user-only and system tlb_fill separate.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

