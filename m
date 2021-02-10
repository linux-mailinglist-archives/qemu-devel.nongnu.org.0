Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8A63173A8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:49:37 +0100 (CET)
Received: from localhost ([::1]:39708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9yIi-0006RP-5H
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9y8r-0007Be-M8
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:39:25 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9y8o-0005Vq-Vn
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:39:25 -0500
Received: by mail-ej1-x62f.google.com with SMTP id p20so7006490ejb.6
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=STrixqFRgVyXehg02W0+bymMaMD6F3+Iupunf7V2Lz4=;
 b=fRDePXRW//Q/u+ViZXNKlVMkOBtBEGvxryRXW1uU6y2DalP6dkzDMLk5XCCkKB7T15
 yiMcJuzqyQ8lb8zxlFPhzf9S9fcXJ57bN/ejFT+SNbffFeu3f1Q2lsnpAEPGFewTqH5f
 pPdRZlcDcN3U5u2CIwWFcKB1uvoXMHhNKj9LPfZwmphTsVqXerV5GdFnA7ce56xqdIQU
 NjfS8TdMBVtTwTe0XyYvQDcW6XGVBTFXpb7hEsB+tlTiSNQUQbqGsIFXPQevn/de+/a0
 k8L85U/U1h9cHorzrt0VJO7k+SA0t60A24XMa5T1aDLwzHoyH3atdn/JSraEWNd1ZUSr
 BjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=STrixqFRgVyXehg02W0+bymMaMD6F3+Iupunf7V2Lz4=;
 b=Cn9/fDWjVAJc3H6Bb9iuIzQpFXPyn8QBOaSRbzobkoQI9XYhYnLOteL4SYAV/ZjcgD
 YCRirkw4QHxfAH0oIzy9pvMlPzVEXXKP7/AuwU1JTV26KpgQOfg1wA05v4UMKtU3jluu
 u3iPaAofaIHu7QLIbPcU30qjVybJepne6+uilR5Euh2ePl3mesN9PepiXOpw+ZeKncp3
 o3xnmDDOUAErfKGGSJVkqBJSV47Bg7kHqIIQh268yUj9eFryrCdPxHEC0mwd9i6Pvvkg
 zcM8Zqfclbel6rOzD3GaCwvlNhUhFDWOxNIYvzvXkLu657t5xAstqSSIqoC4EcIkp/WK
 7mvg==
X-Gm-Message-State: AOAM531xw50E/FZCOrfXKv8PjjtWB60fU5ALHM69ar+rflJ+P/HIUXiW
 MnjM9ZTicjOZjkKA71PhAOocmtIP7iYrGcUIBkIEOw==
X-Google-Smtp-Source: ABdhPJy1WI5y8zOVidSyOG+TnxCRDJ68gEZX8VB7eIRxQSzsNufYpfcHoZNR4GgnTbs8AwONvmHma1hKp+RRUlVSTSU=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr5216629ejh.85.1612996761210; 
 Wed, 10 Feb 2021 14:39:21 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-8-agraf@csgraf.de>
 <CAFEAcA_-4GYk_+jdczWE720-VH1CLcS+1jVB2LzG=bBBJc8w-g@mail.gmail.com>
 <298dcf49-1a99-9406-275f-b05c8befd13b@csgraf.de>
In-Reply-To: <298dcf49-1a99-9406-275f-b05c8befd13b@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Feb 2021 22:39:09 +0000
Message-ID: <CAFEAcA_ze+J7geayqgaV274anQubqiv56qan7wo8EkxZ14Nydw@mail.gmail.com>
Subject: Re: [PATCH v6 07/11] hvf: Add Apple Silicon support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 at 22:21, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 28.01.21 16:52, Peter Maydell wrote:
> > On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
> >> +            break;
> >> +        case EC_AA64_SMC:
> >> +            cpu_synchronize_state(cpu);
> >> +            if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
> >> +                arm_handle_psci_call(arm_cpu);
> > Have you checked that all the PSCI code really can cope
> > with being called from a non-TCG accelerator? (As an example
> > the CPU_SUSPEND implementation calls the TCG wfi helper...)
>
>
> I have not explicitly tried it, but I don't see why the TCG
> implementation of wfi should in principle break with hvf.

Because the TCG implementation of wfi is "set some state fields
and then longjump out to the TCG exec_cpu code-execution loop",
and hvf doesn't use that loop.

> >> +            } else {
> >> +                DPRINTF("unknown SMC! %016llx", env->xregs[0]);
> >> +                env->xregs[0] = -1;
> > This should inject an UNDEF exception into the guest. (Compare
> > the pre_smc helper in target/arm/op_helper.c for TCG.)
>
>
> That would break Windows, which is one of the main use cases for hvf
> support in QEMU.

Why is Windows making bogus SMC calls ?

thanks
-- PMM

