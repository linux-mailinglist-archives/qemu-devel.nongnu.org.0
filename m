Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984404B1AD2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 01:59:24 +0100 (CET)
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKHT-0001SO-5L
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 19:59:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIK3i-00048B-Ru
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:45:14 -0500
Received: from [2607:f8b0:4864:20::636] (port=34393
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIK3F-0005RB-4g
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:44:43 -0500
Received: by mail-pl1-x636.google.com with SMTP id 10so3343755plj.1
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 16:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=i3IsO5sgT4O92pUcLyZZwla8u4H3kKFpwK8MzHr8E/0=;
 b=ujIpATtiVqTFbJ6F/B3rGVCNimS/ec3Gag6ClPhB1IAl5G8Z7TzHB6E/rwA2QEddnW
 EHUM2FccBxuPmALfxCULa8C9TfqmjIJ08fQ/HfHplzvhBRf5bSyFx6d7kz9NCt3WeICa
 0/0laS5J38CpqW86j8btg39Y6AAY8mqdKC9ZsELvMxUuy6BibCNsnsi4i8xNu7HAb/GD
 sn05yHwLYTkc3yOSd/W3FH68PkmR+9FkLpuZ/HLDXmeQ5lU+lwC/uEVB+exRvkokyHiy
 /wTD1xhgmGGK1aSLJr2Gjz75nDduYuDuxkpJ1ZWtPz9aTcc92Z8vm2RyS7IQ6tL8bZdi
 8yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i3IsO5sgT4O92pUcLyZZwla8u4H3kKFpwK8MzHr8E/0=;
 b=78B9W5pC+/+eiHo0aIT1f0POX5a4/tokzhDjVEsv6wY0li9o4wzREW/ztUJ0WypY3P
 6zo+UEubViVK7DT54hSMAxewLk4OYm4Yn3D7zibSibLdc5FA1qk59VtSmg/zDYV4hiRL
 jEUpp1VkooK6PmQBq5vCXhB2mMdNlWmrzdw4xYoDpi/3RrYTOSlMHwNRXhrjW19euo+f
 Bld1ZG1LwN9uRgXAfHpaXgUQ0NZMEYAWOisp7ifbet40GXOnYxktjxM2YjeA63m0lztL
 UJ7JbOW6VDEPQg9hVsnOzLUPH1TfK14K9fgym35tR6pDCXUEpSe0iU3wwF8tmrY3RiLv
 ZJZA==
X-Gm-Message-State: AOAM530h68ADifDaRFbYRt8oUXN7yjEcyN339ZgxMHoGNeNzPP4RNrEZ
 Mh02IolaB0ZNpfTbaT7DVj2OZg==
X-Google-Smtp-Source: ABdhPJzKoZJL+EtGAe4k2uurXDJJaNEGWPu0Ab6+YaWkJ7IRkPM0SOynaEhB8cFjBc0aOYzqP+hRAw==
X-Received: by 2002:a17:902:ef49:: with SMTP id
 e9mr9765922plx.56.1644540278403; 
 Thu, 10 Feb 2022 16:44:38 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id l11sm3231315pjm.23.2022.02.10.16.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 16:44:37 -0800 (PST)
Message-ID: <4e886a89-5a23-a0d7-b395-e02a3b771f80@linaro.org>
Date: Fri, 11 Feb 2022 11:44:31 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 03/12] Hexagon (target/hexagon) properly set FPINVF bit
 in sfcmp.uo and dfcmp.uo
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220210021556.9217-1-tsimpson@quicinc.com>
 <20220210021556.9217-4-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210021556.9217-4-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: ale@rev.ng, bcain@quicinc.com, mlambert@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 13:15, Taylor Simpson wrote:
> Instead of checking for nan arguments, use float??_unordered_quiet
> 
> test cases added in a subsequent patch to more extensively test USR bits
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/op_helper.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

