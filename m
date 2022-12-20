Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24AA651B55
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 08:13:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Wmv-000145-ND; Tue, 20 Dec 2022 02:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Wmr-00011v-Fv
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 02:11:44 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Wmo-0003ju-6P
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 02:11:40 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h10so10840561wrx.3
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 23:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TacH1HKcQncA9/5INUwWsGYqgVQIbrTBrA163x7NCUc=;
 b=EwI/VC7MSI5GB4w+tinieXsG1m6HIQPVOntWmugz53K4m7tpg3vyEu8oyV0Tm5PHAo
 /0hylMRKeaGruKDTIiPj3kzRSL3ckT9GimAo7YQTYTtBSKv4dELZ368viOkjBQvPS5pL
 s7FFIgfm8SCdkhGPGQg48N4qNRv+ddyvjSFqi3twu1Mtb3Xpz41KPqdo2R3w93DvHXp5
 H7xFBWHBpnkzNGF6U/eGNdRUjj3fSGVf8hpywbicp46YR5UBWfVYtdVZp6tah621rO1z
 USF23J1OujdgQrNehPYZc+EGYlGOuFFOK+NT5HmCBYqfjjTri+Owf2UXDGWCQ2abLz8f
 fpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TacH1HKcQncA9/5INUwWsGYqgVQIbrTBrA163x7NCUc=;
 b=NQ5WiaDQpV9EYoHlp5DOe/+7lTCDKn8K+hGZgxIYXMkt+kW1YpJNcmprKIraFLT8ld
 qpp9g2TvemxvfSKbk9SWB1B8Q2ExyuMnyrwhpDHLM+LwD24a5EzNYXQc1skvX00S1Jwr
 A85l0TEuuUqGUQlhyaVPTX2RG84PvdpGtprWiTFVd9OlwRPiLHswpWwt4ba/cIKjokvr
 LRpiaYYmZPBuBXuHkjO+mVZl+LKTnFNF9tjbvKjdqqNY58QY3/ZF4lqLMQc97PVy7mOD
 d1KXa5W1zI85vRa0fwQoWmKPHaeW2OGMl5haeJJOGHfyYUnR6uGTsuqHkdWYJWF6Fqt0
 DaWg==
X-Gm-Message-State: ANoB5pnBE/rwNmxpgCL+h0pGlDo9oBP5oK6ChdLKT6jwQiivoHhqHvuc
 1uqdaC7aXF/rh3DnOptaYCqBJQTGFBwKnITdlu4=
X-Google-Smtp-Source: AA0mqf42KrsfORW1S7KpXDilIn7ymzcN7PFSC/maPCBOm9u5K2+8XDAnyKw1ieLncFtrS+2RZEueOA==
X-Received: by 2002:a5d:6e89:0:b0:236:611b:e8eb with SMTP id
 k9-20020a5d6e89000000b00236611be8ebmr27805428wrz.37.1671520296475; 
 Mon, 19 Dec 2022 23:11:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bj19-20020a0560001e1300b002238ea5750csm14209161wrb.72.2022.12.19.23.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 23:11:35 -0800 (PST)
Message-ID: <b7829631-408a-db92-c637-2f19feafc682@linaro.org>
Date: Tue, 20 Dec 2022 08:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 5/4] target/i386: Restrict 'qapi-commands-machine.h' to
 system emulation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
References: <20221219211034.70491-1-philmd@linaro.org>
 <20221219212229.72052-1-philmd@linaro.org>
 <fb0772c7-123e-c862-3f7d-875c2180cfda@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <fb0772c7-123e-c862-3f7d-875c2180cfda@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 20/12/22 01:01, Richard Henderson wrote:
> On 12/19/22 13:22, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daude<philmd@linaro.org>
>>
>> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
>> user-mode builds") we don't generate the "qapi-commands-machine.h"
>> header in a user-emulation-only build.
>>
>> Guard qmp_query_cpu_definitions() within CONFIG_USER_ONLY; move
>> x86_cpu_class_check_missing_features() closer since it is only used
>> by this QMP command handler.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
>>   target/i386/cpu.c | 74 +++++++++++++++++++++++++----------------------
>>   1 file changed, 39 insertions(+), 35 deletions(-)
> 
> Not moving these out to a separate file?  Anyway,

Few static functions are used, making it hard to split it out.
I'll have another look.

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!


