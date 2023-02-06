Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B5968C65B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 20:01:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6jb-0001z9-Ey; Mon, 06 Feb 2023 14:00:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP6jR-0001xH-DS
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:00:51 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP6jL-00074S-AB
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:00:46 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso11484700wmp.3
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 11:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sh+zRdZjqnzdHsztzozyzvh2mHcmb+rVWQloRpkidLo=;
 b=S8rRBXUwf+vME6a7H6sLbKh4unJtEBImJfY+ltPgh8gDYbxCLktRqZSMVwLvYcMRH1
 1bAg9rbtu5AcYwEfvfUOD9hWlyNUMh7ePgeEhJ0StaPzJ5H+zvDGqlpTIO5V+cGqTSq1
 VZSYxB6ORi+pqwi2hZZRVojeH8TLglmtSDXf4rieh1G0oxkRb4u5myL0pPoFTgoVK5km
 PumefimQjJPlQL86BpurCCE3DV9DArBy4ApWAwz1KCeOukjzFvnRFFQcV8oZsW/eJWme
 l5HvcIrxagFzbmKps8CxFRKciyh5GLPmlEDa8/B04OkpRLAQG5hcdyS8A7jAk/XELmJp
 ZmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sh+zRdZjqnzdHsztzozyzvh2mHcmb+rVWQloRpkidLo=;
 b=1sK3wv+5uXBR/7upHC6+9jsRj6Ghaj9JSt3gAHKemWSokIvSRnUoNZC5aEC9vJw23l
 VdRWTixWluZcvNcFxc8d9D6VEJtGgruSUacuf7cBHRMe8D+D6v7/WtvpADtbTdrkNlTB
 NbXCFABE264X2cJPuZALgAHPuuDLiilYq1bcznMs+OvT+NySOP4cvd7OC8sltDGxOdmH
 yp7jvNRaHS/SvSjbRs6IvkxYYDnwCy9N/SGf1ED8JkE/gd6rKit9eZWoBI/8iwEM7+y3
 u9Q4J76RZzWZ5ZROLWs5+HhGdkbWgfFtNGDXdj1Q0bC0yshCgcMMVnRE0trYKBJ0RLFw
 1/Vg==
X-Gm-Message-State: AO0yUKWT4kW6HyYxFHh88aLbovGR2f4jUoAR+iJLfZ0mmjPvNAMLZV6o
 LlGipTpetwasHBSjRUKMqTuRXQ==
X-Google-Smtp-Source: AK7set/tO/FeJO44cjyzMz3sk9CIIgjLaPcflmSjt4ZL8OlK9yTWoOFlzdmG4Fnt4ZrBMv1J4xwn8Q==
X-Received: by 2002:a05:600c:16d6:b0:3db:14d0:65be with SMTP id
 l22-20020a05600c16d600b003db14d065bemr667805wmn.34.1675710040636; 
 Mon, 06 Feb 2023 11:00:40 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm10957016wmf.42.2023.02.06.11.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 11:00:40 -0800 (PST)
Message-ID: <55a05bd4-5dd9-6880-2d61-22c31298d1bf@linaro.org>
Date: Mon, 6 Feb 2023 20:00:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/9] target/arm: Restrict CPUARMState::nvic to sysemu and
 store as NVICState*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-7-philmd@linaro.org>
 <888efe85-b495-41c6-742e-70e9a0a5dfe1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <888efe85-b495-41c6-742e-70e9a0a5dfe1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/2/23 19:57, Richard Henderson wrote:
> On 2/6/23 02:17, Philippe Mathieu-Daudé wrote:
>> There is no point in using a void pointer to access the NVIC.
>> Use the real type to avoid casting it while debugging.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> 
> This is doing several things at once.  The nvic interface change needn't 
> be done simultaneously.

You mean this change?

-typedef struct NVICState NVICState;
-DECLARE_INSTANCE_CHECKER(NVICState, NVIC,
-                         TYPE_NVIC)
+OBJECT_DECLARE_SIMPLE_TYPE(NVICState, NVIC)

This is a No-OP, converting from the older DECLARE_INSTANCE_CHECKER
style to the newer OBJECT_DECLARE_SIMPLE_TYPE. But OK, unrelated, I'll
remove it from the patch.

