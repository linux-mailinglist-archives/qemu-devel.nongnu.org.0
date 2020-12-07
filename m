Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322832D1B81
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 21:58:20 +0100 (CET)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmNaN-0007PZ-9q
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 15:58:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmNYo-0006eN-F0
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 15:56:42 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:41498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmNYm-0002g1-Nn
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 15:56:42 -0500
Received: by mail-ed1-x542.google.com with SMTP id i24so7393481edj.8
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 12:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jydo/b2+ePXjDc2hq9QVa6iXvWHXPpj2/7ACQgO0n+g=;
 b=M4WZkeeH7/L99csyEDPxq7vQRtkOiC3gWLdcoRt8/KiQ1CgIe/mRux+BT+hrKvJpD6
 DDQIBHBsL1P7A4moQVA3+4R8liXssHIJm+yISurBEA3GdsPt7INJ2kgnbVfChBzJSOoT
 6BftNvlaVhaqb9u8Q2ABVR5OfRQtHzDC0sohww6y0+I+4FsRMJDVBwsCZl7pymqLtCV9
 FUcXNcvoBm1Ozi6lFqoTNeimemwivt0KB/8jtVKyhnI4cD9sm1JwxmpH8FmuY7TnHmB+
 8YzqwLrt4XPnoLsi+Jw75uRRGgz2rK2fdY24Dr9kxtRRKL3o3eBloIPzdbk3WkUnvYOk
 GFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jydo/b2+ePXjDc2hq9QVa6iXvWHXPpj2/7ACQgO0n+g=;
 b=ZLwZ28bIpScW9GHluhgcfB/EmU1nE/wLU8+8O8s8YiGfa0o0WxQjtOpPNksND27HjZ
 iREogcsSTtFXxfW/NicbCYvjy3oV2S6VTVBsHaegQtS5aIXiu1AvVSxCM8/m+NLANHJv
 Sj9vLjyyXx6KBGGxyHpk4uWkq8Q5ey9QhO+PvuXwOIV6qj+UrPnuWVS/J5yybISuxZYQ
 Ct+7bqJy9tx/xwCa0/Zp/5nOUgJVoA+njlYNAc09AMYtRo60nPZMXs5n76F+/b/QTlVW
 XZgyKVm0HXyNMbCpXVuba0XI0OnCrfTUtZGeWjp8UHclGDJAgFN6BLk7lAcqcYd1Nyj/
 LR0A==
X-Gm-Message-State: AOAM533ZEeMWrut/Mf6wsXphkUs/7rFo1vs+WxFUC+/A0QtxosoJmB26
 1PrSbllmjEktDWEQFJSB89ZRM6Ua9sZKHmr01S5g7g==
X-Google-Smtp-Source: ABdhPJxkFgZFTnUGtuLBkWHVd+YnfU9IBXvaC+AaJILTu227YlD0WHFdNB9hFJBkyJIC+cJcpDDwD4r6XbBZ006JCOg=
X-Received: by 2002:aa7:c388:: with SMTP id k8mr4862991edq.36.1607374598669;
 Mon, 07 Dec 2020 12:56:38 -0800 (PST)
MIME-Version: 1.0
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
 <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
 <20201207182842.GE1289986@habkost.net>
In-Reply-To: <20201207182842.GE1289986@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Dec 2020 20:56:27 +0000
Message-ID: <CAFEAcA9OWLF01hR4qzPwKWAHiDZ9RkSab8rv+0rnkyNhQjAnOg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Dongjiu Geng <gengdongjiu@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Dec 2020 at 18:28, Eduardo Habkost <ehabkost@redhat.com> wrote:
> All signs seem to indicate that CPUClass.do_interrupt is
> TCG-specific, except for those two lines of code in
> target/arm/kvm64.c.  The point of this patch would be to allow us
> to separate TCG-specific code from accel-independent code later.

So it's TCG-specific except that we call it from KVM.
That doesn't sound very TCG-specific :-)

> Maybe those signs are misleading us, and CPUClass.do_interrupt
> shouldn't be TCG-specific.  If that's the case, why arm is the
> only architecture that uses CPUClass.do_interrupt outside
> TCG-specific code?

So, the purpose of the do_interrupt method is "set the guest
CPU state up in the way that the architecture specifies
happens when an interrupt is taken" (set the program counter,
set things like the syndrome register that says what type
of exception happens, etc, etc). For TCG we obviously need
to do this for every interrupt/exception that happens.
For KVM, in most cases the kernel is responsible for
delivering an exception to the guest, because it's the
kernel that determines that it needs to do this.
The two oddball cases[*] in target/arm are for situations
where it is userspace code that has identified that it
needs to deliver an exception to the guest. The kernel's
KVM API doesn't provide a "please deliver an exception to
the guest" function, on the grounds that userspace could
do the work itself. So we need to do that work (setting the
PC, setting syndrome register, etc, etc). In theory we
could have a special version of the function for KVM
CPUs only, but since in fact the same code works just
fine in KVM and TCG we reuse it.

I know that the macOS Hypervisor.Framework APIs are rather
lower-level than KVM (they do less work in the kernel and
push more of it onto userspace); it's possible that there
we might find more situations where userspace needs to do
"make the guest CPU take an exception"; I haven't investigated.

[*] The two special cases are:
 (1) the vcpu thread got a SIGBUS indicating a memory error,
     and we need to deliver a synchronous external abort
     exception to the guest to let it know about the error
 (2) the kernel told us about a debug exception (breakpoint,
     watchpoint, etc) but it turns out not to be for one of
     QEMU's own gdbstub breakpoints/watchpoints, so it
     must be one the guest itself has set up, and so we need
     to deliver it to the guest

These are fairly obscure, and it wouldn't surprise me if
other target archs had picked a different separation of
concerns between userspace and the kernel such that userspace
didn't need to manually deliver an exception.

thanks
-- PMM

