Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D930689019
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 08:06:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNq8e-0006jC-2s; Fri, 03 Feb 2023 02:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNq8Q-0006gQ-Ci
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:05:33 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNq8O-0006BQ-UQ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:05:22 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r2so3767963wrv.7
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 23:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7sLovERVS0o0wRpv1ojRh/w4w09gFQmhVcYCTU+hcos=;
 b=YWJzJmvxR+rzcE9FPS447X9BEWW5EsRA9VKA+baRLwKNDPhzz+7nl/PeuJajKxFfHV
 3jCh87vsvrY9Skl6MMS5LQ4/fCy8HUz/UtTc2tmUJ0ZRvzPq6LigbwXABgNDyt8cSl6h
 NihyA8R1XaOflFqm6m8dBDLLv8nXcqiOfeOP3vPqZ5PD4q8ebAecOuvUrUJ+Oynzgvt6
 ikE8VWKzmL2zJUG3d14gKPCFY7f5h5DvhUOQZi33rmZVw625Kj9V5q9KhXMemyQti6A3
 08Ut05/6GMxP6O2qdeYJfLZnUi1C+jsPWJJfyRBqBpeBdVfvZ1VF7/C84dd9wlwfTBMV
 +Wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7sLovERVS0o0wRpv1ojRh/w4w09gFQmhVcYCTU+hcos=;
 b=Bz45LVK5QRt4k6loQS57TNjxp+ju4ze+lGA45Qe2Gm+yxxkolGziVF9iPo71gSVCWK
 nBbhByKgzI9KeZTcMfxwgFg4mH3DQmQGer2GCgYuFiZxiLPh1fj7NoG8PCckyOj9giQY
 /QHpzrDIf6Kh+cWTP0tHdPpr32A5PqBkkMx27ashUovhBmngO91TlkO4yvrxN0grbi5k
 RxV41Ky4bXusBEQWw1dHqkBRv6eCFDnggbwh5OXkxlui8HhXeLj5hcOAePmhuaz+DJTh
 lsWEgPd7yMyXne8EKLp9l/iE30XlY7uTfPwX1Cnr2noas01igEtxvQ1736SbgIejfcOi
 +7kw==
X-Gm-Message-State: AO0yUKUNHnnA9P1x1vHWk9233NEuofwGh0CCVLGBFAm+l/4e0WSmlxpQ
 oWM+DsA78vzjkLF1VXs/Iklj2g==
X-Google-Smtp-Source: AK7set8Kzrt7CIgGv0oxj40D7FPK/ZoZ4PB4Q7lk5ny10LCjMwrdwrpSORYeQH7s7Jjjb/+ow/RMag==
X-Received: by 2002:a5d:5958:0:b0:2bf:cfc0:ac71 with SMTP id
 e24-20020a5d5958000000b002bfcfc0ac71mr7134968wri.53.1675407918156; 
 Thu, 02 Feb 2023 23:05:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e8-20020a5d6d08000000b00297dcfdc90fsm1306344wrq.24.2023.02.02.23.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 23:05:17 -0800 (PST)
Message-ID: <1dd07be6-8079-0eea-1676-9e997677a53d@linaro.org>
Date: Fri, 3 Feb 2023 08:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] qemu-options.hx: remove stray quote
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Qemu-block <qemu-block@nongnu.org>
References: <20230202223121.252073-1-jsnow@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230202223121.252073-1-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 2/2/23 23:31, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   qemu-options.hx | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index d59d19704bc..52d477547f5 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1606,7 +1606,7 @@ SRST
>   
>       .. parsed-literal::
>   
> -        |qemu_system_x86| -drive file=a -drive file=b"
> +        |qemu_system_x86| -drive file=a -drive file=b
>   
>       is interpreted like:
>   

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


