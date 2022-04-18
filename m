Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF79505A16
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 16:37:31 +0200 (CEST)
Received: from localhost ([::1]:55482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngSVN-0008I7-Ml
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 10:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngSSR-0007UC-G5
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 10:34:27 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngSSP-0005Lg-BD
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 10:34:27 -0400
Received: by mail-pg1-x532.google.com with SMTP id j71so5690790pge.11
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 07:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BVawxdyYjTM41b0/D63v5y2ACTfQ8Mgh1OsRzFkK2pw=;
 b=lsypfTu7RM6xTolL5rjfrRWlDU09EXbvD6LNgsXlx90vVMgcqtCCGOh9p1g53IAE00
 3a5SPpq6m+qRcVUgyhEVr3bc7RppWh+Poq31bWO08uvejST7NwEletSxMRg62NyukTS1
 78rvGemn+nJNfhxczEInFa4i3gPZ54/JGCdcb+IschtoIOeDZOqtwOHR5bDIktQ2h7Ix
 9TVtmg2f6bavOd6RPkVtUAAob73aypGoPh2i0lEnknWIEiXD0gF5Zwt6BQSgbdEKj5uH
 dtEHxP7h7sOyemQZQFmE/7hPhHm90HSFh+PdSn9eohKa9cT+iTGpXKQl1KvQw7yfgyjT
 F4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BVawxdyYjTM41b0/D63v5y2ACTfQ8Mgh1OsRzFkK2pw=;
 b=40PLmEb5FfmGhwSDGyDL76vShc43rsCX2uLUiUB58mI059gVFl9wjJRzymzEv3Ak/E
 +v4p0QBjwLIxFY6RpRo4XIjbtq5fIiw/JCRXOzHL1J+HfWAqUngaKqWp9wq6r9nrckot
 kLOCFPP8jy8/xnkMpADcxFWXzocCqZfw5B9sJoPgMQ4pV1gVebZzIPSCpB4ULOLhEPQP
 8NGsc54suRhXxUldXkDVc7dcTlu2FUrLckU4XXLlyVPeb2I3fwPb4dgRJsT1GlxMPUQq
 8t68r7BeU2YDFXsUNPWC4iTCYV8KmJF0Dm+ZWxQv/djE9vXJzF2ByHTeNmOdU82aV1Jb
 GVow==
X-Gm-Message-State: AOAM533pZ3C2yTs9A0LeTGUiN0zOy5rjsDwaqKzxyurKpDiX0A6h0y+3
 widFnzY/rDhl9Ub4eSMM2JnTFA==
X-Google-Smtp-Source: ABdhPJwSBcsws8NIPZJp7+pBEfrHNA7NgmC1XXRLLnjz4hWwyvbwwpmfpZBwo+Pdb08pKDhZpyovhQ==
X-Received: by 2002:a63:a61:0:b0:39c:b654:b753 with SMTP id
 z33-20020a630a61000000b0039cb654b753mr10292994pgk.117.1650292463645; 
 Mon, 18 Apr 2022 07:34:23 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a17090a674f00b001cba1008a3csm13295349pjm.51.2022.04.18.07.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 07:34:22 -0700 (PDT)
Message-ID: <be252b59-9794-7743-6908-22fec9b255c0@linaro.org>
Date: Mon, 18 Apr 2022 07:34:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 25/43] target/loongarch: Add LoongArch CSR instruction
Content-Language: en-US
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-26-yangxiaojuan@loongson.cn>
 <3409287c-ac98-2087-3d00-1bd23c1a00da@linaro.org>
 <e556f5bd-8fb5-7244-c812-e0dd019c52e0@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e556f5bd-8fb5-7244-c812-e0dd019c52e0@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/22 05:38, yangxiaojuan wrote:
> 
> On 2022/4/16 上午9:04, Richard Henderson wrote:
>>> +int cpu_csr_offset(unsigned csr_num);
>> ...
>>> +static const uint64_t csr_offsets[] = {
>>
>> There's no reason for this array to be uint64_t.
>> It really should match the function. 
> Yes,  we shoud do this.
> 
> If we use 'int', we may get a warning:
> ../target/loongarch/csr_helper.c:49:30: warning: overflow in implicit constant conversion 
> [-Woverflow]
>        [LOONGARCH_CSR_CPUID] = offsetof(CPUState, cpu_index)
>                                                  ^~~~~~~~
> How about use 'long'?  I had tested it no warning.

That is because offsetof() result is size_t, which is unsigned, and a "negative" unsigned 
number is a large positive.  Cast each offsetof to int.


r~

