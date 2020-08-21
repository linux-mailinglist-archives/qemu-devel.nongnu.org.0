Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7172324DAD6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 18:29:15 +0200 (CEST)
Received: from localhost ([::1]:54748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k99uk-0006gQ-HH
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 12:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k99sO-0003z3-As
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 12:26:48 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:47055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k99sM-0006P6-K5
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 12:26:48 -0400
Received: by mail-ed1-x52d.google.com with SMTP id k25so1912736edj.13
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 09:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g4RQ1bRGHV0yEsiw1RtqZSRcJzgzpHROlekafZIjIoQ=;
 b=hoJH3id0C1FgQVtVxgHaILSCSTkbKrbCZmHVzWaxFxX+Kf8bEQoVEkM/IBNc6Od0VZ
 NNS+Tcbx4+36YE9HDkCYAgKth7eSCrZ7vRllb/n8EMnHvGm/xKfXy7+QwF0W5XUme0Eg
 /93lVvLpHWDy+F2jXcS2j5PBewCfGNbvpvfUFCh653QZEg0/Xd02GLIUC9EjhoK1WjnT
 3qRCntWDxKxOw3miVMi8GlMVentBxW3h6zIY5bUELDXumR6rgiIWCmrRjzZ70Scl5jV2
 kFzo+Xn5db0Phr1njlD6akxhCZwgOe+3oqC/6FGFpVP+RO6NZENjMewSLA/18OMJUaBJ
 MLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4RQ1bRGHV0yEsiw1RtqZSRcJzgzpHROlekafZIjIoQ=;
 b=HqgFVGzvFNWKkdJNUh+Op/4K9YvjSa7ZrLL4+BNRX7308mvFBd7CAAEkpWk30GmtHB
 8QoF1V3V9NhDsGKYXV2XQ7f1tc0Noo3RBkLbA4id29NCmwIgoAmNztu1ozAHjstgdkIY
 sJR+ZcHiyK2YaCcNGhoI+sJqQaZCvPGJljC/8B8DWtOdKhuoi3x6BXSBOc/onh+VCN/z
 Pb35RvBXLM+waZQ3x9oFrUQoDKoJaOERHFCLd4qL7VfQofo776mL9b3Qj7qOxqYVM6m0
 xzGXf7FzP6d9yTO0ywRlqXWxIDl3ITfjebDyHAhz4XgmDot7Dp/CVl1hROm0bUylgSSi
 53og==
X-Gm-Message-State: AOAM532Ng6ygpuStdGwYXMaqpparFnczh7ZlDEP6RNnCsc/rZ0BEeF0F
 2aGyP6KKZmPVg3yKHwO70ZdxlBEFj4zscFjX9EnqhQ==
X-Google-Smtp-Source: ABdhPJzztnQkvhh5GihkuFxqBTbrBXzsKk0XHofX48Y/UZrP2E9SNGr4u8aDsWPZdKVG06Pi2qymRWpMhJGnFpmCIwA=
X-Received: by 2002:aa7:c594:: with SMTP id g20mr3542517edq.146.1598027205221; 
 Fri, 21 Aug 2020 09:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200814150506.2070566-1-alistair.francis@wdc.com>
In-Reply-To: <20200814150506.2070566-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Aug 2020 17:26:34 +0100
Message-ID: <CAFEAcA9RqhUM+jXqVhTvJjAtqe98zgKmT+ek_9ivCD0466Wh+Q@mail.gmail.com>
Subject: Re: [PULL v2 00/20] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Aug 2020 at 16:18, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit d0ed6a69d399ae193959225cdeaa9382746c91cc:
>
>   Update version for v5.1.0 release (2020-08-11 17:07:03 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20200814
>
> for you to fetch changes up to f57d45853ead8f3ff2c295a6b93b386b56396020:
>
>   hw/intc: ibex_plic: Honour source priorities (2020-08-13 14:20:03 -0700)
>
> ----------------------------------------------------------------
> The first RISC-V PR for the 5.2 window.
>
> This includes:
>  - NaNBox fixes
>  - Vector extension improvements
>  - a L2 cache controller
>  - PMP fixes
>  - Upgrade to OpenSBI v0.8 and the generic platform
>  - Fixes for the Ibex PLIC
>
Hi; this conflicts with the meson buildsystem merge, I'm
afraid -- can you rebase and resend, please?

thanks
-- PMM

