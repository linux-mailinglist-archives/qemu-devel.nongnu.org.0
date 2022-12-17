Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340EE64FD04
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 00:24:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6gWp-0003l4-Qo; Sat, 17 Dec 2022 18:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6gWo-0003kp-Lx
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 18:23:38 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6gWn-0002dB-7k
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 18:23:38 -0500
Received: by mail-ej1-x62f.google.com with SMTP id bj12so13837605ejb.13
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 15:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HfXav//8T82iCnQiklTOmg8jHsb0owctZLmTtuC27f8=;
 b=OYU0AnogR9HbbI7515BfgaqEQMLWxR55bDmY0cNa+sMCxbK7S+NtRb2IwZmehs1nqJ
 OjDYvBcYiG93/9pmVsmY/g9dnTCytnJm+qvKEGxX5GK8/ayVR1daU9VUL60PJL2bpvFn
 yW1XiMmtomFnFp/yHOL6lEO61+wXJD9YKqk733ZXoSUKqRfNVUVBgl4AGOvdriXlrFKh
 DWjXC2Sz+ePH7LRe2QTWDDhBrrA1l2CLET5YFI/UeMgdlDGNPEXnmc3jRgZg1ZmSNu+q
 o0A+lIWD4GnXN9SA9wC7zs6bFKBAs7rrYI0Bh8QrQ0aMhYubF5QL/0LLehNjunWuOx/4
 lYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HfXav//8T82iCnQiklTOmg8jHsb0owctZLmTtuC27f8=;
 b=WSIhe67PZ9eOfIJPgvU4NMEKHFE50jGwLDoTrivlsxSJlShVdmLpIOkKLM8NOa2Gr5
 fWHmzAFW5pNbvSZHADEY3Vw0NysHFD/1t7ick9ypgBMTQtA8+TfOYuCqyO4XHl/7gM/o
 72QTr2RrUXOb6AsZ+OonLi4eEy46MV5XyxLULi4LRPM1rHO9zlAGqSo+0ZHzusL0NNE6
 pxZlFbfUCRBmSA2KxG+B2vfmKcjWgfhtQ6NiifScPQ19cDauV2i9nWrMFY49RwK2WbTB
 hKSjhh2Xa0CZegj3IynWU6sfJYVKH1U4IV8KfI0hmK3saw8HUVlrEeW20sJ4Tog5gNw9
 rRfw==
X-Gm-Message-State: ANoB5pnac5/L/uhcbqzwnCSvtd4RJUZ7WQYwusa8iMcLStjqjGrCAiRS
 zqF+C3GIpPZixrMMhiLE3pdB9w==
X-Google-Smtp-Source: AA0mqf5o0xVjshIrEY3F8ADCm2FYU+vpQV9Dp6wMXS+vE4FM+wmghqBozXXe9I/M1VHRWTLejiO2Pg==
X-Received: by 2002:a17:906:5e07:b0:7c1:22a6:818e with SMTP id
 n7-20020a1709065e0700b007c122a6818emr29987536eju.24.1671319411471; 
 Sat, 17 Dec 2022 15:23:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 mc1-20020a170906eb4100b007c4f9bb250fsm2488204ejb.74.2022.12.17.15.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 15:23:30 -0800 (PST)
Message-ID: <5bd06de0-f136-edcb-c978-d27e97c0d6c2@linaro.org>
Date: Sun, 18 Dec 2022 00:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 4/7] hw/acpi/Kconfig: Add missing dependencies to
 ACPI_PIIX4
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
 <20221216130355.41667-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216130355.41667-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 16/12/22 14:03, Bernhard Beschow wrote:
> piix4_pm_realize() uses apm_init() and pm_smbus_init(), so both APM and
> ACPI_SMBUS are provided by the device model managed by ACPI_PIIX4.
> 
> The ACPIREGS are also provided by ACPI_PIIX4, so needs to select ACPI.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/acpi/Kconfig | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


