Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7913238F2BA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:06:46 +0200 (CEST)
Received: from localhost ([::1]:51272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEyT-00044J-6l
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llEut-0000ig-9Z
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:03:03 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llEur-0002CB-Ci
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:03:03 -0400
Received: by mail-ej1-x636.google.com with SMTP id i7so25309321ejc.5
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1GmCntX4xRc2kWFN5ChHRatJqaolf3d1wtkytRp7UXA=;
 b=v4FyqCjTJ/HEZBHhKUTnF2bPuCiAma+OtcNGbpLFo8ePv5YCCemGoc5dsMjIJzszop
 XW4yO7/TCq9+3q1aWMAEz9GdcmteeIztQC+RJmoMJ8POlGExJ4tfarcoE+c1S7oSO0WZ
 IczmeFD/ehk66J2SrTmMNhSmr0DOfrDQIvWnze2Gn5XTrpvj2tdx099wRBxk3kk9eRgV
 iBfvqKscjlBzGI8idvSwFZp+LqGR9Q4R0PZebeYIhEGB6LH0uMfGwkKBgMat0DMZN/6s
 2n9O937BiIPMro9hMSYV2nn2rYTSWkHkz/VeqnezFe/jpoD3KI7RdWoDAtuStjjQ6yPw
 o87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1GmCntX4xRc2kWFN5ChHRatJqaolf3d1wtkytRp7UXA=;
 b=kXb/+OVQm9e599jiGEgUaVkMIpIX6i26+MIKSFBQTUtg7hkv4o8kqbkhHMyNxh1SCb
 NDUdbJ4AWSfdIyHg6dvTJS2biN6C8Qg7XbD0herTP0wviJ064bUr7hYQjKff6pOc016M
 vZ8PS+qxsQJMOsenBUG6/+PsmxHKed0cwmEakEvr4a6gBn85zWgsm1jiAEE6cF7ROyzy
 /v6qHITs1FYR2QOk6NExmrGwZOTdK6dIW7qmdGEYl2NtW7xlBapLH3kPjfAUjq8eCLov
 Jgjz/BxLMoc7S4jzQpA9PajI0bpRS0gB0flUN2Tb+IIF6XDhTunqmAPThLhyzyn2LU4N
 2JWw==
X-Gm-Message-State: AOAM530PcyN+wVJNfvespEX4T/b/7TYYauS8JmwOJk+A6eNY2L3F2Uj8
 zTdLUaS3oH8woOnqjMck5jW1gA6Akjwda4a720lOIV17G6fZAA==
X-Google-Smtp-Source: ABdhPJyxOOUFeu1+SPurGh3RZAHwROmx/OmJAkdcczKnc/tw5qTnrGti+47BM643ZTT1EfpcdSwGBqWRXbhQsMkGd/A=
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr24997377ejb.250.1621879379590; 
 Mon, 24 May 2021 11:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210524164131.383778-1-pbonzini@redhat.com>
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 May 2021 19:02:37 +0100
Message-ID: <CAFEAcA8anKnOFrN94=CAoYu915jyE5rMR8tS5GAdEGWU4Eqa0g@mail.gmail.com>
Subject: Re: [PULL 00/28] Misc patches for 2021-05-24
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 May 2021 at 17:54, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 371ebfe28600fc5a435504b841cd401208a68f07:
>
>   Merge remote-tracking branch 'remotes/xtensa/tags/20210521-xtensa' into staging (2021-05-24 12:00:33 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to b304cc9bc94950a4b9100634db6dc3c885f99216:
>
>   gitlab-ci: use --meson=git for CFI jobs (2021-05-24 18:39:02 +0200)
>
> ----------------------------------------------------------------
> * submodule cleanups (Philippe, myself)
> * tiny step towards a usable preconfig mode (myself)
> * Kconfig and LOCK_GUARD cleanups (philippe)
> * new x86 CPUID feature (Yang Zhong)
> * "-object qtest" support (myself)
> * Dirty ring support for KVM (Peter)
> * Fixes for 6.0 command line parsing breakage (myself)
> * Fix for macOS 11.3 SDK (Katsuhiro)
>
> ----------------------------------------------------------------
> Ali Shirvani via (1):
>       doc: Add notes about -mon option mode=control argument.

ERROR: pull request includes commits attributed to list

thanks
-- PMM

