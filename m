Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B69519558
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 04:07:08 +0200 (CEST)
Received: from localhost ([::1]:44700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm4Pz-00016s-7C
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 22:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nm4Oe-0008Ap-GT
 for qemu-devel@nongnu.org; Tue, 03 May 2022 22:05:44 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nm4Od-0003sR-1X
 for qemu-devel@nongnu.org; Tue, 03 May 2022 22:05:44 -0400
Received: by mail-pg1-x536.google.com with SMTP id 6so20380pgb.13
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 19:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YlfIgrpRuj0rc5LLHZhcWNKIN/0tW2otVvF6uMUlaTc=;
 b=Q5/+3GWOkFF2f3rWPozQjEJFZBocFTNv8V/9RQcGGEPdf7o6bNGFJg5WDhwkb7/bgt
 5s2xQgTdDCSvGJhpxn0s3BGi++tYcT+yZpsIkkF4YQuUhy7wslJIIsHPFd8FBX5Gw+7r
 gksKThP7R3e+nRWztITlhH3Db8hPRTDja4nMN0wie234KvVy5zOIO8CxZLgRpG9rW08m
 q80inxet7QqADwxw0cIFC9+TN136C5h8aE5yNzhN2sbSdJOzp+Pz/jWl3+MDIxP+Bc8+
 SqSWrwdTItFbn2iEf0eh9dXyxT8a1A6pR2MKxSu/b+42dTYb1ohxji5xjfIWl1O6r2Xm
 U3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YlfIgrpRuj0rc5LLHZhcWNKIN/0tW2otVvF6uMUlaTc=;
 b=3DAt6LaRcw0OqS3reRfJNkh3eQAQ264aON5FWu3RoczHi8CNH92YxwFMmq84twkaJr
 78qsMafUV1+eDzJurFw4le+8bpd+a6rGrwE7EUTkzzQQZLAwbBfWnqLs+m7MDJt/buBu
 fyCxUVkoOdxa9XY9HCMh3Jqlny4v/HZJPeb3JAvWME8c4aidEUWPpcwbpoRq5iZaTnIB
 YITmaquZAPbf2/tGaqQ/8x2IwydJ2SdpvmNeDybHbwX/XoC35UGO1remhg+sdip+HxuW
 Ya1hE1nENbMc99RJmTUJXKArpUs2TVLXVkaQQ6NFOWr0S9fP4OrVFcDXkxHRENg+FPvE
 XtjQ==
X-Gm-Message-State: AOAM532jweXMZjiL4VfzzaHpzlADQdkq7kCjBMVRiOnIdirYRVFdCx/F
 pn+zXbTYObGFKR3PA53yS6MrsQ==
X-Google-Smtp-Source: ABdhPJw47ujwXtk5CIWlZ2hvKFezYPjwHyHkRvSLOTMC9QTwrogwJsbvoJfj6uV3+1/Ign1cF3sZyQ==
X-Received: by 2002:a63:87c1:0:b0:3ab:254f:7aff with SMTP id
 i184-20020a6387c1000000b003ab254f7affmr16205823pge.341.1651629941661; 
 Tue, 03 May 2022 19:05:41 -0700 (PDT)
Received: from [192.168.4.112] (50-206-49-78-static.hfc.comcastbusiness.net.
 [50.206.49.78]) by smtp.gmail.com with ESMTPSA id
 t3-20020aa79383000000b0050dc762815asm6968054pfe.52.2022.05.03.19.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 19:05:41 -0700 (PDT)
Message-ID: <ed1a7672-c3d0-93c7-a5d3-b8bdeb067993@linaro.org>
Date: Tue, 3 May 2022 19:05:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 14/21] target/ppc: Remove msr_ir macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
 <20220503202441.129549-15-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503202441.129549-15-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/22 13:24, Víctor Colombo wrote:
> msr_ir macro hides the usage of env->msr, which is a bad behavior
> Substitute it with FIELD_EX64 calls that explicitly use env->msr
> as a parameter.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> ---
> 
> v3: Fix the difference check to use a xor
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/cpu.h         |  2 +-
>   target/ppc/helper_regs.c |  2 +-
>   target/ppc/mmu_common.c  | 11 ++++++-----
>   3 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

