Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF12739AA83
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 20:53:28 +0200 (CEST)
Received: from localhost ([::1]:49620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1losT9-0002f7-Cs
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 14:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1losSO-0001di-MT
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 14:52:40 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1losSN-0004FE-3M
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 14:52:40 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 l10-20020a17090a150ab0290162974722f2so4451561pja.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 11:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YKNTuggFhIJ15rCHacQ0G7rAiTeTOSzA8dwJthM+jd8=;
 b=otuUrTL1hdKdGCbuIQWkIeKFtlr7Mwhnf3v2mOuG2QmggVsWLegDOvvaPvrUJ9F9Z8
 bklWeDZrJJaXQF/mC4p/hi7IIRTDcTYfsAhhDHMO8LkouTSq1oPDgCourkgGa0md3Ei8
 gU+4yi7yxRpO0Uh12sbDukNxydTf0khsWkvMoISrU7y8l6ZVe9hQ0FDLQjYMxhFcJZO7
 tlfLY9S4PuC/yZ2/nyYEWUiOAu4uH/b5P5MtEdH/U8B2k/ktmrWHQSUPLw7sv+Yn8YCx
 R3J2NkOm4QRaSxvT5BN6sa/fkQmzjsWzqbw0KhiydUgawaOWtNvzB6O57QLaZl61jIa/
 qY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YKNTuggFhIJ15rCHacQ0G7rAiTeTOSzA8dwJthM+jd8=;
 b=ZBjXAzPFRT+Qbi557Ki/pKOakT/ojNDJIMVaSVoScKnXBW+5DFvta3Yrdj4SV7Th3Z
 1wsQJdCA7hyR5sh508ig3wsf/mvvUUtoaToINUoI971u8ooq/cSsEqy1HJaRl+BbY6sn
 E6iQ9eGqZ7eozrdi2xf/nv38iEwS/gGPhVmWn4BBA6kAOeKWLHVHTKkPpIhJ1r6YHxaK
 mn+7rBkP+iFYzCJhEPO8uKlJK9uz0EUXPEJtI+0hWUjqlHCtL2pPsKGqYljoiYz/isD0
 rJYgj1Z/bRuiPWNYA/iZSmbtBLvGqNgZE0AjzOteb74j/PTzzJXFM/Y8cOOYXLAo0uRS
 kfLA==
X-Gm-Message-State: AOAM5323rAoo9xGtwplJdi0AO7ruaRXtnC4zmRF+b78WynxrXJZ6qnEh
 RWJgdua7rN/6xCvw0i1Id1M/lg==
X-Google-Smtp-Source: ABdhPJwvnY29maMZnt+KCaW3Z/8AvegUlzhikF0CSdq1K+b+fkoLD6OWrOaL8B0hgO6TXjBpfZdhHA==
X-Received: by 2002:a17:902:7587:b029:109:69bd:3eae with SMTP id
 j7-20020a1709027587b029010969bd3eaemr446102pll.40.1622746357054; 
 Thu, 03 Jun 2021 11:52:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 x125sm2878986pfx.201.2021.06.03.11.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 11:52:36 -0700 (PDT)
Subject: Re: [PATCH 1/3] hw/acpi: Provide stub version of
 acpi_ghes_record_errors()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210603171259.27962-1-peter.maydell@linaro.org>
 <20210603171259.27962-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <794108a2-fbaf-dfbc-ed8f-2d3d87ba2c07@linaro.org>
Date: Thu, 3 Jun 2021 11:52:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603171259.27962-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 10:12 AM, Peter Maydell wrote:
> +softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
>   softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
>   softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
> -                                                  'acpi-x86-stub.c', 'ipmi-stub.c'))
> +                                                  'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c'))

Gosh that last line is confusing.  I see it's documented in build-system.rst, 
but yeesh.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


