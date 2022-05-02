Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D30951796E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 23:51:24 +0200 (CEST)
Received: from localhost ([::1]:53676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nldwx-0002io-H5
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 17:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nldvk-0001mp-AI
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:50:08 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nldvi-0004Mi-41
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:50:08 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e5so1547074pgc.5
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zA0Ta0L3eeEY8+LlOAHSwc3GMl8kOUZos5ExwCAufLA=;
 b=MX3CdLAGD3YYW/dlZudXjn28BqmAUYd5J2EqEZNXY1j0MZhhdjioKz/NX4hOoP2Gar
 kebGkbYv+bAoTas8TnbAQ+MTuS4oCzla6LkqGc/M6xi3wISMrTuoxTFQFwgomwXhkRC0
 XQWv5tfTVOgE1dNUm0wHXkxbqqSdgMnwrAC4Y21yplTz4yLtKvxu9r5RZNkOwlJLSQTc
 rpPBoyV+mYc0+QI4AP51heSgfZWq9225CuqxgmDrkhZ/dl3Iu2OBeN+aztSeDeqe4N/f
 AQpNgmlxxe/Ay+yUqaHVyfT7iap/1qDGZWGZm5v7ZUOUZBEiMY/clDtgVOs/jHdHMG9T
 z+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zA0Ta0L3eeEY8+LlOAHSwc3GMl8kOUZos5ExwCAufLA=;
 b=YgNtCtIz1Ofz8R2eWk27OSSjzt7Mz7p+HH4VV1nRk0mtp8C5odFbEDW0++LTWGhXbg
 AsukxQS6yD53dJCJbmEibQ9d/ilyaNR315qTU7geGQ55waTgtDPPSubC5itr1VYu3Pm+
 euCzyZpPV6Nip110iH/t9Z/9BuBginE4xoa/YtdKYlz0mFtDijQ+t8xlqO0hSV1roc9B
 xQSlm50Phbp75ns/bWWIRvflrCxMFwRwGx3r0cke18h5ZLGV6Wk5Y7OqAhuga2r4+fDL
 qZB71PmsZkgR10Djui50fxIc+DBJ4O3+chEWgWCVmndvAlSWWa/yT/3QmqZjD/gwAhi1
 08cg==
X-Gm-Message-State: AOAM532RFQG++1MtBOQb1uHagXZECnnwRSnHmGAe4gCQ1vLFpaat09kp
 jR053Urbaruf9+FRUSrf+sbHqg==
X-Google-Smtp-Source: ABdhPJxsx8Ux+SMdjmUvs1KvpMbnO147q9SYFSRskEAnzjMaX1Ro7kAe3YczG6D9C3tgI5Gs1yQLWA==
X-Received: by 2002:a05:6a00:212c:b0:50d:a337:7437 with SMTP id
 n12-20020a056a00212c00b0050da3377437mr13272477pfj.70.1651528204420; 
 Mon, 02 May 2022 14:50:04 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a62ae15000000b0050dc76281e2sm5131400pff.188.2022.05.02.14.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:50:04 -0700 (PDT)
Message-ID: <786af1fb-0484-6901-6905-13b346b77a6b@linaro.org>
Date: Mon, 2 May 2022 14:50:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 16/21] target/ppc: Remove msr_ep macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-17-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-17-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On 5/2/22 07:39, Víctor Colombo wrote:
> -    if (unlikely((value >> MSR_EP) & 1) != msr_ep) {
> -        env->excp_prefix = ((value >> MSR_EP) & 1) * 0xFFF00000;
> +    if (unlikely(!(value & env->msr & R_MSR_EP_MASK))) {

Needs xor.

> +        env->excp_prefix = FIELD_EX64(env->msr, MSR, EP) * 0xFFF00000;

Needs extract from value.


r~


