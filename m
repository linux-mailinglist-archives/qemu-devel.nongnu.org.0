Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94277408A7C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 13:49:39 +0200 (CEST)
Received: from localhost ([::1]:35846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkSw-0007DI-6c
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 07:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPkOn-0005Ao-8Q
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:45:26 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPkOl-00054k-Fi
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:45:20 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t8so9166156wrq.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kE0XhEF8r6LbMeyqzceOnbt+I+wXrGPCvwaoys6mR7U=;
 b=Mk3yEL9zbOGIH3bQ8C0HJz9jhVESfIbHvQmEuyIOqjtUtY//+FhAfaTtT74AB5UnuD
 LJ3wtyzZa73Ih3hBWJXO2y2LDfHd+/eJjIiscVAt/R3eXxuEkb/8R3zGquGMyE1EdK+U
 jobQcKbocnj6+GoQzzxoEKnDWRwY2YvJpJJFgoyUjCnGZvx85ED4guSuSaB6Ljxfbxn0
 fFsA4ks3A9aaul14INonHqalLQKhPBC5GKQG6N/7K9zPiTKHNozmed17/CUh+IuqK7/o
 hG5UqVAXEmGXbfCoS8U5Yk7cfmiMwk4VT94VoNQ0ltYVZgUQRppIZEPsa9q/jbPltxMJ
 d5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kE0XhEF8r6LbMeyqzceOnbt+I+wXrGPCvwaoys6mR7U=;
 b=6T24nDbylmNsO3bpDQrK0A7FsVhy+NumN6S3Bo5jYrGV3GNME2Isx15i16HozzyEfv
 sKtuHs2EP9nDv/fy+weOcE3u0RVvxblxtfwofn82xGAMmNdY+pdcZ5a02j80Z+e6RUUp
 xUX8AGqzqqqctKm1QN+x2voei2FEUCOIj14Em3tz5HlaeiG+Up8LA+lEUj6BTRMYOPHj
 weayZnTjpBej9IjetECDvG7APbQ6JMaa+xA1sPFrZ8lsnFLtw6n5IgbSd3algFpze+t/
 zEBhD2FY5EJjUbo43LL2qwF1liCm7zvZL52KlWlTwjkZ8K15Ck+5VahXmtyHwV3iegD0
 cxhA==
X-Gm-Message-State: AOAM530MIwFg5tvqBn9VOvMqIzb9YCWYiGNIIbg+C+XbWHMYUiF62Fo3
 i0wwSBm3MSPo0kBa4Am5pIupzNr1WrDKrCZfziau/w==
X-Google-Smtp-Source: ABdhPJyLxUlSyxwdwDQ3lPBf8szjw/ceiPRmRUSh3CKIwT0xhuEZJztcMaDXaMfCxtsZYzjLlGRC6uu026ZoOpwl4yg=
X-Received: by 2002:adf:f185:: with SMTP id h5mr12169151wro.302.1631533517906; 
 Mon, 13 Sep 2021 04:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-8-agraf@csgraf.de>
 <CAFEAcA8BybrfxNxkWbEjxji4DvDumr6Otb_RK_f84Dt_TWXfpA@mail.gmail.com>
 <ad707e0d-8d4a-0248-80f4-a02a7226ce0a@csgraf.de>
In-Reply-To: <ad707e0d-8d4a-0248-80f4-a02a7226ce0a@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 12:44:27 +0100
Message-ID: <CAFEAcA_OBK1hbqC1Nc7J+VEwkO54WvqBrNa=bR5T3tZW+nfEkQ@mail.gmail.com>
Subject: Re: [PATCH v9 07/11] hvf: arm: Implement PSCI handling
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Marc Zyngier <maz@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 12:07, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 13.09.21 10:54, Peter Maydell wrote:
> > Something in here should be checking whether the insn the guest
> > used matches the PSCI conduit configured for the VM, ie
> > what arm_is_psci_call() does after your patch 10.
>
>
> It's yet another case where I believe we are both reading the spec
> differently :)
>
>   https://documentation-service.arm.com/static/6013e5faeee5236980d08619
>
> Section 2.5.3 speaks about the conduits. It says
>
>     Service calls are expected to be invoked through SMC instructions,
> except
>     for Standard Hypervisor Calls and Vendor Specific Hypervisor Calls. On
>     some platforms, however, SMC instructions are not available, and the
>     services can be accessed through HVC instructions. The method that
>     is used to invoke the service is referred to as the conduit.
>
> To me, that reads like "Use SMC whenever you can. If your hardware does
> not give you a way to handle SMC calls, falling back to HVC is ok. In
> that case, indicate that mandate to the OS".

QEMU here is being the platform, so we define what the conduit is
(or if one even exists). For the virt board this is "if the
guest has EL3 firmware, then the guest firmware is providing PSCI,
and QEMU should not; otherwise if the guest has EL2 then QEMU's
emulated firmware should be at EL3 using SMC, otherwise use HVC".

(So in practice for hvf at the moment this will mean the conduit
is always HVC, since hvf doesn't allow EL3 or EL2 in the guest.)

> In hvf, we can very easily trap for SMC calls and handle them. Why are
> we making OSs implement HVC call paths when SMC would work just as well
> for everyone?

OSes have to handle both anyway, because on real hardware if
there is no EL3 then it is IMPDEF whether SMC is trappable
to the hypervisor or whether it just UNDEFs to EL1.

> To keep your train of thought though, what would you do if we encounter
> a conduit that is different from the chosen one? Today, I am aware of 2
> different implementations: TCG injects #UD [1] while KVM sets x0 to -1 [2].

If the SMC or HVC insn isn't being used for PSCI then it should
have its standard architectural behaviour.

-- PMM

