Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C27A52BB81
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:36:39 +0200 (CEST)
Received: from localhost ([::1]:54088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJqw-00059I-99
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nrJor-0003oO-3X
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:34:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nrJoo-0003AU-9D
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652880865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NczFVclBms9dm4Lvz+nf+kBMmjo6+U0xjcWjCPpI72A=;
 b=XFV2DYj3n+0zxCgiQN1RD2y1VQO3bK0MrNOehMTq1I4wc6Gjzb22oORbuq5Yu/r3zsPTvJ
 eGoiHqi4Y5fx/AXvhTrBomsg0A2kHmCEcnDP6tSIKLo9Hg5ym/JM7Ul/RU3sLZqrSCcX2d
 prL7HygG61/I6Tm/u8BvfBifGzRv4mw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-UeQ5I1L4OZ6PYi9VFIpYgw-1; Wed, 18 May 2022 09:34:24 -0400
X-MC-Unique: UeQ5I1L4OZ6PYi9VFIpYgw-1
Received: by mail-wm1-f72.google.com with SMTP id
 q128-20020a1c4386000000b003942fe15835so881161wma.6
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 06:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NczFVclBms9dm4Lvz+nf+kBMmjo6+U0xjcWjCPpI72A=;
 b=SkcCXdbpGWu66hXRzoO39SOHJOSEXCunUwRF0slkT8JXt1y1O9twU6ifWuApXy44GD
 byaPw+iKD7/YaNqMMt0KF+e7BEbablwWPe4rMCFJ8ibmgsSN+nxnlxjPPrKs0oGJXns7
 a1OrvWySQse6HeF1QbfWbOvllGMf4kwxUrov0pNA/WWS4h9TPHUowbmXLnnEldoQvL5p
 fi6NuSPAlXmcnCq8f6sxrLlo/MVzBe9SxHDsvRoLJIIBlN8ZwGJIoDcf1x1DxWhjTHJi
 ID0aW0o5e/DUxuYEMD8qNqud47L9RlGX5Nevhl5rw2Aig0zTH/hrX7xOZ7U/2tXUgu/d
 1y+Q==
X-Gm-Message-State: AOAM533FD36+KSjJt5mDohBhOxqp+ACP7XTfxoK0pBzUm8TY72At/zmo
 EOrWRODK0pBPP8t4e/KmlFfK6kUGGs3JtxYCYO0/NNH5hnFtdFZrZbYzIHJd/c42gp2z/t4/Af5
 k/08Hh/STXapZ69A=
X-Received: by 2002:a05:600c:a01:b0:395:c416:d82d with SMTP id
 z1-20020a05600c0a0100b00395c416d82dmr23055wmp.88.1652880862937; 
 Wed, 18 May 2022 06:34:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxM9MZ29LJXlr7hn9Bq1Ft6diGkfkZyXaMY3ActyZyHYYrB2Y5FjEbqFnlfLg9WEJSs8xg8HA==
X-Received: by 2002:a05:600c:a01:b0:395:c416:d82d with SMTP id
 z1-20020a05600c0a0100b00395c416d82dmr23028wmp.88.1652880862608; 
 Wed, 18 May 2022 06:34:22 -0700 (PDT)
Received: from [192.168.149.183]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 u1-20020adfcb01000000b0020cf41017b4sm2124493wrh.19.2022.05.18.06.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 06:34:21 -0700 (PDT)
Message-ID: <265a7c93-ed2a-6464-eeb4-c396970c418a@redhat.com>
Date: Wed, 18 May 2022 15:34:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 06/18] block: Implement blk_{pread, pwrite}() using
 generated_co_wrapper
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Alberto Faria <afaria@redhat.com>,
 qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-2-afaria@redhat.com>
 <0a27845b-0b9a-992a-3360-a7cf16892a08@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <0a27845b-0b9a-992a-3360-a7cf16892a08@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



Am 17/05/2022 um 16:22 schrieb Paolo Bonzini:
> On 5/17/22 13:38, Alberto Faria wrote:
>> We need to add include/sysemu/block-backend-io.h to the inputs of the
>> block-gen.c target defined in block/meson.build.
>>
>> Signed-off-by: Alberto Faria <afaria@redhat.com>
> 
> Emanuele is looking it cleaning this up, so you two need to coordinate.
> 
> Emanuele, can you separate/post the initial patches to clean up the
> includes of block/coroutines.h and block/block-gen.c?
> 
> Apart from that, fewer block/coroutines.h declarations is only good stuff.
> 

This is the main patch: it just moves headers from block/coroutines.h to
the script (block_gen.c).

This allows you to keep generated_co_wrapper functions in the header
where they originally were (no need to move the function in coroutines.h
and include it everywhere).

Btw @Alberto can you also cc me in the next series? So that I can follow
too.

Thank you,
Emanuele

From 84fcea52c09024adcfe24bb0d6d2ec6842c6826b Mon Sep 17 00:00:00 2001
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Date: Tue, 17 May 2022 13:35:54 -0400
Subject: [PATCH] block-coroutine-wrapper: remove includes from coroutines.h

These includes in coroutines.h are not needed. Instead, they can
be moved in block-gen.c since they are needed by the generated
functions.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/coroutines.h                 | 5 -----
 scripts/block-coroutine-wrapper.py | 3 +++
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index b293e943c8..45ecbfcc6a 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -25,11 +25,6 @@
 #ifndef BLOCK_COROUTINES_INT_H
 #define BLOCK_COROUTINES_INT_H

-#include "block/block_int.h"
-
-/* For blk_bs() in generated block/block-gen.c */
-#include "sysemu/block-backend.h"
-
 /*
  * I/O API functions. These functions are thread-safe.
  *
diff --git a/scripts/block-coroutine-wrapper.py
b/scripts/block-coroutine-wrapper.py
index 625b03e3ab..39fb1e8a4f 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -40,6 +40,9 @@ def gen_header():
  */

 #include "qemu/osdep.h"
+/* For blk_bs() in generated block/block-gen.c */
+#include "sysemu/block-backend.h"
+#include "block/block_int.h"
 #include "block/coroutines.h"
 #include "block/block-gen.h"
 #include "block/block_int.h"\
-- 
2.31.1

>> ---
>>   block/block-backend.c             | 23 -----------------------
>>   block/coroutines.h                |  4 ----
>>   block/meson.build                 |  1 +
>>   include/sysemu/block-backend-io.h | 10 ++++++----
>>   4 files changed, 7 insertions(+), 31 deletions(-)
>>
>> diff --git a/block/block-backend.c b/block/block-backend.c
>> index 5b9706c443..c2a4c44a99 100644
>> --- a/block/block-backend.c
>> +++ b/block/block-backend.c
>> @@ -1567,29 +1567,6 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend
>> *blk, int64_t offset,
>>                           flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
>>   }
>>   -int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes,
>> void *buf,
>> -              BdrvRequestFlags flags)
>> -{
>> -    int ret;
>> -    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
>> -    IO_OR_GS_CODE();
>> -
>> -    blk_inc_in_flight(blk);
>> -    ret = blk_do_preadv(blk, offset, bytes, &qiov, flags);
>> -    blk_dec_in_flight(blk);
>> -
>> -    return ret;
>> -}
>> -
>> -int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
>> -               const void *buf, BdrvRequestFlags flags)
>> -{
>> -    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
>> -    IO_OR_GS_CODE();
>> -
>> -    return blk_pwritev_part(blk, offset, bytes, &qiov, 0, flags);
>> -}
>> -
>>   int64_t blk_getlength(BlockBackend *blk)
>>   {
>>       IO_CODE();
>> diff --git a/block/coroutines.h b/block/coroutines.h
>> index 3f41238b33..443ef2f2e6 100644
>> --- a/block/coroutines.h
>> +++ b/block/coroutines.h
>> @@ -112,10 +112,6 @@ bdrv_common_block_status_above(BlockDriverState *bs,
>>   int generated_co_wrapper
>>   nbd_do_establish_connection(BlockDriverState *bs, bool blocking,
>> Error **errp);
>>   -int generated_co_wrapper
>> -blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
>> -              QEMUIOVector *qiov, BdrvRequestFlags flags);
>> -
>>   int generated_co_wrapper
>>   blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
>>                       QEMUIOVector *qiov, size_t qiov_offset,
>> diff --git a/block/meson.build b/block/meson.build
>> index 0b2a60c99b..60bc305597 100644
>> --- a/block/meson.build
>> +++ b/block/meson.build
>> @@ -136,6 +136,7 @@ block_gen_c = custom_target('block-gen.c',
>>                               input: files(
>>                                         '../include/block/block-io.h',
>>                                        
>> '../include/block/block-global-state.h',
>> +                                     
>> '../include/sysemu/block-backend-io.h',
>>                                         'coroutines.h'
>>                                         ),
>>                               command: [wrapper_py, '@OUTPUT@',
>> '@INPUT@'])
>> diff --git a/include/sysemu/block-backend-io.h
>> b/include/sysemu/block-backend-io.h
>> index 6440e92028..0804ce1c1d 100644
>> --- a/include/sysemu/block-backend-io.h
>> +++ b/include/sysemu/block-backend-io.h
>> @@ -102,10 +102,12 @@ int coroutine_fn blk_co_copy_range(BlockBackend
>> *blk_in, int64_t off_in,
>>    * the "I/O or GS" API.
>>    */
>>   -int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes,
>> void *buf,
>> -              BdrvRequestFlags flags);
>> -int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
>> -               const void *buf, BdrvRequestFlags flags);
>> +int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
>> +                                   int64_t bytes, void *buf,
>> +                                   BdrvRequestFlags flags);
>> +int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
>> +                                    int64_t bytes, const void *buf,
>> +                                    BdrvRequestFlags flags);
>>   int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
>>                                  int64_t bytes, QEMUIOVector *qiov,
>>                                  BdrvRequestFlags flags);
> 


