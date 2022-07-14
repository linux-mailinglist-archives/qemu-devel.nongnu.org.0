Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1A55752A2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:19:32 +0200 (CEST)
Received: from localhost ([::1]:43146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1Yq-0003zK-0C
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC13Z-0006rF-6i
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:47:13 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:35384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC13X-00013O-Fu
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:47:12 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31cac89d8d6so21461207b3.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 08:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IKL97nrbTa6KLd516NtLTIHmq+0jxxvdfOHJLFBc2Og=;
 b=qLFtWapteLLoIHag9DpgkVgwVf9bOAfbV/bYQAJ7IsyEoueNZJNsqLK2BBv47fqOC1
 Runor/5JeuX2APckjCDyZnfCf4MORhSPx8rzE8rdhmwXg51UXvbCcUSf4AyUGC/kj9Pj
 aKHS9GTLkEGl4EWk1qwFUCaFVMd9z6przwOIYI8KeWayddf0NcFF2K2gdLtZYbInt6dU
 t0DGpMqxJtgoDp4vbeJF+5t7Kv2IM+dneglClLTHlsy68Vizg/TVA+MG+gATpaxngT4+
 PgOWIQ8peQwhCC8eR0NYJ/z0GYdp+vwZL6x760bAc4up2H2sbKsROPVwzGoUfyRnXHDw
 qmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IKL97nrbTa6KLd516NtLTIHmq+0jxxvdfOHJLFBc2Og=;
 b=253IL8YRbBn/eAvYRkw3gEkAJ5iYCmEwFjF+FelETDdIZ68ufJrmsJZuzsfZMufTfe
 vLr8ZjY4R8bQf3xINccjkImGA2cB/zWVT12woMrA3a2RATmtDCe8lxLCff/TbesCBde1
 +/tNwUqoHpjLnDo64rhPRs5Wt+TLgjT3pjb3rI8Wm2FEa7FUbTg1boyM4d7YAkz80c7K
 vOqgqo5dtpXrLnYr7HQTvbcRmt/BobNdk8zNiRBqLFKEcWpVS3zhG67WWYjqAvYx8jOq
 /zryKMHOvOZTYMGHxDxOjSJdxC3hxzh/unyvQuZsOJfxxKYxxDZ8ykGkGHNRK2JVOuoR
 w4sA==
X-Gm-Message-State: AJIora94IU0Ky/1+68Ln1V26YSJ3mBbY/tspoHCTtkcnMAF4cnihLEST
 vK2a3rFiqAdsBbd7T0KcI6Swyfa4kvNgMupMZsoZMw==
X-Google-Smtp-Source: AGRyM1sFMKi+2B+NPkTdOzBvp5LprOANwnJop+tw1KgOUnqxCXhEX/87IxThev8IN9c1ei2C9wHQEePimHUijvUUuKU=
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr10861671ywe.455.1657813629035; Thu, 14
 Jul 2022 08:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220714145355.7225-1-quic_trohmel@quicinc.com>
 <20220714145355.7225-11-quic_trohmel@quicinc.com>
In-Reply-To: <20220714145355.7225-11-quic_trohmel@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 16:46:30 +0100
Message-ID: <CAFEAcA849X-NfvDYPPHD6a0YXwogJY-QXAuBKRPoZEdFa3+3rQ@mail.gmail.com>
Subject: Re: [PATCH 10/11] target/arm: Make SPSR_hyp accessible for Cortex-R52
To: Tobias Roehmel <quic_trohmel@quicinc.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jul 2022 at 15:54, Tobias Roehmel <quic_trohmel@quicinc.com> wro=
te:
>
> From: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
>
> The Cortex-R52 can access SPSR_hyp from hypervisor mode
> as discussed here: https://github.com/zephyrproject-rtos/zephyr/issues/47=
330

The v8R Supplement pseudocode aarch32/functions/system/SPSRaccessValid
says this is UNPREDICTABLE:

when '11110' // SPSR_hyp
    if !HaveEL(EL2) || mode !=3D M32_Monitor then UNPREDICTABLE;

so unless that's incorrect then I think QEMU is within its rights
to UNDEF this (and real hardware may choose to UNDEF or not).

I will enquire about whether there is a bug in the sample R52
startup code.

thanks
-- PMM

