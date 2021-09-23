Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59283415C10
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:38:48 +0200 (CEST)
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTM7r-00006X-Cu
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTM4p-0004fA-KF
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:35:43 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:47074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTM4m-0000u7-MG
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:35:38 -0400
Received: by mail-wr1-x434.google.com with SMTP id t7so15675539wrw.13
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 03:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v5W8YDX9o6kWDJBPMLcBaXugyAPgm+AFT+q7u8waXjg=;
 b=fCp3HZ+3jt8o48d3orkJuytfIqVVMRieq3W8tH5eksMQkMYG6acDBtp+uDYBXjaXBf
 1nYV0Iw7QwQV8FI0KkvCDqRhsxF8tLLXzU6uLpUotu1pBkB8HOGY+BN305uUKx/DW0PU
 w/Cb27VeCeGqdQLhs/py1bbERPJA7JUtlgDEDx5IbOlmNxVJ3Yog80UYVdheZWOkZhc0
 ow6xUghYHhyWx0A3XRwNhroAgnHOdsfnTxfYSGJP/Vj6FLrXXup6GaxwxU+11wHHhsRV
 pv+zqsMT3c4AEeFe6UYVbyMFrB22FKcqu7LZHrczX+Uyx1fscSw6vu9AHgUGWVmiAjgm
 Y4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v5W8YDX9o6kWDJBPMLcBaXugyAPgm+AFT+q7u8waXjg=;
 b=ubfVDcE9BZJWMRnQyEIDb0HiQFfScqETj8bc3cUWepsFt2S+KGgAFHfws6cB2v4ZWp
 66Y+taw04XxpCqx6jjIygTv6rb0T+MIurKNM731akQrVOqYUgf7RoFEqqs0MEKj9rV98
 bjsKtuxniJXbsi9mJHut37I7FLEg+BAKJBCu2jEW2UyM5nzCkOX6ViyeEdKYw2pVKdvI
 1T2O6wz4uxPif6Jrj6K9T2e7My+dJ/NT74wbVaZ7dRfFOSI7xaVWCPqY1cAu7t6Ah0WR
 iT43XDYaNLX6xkByt/p+IZ9lKZqlAx1/NCoIH0aRzSCppVAxIOKGRQyu/A1YURgWzZ4x
 Yq2g==
X-Gm-Message-State: AOAM530HCsaoYSR4MalGx0dY/fLjxl8mf6yMi5pIvO+kUIYqgKxXSg3u
 mu/AjWoXgbb1dmEDGKngauM=
X-Google-Smtp-Source: ABdhPJwdQbtziBHUE13JouCuADphCTs1pxMZ2tOPnrPrBh+5V8XTs7aZIWi3e+TLT0zPNUOpCDpbtg==
X-Received: by 2002:a5d:4608:: with SMTP id t8mr4266651wrq.136.1632393335119; 
 Thu, 23 Sep 2021 03:35:35 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l124sm8811683wml.8.2021.09.23.03.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 03:35:34 -0700 (PDT)
Message-ID: <0a77dd49-4c25-1fe6-5ccb-61e66e5336a2@amsat.org>
Date: Thu, 23 Sep 2021 12:35:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 03/30] tcg/loongarch64: Add the tcg-target.h file
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-4-git@xen0n.name>
 <5023a346-3d9e-104f-d51f-bf9815f720af@amsat.org>
 <0c8adfdb-3da3-b21d-47cf-a0ae4dc5a9de@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <0c8adfdb-3da3-b21d-47cf-a0ae4dc5a9de@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 20:58, Richard Henderson wrote:
> On 9/22/21 11:34 AM, Philippe Mathieu-Daudé wrote:
>>
>> Here could go:
>>
>>         TCG_TARGET_NB_REGS,
> 
> Not a fan of putting NFOO in the enumeration.
> It interferes with -Wenum stuff.

Oh good point... TIL :)

