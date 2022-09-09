Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295BF5B3155
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 10:08:50 +0200 (CEST)
Received: from localhost ([::1]:43820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWZ4C-0006ES-FT
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 04:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWYwf-0001mo-Dr
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:01:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWYwY-0001u3-Md
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:00:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662710453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8kXJThmh8lkcaH4ThL00dxXWXZVVggKVVWOSvSbJzBo=;
 b=D6OjEPFb2b/zEAbcXTFvR2i/EjI8fnQncIErweJ/LM/hfFU0M9FGjqXJ/N0wyzHcl/qlzY
 /teed5LAzuRxdGLjARaxLVOXgTzp8Gbaeknf5lB2o7dWXVXGfbYkgrgx0JlQ2Qn4F8gxTq
 kF13tZYjYAPMhZ3dg9UbyUU66YLQa+Q=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-DFJzcwXoMDqmJsLqtBjYGw-1; Fri, 09 Sep 2022 04:00:51 -0400
X-MC-Unique: DFJzcwXoMDqmJsLqtBjYGw-1
Received: by mail-qv1-f70.google.com with SMTP id
 f9-20020ad442c9000000b004ac7f4fde18so662407qvr.14
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 01:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=8kXJThmh8lkcaH4ThL00dxXWXZVVggKVVWOSvSbJzBo=;
 b=ANzpiruAu/vV9UPGNCM33us5Dzvb2ZcCxvPWDer4n4lYlA6u6bq1JXd55/8QW1CXtT
 L/cR2UI57lUu1X0sQswVrac/wlYrSe9psn1rYt5PRemgP3M6Vpo4iy2+SckWkf8CGYTI
 RLlnbSv78wRDFHsJNg9ncsDFFdncSHtdDZTu+PLGg75aBaV7vzWByjFddK1BKYhs39nQ
 SdIkKPhYcStnYT0Vu1ShScNkiWace+Ux16MRsZnnNm1C1gvtBB61WEC7wzXl9Kf1pUND
 p0o9Qkat26XxBo508we8OllxQzp7w/LXarXp9Ly/q6c+5LllyH1WfKmzakcVcgBtIQaL
 54rQ==
X-Gm-Message-State: ACgBeo0B2pwLX2cGEcL96mfo/R1SU61CqIsm6A0KHFY64iQvvFJkjxKk
 DEz6kjZyTFx0KUX+62lfxgFp2XV071IHtuaQVF94MXIBlFXVmTiZ7FfByDFKN4df4E+wDfRKzlt
 hV9q7rVibV3jvWhE=
X-Received: by 2002:a05:622a:514:b0:343:555a:d611 with SMTP id
 l20-20020a05622a051400b00343555ad611mr11485361qtx.486.1662710451458; 
 Fri, 09 Sep 2022 01:00:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4O0+imJPdLBl9OFqfUKw+tM+5xAjMMdde5YWfyIvufRFOF06816S9HfGsSU69t3u7liyHV7Q==
X-Received: by 2002:a05:622a:514:b0:343:555a:d611 with SMTP id
 l20-20020a05622a051400b00343555ad611mr11485338qtx.486.1662710451195; 
 Fri, 09 Sep 2022 01:00:51 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 bs44-20020a05620a472c00b006b5f06186aesm864617qkb.65.2022.09.09.01.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 01:00:50 -0700 (PDT)
Message-ID: <1c6d0b99-737e-c485-952e-6e21015de455@redhat.com>
Date: Fri, 9 Sep 2022 10:00:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 2/2] kvm/kvm-all.c: listener should delay kvm_vm_ioctl
 to the commit phase
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-3-eesposit@redhat.com> <Yv6baJoNikyuZ38R@xz-m1.local>
 <CAJ6HWG6maoPjbP8T5qo=iXCbNeHu4dq3wHLKtRLahYKuJmMY-g@mail.gmail.com>
 <YwOOcC72KKABKgU+@xz-m1.local>
 <d4601180-4c95-a952-2b40-d40fa8e55005@redhat.com>
 <YwqFfyZ1fMA9knnK@xz-m1.local>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YwqFfyZ1fMA9knnK@xz-m1.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Peter,

Apologies for the delay to answer you.

[...]
>>
>> - Doing the above is still not enough, as KVM figures what operation to
>> do depending on the current state of the memslots.
>> Assuming we already have an already existing MR y, and now we get the
>> list DELETE(y) CREATE(y/2) (ie reducing y to half its size).
>> In this case the interval tree can't do anything, but it's very hard to
>> understand that the second request in the list is a CREATE, because when
>> KVM performs the check to understand which type of operation it is
>> (before doing any modification at all in the memslot list), it finds
>> that y (memslot with same id) exist, but has a different size than what
>> provided from userspace, therefore it could either fail, or misinterpret
>> it as another operation (currently fails -EINVALID).
> 
> Another good question..  I think that can be partly solved by not allowing
> ID duplication in the same batched ioctl, or maybe we can fail it.  From
> qemu perspective, we may need to change the memslot id allocation to not
> reuse IDs of being-deleted memslots until the batch is processed.
> 
> Something like adding similar INVALID tags to kvm memslots in QEMU when we
> are preparing the batch, then we should only reset memory_size==0 and clear
> INVALID tag after the ioctl returns.  Then during the batch, any new slots
> to be added from kvm_get_free_slot() will not return any duplication of a
> deleting one.

First of all, you're right. No interval tree is needed.

I think the approach I am currently using is something like what you
described above: when a DELETE operation is created in QEMU (there is no
MOVE), I set the invalid_slot flag to 1.
Then KVM will firstly process the requests with invalid_slot == 1, mark
the memslot invalid, and then process all the others (invalid included,
as they need the actual DELETE/MOVE operation).

> 
>> If we instead already provide the labels, then we can:
>> 	1. substitute the memslots pointed by DELETE/MOVE with invalid & swap
>> (so it is visible, non-atomic. But we don't care, as we are not deleting
>> anything)
>> 	2. delete the invalid memslot (in the inactive memslot list)
>> 	3. process the other requests (in the inactive memslot list)
>> 	4. single and atomic swap (step 2 and 3 are now visible).
>>
>> What do you think?
> 
> Adding some limitation to the new ioctl makes sense to me, especially
> moving the DELETE/MOVE to be handled earlier, rather than a complete
> mixture of all of them.
> 
> I'm wondering whether the batch ioctl can be layed out separately on the
> operations, then it can be clearly documented on the sequence of handling
> each op:
> 
>   struct kvm_userspace_memory_region_batch {
>          struct kvm_userspace_memory_region deletes[];
>          struct kvm_userspace_memory_region moves[];
>          struct kvm_userspace_memory_region creates[];
>          struct kvm_userspace_memory_region flags_only[];
>   };
> 
> So that the ordering can be very obvious.  But I didn't really think deeper
> than that.

No, I think it doesn't work. Oder needs to be preserved, I see many
DELETE+CREATE operations on the same slot id.
> 
> Side note: do we use MOVE at all in QEMU?

Nope :)

> 
>>
>> Bonus question: with this atomic operation, do we really need the
>> invalid memslot logic for MOVE/DELETE?
> 
> I think so.  Not an expert on that, but iiuc that's to make sure we'll zap
> all shadow paging that maps to the slots being deleted/moved.
> 
> Paolo can always help to keep me honest above.

Yes, we need to keep that logic.

v2 is coming soon.

Thank you,
Emanuele


