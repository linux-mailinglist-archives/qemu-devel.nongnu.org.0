Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C595E7471
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 08:57:17 +0200 (CEST)
Received: from localhost ([::1]:56942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obccd-0004N2-MB
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 02:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obcJy-0002MS-OP
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 02:37:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obcJv-0003Xw-Fs
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 02:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663915074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nI+LE14NrqgyXe1inSjtRev4+6ezkyPUB8DOJvEXhY=;
 b=Htt0dtFhWW0TTMBXAmcNeug6TFm/IbHX8tPHGVRlu8xm0Orpp1eTSHbv8ZsAuPaUS//MLB
 BgtdeIRT7EI5EaI14nW/cU653mQmrtgUfPLkEhjObusn0eO6K5UCCVObkWKaXWL/OuMvsL
 FzbsiZOX7faxtMtiQnXWvdMTasJrOmc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-qWbKXanRO1WQe4IKxmyF5g-1; Fri, 23 Sep 2022 02:37:53 -0400
X-MC-Unique: qWbKXanRO1WQe4IKxmyF5g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5-20020a05600c028500b003b4d2247d3eso3334044wmk.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 23:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=7nI+LE14NrqgyXe1inSjtRev4+6ezkyPUB8DOJvEXhY=;
 b=lHMnlt0VYjr+6LGHiYxbpBY5afBWpFjlZ4osqSrPIgorX4P7M0QiV/PHGmmKlZnkXC
 jrYfysg58yMSpLJQPYpdo4Po3EAW5UL3c8UTw835ND6X44fGryPQ6uVeKTGwTLPLE4DG
 T9h5xhpYbA01k9O8YI4y2olNeY7bJrDQopz0NwWGZyL9byD8z8Wtt7Kt7acBXHQCXiHl
 LTt6RbDYckoOsWytgN1qvbiye9tk0g5AbH2ZDXH+YZFmAJlgxaURj+4L3RT5TeO+NEOQ
 rIbDESmSNJiHUHTfj2Z8tSrtTd4zSVxBk7HH1P5Uon31E8hdH7mMax4KA85ARyCqdRsR
 JUsg==
X-Gm-Message-State: ACrzQf3+q9d0kL0KE9tZ1gDzT6pUTFWi3s/Y2JVwfFhh7b2ZNVifRvfe
 KIa76V+jPn5bJAvgyxmF1AyB4K8UzbHnbZDtOlCgbVmtvJprLdRyRxA1mVcj5mpsDxSOkv8i0f1
 PfA9Qdk7Bghuj2jc=
X-Received: by 2002:a05:600c:1f06:b0:3b4:86e8:bd21 with SMTP id
 bd6-20020a05600c1f0600b003b486e8bd21mr4815376wmb.7.1663915072139; 
 Thu, 22 Sep 2022 23:37:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6jiJ2GDNHyNRZFVNY6PZUr20GIA9lqEVPFtSMOrOwp56QHS2Mw/H3cx0pfAxHgJEVbsccU1g==
X-Received: by 2002:a05:600c:1f06:b0:3b4:86e8:bd21 with SMTP id
 bd6-20020a05600c1f0600b003b486e8bd21mr4815360wmb.7.1663915071815; 
 Thu, 22 Sep 2022 23:37:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:cc00:4585:a83b:64f2:ad21?
 (p200300cbc704cc004585a83b64f2ad21.dip0.t-ipconnect.de.
 [2003:cb:c704:cc00:4585:a83b:64f2:ad21])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adffb47000000b00226dfac0149sm6648942wrs.114.2022.09.22.23.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 23:37:51 -0700 (PDT)
Message-ID: <6bf799d5-18a1-f01c-b227-a7dc98c2c8cf@redhat.com>
Date: Fri, 23 Sep 2022 08:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v8.1 1/2] target/s390x: support SHA-512 extensions
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220922153820.221811-1-david@redhat.com>
 <abf6fbb6-14f4-8c65-f5ac-a75b9c8931dd@redhat.com>
 <98dcb657-8862-5868-3979-55fc49864904@redhat.com>
 <e8041184-cfdd-d429-0377-db6b46d4d0ef@redhat.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <e8041184-cfdd-d429-0377-db6b46d4d0ef@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 23.09.22 08:23, Thomas Huth wrote:
> On 22/09/2022 19.18, David Hildenbrand wrote:
>> On 22.09.22 17:55, Thomas Huth wrote:
>>> On 22/09/2022 17.38, David Hildenbrand wrote:
>>>> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
>>>>
>>>> In order to fully support MSA_EXT_5, we have to support the SHA-512
>>>> special instructions. So implement those.
>>>>
>>>> The implementation began as something TweetNacl-like, and then was
>>>> adjusted to be useful here. It's not very beautiful, but it is quite
>>>> short and compact, which is what we're going for.
>>> ...
>>>> @@ -52,6 +278,9 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1,
>>>> uint32_t r2, uint32_t r3,
>>>>                 cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
>>>>             }
>>>>             break;
>>>> +    case 3: /* CPACF_*_SHA_512 */
>>>> +        return cpacf_sha512(env, ra, env->regs[1], &env->regs[r2],
>>>> +                            &env->regs[r2 + 1], type);
>>>
>>> I have to say that I liked Jason's v8 better here. Code 3 is also used for
>>> other instructions with completely different meaning, e.g. PCKMO uses 3 for
>>> TDEA-192 ... so having the "type" check here made more sense.
>>> (meta comment: maybe we should split up the msa function and stop using just
>>> one function for all crypto/rng related instructions? ... but that's of
>>> course something for a different patch series)
>>
>> It kind-f made sense in v8 where we actually had different functions. We no
>> longer have that here.
> 
> But the point is that the "msa" helper is also called for other instructions
> like PCKMO which can also be called with code 3. And there it means
> something completely different. ... unless I completely misunderstood the
> code, of course.

test_be_bit() fences everything off we don't support. Simply falling 
through here and returning 0 at the end doesn't make any sense either.

> 
> I think I'll go with Jason's v8 (+ compat machine handling on top) for now,
> so that we better record his state of the patch, and then we can do cleanup
> patches on top later.

Feel free to commit what you want (I'll be happy to see Jason's work 
upstream for good), but note that

1) I don't feel confident to give the original patch my ack/rb
2) I am not a supporter of committing code that has known issues
3) I won't follow up with additional cleanup patches because I already 
spent more time on this than I originally planned.

-- 
Thanks,

David / dhildenb


