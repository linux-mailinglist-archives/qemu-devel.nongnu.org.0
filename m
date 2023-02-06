Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2A868C041
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:37:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2cB-0007va-1w; Mon, 06 Feb 2023 09:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP2c8-0007uw-Dd
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:37:00 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP2c6-00024e-PU
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:37:00 -0500
Received: by mail-wr1-x433.google.com with SMTP id r2so10558134wrv.7
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 06:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D12t6mECrZKs7QMgcsF7CDRf5lhhvCxRoZzcQ9I+HVk=;
 b=tlWwI4g8q5qig8/s54gFCImfy9Y8PwBgt6MLT6QjKcEr6BY9Me5FcTGezlcz4cnVt7
 UDk5IAZz3aRbw9ldPBLHFu0axLcC+gS1Q7mHwQp9ujTdGfTXvLZdFak4DMcoR/yNwAKn
 vvGNFq/n9j5nW2SzmoKgyWyijCUAAGaSSbAAowNesjvjoYlE4oJzYUOwTRnFYG0w4VBH
 8/VvV3gDMSW5Vp02pu6z1GSkAWaR/WILvwdy8tzTWvN8sEUl1FYuc342k4W5cn/1JqlC
 kE7Lszz9gyjo3nR/CwUzXgvaHrHn9z1YvsME2W0nSiWQo2Mo4f5tPbuHb521VO8sL0g6
 MbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D12t6mECrZKs7QMgcsF7CDRf5lhhvCxRoZzcQ9I+HVk=;
 b=vjL/As0O6gCEuRUTPyfpvaTbl3yXYv/gF1ES4MZBbzAPTqhQkqoAQa2yFapv3YhSf+
 DeqZzaM3I+bYspgrC3sBrP21+c/OLf73HpBIgEF0426vRPRulHaoCidFd3N8B/sqSmtO
 HihZgNJIPtX93Pw8mzlEbnO6d42jePNG4/GTLShyJ38riNDLHZiCN0MNytVckyjtgH+A
 I2lQbIHoV/RF335GWboItURVXR7ojMzHdjRH7hdNpugR4cXBzniiuJxNxgyh6ZyosYDu
 uFoeuemaZdSN2p6oi5nalMinKuoaAwsfk8EPYVJLqxlLI/MBXN8NxncvliJP/VzpsX0F
 LNrw==
X-Gm-Message-State: AO0yUKVBMd3cdR81o6MN9MUNrK3LdbFddtc1rv1qn1AWK9hsaJXMW8jS
 Joz4fMeku9jlsu8+HLGtL+TvzA9Frdb5WIbF
X-Google-Smtp-Source: AK7set8fy1SlEXsm3MfWQPHRXBYh2umrD1gQwCkLku99Jo6SsbAIrK4PSITwSPmJslriLNoacZOnRg==
X-Received: by 2002:a5d:6d05:0:b0:2bf:e39d:c8a7 with SMTP id
 e5-20020a5d6d05000000b002bfe39dc8a7mr26548547wrq.44.1675694217271; 
 Mon, 06 Feb 2023 06:36:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d2-20020a056000186200b002bddd75a83fsm9596902wri.8.2023.02.06.06.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 06:36:56 -0800 (PST)
Message-ID: <33d8574e-e9fd-afa1-665f-e2f848ccb6fc@linaro.org>
Date: Mon, 6 Feb 2023 15:36:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] curl: Fix error path in curl_open()
Content-Language: en-US
To: Hanna Czenczek <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230206132949.92917-1-hreitz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206132949.92917-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 6/2/23 14:29, Hanna Czenczek wrote:
> g_hash_table_destroy() and g_hash_table_foreach_remove() (called by
> curl_drop_all_sockets()) both require the table to be non-NULL, or will
> print assertion failures (just print, no abort).
> 
> There are several paths in curl_open() that can lead to the out_noclean
> label without s->sockets being allocated, so clean it only if it has
> been allocated.
> 
> Example reproducer:
> $ qemu-img info -f http ''
> qemu-img: GLib: g_hash_table_foreach_remove: assertion 'hash_table != NULL' failed
> qemu-img: GLib: g_hash_table_destroy: assertion 'hash_table != NULL' failed
> qemu-img: Could not open '': http curl driver cannot handle the URL '' (does not start with 'http://')
> 
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/1475
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>   block/curl.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


