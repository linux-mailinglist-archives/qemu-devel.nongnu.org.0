Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1493E64D744
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 08:30:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5igV-0001o1-Hx; Thu, 15 Dec 2022 02:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5igR-0001ly-JF
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:29:35 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5igP-0007wV-3J
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:29:34 -0500
Received: by mail-wr1-x432.google.com with SMTP id bx10so2170749wrb.0
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 23:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MKs0LP2qprmFNowBtuj87zjuq0S0JUZgzqscEiaeMVs=;
 b=zai0Cp6c4dYMsk4VHozXPm+yxFYOtmGzjL/FwCYz3d8qv+r4MmA2UsDYAqqaqvdMX9
 u58N+t+D1K+k8w3WohHxgNffQL0NqASkHjQ5eLFuo67ROktAGRoeuuE58SLYnvc+KXR4
 h3EIE1SBougT6RH44OQWZRBRTzjbId/nzcLNpHQ6bc5IhMg+8UzBZG9gV0RPaGuaB9Xj
 R6/l+ZqMZbrWUCcEz75St6YNNtQy/X4kRa6oTzVanni8WzlKYK93TVh7LuQYPu7dwb8e
 Ca/7Rba+uY27T2/MAqo7T6Jd6Q9F+quhV73Z4GhRb04Am3Ykw/v+fttnAZe6Gy6j71CF
 esaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MKs0LP2qprmFNowBtuj87zjuq0S0JUZgzqscEiaeMVs=;
 b=QcktviJRwV8mYPicoNMEjZR9DPBvdF5kvIjK4+EVGjE22XEfQzGAb/Ec+GmNB3+4mP
 l+BIl3a6xfeuR8tW8PkphfbTr/e5Y9R7PsjOUEHqwaVOdiN+U2yMc8WW+uMfwlPLcann
 9dOvk48FMYbFCTYSaqNLQZtU16lrPyua4dLHxXQGV25XYrChj84uOKrQNcH6qjoN/DCb
 YpumHDLcNnnH/Ym8bp7butjD7x7KK+IjfiBlAiKXo4ojacSG189Fj7ux1b86Io0WsttX
 BD0t+wipAQlqtkU2eVtM9IrUNY/ntUnnnPKCDE8a7w44oVtnJZnCCPeQY/H5PzZvD+oU
 O7Ow==
X-Gm-Message-State: ANoB5pnjZ2c02FXaEZpaEw4eWm7wUpxmpbC7abSQkFqidOYe9iiquX/j
 Rm6JU4oeFVSBUX6vbQn1qxiNFQ==
X-Google-Smtp-Source: AA0mqf4saOinZGqmbnZa7c8MkgkNmxP3aSOen5a8/DmiXUd5qwCYE8BYIcmw37HX5yOI6XczWdTaNg==
X-Received: by 2002:a05:6000:1e06:b0:242:eda:dda5 with SMTP id
 bj6-20020a0560001e0600b002420edadda5mr17703805wrb.25.1671089370901; 
 Wed, 14 Dec 2022 23:29:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t2-20020adfa2c2000000b002428c4fb16asm5335062wra.10.2022.12.14.23.29.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 23:29:30 -0800 (PST)
Message-ID: <5bd89f20-46ed-b4dc-8707-794b19eb22e4@linaro.org>
Date: Thu, 15 Dec 2022 08:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PULL for 7.2-rc4 0/1] loongarch for 7.2-rc4 patch
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com
References: <20221202102550.4107344-1-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202102550.4107344-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Hi,

On 2/12/22 11:25, Song Gao wrote:
> The following changes since commit c4ffd91aba1c3d878e99a3e7ba8aad4826728ece:
> 
>    Update VERSION for v7.2.0-rc3 (2022-11-29 18:15:26 -0500)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221202
> 
> for you to fetch changes up to 14dccc8ea6ece7ee63273144fb55e4770a05e0fd:
> 
>    hw/loongarch/virt: Add cfi01 pflash device (2022-12-02 18:03:05 +0800)
> 
> ----------------------------------------------------------------

Now than the 8.0 cycle started, can you respin this pull request
(preferably rebased on v7.2.0 or later)?

Regards,

Phil.

