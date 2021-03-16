Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C73533E01D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:15:00 +0100 (CET)
Received: from localhost ([::1]:34720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMH1n-0004cA-3C
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMH0q-00043X-Sp
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:14:00 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMH0o-0002dn-3U
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:14:00 -0400
Received: by mail-pj1-x102f.google.com with SMTP id gb6so11305567pjb.0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 14:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tHqILMUBcKh9wPHZJkYv7qq6cy8jUMWX09mVHQXr//4=;
 b=VFBfpmaB1t1NWM430DZuhGwkYJWWuuxSrIys7H9DZjJVPWJtgq5UreYyvIq8luTIkR
 T1cQ4wB/p+fUoZqa+t2dznS95YnG252Lcm83Xu+Xtd5IZEQGOefF47lnY1RAEEdKeM6d
 lm9jVtPYSNK2Wj4p5t6IVIj/IBZNQ/taMre4QZvrjAvOGX+/0qhPG14wbXYfl7WvLVlB
 Idt4hFmOu0Y5cP3ag0fZ2CjpIE0SGVAluyk5udW/2RGZfLF8m97Drl5DbiVKQPtnotCy
 VUoNxf3ynXL0bxkDyVeOZYDquBnfaLCB87ShuojEtrlWqF4BXsXIe70VZzyoLNiViHcM
 4wPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tHqILMUBcKh9wPHZJkYv7qq6cy8jUMWX09mVHQXr//4=;
 b=tvV44gyzlppLd4kJOMO7OLAqYKikgFDWRpb6xAlW/S/iHGQsKbB1T/qsx+PjXKfcJg
 leRH48AKlLr392wnIe67G/CVX9C81dqXyjZ2/kWsVdcVop8NARIY1ZAN95SHc/Vk9auB
 K87Bgwee+IX+pkdTEwGd67pGBPSGwjzs9kJg6zR3jZaiC7/KNhJ03jRd4F4A+TeQLnbw
 E0tDSD3zUVE4vdGAz9XtwmrTN7oXtybFmdGbXT6VCOebV7RZdo9zQDsEuVtRu9RM5vgd
 Y0ingyNVfZFKQLTVifLut14hMJblWAKf1tHQZVnHCD6TrW3iQ5YSGDu+Elbi2CQoHIOQ
 eHPQ==
X-Gm-Message-State: AOAM532WG+3BLVUScA2Z4I5CIDjPQ15Dv5HiXARyYcBuIk7W52fx3BWo
 wVvZi87Vgg+E0wS9X5P/hQWCEHsSckBhFChv7eUyUm/vIdNAZdfY0wiA3SLOJjK7QNIgC5FZvft
 ZdTy4ghvdQXB/Kq9JXOSKUuFunpzu9+VkhJLYINTeDWnD72PtZws8SH1y45grr5lFU7t3uYI=
X-Google-Smtp-Source: ABdhPJyI+E/xO3RKncvGf0pgx2AdLQ6m2qOxgJq7T4453lqHm95LOgEGiJkWJ1CHw42GWDy1vfZ9Gw==
X-Received: by 2002:a17:90a:be07:: with SMTP id a7mr954033pjs.75.1615929236141; 
 Tue, 16 Mar 2021 14:13:56 -0700 (PDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id f2sm268005pju.46.2021.03.16.14.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 14:13:55 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210316154910.25804-1-rebecca@nuviainc.com>
 <20210316154910.25804-2-rebecca@nuviainc.com>
 <8124cf7a-1634-7232-465a-172aeec47d07@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <1e127c1f-7ff7-1f8c-a245-a85bfa3693bd@nuviainc.com>
Date: Tue, 16 Mar 2021 15:13:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8124cf7a-1634-7232-465a-172aeec47d07@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=rebecca@nuviainc.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 12:09 PM, Richard Henderson wrote:
> On 3/16/21 9:49 AM, Rebecca Cran wrote:
>> +    for (page = addr; page < (addr + length); page += 
>> TARGET_PAGE_SIZE) {
> 
> This test means that it's impossible to flush the last page of the 
> address space (addr + length == 0).  I think better to do
> 
>    for (l = 0; l < length; l += TARGET_PAGE_SIZE)
>        page = addr + l;
>        ...
> 
>> +        for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
>> +            if ((idxmap >> mmu_idx) & 1) {
>> +                tlb_flush_page_bits_locked(env, mmu_idx, page, bits);
> 
> Hmm.  I'm not keen on this.  You're not able to notice the special cases 
> within, where we flush the entire tlb -- and therefore you do not need 
> to continue the outer loop for this mmuidx.

Would you be happy to have tlb_flush_page_bits_locked updated to return 
a bool, indicating if an entire flush has been done?

> The cputlb changes should have remained a separate patch.

Ok, I'll split it out.

-- 
Rebecca Cran


