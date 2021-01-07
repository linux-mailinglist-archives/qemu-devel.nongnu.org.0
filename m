Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464752EE659
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:47:57 +0100 (CET)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbGG-0003e9-37
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxbFL-00033F-Vw
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:47:00 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxbFI-0007Ni-Af
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:46:59 -0500
Received: by mail-ej1-x631.google.com with SMTP id 6so11367267ejz.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 11:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DJrUDrAV+48b7GkNVgC01eHlo1qBz5/LunvwqhIZsv0=;
 b=BECAJ597zX8HBiiDxUgBk2OOni/QFiR+1Kv1gq8sC8WvUxExtmgDqgggL/g09O5Gqx
 8CsYQIBjTaiAp5uxQbk6gTI1VtkLVybcUVrvg6EsdhZYl4XhhQNNaJGa8wxZROcnzbvV
 ZXqq+UR51P0sktbPRfAbfLJSk3Dg+HEo/sMwqpZjdpBIkI2VX0jOQ1JUBU9TEQQn1VDC
 e3KT0142Tyr9eNc+2J1SvPNmHSTl9fXSYRxmMla6QYJJUbmx5rV9WD63Gs5TK9u0qnoU
 YJgkZPbGxBnyPDvU1cPQJhNtr46yWsLZTlG7Of11gneWaShMSC7tOv1Jga9hcl1S2gfG
 D5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DJrUDrAV+48b7GkNVgC01eHlo1qBz5/LunvwqhIZsv0=;
 b=hw0kY3e47moQp1dP1/nCU+nMD1oYwc+DivBkjrWk30PqnBjOLzHGNHvedDYAurQq0Y
 hnKWYh6EDgA3mBLzUK6uJkWlKbXMA6WkFFLDgI/A5fg9l0S6NQf3YFWwqJnxu4AT54+B
 dfp6SvQFG5YcS4bYHp5iZFxziFA2zlCdc3tfeHXRc+3qHFQndRIERRtQzQDn51Aztrpt
 v1ntg/oRdqhsZ6N6TVSzg6nyQLet4Qqxv8v9qRCRMESaikHKBN3n9vC8usTsYDp2qBV9
 9U4xb6dePAULQmFlXxtrg2VkZNG8UCHtY7pME4PkJCYmSNBFqaZNtuq/bpnk0dvttcDs
 zEJg==
X-Gm-Message-State: AOAM532fczgN977FoTPADUc45ZOraS7bTFZ41tjRe0QHpn2YWQ2Ya8IF
 WQnqphV7wfclU0Qcs1BE87DOWlABlbn7ZF/+KAG34Q==
X-Google-Smtp-Source: ABdhPJzZ+qvFiU7CPghKzZ7b9n0oFxZpFAhg7cNuXVftkIPDvs2SnYUPpO+DTNFM9mrLqAZ3b1r5lowJqwW6xzvDntI=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr279870ejf.85.1610048813593; 
 Thu, 07 Jan 2021 11:46:53 -0800 (PST)
MIME-Version: 1.0
References: <20201221204426.88514-1-richard.henderson@linaro.org>
 <CAFEAcA8FrSwpG6GkhxnPQa0h=Lq4Yjv7YWHFDu3DejKOjdJR3A@mail.gmail.com>
 <f26d4c02-10d6-7e15-8339-3f9fa45d573c@linaro.org>
In-Reply-To: <f26d4c02-10d6-7e15-8339-3f9fa45d573c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 19:46:42 +0000
Message-ID: <CAFEAcA9fgY4Xnp7x3Q9qOdik_W-dXCFsFAe=sEKoFDExqgjBUw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix MTE0_ACTIVE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Collingbourne <pcc@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 Jan 2021 at 19:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/7/21 7:54 AM, Peter Maydell wrote:
> >> -            && (sctlr & SCTLR_TCF0)
> >> +            && (sctlr & SCTLR_TCF)
> >>              && allocation_tag_access_enabled(env, 0, sctlr)) {
> >>              flags = FIELD_DP32(flags, TBFLAG_A64, MTE0_ACTIVE, 1);
> >>          }
> >
> >
> > I don't understand this change, could you explain a bit more?
> > In commit 50244cc76abcac we change to looking at the TCF
> > field corresponding to the actual current EL instead of the
> > EL for the memory-access.
>
> Correct.
>
> > But if we're doing that then why
> > should we be looking at exclusively SCTLR_TCF0 in this
> > for-unpriv-access code rather than doing the same thing we do
> > for normal accesses and checking
> >   (sctlr & (el == 0 ? SCTLR_TCF0 : SCTLR_TCF))
>
> Because this is for the UNPRIV instructions which are UNDEF at el == 0.

Ah, right. (It didn't help that I'd read the diff backwards:
the new code looks at SCTLR_TCF, not SCTLR_TCF0.)

Further, the SCTLR_*.ATA/ATA0 checks *are* based on the
privilege of the access, which is why calling
allocation_tag_access_enabled(env, 0, sctlr)
is still correct.

Applied to target-arm.next, thanks.

-- PMM

