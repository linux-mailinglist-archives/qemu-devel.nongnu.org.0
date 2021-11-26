Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF2345F283
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 17:54:17 +0100 (CET)
Received: from localhost ([::1]:58838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqeUK-0007DP-EE
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 11:54:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqeTD-00069g-4I
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:53:07 -0500
Received: from [2a00:1450:4864:20::32b] (port=36750
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqeTB-0005y4-EK
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:53:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso11140489wml.1
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 08:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H/c4Lfwu289fdqtW7jGN350pH2xZCNFAPPkgTLrF72g=;
 b=nUfL7tj6WuX8DqN3WbRiUYfikLpmq29JssEBwlYRnKQHgCmClIboRVgp2Ow8Uhxcjo
 9YdT1EDJHE8YXP8Lys/GhMrWVo01d5kVZ9m1/nJWKNAwfwSRIKDOr7PAC6c08vskkeks
 7A/WmY4z1W8doNkDFswQmATKv33l9bif5V748Q8ckXci3hCZ2E4OBiof1T7J+kaKKNva
 dmA/dcR9ojMfZ5XXjDrXZ0jovCXcEv2fzYjVEj/0Xc9hFfHjNDLvCMv9ip8ledrmUJIM
 WoIsPPkyH/KRnVF31Dc2yv/xVyOFJ10e4bjrGkhN2a9q3/2IDZZetl/qGx2hN5j4dB+M
 qXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H/c4Lfwu289fdqtW7jGN350pH2xZCNFAPPkgTLrF72g=;
 b=ylyiNG5ubRDismIBIR1alJOvrMSBYJlkIeEaLKMnhYKo/4XcLhIAHDZ0+9Sg2fCtAv
 2FjTWL9bn86rAOvi85cs0OJGf2YLApbjeElU1Cd1l9iHIvy1W/QggJhwlwPnpRdOG1Ik
 T9XUEeP5fm8/bgmNK0Ff8NqCfflZMPUCyfRncJYWBke9Wb1fMeWd26AZ+6F6HUSg2b3i
 +793VNV8MXj44KOPZLrSisk66sScHLKvFWGeEhUBofRe+WGIzC9SBuhkrJR54i8TNZVb
 zWm1h5QGPxj7zi00HaJ1UJAzBNceRA5nwa72IRnEzFApCN632EA6bp762fdgXtP1TMr9
 5Nbg==
X-Gm-Message-State: AOAM532QEW/Vfw6JaembjhmSMvLozhZpx0f11iYCf48mZMJbddgEk2we
 CyNZREogNU3RbYAP+/FP8bppIt2Tjl7ihPksAYCNeQ==
X-Google-Smtp-Source: ABdhPJwP9eqrWt39so7h6rCQcnLsCq7Vs+FrhosaCd1wSYVF2hFlnoTgYlpwoLi+/s/8IqV80bdOL4xQJeWLid6/gHc=
X-Received: by 2002:a05:600c:22d0:: with SMTP id
 16mr16785796wmg.37.1637945583837; 
 Fri, 26 Nov 2021 08:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20211123122859.22452-1-agraf@csgraf.de>
 <CAFEAcA9ceorf5YK+yKS8KGfHPgFDTxWkLyfva0NDmkrHV5zz2A@mail.gmail.com>
 <5c36aaa3-158b-815f-3e71-badfe2d12632@csgraf.de>
In-Reply-To: <5c36aaa3-158b-815f-3e71-badfe2d12632@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Nov 2021 16:52:52 +0000
Message-ID: <CAFEAcA8Mb7tFw4pvG3td4G2w83Q-O6RP2X102b5CHp-PhFzJ+Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Extend nested and mte checks to hvf
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 saar amar <saaramar5@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Nov 2021 at 14:00, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 23.11.21 13:34, Peter Maydell wrote:
> > On Tue, 23 Nov 2021 at 12:29, Alexander Graf <agraf@csgraf.de> wrote:
> >> The virt machine has properties to enable MTE and Nested Virtualization
> >> support. However, its check to ensure the backing accel implementation
> >> supports it today only looks for KVM and bails out if it finds it.
> >>
> >> Extend the checks to HVF as well as it does not support either today.
> >>
> >> Reported-by: saar amar <saaramar5@gmail.com>
> >> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> > Without this check, what happens if you try to enable
> > both eg virtualization and hvf? Crash, unhelpful error
> > message, something else?
>
>
> The guest just never gets either feature enabled. No crash, no error
> message.

Thanks; I've added that info to the commit message and applied this
to target-arm.next for 6.2.

-- PMM

