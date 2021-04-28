Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5FB36E0D7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 23:14:53 +0200 (CEST)
Received: from localhost ([::1]:36696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbrWG-0000Pf-Gz
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 17:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbrUX-0008QG-GY
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 17:13:05 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbrUV-0002VH-D9
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 17:13:05 -0400
Received: by mail-pl1-x630.google.com with SMTP id v20so6298830plo.10
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 14:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9Z5oboDzxXxzdKEckLj8+ZETX/D+qWm3IQEciGdoewA=;
 b=akPzOmoMDjGqkfbykltI6yrLwynKEDenrff7owHESCagDUCqPM3l9N+V7QeAGUZajS
 e1TN6dTp5VF1iO0QrHxxUpb+wa4BOu+WlF/3Y1DHcBQMzJBUZSGXr/DohqH6Qiwfgg8p
 nXV2orYIMwaZhQsmQrWoKUlBPFkiUozz3wGXS+4bMKi+5P8v9aEwWtFdfyQSPo5PEniq
 6CqoxOXGyjBO/r6DNh/HfuYqLNx8QDZvSXGAHqHJvZjw7vh1IgCQeYQIy5TnKhSs8aie
 xKq7cY9OkCPxQkZ7hxG8qobLDooOinJnMRjoRtOeqWJmWW7aq95hIkUgvR1Vf1PGzgIU
 MU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Z5oboDzxXxzdKEckLj8+ZETX/D+qWm3IQEciGdoewA=;
 b=ZW2u+xtfquFXrapuF3HZpfeaxK2xASoUpt20IM3R1wDvh66bw5abjGodt0+A0E9Up5
 ZB6MxTROupybK0z+oCO7Z2F6PIySARosv69zvYUF4Xt5DZbeiJbVrl0oCmiCuFzVInmi
 fvPqnqh2XInSALsJh4t899C4ddIqVjX428qPIXijus12XBDLc+5dCntUV6JVLbsZXtoY
 IjLo5A8npqST7/o40WHqVenwEJrQf2wJmsS61LL4vRyZ3r7Lusk45b4nzkOBfTq7gbXr
 /MHiskwgZMTmdQBMb/hmXRUeoVtZH6ErgAGJtzxVYM4LXeTtaqRjnUWmNZsbUydBZN6W
 sj9g==
X-Gm-Message-State: AOAM533N7jEePOmoEMwxx20IELFDjw63FOMFvl0YxZ5O+kStw4OpwY8C
 10mL1A1ORgTW3krJ2X2fieOYzA==
X-Google-Smtp-Source: ABdhPJykPHYH7ljgEfg9hxtkHcKtQQQ+Q45Lb3ZD9ojE/INhSUv7aDt67GL1GeW83h61FafSxdfeXQ==
X-Received: by 2002:a17:90a:a613:: with SMTP id
 c19mr5992463pjq.117.1619644381837; 
 Wed, 28 Apr 2021 14:13:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u18sm539332pfm.4.2021.04.28.14.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 14:13:01 -0700 (PDT)
Subject: Re: [PATCH v4 00/26] Hexagon (target/hexagon) update
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c28f4f95-fdfc-c67e-d9fb-dea67b56e337@linaro.org>
Date: Wed, 28 Apr 2021 14:12:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 6:07 PM, Taylor Simpson wrote:
> This patch series is a significant update for the Hexagon target
>      The first 16 patches address feedback from Richard Henderson
>      <richard.henderson@linaro.org>  and Philippe Mathieu-Daud�<f4bug@amsat.org>
>      The next 10 patches add the remaining instructions for the Hexagon
>      scalar core
> 
> The patches are logically independent but are organized as a series to
> avoid potential conflicts if they are merged out of order.
> 
> Note that the new test cases require an updated toolchain/container.

https://gitlab.com/rth7680/qemu/-/jobs/1216248227

The clang-user job errors out with


> ../target/hexagon/genptr.c:31:20: error: unused function 'gen_read_reg' [-Werror,-Wunused-function]
> static inline TCGv gen_read_reg(TCGv result, int num)
>                    ^
> ../target/hexagon/genptr.c:322:20: error: unused function 'gen_set_byte' [-Werror,-Wunused-function]
> static inline void gen_set_byte(int N, TCGv result, TCGv src)
>                    ^


r~

