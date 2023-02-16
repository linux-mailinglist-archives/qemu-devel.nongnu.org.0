Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5274D699B36
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:24:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShyp-00086J-M5; Thu, 16 Feb 2023 12:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShyn-00084w-O9
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:23:33 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShyl-0003B2-VS
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:23:33 -0500
Received: by mail-pl1-x62d.google.com with SMTP id v23so2765443plo.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D09vtc2cfz6/m312EUN/GLZ9z7c6XP/dQLUIa1EHdPc=;
 b=BefHP5n5i/1OPSPPh0IY+zDanh6wJtdq/FgxnG2jrruKhnteu+MeORX/OEnZS0fD6j
 qXa0S+5lXPV44EiZP8W7cCbBf1+mnfwmLJCIVQCu1CpXRlQHTTZxhhb8+8HRuphqxC6K
 xY0JOFuyj4RuQ5GbzZmwcC/EbpWWbN6pkKGvuC5/9uaxRPFjWTS4gxiysIRGJ90AxArr
 1nfSVlxcE7W2YwCz3yESwMgyLHqEAIkgSrQIIQR+vXVC7s8hQMAQnsEZx/AFbu8L4sjB
 3vkMs8ky9bBhob7BA2oXXTySATs83TEbqSko2Z8VDI8OJThR1U9h+fCki5bYy+5yFvip
 Aosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D09vtc2cfz6/m312EUN/GLZ9z7c6XP/dQLUIa1EHdPc=;
 b=aQI+dQNPc9xZ9nhNLI4aDy0sIVq1Ke7yEk0dzX8X2SMWe1n6NqDL3JyW1roDONagTv
 b5kBnBq74B53KXGJ8w1H01tCsp7XJafoQzIx/SSQrdqUZBqkzNYUYo9mptD6cFNHUqBR
 NkEz+y+cgZ1eS93rblss0ERS3rVitGAAut10TKxhK9A6G1v0Ajf9PXOCjX5pbQRp4ie3
 nU/1QQQ17mlQv0zFiQpLsOdHrC4zDwlIUoMVaIibo+GLerEcfD9I2bWgC34bLNyxCzP6
 tZsLvgWZpdKzcJ4OVKaoFD8LS513jvUvVDpik5LwGVinc1clDAyM3+UqpzH9TFN6kyVz
 4HSQ==
X-Gm-Message-State: AO0yUKXMJvNQC5N1lLFddX4e0MxRQMtZ2+rMEdEB7aNgioyQPC5/T9cX
 pFR46thaCWzAyWCcheL66rFu/hmOLJZ5asZXF37gww==
X-Google-Smtp-Source: AK7set8Ql26cUQTJoPD73Eqy/jCRkT1xMBqG6tH1JyUkiaKXfDAXKbwcgIooysm0/NJ0hrhiGifaMMF9/9x+S+vdOI8=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr811425pjb.92.1676568210455; Thu, 16 Feb
 2023 09:23:30 -0800 (PST)
MIME-Version: 1.0
References: <20230213183803.3239258-1-eric.auger@redhat.com>
 <CAFEAcA9sOykbFg=ZNvMRvjaSEJCEsn0MXODdu22zWSsyhDxAGQ@mail.gmail.com>
 <e537087d-a8ab-f30b-aeff-76750966a08b@redhat.com>
In-Reply-To: <e537087d-a8ab-f30b-aeff-76750966a08b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 17:23:19 +0000
Message-ID: <CAFEAcA-06ogbs-m-5b3SUfAC2qkRFri0yxsY68ogA70mwrXErA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Add raw_writes ops for register whose
 write induce TLB maintenance
To: eric.auger@redhat.com
Cc: eric.auger.pro@gmail.com, richard.henderson@linaro.org, 
 pbonzini@redhat.com, qemu-devel@nongnu.org, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Feb 2023 at 17:06, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Peter,
>
> On 2/16/23 14:51, Peter Maydell wrote:
> > On Mon, 13 Feb 2023 at 18:38, Eric Auger <eric.auger@redhat.com> wrote:
> >> Some registers whose 'cooked' writefns induce TLB maintenance do
> >> not have raw_writefn ops defined. If only the writefn ops is set
> >> (ie. no raw_writefn is provided), it is assumed the cooked also
> >> work as the raw one. For those registers it is not obvious the
> >> tlb_flush works on KVM mode so better/safer setting the raw write.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Suggested-by: Peter Maydell <peter.maydell@linaro.org>

> >>      { .name = "HCR", .state = ARM_CP_STATE_AA32,
> >>        .type = ARM_CP_ALIAS | ARM_CP_IO,
> >>        .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
> >>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
> >> -      .writefn = hcr_writelow },
> >> +      .writefn = hcr_writelow, .raw_writefn = raw_write },
> > This is going to do the wrong thing on big-endian hosts, because
> > the data value is the low 32 bits and the raw_writefn will
> > write that to the whole 64-bit value. We could implement a
> > special purpose raw write for this register which just writes
> > the value to the low 32 bits, I guess.
> >
> > For KVM we could ignore this, though -- the register is EL2 only,
> > and also is ARM_CP_ALIAS, which means we won't try to do anything
> > with it for the KVM<->QEMU state sync or the migration codepaths.
> OK so can I simply revert that change.

Yes, that seems easiest.


> >> @@ -6139,7 +6145,7 @@ static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
> >>        .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
> >>        .access = PL2_RW,
> >>        .fieldoffset = offsetofhigh32(CPUARMState, cp15.hcr_el2),
> >> -      .writefn = hcr_writehigh },
> >> +      .writefn = hcr_writehigh, .raw_writefn = raw_write },
> > Similarly this would need a special purpose raw write function
> > since we want to only touch the high 32 bits; and again for
> > the KVM case we won't ever be doing a raw access to this register.
>
> same question: can I simply revert that change?

Ditto.

-- PMM

