Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493AF34BD1F
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:01:13 +0200 (CEST)
Received: from localhost ([::1]:50320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQXqi-00009m-81
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXoj-0007iS-Hu
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:59:09 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:43977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXoi-0003oH-41
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:59:09 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 m21-20020a9d7ad50000b02901b83efc84a0so9924496otn.10
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bw5AU4BWCNdyhpLYO4wtfi18htcrDkLMP9csbVlSiqM=;
 b=Zq93er048nQISj45NX4kkAp8FqBERR4x5L5fKXU4dhkKVv+0FHMhIcmZR2YcWi6bxJ
 Kf9ATbZVJ3j58QCl0aviX01NSKEKiQELpdIdUOYXho2DRAgEO3Imd4oQ6+9+5F6jLZFd
 Wvzcm6ZdJj5NTnAqpseE7uvQCj0RYN/y24HkDDR4XxfuztuM+paPDtlxHqAKnNhFGt+T
 OGICmKJkltaPwf0G8dXyl3prfFXBGDY2VCh6atDCeoCWcBEE2eu0tmj1/gemZCVgPa1M
 Lz262FEYHBljReaQ2ZfaZQLOpzwV6n3g4y/PdC3L84sjsaLYiQ/v+Tus8Dp5Mh/BHk3l
 dPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bw5AU4BWCNdyhpLYO4wtfi18htcrDkLMP9csbVlSiqM=;
 b=QtPf3EQ2AspMaKuPSGkgzgjqotwk7hmPfBAXb95ReGWf59Lx3zqBdyvBfH2Oojs8Uy
 1O9EgHjyoi3st1ZSKNBh5FN5IUEjz9yqgsaRAs3yDwMSBmMvCDmXAsqezDLN0xbimpn8
 jfayiQOscxmRPvpetYzN8xBnMzOoXggeINC0+dxHlztL0rT4yQ1gLNg+q5IbFE4KNDly
 NdB4a0NtIDKUvlLcoZiQ69sIV2jb1wsIVQLkTKE/FrDGkHR+DRDwr/ttpX9vYHzxBO4C
 c+IGYWz2UwkzPjtvJ5837czqH6PR/Dz8FLjXm2hA8TFCTSCGxaM664zmxaUb1oaZl/vU
 D15g==
X-Gm-Message-State: AOAM531jeGq8AR3CKsyz0nMq3pzP1lAYH+yCCQ/7qXzRkN52LHCM6I21
 GDLr53w63pCYKo2tcDcI5odIybXq8fU8pDyx
X-Google-Smtp-Source: ABdhPJwhkzXnH62r8uuUXjAiWh3g3bHg86+msm5KNCNbriq1MeiPOEUaUHkD7pyTZvplk3LLx8e5yg==
X-Received: by 2002:a9d:6a91:: with SMTP id l17mr19404095otq.18.1616947147056; 
 Sun, 28 Mar 2021 08:59:07 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id z14sm3079133oid.12.2021.03.28.08.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 08:59:06 -0700 (PDT)
Subject: Re: [RFC v12 19/65] target/arm: add temporary stub for
 arm_rebuild_hflags
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-20-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e1472da-b096-9f0c-fc50-352940348735@linaro.org>
Date: Sun, 28 Mar 2021 09:57:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-20-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> this should go away once the configuration and hw/arm is clean
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   hw/arm/boot.c                 | 5 ++++-
>   target/arm/arm-powerctl.c     | 8 +++++---
>   target/arm/tcg/helper-stubs.c | 5 +++++
>   3 files changed, 14 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

