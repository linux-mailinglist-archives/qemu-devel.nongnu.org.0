Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFFD65F692
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:18:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYTE-0006M5-UO; Thu, 05 Jan 2023 17:12:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYTA-0006LG-6d
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:12:17 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYT7-0000ob-L7
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:12:15 -0500
Received: by mail-wm1-x336.google.com with SMTP id o15so29039289wmr.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 14:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J1tOaMs1KW81VNnIAQskWqC7s7NIR8ryFZUtDzwxhKQ=;
 b=dlsZmXpHtzQLjGWToJ7Wk+oc90m5jaeFuDT3SiWJmj7DVcVes4zdQfkJ1T8O5bwc0G
 +50FtTF4icLLe3R6C76jbcjBKXsOy2m+gZbx7p9SgoKDZdlNJbTxf36sXzKu92MQNVlh
 h+NW3J8fBKbcysOciZ621ONA2cXRLuElTBsYtCkqdVV0ANRV/Ba3C1dLcjETob0jXvNA
 x/qDRetjdUEvrjrQ5VtgYjovz01ZoWFeBNig17rsfJ233gOLoLmFCpaq/C/H4qgih5k2
 F97uGQbYIoynxMiJKnCBfouJommRuq9S3+2drpfSWHuUWEVL8q+/1hxalQZdwv4Zzq8q
 dcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J1tOaMs1KW81VNnIAQskWqC7s7NIR8ryFZUtDzwxhKQ=;
 b=p2q9MjxZ68EKrSnvkTtYkmcbrX8mY9t/vZg7OexIV0XIWg9QaMZ7IyUFhbYzd8s3sr
 xhPwZuPu9Ifqjb/zPquwJkk1y4LrfJD9MIQfnp0NGxQk/p0YfDKHL5NriziUsP8UNZ80
 oEEyD9nu/0HTbm23eJhGkhKD43eoTRUixKi/uRBddQkZqwfBTWLR5N/dPwSFrBsB5dnB
 rU/TgZ6fmCCUYytWL/7iky6TLA0KmQadshNiAcl6x2JaQrwesvkSAcxn6t/j8PrvTHzf
 TpC+t9sC04cEgeCxAG22c6f16CJ7DZL6aNk0Zw1tVTYzfGsaD5xEs5LJd4WM1jj991dw
 iVew==
X-Gm-Message-State: AFqh2kq2XGBRf123PVw63NMTJIPw0pLkha7kR6Rj1+eZLx3kC5SI5AVO
 e6hcMov0JsiOKtNgcNO36LcmvQ==
X-Google-Smtp-Source: AMrXdXuEmUs/OFO7gqj529IT6SPMzXM9Hq2w5wVn0o25RB1PVklDi50zh12gFnvAv00nfhTk/lFkCA==
X-Received: by 2002:a05:600c:798:b0:3d3:5737:3b0f with SMTP id
 z24-20020a05600c079800b003d357373b0fmr46167950wmo.36.1672956732146; 
 Thu, 05 Jan 2023 14:12:12 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c469000b003d358beab9dsm4201553wmo.47.2023.01.05.14.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 14:12:11 -0800 (PST)
Message-ID: <05b8aa51-872b-c3e6-5d23-4aec05e6b5bf@linaro.org>
Date: Thu, 5 Jan 2023 23:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 27/40] target/arm: Split out strongarm_class_init
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 3/1/23 19:16, Richard Henderson wrote:
> Use an intermediate function to share code between
> sa1100_class_init and sa1110_class_init.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu_tcg.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


