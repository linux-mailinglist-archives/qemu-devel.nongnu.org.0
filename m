Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9F869DE17
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:42:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQ65-0000qM-Vj; Tue, 21 Feb 2023 05:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUQ63-0000ok-SV
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:42:07 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUQ61-0007pa-Bz
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:42:07 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 p3-20020a05600c358300b003e206711347so2777641wmq.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3moPHpbvuIA9ByxiAvHIOIrfTc06CDbvVqlf7VsWaAk=;
 b=NhIy7JGAcd/oRywr4WfUYzxPiYk4AUcW+hAAEJdly26vfReTHfO8bUtHRB37+b/N3x
 aDqXxS9+08upJPm4tsKQv2ftzrEz4QpcR5B357JC5Ba+2edijeS+d1lfxpqwk8Re8ilS
 g0L6huD7e3jSoKys9iAHlZvJdITpyhxN7M+0TkCph0D6tb8tXKszOnJIgMCkA9GHFJAL
 kcSMMMNRxlEaEGgCL/STNZjYWtdKdCflO2OhhKyLFZSKPodkfiwBE1WQEx6lkAGweEM/
 Bx9xvb9WlSEyZmXjw2eBCcNUX9RRLOeBat5XolT/JDen08V+FPMmoCqxbOhsIzjpmm8m
 j2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3moPHpbvuIA9ByxiAvHIOIrfTc06CDbvVqlf7VsWaAk=;
 b=z7WBImP/9JeqVGsE1bCzEtRlahN6Ds8fQ/8RSG9DhI6UWpQrDR/xYJIoOjwgNEzzyN
 Fr3ZNKA/TLYfZUUX0qmEiVeggN53NlN9sqiUflM+w9xBlAPzq0i1g+34jXxpB5oDSoRl
 3JKUt+tLZlJHp4Rp4oACYQdASY9G9xmHksZ5D1l/+Tylx9S0fEZ0cyoWLACJG0XpM55L
 4Yq1cS7fnHnQLRcqBW06jGUkma2RQUAMB7AyuZ86hQEREwPR5g6narYRSGQ1BuVFMQRg
 wWamjppN46t1tXZ+4yWAi2GRrCHZ265mM6Bz8P4oJyIAoC59ujb3PDnDGtYWDKnS8R2V
 5+jw==
X-Gm-Message-State: AO0yUKVNjWw5YVxfFIDUzwgiubs4VSK/E/g9vIgACAm9maLRnCSoTYMf
 n6buR20K8zFJVkELkhJD56+1Cg==
X-Google-Smtp-Source: AK7set+lXnemgfuc1RKro+yoEw8nWUf1epm1OH1XuIPXZPjjcfzBqLuzThag0VHfG2qFeYcjU5/0cg==
X-Received: by 2002:a05:600c:4918:b0:3dc:42d2:aee4 with SMTP id
 f24-20020a05600c491800b003dc42d2aee4mr8727583wmp.25.1676976123794; 
 Tue, 21 Feb 2023 02:42:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p8-20020a1c7408000000b003b47b80cec3sm3369778wmc.42.2023.02.21.02.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:42:03 -0800 (PST)
Message-ID: <ac13c9ce-89e2-cd83-235d-be7bc0544284@linaro.org>
Date: Tue, 21 Feb 2023 11:42:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/21] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
 <20230220232626.429947-8-richard.henderson@linaro.org>
 <b1a5b38a-73ae-9610-676b-b27dd4c7195a@linaro.org>
 <bf06cdce-aa5f-98f3-4544-31d08d6bd55e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <bf06cdce-aa5f-98f3-4544-31d08d6bd55e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 21/2/23 11:01, Richard Henderson wrote:
> On 2/20/23 21:56, Philippe Mathieu-Daudé wrote:
>> 'secure' & 'user' seem mutually exclusive. If we get short in bits,
>> they could be shared.
> 
> They are not.  ARM has Secure EL0, or secure user mode.

Oh, I misunderstood this field with user-emulation then (I tried
commenting it and my TCG/HVF build succeeded).


