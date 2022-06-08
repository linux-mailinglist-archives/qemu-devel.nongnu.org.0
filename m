Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B76543741
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:24:44 +0200 (CEST)
Received: from localhost ([::1]:48120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyxY2-0007Yn-Ty
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyxWJ-0006Eg-9m
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:22:56 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyxWB-0002hM-E7
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:22:55 -0400
Received: by mail-pl1-x632.google.com with SMTP id f9so7460754plg.0
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 08:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=YGMvjKFnZxevJYCBg65pyaEP7Eu5BMYnTKt8VLuNlug=;
 b=XWIsuY3CHocPK2wPTKHQyh8R6RfSRI/OC5+QhVMRxszAOixZulUo/H64CPhyQTT2ei
 r6D8e3FKUVY9HpMc84C0T7+Y4BTbEvn1UoddqTwC94LWJAFYwyVt6L5uOVrjNDF6IAbv
 oYop06QXk09BFhVVZtoMsKNytnSIvcKHaL80gYZEaQ2N2MtMq6jv3xyNn533WJ4M/fjx
 kYXXDyJNBgj/eYkvSOww1kZa51H+uIMb2D0yAEDRzLK6hms1GdoRWFId0VufMLjjh5HI
 BAUNWmZeN+8lzgjjym4JLHo519+5aDHALuvLktPYCLnxeo96fjrHfeHsUBMjI59PtnxZ
 0R/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=YGMvjKFnZxevJYCBg65pyaEP7Eu5BMYnTKt8VLuNlug=;
 b=klhOVlJKb3PDVebl8ffxzMefXrbljfEBbmh7g7tjdSup6XdVWoYrC/xJy3o+2groCs
 gFW0HbDYZrmNpdmsDhUyJfBfZIgwdfvKkZ0SXvCCylcvrK8uicZqy1YV6PQtTWcXjuA1
 r1sadgrQuThjZZgjPqnogSgfqyKNmoYZFV3cRV/lbT2g1wAyvWsMMo2i+sRkfM8qi7sb
 ELiAVrNeY+6nJ2q7SiMMPtqmcfXQmEW9VUiorKOR2UrJP1MuJ+SreYnDEveRpieaiOgl
 zHG89GqrjPE+4sZ7yAL3uxs3f1dXn+BvD35KjkGsinvNIIveNmF5JaAetxblQF4BDDuC
 UC6w==
X-Gm-Message-State: AOAM532CxZHkGMp9vjfJ3+XcRjjrqmubI7NWRPoXcRT21FWdcJfNYmgl
 aVSp1W79mDCbHzvENVQZmB2DGg==
X-Google-Smtp-Source: ABdhPJxIFnsGK3Wc8/a1nvro+tJ1OQvZG1kp2a78QYfMHW1nskB2dhuU2L6MoUx9Nt8D+lAGlyHTPA==
X-Received: by 2002:a17:902:c745:b0:166:496a:b455 with SMTP id
 q5-20020a170902c74500b00166496ab455mr30453880plq.135.1654701765904; 
 Wed, 08 Jun 2022 08:22:45 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:6812:d08e:b22c:43d7?
 ([2602:ae:1547:e101:6812:d08e:b22c:43d7])
 by smtp.gmail.com with ESMTPSA id
 g25-20020aa78199000000b0051844f3f637sm15128690pfi.40.2022.06.08.08.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 08:22:45 -0700 (PDT)
Message-ID: <bf61338c-9328-14e5-3e0f-b147b356431b@linaro.org>
Date: Wed, 8 Jun 2022 08:22:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/mips: make SEMIHOSTING conditional on TCG
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20220608104054.323642-1-alex.bennee@linaro.org>
 <8c3735a8-3de1-d096-26c9-912997d26db0@linaro.org>
In-Reply-To: <8c3735a8-3de1-d096-26c9-912997d26db0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 6/8/22 08:14, Richard Henderson wrote:
> On 6/8/22 03:40, Alex Bennée wrote:
>> Previously SEMIHOSTING was always selected due to requirements in the
>> helper files. Since the original fix there has been refactoring in the
>> mips code to split TCG and KVM code. The recent semihosting
>> refactoring triggers the inverse build problem for KVM only mips
>> builds. Instead of selecting it in the common config make it optional
>> on TCG being enabled in the target Kconfig.
>>
>> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
>> Cc: Richard Henderson<richard.henderson@linaro.org>
>> ---
>>   configs/devices/mips-softmmu/common.mak | 3 ---
>>   target/mips/Kconfig                     | 1 +
>>   2 files changed, 1 insertion(+), 3 deletions(-)

Oh, I would expect all of the settings of SEMIHOSTING to be done this way.  But I guess 
mips is the current target that supports semihosting and kvm-only.


r~

