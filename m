Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFAF510D73
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 02:54:21 +0200 (CEST)
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njVwi-00012E-8Q
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 20:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVu6-0006oK-B9
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 20:51:39 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVu4-0007lm-Sw
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 20:51:38 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso3658937pjb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 17:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W2DvTF/BOGGBdbW2we2U2e7KrkZ6zxSF30ORtrqHpaY=;
 b=fDG6p8g5Fatrgv3CIqEpWN1RPOLRAa34lWENSB+TBVWSssGA+GZENkVnmxptQpe3SP
 qRmoZeoQT/4b6nJyGOYvL7gIire6m6sW6id+5kkZTWspfkEsqaQOIwUvbmCxP5fzPcEG
 lRfPPjtp1ng4/msPSoYitygjJ92P/d1RJI4aVFUE+8TSmiImFpUb7sn8VF1CBETxLREv
 H8lHR0C9mlxIsa67SqUtRN74fKYrms0YUWudv/8ti/Zhec86/zjx+R3lYxTqfFVpov26
 SegkOWlLbsJJPhyHvfhIc1SQXk1VKz2mrylC5pSA8LVYZPViOLu78otOJfpiD53nZi3n
 9r1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W2DvTF/BOGGBdbW2we2U2e7KrkZ6zxSF30ORtrqHpaY=;
 b=8KpHE7X8Q1SABP8aVdt4LvZviyvtGrkRu83JCitTn45hPs/u16r7lm2ktWECQzBZFg
 iAAFzJnJ5rwx/Vi7h/BsZs2P54I/e0gi/QQcBp+7iPxMn9NlIu+C9qX1wQlp+PIQbxNa
 UAz4EY7OpioBLsRkAELClfDx8uisk/OQHJUV8vLpkkN9IRxP0mkkvfwLAidiV0BvCIgt
 vWj1uPNiyE1XZzdMj5SGFoIdp74tYucOJ+FUyV5kAqJi7wVWW/bEk78bvKYeSJvnG7ao
 tPCDjYjrVTRyzqTZDbvYYWWp6Z/2ChLN1S4qVqwV2MAyCbyivMwXCT5el/jhBMJqQJWy
 8jAQ==
X-Gm-Message-State: AOAM53348tuSOBvmLu5T03iWG2w6Jh497PSm2dasvA3fP1c45e8jOIQd
 1kVrkd0cp5Y9N1rHfWXl2QM82A==
X-Google-Smtp-Source: ABdhPJx64wll+CoIlLc8tu2KXXDtvUOb9DR8LGSpT6BJkfQWOQW6I4miKe70ASiXwDk0QPGgS1e9Pg==
X-Received: by 2002:a17:902:aa06:b0:158:f13b:4859 with SMTP id
 be6-20020a170902aa0600b00158f13b4859mr26098257plb.141.1651020695471; 
 Tue, 26 Apr 2022 17:51:35 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a17090a639300b001d945337442sm4498964pjj.10.2022.04.26.17.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 17:51:34 -0700 (PDT)
Message-ID: <aa261bdf-b71e-1343-a443-752129f4b896@linaro.org>
Date: Tue, 26 Apr 2022 17:51:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/5] hw/intc: Support migration of aclint device
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
References: <20220426230855.336292-1-atishp@rivosinc.com>
 <20220426230855.336292-4-atishp@rivosinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426230855.336292-4-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: qemu-riscv@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 16:08, Atish Patra wrote:
> mtimecmp is part of ACLINT device now. This needs to preserved across
> migration.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

This must be squashed with patch 1.

> +    .fields = (VMStateField[]) {
> +            VMSTATE_VARRAY_UINT64(timecmp, RISCVAclintMTimerState,

And this must be UINT32 to match num_harts.


r~

