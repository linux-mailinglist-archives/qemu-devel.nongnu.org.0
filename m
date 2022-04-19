Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F318506806
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:49:52 +0200 (CEST)
Received: from localhost ([::1]:56896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkUZ-0005Pm-Ld
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ngkDh-0003jM-50
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:32:25 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:40768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ngkDf-0003BX-E2
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:32:24 -0400
Received: by mail-yb1-xb32.google.com with SMTP id i20so29941164ybj.7
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q4W+VS1M06kXGGKVW9WUpYyM2NLE+9SNr54DDXSWN5Q=;
 b=YyUiSZVWsK9fhiqctGx4Rdpm17Uz1PlrJ1cxO4GP5MU3Fv8+6zs1fghHv9syZ8d5bH
 as1ARQMkaWd9+RbQJkJi7/gZ0W+4aOGVqC9YmgpDlY6ENRdehKG69QbA08ZknQiAtUP1
 PSNc3XznztCs2rhFAubrP/2aznnjzQ6GsfzdPJ+8zvh+1cVJBq9fS9mkrrnr5xrViQGp
 rkiXJF1Wwztu3A1ztkgPyO5bv0oSXnUVch5CedaL18z+VlP2O0026zWTE74gLbWGQ4kQ
 RGVjp5zGcIugJMHvt1Fu+3fEWo97Xz09gxiHuGBaaNwAEgZ19o0/ME9UGXxhDBlnXCq9
 zoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q4W+VS1M06kXGGKVW9WUpYyM2NLE+9SNr54DDXSWN5Q=;
 b=QXzwAYuSnVGIgS3FpCkMmOJDOTDZzJo2xUi86da2+BMr02SNNCcsO+jgsp321WT5lZ
 8sCrRqjoyN9x26wYWlKAuARufeofnuXXIWQ2XhG1Dw76piULsI2U8l0+anlNXE1eyPkE
 7AFGay996CRWqDfaMtmfC9EQbnapsbm5/8huLTxHt8yZ/fVGmXq8SslcwaGdfnv0KlTC
 +QYw3TnF/TZvu2OLukDCWt+Fh6mPYxrtVQooLL9H74vTCjpmMm0lyowyIerkFwSWCljR
 lKOfQrimF21W+1460vIXytX/JnrMGPSve+fqM3+fGeGCplffxAB9ZhcWaqfJ2HvF7gMt
 Brnw==
X-Gm-Message-State: AOAM532trWKRqyaes1qtI0eFZBJpjy9tmDz9OH38DRZyDlSyS7gERox0
 FKpcRQDwsyPNqVyiFQQqFqK/pwbmQ7I2iUmsbnmRCw==
X-Google-Smtp-Source: ABdhPJzMbAQv5d4hMRoT6WbntqGTC8igpq4qf3LsoKaijHvCy1A5yNkCM6skJ72XkCzoQsuHtDzhe5y523N21m9A+WQ=
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr567182ybs.39.1650360742352; Tue, 19 Apr
 2022 02:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220419055109.142788-1-pbonzini@redhat.com>
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Apr 2022 10:32:11 +0100
Message-ID: <CAFEAcA-T252NdN9yJdyy=HLBbRQ+dQZaAOuoMB8uQ4wVP+Gwvw@mail.gmail.com>
Subject: Re: [PULL for-7.1 00/53] Misc pull request for QEMU 7.1
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Apr 2022 at 07:09, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit f53faa70bb63cc0c8e2fd0752b7ad2c8a79616ba:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-04-05 16:14:28 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to c9e28ae7972a10fdf09b7ebd8046840d1101b8ce:
>
>   target/i386: Remove unused XMMReg, YMMReg types and CPUState fields (2022-04-13 19:00:31 +0200)
>
> ----------------------------------------------------------------
> * Add cpu0-id to query-sev-capabilities
> * whpx support for breakpoints and stepping
> * initial support for Hyper-V Synthetic Debugging
> * use monotonic clock for QemuCond and QemuSemaphore
> * Remove qemu-common.h include from most units and lots of other clenaups
> * do not include headers for all virtio devices in virtio-ccw.h

7.0 hasn't been tagged yet... I'll keep this in my list to process,
but I'm not really a fan of people jumping the gun with pullreqs for
the next release before the current one is out of the door.

-- PMM

