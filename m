Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BE469DB09
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:16:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUMtC-0006Jl-Sd; Tue, 21 Feb 2023 02:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMt9-0006IE-By
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:16:36 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMt5-0003YZ-FZ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:16:32 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 iv11-20020a05600c548b00b003dc52fed235so2389349wmb.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=icWWngUHMVw04oXWqJ9PeNtR5VBg0geCEkmiO3AzBos=;
 b=aKcaGrlHpvFL1WcvneVzuICedtPX1A555OKbIgsR+74vwAgSCnWMOqCv5ZzRA4VZlq
 EOlJ/bMmISlkuO7ZGc0ja8xTFIpKNy7ffD3/AIlPEYryexQrGVZOMADhNsPJiGQ2NBIH
 H4Ylxvnx1Oevb2yBgLopyADmRI/hRi/UJH29mygMMcF8Qexu2aUkAm1fHEzFMMLAP+5k
 FIAUbABdWLf7/7cJ9LlTkWzp1rLA6boMN6WKmKZ6GokHWYdT+8Q+I/l1MbuFM90/gm2Z
 yibKzBLm61sNwt4RoGD/4yf2W4OR+QmhnNC8arcNIU+11MHIY0USHdaSmIJQfpXxA9Vh
 68mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=icWWngUHMVw04oXWqJ9PeNtR5VBg0geCEkmiO3AzBos=;
 b=QcMo/wbpyZZG+3TJXPy4avIdqisnV0Bm+a2NuiQPM6GKQNmPR5oIVXBklCDn0vm90r
 I5rWun7hlhG+PrC71CH8/r3hyzPhRONxvyYvucE+LFkwXSKFWxqngW4JkVkhK6Z2cX/E
 NI3cG0kdtCKe32MgTFDN22NC1+5qy0mFVJGmbBUQRiiqM+kx3N4ssFUq3wHyMkdxK4aY
 Cxe0aoF1sVMp4PBm4CAmTFbGgl4C+mCUb44tGSjQl2QxLuEf0qq+6hQD2uNc2Nc7du8r
 1aPSGPUH6qs4qPkrfoeraHVtMIGiaKmdKOSK1GKZF5XPyPrwmsCHKpB4L46hq/TXFhrm
 Y+Mg==
X-Gm-Message-State: AO0yUKVaCsfDJxQitjv5rpUFlgN/uBPGU950ugIUT/wTph6DhtatCu6Y
 goB/jSWE+O8suluzaj5O9E9L5A==
X-Google-Smtp-Source: AK7set+7N2WPkVcnB9HFpTpfLlcb4gvRxyDp7NJQwIfSsI00HDteEjl3/fgNbosLAIS18O7coFYbfA==
X-Received: by 2002:a05:600c:2e88:b0:3e2:201a:5bcb with SMTP id
 p8-20020a05600c2e8800b003e2201a5bcbmr2343481wmn.28.1676963789734; 
 Mon, 20 Feb 2023 23:16:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c18-20020a05600c0a5200b003e733a973d2sm1993902wmq.39.2023.02.20.23.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:16:29 -0800 (PST)
Message-ID: <6862e485-66d9-9f03-ab40-5ef5f407961c@linaro.org>
Date: Tue, 21 Feb 2023 08:16:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 05/14] target/arm: Simplify register counting in
 arm_gen_dynamic_svereg_xml
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 21/2/23 03:19, Richard Henderson wrote:
> Rather than increment base_reg and num, compute num
> from the change to base_reg at the end.  Clean up some
> nearby comments.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/gdbstub64.c | 27 ++++++++++++++++-----------
>   1 file changed, 16 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


