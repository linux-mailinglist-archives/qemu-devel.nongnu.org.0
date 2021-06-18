Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03FF3ACE16
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 16:56:35 +0200 (CEST)
Received: from localhost ([::1]:46536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luFv8-00019J-W7
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 10:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luFtn-00004y-Jp
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:55:11 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luFtk-0003a1-OV
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:55:11 -0400
Received: by mail-pf1-x433.google.com with SMTP id u18so2499838pfk.11
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 07:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3Bo9n4pUebtWAcFpUbCKk/O7cgPLx6wOGF0jEVYOu+E=;
 b=m1AlGpIMnIT8qS8fvJPJWotLgoMzJwiiXvnJqep2MRqEiM0cGCQ9q6A+38qyDUicTr
 Vf9hBWGxc8ZiDNfpGXzCtystMyjph63qc0lQtCfMd5Wuf5Gkey9CRgknC8wG3jBBTMK+
 CYym27tt5ZZlbbTiM9Szko0G72q5+2iHotwxhThkxB0f2KH//uIep4TTdY/SoQtDWnrb
 WNk0wFUnmIdOh1H7wgd4nEkLHuDVYBsTbxyOMA3OQrXf9Cs/TEQWtZij9qA/UXYt9Gwi
 bsMV53BAM5OSqUCfs98mbLSFTcRVEOs3DGy8rVWCLEIL0vQfzcEcbddZ2u8BRyhDcNUw
 ysOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Bo9n4pUebtWAcFpUbCKk/O7cgPLx6wOGF0jEVYOu+E=;
 b=OZTtLUwfLZ3KjNEgV4HQdJgNaHVQeqs3C1fkVmYYkGx7ojxG5ftYiflBYAIKh+07cL
 atAX0P7PFiMb1SButYWq1OugCauApz419Y+gtZgyxgQGSG65S8+LIYFDJpKQvUEAoJXx
 6vcafadB4F2YqLjVXZef/6TTuBY4gAiatG20GUan1UrZc0UoJM+I39gcnKP8xnTGDQth
 6TEgg/mLiOISAK/4cLJj+xqKHPRW9OwThPiXhYRrYxaTAJtj4ceZYfVhRuSk7+uodICf
 T30d5fp5f1gK8M1dQBrqxD3dvooOZD5rAXV8p4xY46mXTCgUX9n3NgW/IxEICOWFADL3
 327A==
X-Gm-Message-State: AOAM532CgLWexflUIg9zLZ42rKRTc5cenWtivf49dTU+HMvx+gKFJLRV
 /WyWBrS66LoJMHHMg8KEUUEVEQ==
X-Google-Smtp-Source: ABdhPJw4Q384ruO6qIb/4iE3FQ9BpNSBXkUxJizEFk1bYtgnf0zlGkxP28rBRVPwxnpmcp0o2rncYQ==
X-Received: by 2002:a63:5b21:: with SMTP id p33mr10537383pgb.402.1624028106880; 
 Fri, 18 Jun 2021 07:55:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j9sm7964742pjy.25.2021.06.18.07.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 07:55:06 -0700 (PDT)
Subject: Re: [PATCH v2] docs/system/arm: Document which architecture
 extensions we emulate
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210617140328.28622-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3bdcb6f3-420a-c0a1-7a8c-63729d1d8cfc@linaro.org>
Date: Fri, 18 Jun 2021 07:55:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617140328.28622-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 7:03 AM, Peter Maydell wrote:
> These days the Arm architecture has a wide range of fine-grained
> optional extra architectural features. We implement quite a lot
> of these but by no means all of them. Document what we do implement,
> so that users can find out without having to dig through back-issues
> of our Changelog on the wiki.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> ---
> v1->v2:
>   * sorted A-profile list into alphabetical order
>   * listed the component features of the cryptographic
>     extension (FEAT_AES, FEAT_PMULL, FEAT_SHA1, FEAT_SHA256)
>     separately rather than as one "Cryptographic Extension" item
>   * added missing "SVE2" line
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

