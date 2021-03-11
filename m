Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B24A337A21
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:56:14 +0100 (CET)
Received: from localhost ([::1]:52090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKObd-0006xQ-2U
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKOWm-0002D9-JC
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:51:13 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:39944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKOWg-0006bK-3o
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:51:11 -0500
Received: by mail-ej1-x636.google.com with SMTP id ci14so47479260ejc.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 08:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3XFInEQChl2+XbcvYo25+IDX9cKag5PBYSjSTTAk/Ls=;
 b=tDm3RnRtRIUAR01B2VEclqd7EMNrMHMHDwg8qTLwMtRbUd9PeJ10DOSNdKkBAczO/K
 Pvt3BHe/MbRSvKNYxpqOuqK+WmwCm7zfJBpqqKIP+a72Tow6/QiN1jkVXsvzHiz4BcPq
 Zph62vHzzhHwEIG+kLH9s/XDLF08RB49SEE5AGFWDxAtRArPogns/gfn0OmatM1qoEpf
 mN7EBJZf56uJxjTIYMSOSLXkzplHPSWYyKR1mh9kkfBdvs41zOKXHDuCRVUNKEqIyiQ5
 OTMEdLUXG7BFFVMLdu0OwBpI5m8qXZWxKHT2S/CsV9rdOBqNSzTrGEGzDLI+drTJmRnQ
 3JxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3XFInEQChl2+XbcvYo25+IDX9cKag5PBYSjSTTAk/Ls=;
 b=MBTSMYlKHCpn64icnsGxnyJnM7WtkbtY7rUKhiy77y8QC6/ssU8nmt45d3bZQhNXn0
 jdVlTwJWjEmooCF63705Is+api1y+C/iMq3TSfeUwHR0ceaxBkJVAezaxHsr5UJ/wRPL
 9pi2WeWFvhMJT/VLe8i8tFSHVM+KQL3Sc+3DtwQJzyz6m0+xK6eR01JMv5+CDVVvXpPQ
 vIsv6ipYZwqk0QKOgAfHsvnzDSWj65htIzQydKsHx/apwHMsSEbkedZzHj/1fhi65kMk
 AxDHplDlpURFfz03jCe9t0WPrZksdKk2ikIc8dpTEj9txwQjZp2YDFryEm6p12GrBC6j
 qLRg==
X-Gm-Message-State: AOAM530pCahgwnCIub14Y/8daMa2o9g8pv/MKT9nHqpTIVsKCnFm5rDw
 ZghZHrbDG0uFX3+Mx1l2dlJu8f6nqlPz/Jxkk5PauBicYQ/lAQ==
X-Google-Smtp-Source: ABdhPJwLDfCDJ/ZgCMASDFO4BJBOSqiln2nnh7GXulGmaj/5ALWAInRKYqJpj987vTzekgnbobBL66PgadLSvr554zQ=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr3989392ejg.482.1615481463948; 
 Thu, 11 Mar 2021 08:51:03 -0800 (PST)
MIME-Version: 1.0
References: <b9b0e381-c045-bab1-eea7-b8112526e5e8@c-sky.com>
 <CAFEAcA_jnLzZN-nA+Cf_HwGjxvOaxUzZ44LYxqpcmw=3eAU6qg@mail.gmail.com>
 <3edf7903-94a7-c16e-2b9e-644e1a41a77d@c-sky.com>
 <CAFEAcA8UqE65Qxy=c53CCPdYnVrwvBZGxU9SH9qk7Q6vGKDgyg@mail.gmail.com>
 <50fb9541-095d-18e8-1145-662f594600b6@c-sky.com>
 <CAFEAcA-zRB8t4h7eLsw5FbFtyBp6Ow16P4vvk2eA9t7Jcr42TQ@mail.gmail.com>
 <854d74fd-ef10-af51-93c0-2d66792e604c@c-sky.com>
In-Reply-To: <854d74fd-ef10-af51-93c0-2d66792e604c@c-sky.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 16:50:45 +0000
Message-ID: <CAFEAcA9i+9=a7DvQW+4W3jLzocLvKU3+8RioMDJyvLGLaemr=g@mail.gmail.com>
Subject: Re: Question about edge-triggered interrupt
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 16:40, LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
>
> On 2021/3/12 0:07, Peter Maydell wrote:
> > On Thu, 11 Mar 2021 at 16:01, LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> > I'm pretty sure that there is some interaction between the CPU and the
> > interrupt controller on a return-from-interrupt that you are
> > missing.
> I have asked my CPU design workmates. They said, "you have to pull a
> pending interrupt at the interrupt return instruction".
>
> But I don't want to do this way, because it influences the interrupt
> return instruction's behavior. The specification doesn't
> point that explicitly. It's just our CPU implementation.

If the hardware does it like that, your model of the hardware
should do it like that. Don't invent QEMU-specific weirdness
if you can avoid it.

More generally, if the specification says that something has to
happen when the CPU does an interrupt-return instruction, then the
obvious implementation is to put suitable code in the helper function
for the interrupt return instruction.

> If I lock the iothread in interrupt return instruction helper function,
> and pull a pending interrupt. It really works, but I don't think
> it will be appropriate for other CPU implementation.
> > There are several ways to do it in principle;
> I am curious about the ways. If you like, a simple list please.

So for instance:
You can have an interrupt controller which holds a signal line
to the CPU high while it has any pending interrupt. When the
CPU executes return-from-interrupt this involves unblocking interrupts,
and so if there's still another pending interrupt the CPU will just
immediately take it, because the signal line is still high. Arm FIQ/IRQ
with a GICv2 works like this. (It's also how QEMU handles the GICv3,
which is not exactly the same as the typical h/w implementation.)

You can have a more complicated scheme where the interrupt
controller and the CPU are very tightly integrated, and so
'return from interrupt' executed by the CPU means "look at whatever
is next up as the next highest priority interrupt and do that,
possibly avoiding a bunch of stack frame unstack/stack actions".
The Arm M-profile NVIC is like that.

thanks
-- PMM

