Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF74337F3E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 21:49:42 +0100 (CET)
Received: from localhost ([::1]:45916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKSFZ-0004oD-Gg
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 15:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lKSD4-0003a2-1Y
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 15:47:06 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:38251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lKSD2-0002PQ-3u
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 15:47:05 -0500
Received: by mail-io1-xd33.google.com with SMTP id k2so23427301ioh.5
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 12:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1H/b+IBlKk3syYfHdHDNV+nxn9Lyu8xgBVestBg/Z7U=;
 b=LuklWD6Ou7AVsfid2T/EOOJ2E/war96XHGOT7NfQYA/AUjjUgSuXHe4vRzbjUQOGLg
 +D/CGS6WWB9ntxbcMSF38iZrKjBDvtCeAZG39HrCYl3PAh8xhrdJ41wnw4y/R18J+wHk
 W3sggxslieINNIdEeCLI3m6ZrkKFrJv5Gl8cgFzUiISU7n2nGz59Sf/oObXtQ1Bnxtd6
 5D+o1fINNuyiQOZmkZvlVLsC6REj20fCddkcd2mHBn3FfIypIzt+Qp6lfuoPGZU+ghRn
 umwvExLOYK0q/cZ6uCBTH6P46sgy0dqPxzow9eXxupQE9PbYNyAKwqxYteA/GXXmx9OD
 gpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1H/b+IBlKk3syYfHdHDNV+nxn9Lyu8xgBVestBg/Z7U=;
 b=eh2uF1tWWKJum+AnpuxFm3xP2AcJtLyfaR7NULeJkDCul70c0UjSCKlaqXOmhB2jUi
 3+R4hMegfRev7QhOqsxFJcv82so3PzEASvDcu8n/lZPyWxQ/F3djGSR0aBwk6rlCU+4y
 6Bl4n5eLTIdT76qpPWN0FP+KPw0LMIYQwECsEOuJfM3lHGsITcpbkGJrio7lcFZEKtuW
 4E56WM0UAlSBvuLultgkdY5sI7FS1d5pbDquj+EweA93slkYJn2N+x+K9kkhlTCBeh4D
 2fTJTnIBRk5jBYP4sdTMG7xZyI14xvP2U3f7eD4VZ1SkDbf9VQz8mZA/j3vdrNOfyICy
 Awww==
X-Gm-Message-State: AOAM533bNA14Pipr7oZNILVyCwFc1NxRwKNiOwKGd27QFOqKjQwbHZ3E
 iJg5mjX4r8UtVR6T6j1T4Xw8BXjohZC80Hh2/Ew=
X-Google-Smtp-Source: ABdhPJxq7r/vCH/0k+Qfn1IraKvyKMWyLyEyVGkfpCEJdvQyaq7RxTLeRnBFXN2AW77O3acX3bx8gb8dwFZBRzhReyI=
X-Received: by 2002:a02:cad9:: with SMTP id f25mr5433122jap.26.1615495622942; 
 Thu, 11 Mar 2021 12:47:02 -0800 (PST)
MIME-Version: 1.0
References: <b9b0e381-c045-bab1-eea7-b8112526e5e8@c-sky.com>
 <CAFEAcA_jnLzZN-nA+Cf_HwGjxvOaxUzZ44LYxqpcmw=3eAU6qg@mail.gmail.com>
 <3edf7903-94a7-c16e-2b9e-644e1a41a77d@c-sky.com>
 <CAFEAcA8UqE65Qxy=c53CCPdYnVrwvBZGxU9SH9qk7Q6vGKDgyg@mail.gmail.com>
 <50fb9541-095d-18e8-1145-662f594600b6@c-sky.com>
In-Reply-To: <50fb9541-095d-18e8-1145-662f594600b6@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Mar 2021 15:45:41 -0500
Message-ID: <CAKmqyKPXRLWWZnv51ApKwQurn-etQqLxW3or2pFgFH+zONpHjw@mail.gmail.com>
Subject: Re: Question about edge-triggered interrupt
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 11:21 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
>
> On 2021/3/11 21:17, Peter Maydell wrote:
> > On Thu, 11 Mar 2021 at 12:59, LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> >>  From the specification, I find that software will not clean the pending bit on interrupt controller via a register write.
> >>
> >> "When a vectored interrupt is selected and serviced, the hardware will automatically clear the
> >>
> >> corresponding pending bit in edge-triggered mode. In this case, software does not need to clear
> >>
> >> pending bit at all in the service routine."
> >>
> >> Hardware can always select a pending interrupt as it is cycle-driven. But QEMU is event-driven.
> >> I don't know if there is a chance to select other pending interrupts after serving the selected interrupt.
> > Something must change that the hardware (and thus the model) can use to
> > determine that it needs to do something else. The interrupt controller
> > must be able to tell when the interrupt is "selected and serviced"
> > somehow.
> That's a case I can't understand.
>
> 1.  An device causes an edge-triggered interrupt A.
> 2.  The interrupt controller sample the interrupt A, and setting pending
> bit for A.
> 3.  The interrupt controller select the interrupt  A to CPU and clean
> the pending bit for A(according to the specification).

I'm not a CLIC expert but from what I can tell I think the interrupt
is only cleared after being read.

The key lines in the spec are:

"When a vectored interrupt is selected and serviced, the hardware will
automatically clear the corresponding pending bit in edge-triggered
mode."

and

"The xnxti CSR can be used by software to service the next horizontal
interrupt..."

The C-ABI code (https://github.com/riscv/riscv-fast-interrupt/blob/master/clic.adoc#81-c-abi-trampoline-code)
seems to say something similar


    csrrsi a0, mnxti, MIE   # Get highest current interrupt and enable
interrupts.
                            # Will return original interrupt if no
others appear. (6)

Does that sound right?

Alistair


> 4.  CPU start to execute the A's service routine.
> 5.  Another device causes interrupt B.
> 6.  The interrupt controller sample the interrupt B, and setting pending
> bit for B.
> 7.  As B's priority is lower than A, it can't preempt  A's service routine.
> 8.  A's service routine return.
> 9. No other interrupt comes after B.
>
> After the sequence, B is pending in interrupt controller, and has no
> chance to be selected by interrupt controller.
> A's service routine will neither write interrupt controller's register
> nor device's register.
>
> In my RTOS case, the interrupt A here is really a software interrupt.
> Just for clarity here.
>
> Thanks for sharing your ideas.
>
> Zhiwei
> >
> > thanks
> > -- PMM
>
>

