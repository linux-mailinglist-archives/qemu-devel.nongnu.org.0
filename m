Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EDF69542E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 23:57:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRhjq-0007U9-7t; Mon, 13 Feb 2023 17:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRhji-0007Tg-LZ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 17:55:51 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRhjh-0001aP-3M
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 17:55:50 -0500
Received: by mail-pl1-x62b.google.com with SMTP id r8so15190170pls.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 14:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=58kMTK0T7w2f3ur5Ia3FNEe447kHj57jbY91YiM/09g=;
 b=M8MQwh452GMQ9gZCm2gs7KzQo1553rqbc37bzEKh70WniAS/fW9Sq7XOTLbG6ArpoN
 plaPGGqVRV0fDQ9Rjm6uR5aQwIyfvGs4utDm+TJUy315KDLvIuslEoFwv/FZOkmPrv/i
 NWtvXl+73tXb7UQ1ae+YVHTXAyTdLLFrfrIduNTZmqx4YUl/IfNt4UGp4HFS8P/DiJ5e
 UspTGvfeNsAid1G97yvEoljE4Gnf0Vrxk+9EHbkRfwgrdAG9CIXXV2e01SYY773twOJk
 8c2SuaI6m2guhgUrKylVrfqyFhH3iNJqomjBKLnaJx3sHeBF5ngLnBoE74q/XhbGj4Jv
 GUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=58kMTK0T7w2f3ur5Ia3FNEe447kHj57jbY91YiM/09g=;
 b=5LWsnM5MdsBKMI3furTLTMJpQ4dk+gLBbCyVxCCsvVEB2oFcaPMXH67bbzsOh8BmLI
 BAZhEiFImJS5WFbeZddPt2i0HePJ6bwK9TRenAvbo+7isyZMnSlrcCQzoIqKWhFO0S3N
 mm+Mv0DtjRBbZImgq7G1GUaGFuiu1EAkwS/oynzX3jHq1jGT0wF059Q5BcClFO/mEzeG
 AB5yM8sNXTP6LBcq6rQ7U2yx+MI55So/VDx7wd9k3AYYyiWPF1ihD0BZZJj6APrbFrOE
 9FG+cWOxUfmtGyWQvZE/CmqXWrRLXGbOKnUToQkT/NF5sE5+c+RLjwSBN4AjajZ7Vyql
 A5bA==
X-Gm-Message-State: AO0yUKVOo+DQH/fzK8U/og+smZBMupx8HQJsuPqzvNbum17y8GeAVqf7
 X8W3jGZ3WpeghOAKKiLy1EB1mA==
X-Google-Smtp-Source: AK7set93dyXClzNGRh7A4AS3bp3Ld4pSQXkRO1ogC+4v76RXcCzJs2lNe0DFdR81s9vU8N/ol9Xvdw==
X-Received: by 2002:a05:6a20:840b:b0:bb:baa9:ad88 with SMTP id
 c11-20020a056a20840b00b000bbbaa9ad88mr194709pzd.44.1676328947518; 
 Mon, 13 Feb 2023 14:55:47 -0800 (PST)
Received: from [192.168.145.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 g13-20020a63be4d000000b00478ca052819sm7685483pgo.47.2023.02.13.14.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 14:55:46 -0800 (PST)
Message-ID: <6e388492-43ac-a24a-2c8d-e6e7e23c9b84@linaro.org>
Date: Mon, 13 Feb 2023 12:55:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] hw/qdev: Constify DeviceState* argument of
 qdev_get_parent_bus()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230212224730.51438-1-philmd@linaro.org>
 <20230212224730.51438-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230212224730.51438-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 2/12/23 12:47, Philippe Mathieu-Daudé wrote:
> The structure is accessed read-only by qdev_get_parent_bus().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/core/qdev.c         | 2 +-
>   include/hw/qdev-core.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

