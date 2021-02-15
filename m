Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E0C31B3F9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 02:36:01 +0100 (CET)
Received: from localhost ([::1]:54990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBSnw-00054K-BU
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 20:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBSmO-0004bb-73
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 20:34:24 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:56076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBSmM-0001FT-II
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 20:34:23 -0500
Received: by mail-pj1-x102d.google.com with SMTP id cv23so2791679pjb.5
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 17:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a0qjX7q0JNdJMuPH6q4JPwYDAl+4Ljydqw7vcwITkoc=;
 b=Cl6BOZX0OaVH0w66OaATvHZZ64CtMzniUKkHLd6nvCGu120GEVBZOQn5tcCf3ZM4D1
 aF+v5g3R6pYroqmMVLVehw7GTg3sTRyoNkkzUQVWq3D317QVKif7CElwr9aCsy6yojKy
 VM1HaWuvqJtYBq9STfppDe1ndUPd5I10YgIyPcS0GEmhfbIWiUhhQDwW3MDcX7ta7gaX
 HIGhRrk9Egr01drTSAjRmiDLkIEASx4wDrQ+y3UEXypw/QLgAAHpdeFvPXeGPsA4lwkc
 Iwy8XOLyhYp6zlMDPwhxzFNJJeHmL0JNEY2sahbAP2/IGDJjdcGxRZtJ39QYw+0tgnli
 +0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a0qjX7q0JNdJMuPH6q4JPwYDAl+4Ljydqw7vcwITkoc=;
 b=h2RXpGFvuRNeaw+bekapKtC+Q8hX96NHZjs2Syie2QhRQmRftAyhSvuHCo8r+McjAV
 gSIduFPExDeqr+zwgViJJXW5LUT42bFAedlPARqCWqbsi9nQMbfnu4aXogeSJ87ZGf4b
 7YAV9lX8VgXw6adO1eRu1IEYI1U9T666fCSdHEilCTp+Q02iwzaaAB49eMWyx2D64mdK
 wYbYI1iAVq/Cp9yU7t1Jd4g0ddUcBEzQz9fIjDaGjEVfloa1BSs/jwZJ/ma/hCb3SLPs
 PQE9Hf4nAA1DfBuP0ui0I8P3d5KQECdg6+sTts4MyWknEUUK6h/dOPaB70g3+5ua416w
 9VaQ==
X-Gm-Message-State: AOAM532LkzpaionAeLXpdWVUENAhr0Lz51LMEUx/9vP3F7VkgHf2gofq
 8NCP9EPJKT8q5rBwFz4xBnO8SA==
X-Google-Smtp-Source: ABdhPJzpRLGTAIwT8o1VvAh7Q4Bhe2flbh1kwhoD6rijX6GNGsvArBoRz4lRc/3wtIuv5VpUcXQmzw==
X-Received: by 2002:a17:902:9341:b029:e1:7b4e:57a8 with SMTP id
 g1-20020a1709029341b02900e17b4e57a8mr13013051plp.34.1613352860935; 
 Sun, 14 Feb 2021 17:34:20 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 o14sm17376183pgr.44.2021.02.14.17.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 17:34:20 -0800 (PST)
Subject: Re: [RFC PATCH 10/10] target/hexagon: import additional tests
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210211215051.2102435-1-ale.qemu@rev.ng>
 <20210211215051.2102435-11-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dcda4e43-6043-3235-6d84-d646a9fc98c6@linaro.org>
Date: Sun, 14 Feb 2021 17:34:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210211215051.2102435-11-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: babush@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com, nizzo@rev.ng,
 Alessandro Di Federico <ale@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 1:50 PM, Alessandro Di Federico via wrote:
> +    {
> +        r1=#0
> +        r2=#0
> +    }
> +    {
> +        r3=add(r2,r3)
> +    }

Typo r3?  It's uninitialized.

r~

