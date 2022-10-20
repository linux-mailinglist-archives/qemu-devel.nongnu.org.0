Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505D3606472
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:27:35 +0200 (CEST)
Received: from localhost ([::1]:56414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXS6-0001QV-LC
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:27:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXOc-0000OU-9Q
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olUJs-0001TH-SX
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:06:50 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olUJq-0006SY-92
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:06:40 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 g8-20020a17090a128800b0020c79f987ceso3235861pja.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eHj2xvzFNLr9gyBfCqXDUoXUVXCjsjsI0T0DxBoaKWM=;
 b=n1PpfCnpo7qAkxqGWv3C3P0heSSiXa0W9uGRGotcyn6f2FP6KiYjWo+j9pVSBzHPJH
 SQcv8iZQd9ElhwS+/STT9bNuTrDBxeWJS14XZARudOnAqyVaYRVTbLUU2FNDcLPKx1rC
 sdv2qc+DKl0nf0LTyMSjVBfvEaZV0XmDoXh7C6xCtTAuQGGk8wdZGHEhwSLeam3+3R8e
 LmMeuoFzd9JbbNtptbhblAcf02h9fD9QhZdVpWpf2baztmKucRs0iXnJPhn7j3GzQMlN
 6nbDE7c5pJuck+/ldN6Z+7Pz2FrFDjUM70CR2zTgnvFG1HrirfzPVP69fUGKK22rkeAe
 SdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eHj2xvzFNLr9gyBfCqXDUoXUVXCjsjsI0T0DxBoaKWM=;
 b=1mqu4BTmnhn1N5/IkxQPqwNwtkgK0O8iAsmXzKfVf0fi2pvfNpDO94snU1IpUzhqO4
 PFA704iABqcKmCm2L3kvFiXih2T8s8xQ2lXbdC2ukxiZ90xJFcrvOM822U4v0xnMTHZP
 qRvuYbLPnAu0YshBXLXaSSfMqbxSCKNsULDO/k1QcFpsG5B19EUIgbObJw1bZXOXgnkl
 1jt6wAJd1zpBZBN/BFOttVvyQHwaT5wFpgyljP0g2THCZ6XKhDK7ZY7NePfcL9t8Ymsq
 Y3NR2rusjR+f4TEZl4diA0+fEVga9zzTNgPBfJXbf/YHEmmk7Hr05W+NCGiVfEz6Yoh4
 DXCA==
X-Gm-Message-State: ACrzQf3guz3zTCrRXEL6dHS0m93sxYwGg6T4lDBzc2c1XlRwMgkyK9bE
 Z5l4jAjiaiqYrJ3vAVBrBPvQ3w==
X-Google-Smtp-Source: AMsMyM5YxfyTtrhbIwVHH6Bzk2X/8Wjprj9oE/HJmBkE4LoXMOlb2r6KKJr90Ll2hcy3kRNS+eHvjw==
X-Received: by 2002:a17:90b:d88:b0:211:4d8:1c93 with SMTP id
 bg8-20020a17090b0d8800b0021104d81c93mr5623067pjb.41.1666267596768; 
 Thu, 20 Oct 2022 05:06:36 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a17090a0e4900b00203917403ccsm1671765pja.1.2022.10.20.05.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 05:06:35 -0700 (PDT)
Message-ID: <a6b0bea6-c4a4-3536-8e8c-98e7ba2e3227@linaro.org>
Date: Thu, 20 Oct 2022 22:06:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 23/26] target/s390x: don't use ld_code2 to probe next pc
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-24-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020115209.1761864-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 21:52, Alex Bennée wrote:
> This isn't an translator picking up an instruction so we shouldn't use
> the translator_lduw function which has side effects for plugins.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

