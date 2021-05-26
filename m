Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236FF391B00
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:01:03 +0200 (CEST)
Received: from localhost ([::1]:50990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llv1n-0003gb-Q9
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lluzf-0002hl-2N
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:58:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lluzd-0001A1-8r
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622041124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2imiH7IfwC0mHvjyNJK2e6idBoBUNxJ3pcNxR9dmlw=;
 b=SzYA76aPhTxAG1cqfMAs84wJPihvoV0M6ZI77MYNAeDRN3MJiDs7+YZQUWV5SN0psamwhk
 NZxOco/VvJHATH/O66yPoB1M6lpDpP0g+ivjODgrcNy3m+5l3HoEwFrmdQdwIJNRmox/+D
 /TpEt7U7ooH0Hc2mEgzFhoW+LH8mbSU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-LCWjbrYDPvGbMSYdiYez4A-1; Wed, 26 May 2021 10:58:43 -0400
X-MC-Unique: LCWjbrYDPvGbMSYdiYez4A-1
Received: by mail-ed1-f71.google.com with SMTP id
 q7-20020aa7cc070000b029038f59dab1c5so721157edt.23
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 07:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v2imiH7IfwC0mHvjyNJK2e6idBoBUNxJ3pcNxR9dmlw=;
 b=cRvL79GjTFxVHGTrYxjPtyoWYVeFB33p4EaDVlU8zAeGWobcUFzYHwN3sRg1SdDEox
 saUG2SovIkFS0mKMySpng/8hE4oj1UM0HF1II8JabajTuZy+IZBuFHjlxM/KZQiU8MYI
 XKUhopOFprT0f4SGJ1hkq2vmKogxJ2H/G3DGPjssLeTKwSdaZ0X/YuNe+1OoEZsZS3Nl
 JQG9Sc8Pcw0/YGq0jpzLt8uSNBAvh79EH7la6pI7Rmal9KZMcmrHE2cNKrsfplaWr2nf
 68liKu5MIgZS6fLayY3AhAYQp/qMfFFg7mtmeDt40UU6eYqacaY+CH8XOdMvvBnhJ18n
 G/xw==
X-Gm-Message-State: AOAM533Ma3nEqXpcuoYpDwqXcBfKZ4Hm4ggZi2yLIHlPJmzEjeYDttl4
 Rjih0RPL1C/pMgYUPaxq6ywVUh6i0WnORIPHdhSHWtG1Y10OLfEKF+51Q8nSVG3QTipgmTAm2f1
 RgvMxddDOYdGINaBDSkNkmmKXbhiBSRDJY25MhtuqFZ+QYoI3gHyP6mkasY6uVW2go7w=
X-Received: by 2002:a05:6402:2044:: with SMTP id
 bc4mr39294274edb.282.1622041121417; 
 Wed, 26 May 2021 07:58:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6eGoZW1XANTezQU+tK1XpY2WLw86Rzv3ls8ogVpUICG8tJush+TgL08r5G+AnzwS2D/gVqA==
X-Received: by 2002:a05:6402:2044:: with SMTP id
 bc4mr39294250edb.282.1622041121225; 
 Wed, 26 May 2021 07:58:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm12748768eds.68.2021.05.26.07.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 07:58:40 -0700 (PDT)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-5-eesposit@redhat.com>
 <a3626fa3-359f-c746-74ac-b1b942ae56b0@virtuozzo.com>
 <26cc90a9-756d-902e-3559-81cc01439e24@redhat.com>
 <fae5f204-ceb7-722c-ab02-4a1671c52624@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 4/7] block-copy: add a CoMutex to the BlockCopyTask list
Message-ID: <2a60c691-12c1-fb53-ae47-0e56ca8a0ad1@redhat.com>
Date: Wed, 26 May 2021 16:58:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fae5f204-ceb7-722c-ab02-4a1671c52624@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/05/21 12:25, Vladimir Sementsov-Ogievskiy wrote:
>>> Next, even if we take bitmaps lock in 
>>> bdrv_dirty_bitmap_next_dirty_area() or around it, it doesn't bring 
>>> thread-safety to block_copy_task_create():
>>
>> The simplest solution here seems to protect 
>> bdrv_dirty_bitmap_next_dirty_area and also bdrv_reset_dirty_bitmap 
>> with the tasks lock, so that once it is released the bitmap is updated 
>> accordingly and from my understanding no other task can get that region.
> 
> Yes, we just need to protect larger areas by outer lock, to protect the 
> logic, not only structures itself.

Locks protects data, not code; code must ensure invariants are respected 
at the end of critical sections.  Here we have both problems:

- it's protecting too little data (the bitmap is not protected).  This 
is a block/dirty-bitmap.c bug.

- it's not respecting the invariant that tasks always reflected a 
superset of what is set in the dirty bitmap.  This is solved by making 
the critical section larger.

Paolo


