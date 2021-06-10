Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D823A2DEC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:19:48 +0200 (CEST)
Received: from localhost ([::1]:51284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLX9-0005aQ-QZ
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrLW9-0004fb-AS
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:18:45 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrLW7-00081I-Bf
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:18:45 -0400
Received: by mail-pg1-x535.google.com with SMTP id l1so22728485pgm.1
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pykFNS7greJjkngIw6+Jdd+0wYP112UnX6arHFcrJT4=;
 b=hzpd1r6g6Tp/5SZRi8biUPJ5UgHh0ITvIfvsIsOh/4Yl2Ni7hrEnXUgClPY7SvIAgY
 UN1Kbnp81qL9VsASekZ6XKynHcXvIID2tmysCqdKlL95w1aMzpGuMinltYXzBsVQs7Ed
 C+UewBtUTIv30jgOasklg562ssbdsN1ScxMe9HqkDVseQdfe4ZMl9vwVX2Mym4At9kvr
 NuboVlFdQouvvtDtT8efLvc+jDrHZjPPIhYcby7coE9naGaQzALglLIqmkdYC8GD77Cn
 s2t+1bGlFSKx2STfOEwLJvAUQ2XrtluESF4DJq4Cqn5rcu+rACOqOxqpQtA6F8t6gxv0
 enQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pykFNS7greJjkngIw6+Jdd+0wYP112UnX6arHFcrJT4=;
 b=gM0VP5hyRVKDAfD9NrpEmMcTh8jeG6oKLZO3+IDFcifw2jazxAwMqm5RucsQLa9QLD
 qsts8+yi/ETgt+ZbByhL1d9Tv2EWMRFesqX83+g0JoRDy0K6ZNEeiY0ylLFCO1esHKYZ
 iqyTTxkP6FkuTOXm5MdVEGqnmWOVzbwBnR+T7vbom+M/uE90cbkx6ejMnZvrueIFdZ1A
 YFphJL04ZlHQuPea0idAYxbE0ItoGY2KveUusuB4CLRsnZBO1kLtXG7D9KFkrFPjV2Tj
 XyXsIIN5ukoB6sG5AcmGCfcinwuLLqiLet1vxquf5BUItUCBxHipTLGO6Bm/uAyM2cGl
 FrCQ==
X-Gm-Message-State: AOAM531oC47PF/qmksvlXeM2aMFo3X5Fh9/MCFx7y3SsZfe2HmbIBg/a
 M/n29Ryz+K2tqjhIfIwuRMYQ9WInR0z00A==
X-Google-Smtp-Source: ABdhPJzPZjZM6Clnj5mTOHAmC+Mjsg6Q6cQT+LUr9Yndptml682NsEB2IU/yeVkyxGWaEf1wLPflNA==
X-Received: by 2002:a63:131f:: with SMTP id i31mr5185747pgl.19.1623334721892; 
 Thu, 10 Jun 2021 07:18:41 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 92sm6644163pjo.28.2021.06.10.07.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:18:41 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Provide and use H8 and H1_8 macros
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210610132505.5827-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f4d2897d-49fc-e079-2018-b03100422147@linaro.org>
Date: Thu, 10 Jun 2021 07:18:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610132505.5827-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 6/10/21 6:25 AM, Peter Maydell wrote:
> Currently we provide Hn and H1_n macros for accessing the correct
> data within arrays of vector elements of size 1, 2 and 4, accounting
> for host endianness.  We don't provide any macros for elements of
> size 8 because there the host endianness doesn't matter.  However,
> this does result in awkwardness where we need to pass empty arguments
> to macros, because checkpatch complains about them.  The empty
> argument is a little confusing for humans to read as well.
> 
> Add H8() and H1_8() macros and use them where we were previously
> passing empty arguments to macros.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This is a big patch but it was basically search-n-replaced
> (not entirely automatedly, but conveniently most of the SVE
> H1_8 locations were ",     ,").
> 
> SVE ZIP, UZP, TRN also have Int128 forms. I haven't attempted
> to provide macros for that case.
> ---
>   target/arm/vec_internal.h |   8 +-
>   target/arm/sve_helper.c   | 258 +++++++++++++++++++-------------------
>   target/arm/vec_helper.c   |  14 +--
>   3 files changed, 143 insertions(+), 137 deletions(-)

Thanks for this,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

