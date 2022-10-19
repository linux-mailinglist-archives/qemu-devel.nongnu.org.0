Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859A86050A3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 21:42:47 +0200 (CEST)
Received: from localhost ([::1]:46556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olExf-0003Fa-Rx
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 15:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olEt9-0006m0-JC
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 15:38:03 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olEt7-0002wC-Vn
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 15:38:03 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v1so1541285wrt.11
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 12:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qjk7uHakOZfWO/wRBzmIQLoom1dneQTlzQGC2Yx9d5s=;
 b=pXOSEfjc9DzGQLxtDgRty4uf6gp/wWwmyUdPXu0+ceRtxUxdIK2kI+qswFNfh1uwvu
 1j542c6F95nM6Vi1YeOWyFldPbrFOad0bAHh53/eOQwmX1MgnHntQADzXH0Puv00/Mqo
 EqwOdUbjFASgWGfbzj0npvzHeVaHDjW2tXKRw0HjoAC/ecQld0AiP+OiTBfVbBEr5yke
 /JPL/cZprenj8TgwVSyrZ6NjAQz/iQh7JwN4AZRQBnsTXEgcMl9kEWHMZVCW3TtRun4g
 m3BcCaciRtwIwVmCXtVWmhyhcVnaFSthg1Fl8YN31DhlINjyRGitkwemAGAmrqIeqL7b
 0Pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qjk7uHakOZfWO/wRBzmIQLoom1dneQTlzQGC2Yx9d5s=;
 b=sTHX1tQTqVqu/lOXxqbYKinAv2nVzJo0ZTmJ/iKzWKZM4fs+VZBX7fjLCHAS40U/iC
 WGga5NAl2prTs2om8NITBAvO3xfK2qjEGWmGb3kVY64hGND0k5ngthS7NKQ0hC6T6ark
 jZ+8dV8Hbn7cbqTX66Mx8vJKw8Ft1m544ZH58DY/tr2BBd/mnM4aA6G4DmmnFtJlQ2Vd
 +xerXH9uikZ8H9Jf8uaswxeP76Kv3T4sGVEaxyW54dK8yDcvmjOOSYCbHxFdtqqRAGcI
 xd8SOL1HOPHySIE/UJ4WyHGVzucxIQM1QvK23FwZB80jBQhAYH+KcY8s3nByDS/PxeAy
 aUuQ==
X-Gm-Message-State: ACrzQf12UVH/sDNTnJvQlLtSq6Ae6vVSr+fSAhCwq9ZiCl22i4VIEFuR
 vdzFt5t9uUwGlK7/GYMeMYr50A==
X-Google-Smtp-Source: AMsMyM6tTwxiEok5s/oLM2TKhf74F0hTRwm8fjoevWQXl5loppyZbh2NrxT3+DPImxnNGnMWHY67SQ==
X-Received: by 2002:a05:6000:711:b0:22e:7b01:db9f with SMTP id
 bs17-20020a056000071100b0022e7b01db9fmr6533008wrb.38.1666208280361; 
 Wed, 19 Oct 2022 12:38:00 -0700 (PDT)
Received: from [192.168.7.115] (m194-158-70-1.andorpac.ad. [194.158.70.1])
 by smtp.gmail.com with ESMTPSA id
 123-20020a1c1981000000b003a6125562e1sm703115wmz.46.2022.10.19.12.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 12:37:59 -0700 (PDT)
Message-ID: <e2c7ca79-6730-e9e6-770d-e1513026a294@linaro.org>
Date: Wed, 19 Oct 2022 21:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH] hw/acpi/erst.c: Fix memset argument order
Content-Language: en-US
To: "Christian A. Ehrhardt" <lk@c--e.de>, qemu-devel@nongnu.org
Cc: Eric DeVolder <eric.devolder@oracle.com>, qemu-stable@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
References: <20221019191522.1004804-1-lk@c--e.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221019191522.1004804-1-lk@c--e.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/22 21:15, Christian A. Ehrhardt wrote:
> Fix memset argument order: The second argument is
> the value, the length goes last.
> 
> Cc: Eric DeVolder <eric.devolder@oracle.com>
> Cc: qemu-stable@nongnu.org
> Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
> Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
> ---
>   hw/acpi/erst.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index df856b2669..26391f93ca 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
>       if (nvram) {
>           /* Write the record into the slot */
>           memcpy(nvram, exchange, record_length);
> -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
> +        memset(nvram + record_length, 0xFF, exchange_length - record_length);
Ouch

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


