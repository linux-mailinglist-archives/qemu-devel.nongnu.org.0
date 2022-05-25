Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E42B534678
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 00:28:45 +0200 (CEST)
Received: from localhost ([::1]:48620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntzUi-000625-86
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 18:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntzSh-0004gX-36
 for qemu-devel@nongnu.org; Wed, 25 May 2022 18:26:39 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntzSf-0004ot-DO
 for qemu-devel@nongnu.org; Wed, 25 May 2022 18:26:38 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c2so19807690plh.2
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 15:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=YlfmRo1vI++989folwqh0fxN2wBmTkMSsS/gZkbTio8=;
 b=gyGX6toQUtOPqpf5EDsiuf3eIpTmHTjEJ6LtkIr4vcmm4vTrldBVsTxY+IKqfcJtwx
 ayRqRHweInSJnXdb3A81rT0/WUkZfz6sq92Sk6S5E0xq+54v9oZ6F2AOgVRNSdB0jKVe
 VFgnriwvP67rJnK6MhxZK5q7ESOd4WmuT1BtSU8SeQ2lkththdcU+ZXKoEWEHu/Rn0we
 YfcvwT3LuPN4EQ3pXMHLIg0M2UHgdWrj3EnqHaXBX0UoB/PoopXR1D1KhCecqeA3FoVb
 p0im8kXykVzFeNE8NtGW49yjKHtJ0086aiY+REW+Q+6q8lD+0D4SNGzg3dz9X2YiEzxm
 7P7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YlfmRo1vI++989folwqh0fxN2wBmTkMSsS/gZkbTio8=;
 b=zarSikqTvLwIkUnFd9DzdHX3eYVxRmIhoVMi5R/sm84WRGgrJWy4F7cDZWFsOrQWpy
 bICaiUYDUmv2SkPIVk6IoZFkrwu0QoSr8VtDYfDvv6U2bf3A7UyitBRSdAlp52pj6MeE
 /tz/pFvIEdoWGFC2bx8pPFDWyAQ0qJguAk9zUw3CQN5ZSSlLJYqnjUXf44mCfnnpmOX4
 iZaGAHprXdAymSGewnEpq3fm3AAFt0hQOdu6kMo/eoiEggH7CKt5BYrOjKDlpRpOgn7q
 Ncmp/Pud7Dg7s8BRn9t/8doAM82dX87yRtt2ZlwchW0Igj6PZbFeMb3kN4Ft6FRf43cZ
 aZoA==
X-Gm-Message-State: AOAM530OX9YAOFwUgVj1322vefQyRvvXK774WFpie3Ou00SOzBAcHJ1o
 EYZNZ4gum4AQSkVdxkLKTyiamA==
X-Google-Smtp-Source: ABdhPJzz1E0xRdel0sAPZ0ouYGD/YOggB6Q7MQB+aWYUydmpqQ/r0Mkzz/K7PIVaIL2I1CkNW3T5mg==
X-Received: by 2002:a17:902:f641:b0:15f:21f8:92a1 with SMTP id
 m1-20020a170902f64100b0015f21f892a1mr36314641plg.56.1653517595803; 
 Wed, 25 May 2022 15:26:35 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a170902d18300b0015e8d4eb289sm9646510plb.211.2022.05.25.15.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 15:26:34 -0700 (PDT)
Message-ID: <6e1fc8f9-b422-ab6a-191f-cc36e404355a@linaro.org>
Date: Wed, 25 May 2022 15:26:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 10/17] target/m68k: Implement TRAPcc
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-11-richard.henderson@linaro.org>
 <ce53c8b1-b3fc-1cd4-7c65-58d970df5733@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ce53c8b1-b3fc-1cd4-7c65-58d970df5733@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 5/25/22 14:40, Laurent Vivier wrote:
>> +DISAS_INSN(trapcc)
>> +{
>> +    DisasCompare c;
>> +
>> +    /* Consume and discard the immediate operand. */
>> +    switch (extract32(insn, 0, 3)) {
>> +    case 2: /* trapcc.w */
>> +        (void)read_im16(env, s);
>> +        break;
>> +    case 3: /* trapcc.l */
>> +        (void)read_im32(env, s);
>> +        break;
> 
> Do we really need to read the data or do we only need to increment s->pc (as the data are 
> only here to be available for the trap handler)?

We need to read the data to (1) trigger sigsegv when this insn crosses a page and (2) 
passing to tcg plugins.


r~

