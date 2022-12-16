Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C01C64EAFA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:55:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p69If-0002bw-0u; Fri, 16 Dec 2022 06:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p69Id-0002bj-Ms
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:54:47 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p69Ic-0006U1-0p
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:54:47 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 z8-20020a17090abd8800b00219ed30ce47so5807368pjr.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MRqtaW2W9SrQ2EzmxdYiGXpIohYn7SkVmyxq0+bR3CY=;
 b=IGI/u4i5WPZbZRz9cMr3/RciuxKYyaM8eiqprxppu5xE9jTmZC2fHPfAePY1mNg+g8
 Own0Gasp62nf/B/vu5ZV4z4oxFMMBjkSG7jWGzEAIKQwVGiwHsR8T5PwWOhUcwHSWlQ/
 kwEKYPwGHP3ZSRryntu/r7UlWWYQv6qd83JTUbA+gyWKkK4QDE10TEkzIQVmSjtVb4wm
 ymS4HCdhRD7wEhfHj4aM2nagXXGXOH/KRv8xr7kW4NHHgWJFNauVDd/Al46+VXA6zg6k
 XwWWjJNVs7fntii6o361BE3/40b8AySrUMyanoS3AGGPmvatAUenfw6MEniRhill7RXF
 nRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MRqtaW2W9SrQ2EzmxdYiGXpIohYn7SkVmyxq0+bR3CY=;
 b=zIrB0jXt8/OQg+LXbHR+pwg/sZyy7RsyImonQG9gG4ncNn1iaA6dFWfxWhpZEDMn9t
 Nc60YB3rgm6tHlJuuEtncpk00/UQucTE4wgb/vjiZz+T7OCQXueKhMsnq2FvKYkgowPH
 AFVJosWmCqw1Dpt5stq5YWWaICiGFqFSEUtgT/ctTAxEQ32X6LDHNCR3pIpUirZTwAfY
 js7zkzE1wvpCtkyNZ9SqG2cRup41D6ADNkMeop7NFng8u/+ofDIjhwR6Lx4FnVLWMTby
 prD7bVUb/I2dTkXqq3kAI4sjgsKpq4uyx97jR5HH69zumPIpuUd4zkvg3hGwTkG89Amr
 ikVA==
X-Gm-Message-State: AFqh2krrVl54sC7vu5xbVEPL2YJb414ilMg0D+K59HgUH+n6o+sfp6v1
 5JSmBCiSvPaX9p/fyeV7H9NpumtIGPkjTolGMDCsew==
X-Google-Smtp-Source: AMrXdXvL5J2WRHA1ce6hjDoKT/cN61iKVhyMblESBfZnieBBStLp1KbmM/2vvC2LrWUIUWug2VvAMjKdKQzV3nKes9E=
X-Received: by 2002:a17:90b:4f8d:b0:219:9874:c7d3 with SMTP id
 qe13-20020a17090b4f8d00b002199874c7d3mr585405pjb.221.1671191684323; Fri, 16
 Dec 2022 03:54:44 -0800 (PST)
MIME-Version: 1.0
References: <20221215174013.1003508-1-peter.maydell@linaro.org>
 <87ilibin55.fsf@linaro.org>
In-Reply-To: <87ilibin55.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 11:54:33 +0000
Message-ID: <CAFEAcA-4ULFQaJysT14RG-mZCm6vbsfkDspJ2W5+_FGrFmc+MA@mail.gmail.com>
Subject: Re: [PULL v2 00/28] target-arm queue
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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

On Fri, 16 Dec 2022 at 11:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > drop the sysregs patch as the tcg sysregs test fails
> > (probably a bug in the test)
>
> Well I assume because it complains about extra bits leaking into
> userspace:
>
>   =E2=9E=9C  ./qemu-aarch64 ./tests/tcg/aarch64-linux-user/sysregs
>   Checking Counter registers
>   ctr_el0             : 0x0000000080038003
>   cntvct_el0          : 0x017314376c668b73
>   cntfrq_el0          : 0x0000000003b9aca0
>   Checking CPUID registers
>   id_aa64isar0_el1    : 0x1021111110212120
>     !!extra bits!!    : 0x1000000000000000
>   id_aa64isar1_el1    : 0x0011101101211012
>     !!extra bits!!    : 0x0011100100000000
>   id_aa64mmfr0_el1    : 0xffffffffff000000
>     !!extra bits!!    : 0xffffffff00000000
>   id_aa64pfr0_el1     : 0x0001000100110011
>   id_aa64pfr1_el1     : 0x0000000001000321
>     !!extra bits!!    : 0x0000000001000301
>   id_aa64dfr0_el1     : 0x0000000000000006
>   id_aa64zfr0_el1     : 0x0110110100110021 (not RAZ!)
>   midr_el1            : 0x00000000000f0510
>   mpidr_el1           : 0x0000000080000000
>   Remaining registers should fail
>   id_mmfr0_el1        : 0x00000000deadbeef
>   id_mmfr1_el1        : 0x00000000deadbeef
>   id_mmfr2_el1        : 0x00000000deadbeef
>   id_mmfr3_el1        : 0x00000000deadbeef
>   mvfr0_el1           : 0x00000000deadbeef
>   mvfr1_el1           : 0x00000000deadbeef
>   Extra information leaked to user-space!
>
> So it should have been updated when the API was changed.

Yes, exactly (or written in a way that supports "in future
we might expose more fields").

thanks
-- PMM

