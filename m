Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8973173A6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:48:27 +0100 (CET)
Received: from localhost ([::1]:37322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9yHa-0005PG-Ai
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9xo5-0003tw-Do
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:17:57 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9xo2-0005zK-GV
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:17:57 -0500
Received: by mail-ej1-x62d.google.com with SMTP id sa23so6971548ejb.0
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/8re+nLzeAe9plhqUGOee0qJAMbzRcxGYHdwPlK01gM=;
 b=UPG6ZFVQlVgZ0B8tF0LjmHNK3+cdx1r8DCpCjhxsOIQmJ+bCjGvM1Sh9JtU73NvpI/
 Zi6JCjPu4fcvIqnm04yidWDa9TXqqbnWF+AS3Zd5NHr5MW/CG/bLar58Ej8yhunPc9iP
 wLkAyTm4kuH5GcytTzUkoH4YvEAiTsi3wTJNEehoQ5Z8fY+KT/bAjgaFAU/XABZKWO5T
 xeCM+dvy4dtnwBDvqQUcrb0tB/Z5d93zQn9CJ04Xdc9JuQVXosb7OrOaajzCX/iifAp7
 6Kq/KnC5tPTxhOmJqlDT99t+9GFNy4FqDCKISn9Sx6iO50uDduve6cuXyPJu7vqc+FoQ
 Mv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/8re+nLzeAe9plhqUGOee0qJAMbzRcxGYHdwPlK01gM=;
 b=hE2Cl8b5nxnyisYt+Lw3Ct00igKIwWq66nFwgRPkIzOcy8YC5zxc9rXTfCH9M4rxnG
 ykEwLB7fU9E6CfbcVR6S2KRNxcjku1Kuxe3evMSwkhrp67gfso6ZC7Ihhq28idWZUPGX
 drAoi0OTSMFSw3R0qFKyhp1duAci+wVIQxyKlVozQ41EHEOkINs6kRS7dcMEUrHeh76+
 SQ1b2pAbQeZDjaBiesJbRyXCGPJy5N0A1OwYwSHMT7AzIorDf70MKfP/ZPKqjQCfxZce
 9AFIrChK3kU0f2ITwm3YgaZD44k9+HDz7iNGT7GRnfa5UPOvYrzojx32wGC3lbOP7OjY
 Uhnw==
X-Gm-Message-State: AOAM530AN6ww4AXd/p2XIJxj87LiAXCt6hQ7jp3Re6W9/28+nP827B/L
 n0OVP1/5eZYvbdkdT9FnVyHs+c+9FfSoqw/YcvU9Tg==
X-Google-Smtp-Source: ABdhPJwrs+kiQWzFlcEXouZxmXR4CVmwXWxs6AUE3GpyWahVifi3/Y2yh5pJiej7toqEJJ6qCmPIhbSA4nwUmqmNbi0=
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr5143050eji.407.1612995471903; 
 Wed, 10 Feb 2021 14:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-10-agraf@csgraf.de>
 <CAFEAcA_KFzEERYJ9d8YbPjhCv1rt9O9w567xP=ECqixLie5nmQ@mail.gmail.com>
 <CAMn1gO4p4CDH7qVhNnTpOeo_q98iYBHgS2LLSe26q-3SQJX1Xg@mail.gmail.com>
In-Reply-To: <CAMn1gO4p4CDH7qVhNnTpOeo_q98iYBHgS2LLSe26q-3SQJX1Xg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Feb 2021 22:17:40 +0000
Message-ID: <CAFEAcA_zNdgAO-1eif_TO7cBD1uB09pbGnbjEhUz+RDX+k9vVA@mail.gmail.com>
Subject: Re: [PATCH v6 09/11] arm/hvf: Add a WFI handler
To: Peter Collingbourne <pcc@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 at 20:25, Peter Collingbourne <pcc@google.com> wrote:
>
> On Thu, Jan 28, 2021 at 8:25 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
> > > +                if (!seconds && nanos < 2000000) {
> > > +                    break;
> > > +                }
> > > +
> > > +                struct timespec ts = { seconds, nanos };
> > > +                hvf_wait_for_ipi(cpu, &ts);
> > > +            }
> >
> > Why doesn't the timer timeout manifest as an IPI ? (Put another way,
> > why is the timer interrupt special?)
>
> Timer timeouts result in an IPI (via HV_EXIT_REASON_VTIMER_ACTIVATED)
> if they become due while in hv_vcpu_run(). But at this point we are
> not in hv_vcpu_run() (due to the aforementioned difference in wait
> behavior between x86 and ARM) so we need to "manually" wait for the
> timer to become due, re-enter the guest, let it exit with
> HV_EXIT_REASON_VTIMER_ACTIVATED and then trigger the IPI.

But WFI doesn't just wait for a timer interrupt, it waits for
any interrupt. So it doesn't seem right that the timer interrupt
in particular is being handled specially here.

thanks
-- PMM

