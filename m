Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C6C6322D6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 13:50:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6EX-0007Mq-WF; Mon, 21 Nov 2022 07:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox6EI-0007JE-Nb
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:49:01 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox6EG-0003tc-S7
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:48:54 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bs21so19702065wrb.4
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 04:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DoZJxa3pfaByFDGbToA5MnkMxzqaUuUK5RKomxSjovY=;
 b=PQKxwRTm/rEKDDIBk4uK4HRQWsGM75UOkTrZzhowiVZJzbtMgX6fjVFRS+FiZ5m4Np
 IqlwiNCe511+4Uzshd5S3osxKGXmL38EdDmerbhIutyZOPhnMiyXVJCdPh3HtaKtCtlj
 byo5H45BxgwFl3wry8oqvdhs4oU7I9rWRlNjlKZuECONK9VxKTu6yk7P0pudaJRv2i8N
 8sbf7FOcnI4sauMSqpw98DSXAlZk4JCQvQnQOwP6gs3QBtYUGw9+ALyeNGPtdvpcxeDg
 HI3/cP7om/mxZmMCmoOkS29QGZySPprZUVEEjhbweEkTCVi2uKPoQhl8q2Lgbpn8Ze50
 /lVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DoZJxa3pfaByFDGbToA5MnkMxzqaUuUK5RKomxSjovY=;
 b=WtrWouG/NkOh1ddojAx7srmYzMNELw4ZbMEtXUgUsnzJ6BIeTzvGU2dvzhZia6WrJG
 GcL5Pr3dMaKIj/MfLEB8o78EoHEI48ea37w8DMWS1HGWOVKo6ZH8e9vjc3uxk37oCOTx
 K6L3f99xAD3uhAlbcwzEX+2U3cVV+ujxmJ/3WYE21hotiWfle6NDir5N/wnCt+1YuQef
 PlciA88gy/gofjT3iuvJqiNXXJpGnfXnv1EU6L2MIDqJxrHTP+SL0jrj27afQyT7hSGr
 AqY6rrm17FkeElggCS0MOgXZQ2iA97QStEqZ/gATTUvgxaGWy8g0wz4FjfsbBU4sIah+
 d12A==
X-Gm-Message-State: ANoB5pkWNn97dv/4mRROBwOpPTADQ04ADkC4BQOf46lfmcXJfrvYcgvQ
 5CyhEOOTWpWw5SFGcgcPOhDivg==
X-Google-Smtp-Source: AA0mqf60HG6HE6oRcnIMQ88Yu8qClysFlrtnl7uKUUdF2WxPFk0PBhLZOksvTMWhjncBB+pU6G4S9g==
X-Received: by 2002:adf:dd07:0:b0:23a:2311:b72 with SMTP id
 a7-20020adfdd07000000b0023a23110b72mr4889482wrm.147.1669034931061; 
 Mon, 21 Nov 2022 04:48:51 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 4-20020a05600c020400b003b492753826sm13255608wmi.43.2022.11.21.04.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 04:48:50 -0800 (PST)
Message-ID: <fa653fef-b081-c9e8-896b-b16635174a40@linaro.org>
Date: Mon, 21 Nov 2022 13:48:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 10/29] tcg: Unify helper_{be,le}_{ld,st}*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118094754.242910-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 18/11/22 10:47, Richard Henderson wrote:
> With the current structure of cputlb.c, there is no difference
> between the little-endian and big-endian entry points, aside
> from the assert.  Unify the pairs of functions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-ldst.h           |  60 ++++------
>   accel/tcg/cputlb.c               | 190 ++++++++++---------------------
>   docs/devel/loads-stores.rst      |  36 ++----
>   tcg/aarch64/tcg-target.c.inc     |  39 +++----
>   tcg/arm/tcg-target.c.inc         |  45 +++-----
>   tcg/i386/tcg-target.c.inc        |  40 +++----
>   tcg/loongarch64/tcg-target.c.inc |  25 ++--
>   tcg/mips/tcg-target.c.inc        |  40 +++----
>   tcg/ppc/tcg-target.c.inc         |  30 ++---
>   tcg/riscv/tcg-target.c.inc       |  51 +++------
>   tcg/s390x/tcg-target.c.inc       |  38 +++----
>   tcg/sparc64/tcg-target.c.inc     |  37 +++---
>   12 files changed, 226 insertions(+), 405 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


