Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE2034A7B0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 13:59:48 +0100 (CET)
Received: from localhost ([::1]:34560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPm43-0006rO-Jf
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 08:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPm2y-0006CC-E1
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:58:40 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:33578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPm2w-0008W1-0Y
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:58:40 -0400
Received: by mail-oi1-x235.google.com with SMTP id w70so5665961oie.0
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 05:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tqUbg38dgNYfPHToGB2Y2XgHWCEbAz/MfVp9dWTR8QE=;
 b=MWZb/ZzHVHAwjIS/VHb3WvhLod3JxMlPGJWj1RCoq03u/+K6LN7eic8kZHDCcR+AKZ
 cQoAhnCUMiQgmyc8OiaaX5RKS/FdtoVtIpcZdnCby7/YxJX33ITE6pkZtqoCmaswkx2B
 ehuEDbJggAGOrelm3Y6u+M7QaBJHefymCQD2BqAsJ3rkio9dGJSyo4rihv2hbApJKTJl
 /pwrfwyQiMdaulRXPhkqkJWcIdYqQXtctsiilYfImKA10yR0IOzxSjks0zCod22W1HIF
 mgxLZg3MvpWfx06E4ebf/dqPc3utGNyUrJfdA+UM8eNHpJPwczhx3xeABguFYcNLzKJm
 naFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tqUbg38dgNYfPHToGB2Y2XgHWCEbAz/MfVp9dWTR8QE=;
 b=At+3Be15a46qARMzmn0S9C7hGnPusDsAm4Kme6yOR5SiAgjp4DmFmbCGrgieRs6UR3
 6uH+RpWjj/uc1TpyKvcrRtEv2Z4I54+1Ijv3KZoEDBpFN4gFRt6qS+l0UjWO0JjO9waq
 4Fih2uBXIel3/ZJS1CGGsaLQtusPkXYzfi9Glecw1DF8j/IeOoy0OwFbMe/w+H9jrKcS
 jS3ajqRvwm0VoVMVZ8pqI0bCHkzDWwXoRvkp0bns5eeKDHCBSoEVuDL0bLLCord3M9KH
 1lG6wMnXRcZbR0N/r6cQ/8NlBPxDzQggxkbBqSnV5bmOQKETH7cKlRpivJVugZf8R8KT
 AnAw==
X-Gm-Message-State: AOAM53331h+0jWfvdETMyNjNV6G4vk7qmQ0p80X1PGL4iZtDQWEcf/bO
 XN5aTkNateDY591JN0ABVpY+MQ==
X-Google-Smtp-Source: ABdhPJwMlpPEMMUYwrx3Emy8F3MmkMmSvI/uFZs7hlZoL3g7EXUZEpR/xPVGYcSyLpI7XOkScujfEA==
X-Received: by 2002:a05:6808:a8a:: with SMTP id
 q10mr9664291oij.167.1616763516649; 
 Fri, 26 Mar 2021 05:58:36 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id p22sm2127578otf.25.2021.03.26.05.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 05:58:36 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 00/10] hw/misc: Add
 memory_region_add_subregion_aliased() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210326002728.1069834-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1218f5d9-a9c1-6569-997c-78abd1219024@linaro.org>
Date: Fri, 26 Mar 2021 06:58:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326002728.1069834-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 6:27 PM, Philippe Mathieu-Daudé wrote:
> This series introduce the memory_region_add_subregion_aliased()
> helper which basically create a device which maps a subregion
> multiple times.

I must say, the example mtree changes are persuasive.
I'll look in more detail later.


r~

