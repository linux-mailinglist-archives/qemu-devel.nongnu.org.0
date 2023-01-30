Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B83F681FC5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:39:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdk0-0006WP-4C; Mon, 30 Jan 2023 18:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdjy-0006WD-2Y
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:39:10 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdjw-0001QJ-Jc
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:39:09 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m7so12714956wru.8
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mmo4zniR6VItCk/1pSzatsJOjnvYzSAyYE4tGCj3NgQ=;
 b=R+mb6Ev/vbRVFfp0AFUWtTEccAI8LxBIjJ08LS6ZKK3ta1ylDARuh9YJibJFmLgW+7
 THRYDohKBc5laXRtCSVgX65U/KSfXL3iGzRPykjyaef1fWOGiWs/PAWal5gcj3TGx6HK
 T9tcgWGWB3OEh9n8N/IHh9OOjTnrQzCNOICc6qEde2Cjvw5W1NRzq7YQttrFZNn4JjCk
 vSV+sYH86gmotRD+SjP52obVrP/XwlviGPxqhoyS/fyZMtmgBfbM0UD5DfDSouwKVM0V
 +8pSYhdAnQm0Dtspe4evphovPWHqZQzbbEk9CJCdSo1fOgTIOQ2KEQ9fk4vID+9qB42v
 wIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mmo4zniR6VItCk/1pSzatsJOjnvYzSAyYE4tGCj3NgQ=;
 b=vfBLX7jO8GnZwFs4z+ECKQBW3hj3T1aCK6wWwarByETnK5HHCnotzqJTj0Jml5sYgO
 keKuCS7mobpae+2lz4oGTlNKYHWAoiDhIea1y5C9Uibf4AufOaZBn0aSu+xz+/U0IOfk
 aXxDm4/0Pc9pjcGprxuYhg7bowKXYZG/pkdg3XJ/2O4jicylKtTVEN4fNLb4uFu9QOEl
 fqP29+y4PFowQje/qQoC0fPvvrYMSB45d/4EfyduSnnH6L6+Pj7WCchue7zxmS8AIqLn
 w1l8D81i/JIqSlY+nP6/x58xiecx0ILhnrfLeLirKUx99z9ZIfHETsM3UyVvyXX7Wby6
 dX/g==
X-Gm-Message-State: AO0yUKU7BTPezNv9oB5TXrWZ+B05l5Efa7LzmrN/CM1OJaz3K+fPcEv4
 ET/6FSyjXbIzQuOEjbi5wrPAvQ==
X-Google-Smtp-Source: AK7set8Upnuvi4tugVsxRSYanetkCN4vF+A4dFo0ELemuI6UgfN4Ogp3XRQ0ryv3ykjYMsjIy2jZ+g==
X-Received: by 2002:a05:6000:2aa:b0:2c1:2a15:9dd3 with SMTP id
 l10-20020a05600002aa00b002c12a159dd3mr1315950wry.48.1675121947117; 
 Mon, 30 Jan 2023 15:39:07 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a05600001c400b002bdcce37d31sm14561590wrx.99.2023.01.30.15.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:39:06 -0800 (PST)
Message-ID: <f6fd51e7-9d26-d4dc-d078-e0c02ce8ce96@linaro.org>
Date: Tue, 31 Jan 2023 00:39:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 13/27] accel/tcg/plugin: Tidy
 plugin_gen_disable_mem_helpers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 21:59, Richard Henderson wrote:
> Here we are creating a temp whose value needs to be replaced,
> but always storing NULL into CPUState.plugin_mem_cbs.
> Use tcg_constant_ptr(0) explicitly.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/plugin-gen.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



