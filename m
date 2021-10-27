Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41E743D611
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 23:55:55 +0200 (CEST)
Received: from localhost ([::1]:39414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfqtm-00023z-Tj
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 17:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqox-0000lZ-6B
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:50:55 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqom-0002oI-VZ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:50:53 -0400
Received: by mail-pf1-x436.google.com with SMTP id x66so3960236pfx.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 14:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w6D0HalkqU+S/2hAERPX8hzv+9Hvby2l/LdXF9NPttY=;
 b=P1inqLcUnVgl0Y2wQ+uwBB0vsIRg5gnEjVIbONy5B9I3YrTVwcLdpGNYv+rCaIZWn0
 Jn0vNqP0WsDtxUO/4OjpzU0ltm4cCTM1Ub0c9m+FA1cY5CqBWOvOXK0BO+Q0rynm/tqc
 TfklV+x/Z0PRcmqn1t/RCwsnqw6+LD1zUDjszV1geKOXbNIWMV+JlLWw32rbZrgcJjQ4
 sNOJgyJFE3qKjRWantt3QwNzZlAYLjHsexKuDqd0KtwxYYSj+Oeg/JMjTgnoih42kyuF
 0MQkidLuGjBN3kliRqR0iyMcyyvbw3w+AlDEW3zzXmwSeuxXPI2oRedIT9pQpEcLwcix
 LLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w6D0HalkqU+S/2hAERPX8hzv+9Hvby2l/LdXF9NPttY=;
 b=EsDYMfYztNFnid3ZoeQ1AnGyB+ShU5bJXnlYqp7C9PffRVbMMoo19j8Vtg7fxZih25
 vxfYjuH9N2L2zAkeeFwWXtre6jA4pU4PkdDl/92TI+tmxVzQ0O6GUZTzanw86XwW0PEz
 OikEqOt+29Ko6uAfLQ0oThA9VTSLSk8z5ww2N2UWCDi3C2qJ54fMeweoBcYpTHNzWMWa
 bjRgzc5Bnlfpw5qZDrY+5nA1YkrK7RZSM1gByW7B9IYy5Zgs4FH/iMjMsvYn9CKiCav3
 4YlZbDQJh2xQ5XGatajq9Wu3bwqDLKgrvWNjBmLKzq/FacTt1nkzVyMKSR864KNr8Tg+
 ooJg==
X-Gm-Message-State: AOAM531SVbZl+mkgvqfLTbMQRlDf4ykuL2wRpk/Cz+L/pVwdgihsNgIT
 sY530rcqRcQc7T6xhzeNtUW80Q==
X-Google-Smtp-Source: ABdhPJwnQWTIbNjJtbD3jc8AqMUNwGQmuSzMtfKlSaKfgQmEB/xVZBVTL6sN19SlJ5PTboOhNUStbg==
X-Received: by 2002:a63:9554:: with SMTP id t20mr237968pgn.255.1635371442876; 
 Wed, 27 Oct 2021 14:50:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w185sm873016pfb.38.2021.10.27.14.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 14:50:42 -0700 (PDT)
Subject: Re: [PATCH v2 16/32] target/mips: Convert MSA 2R instruction format
 to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-17-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8b2b469-5619-75ea-b85c-6786c5ab3fbd@linaro.org>
Date: Wed, 27 Oct 2021 14:50:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> Convert 2-register operations to decodetree.
> 
> Reviewed-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v2:
> - TRANS_DF_ii() uses array[4]
> ---
>   target/mips/tcg/msa.decode      |  3 ++
>   target/mips/tcg/msa_translate.c | 87 +++++----------------------------
>   2 files changed, 15 insertions(+), 75 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

