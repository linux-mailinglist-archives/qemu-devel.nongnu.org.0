Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9774C3A2A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 01:11:15 +0100 (CET)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNOCY-0007ys-FY
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 19:11:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNO9s-00070N-Bn
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 19:08:28 -0500
Received: from [2607:f8b0:4864:20::1029] (port=53171
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNO9q-0000Jx-DI
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 19:08:27 -0500
Received: by mail-pj1-x1029.google.com with SMTP id v4so3375807pjh.2
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 16:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6fqxRFd86SkBcHfIQeedKchfeGcI9vclF0x2w5j6kQY=;
 b=u5RymHHOSAWv9OSDQzHow1ClEbY5eycKOwvP2ZB5QAFM9lA8DfafW/vOpUtFcKHbS/
 UwHGRGEnkaqbAUppq7jbM2Uqxn3HpYiwfrl1S4+IZuY4I5YevqC4yM12YY1Ed8KzYlh+
 OJZpVoTMdGRVapzdH0WDymKd6/H+1bZAh623PVADA2x92hwoSmKA9VuBH9rk4Hqo3m4D
 D0TV+9NcVfsTVcDCuZjwz9+1EeI5ew6RvUTSHXlipRI4wpVWNgKzTzY/JhOtkXSs0DOo
 YlMZzRwoohuzoGugP66afMlt2vs7rbs955RtBsuMyG+rzxfx6nms+wsI9KNRxx8KKTWz
 miMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6fqxRFd86SkBcHfIQeedKchfeGcI9vclF0x2w5j6kQY=;
 b=S5PVo6cctVPUbi0fQt5jKfCGZynm7l9XFZqswhnsb6z+FUuWboVCnoAQrHnVq9+3BY
 wQoRbh+8G86WpUEwMkMY55rXK03S/xeAHUSVg+mJiYcmMEGDwIZIIzeZnDpnuHgxfT/A
 EoueKtFvXEo7PYoRPzPIm1n/+ObbHeZ9Ux+7mRc3C7sz/KDNOqtdnUPrNQzkJwjXQ3mN
 GXcO1fDm8GVsNNOFLk0/GkFirtPQqeksMWuC61p7YmXUHYRD77r/V06u5QhS5/tkz4zo
 FGNecn9wZK/K/2+bIlj7SSzoL5DhQTkvs77/ClHpTnyXQXDzL9RlmErZd5ysfNSgrBpv
 oPWw==
X-Gm-Message-State: AOAM533OTvbZ8mBbSC9RkeTRvkGEECycpH8+CuD6F999Js8hfb3ry2Ec
 IsNdlXqJmMA6b6NX23to6ry+0g==
X-Google-Smtp-Source: ABdhPJyxT47/t7HAELrWnP0Wq3Hd1gQeFmEprr/9s6/UcvnZjZ7EvPHDPq4dal22FpGlEQZxLUgu2g==
X-Received: by 2002:a17:902:aa86:b0:150:25f4:f43d with SMTP id
 d6-20020a170902aa8600b0015025f4f43dmr1302560plr.141.1645747705030; 
 Thu, 24 Feb 2022 16:08:25 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 q22-20020a056a00085600b004f397d1f3b5sm624910pfk.171.2022.02.24.16.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 16:08:24 -0800 (PST)
Message-ID: <86877266-d727-c471-6160-439d25e0289d@linaro.org>
Date: Thu, 24 Feb 2022 14:08:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 13/14] target: Introduce and use
 OBJECT_DECLARE_CPU_TYPE() macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220214183144.27402-1-f4bug@amsat.org>
 <20220214183144.27402-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220214183144.27402-14-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 08:31, Philippe Mathieu-Daudé wrote:
> Replace the boilerplate code to declare CPU QOM types
> and macros, and forward-declare the CPU instance type.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

