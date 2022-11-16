Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067CB62C2A6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 16:30:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovKMf-0000NR-Rb; Wed, 16 Nov 2022 10:30:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovKMd-0000FF-CN
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 10:30:11 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovKMb-0004qb-Hj
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 10:30:11 -0500
Received: by mail-ed1-x52c.google.com with SMTP id v17so27068114edc.8
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 07:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q/zW45vXNkDj8kWIkRqzsIvpj5j2PsDN2ck0pJmk3xc=;
 b=gCfQhnKxxT+GA2a8oYiYpGFpqHWts8WGuzetzm2eEcNO5qCwOH0RAtWXWFzqY9xX1F
 DXvn1JXoZ4GoKevsTNsBuzLh7UUDcrdrJGYwIn/aWDwajSoYUozSkBRFZGoVp50KFN2y
 JVxPURED6rRnmAvZYs/N6mFfQpCyfua6hKED7FL3ko8MWdJH1xE83/BC9orM5AKipt4o
 coYZtGV+FyGDO/eqT5lSSghQiR7RH7svSPPoviPJO4D2H4INvNMU4x+R0u6YFSxtYLhG
 PrFCvBAwFN3EtZvznSBZP/rneoc3a3/kYlo1wpAC61u8q3p4XnyxdKL0AINEiZL7dbOL
 O3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q/zW45vXNkDj8kWIkRqzsIvpj5j2PsDN2ck0pJmk3xc=;
 b=vq0YVHGjzvGj+H3DRtLF9CKxBTIHfiJsM/dYR+Gg6lfztdNMCeD9mgqBND7eLzhz9k
 GvDsFLpYbjbXQGa57FNXYa/dkPA7XSbUXdNXLSZgOol35HFBqiN8AnL+ruvYUnirUuYs
 bIVngM2yXCESjObn6Y7/mxSzCgHf8rDT9KASnLvpI4q04Qq5hHTnKfwCeWbWKgzH7mr/
 Lkd/1chQsuFF5gvL5TuKsaVdXz0YQcAiNC2+9gK2LkBA+V2yLK5sRjrRfdNQaLMn3t2U
 SIBUU5ojrIk8pe+Tq4mp4iSdrSb4iTW660Pf/Ct+vBE+9d53Ax9eo28qLh4KjA7v+hEi
 LHcA==
X-Gm-Message-State: ANoB5pnmc4nQ+sl3DPEArcnt+j3CVrXCMiRvlrkolR2FAYtknkBlEiS/
 +INk/+8CtUT9tSjsWf/xUOziuA==
X-Google-Smtp-Source: AA0mqf57HmMB0aseCJsSToxgWa1/7S5xFiKaHY/mBGhMkmKy/spHW0Yx1wXukwGMtcN/hqDD/kPAwg==
X-Received: by 2002:aa7:d793:0:b0:460:d1f6:2917 with SMTP id
 s19-20020aa7d793000000b00460d1f62917mr20145276edq.207.1668612607986; 
 Wed, 16 Nov 2022 07:30:07 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ke11-20020a17090798eb00b0078135401b9csm7006008ejc.130.2022.11.16.07.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 07:30:07 -0800 (PST)
Message-ID: <51b78663-2b5c-2599-da04-a0a18e8315b8@linaro.org>
Date: Wed, 16 Nov 2022 16:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] target/ppc: Fix build warnings when building with
 'disable-tcg'
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>, Vaibhav Jain <vaibhav@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kowshik Jois B S <kowsjois@linux.ibm.com>
References: <20221116131743.658708-1-vaibhav@linux.ibm.com>
 <20221116162025.330e5a4f@bahia>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221116162025.330e5a4f@bahia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 16/11/22 16:20, Greg Kurz wrote:
> Hi Vaibhav,
> 
> Nice to see some people are still building QEMU at IBM ;-)
> 
> On Wed, 16 Nov 2022 18:47:43 +0530
> Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
> 
>> Kowshik reported that building qemu with GCC 12.2.1 for 'ppc64-softmmu'
>> target is failing due to following build warnings:
>>
>> <snip>
>>   ../target/ppc/cpu_init.c:7018:13: error: 'ppc_restore_state_to_opc' defined but not used [-Werror=unused-function]
>>   7018 | static void ppc_restore_state_to_opc(CPUState *cs,
>> <snip>
>>
>> Fix this by wrapping these function definitions in 'ifdef CONFIG_TCG' so that
>> they are only defined if qemu is compiled with '--enable-tcg'

Interestingly this config isn't covered in 
.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml.


