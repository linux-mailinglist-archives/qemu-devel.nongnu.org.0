Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC93440B95
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 22:07:15 +0200 (CEST)
Received: from localhost ([::1]:33332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgudG-0005br-Oi
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 16:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgubY-00049r-Po
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 16:05:28 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:40582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgubX-0008PS-1a
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 16:05:28 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so13250707pji.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 13:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x429/uqnNu3qmpK8oGNpzrhfsbpS2CSG3RJz6hhgq50=;
 b=FqgirBs16iuBWTTzZflG0DQGEhKCaqybRBEb6X9mywZJiL/V9mAgjnJbRyzFAsmxmv
 bdIu9bPcdUgOWqChDf/KOmfbu7+v+QRomXVd4haaWTXm14zWqbWf9OAuOODAjKVMNCLO
 Lz4NP3FMICBtbbqD2JAntoaYvv9Y8Wq2NKZDZCNNqhbq58pdIOr3T4seyro0J/exND4I
 ki+VRyQo4Cu5OxB7rccf1Mt8ePdlgenxin65xOpNHpU1sDjR0EoDyOkxoGVG4IkA0C3j
 faLM5qMYMmBXlm0VcUh5z2srgrgxKkrgsq0x64WCkD3U075tfZabVWf2GWd6thsBMlYm
 DpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x429/uqnNu3qmpK8oGNpzrhfsbpS2CSG3RJz6hhgq50=;
 b=wybhMrpMKLW+eOZdxCS2u9myHFwi/IMWGByDI58KScBr3TtgWL7iS4+LZ2mNi//ZO5
 6E+Vj5N3QaFBCgjp3iUM2amPkEB7ZAgAGy2b9t9hNEpj24DG6ip+XSpjv1dEfzHYnj/8
 EQMlf5RG7a/tnA82OEf8lJXPu3TwB4zyqXCwmUbTwuw1SfrHFadTTPupJJZwmBJCHv/w
 Sy3Ee8lLHuYIT80Y5SZkjHMoTVqfaGj4Ze7SLVN+cxza3JVfg2lsOHF96hPVLpHmLaUM
 /1Fq3hg17vPxHujP7lyjZ+cjG3a7qsLHOnHLZ9FkI2ZtST/C+VFP4RXiYtt2/J06DY86
 5/VQ==
X-Gm-Message-State: AOAM533u/OnNCCReXDLEvlNWtTwBWblLcAs5zllE62qoeqK5aipDNHF/
 ngDM8yZeYWlotjXIuUQIFaZmAw==
X-Google-Smtp-Source: ABdhPJzjSyriAYRZc9kzFZ81YVnZq17dnqwZmIm8CL5Hij0syCRrpEIG0FtnFRov3hL09an/uHvjPg==
X-Received: by 2002:a17:90a:cf85:: with SMTP id
 i5mr6056371pju.101.1635624325599; 
 Sat, 30 Oct 2021 13:05:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id 1sm10640390pfm.163.2021.10.30.13.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 13:05:25 -0700 (PDT)
Subject: Re: [PATCH v5 10/30] Hexagon HVX (target/hexagon) instruction utility
 functions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1635556849-18120-1-git-send-email-tsimpson@quicinc.com>
 <1635556849-18120-11-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <98aecfd9-380c-afa5-b022-827055642e07@linaro.org>
Date: Sat, 30 Oct 2021 13:05:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1635556849-18120-11-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 6:20 PM, Taylor Simpson wrote:
> Functions to support scatter/gather
> Add new file to target/hexagon/meson.build
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/mmvec/system_ext_mmvec.h | 25 ++++++++++++++++++
>   target/hexagon/mmvec/system_ext_mmvec.c | 47 +++++++++++++++++++++++++++++++++
>   target/hexagon/meson.build              |  1 +
>   3 files changed, 73 insertions(+)
>   create mode 100644 target/hexagon/mmvec/system_ext_mmvec.h
>   create mode 100644 target/hexagon/mmvec/system_ext_mmvec.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

