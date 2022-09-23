Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C175E79E7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 13:46:00 +0200 (CEST)
Received: from localhost ([::1]:44650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obh82-00048U-2J
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 07:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obgy9-0001EO-FT
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 07:35:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obgy6-0000QE-Ap
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 07:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663932941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GrpygFtsOGpgTLnHbyV+bzcqmrMyW57Z24x7fbeppz8=;
 b=Rnlx23C8F3OeRLYf59q8/1FzwH87IVLj/E6GsrF4JTaXmxa3lPdH1N4e+iBXMxbjJa38as
 5BmeoiM2GSyz28PpzNcX8zox1ZiaMlwqAdnScBcjIEnz7eKVAM2vbOGNOl+mcLl7LjM7YG
 mvfKu1TkbmNJ/thySXoB7rmAzAs2gIo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-3GaXdFo-MQWr_pvaartnKg-1; Fri, 23 Sep 2022 07:35:39 -0400
X-MC-Unique: 3GaXdFo-MQWr_pvaartnKg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l15-20020a05600c4f0f00b003b4bec80edbso5419655wmq.9
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 04:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=GrpygFtsOGpgTLnHbyV+bzcqmrMyW57Z24x7fbeppz8=;
 b=59Df/RW0zfuC4T0U/I96Zhoe03C700k3PvWAWTgV8QsCct6mEorabofMwEWqO7me/k
 Vv6uyTEeoaBIga5oU8/g8PsKbBAayZ/55xud2+w04y0LGlx2g+rmNDBQgXKiyOh2kTX8
 KhsMFHHPYc8brdlskc9o05sjZnCIZlT0g/J6RXHKyuQSn34CmazDdFZ/0gKYvQRG+uUG
 ABrYvry1P0GA0Zja/7I1HqMAXmxwBJB1hiZf2T9yv7p2Ef/fnba1xJzXAVX0tNeVW44+
 isxWqpOdgztYS+VHNgMQ2m4aAAo/QhViorMbXOQygGOt1a3GHLZnXo3FC/wE3MvbGwA9
 eohg==
X-Gm-Message-State: ACrzQf2XFFHKYvpQ+yxE00ttqfppZ7J3AW91XZlYGBlqA0cHoCvaqomF
 DxFV2Y37GpyYOY7TedJn1JXI8bg2FhpM1T7O4YsJc4qorq4vngXbilVttM4WNBdiRGzq4lDrLbM
 vWhZ1IjHFj+nTsWs=
X-Received: by 2002:adf:dbc3:0:b0:22a:d393:bd84 with SMTP id
 e3-20020adfdbc3000000b0022ad393bd84mr4963237wrj.626.1663932938423; 
 Fri, 23 Sep 2022 04:35:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7KGGIhhGuA5Z64gegCfutBEw6cL3fGimOMQwcN6F+SEoz+4Ok8uXx3PZmZJMQBM63OwJcW1Q==
X-Received: by 2002:adf:dbc3:0:b0:22a:d393:bd84 with SMTP id
 e3-20020adfdbc3000000b0022ad393bd84mr4963223wrj.626.1663932938119; 
 Fri, 23 Sep 2022 04:35:38 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:cc00:4585:a83b:64f2:ad21?
 (p200300cbc704cc004585a83b64f2ad21.dip0.t-ipconnect.de.
 [2003:cb:c704:cc00:4585:a83b:64f2:ad21])
 by smtp.gmail.com with ESMTPSA id
 n32-20020a05600c502000b003a531c7aa66sm2378384wmr.1.2022.09.23.04.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 04:35:37 -0700 (PDT)
Message-ID: <bcd4e3c8-268d-139b-a1a6-0a2e11bd1986@redhat.com>
Date: Fri, 23 Sep 2022 13:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v8.1 1/2] target/s390x: support SHA-512 extensions
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220922153820.221811-1-david@redhat.com>
 <abf6fbb6-14f4-8c65-f5ac-a75b9c8931dd@redhat.com>
 <98dcb657-8862-5868-3979-55fc49864904@redhat.com>
 <e8041184-cfdd-d429-0377-db6b46d4d0ef@redhat.com>
 <6bf799d5-18a1-f01c-b227-a7dc98c2c8cf@redhat.com>
 <Yy16Mz7+yLCV5jH8@zx2c4.com>
 <e6fad3bc-66e9-faea-194c-30277c0aa90f@redhat.com>
 <CAHmME9r+s_kBb2vyWe5xqtMd6NCbe=O8sH2=T2r15ZFU=bcKvA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAHmME9r+s_kBb2vyWe5xqtMd6NCbe=O8sH2=T2r15ZFU=bcKvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.09.22 13:19, Jason A. Donenfeld wrote:
> On Fri, Sep 23, 2022 at 12:47 PM David Hildenbrand <david@redhat.com> wrote:
>> You must be fortunate if "one afternoon" is not a significant time
>> investment. For me it is a significant investment.
> 
> For me too, to say the least of the multiple afternoons I've spent on
> this patch set. Getting back to technical content:
> 
>> and sort out the remaining issues. I thought we (Thomas included) had an
>> agreement that that's the way we are going to do it. Apparently I was wrong.
>> Most probably I lived in the kernel space too long such that we don't
>> rush something upstream. For that reason *I* sent out a patch with
>> Here I am, getting told by Thomas that we now do it differently now.
>> What I really tried to express here is: if Thomas wants to commit things
>> differently now, maybe he can just separate the cleanup parts. I really
>> *don't want* to send out a multi-patch series to cleanup individual
>> parts -- that takes significantly more time. Especially not if something
>> is not committed yet.
> 
> To recap what's been fixed in your v8.1, versus what's been refactored
> out of style preference:
> 
> 1) It handles the machine versioning.
> 2) It throws an exception on length alignment in KIMD mode:
> +    /* KIMD: length has to be properly aligned. */
> +    if (type == S390_FEAT_TYPE_KIMD && !QEMU_IS_ALIGNED(len, 128)) {
> +        tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> +    }
> 3) It asserts if type is neither KIMD vs KLMD, with:
> +    g_assert(type == S390_FEAT_TYPE_KIMD || type == S390_FEAT_TYPE_KLMD);
> 

One important part is

4) No memory modifications before all inputs were read

-- 
Thanks,

David / dhildenb


