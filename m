Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC6402969
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:10:14 +0200 (CEST)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNard-0004Vn-Hs
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaWe-0003PD-9m
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:48:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaWb-0008Hs-QD
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631018907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p/VtJlnAsJmXJxoMtrYLVlZ0caDN4ejZKCz/mskqSBM=;
 b=OrmqFGA1x8f0vw/Y+hN0oVMwC+ZXuOU2ZkVHTpfplKNVuOIvkKkqJvLbbb8JQF7RrsXtYP
 Md3LWQ4YckysGi1LxGI2pApm2hCk3fzJybTFEQMf79murFfVZUVmeAqcwiJ8F/PRuBzM7E
 LBajwQkYzN8UTKuYNbYNjXx5NGvw15o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-iE76SIPzOT6svzhRIsDfQQ-1; Tue, 07 Sep 2021 08:48:25 -0400
X-MC-Unique: iE76SIPzOT6svzhRIsDfQQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 p29-20020a1c545d000000b002f88d28e1f1so3350174wmi.7
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 05:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=p/VtJlnAsJmXJxoMtrYLVlZ0caDN4ejZKCz/mskqSBM=;
 b=fiF7lxtmERLbOxUcnIbCz7p7iTCDJSY6hsy6e2jiaLDyG/64ZBFKCEMSGY4IGAGbCe
 n/XEDhryQ62+asu/+n6cLXp5IlJ9p3thTlTbqMCyw0gks+53w3x5pmjEkJkFJuhYTIjv
 NLYrr6FkH+yVx4kB6lniOGuZG7/pTrLvG+iztpTwWWY7KaubzE2FEKfRbqRCCwuhLIJf
 P9k9zDvUOWFvMxOUm0vuNLdTQTbWuimgyh8lDknrpXKXIsTOear5rw23J9ENHcSgCe+t
 T154ZNfhMomBh51kJkb5B3zId+9Id7F9D38/ZELplIwtj5PMCe2OOHK9uZ48+ZuagTdE
 lGtg==
X-Gm-Message-State: AOAM531wWKo/5LYtmjZf2BnM1R3kFABndTtCI2Wlxnk8j8IAkAmOCTGq
 EcG3ImTbbS/cbeCFQ9ZrE8oUMDtwfYfHvKfG6Y7OY3WANgxiCVT1srq54K5CjBhqPto1Q8y1DSR
 0rlzwleZMyjqUmfbsxJn59sS1bwnBODeX0ATvTJYsKwQx+HRAkHrosG2c/3RPtFun
X-Received: by 2002:adf:9f4b:: with SMTP id f11mr18975842wrg.337.1631018903734; 
 Tue, 07 Sep 2021 05:48:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqgkFE6mXP5PhnEk5lnCj2V7mTvhJSo0XijEA/Zj9Fz0dR5p1RdudJah58nnhqHVDJ7GKnsQ==
X-Received: by 2002:adf:9f4b:: with SMTP id f11mr18975807wrg.337.1631018903350; 
 Tue, 07 Sep 2021 05:48:23 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id g1sm73289wmh.21.2021.09.07.05.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 05:48:23 -0700 (PDT)
Subject: Re: [PATCH] qemu-img: Allow target be aligned to sector size
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210819101200.64235-1-hreitz@redhat.com>
 <9cf39acf-38fd-3d2d-1750-439c630f0df5@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <a577496c-8143-4f78-8537-7633c3018016@redhat.com>
Date: Tue, 7 Sep 2021 14:48:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9cf39acf-38fd-3d2d-1750-439c630f0df5@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.09.21 13:29, Vladimir Sementsov-Ogievskiy wrote:
> 19.08.2021 13:12, Hanna Reitz wrote:
>> We cannot write to images opened with O_DIRECT unless we allow them to
>> be resized so they are aligned to the sector size: Since 9c60a5d1978,
>> bdrv_node_refresh_perm() ensures that for nodes whose length is not
>> aligned to the request alignment and where someone has taken a WRITE
>> permission, the RESIZE permission is taken, too).
>>
>> Let qemu-img convert pass the BDRV_O_RESIZE flag (which causes
>> blk_new_open() to take the RESIZE permission) when using cache=none for
>> the target, so that when writing to it, it can be aligned to the target
>> sector size.
>>
>> Without this patch, an error is returned:
>>
>> $ qemu-img convert -f raw -O raw -t none foo.img /mnt/tmp/foo.img
>> qemu-img: Could not open '/mnt/tmp/foo.img': Cannot get 'write'
>> permission without 'resize': Image size is not a multiple of request
>> alignment
>>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1994266
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>> As I have written in the BZ linked above, I am not sure what behavior we
>> want.  It can be argued that the current behavior is perfectly OK
>> because we want the target to have the same size as the source, so if
>> this cannot be done, we should just print the above error (which I think
>> explains the problem well enough that users can figure out they need to
>> resize the source image).
>>
>> OTOH, it is difficult for me to imagine a case where the user would
>> prefer the above error to just having qemu-img align the target image's
>> length.
>> ---
>>   qemu-img.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/qemu-img.c b/qemu-img.c
>> index 908fd0cce5..d4b29bf73e 100644
>> --- a/qemu-img.c
>> +++ b/qemu-img.c
>> @@ -2628,6 +2628,14 @@ static int img_convert(int argc, char **argv)
>>           goto out;
>>       }
>>   +    if (flags & BDRV_O_NOCACHE) {
>> +        /*
>> +         * If we open the target with O_DIRECT, it may be necessary to
>> +         * extend its size to align to the physical sector size.
>> +         */
>> +        flags |= BDRV_O_RESIZE;
>> +    }
>> +
>>       if (skip_create) {
>>           s.target = img_open(tgt_image_opts, out_filename, out_fmt,
>>                               flags, writethrough, s.quiet, false);
>>
>
> Hmm. Strange. I am experimenting now with master branch without that 
> patch and can't reproduce:
>
> [root@kvm master]# dd if=/dev/zero of=a bs=1M count=2
> 2+0 records in
> 2+0 records out
> 2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.00153639 s, 1.4 GB/s
> [root@kvm master]# dd if=/dev/zero of=b bs=1M count=1
> 1+0 records in
> 1+0 records out
> 1048576 bytes (1.0 MB, 1.0 MiB) copied, 0.000939314 s, 1.1 GB/s
> [root@kvm master]# ls -lthr a b
> -rw-r--r--. 1 root root 2.0M Sep  7 14:28 a
> -rw-r--r--. 1 root root 1.0M Sep  7 14:28 b
> [root@kvm master]# ./build/qemu-img convert -f raw -O raw -t none a b
> [root@kvm master]# ls -lthr a b
> -rw-r--r--. 1 root root 2.0M Sep  7 14:28 a
> -rw-r--r--. 1 root root 2.0M Sep  7 14:28 b
> [root@kvm master]# dd if=/dev/zero of=b bs=1 count=2097147
> 2097147+0 records in
> 2097147+0 records out
> 2097147 bytes (2.1 MB, 2.0 MiB) copied, 2.76548 s, 758 kB/s
> [root@kvm master]# ls -ltr a b
> -rw-r--r--. 1 root root 2097152 Sep  7 14:28 a
> -rw-r--r--. 1 root root 2097147 Sep  7 14:29 b
> [root@kvm master]# ./build/qemu-img convert -f raw -O raw -t none a b
> [root@kvm master]# ls -ltr a b
> -rw-r--r--. 1 root root 2097152 Sep  7 14:28 a
> -rw-r--r--. 1 root root 2097152 Sep  7 14:29 b
>
> It just works, and do resize target without any additional 
> BDRV_O_RESIZE...

bdrv_getlength() invokes bdrv_nb_sectors(), so we always align sizes to 
512 anyway.  On volumes with a logical sector size of 512, this error 
cannot be reproduced.

You can use loop devices to get volumes with other sector sizes, like so:

$ cd /tmp
$ truncate fs.img -s 128M
$ sudo losetup -f --show --sector-size 4096 fs.img
/dev/loop0
$ sudo mkfs.ext4 /dev/loop0
mke2fs 1.46.4 (18-Aug-2021)
Discarding device blocks: done
Creating filesystem with 32768 4k blocks and 32768 inodes

Allocating group tables: done
Writing inode tables: done
Creating journal (4096 blocks): done
Writing superblocks and filesystem accounting information: done

$ sudo mount /dev/loop0 /mnt/tmp
$ qemu-img create -f raw source.img $((2 * 1048576 + 512))
Formatting 'source.img', fmt=raw size=2097664
$ sudo qemu-img convert -f raw -O raw -t none source.img /mnt/tmp/target.img
qemu-img: Could not open '/mnt/tmp/target.img': Cannot get 'write' 
permission without 'resize': Image size is not a multiple of request 
alignment


