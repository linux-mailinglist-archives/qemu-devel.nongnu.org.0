Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9977C415076
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:26:30 +0200 (CEST)
Received: from localhost ([::1]:33372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7sz-0003RW-HX
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT7SR-0001a9-Df
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:59:03 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT7SP-0005D6-QZ
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:59:03 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so3090207pji.2
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 11:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xk9Agp2JOUaCTebMBOtakHYEDnKADI9OU8xhGPu93NU=;
 b=mG8pB/rs/zn78qLFkQtW2DHAXQfd9BpV7fBpHSHhydReEZnDFSkPu/KLjO4O2mq7wq
 +ExTkDlgtLXFXuJu7J2E3xhDe4l14+HRzH9+5ArCU7zbxYQDrsbanoCyy6C1gbWkvCfk
 NvGI5ZxrXvlr50MW2E+M+X/DRjlgvsuoPzfHzPbPVEbAoyotLaUEnqU7Q4OvtjAVyN5U
 00rjvmkIBIde43RA9oiMz3ay9I5Ciz9I5mjkgz3uEIAk4hLWKaO79urmTSI9g8KZfL4e
 huveYDCgM2EmP2APUZmZU1wxythi0tl0SjQwWb5NlqVrGJWaZFFtdm/qdAf4taogQoxL
 ZOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xk9Agp2JOUaCTebMBOtakHYEDnKADI9OU8xhGPu93NU=;
 b=ZiVdS1S0NfGXH9VadHMuDPsfglP6R8l7CgZB1wrSckH+VYaez5EkA+DMo8hsrP/6oP
 Dp1v/Em4Ma+oJFK9jf3EG+sy5vcTuBP1YWLpR9WWqoEIlbv0TqNWz4pOkRVZIN77B+eU
 ryePySKAEl5IUSuiPFgVumGPOjq3zfVKyzmu4QaEF0s+yJIAQHRwVzj4qSDdgORjNPaJ
 Zxts54bOfsGSzh2zfnut3fEFISkVWcXxzxMs3QTR5tvEkQjv6n8KhWhKw25OB3BMF/98
 NSWJVaNaZ1M/aPkxy+6f32q8gOIg0MEYpYpk9Pnd7tpiCYuaT1WpuiUJ3TTPZs7Q5JPd
 fsqg==
X-Gm-Message-State: AOAM5333X0SpKxVXOY0weWfs7RIg3enyowUGpTZvyGnQpfXnjVyGvZ6C
 LUB/3Tb/BIEsJH575Jdy0IVnFQ==
X-Google-Smtp-Source: ABdhPJwP3CVBHpwIaEiVyWNdNc3gdqlbD6PYTr/LJi3cU4hbf/37W1pFubdW3gTQqrVOwNcW6EcGmg==
X-Received: by 2002:a17:903:4041:b0:13d:b90e:162e with SMTP id
 n1-20020a170903404100b0013db90e162emr641469pla.34.1632337140098; 
 Wed, 22 Sep 2021 11:59:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y9sm3266746pfm.129.2021.09.22.11.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 11:58:59 -0700 (PDT)
Subject: Re: [PATCH v3 03/30] tcg/loongarch64: Add the tcg-target.h file
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-4-git@xen0n.name>
 <5023a346-3d9e-104f-d51f-bf9815f720af@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c8adfdb-3da3-b21d-47cf-a0ae4dc5a9de@linaro.org>
Date: Wed, 22 Sep 2021 11:58:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5023a346-3d9e-104f-d51f-bf9815f720af@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 11:34 AM, Philippe Mathieu-Daudé wrote:
> 
> Here could go:
> 
>         TCG_TARGET_NB_REGS,

Not a fan of putting NFOO in the enumeration.
It interferes with -Wenum stuff.


r~

