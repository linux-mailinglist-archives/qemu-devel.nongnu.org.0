Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A23F4A7DBC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 03:16:59 +0100 (CET)
Received: from localhost ([::1]:57426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFRg9-0006gw-P7
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 21:16:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFRen-0005m4-BX
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 21:15:33 -0500
Received: from [2607:f8b0:4864:20::1035] (port=39744
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFRel-0007n5-8h
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 21:15:32 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so8607946pjj.4
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 18:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=odaOo4DJMCQfl7oKUK6USSyGGQog4w0fIWCrWvUQ7x8=;
 b=EKyxbXL39agnM0P9rHl1FfyqtFMnvmOcmxCLJzmjuRegdAcABO5DZ6tfPykJdu7wxS
 iQmzhw0HRVMIMWgqrU64pxJE6cHgCbNGgrkAcGJHlpcyoTgO+OrZI37zSJlZHyYscqti
 Uex9OUQSZip+prjelvlowLQrooYB5R6Zxcs4z8IHpiXQ92BuY5DolHkkBnOO8XL9hAZ4
 jQBULxY/VqDgJBrTRTwiC1MyquT6bH8SjOOiKzsH2SfoeEn2hdXvWp18SDpghmRPtsX1
 2BRIMZ8+g0d6wLpC6SUtpPQSCNpsehJRoBXiXVRsKG4qonjxYyyKDBt59HIbTyW/hXNg
 Ouug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=odaOo4DJMCQfl7oKUK6USSyGGQog4w0fIWCrWvUQ7x8=;
 b=DbQCsc2Pi+nAa7FxZgIySjC9P+LWX9nfVV2FulTN/nW6gm0Q2k2BAiF0MTT8Uo5uvs
 VxBOiyinQdiU8NoBZfgRBJc3BpoHdUXfxrnFwBYoVG6t6Ogq3ln8Bet+/EBjVdArrAOH
 RJrnPtw8eZ/yp4RaUDxY+c3UcvildyqycqqtseEmevmMSMCypheBuF3+Bgrd6ykPMnGX
 KgYVU1w1Mnuv0uPxsSjpdDnACZWm4fZn09lgBXOAQSiHoCLwEcQn1X8X1azDvhfhOXU7
 ethlRxNqf0STXPPg0ITE6NId1Q8PFEJSkpFfmQDlM7EtniRaQUMeDle5LdvA/A2lD3mt
 3zRw==
X-Gm-Message-State: AOAM530fZZW0zNA2zIA1pRF+BaAcsQyQHJTXj2EQMmMSMc6V/kZjXYZE
 6iNlj4tYQBv5Q790NrHmjbZhhg==
X-Google-Smtp-Source: ABdhPJy+o6UBvn9gYD1MMtMCNg2x8j3NXyiLdACpJJup594a1FhzGVuFE9MExockMD47PNyAHghJNw==
X-Received: by 2002:a17:90a:e285:: with SMTP id
 d5mr2358857pjz.16.1643854529740; 
 Wed, 02 Feb 2022 18:15:29 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca?
 ([2001:8003:3a49:fd00:801:72a7:386c:deca])
 by smtp.gmail.com with ESMTPSA id s15sm27656970pfg.145.2022.02.02.18.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 18:15:29 -0800 (PST)
Message-ID: <891811db-ee3c-a6f6-265e-1fd3ee9980bf@linaro.org>
Date: Thu, 3 Feb 2022 13:15:23 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/13] hw/intc/arm_gicv3_its: Use address_space_map() to
 access command queue packets
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 06:31, Peter Maydell wrote:
> Currently the ITS accesses each 8-byte doubleword in a 4-doubleword
> command packet with a separate address_space_ldq_le() call.  This is
> awkward because the individual command processing functions have
> ended up with code to handle "load more doublewords out of the
> packet", which is both unwieldy and also a potential source of bugs
> because it's not obvious when looking at a line that pulls a field
> out of the 'value' variable which of the 4 doublewords that variable
> currently holds.
> 
> Switch to using address_space_map() to map the whole command packet
> at once and fish the four doublewords out of it.  Then each process_*
> function can start with a few lines of code that extract the fields
> it cares about.
> 
> This requires us to split out the guts of process_its_cmd() into a
> new do_process_its_cmd(), because we were previously overloading the
> value and offset arguments as a backdoor way to directly pass the
> devid and eventid from a write to GITS_TRANSLATER.  The new
> do_process_its_cmd() takes those arguments directly, and
> process_its_cmd() is just a wrapper that does the "read fields from
> command packet" part.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h |   4 +-
>   hw/intc/arm_gicv3_its.c  | 208 +++++++++++----------------------------
>   2 files changed, 62 insertions(+), 150 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

