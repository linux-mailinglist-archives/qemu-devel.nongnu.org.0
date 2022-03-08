Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8B44D13E3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 10:53:07 +0100 (CET)
Received: from localhost ([::1]:53334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWWg-0007OJ-6h
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 04:53:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWTF-00058I-5J
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:49:33 -0500
Received: from [2607:f8b0:4864:20::b32] (port=44936
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWTD-0004fi-R1
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:49:32 -0500
Received: by mail-yb1-xb32.google.com with SMTP id u61so36588740ybi.11
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 01:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FaiYas2TRZ/jb6s1hYLda6lER5Z1a4auwJI2+cR77Co=;
 b=W7NWFmz/lproMmQ/bt50HyMx6aOrHDtpudSrDA1eZdfQ0JmcWvQwEcLyCT8ktRXXnn
 fzZhkucHzTUIy1GZT3zi0U7iFlxLpF+ChimHxA3u0np6wLEksLX9n9tOuxsY2o+jqvK0
 Ns4BpkEWjvHapbaZFazEuPOnHhNBwW7LMG4FHj0g2wP/GtXV/yJpnAOtK/kiNMVnJyGT
 pY6tybrds2l9f4cGWpEjFrM+SVcv2FZeMVkWvHDijsSOqSBNGym+JzMnK23zZYJIoSdF
 3B/W83WKQVJIvyrj9Z8XjeO8Ymq9t/Fvn+lcTTUO+nEVTdmcZuM6tMGvFNWxUVSXNy1s
 Vpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FaiYas2TRZ/jb6s1hYLda6lER5Z1a4auwJI2+cR77Co=;
 b=z0wYi/T/YTeTz/1Y+5oQZu3Le7LovT42bju+93U612XkBP9h9vP2XKRmqJ0GCuWRh/
 KM9X/z6BODMSBuientcCRekeMTTjekWOUAisBtZRw+XUHsMl46e2VQyN8Q1AFiTAxUDp
 qOI8tI9d6BlWNpLuOOtKoDsAmzNFYvoRmZCTHT7FvVQXFxtjUA0rA3zp3kMwSE3v1hpf
 TGJW0Lf9fJUrvut1O3YG6/veXlFoAUVkldw5qeK09c7qCKJJLiBsbRptK4BGffYRL6Ay
 usCvnSMw0+KT+QemwCgN7WAJUV7+cOvN1VZbGWrhorVr3WF6Uy3wXurDFMeQWB2vKy5K
 2y6w==
X-Gm-Message-State: AOAM530CcINi3fsJ8hVkPuILb4ZtynrfdnkMHLN0exkY7dP9qDgdTd/y
 skJwGuOa0kLAvozyEdCrK9QaUGI1wtnhLPSz2fS8GQ==
X-Google-Smtp-Source: ABdhPJyQ/V/MmorYXdDBnAfCQ1H95nnBCSLK9FID+dZKp56imjsHLmUE2FfqqlCVCuPZrrZjJ/hzGw9TcOun4OlDMKM=
X-Received: by 2002:a25:32c6:0:b0:629:130:a037 with SMTP id
 y189-20020a2532c6000000b006290130a037mr11211792yby.193.1646732970864; Tue, 08
 Mar 2022 01:49:30 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-4-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 09:49:19 +0000
Message-ID: <CAFEAcA9YwNJwjMWUXXSbFD+SSYHz0mF_L-bGPYy6w+RNnCtv4w@mail.gmail.com>
Subject: Re: [PATCH v4 03/33] target/nios2: Add NUM_GP_REGS and NUM_CP_REGS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Amir Gonnen <amir.gonnen@neuroblade.ai>
>
> Split NUM_CORE_REGS into components that can be used elsewhere.
>
> Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
> Message-Id: <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
> [rth: Split out of a larger patch for shadow register sets.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

