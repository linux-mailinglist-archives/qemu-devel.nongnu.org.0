Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7EF3F210B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 21:48:31 +0200 (CEST)
Received: from localhost ([::1]:33790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGo1e-0003iv-BY
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 15:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGo0K-0002pp-Hb
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:47:09 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:39867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGo0I-0006E3-VD
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:47:08 -0400
Received: by mail-ed1-x52e.google.com with SMTP id cn28so10493631edb.6
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZVOWCqgXTunldmOAR86bLE0W72uE3GAu/PrGxuUfztM=;
 b=aqfJg38zQ76fSW4AcKJqcpVWMJsIpRLtCb2j5vvpqN5fFXOqFVMe7hybUtWvPLvI3p
 HMqb4P94VlS/B03PsmA9Sumopmr0bOinRTL9Gdt4GYCPcoJ5MX4Xeigai9M+kQvbbMei
 I1kGf7aHTw8KMpanq9TZbyWrq7OZTo6rCRW0FHbaxJ6oUYwD/p8hp6t/vD1j2Np6+s0I
 9OIEY4ndwhch/2V3DOvcWEQ2WkdRge95kF7yZ00FCz1MvSS9Ti4X0mEgvFXn7AfdMWky
 cMLnJ6RrJfgzlMBZsJL97urHYVPgEdb0giraqsudw9mjiskcp1GxWv3PV1TYbf4eafiA
 fL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZVOWCqgXTunldmOAR86bLE0W72uE3GAu/PrGxuUfztM=;
 b=XimyRVN8sG7Mfrcn/wNoBS6INoQMrMEaZt9MxvAZ8fN5CsVpA+GfZ+X4zfJAa5MOIA
 er5YlDnmcGObRhYn4czrMyqfw+gfbVAbAb47sMrJ3RMPlI3aYShNYoTJSguXWEVpdcoz
 pKKgaLHlsrGlLpQGoEZA6XPwZgz0/3+mi/Fv2K2Szkobr/xhYyVAnFAqLNot40Znqm3Z
 mloSj3SHbM4FUizbFrkPEBDHvunkUFCpx93UurwQB4hLyju0SqWAYF/RGmtENeQGw7Ag
 26vBZlrcWcWvCx5BuvNhv2CPgsPA1NmXHJo6sq+XyvHmh+8Lw1tEozSNtuTtw+0KYeko
 Xvyg==
X-Gm-Message-State: AOAM53064x4qx3C1nLi4Ex5XfF5+Z0p9FSXUOm6U0h9iIh1HKiLH0Vm5
 tRn81N6OBr6vz9BC2+dY93nQgePTi6P+82ud4VyEKA==
X-Google-Smtp-Source: ABdhPJwl4ECNne1JD5o3i5Pd2EN0yojB9+lN3TNAz+bQLELQ9dEsmJONVZdP1iydXxSYABlf0KStdDFYZF5OqIaDCL4=
X-Received: by 2002:a05:6402:3099:: with SMTP id
 de25mr18056850edb.36.1629402425192; 
 Thu, 19 Aug 2021 12:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-4-richard.henderson@linaro.org>
 <CAFEAcA9NF0zR8eyzys-V6+VjhfM=7WGLYMYTHkSm-RSH7LHnGA@mail.gmail.com>
In-Reply-To: <CAFEAcA9NF0zR8eyzys-V6+VjhfM=7WGLYMYTHkSm-RSH7LHnGA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 20:46:19 +0100
Message-ID: <CAFEAcA8eiSB2fjk7P_r=+_LzsVxtJP0H3NnNT-5oZ0FWqQq9mw@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 at 20:18, Peter Maydell <peter.maydell@linaro.org> wrote:
> Just noticed that section G1.16.7 says that when we report
> PC alignment faults to AArch32 they should be prefetch aborts,
> not UDEF. The fault address and fault status registers also need
> to be set (with slightly varying behaviour for when the fault
> is taken to Hyp mode).
>
> For AArch64 we should also be setting the FAR, which means
> that for consistency it's better to use EXCP_PREFETCH_ABORT
> and set exception.vaddress in the translate-a64.c code
> (you get better logging in the exception-entry code)
> even though these different EXCP_* all boil down to the
> same synchronous-exception vector.

Also, looking at kernel code while reviewing your alignment-checking
patchset, I realized that we should also catch this case of
a prefetch abort in linux-user/ and turn it into a
SIGBUS/BUS_ADRALN with the address being whatever the value
in the FAR is (for both arm and aarch64).

-- PMM

