Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6874C1BC7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 20:15:49 +0100 (CET)
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMx75-0002YV-Ix
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 14:15:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMx52-0001rX-AJ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 14:13:40 -0500
Received: from [2607:f8b0:4864:20::62a] (port=43618
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMx50-0003gP-OJ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 14:13:39 -0500
Received: by mail-pl1-x62a.google.com with SMTP id x11so19628721pll.10
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 11:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=+bvJDveEhuGAMEPrz5SxT8MYvwvuqQwQpm4xTBEgzhw=;
 b=Q03BnmtHLNwplLfedUzAbr6U75k83RHSkqCJsMQD91p8/absYEMU/TQiDPBYpBjnpv
 GC6AwGd0DmOS/cR10Ozqz/yL1mQuJ51Q7qxw/7sRnvAyncZct1cTSkJ1MgA5m0Tk9Vd1
 set0BlHtrldNY4vPWi0z+BIUpHwXOdRvkoDcu5w54LIhjOxTuJ08OD65fY6vMDHzi7Lm
 rTvc5Ivlc+QFvjWCI2qtFpz83iXTtdeQkzLnol5JGL3871g/9h1LqfYrYCb8FGRVgNd1
 VaNYAiUr8iKvak8w4UFXHzOKxn9enht1jcljJbyF87nhhvTwU88vUK9onrohfg3x6Mwc
 XpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+bvJDveEhuGAMEPrz5SxT8MYvwvuqQwQpm4xTBEgzhw=;
 b=KfMSDIVBYZlx81Oj5kHIpd8zjqWwzXFd4/d1w1yRv3ySekSMfsyUioC4m3kl7zxhoa
 4NnWAj7+KRA29nFslqBhCGl/UkFz3OjI9l0OrDFGVzTl8eKkE4cfnmlrqbdlTDlFEpyP
 LupStEW+cMviSZT6qNwLmikOtGYFTO+QwHhq+wQgvYRmWc2vMej0VRyty3ivpTexx5Ih
 8R0igMWqhwpiZaiJAu8a8g3rV+zQS0hJ7OKIe+9yruNcTgNOUUJSbFqMZDrpx4EmyRzO
 1nq4HiPE8AN8BtcM830owTahFj7OMoqYkYgksoum3s9NasntvBDJSR7txuBHZyNZ1mev
 pNrw==
X-Gm-Message-State: AOAM530nzDVpCqNoall582OENFHYpwXplSYhGQCcNZDJszjOtcqtjIhG
 91WqYc4IVqfHtqM/sbwUaFYrPQ==
X-Google-Smtp-Source: ABdhPJydS7C4LmnjzNhlyDoJ6tRBuEFTud3qCbAlT/Y6cDJrsHFNd0x/L386pr1NI5CrF24Uk9JLTg==
X-Received: by 2002:a17:90a:ba8a:b0:1bc:4d77:56b8 with SMTP id
 t10-20020a17090aba8a00b001bc4d7756b8mr817842pjr.216.1645643616914; 
 Wed, 23 Feb 2022 11:13:36 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id l14sm224203pjz.32.2022.02.23.11.13.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 11:13:36 -0800 (PST)
Message-ID: <3c7903dd-fc50-3b05-8419-0f5011c5e82c@linaro.org>
Date: Wed, 23 Feb 2022 09:13:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Fix a potential Use-after-free bug in
 handle_simd_shift_fpint_conv() (v6.2.0).
Content-Language: en-US
To: wliang@stu.xidian.edu.cn, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <5ec4ffe1.25b2.17f27005362.Coremail.wliang@stu.xidian.edu.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <5ec4ffe1.25b2.17f27005362.Coremail.wliang@stu.xidian.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/22 04:33, wliang@stu.xidian.edu.cn wrote:
> 
> Hi all,
> 
> I find a potential Use-after-free bug in QEMU 6.2.0, which is in 
> handle_simd_shift_fpint_conv()(./target/arm/translate-a64.c).
> 
> At line 9048, a variable 'tcg_fpstatus' is freed by invoking tcg_temp_free_ptr(). However, 
> at line 9050, the variable 'tcg_fpstatus' is subsequently use as the 3rd parameter of the 
> function gen_helper_set_rmode. This may result in a use-after-free bug.
> 
> 
> 9048    tcg_temp_free_ptr(tcg_fpstatus);
> 9049    tcg_temp_free_i32(tcg_shift);
> 9050    gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
> 
> 
> I believe the bug can be fixed by invoking the gen_helper_set_rmode() before 
> 'tcg_fpstatus' being freed by the tcg_temp_free_ptr().
> 
> 
>   ---    tcg_temp_free_ptr(tcg_fpstatus);
> 9049    tcg_temp_free_i32(tcg_shift);
> 9050    gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
>   +++    tcg_temp_free_ptr(tcg_fpstatus);
> 
> I'm looking forward to your confirmation.

The fix is correct.  We just need the submission formatted properly, with your 
Signed-off-by tag.  When re-formatting, you can add my

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

