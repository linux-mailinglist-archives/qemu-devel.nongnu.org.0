Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9141715249F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 03:02:14 +0100 (CET)
Received: from localhost ([::1]:40486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izA17-0000fS-60
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 21:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51521)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jkz@google.com>) id 1izA08-0000Da-4i
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 21:01:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jkz@google.com>) id 1izA06-00037o-TX
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 21:01:12 -0500
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41]:43821)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jkz@google.com>) id 1izA06-00030s-Mq
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 21:01:10 -0500
Received: by mail-vk1-xa41.google.com with SMTP id m195so97085vkh.10
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2020 18:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7iyqtiN5AJMc1B2QIPW9fX/vljNiQQ+Ocu7OCIiew60=;
 b=VhriZoZOalRWMr+AKaH4AUzRKPZt9i0zLJ9OAmDFtX2GCciDT8NMcxXesntwRuPiOD
 /C/oWJMpJTxD/yPPd2/AvHnpDusjD991n/Y3E9gVKXfLfcanuk3jK9/dyYqSDZeSQCh9
 azjQM9BE0xn8AiYXzNoZqCB0qpiNnUupPCZN3v5uPLe9XvsxwFo56dnsXkOcuKZ9z7jA
 jQ0D2tOMlcxH04K4aXboVY7lYV+kBnXrrFvE2NYJVrh4PAxbLyKgLwpZB5SsmEIyURVT
 VSc0tUljUKXT8+5KDgR2JP+ncScE3/j79XEsZxSTyGHxWdlH8fxiLznwF4XpW9+9Pap/
 1u+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7iyqtiN5AJMc1B2QIPW9fX/vljNiQQ+Ocu7OCIiew60=;
 b=o2fFKPJTCQZsE2MK/vcust01vof6teDNZAGe/2TCUpWDsp8YD6O++axPSTCphcUbN8
 +31G/qy0ZMgQ0/2EUp7rB0J4AabH0TpIH6L/QqLNp3FbACwLIdVOLbkGGoFplPfQA90F
 puvJ4ObfoBGkzhItWVnNUh56WsJXZRQBvbY/6Pttt/ou9DK1Urf8QKbE9HqcetEaORe0
 gjPSXJ8yZtaVHjsjy6zV0JBFaEhLttd67fJMJ2JTSMjw2wGcxvAIwEnBo8OtQU5N1SLH
 Cf+4xxGYgEJqaT4WumugYlI1pJx7+joB+v3b3ft8p5jdAuXMx/uudLm1pDFHlhoAOCO1
 VgmA==
X-Gm-Message-State: APjAAAWln2jCaMe6XjN0Kfls84XrHjqNOOnSZmCwM8gt1I8gUDvQSiCn
 71m59ub1yBDeZnpZ8nHbbQj1ti3bF/sR03JdfJ9Ywg==
X-Google-Smtp-Source: APXvYqwjvtI2wfbKrTp+miy7l2dIOu14kcIANTJSnTXXZmsfYtTkVft9RFU1dTEpagqy48IEk36FyqNRV2riGI4Y2AY=
X-Received: by 2002:ac5:c9a6:: with SMTP id f6mr299726vkm.54.1580868069005;
 Tue, 04 Feb 2020 18:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20200201122746.1478003-1-laurent@vivier.eu>
 <CADgy-2uVp2hyqFncFa2T7m8W5vPt=kigdiqosLQFgdB8Df81Gw@mail.gmail.com>
 <187a66d8-5afd-b3d6-81df-6b99468bff19@vivier.eu>
In-Reply-To: <187a66d8-5afd-b3d6-81df-6b99468bff19@vivier.eu>
From: Josh Kunz <jkz@google.com>
Date: Tue, 4 Feb 2020 18:00:57 -0800
Message-ID: <CADgy-2uwAjkLaeTjAuWMgM1inmEGyN4jseZr+eqHbZDvU3XfNw@mail.gmail.com>
Subject: Re: [PATCH 0/4] linux-user: fix use of SIGRTMIN
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, milos.stojanovic@rt-rk.com, 
 Matus Kysel <mkysel@tachyum.com>,
 Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, 
 Marlies Ruck <marlies.ruck@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>, Riku Voipio <riku.voipio@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a41
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

On Tue, Feb 4, 2020 at 3:55 AM Laurent Vivier <laurent@vivier.eu> wrote:
> We should add signal 63 here, but it's becoming not very clean.

https://golang.org/issue/33746 has some discussion of the issue. The
Go maintainers wanted to clean this up rather than just adding 63. The
patch is on ice right now because it was unclear if QEMU was going to
add a breaking patch. Now that QEMU has this behavior, I think they
would be willing to accept it, or something similar.

> I think we could also simply ignore the error. As returning an error is
> generally an abort condition even if the signal is never used, and it's
> what we would do in go to avoid the problem. We will have problem later
> with programs that really want to use the signal but I don't think we
> can do better (do we know programs using 31 RT signals? or starting by
> the end of the list?).

My general sense is that RT signals are very rarely used, and the only
uses I can find are based off SIGRTMIN. This sounds reasonable to me.

Josh

