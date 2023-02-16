Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA44C698E06
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:48:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSYzD-0002hi-T7; Thu, 16 Feb 2023 02:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYyx-0002fe-Fz
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:47:09 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYyv-0004QA-0x
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:47:07 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so883727wmb.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ltSUp0V0DygOjKUG1rVyntURKUpZZwTHSMKbT96DuUQ=;
 b=qDOHeWkobdnW5g1DP1w5i44v/lLWQejx8ejmGqZsbaqb1Pd1RY7td9w+Ow4vUzhiNr
 UktpT5NmxZ0JCLa6QkQwHDEgCAK0rWDfKbrt++qTeHl7wszJ8/hWnqK5IIjKhINKRtxB
 zgyR5RkA0yPkMRmHvOs+J+wp2/FqDOK+ipnbg3LBoQmgYVpXtJV+Oz9gQZwjfx8sV5Sp
 SAPKe8jc5GhQkJhAf8EL711qhX8kK9K4him44Vs5sFIRmsguZ7uout5sCFLr8AumG2G7
 3Xa+kdarPhpYe669qUgyfDFAbOqe5Z57DxZWAJida1T27cTAc+bVPsO4ECu/j0w4XCWO
 Cvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ltSUp0V0DygOjKUG1rVyntURKUpZZwTHSMKbT96DuUQ=;
 b=eHpdKNnbGQqjKevlFEH0mHe8bC5ZSTa54xVQ6SRyXSox4IVluq5kGIwGkB2dWmLaID
 uHs+RAwAjxOEKHxKUkyxndjYhK+YqWoR/JtutFyFPPRmzcW+tLINS0dwOTAshcL5hruj
 LkeVNxEd09QD0MKSz4unIj4nayO3tyKjtUxoel/dLevOdjNevEUInL8KxZQMHNcVCTUO
 BUkSNQbXTEj5DYYVJravogtdeH+30ZftEfjflou/o8EbP1wIxul7X9uPSzPQAU5wlTG5
 Rj1ifmRrLtHL20lKda0Q+pYcMuiHNJ1T2eUdBNCdfAx0vOeyl/m5vv6Xi/Ok/u1jExx0
 XgXw==
X-Gm-Message-State: AO0yUKWB2xFzY9UQLCPmXJZ24chs44CyROuHCpxO61oL3Nmc3lOCaACB
 vytimQyRzF9aWwIKklLurtjYqA==
X-Google-Smtp-Source: AK7set9fSs+rSF9c+vTOCEQo5kf7QUmzBZA2sZOuvJqSkhBFJkx5+wi4lLty3oylcx0wmk0b/ck+kA==
X-Received: by 2002:a05:600c:180a:b0:3df:ef18:b0a1 with SMTP id
 n10-20020a05600c180a00b003dfef18b0a1mr4507581wmp.12.1676533622946; 
 Wed, 15 Feb 2023 23:47:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k1-20020a7bc401000000b003dc47d458cdsm841300wmi.15.2023.02.15.23.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:47:02 -0800 (PST)
Message-ID: <65c1948f-2fd8-a725-4fe6-1a6b6a996ebb@linaro.org>
Date: Thu, 16 Feb 2023 08:47:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 0/4] target/arm: Cache ARMVAParameters
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anders.roxell@linaro.org, qemu-arm@nongnu.org
References: <20230202075242.260793-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230202075242.260793-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

Hi Richard,

On 2/2/23 08:52, Richard Henderson wrote:

> Richard Henderson (4):
>    target/arm: Flush only required tlbs for TCR_EL[12]
>    target/arm: Store tbi for both insns and data in ARMVAParameters
>    target/arm: Use FIELD for ARMVAParameters
>    target/arm: Cache ARMVAParameters

Applying: target/arm: Flush only required tlbs for TCR_EL[12]
error: patch failed: target/arm/helper.c:4151
error: target/arm/helper.c: patch does not apply
Patch failed at 0001 target/arm: Flush only required tlbs for TCR_EL[12]

What is this series base commit?

