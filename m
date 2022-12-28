Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7399657580
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 11:52:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAU1b-0002dp-I9; Wed, 28 Dec 2022 05:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAU1V-0002df-8L
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 05:51:01 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAU1T-000259-Ob
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 05:51:01 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso11049928wmb.0
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 02:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6QVvvWPrLrXxrvq79Xfp1U9qrMnAwTkBtEfdNPOHDKE=;
 b=gI9fBMclkZLftDYflZE03W4RLyFReGEDGPPDFsfo7OF3T1r+qmODC1PKLXkKZ0z18T
 VYmuFzzvgc4+qatioCtAXYdVBk7TTT4Bk78BqPjQGMdFY8t6onHyLiXWLmDCagf3sf31
 5/YAdzyt7V5SEnWDnBXt5uEiipSFBJ1qs2/t49WpO52bLKTWytPf5Ouyj5kspaJ21DBR
 v6kOfDHxENQMEOyLSdoH76SSfJ/JSCX0KvpVawkyY1CPAxDAc+vJksB6mEcHViKhsuUd
 F9PtMfV60mJi5+ZAWXsNsNPy1b1AEj4OkTFMlubkNOH8vK6SwPSOiPJ9R9rV3fXtkvm4
 7r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6QVvvWPrLrXxrvq79Xfp1U9qrMnAwTkBtEfdNPOHDKE=;
 b=AkCkEfKXDDN07DAlRbCs+ilP0qZDwCdge3tnu1NS9bwxB55qM99VKnCKe5ecjRr9MO
 CvB3oNI1X19854RdiZh7ydnsVCEdV4YIvKH4zjXu8VFXu5G1jOMS1QuOW/J/WpsRo3FZ
 hhfO0lZHxFm1rnk4o6hQgU4/sMT0wUlaaXR2qk0/wt7mQtBjg3pckOwiilbGv7LMLAuL
 ER4MOiZbqFjtFvNZmvWTGwUpwmHVQ1FieKCNF3Xi5JNvpLMf/flFXIrNQXsaWagtMpy9
 zBh0Po+F+XUqO75wA4mHoPKNmfU8mNbtox88/7Acfvn2iegduBIt6JHw34Mjwsu0OJIb
 3JBQ==
X-Gm-Message-State: AFqh2koXtk5iMoV16mv0GOj212uwgz1dkIvP7sXhVGJXo09SwhyKUX50
 tm3TYseEKD5++qvg4kaDdkxBPQ==
X-Google-Smtp-Source: AMrXdXu9adroBEPP+b70U+N+/QHdoXfx41s0E0Ft9vcJUp3ncskIIaUG/x908pdqFueefGXtMIySGQ==
X-Received: by 2002:a05:600c:4e48:b0:3cf:69f4:bfd4 with SMTP id
 e8-20020a05600c4e4800b003cf69f4bfd4mr17747200wmq.7.1672224657846; 
 Wed, 28 Dec 2022 02:50:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b003d98438a43asm9283816wms.34.2022.12.28.02.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 02:50:57 -0800 (PST)
Message-ID: <4db15db9-2f00-c71e-c5e1-e41c81090ee2@linaro.org>
Date: Wed, 28 Dec 2022 11:50:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v4 2/3] memory: add depth assert in address_space_to_flatview
Content-Language: en-US
To: Chuang Xu <xuchuangxclwt@bytedance.com>, qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, zhouyibo@bytedance.com
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 23/12/22 15:23, Chuang Xu wrote:
> Before using any flatview, sanity check we're not during a memory
> region transaction or the map can be invalid.
> 
> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
> ---
>   include/exec/memory.h | 9 +++++++++
>   softmmu/memory.c      | 5 +++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 91f8a2395a..66c43b4862 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1069,8 +1069,17 @@ struct FlatView {
>       MemoryRegion *root;
>   };
>   
> +int memory_region_transaction_get_depth(void);

Do we want to expose this; isn't the depth internal?

If we need to expose something, can we restrict it to

   bool memory_region_in_transaction(void) or
   bool memory_region_transaction_in_progress(void)?

>   static inline FlatView *address_space_to_flatview(AddressSpace *as)
>   {
> +    /*
> +     * Before using any flatview, sanity check we're not during a memory
> +     * region transaction or the map can be invalid.  Note that this can
> +     * also be called during commit phase of memory transaction, but that
> +     * should also only happen when the depth decreases to 0 first.
> +     */
> +    assert(memory_region_transaction_get_depth() == 0 || rcu_read_locked());
>       return qatomic_rcu_read(&as->current_map);
>   }


