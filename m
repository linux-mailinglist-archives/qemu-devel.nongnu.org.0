Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79830FC40C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 11:24:37 +0100 (CET)
Received: from localhost ([::1]:55536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVCIm-0003oy-Iw
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 05:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46406)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iVCG8-0002rX-CK
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 05:21:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iVCG7-0002B5-8p
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 05:21:52 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:32991)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iVCG7-0002AM-3x
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 05:21:51 -0500
Received: by mail-oi1-x243.google.com with SMTP id m193so4803964oig.0
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 02:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OciApt82aTzB42BZpSEc3G5TI1Pt9KV/blSFY+IdHjQ=;
 b=F9fExeWLEqmzWsnY2w0xTnUWw+Y9EJZLKPqYjavN5mcumMnu8LNucayw9FRXOgRoS+
 nbD6ErzyLs2JGAi+biLN5CbAbAVVzXdbmyHYgr6O85p+30Lp7szSHJKVDS/ehrmqUEn7
 /pJQ2R4YZmrrU2IkrTNgwAKzqwPhTDNHT9xoibi4T7pwT/T5RKoN6twkW1V1w0GviAzK
 BnOI+Q2nu0T9mSa0NsOWg2xtSKzWL35QQFW1ESlWO/QN2r8ELRQHta51sb5KgSLTRvBL
 BbSkB4wDck8LDc6mJYNmppJDR/pKH5ne+S3ELWdFlYNEMYMGBJnFfttmrk1aASYbrzYv
 cIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OciApt82aTzB42BZpSEc3G5TI1Pt9KV/blSFY+IdHjQ=;
 b=K4vdvYl3/j7CfRSzhh92gaj5jn+yH6T1zZApfDRamVJmcVMKDfcZEGqM/Psfb1XgJe
 fyFBbgpzorPm+wt/aT8UM0+gJJFFoxWIKrC83Z4b+doU8O5rARm0Z2TX3OIyb0IpmulD
 SKA9tYQ7XUIUS8UFLSHw3vWfPiIFKX1qY6KD51nb38MZDwGHbohy1tNIL0N7Lp9wBZNu
 zurxDV6g8bTg6B7XPNi+xZEmHEGHN8CJ/bC1HT8xZEMGkDta/ICDdE30EAHqU5hWPfd9
 x7kz9DGziUacoiqOikWRTXv88L80c83DjK3LnZ7wRitqm0zpPhBSDEenq2oBkQgYuQks
 2DlQ==
X-Gm-Message-State: APjAAAWt5A030eU9oHZ71qQ4SI5EHwS5yyhP/JYopbguB2UqB+NLYr41
 dKcJSeZIKJ9wVP1h12e7+oETAY5DnFO6g946GAm8xg==
X-Google-Smtp-Source: APXvYqy+6aub0QqgfgnbhYDcuv77J28J8TuK8Q/MTpREnuVy3OnlHwD3PqIZ/keUHudsitDSksM2AylwS5IkPai+D9A=
X-Received: by 2002:aca:cf12:: with SMTP id f18mr2770231oig.48.1573726909683; 
 Thu, 14 Nov 2019 02:21:49 -0800 (PST)
MIME-Version: 1.0
References: <1573655945-14912-1-git-send-email-pbonzini@redhat.com>
 <1573655945-14912-2-git-send-email-pbonzini@redhat.com>
 <2db4f901-65ad-4b80-d309-b8b63330492f@redhat.com>
 <4783e606-19b8-c3c0-08ab-ac84b02af6f4@redhat.com>
In-Reply-To: <4783e606-19b8-c3c0-08ab-ac84b02af6f4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2019 10:21:38 +0000
Message-ID: <CAFEAcA_FnfJx=oae5e_KGcmqwyUtM01KeywjpSSa09fu9++sMw@mail.gmail.com>
Subject: Re: [PATCH 01/16] memory: do not look at current_machine->accel
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Nov 2019 at 09:36, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 14/11/19 10:10, Thomas Huth wrote:
> >> "info mtree" prints the wrong accelerator name if used with for example
> >> "-machine accel=kvm:tcg".
> > I had a quick look at the output of "info mtree" with and without
> > "accel=kvm:tcg", but I could not spot any obvious places where it's
> > wrong. Could you give an example?
>
> Indeed the commit message should say "info mtree -f".
>
> $ x86_64-softmmu/qemu-system-x86_64 -M microvm -enable-kvm -machine accel=kvm:tcg -monitor stdio
> QEMU 4.1.50 monitor - type 'help' for more information
> (qemu) info mtree -f
> ...
> FlatView #1
>  AS "memory", root: system
>  AS "cpu-memory-0", root: system
>  Root memory region: system
>   0000000000000000-00000000000effff (prio 0, ram): microvm.ram kvm:tcg
>   00000000000f0000-00000000000fffff (prio 0, ram): pc.bios kvm:tcg
>   0000000000100000-0000000007ffffff (prio 0, ram): microvm.ram @0000000000100000 kvm:tcg

Why do we need to print the accelerator name for every
memory region? Isn't it just a global property, or at
least a property of the CPU ?

thanks
-- PMM

