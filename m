Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB5606909
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 21:42:49 +0200 (CEST)
Received: from localhost ([::1]:52852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZLM-00054v-DB
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:28:32 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYn3-0002SG-ME
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olY0T-0005QX-9j
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:02:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olY0N-0000uD-8n
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:02:51 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so2725573wmr.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 09:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xyXEoVKfj6vSFwCfukzr7lHRc4Hs+aaGW/cPbvPp2TA=;
 b=SlQQBOzMYvKvnNPKVBahOqFt7zMFPbqV+aSgpwXF0qz5siHN5EimP+iiJGwpjs9f9+
 dJwVe8vVaZO0NgMPKFXb6aYIL2eoBiq0H4fgrbk8UYD7Zmu5qgxNLeXcIfBqa5swmIsR
 GySKL/jsfQxat6TnhaqQG723PjqAEMF1hJBEVbLvmLk8kIA7CPshyBigUxlYbf0vysGC
 SvUi6+J39Q54KlvXHMLBq7NWQv0qYh98Kv4ksAF16i7gMnyV6INqsmdi79x6cKzxaHSI
 DDzglunM6UdFuSYQdkbp3G+J9W5/Cris5WwXfeJ1px3Q+3uc5xr/7ZbZLgVevtBi8V5H
 Vk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xyXEoVKfj6vSFwCfukzr7lHRc4Hs+aaGW/cPbvPp2TA=;
 b=T61bEaRlhxFDQCikLuWagSFJQESTgfHAfb83FnWJSkja09S6OfxHNhMO0tLTM8vTQt
 Ix8q/CfqplDvZ0L9KrAfaMR5nTzxpfgK342FpeP7ZAEeYE+rcv8TQs2Qh1UYNe822upH
 r0kJwCsfi/zKiium0yMEMA51z2OnxiSFRLm5aa/RiC5E67q36BB+aEsGUwicPPa+dUiY
 /zrNGF8q+0uhgeSbeNTMhAZo/QiNwHMN7i7uk06hocgn8HDlUEsXeSlfSCRXrLqVQHy2
 j6nIdgG43bIrKTHK/nNtqJfSJEK9tI/yqBncjA3nudbcFcXU96K6PhBiCsuFHDAztP7A
 oDdw==
X-Gm-Message-State: ACrzQf0jaQMDKvu7h+Vpt8eLsCXV4iy32WDHX4EmVrQqIGBv3Fd5yJat
 Mg4Nv//LGo//98DcQYRcYSwqBA==
X-Google-Smtp-Source: AMsMyM6FeyIFP4HoXBYgSi0OOfG/t4UDUS5WIOb0d4jJwk/beG2zEq8E71cE8YIfBxYYKLxhGu4bng==
X-Received: by 2002:a05:600c:3585:b0:3c7:9f:5f87 with SMTP id
 p5-20020a05600c358500b003c7009f5f87mr9253363wmq.76.1666281762364; 
 Thu, 20 Oct 2022 09:02:42 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a1c7c17000000b003b49ab8ff53sm37080wmc.8.2022.10.20.09.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 09:02:41 -0700 (PDT)
Message-ID: <5ce4e2b7-13a5-d330-f2ab-1c541b3115e8@linaro.org>
Date: Thu, 20 Oct 2022 18:02:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 17/26] MAINTAINERS: fix-up for check-tcg Makefile
 changes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-18-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115209.1761864-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 20/10/22 13:52, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0f4c50e8eb..1b41daba88 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3727,8 +3727,7 @@ Guest Test Compilation Support
>   M: Alex Bennée <alex.bennee@linaro.org>
>   R: Philippe Mathieu-Daudé <philmd@linaro.org>
>   S: Maintained
> -F: tests/tcg/Makefile
> -F: tests/tcg/Makefile.include
> +F: tests/tcg/Makefile.target

Fixes: fc76c56d3f ("tests/tcg: cleanup Makefile inclusions")

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


