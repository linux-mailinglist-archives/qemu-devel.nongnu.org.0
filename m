Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7B93805E9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 11:09:12 +0200 (CEST)
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhTol-0000h6-EO
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 05:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhTnN-0008Ew-Gy
 for qemu-devel@nongnu.org; Fri, 14 May 2021 05:07:45 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:45637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhTnL-0001lG-TP
 for qemu-devel@nongnu.org; Fri, 14 May 2021 05:07:45 -0400
Received: by mail-ed1-x529.google.com with SMTP id a25so9790364edr.12
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 02:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mkp+7/ARAMgVeJo7mqJT3GfWMDiH0FvHnTmcsDhBI60=;
 b=O/PW8AX398wi/677KbZqGM6fKinRlj2f2RX/9iFhs94YhmKWrPdBHqU+SPnP3/8m0h
 In14lHebwvfnwFbILpUZabgLtq/YQrVImSQr1Sl+whRyilgnrwS5bYFHMIvyrr8DOd6P
 9yipGBI0X0q3LvZ2ak4uEnR7PkHgg3b6qDXqkWlBmwjfXnJdKWHW0qLLwHRpGLMhvA+O
 XazFCW5ekT61LzR/7f5FM6Vdhb30S7r6lBctu9d358TP3egAhFpQ0JSB78HIunGr81Hd
 wrm4WgK/FJlFbzy8aDpMDFZJwSS6tJI9UoGj6sQtydX0lyUak3lDv2mYWhGuUTxDpMQZ
 j07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mkp+7/ARAMgVeJo7mqJT3GfWMDiH0FvHnTmcsDhBI60=;
 b=nEm3u/HCMRI3Q2uIMXuTWTAbrBL1qJzrLFVW/w3vNHM8JymIJQtC3AlQfmQ+8k6h8k
 XcrGFLcABtepYwQ8VPneXUR9o+6OD7qPsP9vdMNnYKF2rQHzLjIG9tGpyyzeasnOhsLt
 rO+502RO4c3hzeGrd96Z/jWnQlAdVBGIQtH3olTUJgn40L7fT30vbdA2Dn0jup8jYl9N
 hs57xggAGrPm6elP1SlD1Knp4fcCTbeHYJzZ8r/rMMfY9mhJFf9Uos+dUfqiaPUQLz+j
 JLCGGOf6D7Uz84Fk1Defc9P4Gdi/qpKHKflgMYbPOQP5WaK+JUkCAYr7PDAZjdGEs8ea
 9daA==
X-Gm-Message-State: AOAM530sfHlktqIG8NWlUznp7H0ZJWNg82i7yi8mIdon+g7ye8CX9acK
 53puweLXTL37aFvvcttz+fNi811QR66fVAkg8RHLwA==
X-Google-Smtp-Source: ABdhPJzSr+crMZV4dMKGmVERZw59L65nwrXbdNL5101WINDZu7b6Tj/5jm6b6DnBGZgdFCmUDQKhA8REYyncpqH11fU=
X-Received: by 2002:a05:6402:1a58:: with SMTP id
 bf24mr15575449edb.146.1620983262084; 
 Fri, 14 May 2021 02:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210512084020.606871-1-pbonzini@redhat.com>
 <CAFEAcA_EkFT2UCgGsgHYrFNZNn0S42aWOzw1DC+9OEzuerFvTw@mail.gmail.com>
 <93b879ee-3e28-9bd8-f0b2-3ac99033198b@redhat.com>
In-Reply-To: <93b879ee-3e28-9bd8-f0b2-3ac99033198b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 May 2021 10:07:29 +0100
Message-ID: <CAFEAcA9Gqi+mJcqd8Ovc_gWvx0kL616-y3E0tAYua37CzA-5Eg@mail.gmail.com>
Subject: Re: [PULL v2 00/32] Misc (mostly i386) patches for 2021-05-11
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 May 2021 at 21:39, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 13/05/21 21:12, Peter Maydell wrote:
> > Something weird has happened here.
> >
> > I think I applied v1 of this pullreq (merge commit 31589644ba069ba06c5
> > now in master), and then when I came along to try to process this
> > one the tag was an entirely different set of commits.
> >
> > Can you check whether what is in master is what you intended, and
> > send a revert/fixup patch if necessary, please?
>
> Yes, it is.  You processed the tag that had already moved to v2, but
> replied to the buggy v1.

If you want me not to process something you do need to reply to
the cover letter. Otherwise I won't see it...

-- PMM

