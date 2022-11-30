Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57B363D37F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:35:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KQT-0003xj-Dh; Wed, 30 Nov 2022 05:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KQ5-0003nx-Ee
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:34:26 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KQ3-0003I1-V9
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:34:25 -0500
Received: by mail-wr1-x430.google.com with SMTP id bs21so26361951wrb.4
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hTxWwQ8pnHBAhVWILiznOV1ouS7gsNZ043hLdvyA3EQ=;
 b=Zs4THspAXzcYFHeduMODa1aGlXvp5UcNzgDJy74d03NjTwsfadh02kdVIenV5wAaeQ
 EjCwz1Aji1NNwMXKHmp4hJIeajJ30HCnIAKMpo6V7o8wVqNou5hpx6dc16A4G51ve9Ot
 0pkJ1mLulh30lQelm7Isup1osITGF4ZVfyGzWPmTgwBPX/ZIdQ/VRC5SJMEaFlIoHAB5
 36EkJo205zNkFdf5ZcdVk3vie9jc6uvnBgIq3Bkz4e4y9s9soBcyCrK1AVpWkcxbjUSK
 D44Dmb5bz+2hP5UrUWcWyfaL19jdbrE8UArKp1TOmzZTPk1bsvDaD6ehPuHxDUyhUqSG
 x+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hTxWwQ8pnHBAhVWILiznOV1ouS7gsNZ043hLdvyA3EQ=;
 b=51NfLBB41R+hgQVwk4nVbU0xE9rauQ6Iy7e4GEQFNEfRLUOZicTT3nCGdKQPIImps0
 DHuxeLeKLo0blN2he1HJMFIQWl7oKfi8Qe4/8eHWt/o6J8XBGp74PJW7SihyVAzpihH3
 vkxZjOMrS/NIyFwLA7HL3FtcQarMTeFooCtlbsJclePR88KNRZ2mvUjUZjqVm0RD8zi5
 PCz4dGNKQpmLB3zoJphup+1oaoWJX2u+DVXifniA5W0MWTlc3B8pDl+aiuctYSA103S3
 UZc34bYRlQdaqBmHSuFoBPehbinDvqYUob795HrUHjYk7Mu34NgfUYqitObVzAOTXCmv
 Ap0w==
X-Gm-Message-State: ANoB5pldbF2d6/fltZZAvHdAsBjKb1QUwt88tDgFA3qKOf2QYfKUokmq
 9XuE2aVa8iF131WJxvJyBe7GoQ==
X-Google-Smtp-Source: AA0mqf7m04Bf3ONY8FOOw2epGngUOiWr1RZ8t8p1f2bLVrwpozRmyMB1Xh4+XaMKy/tzDxlKg0Uwgg==
X-Received: by 2002:a5d:5955:0:b0:241:553e:5040 with SMTP id
 e21-20020a5d5955000000b00241553e5040mr31335614wri.578.1669804462618; 
 Wed, 30 Nov 2022 02:34:22 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bi18-20020a05600c3d9200b003c65c9a36dfsm1360913wmb.48.2022.11.30.02.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:34:22 -0800 (PST)
Message-ID: <ba706176-3d87-49ce-e9d4-9bc059bc8812@linaro.org>
Date: Wed, 30 Nov 2022 11:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 9/9] hw/intc: Convert TYPE_KVM_ARM_ITS to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 9/11/22 17:14, Peter Maydell wrote:
> Convert the TYPE_KVM_ARM_ITS device to 3-phase reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its_kvm.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


