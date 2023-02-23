Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5176A0D6B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:59:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDzG-0002Nn-W5; Thu, 23 Feb 2023 10:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDzC-00024x-0v
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:58:22 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDz9-0004uN-Mm
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:58:21 -0500
Received: by mail-wr1-x431.google.com with SMTP id l25so10655585wrb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NoRHcpyiXe+kbrXabwWuRS9PHJj6baurxV0xwVa4s8I=;
 b=zuI9TpSSw8Zp0YQlKPuhtXrjwc0xIjEbsMXoVwh7LqnLM6NKZIqUZGqLmr+dftWdzP
 CaqVLE0KTklTl6EHQQQHNax5sOZuN533xnpKwXFBckHRIpbfcHRE4qAH3SwiBpWGSomX
 kWbKS2ENgevdM82KkoUPjsQyg5etqD13aH9fZrl2ep+cf+QVRU4nILAuTlIWe8yC5Oyk
 fcLJ1xagYOAymunBAoR2Qcxyxp2/VeMR/pWJKzPAH88bhEm9MErOyIAXCPPGts2sbR+9
 8xo7mGX4hoeXCERads0iphgyCQu80OvTziZjabsr9xcw+XlnBVIv+QOqjUBUkABd12wm
 eyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NoRHcpyiXe+kbrXabwWuRS9PHJj6baurxV0xwVa4s8I=;
 b=o75JrkBtzuLeJ4ek0KG9pvPjhvnt/vLMDsyrGD5x0uKl7cHQfF/mCD//GwmXrcpmc+
 eW7jmjN8iIJLg4IF9FRPgGWlDL9T6vPz/bWbKzNaN5v7xdg5tW8Oslihy1+LTahMFHWD
 8/hRvusdtZqzvePlaVv3WK1MsM0SzEa8OSug6PDAfkScDoDeP8VRH2HdnvcJV8WGCKgM
 +dzdHyO/bOxvPTlIHCHJ0yrJurG1UaipY4/DFnmXGFTydDws4q0wpjZHEQmS5hxBdgBq
 zJ9tuoqEvUlkP4uXjLJglVGh769Pgy8g6iXzcH4ywRY1fDOWHDiy5Fft/Iss1SZKb1eh
 kSEw==
X-Gm-Message-State: AO0yUKUYUQkVjbbIRyNmrLJkf8IIbXE3I6o0FRXYeponBYnpQ5WW0vFt
 e8Fl/mr8cMqlBnEtXdyf9BL5uQ==
X-Google-Smtp-Source: AK7set8CAEarwpXKFAliK4d4LQYIlxb3dD5mpR6QQltGqcIOUePyG2zoOElED8nP7AUAwgYEqPxAiQ==
X-Received: by 2002:a5d:504f:0:b0:2bf:942b:ddc with SMTP id
 h15-20020a5d504f000000b002bf942b0ddcmr10099298wrt.55.1677167898357; 
 Thu, 23 Feb 2023 07:58:18 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c379100b003e70a7c1b73sm9910507wmr.16.2023.02.23.07.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 07:58:17 -0800 (PST)
Message-ID: <eececf08-0ae6-a46e-ae2d-f7f19653651b@linaro.org>
Date: Thu, 23 Feb 2023 16:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/4] target: Restrict 'qapi-commands-machine.h' to
 system emulation
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Song Gao <gaosong@loongson.cn>
References: <20230223124340.95367-1-philmd@linaro.org>
 <87sfew331b.fsf@pond.sub.org>
 <d3dae20b-81f7-5727-882a-3593ab2996f8@linaro.org>
In-Reply-To: <d3dae20b-81f7-5727-882a-3593ab2996f8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 23/2/23 16:56, Philippe Mathieu-Daudé wrote:
> On 23/2/23 14:49, Markus Armbruster wrote:
>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>
>>> All series reviewed, can patches be picked by corresponding
>>> maintainers, or should I include them in on of my PRs?
>>
>> I'm sitting on a lonely patch for the monitor subsystem.  Want me to
>> throw in your series, so my PR is a less complete waste of CI minutes?
> 
> That would be lovely! v4:
> https://lore.kernel.org/qemu-devel/20230223155540.30370-1-philmd@linaro.org/

btw I didn't add these files in your MAINTAINERS Monitor section because
I expect them to be taken care by each $target maintainer.

