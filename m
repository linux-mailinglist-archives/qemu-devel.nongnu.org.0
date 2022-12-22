Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3E7653C6F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 08:09:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8Fhn-0000rJ-G6; Thu, 22 Dec 2022 02:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8Fha-0000mI-Sm
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 02:09:17 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8FhT-0003no-Tm
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 02:09:09 -0500
Received: by mail-wm1-x330.google.com with SMTP id bg10so785494wmb.1
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 23:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RlnCPhHBMwMbZB76ArSZYUWGFByGNAWliOhkeMvLoYE=;
 b=pdJaXql9zLGrgcHb+GjR/H/ol6rhDyAK/+fuxaZNIJmfmHfNrjPZFfd3cTMG/4qAy9
 vpxzAMQwEI0QF9JJPHWv7dRddJ+omtVW7mTOquFxvweQrriKv/M+Q/ESs2pQW1jKvKWj
 ub5PpiYCKp/OqMnF9ENvABHJI8GHdviKRe8jxXKiLHEWjiG5Zmr/Qa4dyA16tFbhjNam
 cYje7Riq8pb/ierA2g/FKfIlJGTUGLZzqi5dmKUgw6dEql+LQ5mDsOVpJtuiUfg/KRCE
 U1I1nHhqfkwWSZyfISmh1Y0roBlpgcYjEXvDw5cqSPallw1fvwoGo6u8uYPk3loYzYf9
 lYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RlnCPhHBMwMbZB76ArSZYUWGFByGNAWliOhkeMvLoYE=;
 b=XaCpxMP5D9YJb07TrHAbaeN/y8sXM7P4RvY9a58fQfzak/NYDMn0zXpr1c6R8Nccau
 O6n5XD3jkXM5wKGWnpWhzxyxcyvgGqgOAxky6CAhM0bgnCnKT9tBlvLgmybOj/T6BmCA
 RoQmqU5A/bpM2WaidngYF6CV/Kdg54LMBzuVrk/2uqUQZvz6nf3w47M9+eO0Ot1Vtugl
 Y2r7W+P14Owu4oVzI178FkxGVdyCzSJ+cau84zTa8EPko0F0B3t3HV8qOCliTUpCWgdf
 PbgLK+sSyF82kLeK8U/WOizQ9k9f6Bqz/XkZ/AjDjF1YjzKLeN293jjMH4tMUlkmnNLv
 M/cQ==
X-Gm-Message-State: AFqh2kqs7eN/TaOzRNRWIh7bkZPHOTNKh3i0zmxKGdqzcQdVX0RHugHV
 hL/lmDiIzYh3UiAFlC0VAGpRDw==
X-Google-Smtp-Source: AMrXdXvt1PstBr6igejrzEtLvY79ycR6SOqgoUpiA/RvQaMmoFjgahzLi/fJb+hXY9ILqiG2EvyWUw==
X-Received: by 2002:a05:600c:4d25:b0:3d2:27ba:dde0 with SMTP id
 u37-20020a05600c4d2500b003d227badde0mr3404540wmp.33.1671692944830; 
 Wed, 21 Dec 2022 23:09:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n5-20020a5d5985000000b00241cfa9333fsm18646567wri.5.2022.12.21.23.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 23:09:04 -0800 (PST)
Message-ID: <90866d03-7ebb-c7ba-31ef-e643e115382a@linaro.org>
Date: Thu, 22 Dec 2022 08:09:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/5] coroutine: Clean up includes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 pbonzini@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
References: <20221221131435.3851212-1-armbru@redhat.com>
 <18f53ca6-3cd0-313c-8940-1f7d013eba87@linaro.org>
 <87k02kggjl.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87k02kggjl.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 22/12/22 06:21, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:

> PS: While looking for commits that caused these conflicts, I saw
> 
> commit 28b629ab4aa93b9b7ec79c7e480611e4554586be
>      Signed-off-by: Philippe Mathieu-Daudé <a class="moz-txt-link-rfc2396E" href="mailto:philmd@linaro.org">&lt;philmd@linaro.org&gt;</a>
> 
> commit 69779192acfeb9480183fd076be7480de56b1009
>      Signed-off-by: Philippe Mathieu-Daudé <a class="moz-txt-link-rfc2396E" href="mailto:philmd@linaro.org">&lt;philmd@linaro.org&gt;</a>
> 
> commit f983e598e5a4eada5bfa4731c9db9fba1943e4e6
>      Suggested-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
>      Signed-off-by: Philippe Mathieu-Daudé <a class="moz-txt-link-rfc2396E" href="mailto:philmd@linaro.org">&lt;philmd@linaro.org&gt;</a>
> 
> Please stop that :)

The original patch looks fine:
https://lore.kernel.org/qemu-devel/20221213111707.34921-7-philmd@linaro.org/

Michael, did you change something in your workflow?

