Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507BA4201D5
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 15:57:17 +0200 (CEST)
Received: from localhost ([::1]:52646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX1zQ-0000qc-8w
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 09:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX1xK-0008Cn-Jr
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 09:55:08 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:42679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX1xI-0006my-N4
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 09:55:06 -0400
Received: by mail-qt1-x829.google.com with SMTP id f15so13598881qtv.9
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 06:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FzzbdTJn9rvOD+h8GbLFOnzMNUqeuo2026YN6SDNCyQ=;
 b=bwDO9iNwIVKiblUzpygi0NRSoER+es2Vq7kmfHwsL8Dfnu5GddQIwPsDED6zthoxEH
 HliwMXto0Tfo3Zx//Mcy5xtV/mk0V1GIeHwHP2NojZVSI5zhCTFSw3qqON917RD12W6D
 62oC4FXNJfj3wCLpsBAXgJIzGdxdeVqQwEmn2OoGHjFZSrJPT+joMwwtmXCt2m90N9q1
 2l/++4QKnJe69tsnUtpZVpGH1Xz2HlWyT9GdHln7Zqii/+Pz2GcdbYyh+bFqQ4jkYShW
 f0p54j+iTk06A9li8IpgrWn8RN4mz96lHuK3L1KpeesqY223Era7zh0mkPP5LDRo+De3
 zPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FzzbdTJn9rvOD+h8GbLFOnzMNUqeuo2026YN6SDNCyQ=;
 b=3JxRZp1t2ZrrOPyAppzEsZxTcrPGHlS0JSoh1Zvm+gSArDOn0mQPfGohAOgjSqEoIc
 TYikFWggRpZ5vKCvcmDv0HAIi4i6fYUo4bRsLn5dioNc95iBcrOKDSOqrbacpHlyrIZL
 KGCNQHo9ZeF/KrR+LgecEpGr0InVrTHsbd/1fWOinKGS0bRQBMLbl0Bqja4uHTwZEva5
 SvkvTwTTRh0m/NsR2D6H4ysf6Pww5pTjxsYoiR3CdTbW8WCKlIBSvJy0ngs5MMQPQptY
 x+7w8/JgR304jNp1entYg+AoZuDkxVgx21DM4vS6j7hfHprj33OpPUtXxQqFc9cpj5H1
 iANQ==
X-Gm-Message-State: AOAM531zcZ8+Sy+9NXZobCcWGLGcCDuL8AEp56JSQk2x1P6dE1p8MY23
 7Hza+4/Z+rbpB2Amoz4MU/atRA==
X-Google-Smtp-Source: ABdhPJzqHZPVwT9Lcy4tYbdfA55Gaf8Oj0bBGPibL568mFbOR7jL8FqP7eMHpo1rYrapOeSoTHaq1A==
X-Received: by 2002:ac8:67c2:: with SMTP id r2mr8464016qtp.201.1633269303437; 
 Sun, 03 Oct 2021 06:55:03 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id c17sm6981670qtn.65.2021.10.03.06.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 06:55:03 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Remove unused register from MSA 2R/2RF
 instruction format
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003002501.3598540-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6cbf192e-477f-2173-98e2-6743b5e87f3b@linaro.org>
Date: Sun, 3 Oct 2021 09:55:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003002501.3598540-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 8:25 PM, Philippe Mathieu-Daudé wrote:
> MSA 2R/2RF instructions don't use any target vector register.
> Remove the unused TCG temporaries.
> 
> Fixes: cbe50b9a8e7 ("target-mips: add MSA VEC/2R format instructions")
> Fixes: 3bdeb68866e ("target-mips: add MSA 2RF format instructions")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa_translate.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

