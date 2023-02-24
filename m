Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B4B6A176E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:42:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSix-00019Z-UY; Fri, 24 Feb 2023 02:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSip-00012W-Kk
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:42:27 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSin-0007XI-OX
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:42:27 -0500
Received: by mail-wm1-x334.google.com with SMTP id c18so6156560wmr.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wr7RoWJYhRtmLGvDfSWBQrMN+h8i1NVCxV9o2skgvNo=;
 b=eQUSc3JlaXSwjlJ8mSDF5FTrkFqln8+OrwFSP5sSg1RfF9SXU+iLJQ1dyn7qrgLYFA
 1mkoneiOGyhM5JkzvKdNwI5yoM64xXqEhnH1cKakYFfO/hKb2WuHw/GL74DpPgCcpBBX
 DdbnccthQbTFwSydhbSh9HYkq9V4jOYwipvq1t6oK4FXv1JGgRTiXf4E0GaBjRh/BsYT
 gYiBToslxYOS8h8jt9IJZvm557g03Nw1Xw1V5NP1I9bYb9g1t0/66MNc3kpc//8R5lXj
 3S/uscqPMwNp/YTOeds/rTtSO4rtZhFzdFEt0JZTUBxYNJoABdozoWK2WqjaEYl/ixV1
 28+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wr7RoWJYhRtmLGvDfSWBQrMN+h8i1NVCxV9o2skgvNo=;
 b=neqzYSaxn2yGFQIprRXeyRe2jxS6l/0OnkvLxIk8/AVZUWKX6SRI/DeXkelTXkqTPN
 NqkV9EbHC52LR7MRLeVY7l5C51WCL+R5nLmJ1m4P6KuqEq177VUmpQ5oChlNnBg50PL3
 f1uVI9/ZfuSABHebNLXLO3iTCszGb5XmTafEG5C/JvWufszYjC0feWH3W+IeqQvdlJuI
 jO/w35BSVVGnNUIGOd+5g60AYei3LXJnpeBuR1V8fJ4Wf/ZOW6ARcEkN8x341v5Ivfdf
 Qn7q3E9vPjQoF4CwkrBcDaeJsE6ulhQkjyWyC0v4PRl+U6RIIt/2YBl32RNIo+9AL2MN
 0iQg==
X-Gm-Message-State: AO0yUKVRUdNSYsjKUZKjclazD1iDms2aW5NqMDSPrgoYR8//HshgA8ZT
 CabMux1QIqyPIQM5RqF+uxCWYA==
X-Google-Smtp-Source: AK7set/4W5Vu0i0nr3WBzjuRec4NQEYP6szH5H5p1SVD9nvE87eF4qIsU6lM70cx/5AiD6KlA3ct2A==
X-Received: by 2002:a05:600c:4d94:b0:3ea:c0e2:48fc with SMTP id
 v20-20020a05600c4d9400b003eac0e248fcmr2949346wmp.25.1677224544215; 
 Thu, 23 Feb 2023 23:42:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o24-20020a5d58d8000000b002c7066a6f77sm9218582wrf.31.2023.02.23.23.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 23:42:23 -0800 (PST)
Message-ID: <81d6a576-4423-2b41-8bb8-1859fc28de95@linaro.org>
Date: Fri, 24 Feb 2023 08:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] linux-user: Fix unaligned memory access in
 prlimit64 syscall
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>
References: <20230224003907.263914-1-iii@linux.ibm.com>
 <20230224003907.263914-2-iii@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224003907.263914-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/2/23 01:39, Ilya Leoshkevich wrote:
> target_rlimit64 contains uint64_t fields, so it's 8-byte aligned on
> some hosts, while some guests may align their respective type on a
> 4-byte boundary. This may lead to an unaligned access, which is an UB.
> 
> Fix by defining the fields as abi_ullong. This makes the host alignment
> match that of the guest, and lets the compiler know that it should emit
> code that can deal with the guest alignment.
> 
> While at it, also use __get_user() and __put_user() instead of
> tswap64().
> 
> Fixes: 163a05a8398b ("linux-user: Implement prlimit64 syscall")
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/generic/target_resource.h | 4 ++--
>   linux-user/syscall.c                 | 8 ++++----
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


