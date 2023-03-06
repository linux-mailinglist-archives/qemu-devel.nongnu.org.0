Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2850B6AB6E0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 08:21:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ59L-0004tq-Cl; Mon, 06 Mar 2023 02:20:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ59F-0004tM-Il
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:20:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ59B-0007Ey-8n
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:20:41 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so7461778wmb.3
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 23:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678087235;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sd++BCO1rm2RcH8tEYynwvU/M9lblcK50Dkt8B6q79E=;
 b=kOlokm6mzfr8QodPfNJy9LTYMC+FCwHymoii3ydjQJEmaB1EXAtEEw47yNajZjCCsC
 2av5gjFkzzg7BgwNnFDhkD8X9vxKgDZNRbshYxdtfVoCMaP6Q5knURR6Tgvrfnfz2RCt
 riaFwWBR2MiajQnc95unVv4kyPdZMb8P1HLDZcTYMrOpGsV+n7I+KQlicC08AzTdqTaD
 5IGPuhTQ2wY49ZGVzkHZlnvqoiVS/mCsZuWjik11F4xW7FyoqVEsX4x8Kd6O9kM7mwNO
 yvIhsPRTV3IZ+gE2C3e5GfIOJ8fYsY1Hzcz7WEajamYVonG0RPpXTsdDj2cK7yCE2tH2
 Ybpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678087235;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sd++BCO1rm2RcH8tEYynwvU/M9lblcK50Dkt8B6q79E=;
 b=lOabZ9sBSrWrbSDAVv7BowpirfSWJiL0y6DLY/FZQWWejXekg9/oSVin0+KKuot3Vv
 PzL33Qh/5lHUksC6S2BsvNIPLazhzCqG59E4cUscNE+mHf5qHPnzL10YK9UDu5Gz7GHC
 o6IiUdCNxVBIHVPhbMLFJ351pctcoKmXjAhhH5whe1mbcmtGWgtKfE3mP895WPW1R5Vr
 A0bSeaCWz+YtPDNczT0YbIH2cVI9o4RYHplcVna0On+OffmGb6++5VKzdrY/9lyQhFrh
 Wzf+fcp7j9VcaesTwILZ6vMXqDK5/jqhzu4GaK2/Gbd5SdzzMlzyH2PrmWgDI7SEsUfo
 VzSg==
X-Gm-Message-State: AO0yUKVSAEvzPaUcZOJUP9hnm55Y9JXdantU1cpXkrCS2XVTWDklP/4a
 DDcmYAqKfhk8LJOHtihMWw6LxA==
X-Google-Smtp-Source: AK7set/+ms7QCx1IS5kbcdgozjBN/vuTMvOodD65u3tRoQYVvTD0ymhemp7+u63a6sB8z5v/xV1Aeg==
X-Received: by 2002:a05:600c:19d2:b0:3eb:37ce:4c38 with SMTP id
 u18-20020a05600c19d200b003eb37ce4c38mr8375914wmq.3.1678087235512; 
 Sun, 05 Mar 2023 23:20:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l13-20020adfe58d000000b002c569acab1esm9048491wrm.73.2023.03.05.23.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 23:20:35 -0800 (PST)
Message-ID: <e9281bd2-20c5-4011-5482-20bad1f72a50@linaro.org>
Date: Mon, 6 Mar 2023 08:20:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 5/5] accel/tcg: Remove
 check_tcg_memory_orders_compatible
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20230306015710.1868853-1-richard.henderson@linaro.org>
 <20230306015710.1868853-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306015710.1868853-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 6/3/23 02:57, Richard Henderson wrote:
> We now issue host memory barriers to match the guest memory order.
> Continue to disable MTTCG only if the guest has not been ported.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/tcg-all.c | 34 ++++++++--------------------------
>   1 file changed, 8 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


