Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C964EEF6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:25:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6DVl-0002yx-54; Fri, 16 Dec 2022 11:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6DVd-0002wj-K7
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:24:30 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6DVb-0000Dj-7k
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:24:29 -0500
Received: by mail-wr1-x432.google.com with SMTP id i7so3010016wrv.8
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 08:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8k+bZuQ83SSUVK52YuzWz5VsB3C6U8hi5//e2V4fGp0=;
 b=PfJcLrAACpyD3KUrVuiR5UhvZDXJwYlLDBvi0kFrBabu+IzfqSkbkrAYQprKtTneDB
 n10Hm5mKtVOKo2rdg/BJmyGf9bhkrG3cxZKPXkDbHwGNZwlsGTpbR+mZuym1jt//Pu7e
 fGvUn4W8F2feXo+UoV9KlUg/450RetYOUD1b9C4vxy9TrnYgc5ZdhS1R8F27+Eaeh0MV
 RSVWqQ9OMli0dHzB1nbK6SxSUIorVAPPqgqAMw4/VNzJF0yIzREo/1UM+O3rY8a7pImY
 Arz+4gDMTYJf/Rnw/cwKs8BbIjcqtTjuNmRB6X9TS5qWj/JjPLI4pifMVRhFExyzIFQ/
 uSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8k+bZuQ83SSUVK52YuzWz5VsB3C6U8hi5//e2V4fGp0=;
 b=pKKgEZRLIeiUXEjMlEd5WLMlQH/ADDwf9U4/d4yPCucn0v3OMThVRaPc2ju/n8YIb7
 eRg2UnSNHWVGSYLa9NutJs6A5o+oSlkLicOkEEmAE7aNBJAb6scEUOlsYcOJSk9owGLr
 DJqhjWncW1nlLPJWjnQ8rzUBdMZ4qE1tuSy5mkFdj+L4Nc+Y0wlUwPc3x6uEGF3PSUtK
 Ne4t857ZUPoE46TfZKswfl0bmJE0oUDkCbicfK96ZULIeZ4oAI1FNO2dPl50BUctcrj6
 5DyET10eO/ClGVQQ3hnm1OUSJjbXkuoUlo87RGZ1SjFX8K5XxnJVcFVmkTFNrvLue/zT
 Iccw==
X-Gm-Message-State: ANoB5pkezYRkVgvLWIzkXJ7ozBr0+Oupf9oyeL0wFRIJn2FHP/2ae6CB
 uE0bvaSUlPymDdmcD8/vejcxaw==
X-Google-Smtp-Source: AA0mqf413Njvyuv+flaDoCi2c/WEAeX5mBKOpjckqmKOWxDqQw5qXQJ3ultzLG9j4qwujxSo8svTFg==
X-Received: by 2002:adf:de06:0:b0:242:1277:925b with SMTP id
 b6-20020adfde06000000b002421277925bmr20868707wrm.59.1671207865283; 
 Fri, 16 Dec 2022 08:24:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d11-20020adff84b000000b002425787c5easm2618454wrq.96.2022.12.16.08.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 08:24:24 -0800 (PST)
Message-ID: <00f56fbe-f6bc-7789-21e5-72f5e3288506@linaro.org>
Date: Fri, 16 Dec 2022 17:24:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 1/6] target/ppc/mmu_common: Log which effective address
 had no TLB entry found
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Michael Tokarev
 <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20221216145709.271940-1-shentey@gmail.com>
 <20221216145709.271940-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216145709.271940-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 16/12/22 15:57, Bernhard Beschow wrote:
> Let's not leave developers in the dark where this log message comes
> from.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   target/ppc/mmu_common.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



