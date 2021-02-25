Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F51F3257F0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 21:49:03 +0100 (CET)
Received: from localhost ([::1]:50756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFNZG-0007t3-2g
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 15:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFNXF-0006c7-3g
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:46:57 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFNXA-0005Zv-BO
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:46:56 -0500
Received: by mail-pg1-x52b.google.com with SMTP id g4so4634117pgj.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 12:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5PkpeNoZaI1f+5ra1C5pdmH9epBMUaAoY6gSGQzK2io=;
 b=kyFJr05GSw6ceM+3HG2M+xEgqW14r0CHebmyHG7Wp+ADBdY1x9WMbMpS4t8hao8ZUO
 SeT+JXU90mmgdYLNNaC3DztNL5cisTEBLgJYsxDckh76MRxrSPkpjNfJODn+elu6udJn
 UWDEiZLURFc7STN1afPgBhKe2Z/AnAPzX86fxFdgeeldRKZRi43bwlQI1/71a17g9oNH
 d7y64qRc3NLMZkz0dhYMUxDg6Q/GcHqJOVQWd4wa/4NOygrH4zff1XAe1XkjNFJdejei
 eUgSK34pwWtIFReU8FoKP2+YDKkdU1AxGILeuUOh/XJAdzisZZuc/hyiHVZ1bI/XJ41P
 1EhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5PkpeNoZaI1f+5ra1C5pdmH9epBMUaAoY6gSGQzK2io=;
 b=JFh5hFSlghzwGM7jNT6MR4EZLHMjjn5L1dlbbbN/WiAxZhKm7X1EdJbkS6qYAhRXrF
 r/cR/khOIeZeczEKKyc2618JTmdslszwISOPDx77UyEiXGH26DH3UbBZFUIHvSbWrhUz
 omLW1qdWgTqUToV3YhGaY3ix7sQXGJC0molJ/gQMcnEYV2MDALq4bp3mMjI5Az3/VHhd
 VcW8DjauBS2UHO0ldgoKdYdKYbvrVSyAyWzcyTtbDJJMy9PRfLe3T8aujzmRqUmZiEDf
 wV3jEAWNoWHfPR0GFpSbtMbSM1Z5CH1NdAxWYifETdEBrtL9PsPVARneFQqxOOnPRYxr
 s9pg==
X-Gm-Message-State: AOAM530eNtdvjJK3tqa09ZXHZqPZfzLOtrK299m/BJuFcJdHcimE2f87
 2HDo9zOlBVUyLFrQ7rRI7M8BQA==
X-Google-Smtp-Source: ABdhPJx3icd5pnNZi2iqhP+s+XnHG/1I0LsgbfeSkoRgHnx4+zerJUurmmmqOyIimMViOHLLhKom2Q==
X-Received: by 2002:a65:690a:: with SMTP id s10mr4554950pgq.162.1614286010787; 
 Thu, 25 Feb 2021 12:46:50 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id o9sm5006452pfh.47.2021.02.25.12.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 12:46:50 -0800 (PST)
Subject: Re: [PATCH v2 01/10] target/hexagon: update MAINTAINERS for
 idef-parser
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-2-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6844159c-1bd0-0370-d653-bcd44e509e29@linaro.org>
Date: Thu, 25 Feb 2021 12:46:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225151856.3284701-2-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.435,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 7:18 AM, Alessandro Di Federico wrote:
> From: Alessandro Di Federico <ale@rev.ng>
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

