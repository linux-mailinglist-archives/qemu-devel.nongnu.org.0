Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE6B634030
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 16:29:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxVCb-0004Sg-UA; Tue, 22 Nov 2022 10:28:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxVCa-0004SM-MG
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:28:48 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxVCZ-0001F6-2K
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:28:48 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso11544311wmp.5
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 07:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w8Pn8J1QGJWv8QBOuRTXrlvy2fZV+C8ndr2GuSmk4Bc=;
 b=xdzIv0lc8q7TrXezW3q9dXrgShHKt4tkmhdeGoi13AXKKxyGW/Rx7jczOjCE58U7Ii
 ARa8ndZ9/ttrix/fqPEboMbqar8J7RZ3N2ml3wG6bjIyhvfhMLPRPUJ3oOONlQT5kLxS
 vCeRd/e2CU0wuXrPp/+TaP4F+o/BFUKAmQH6tA99UC0Qjc2pEuULCOrr8n9MptMvMPKL
 fPSLuFzbUYRtjKu5fvM9vZ3sCVwfWiMszNvR6TQn5no5gw6dOBYP5d1ctUjrdUOyRgZC
 djn7qcxVlM7CtAOB1IaOJsStwa0Qx2doH7DbjiBHvXZAaHHljkVEno4af0uBbKKA9U9x
 dNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w8Pn8J1QGJWv8QBOuRTXrlvy2fZV+C8ndr2GuSmk4Bc=;
 b=NdpWKuv8AbDifs2HS2TzvoMOvV5BoHqp7ixwAkZCZTdBcj8w/OgY1Z2yB1GmjYRU8x
 W3AfhwbX/LrrnB54UenA0ylWwsjsBgwUWixy1V3qWmxmlz0FgLWOl25ttHrJ7V3hclPj
 uyB+qP7VZfniD+Uabu/RlDsF/UkpTPHSsLbWGn4n5+DCNQN+nVcWJpB2cJVuFPd/5TYX
 ssmanbRwQ+rzZnfGX5hehITafwRZdR9PN0K9YmS+nz+HAbfCaXsnqC6Faxn/CLTIOZ9N
 8tbeJFGUP8rlY7RerA8N5g40PF1Hc1y8vh1PdDiDtc2lGGc7PRsnP+waHX/aPYcdWjR5
 SMuA==
X-Gm-Message-State: ANoB5pmqyNTyndCbd2AuUOG9KESBhTGq/6NSj2HtCFIlpvrCbxvOB0E6
 6qLT6u5WWevrrd4jGpq57F9Iss1BZ82y3Q==
X-Google-Smtp-Source: AA0mqf4U1PdK6vfZFBjZVgK5yCkXT5oTiqKuVaVM6j/YVMEzZMgdoquuRDyIZI7WkEcD0uPhn+gKNg==
X-Received: by 2002:a05:600c:18a1:b0:3cf:a9d5:36c7 with SMTP id
 x33-20020a05600c18a100b003cfa9d536c7mr2995011wmp.13.1669130925358; 
 Tue, 22 Nov 2022 07:28:45 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c4f8300b003d01b84e9b2sm9041741wmq.27.2022.11.22.07.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 07:28:44 -0800 (PST)
Message-ID: <0001fd18-4776-be60-43c9-88aa9bbaf1b9@linaro.org>
Date: Tue, 22 Nov 2022 16:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 v3 24/45] tcg: Use output_pref wrapper function
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
 <20221111074101.2069454-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111074101.2069454-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/11/22 08:40, Richard Henderson wrote:
> We will shortly have the possibility of more that two outputs,
> though only for calls (for which preferences are moot).  Avoid
> direct references to op->output_pref[] when possible.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h |  5 +++++
>   tcg/tcg.c         | 34 ++++++++++++++++++----------------
>   2 files changed, 23 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


