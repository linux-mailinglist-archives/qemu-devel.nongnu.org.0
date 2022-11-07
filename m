Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FE861F64E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 15:41:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os3Hh-0000ZH-4Z; Mon, 07 Nov 2022 09:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1os3Hf-0000Yv-Mh
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:39:31 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1os3HT-00013B-1C
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:39:31 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so1869863wmi.3
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 06:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IXs6PaEBUPBAgalsZO5rOuCXzL1sRHPyoX1MVSmBbM0=;
 b=ZNUR42hr/eYrJi8SHQHjk/7wfL8dOyjLtd/aIgVS3fu72AOCcEvbkrfRKEVmEGGie1
 mena68B2A9BLihxdKo5xMn52Fb5sbmMcvIsHqJfWk2MMoBrm0y8eJRZ02ZGRKRp27xXh
 ZpSVzJmyhJr1BmoEzPBM/e6aAmHy8R7mnijXeM/tCYzAK6cj7ElWWbb1YI8ilYCFnuWd
 ehh2jJtPpqV6Yvf2IJWV1BToJAczvC+ZekvxK7OpPPlKT2prfCy9MpssI8Y0gvJPZT7b
 YYWts9gKtEcax8uuGn7brcltEyzkvtuw9jWXQpVmPG7bgoHb2fiUP+s+cbDUnpJSRT6/
 2I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IXs6PaEBUPBAgalsZO5rOuCXzL1sRHPyoX1MVSmBbM0=;
 b=Wir5kr4FP9ElPo597nb1Al0+E5re1iNPx8VBlU+ZYa/LxjmnrvFj8i1qirED5O2OXz
 2V8PLW64s24sUv2IsHBLJggwYtR1wDQ7Nwlw9ljwOHfQQSk9kah3SLuHtGocgtwuHos9
 69bP99AQ7JL3dCftv+gtkujgZ3/Md137HJ30coJhMeuPKgqtuXA0E99AigCi19Mn8YYa
 NNiqqHNvrgxOReckQ1tCHcI0/cG3ysoWaF/crs1AZFhg2A67fkiWT42tvnXUcBozkcg/
 gFLSZnkkFcMDQR0vOaPOKmbUmIuKiBTGhy8G6eh+R2IWEhRzQzr+ObeUqz7yhlB23uhO
 iqvg==
X-Gm-Message-State: ACrzQf1yZfvusAMyUek3+BY3eGzMR7Ymohu6g6lMvnV5g0po2+GH2vqa
 4AzlgHP7m+8D8088sxUbJhIafA==
X-Google-Smtp-Source: AMsMyM5R8VHjbYk8ERW9E9y7nJVmap1KHyMsseUdQ6CHsG6bQPZa1SM+XXyAtaVg6ooG0ELYPrrA+A==
X-Received: by 2002:a05:600c:4ecf:b0:3cf:8762:1a67 with SMTP id
 g15-20020a05600c4ecf00b003cf87621a67mr20372390wmq.41.1667831955951; 
 Mon, 07 Nov 2022 06:39:15 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d5290000000b0022e36c1113fsm7489803wrv.13.2022.11.07.06.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 06:39:15 -0800 (PST)
Message-ID: <0a146956-a397-54c1-71dd-cd90a68218f7@linaro.org>
Date: Mon, 7 Nov 2022 15:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 1/3] arm: move KVM breakpoints helpers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com,
 peter.maydell@linaro.org, agraf@csgraf.de, pbonzini@redhat.com,
 Francesco Cagnin <fcagnin@quarkslab.com>, qemu-arm@nongnu.org
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-2-fcagnin@quarkslab.com> <87a652hmoe.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87a652hmoe.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 7/11/22 15:15, Alex Bennée wrote:
> 
> francesco.cagnin@gmail.com writes:
> 
>> From: Francesco Cagnin <fcagnin@quarkslab.com>
>>
>> These helpers will be also used for HVF. Aside from reformatting a
>> couple of comments for 'checkpatch.pl', this is just code motion.
>>
>> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
>> ---
>>   target/arm/debug_helper.c | 241 +++++++++++++++++++++++++++++++++
>>   target/arm/internals.h    |  50 +++++++
> 
> Moving out of kvm64.c seems fine to me but I wonder if debug_helper.c is
> the best location. debug_helpers is currently very focused on just
> handling the TCG emulation case where as we are doing this tracking just
> for the VMM cases or KVM and now HVF.
> 
> We are (slowly) trying to clean up the code in target/arm so we can
> support builds like --disable-tcg and to do that we want to avoid too
> much ifdef hackery in the individual compilation units.


I was planning to move hypervisor-specific code to 
target/arm/$hypervisor/, but here Francesco wants to re-use the same code
between 2 hypervisors... Maybe move it to target/arm/hyp_gdbstub.c
and let meson add it conditionally?

>>   target/arm/kvm64.c        | 276 --------------------------------------
>>   3 files changed, 291 insertions(+), 276 deletions(-)
> <snip>
> 


