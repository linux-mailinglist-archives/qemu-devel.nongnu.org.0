Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF93A4C5F9C
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:55:11 +0100 (CET)
Received: from localhost ([::1]:52326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSRa-0007Sp-Pl
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:55:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOSQR-0006Gm-Hq
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:53:59 -0500
Received: from [2607:f8b0:4864:20::1036] (port=38502
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOSQQ-00008d-9J
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:53:59 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so8775030pjb.3
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=BqYOnVw0i6wFwdM0qKXfOWQuhWlwLLPAxf0nPcMYoAo=;
 b=AeP9hBF8o35cIF98klGkVg+4uT29Lkcp3xMsouWS1r3CdmjdikNqcjjBFWznFiC4js
 DXM1cdpJQu8BSEOHqV1Bx5i5LoHrXsFIDLBVqZ3qXkNk34k1JopChR6wnk0S2AXlUeqX
 lDC6kVYHpXoEWBBc7vta69vergMnz7jzMgZTWaQBAq80bj3LCcOkF00RyhLuDZZ8DTMz
 F4rxMfLwwuT4FtTy4rziTCVitcMbI2wEbaCCRJ5ZHuYqZiYiR7y9SZg/ia5HzS04DJuG
 oJNiXeh56+K2iPGlpfF8cEdFVVO3g49FF2Lb22fTsq7+prBH5xeJD2PWeYtWw8RTOHee
 92xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BqYOnVw0i6wFwdM0qKXfOWQuhWlwLLPAxf0nPcMYoAo=;
 b=arY7cm1GxN4ryn48uouTGDI81UqTZZ0ra5Yh1NXKWeFKRjWDC31A+/It52ogyW3JEh
 i2fQUTWNBJNxtqOKL2ote65kHQ9H2wGOo5+yRwTzNc3t+2IERLD7ySBrAmTSZyiNt6BO
 t0pSSJ3wbcHKMNxbFFaTx6iFj2y8xeMwSW42Bcnso4eRuVCBinAWuslJqLGaBLoivuDY
 +om4+ylzoGwRiGfqzBomusEQmUkNiC26t3mEcBFHQJNIW9DuzMMDTDfmuum4rZ9v5zkI
 CsJvB7oT2JZP2I2olaUF6tPNKJpd/PDzOWJAk5fDMPFQPo0a8PLYoqpZ219VaxXRAxpY
 FFig==
X-Gm-Message-State: AOAM530zNfSQOHEoxOkEe3lKp69Asevqg+8b3Cx3ULwGwK9EHEdLn61t
 sXEZbYXBfOJRPezC9DKqggQ=
X-Google-Smtp-Source: ABdhPJxHZREqLhyWjo5iTMyBP255y4uBiEaqW49/11jVW9W1r0B/D8xp5TjhPQt0d1JGOTmBXl/DrQ==
X-Received: by 2002:a17:90a:8911:b0:1bd:395e:40e5 with SMTP id
 u17-20020a17090a891100b001bd395e40e5mr4243676pjn.121.1646002436705; 
 Sun, 27 Feb 2022 14:53:56 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 q13-20020aa7960d000000b004f13804c100sm10077050pfg.165.2022.02.27.14.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:53:56 -0800 (PST)
Message-ID: <edc0490d-5746-bcb8-cf41-b5f3275c7236@gmail.com>
Date: Sun, 27 Feb 2022 23:53:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] tcg/tci: Use tcg_out_ldst in tcg_out_st
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220226015502.534801-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220226015502.534801-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/2/22 02:55, Richard Henderson wrote:
> The tcg_out_ldst helper will handle out-of-range offsets.
> We haven't actually encountered any, since we haven't run
> across the assert within tcg_out_op_rrs, but an out-of-range
> offset would not be impossible in future.
> 
> Fixes: 65089889183 ("tcg/tci: Change encoding to uint32_t units")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tci/tcg-target.c.inc | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

