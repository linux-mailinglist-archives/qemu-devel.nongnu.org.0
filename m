Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 935525AED82
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:45:05 +0200 (CEST)
Received: from localhost ([::1]:42302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZp2-0001rj-Kq
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZei-0000vv-Ku; Tue, 06 Sep 2022 10:34:26 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZeh-0004GT-0Z; Tue, 06 Sep 2022 10:34:24 -0400
Received: by mail-pf1-x429.google.com with SMTP id y136so6617675pfb.3;
 Tue, 06 Sep 2022 07:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=isX2EQM4yDrwv3ixKqY5xNL+VeLUjuz58bPd72u//Dk=;
 b=l37iiIargG07pKTNLWuGZAX31zhRuUl8JfeL1NIwtccVybtcnXyPCG6whTl16ORXbv
 p4LlnFfj8B6Bu48cXlgyCfl8j8nB7/6veA9r8LfUOfPFp8EJqIWfsHs+c6YlEySb4XqH
 buoHNSxC+V5Q1HmzOIk7JvliYhAsVusB+vHCBN6yufHYhA0QZ70CcxrU6a1uElUSR61u
 ZwTHtaGxe513gonQWGbBqJfvdU8a9+h+mtObh38mVwfwyzzI9sgaL/7U+hfGFyqP/WX3
 5x3cH1vvT5m+NY/tzct3TpkrQxGPFE4AYfY8vCbjzjaFGFSV79g9OJ726LiA6FOKmgTG
 mXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=isX2EQM4yDrwv3ixKqY5xNL+VeLUjuz58bPd72u//Dk=;
 b=Ps5XVI3rxpvaXn5BOiqbDvH5d6N2h/sGwVFRztYZu4qIswVha4CRS2gruRrKAGSh/y
 I5kEFYMl+dP1MCbmIqEY63zp/iPAuwDbUuopmLUwjjZUZOJ/IDim8uz1ie1UJkE2+plE
 1HGFiE1dP62Qe22T+LGCUEaTp+tmrRgx0pyyJeO7Nw/sXXz1GqBSGz5xUIrMjy3vCHGB
 HNITVNC43jc1xKUf4GehihT087pQXKl+58or7nsXgs+D1ekJjo4CdewsUUit99U+sT1V
 KcJJPqWhjMpuPs1x38krLnLp5fBkV/32+6gg7REIS4lqgaMkNTRVtIzV1CWP41AIdYZv
 XhIQ==
X-Gm-Message-State: ACgBeo2yq645U/sGL6dZv5ZtYGil83u7YR3vCV/vMK78x55YMee9v0yg
 9/W4yrLd6rA7K+ype13Mvf1dWW/oRXg=
X-Google-Smtp-Source: AA6agR4SNX1mVot4mqKJ0UN2fREnXhZyxodsZ0N8Xf61FYOfvZtbnXFja30GaUKpqanmf7g0Vip5OA==
X-Received: by 2002:a05:6a00:a87:b0:53e:52b9:f89 with SMTP id
 b7-20020a056a000a8700b0053e52b90f89mr1051029pfl.53.1662474861362; 
 Tue, 06 Sep 2022 07:34:21 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902e88d00b00176c37f513dsm540615plg.130.2022.09.06.07.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 07:34:20 -0700 (PDT)
Message-ID: <0783b71e-129c-61be-dc32-792d8226dbf7@amsat.org>
Date: Tue, 6 Sep 2022 16:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v1 23/26] tcg: Pass TCGTempKind to tcg_temp_new_internal
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20220906101747.344559-1-richard.henderson@linaro.org>
 <20220906101747.344559-24-richard.henderson@linaro.org>
In-Reply-To: <20220906101747.344559-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/9/22 12:17, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h | 14 +++++++-------
>   tcg/tcg.c         | 20 +++++++++++++++-----
>   2 files changed, 22 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

