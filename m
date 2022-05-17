Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9575296EB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 03:48:21 +0200 (CEST)
Received: from localhost ([::1]:33916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqmJw-0005eG-QB
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 21:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqmJ5-0004yC-DV
 for qemu-devel@nongnu.org; Mon, 16 May 2022 21:47:27 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:44917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqmJ3-0004Vj-Nm
 for qemu-devel@nongnu.org; Mon, 16 May 2022 21:47:27 -0400
Received: by mail-pf1-x434.google.com with SMTP id x52so15582382pfu.11
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 18:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4NSNuENcWEtBfy2y9hwhUyyEW0zR0LkKHw+6q/1k5xw=;
 b=X10Skw71H7hCgteltotwJNqy3UM3UTGaorQb60kCsrCijJh3mIcaH2TDOhnW6OkEVK
 NaFr+FExK7w9im/b+kEuiznjghz7ZpL/eJ7AjZxndxd7Qj/KM8mYiEcUcsGL1Dk2wxpS
 w/nc+Jv7y0aJu49XOkq0djjEYlW9xRPpHM9fO9p7BnyHqv8+iuYmrr8uPpy+0vRjlpRV
 mzbfblyRx2EE4yYw5WkAeSxqN/ba4q7oM7kY81aOYTzFSU4bWxxKxxCewldIfaRb88NR
 lWd6grHlWwE9tsvd4JVrJu/Clx7tgkKP4neiVtTxpDOWJ0o7I4Njg8JfaKrscs6Bfgjp
 RkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4NSNuENcWEtBfy2y9hwhUyyEW0zR0LkKHw+6q/1k5xw=;
 b=oLTyLcn+WvJTD87rSdTUYZqBskzD+/f36BqGNi4bW4MBwVM1CiCbc7LKAFoCqSXwNK
 M+n0lRe3TgW5KFZQzOXti4G6cYsfN2njLIxv8o1WYlpgr/EZLgdC/RzSZY8bFwoxq0fu
 JwzxIM5o80cXOqhFUnd/4TtHa5rA3RjH2D+00Dw064CyEceNkOHfq5rfcIvwSeAl+Ybt
 pQvrj8+jbPa6ZKBawnwfdZqqBuplr92n+8NWo3HPMVqBwJegI9T6Mf2qA2pjvQe17KCr
 +erLZsGKhlBhHgYoDgESXJ94UIgzEt6ZWlUy8a94cNeczWGop2RndawELp+mh5vPspmR
 SXsQ==
X-Gm-Message-State: AOAM531s15ONRJlt10bvBpAfB47fcgBhPQ5wDtfVpBUF+n24SvkMoshs
 qw3z2o6AX2M2O4Pw+sgS81lFBA==
X-Google-Smtp-Source: ABdhPJw6GSDLo7eiMqlUxCZnL196Qp528xNXb3gY8x5F7QONDebO3bo0jUBy5kRjn5ujo81+ayyC9A==
X-Received: by 2002:a05:6a00:181d:b0:50d:d56c:73d3 with SMTP id
 y29-20020a056a00181d00b0050dd56c73d3mr19887520pfa.22.1652752044008; 
 Mon, 16 May 2022 18:47:24 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a1709027e0a00b0015e8d4eb211sm7569692plm.91.2022.05.16.18.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 18:47:23 -0700 (PDT)
Message-ID: <f83c070d-2a20-e500-8fd8-2e9fdc06f07c@linaro.org>
Date: Mon, 16 May 2022 18:47:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 07/74] semihosting: Split out guestfd.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-8-richard.henderson@linaro.org>
 <CAFEAcA-YxELopj2XPvs14yZTU=A=ufq0PyxpsM0pkrPUoTx89g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-YxELopj2XPvs14yZTU=A=ufq0PyxpsM0pkrPUoTx89g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 5/16/22 08:14, Peter Maydell wrote:
>> diff --git a/configs/targets/aarch64-linux-user.mak b/configs/targets/aarch64-linux-user.mak
>> index d0c603c54e..db552f1839 100644
>> --- a/configs/targets/aarch64-linux-user.mak
>> +++ b/configs/targets/aarch64-linux-user.mak
>> @@ -2,4 +2,5 @@ TARGET_ARCH=aarch64
>>   TARGET_BASE_ARCH=arm
>>   TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
>>   TARGET_HAS_BFLT=y
>> +CONFIG_SEMIHOSTING=y
>>   CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> 
> Is it not possible to make CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> imply CONFIG_SEMIHOSTING=y somehow?

I don't think so -- Kconfig is only processed for softmmu.

> If these are moving from being static functions local to a file
> to being global, they should get kerneldoc style doc-comments here in
> the header file.

Ok.

r~

