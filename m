Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921E42ECF64
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 13:18:10 +0100 (CET)
Received: from localhost ([::1]:46276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxUEz-00024F-6Z
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 07:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxUE6-0001W4-RB
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:17:15 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxUE3-0002CM-VS
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:17:14 -0500
Received: by mail-ej1-x635.google.com with SMTP id n26so9395814eju.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 04:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QNNwoy5PFKpKN9OXomCECGA2LaR6TvbCOQym7aWFzH0=;
 b=cn3kMB0JMRs6yRYvCyP3yS/0KwDIvNraZqD+5Dz7ErU97Fya0TmGWvF2q/1fsQRpgl
 h4ud0VX2wDogN9F9X1Z8R0nhtzcr/y7KVMbanOSsAkdk6RrsCFMb4xiZYRdglTGsvSQc
 B0WJZdKwcu30zuhoRj3rT6vv5+3vSn/rDiUIyrKvVZOkGkKjPfPGs3STQt2bWmY1db36
 otPqDYqkHVxUEKmjaGyISuoXTp5fQJDjQpFlLCcYex+nnojA8vwu+3m/srY/5JJ+PJHE
 qkzqzp4+im5EjbErmPxkQF4VuDwRsx2IoIdX8vzCj7D/q5b4rYX/cTapf/BBcZa/mC4K
 ENTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QNNwoy5PFKpKN9OXomCECGA2LaR6TvbCOQym7aWFzH0=;
 b=KN4+U1O/HmJv+msLuG8UaF7iP8mkLrTbRhLqiTw5cBDSmLt7SLy1dsKME8w2FVlL/u
 ssLBHLtAygY11tqTjLKLHOFQ4rg2gpjBO3aSZEmnggU8lsDhaEkOSoWhhObst4fTKfAL
 bA/Vyu7ZjNEJyN/cTYHPL6UOCJTAcxg7vVjaHYWp3tubt8s8PuHVJix5+7U7oh26N/CR
 NQl3IG6x8v0gw1hPPMCmteHNFSTxkAP6Sw/eXBvljEZPXMj0nfBNIV1LUjOyuhzz4Nq6
 jS9TPcdHHiIO04s4lbfPDFCfPZnxR8x1XwdHVpga/cGqc/dFtXQb+KRZSbd0wk97Bns0
 C0JA==
X-Gm-Message-State: AOAM530ynJ0PMIcZPR9Lot95TXUKj0bjP7Q0IDoU2P26WEvyteF9wZSO
 UadTWsZYxtx7BnFLQ74DPU1xoNNKbhyNJhVR1mWEKw==
X-Google-Smtp-Source: ABdhPJwUuot25qnzyLKqFmKYOtAadxH91AVBBxkO33P2zcf9wJqwwvFXFZqfrfqkook/NyK7yT/cFT+TGdtjaYMM+Js=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr6372811ejb.56.1610021829946; 
 Thu, 07 Jan 2021 04:17:09 -0800 (PST)
MIME-Version: 1.0
References: <20201215174815.51520-1-drjones@redhat.com>
 <cun8s9zorr3.fsf@zarquon.hh.sledj.net>
 <20201216064353.2n4evhicybkkuf7z@kamzik.brq.redhat.com>
In-Reply-To: <20201216064353.2n4evhicybkkuf7z@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 12:16:58 +0000
Message-ID: <CAFEAcA8MQoThWcmcoC30oEGGQ8POtz=ixBd7HUjZT+8YnJfvqA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Remove virt machine state 'smp_cpus'
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 Ying Fang <fangying1@huawei.com>, salil.mehta@huawei.com,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Dec 2020 at 06:44, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Dec 15, 2020 at 06:20:48PM +0000, David Edmondson wrote:
> > On Tuesday, 2020-12-15 at 18:48:15 +01, Andrew Jones wrote:
> >
> > > virt machine's 'smp_cpus' and machine->smp.cpus must always have the
> > > same value. And, anywhere we have virt machine state we have machine
> > > state. So let's remove the redundancy. Also, to make it easier to see
> > > that machine->smp is the true source for "smp_cpus" and "max_cpus",
> > > avoid passing them in function parameters, preferring instead to get
> > > them from the state.

> > >  static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> > >  {
> > > -    int cpu;
> > > -    int addr_cells = 1;
> > >      const MachineState *ms = MACHINE(vms);
> > > +    int smp_cpus = ms->smp.cpus, cpu;
> >
> > Is it house-style to have initialised and un-initialised local variables
> > declared on the same line?
> >
>
> checkpatch.pl doesn't complain and a grep of qemu shows hundreds of other
> examples. That said, I only see one other example in hw/arm/virt.c, so if
> we'd rather avoid it, I'll repost.

I think this is one of those things where the style guide doesn't
say anything, so it comes down to individual developer preference.
Personally I find declaring an uninitialized local on the same
line and after an initialized local is a bit confusing to read
so I've tweaked the patch, but it's not a big deal either way.

Applied to target-arm.next, thanks.

-- PMM

