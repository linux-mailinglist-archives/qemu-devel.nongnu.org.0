Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C676F65F64A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 22:56:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYEB-00088Q-AC; Thu, 05 Jan 2023 16:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYE9-00088I-MG
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:56:45 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYE8-0002qj-6h
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:56:45 -0500
Received: by mail-wr1-x436.google.com with SMTP id s9so5433464wru.13
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 13:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b36drToGzmBcrnbnMnFKy70OIMR78XrKxTa5IIUuoVQ=;
 b=vG5lsH1h2pyIK45LmG8XiXbRvvhGCtr0+gnV6DEqazXecJqyW+o0jUw04RRHEuEP06
 itIDKBA8aFnK+k6MirKjfKh8bjltUfmZLKCfOHOEcP9laGfje4Rj2kAx8w7sKF1FizY/
 WUrgdUuUu1muYuOytwiqy3iEXQgIbFcBnzSkU3A5l03bu00gPLlxfsFU89Ml1Zlr5SZ7
 mtEkUYkHwTbmXV7FKPIkjUmFwJBJKzfl8Ba7CH6p5te1XtLlYoBZLNOJBXgb/wSwpU2h
 mzF4Hh/612luCHEy5eV5pmPeW7qyfnpetO6u3v/fywTKh6E5LoNfFRF4wUPTBUenba2V
 kbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b36drToGzmBcrnbnMnFKy70OIMR78XrKxTa5IIUuoVQ=;
 b=RCgMqltq6NyK86SwaBeZLBQOGvDMYX5Du3YKQTBCwgVBEijV/8r1okMh/2lDfQNnhS
 KGkVhQiuFOO+UvtGQ9zHV0Y0xufdWqO6wczr2a9xyO/+ZQiXumIK87kJTA/KH34+ZIiK
 l8XtchDJyww56uHQeBp3PbXy52/90LkOkK2MZJOJAbCWHjgRHqrAP0q4JgGdZS22psJ6
 VIXpjrSeXzvm6/PVHS+lFfh+Cm2AtyK0nX8FSlyXSigi0h3EtlrPpdPzwB/i79BhD067
 l7I/veoMt8zohGHCu6tqpbHAey7Q4p/BqxHuAzu0zSho9yTt1MIxhrEDJkK2E6D85IcT
 pWGg==
X-Gm-Message-State: AFqh2kroHyOXjiSgmx/AXDFsEhCUbbGwjqDLXun6Gwxz6a+eGGPhZnRZ
 FiEekS0r7lfeJ9RBa9toneVQzw==
X-Google-Smtp-Source: AMrXdXsDj+60y1GGragoKoW0VQOw4pfsKaSKOw5lLjGydBxdu81pQrSoapxo3p47jcDRSwoocObing==
X-Received: by 2002:adf:f143:0:b0:2ae:b451:a0f7 with SMTP id
 y3-20020adff143000000b002aeb451a0f7mr3044321wro.5.1672955802516; 
 Thu, 05 Jan 2023 13:56:42 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a5d43c2000000b002b8fe58d6desm602784wrr.62.2023.01.05.13.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 13:56:42 -0800 (PST)
Message-ID: <241fcba3-31db-641b-59e5-2e18ed59e61f@linaro.org>
Date: Thu, 5 Jan 2023 22:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 01/40] qdev: Don't always force the global property
 array non-null
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
> Only qdev_prop_register_global requires a non-null array.
> The other instances can simply exit early.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/core/qdev-properties.c | 43 ++++++++++++++++++++++++---------------
>   1 file changed, 27 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


