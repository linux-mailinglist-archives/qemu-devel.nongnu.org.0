Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6226267DB03
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 01:58:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLD3n-0006MV-4C; Thu, 26 Jan 2023 19:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLD3k-0006M0-Vi
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 19:57:40 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLD3i-00039q-CW
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 19:57:40 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso2373820wmq.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 16:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M2uaAR0ZQzcaS++5jhDcoVphyL7wuMYeTYyvIt3L2oY=;
 b=NSX9jMc9tN7CGnfUCmXzDSmwbVVMDk78Xexb7DrnieBcqcdJkTjOTyhiaMdTL0f48A
 W16UltqC9aSn1hjryv+6XnsHQPKn08cjyg56Ujk07M+ykjd5MO8HSavcLwXyJnZFyZOT
 iRg52Jsr0bdtEKNhsp4KoN9Xjy0mgWhZQS9Rov8TtbfXgf0dVv6vFi6KfunpQRHiV0jJ
 6Ni7sSrX83pIW/3RbvCNKAT2larWYJnlFzCi/1T81ivDRUAq1r4bT4cNUbN0uUeIV5rc
 a+nPCpWS7DCnQ8Nxg9BR3gjAFwogrxzmD4dWNo61wBTP0D8UAw0YMqeR2tsTMWnMxer2
 npEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M2uaAR0ZQzcaS++5jhDcoVphyL7wuMYeTYyvIt3L2oY=;
 b=us69n1DJKdzd4VVHSKV83BaqSIUqKolZVLq6YSZFqKBUZR9JgjF2y+01M1ZSbTfzeS
 Oqjoq5eJ/3iehd7bvZdu3kkvt6OfXPoOWWhI02UXllSoxHnLUIUNjOkLqcs/wweJt6QT
 NHK6cvUDOcK0gM3HSANxrRVTniP/+8GUFb3p682PJ0tyrINAKMlAaxsP0v29Om2BacUZ
 8cHi0Ox5SjkL+Hlxvo54oqz1vBriU/cPqaNdOB0Szzdi0AyhSqspWyvMv3FsiDYnxzOT
 SuhCq4eo3/a5f8kofsgp9a23bJV+fTdrp5pDEmaiwltU8v2EojDZ64zDSplKfysZOv1x
 5d7Q==
X-Gm-Message-State: AFqh2krqyaD7WovDKDEDB4Jz0bLwSkgxvlK+kepRhbAMkDXi5no+6F6E
 2Vi9TQA2nTTT+uFb17O0vz2u6w==
X-Google-Smtp-Source: AMrXdXuq20wHyqE7pPngxbPtPeUSkVUOlcNAiclfTodesJXEZ9EiMLste6f5yyF8jZ90ew+j4Gkz1Q==
X-Received: by 2002:a1c:7504:0:b0:3d3:52bb:3984 with SMTP id
 o4-20020a1c7504000000b003d352bb3984mr34399127wmc.17.1674781056074; 
 Thu, 26 Jan 2023 16:57:36 -0800 (PST)
Received: from [192.168.0.114] ([196.77.8.13])
 by smtp.gmail.com with ESMTPSA id
 fl22-20020a05600c0b9600b003d1e3b1624dsm6478818wmb.2.2023.01.26.16.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 16:57:35 -0800 (PST)
Message-ID: <dea32c51-a1a1-63a2-776c-c7cf92d01d97@linaro.org>
Date: Fri, 27 Jan 2023 01:57:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 24/36] target/s390x: Use a single return for
 helper_divs32/u32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230126043824.54819-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
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

On 26/1/23 05:38, Richard Henderson wrote:
> Pack the quotient and remainder into a single uint64_t.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix operand ordering; use tcg_extr32_i64.
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   target/s390x/helper.h         |  2 +-
>   target/s390x/tcg/int_helper.c | 26 +++++++++++++-------------
>   target/s390x/tcg/translate.c  |  8 ++++----
>   3 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


