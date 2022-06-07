Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30FB53F8EF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 10:58:47 +0200 (CEST)
Received: from localhost ([::1]:48140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyV31-0003bQ-17
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 04:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUtc-0005Pv-7z
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:49:04 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:46648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUta-0003Nv-Jx
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:49:03 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id r82so29940709ybc.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/DbeVl4nC5VRE2nOshMbHkeFj02vSvPL4ibgVAjbCtM=;
 b=Ljx+mHu2iny6v5P3aJEQVYMBXVn7PG9C4qP8aTtcnNA4R8JZJwZ1HMhqBJHo2iJ2cy
 PvvHB3ocnDQ3IQYPZVjYrZXJ6Vtio8eO7dMaA7oINp/ixj5vftPRdRfF0Dq2beEteUxD
 x9vHK8JJMqrtLQlyWaOYirY0sOcm8dOSDIUBpz7VnR3xZKk1rbrOsFo8O0TTnRPSXAZT
 nWBSSgei2vJB0O7TDtR7ACG5L/t3sNEmJguwYGMZkJEk2Oc5VxYWg/gXmBrBLl3a8XPS
 pjYuV8yZ/vF/v/+hAQ4tosuhhPXG2Pi+3ukSPAqG9sWDSExN+ODHFWAJ6yV6IdF9i/a+
 3Awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/DbeVl4nC5VRE2nOshMbHkeFj02vSvPL4ibgVAjbCtM=;
 b=6kC1jln5M+3DZRcPaadBElb87X6D1hzFOh8RYolszOQCdZjCW0S1HgrutfnPNAecG+
 UQIVvF2UlGijJFinPlbBMCmL/ZPNGHtf3kVCaO/boUzaH3ulHkjiTEGfEMq+e4OZmEcz
 Gsj5hOyJpv0wT6Dh037X1kaZWqY9OoWMawIX6APAp64PNoZgF3xgUX74CPaerx8iT0M1
 fYkM3f71dQMW1up9JVhdxg4uJZ1ijD/fkAo+lmT0jznKcvimTsSyPYl4cj1QiqZE/Tuh
 7Kv5xnsOKWeagSgjWwwSUe21q/CR+FoW8ZrrSZtDPgJ4P/AqyDbr4dyHpdBn2PbiXrUW
 cdaQ==
X-Gm-Message-State: AOAM533uFt1wVYUQgwR4zi5lr8f1OnArVfXtEg8FYeCIe0RkcYM+nblm
 Yt2S3ja6vQ0kxe6eVmknNP/Z4HASGLPJBpWb7upL+Q==
X-Google-Smtp-Source: ABdhPJwS2HZVmSKRcM7yNM3BV51tf0nANf5ONHQriP2MiXey985nawPqiHTJ4y1M8+KKQBUeS44itomkHIi+lVMxBmI=
X-Received: by 2002:a25:b94:0:b0:663:e6e7:c5 with SMTP id
 142-20020a250b94000000b00663e6e700c5mr697163ybl.85.1654591741699; 
 Tue, 07 Jun 2022 01:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-34-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 09:48:51 +0100
Message-ID: <CAFEAcA8j7sPr9J0N_R2BVTuYwfD5Q0tJtSSDKw5udPhtriA9yQ@mail.gmail.com>
Subject: Re: [PATCH 33/71] target/arm: Generalize cpu_arm_{get,set}_vq
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Thu, 2 Jun 2022 at 23:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from cpu_arm_{get,set}_sve_vq, and take the
> ARMVQMap as the opaque parameter.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

