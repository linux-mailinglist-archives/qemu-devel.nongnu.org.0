Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2486B7144
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:39:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbdiA-00023Y-Np; Mon, 13 Mar 2023 04:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pbdi5-00023D-29
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:39:13 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pbdhy-0002sl-8T
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:39:12 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x11so12057732pln.12
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1678696744;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/Y7fpLisRhJ6/2kh7ch+nPCOuNDva4YWA3YxAsGO8w=;
 b=JhqHProekDgIceUCK1ejLR3fOzQaTWxI58gGty4MMLYadhoPK63ZKZKuYObEZa4tJj
 6kOISTVrMAQiqvm9UrG3QFDdNp0eafJpebhfpzdqo2fQCDjIaAXYyQ1nB+yPDzwKwnR1
 uaHsCqjbg6KHr5u/WVyhr3ojyM3ChivhapzDmgDzkRt73rHbhJR337rX/QijJvflM1WB
 IOHeJ7DC6WxhfkC2wl1fyaHZSnYuvMgPs87WpogfzBfvQwr4bIJ+iTD1eECq111NsbSK
 DXfbPXoylbgTJ4+5Pf3GeNh9lkG7fdhaShsLnCQg4qGsCpAwKKR19pYzkgDbJeE0F5Ye
 QO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678696744;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=j/Y7fpLisRhJ6/2kh7ch+nPCOuNDva4YWA3YxAsGO8w=;
 b=oqJP171DeTxfD614yNcdVBr2Cu+G9sdU5kd3sqxwC7QkSyeoHapV+N6CNfmXKVm2Zt
 Xcl51kzjpnWS9la5PNR7hWXow3+Luz6JnVR2K4BJvjL/HzhcUI5akTJ4R/R9L2JG3X9E
 QB5EMl2yQzQwf0zJvdrOgA4cxySez5a1e2+KMWduiKgoCKOxtbPC1CQcY0Q7D+hiVv7u
 D+qbNscFXUOQlW8f5HQ9s+JMye5nipoJvtERQktLC4UP/FF/zRPnwCw3FtvsrqNgqqNs
 VHLAIbUwTRJ08FLIXM5ltnvsqMKDMdKOp0qzuaBJ7f0mGcZjnTcoHbVroNyvm+HiwNVj
 /HpQ==
X-Gm-Message-State: AO0yUKU3dztjW85cCPtuh5k/fJWEUS7UoMcPHUzP2VxnIMe/AzgHAyQm
 LXRLVKPqkd/ufcsgc88J4hGFLg==
X-Google-Smtp-Source: AK7set8M5EoF5U8zInEnyi/uX+0vHL0uxMfMpq5BOtRsslfBdi2gJv1CCBrpn66X3nZjbmtEkZfccg==
X-Received: by 2002:a17:90b:38c7:b0:234:b03:5a70 with SMTP id
 nn7-20020a17090b38c700b002340b035a70mr35052082pjb.35.1678696744585; 
 Mon, 13 Mar 2023 01:39:04 -0700 (PDT)
Received: from [10.94.53.13] ([139.177.225.233])
 by smtp.gmail.com with ESMTPSA id
 kk7-20020a170903070700b001992521f23esm4174036plb.100.2023.03.13.01.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 01:39:04 -0700 (PDT)
Message-ID: <c19d7ca8-f10f-5ff2-7ec8-ec939de0e474@bytedance.com>
Date: Mon, 13 Mar 2023 16:38:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v7 6/6] memory: Introduce address_space_to_flatview_rcu()
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
 <20230310022425.2992472-7-xuchuangxclwt@bytedance.com> <ZAtH3XgTtqwTpcOS@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <ZAtH3XgTtqwTpcOS@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_LOCAL_NOVOWEL=0.5,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi, Peter,

On 2023/3/10 下午11:08, Peter Xu wrote:
> On Fri, Mar 10, 2023 at 10:24:25AM +0800, Chuang Xu wrote:
>> In last patch, we wrap vm_load with begin/commit, here we introduce
>> address_space_to_flatview_rcu() to avoid unnecessary enforce commit
>> during vm_load.
>>
>> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
>> ---
>>   include/exec/memory-internal.h |  2 +-
>>   include/exec/memory.h          | 20 ++++++++++++++++++++
>>   softmmu/memory.c               |  2 +-
>>   3 files changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
>> index 100c1237ac..1432240449 100644
>> --- a/include/exec/memory-internal.h
>> +++ b/include/exec/memory-internal.h
>> @@ -30,7 +30,7 @@ static inline AddressSpaceDispatch *flatview_to_dispatch(FlatView *fv)
>>   
>>   static inline AddressSpaceDispatch *address_space_to_dispatch(AddressSpace *as)
>>   {
>> -    return flatview_to_dispatch(address_space_to_flatview(as));
>> +    return flatview_to_dispatch(address_space_to_flatview_rcu(as));
>>   }
> I'm not sure whether this one is always safe.

Previously I considered that there was no address_space_translate_iommu()
traced during vm_load, so I took it as safe. But my trace may not be
able to obtain all cases of triggering do_commit() during vm_load..

>
> tcg_commit() seems to be safe, but maybe address_space_translate_iommu() is
> not?  Maybe easier to leave this untouched?

Yes, I'll fix it in v8 later.

>>   
>>   FlatView *address_space_get_flatview(AddressSpace *as);
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index d6fd89db64..235e3017bc 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -1100,6 +1100,9 @@ bool memory_region_transaction_in_progress(void);
>>   
>>   void memory_region_transaction_do_commit(void);
>>   
>> +/*
>> + * We recommend using this by default.
>> + */
> I think this comment doesn't really help.. drop it?
>
>>   static inline FlatView *address_space_to_flatview(AddressSpace *as)

Thanks!


