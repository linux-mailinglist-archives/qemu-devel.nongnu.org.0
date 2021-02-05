Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02111310CBC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:52:30 +0100 (CET)
Received: from localhost ([::1]:45256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82TF-0003IC-2R
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l82Q0-0008EO-B8
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:49:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l82Pu-0004U1-3N
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612536538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKjgt7Izfm47YlfWZTYmDBl39DhYUIGnf1Mho0r/0po=;
 b=J0ezOtJcbMi5s5WxxuElYrsaNOi3Ieu19O59L1Ydpzu3EWgVuxNnlK39DF3QE4ue16HGS8
 Z7Gcs67Et5IwuqwrIEnZiNeaxT9cH1BD7ZdHEafRkR3iN25IXCqnFEl8CBW3SzXvD1xuft
 e/50+WMVUQ9LZMArlLJQH0tX7sQPADk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-mp9wQsZ_MQqj_7w2Xn8e9A-1; Fri, 05 Feb 2021 09:48:54 -0500
X-MC-Unique: mp9wQsZ_MQqj_7w2Xn8e9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 401B9107ACED;
 Fri,  5 Feb 2021 14:48:43 +0000 (UTC)
Received: from [10.3.112.253] (ovpn-112-253.phx2.redhat.com [10.3.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D0B610016F4;
 Fri,  5 Feb 2021 14:48:42 +0000 (UTC)
Subject: Re: [PATCH] iotests: 30: drop from auto group (and effectively from
 make check)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210205111021.715240-1-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c3c5a481-08f7-ddee-492c-0b9e637a416a@redhat.com>
Date: Fri, 5 Feb 2021 08:48:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205111021.715240-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, cfontana@suse.de, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 5:10 AM, Vladimir Sementsov-Ogievskiy wrote:
> I reproduced the following crash fast enough:
> 
> 0  raise () at /lib64/libc.so.6
> 1  abort () at /lib64/libc.so.6
> 2  _nl_load_domain.cold () at /lib64/libc.so.6
> 3  annobin_assert.c_end () at /lib64/libc.so.6
> 4  bdrv_reopen_multiple (bs_queue=0x55de75fa9b70, errp=0x0)
>    at ../block.c:3820
> 5  bdrv_reopen_set_read_only (bs=0x55de760fc020, read_only=true,
>    errp=0x0) at ../block.c:3870
> 6  stream_clean (job=0x55de75fa9410) at ../block/stream.c:99

> Then I had 38 successful iterations and another crash:
> 0  bdrv_check_update_perm (bs=0x5631ac97bc50, q=0x0, new_used_perm=1,
>    new_shared_perm=31, ignore_children=0x0, errp=0x7ffd9d477cf8) at
>    ../block.c:2197
> 1  bdrv_root_attach_child
>     (child_bs=0x5631ac97bc50, child_name=0x5631aaf6b1f9 "backing",
>     child_class=0x5631ab280ca0 <child_of_bds>, child_role=8,
>     ctx=0x5631ab757300, perm=1, shared_perm=31, opaque=0x5631abb8c020,
>     errp=0x7ffd9d477cf8)
>     at ../block.c:2642
> 2  bdrv_attach_child (parent_bs=0x5631abb8c020,
>    child_bs=0x5631ac97bc50, child_name=0x5631aaf6b1f9 "backing",
>    child_class=0x5631ab280ca0 <child_of_bds>, child_role=8,
>    errp=0x7ffd9d477cf8)
>     at ../block.c:2719
> 3  bdrv_set_backing_hd (bs=0x5631abb8c020, backing_hd=0x5631ac97bc50,
>    errp=0x7ffd9d477cf8) at ../block.c:2854
> 4  stream_prepare (job=0x5631ac751eb0) at ../block/stream.c:74

So we definitely have a race that can show a wide variety of knock-on
effects.


> 
> and trying to reproduce it on top of
> "block: update graph permissions update" I had 634 successful
> iterations
> and then the following crash (which looks much better):

This part of the commit message is odd - if we check it in to git as
written, you're pointing to a future commit, while still stating that it
is not a perfect commit.  But maybe by the time that commit gets in
we'll have figured out this last crash and corrected it as well.
Sticking to just the first two logs is fine by me.


> 
> So it seems reasonable to drop test from auto group at least until we
> merge "block: update graph permissions update"
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Note: be free to shorten commit message if needed :)

Indeed.  But as to the patch itself, I agree, and may Peter wants to
apply it directly to master instead of waiting for it to come through on
of the block maintainers?

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


