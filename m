Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D84936C97C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 18:31:42 +0200 (CEST)
Received: from localhost ([::1]:57780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbQcf-0006Dp-5O
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 12:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQal-0005Vp-8O
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:29:43 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:51856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQai-0008S2-J6
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:29:43 -0400
Received: by mail-pj1-x1029.google.com with SMTP id lp8so1170121pjb.1
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 09:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=XyRJ4WH1gN00En8Vr6WYPxakoifvNj1+AqSyk4hj5Lw=;
 b=HroC0mYEDGfuP6KV2NLPPLYGWl3bBBE3zQYIVW7IJfOveYa4/EAiyf2VEhCOajimxm
 Kd/GD0Jdc2IYIx9QbvG6au9fAMhrDL1iU5LPuuON2XrKB4m/I3wlNukcMVx3Og7mqwhR
 PnfIS2BfBNaNMPOmkfVKBDCrCJgLDi3uqa23MKCQBxHB+a01nKgWs48tugpk7AV5baV1
 2+0fAi0drSeF7Fl1IpdTFLGnUduPbr8tvMUEXDMJ/5js+esul+7SC9oNqoo/VgGXPzwF
 63sFc7qBerKChVkTHLSt2zJcbm2M2lhWlD0pBIw0amtP8QRGc6ERI2d6GVnRLE6IUzwa
 2uXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XyRJ4WH1gN00En8Vr6WYPxakoifvNj1+AqSyk4hj5Lw=;
 b=OYYTvcIztIaQUkAH+mpu9neXeWmm+zJziIUGFBxIq8Y3LztyQOSMPaYMaYvRVTEzw1
 PmJFDm4TyY0WXr17snIoVu5F+J4UhKPHGwMP+RnyfPbNoWDZVIO35NzA3kwskJbE5j9v
 RF1TtFmVTVW84mOnkI9SowqYr4WjJl16tifwZeIj91+Ik7LXZGBkXc42cAv/naLRXQP4
 xBKJJePLgr5GRRSkuTEWWrKUQnPJw0m32aT6A4kgsDyBKZx9ZuQkSu3DOj/31PCxJJyx
 kURUPiiPDgHKy9VFjOI8g12K2NgEEwDTusCXbj7BOQpLRw4u4q3K7R+ObCMzNyhGyAMs
 hyKA==
X-Gm-Message-State: AOAM530hq++muBxefPUwUUXJzRMTRcO7GEPeVEpVUetO/4dsYMyKhZwu
 3VlbvvDrpM+xyqhZ7BNatbFLV2Y9BxG/RA==
X-Google-Smtp-Source: ABdhPJzlW8vbbYZCq+LTHQrIx6LsT/DEitbeFdaoOBvsIIWDHpSTvIqTENktP2qqi4kI7pWLhPTM1g==
X-Received: by 2002:a17:90a:4e81:: with SMTP id o1mr5586863pjh.7.1619540979131; 
 Tue, 27 Apr 2021 09:29:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h2sm249214pgr.37.2021.04.27.09.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 09:29:38 -0700 (PDT)
Subject: Re: [PATCH 01/13] target/arm: Move constant expanders to translate.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <90313af1-fd89-584f-88ae-1b8c99a827fb@linaro.org>
Date: Tue, 27 Apr 2021 09:29:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 9:07 AM, Peter Maydell wrote:
> Some of the constant expanders defined in translate.c are generically
> useful and will be used by the separate C files for VFP and Neon once
> they are created; move the expander definitions to translate.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.h | 24 ++++++++++++++++++++++++
>   target/arm/translate.c | 24 ------------------------
>   2 files changed, 24 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

