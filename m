Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0B365AC4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 16:05:41 +0200 (CEST)
Received: from localhost ([::1]:52892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYr0W-0006c9-Bm
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 10:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYqym-0005nt-T8
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 10:03:52 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYqyl-0006Lr-23
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 10:03:52 -0400
Received: by mail-pl1-x629.google.com with SMTP id p16so15771411plf.12
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 07:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c4DvaXhjYA2Bffn+bw+HO7tnsZWNg3eH8xDMWDty6Ng=;
 b=jVjD8KLWFziMsGoN5WuozB4fEVwXDBERQYFTb8FoKa+0GtFN53SXTEoRLsViWJ9Vwg
 WGD9iR/YtocHMu+q7a2oT3RYuNqsWS3RNs1AHEOg7aG6udWwibNLBP74Zw2h3Rl516Qb
 IuBrHIFysqJdQJpBNlOVBEAu6SPRBAJkr/Q0dH9s/oB2anvEQTRhmBUAIoKFY7xQtDlD
 scduCmAkCyVyD4Jycxu9X3A3Rq+QexWvgdYOqaA/+yYAqx7orGpO1edimBa5VI4uAMHO
 uTqobLEp500FQsikfvrrVSFHp8uzosQ+VZYKPe5tfFOHGxlme5FLWOuh+XYIraF04laC
 Zejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c4DvaXhjYA2Bffn+bw+HO7tnsZWNg3eH8xDMWDty6Ng=;
 b=Odr5xw1t2lW2Zm0uziivSxvyFsGhltBXlbd/zzF9eAECSOWpsRn3GLUqFEclg3ou7F
 HE/TF+oRImUX8pZif1DE2WLrHAdMCNRGJMDT2c+yLWDw09o1iaPqPt92HUPFdXqykzFD
 DE7oiO2K/shSta2d7WjqqN/w36LwSssnkOfY69aH0rdnfs+SYVipxtW8TltMYhCyDYCn
 6wpbePrzUxzVAzeXYGDQFoRONxnIer7wI8EDnwNqlEFRBuO1VwUBaxqn+ChNgNrGWYYd
 EQFxFeWO3+RaFiYZz+MF7TWdtIVyugot5ZJ6sGLvKJPqmYRd+tnGOjUQxngTPq79mKIE
 9NOg==
X-Gm-Message-State: AOAM531vAW1lgkjyQGZTFELwOiWeSMHGFObEdrK30n0okNdXhyaIFVVe
 1ZZalzvD9lNnj0Hrj01IY1oLNQ==
X-Google-Smtp-Source: ABdhPJxbBM7Yy6Hv0HDUKUoIWfePMCAgXdsBT40TLJW4LrKgoYP30wlDyHetQ0rFTL1VfVF0WxM/GQ==
X-Received: by 2002:a17:902:7fc9:b029:eb:4828:47e8 with SMTP id
 t9-20020a1709027fc9b02900eb482847e8mr29723837plb.56.1618927429420; 
 Tue, 20 Apr 2021 07:03:49 -0700 (PDT)
Received: from [192.168.64.62] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178])
 by smtp.gmail.com with ESMTPSA id ms8sm2618328pjb.57.2021.04.20.07.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 07:03:49 -0700 (PDT)
Subject: Re: [PATCH v3 08/30] target/mips: Declare mips_cpu_set_error_pc()
 inlined in "internal.h"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419191823.1555482-1-f4bug@amsat.org>
 <20210419191823.1555482-9-f4bug@amsat.org>
 <5ff019aa-00c5-f600-eb2a-4c8d3e3a0dd1@linaro.org>
 <6643eb6f-ab02-c66e-7689-20864f93565f@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e3bedc7-0bb1-478e-a384-98b3ac2efca0@linaro.org>
Date: Tue, 20 Apr 2021 07:03:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6643eb6f-ab02-c66e-7689-20864f93565f@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 1:42 PM, Philippe Mathieu-Daudé wrote:
> On 4/19/21 9:27 PM, Richard Henderson wrote:
>> On 4/19/21 12:18 PM, Philippe Mathieu-Daudé wrote:
>>> Rename set_pc() as mips_cpu_set_error_pc(), declare it inlined
>>> and use it in cpu.c and op_helper.c.
>>
>> Why "error_pc"?  The usage in mips_cpu_set_pc certainly isn't in
>> response to any kind of error...
> 
> Indeed, but I couldn't find any good name. mips_cpu_set_pc() is
> already taken, as is cpu_set_pc():
> 
> static void mips_cpu_set_pc(CPUState *cs, vaddr value)
> 
> mips_cpu_state_set_pc() maybe?
> 

mips_env_set_pc?  Since cs vs env is the only difference...


r~

