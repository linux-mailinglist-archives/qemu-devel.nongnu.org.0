Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA83750AB0E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:57:51 +0200 (CEST)
Received: from localhost ([::1]:34030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nheoA-0000kB-Ng
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhel1-0005t6-CL
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:54:35 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhekw-0000jO-Jb
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:54:35 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x1so6215275pfj.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=CTie9nCnfLRRObSHo3oLz+Q4gqHh0dMKc8r3TUnBV+U=;
 b=ibN+FZroQevKtougcBhUejeRBewhgE6gcoXLcx2t2GBF5YRHi+hQsk+ZIAPAIelCvh
 yrOD4VOPTLQzVtK4uyz3XHRYPuh/y0OQUkIYl3igzYXmsOIKpPeHq1a0yqBx0o5aBbtf
 esORfLFIsulMyqNWvOq986tWswOkHoi6pEB88H1/YJu0FGw2AFJz+lufaB9ilTUiGIeF
 3nnzWJLIB9C+GMuB/tiJeZkdxxbPOL+Wmj+1Fw43gyge7eT5aSWw7xqiQR21w20RbIn3
 jkq4ny3bk6qNqtiwuVI5xgjKpnM8ODzDJrD7M3jWRIoVrf/JRneuKoI4pM578i1zaFUr
 rabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CTie9nCnfLRRObSHo3oLz+Q4gqHh0dMKc8r3TUnBV+U=;
 b=Vnl2v5iqqVQXNqgbCztV2lCMr/q0PNQEr7x3O9Vvq0AsnjB7ZSnLV0VQJJERUH84lk
 xxOSIPz1R4Uf2os2je9BKcaSIJNEI8ZorvPFqmCyP7Q5AL9khfahnPOpNWhWYo8S3jEd
 2BJ3Q+VZcKXBzQW6ZBDrv1ng1z/SamCouAKqzbNOIm65qGMTgrSR7tMvrjtBCLz0QlQ8
 7nhy87qX0Nafi47j4APe57MniisDrNZIvjIzfW/x9rF7uIo3o/kFxSbM9Z6lUKVZOba0
 7FgAH3yV9hnczcYQK+TUKiqAj5t33QbYuEWmNbZAtPI0U4DR2zBiZgOenY5/CX2XwZ5Q
 9BSg==
X-Gm-Message-State: AOAM532tpVr4VA5PNhbgxZawZR6UAn4LnV9guBRptJCUA9SYCxM04tfK
 yD7Y8QxWUMkEIMds4VRrjFnEBwRp6KZ/UA==
X-Google-Smtp-Source: ABdhPJwnWpgTpRs6rN0QYbhIsmtpMdBUd+SOcMaJTEQ0g6myn+7+XaXDLvXqV38u8j477LcTBuNoRA==
X-Received: by 2002:a05:6a00:1256:b0:4fb:1374:2f65 with SMTP id
 u22-20020a056a00125600b004fb13742f65mr1677229pfi.72.1650578069085; 
 Thu, 21 Apr 2022 14:54:29 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8060:946d:d891:f23c:e53:9d47?
 ([2607:fb90:8060:946d:d891:f23c:e53:9d47])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a056a0022ca00b0050a858e8cc3sm76697pfj.200.2022.04.21.14.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 14:54:28 -0700 (PDT)
Message-ID: <0efa9d27-c327-a73e-f4fe-2605e13547bf@linaro.org>
Date: Thu, 21 Apr 2022 14:54:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/6] target/xtensa: use tcg_constant_* for exceptions
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20220421213917.368830-1-jcmvbkbc@gmail.com>
 <20220421213917.368830-3-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220421213917.368830-3-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 4/21/22 14:39, Max Filippov wrote:
> Exception number, exception cause and debug cause codes are small
> numbers, use tcg_contant_* for them.
> 
> Signed-off-by: Max Filippov<jcmvbkbc@gmail.com>
> ---
>   target/xtensa/translate.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

