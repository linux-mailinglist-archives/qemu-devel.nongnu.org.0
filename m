Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F3A4FC316
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 19:22:48 +0200 (CEST)
Received: from localhost ([::1]:48026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndxkV-00051W-CC
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 13:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndxjB-0004Ko-Sz
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 13:21:25 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:42618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndxjA-0000Q7-BQ
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 13:21:25 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id p65so10459931ybp.9
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 10:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oQCtp0BqhEvkJLx5LWMSTOnLQEsFDChYAfBMvaz7tQo=;
 b=xWSqfzqMGzDhrlApegx61QKGSfUKVfumn+tsVlU1381hFIKYdwL3k2EqrK68ZLeU9/
 ljnTwfew8aAAgKh9bLOXUsFEyVYnRjujLFcEBiJBcvypOXD20jzXqpRtpyUMo8rlldp/
 VzKK4ueQqyq4pr9ezFDesA2RlkXq0FD7kgjI61yCRdG9TCvOuvy9e5Gi+Wqez7lhSMg1
 AO98mqo/Q681SPW5yQ58eBL6QFR0/Z3GYci13fhBGFgVc/BDr+5D4EPycpTch8Gfi07t
 AKseEScx1iLv/icWP5WAGgCVsdAJlo6hDjBaEqcu464HfPfK1VAVjoR+QlJg1LZsKrvx
 y/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oQCtp0BqhEvkJLx5LWMSTOnLQEsFDChYAfBMvaz7tQo=;
 b=TzW8/JCfUisBx+mkYLqEpBd75BicS0S2Pi8coZuYTnSK7X3U7IDwZ/QbcdWR9NSdrm
 Wf3q7KnQwbG81U49JCQUXeeBx3f8stoRKHdWtKtHXDLMY+DEjynqcstbf5QNxhCIVasf
 vmkJwrJhQJN5JGToUjmZrY7wtqfxkSgcEmdQM2z3gIOURaY5RyIP69WrAQRYTEd49SVs
 fIWZEWq4HjpglJQUu/AWXajDKNhsXKlSrdOE0O32L++1ScAxpBLc97q4Y5ztLHxzx7M+
 qzVwYcdSN/+jUxdGrfCybjU9qy0qj9rkZrLZ9OZRUGVSH9PWQH+wU36+Lcyl7dbKOTzL
 77RA==
X-Gm-Message-State: AOAM53200huGfOh3bCO7HLzbGwuvq1TfJN5MTg2cndJM25VodeIpP0m5
 pAifmBEvKYC5BIvXZoz69orA5oMPr0LlmquYSJIEuQ==
X-Google-Smtp-Source: ABdhPJxx1d0RwV37hbxH2ovt9aIEIrQk34kp3EKeCdtZenp50EX4I7UgzYlM6cVYT/J6kAhFAw5wX6upCTOSl/cbShU=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr23289277ybq.67.1649697682907; Mon, 11
 Apr 2022 10:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220411145609.3932882-1-alex.bennee@linaro.org>
 <CAFEAcA-j2jkdoy09aogzgFVPXYH2Mn7yHXJCZyoZ=DETMMZMVg@mail.gmail.com>
 <6d38ebc0-e472-38e1-5791-de7976e709e3@redhat.com>
In-Reply-To: <6d38ebc0-e472-38e1-5791-de7976e709e3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 18:21:11 +0100
Message-ID: <CAFEAcA9QYPgQNF4CwNRp4eQdMV1wjg-D3mXFKW_A7dx6HnGgJQ@mail.gmail.com>
Subject: Re: [RFC PATCH] target/i386: avoid copying junk to extended ZMMReg
 fields
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Apr 2022 at 17:56, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Yeah, I actually wrote the memcpy() invocation because I was going to
> look at AVX later this year, which of course you couldn't know. :)
> What I came up after stealing parts of your nice comment is the
> following:
>
> /*
>   * Copy the relevant parts of a Reg value around. In the case where
>   * sizeof(Reg) > SIZE, these helpers operate only on the lower bytes of
>   * a 64 byte ZMMReg, so we must copy only those and keep the top bytes
>   * untouched in the guest-visible destination destination register.
>   * Note that the "lower bytes" are placed last in memory on big-endian
>   * hosts, which store the vector backwards in memory.  In that case the
>   * copy *starts* at B(SIZE - 1) and ends at B(0), the opposite of
>   * the little-endian case.
>   */
> #ifdef HOST_WORDS_BIGENDIAN
> #define MOVE(d, r) memcpy(&((d).B(SIZE - 1)), &(d).B(SIZE - 1), SIZE)

Typo -- 2nd argument should be operating on 'r', not 'd'.

> #else
> #define MOVE(d, r) memcpy(&(d).B(0), &(r).B(0), SIZE)
> #endif

Otherwise looks good.

thanks
-- PMM

