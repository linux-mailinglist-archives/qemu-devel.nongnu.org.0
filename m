Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634C2606435
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:21:53 +0200 (CEST)
Received: from localhost ([::1]:39962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXMj-0002JR-NQ
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:21:49 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXF8-0002Me-8Z
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olUJe-0001K8-Pu
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:06:29 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olUJZ-0006L8-UY
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:06:24 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y8so20030802pfp.13
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dAito+iJTuV+ScNU+7EPO6zEC3vQCU0v1eRbm3sueVU=;
 b=yLbWSVAJ231a1a9GjdkcVOJLXOzzZLIgCNAo5PzHJAl2qIw6+YlpZa+SAvab3oVU3i
 OC69xqf+oxj1ehtT9arMVDcrM6uCpoR7OmTYhaBuoXP5x0rUyuuf6s4GHIcxQK2b3v8H
 CPBq5mQ12VMjU15wxU/YJqtenH49YShrr/UWaNhlUFc6KuLdeEiAM9+E0PEm7NsJIFJN
 PhHG7+FqAW+qRhoz11OOX9DNegbgMWmw20H3nEJFgN7/cMbyOO2px/Alr56ZZNP7+e2v
 YvFbpZgPW6hYc8KIihlNNG+eiX9L6rWp5bqe2jjv13+fV0vlpytW/dSj0pqjjszXQAFv
 AdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dAito+iJTuV+ScNU+7EPO6zEC3vQCU0v1eRbm3sueVU=;
 b=3BtzAV2NpcivGj1NoCCEM0iMUbysyE6ZCL0+bkqPzU8eNaC/0laNI3bggJ9l5WMbBA
 8LlI59yAqmWM3fFjYJTBbuLQEHovSb3gbXAFKsp2sZuTcMgpcHaNO5xLwic07XJgmFvo
 fo1j/BOTBOoOID92XCU3hSWt3Pzq3UTlX8Pl2P3zXt1ui8JwAvMZBGd2OzZPodnvMFbE
 PLVfYdOoq0NWaAzdxVLXFnDLLQRbTdG7aUZAzpGjLSYvOH8pq2BA5pCQEJIJ/naALZxg
 /w2/bsEkVtwYCnBwwFYcpunYi1Md/brGvTajCBtKpw4wS0GBnDmf1P1ISLy6Ty9zA6i7
 RzrA==
X-Gm-Message-State: ACrzQf3+19eqCoyyNW1+BUcrzbovM+hBmwfAogaGaYaeLaHvuz+CNRhG
 VtZ21mDElBxze6+ThyGJYBXM1g==
X-Google-Smtp-Source: AMsMyM7aPuMHg4mkNuLMm0RwjgaiNqgN6hnEX+oMQH/zRridv1sSVhIxr93QCFMGvC8XCQftxRZwUQ==
X-Received: by 2002:aa7:88d6:0:b0:563:9fe9:5da8 with SMTP id
 k22-20020aa788d6000000b005639fe95da8mr13748549pff.74.1666267580406; 
 Thu, 20 Oct 2022 05:06:20 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a62a203000000b0053e38ac0ff4sm13133643pff.115.2022.10.20.05.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 05:06:19 -0700 (PDT)
Message-ID: <9772b561-083f-9029-e8da-678f9c7ab051@linaro.org>
Date: Thu, 20 Oct 2022 22:06:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 25/26] target/s390x: fake instruction loading when
 handling 'ex'
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-26-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020115209.1761864-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
> The s390x EXecute instruction is a bit weird as we synthesis the
> executed instruction from what we have stored in memory. This missed
> the plugin instrumentation.
> 
> Work around this with a special helper to inform the rest of the
> translator about the instruction so things stay consistent.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Richard Henderson<richard.henderson@linaro.org>
> 
> ---
> v2
>    - s/w/b/ for translator_fake_ldb
>    - add comment to extract_insn
>    - reword commit message
> ---
>   include/exec/translator.h    | 17 +++++++++++++++++
>   target/s390x/tcg/translate.c |  6 ++++++
>   2 files changed, 23 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

