Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E281265F63D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 22:51:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDY9L-0004Dd-Jy; Thu, 05 Jan 2023 16:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDY9C-00045W-Of
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:51:44 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDY9B-0005nn-1X
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:51:38 -0500
Received: by mail-wm1-x32b.google.com with SMTP id g10so15219831wmo.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 13:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EOLa1dVPAUJrimOfcqLmk2QS5VtdKtN2As5smKKMagI=;
 b=zO0ozoTN40xxWw2w/drxMVyUzD33MDMJAB1gDuQH45ZCmo9iokWVCM6Sq4E8sIa5a/
 PUaXYeBU8kmQjRmTlXAhOZ6+ftDT7z6okhn4jM5MYaCj7qeQO7SNVTxtdSE+hmTFE4x2
 aYNjCIki/DdiEVIJ27H1u+uF+aB8/FzhPOtgK/Aq0EqJeT0G0jl7xnys4ISsUkj1IsNm
 DZPYLJ7Nf7NOA7gu/OAgcBmd5Kee3S6gQCTlX5DdXsiHgUFe0JTfrN2cqURvhKPBLAkK
 J/jsAOVefcGhn2bg0ru7VEMA1C5JkCSvRT+vAhCDA7DFwoUC0ujWocn154OFcolBF4qt
 0eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EOLa1dVPAUJrimOfcqLmk2QS5VtdKtN2As5smKKMagI=;
 b=AIkdg/ZEwPGWqCrJlNnf+u7jZfrHS/cydIvPwIQfegDUY9jXyvgOMJWwQYcHFSQzJ0
 836ZmzIHQIvcxmvJSlFcBQvo1Hyvo+BbmRFcw2Qahzl7pAK2+E6HbDEkTuIwxlKxGtb6
 dSIIgu98aVRNX3GrySBVWUcITh6emr/xDZnsA8noIuP0OHA4hvIR5H6QB36/7Rb6lBJ9
 oAmBwW+rLH+vPyE6Pmeg3zslw7nMvpkMTtl64poc+qdfnJ3cp3GhnT0pjOR8C64Cd+RL
 wWwBuzFFj9s/3GrMJmYZW2h9a+Hh/BJfHualZ1asJ4G34Cfpr2NfngzezbdKoScVnZCW
 WIvQ==
X-Gm-Message-State: AFqh2koJzr/yvnOJgfiVXdEyyGI0/KVpMSoBMoavrzIaKNgKT/BM3oT5
 5RxEP5KxpOl3mZv5oRpmfLgIdQ==
X-Google-Smtp-Source: AMrXdXsQfPCQwrjEX4P428gPtLhiCfm5gSzsPRRA0jImzVozxIXU93LG3cfIL9V7STwHFrfG4C+bxw==
X-Received: by 2002:a05:600c:601e:b0:3c6:e61e:ae71 with SMTP id
 az30-20020a05600c601e00b003c6e61eae71mr45226065wmb.1.1672955495616; 
 Thu, 05 Jan 2023 13:51:35 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c469000b003d358beab9dsm4148466wmo.47.2023.01.05.13.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 13:51:35 -0800 (PST)
Message-ID: <965525dc-b6a2-c18f-5e69-33475d8170e1@linaro.org>
Date: Thu, 5 Jan 2023 22:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 04/40] target/arm: Remove aarch64_cpu_finalizefn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 3/1/23 19:16, Richard Henderson wrote:
> If the instance_finalize hook is NULL, the hook is not called.
> There is no need to install an empty function.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu64.c | 5 -----
>   1 file changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


