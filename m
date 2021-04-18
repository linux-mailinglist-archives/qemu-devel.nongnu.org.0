Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE050363733
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 20:50:43 +0200 (CEST)
Received: from localhost ([::1]:49906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYCVG-00018f-D4
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 14:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCSx-0008N7-3q
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 14:48:19 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:40832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCSu-0004zG-Rl
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 14:48:18 -0400
Received: by mail-qv1-xf29.google.com with SMTP id i3so10351538qvj.7
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 11:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3ayZ0pYn6sHNP5yaXnPQ5mNzUXCdiosyAd+cCuqFbx8=;
 b=dRVEBbJ/OrRNrmaAHpGGGILpsWM1/zm4+4RSWxpAQNzmKmuDSF3FZUXx+sqvh3X4S8
 CT406yTlG1LvkgLnaAcxEzYpgXPPp0XZnmXiTfuzrKBMfSGu3YjfIoPIORtyTc2jcWkz
 A1qa8cTb+aVG88cGKFQC01Gwe0jNOw126iiEC4esjCfseWoGEDls8WThnWeEz/qNtUyd
 GHhsiHt6hBafSVK/DfadA0FVQKRI+E9ekEKJNdMK7ouLA/EQfhfITDtFh7NHpXXoV0ty
 BVKaiQ6NrHIu2cOjcdCdIxtDoS5i4ciN5szssvME57PQn93WTUMyIoQb73lzAVyjpHIc
 0Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3ayZ0pYn6sHNP5yaXnPQ5mNzUXCdiosyAd+cCuqFbx8=;
 b=nUR9Pipy5ZGQTIjoXKASmhko2yEvoEMaz3pjtfjAjoX1WCu0tyPWcMgcRGSAaHkfBX
 nAoHHjYz5o+H1pvLaii1mZSCoG2XOAwctFtLyP0tWrKJqdxUvfzFRAv8g9NB8PSikRI9
 J85eogqCOFpCiqTrSbLHNxRUfxn249TcGgYLCwOSUdkoU5qb6hR/kYd1oQq3ypl7GJrO
 10yYBM/k50w6pZH46pUYKhTXkY8adOIkTMfRzfMbR8zTItgmz/MNq7DI0szy13Z098sS
 D5Te1wmbln6ML053SWZ2nW/6NsZKYj3t6txUtYQ34SnozYqThJMHFRJDFcKAmH3kJSFO
 d5mw==
X-Gm-Message-State: AOAM53293sSsPBAsmJWiSfUjvF0wnb3EVrk3cNuxvYRBp1fjbv3OPdfH
 N/tl2bXj4U52Lz/EwCh/mJfqoQ==
X-Google-Smtp-Source: ABdhPJxnAI3DFhWZTV4CmFyFB4zf/VHvmuzeRK9IGmHGxjcHAyDmz12KxQc9i2BAQ0njcmfvNuQtNw==
X-Received: by 2002:a0c:fd41:: with SMTP id j1mr18398036qvs.29.1618771695310; 
 Sun, 18 Apr 2021 11:48:15 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id m10sm7347486qtp.43.2021.04.18.11.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 11:48:14 -0700 (PDT)
Subject: Re: [PATCH v2] hw/mips/jazz: Remove confusing ifdef'ry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418165102.1139848-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31d635b5-fbd8-7971-4ecc-518b42e8f3e5@linaro.org>
Date: Sun, 18 Apr 2021 11:48:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418165102.1139848-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:51 AM, Philippe Mathieu-Daudé wrote:
> The jazz machine is not used under user emulation and
> does not support KVM. Simplify the ifdef'ry.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> Reviewed-by: Claudio Fontana<cfontana@suse.de>
> Message-Id:<20210226132723.3969650-3-f4bug@amsat.org>
> ---
> v2: Rebased.
> 
> Based-on:<20210418163134.1133100-1-f4bug@amsat.org>
> ---
>   hw/mips/jazz.c | 4 ----
>   1 file changed, 4 deletions(-)

Were you going to apply this one before my cleanup to completely remove this 
hook manipulation?

https://patchew.org/QEMU/20210227232519.222663-1-richard.henderson@linaro.org/20210227232519.222663-2-richard.henderson@linaro.org/


r~

