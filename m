Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CAD49FAA4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 14:24:46 +0100 (CET)
Received: from localhost ([::1]:53538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDRF6-0008Is-NG
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 08:24:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nDPt4-0007GW-1u
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:57:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nDPt2-0004Ni-Ar
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643371071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mlvcka8n2XC7j2SPAMt4S3rusEbhhT9y7OJbCfiW4z4=;
 b=QuUi0hyi72nPPzD48QHws+XVGuhbprVh0W5n804bSaOLPaDzFdy0qW2at1t0XZow/ieeUO
 ChT4IJOqTTG4Ux0GHHGPbEyIPyEY8zqyx1rF0jLV3pRHJjvMhQqMRO8aPgN3MAYD/ONK5G
 t3emZFIesKbioZUy1oZYHgkgaH0v3Xs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-ELpj44g2Omah7c_ilrRSVg-1; Fri, 28 Jan 2022 06:57:49 -0500
X-MC-Unique: ELpj44g2Omah7c_ilrRSVg-1
Received: by mail-ej1-f69.google.com with SMTP id
 r18-20020a17090609d200b006a6e943d09eso2756005eje.20
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 03:57:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Mlvcka8n2XC7j2SPAMt4S3rusEbhhT9y7OJbCfiW4z4=;
 b=5Tr6QX1menrK0UE9MGf13beHwr9bGVNz+WgyM2JY8CC3a21LnXW3FovkhvsP0+G1KG
 75Vq03cWHbgRD20ptRu7DsZJsnsmfaF6k8Vh71cMCh9+ICdBnQLJlpKAJGtElaL3A1mj
 H1BleeZBp0WEVd5rZ9XE5DGG7sGnUCr9bLRcywptJQohUvLbI31WPMluUsgMHPNPPpLp
 dbTg5o4qxyY9+I9A/GA5yrmP0yTkTnxZ+pjtUSv6rZVJVw52RxrNbienzZdQgSEo2fXM
 KdgJNjODUwhYUi9kz6YWHLn3OnEACbpK/K3E36P9fbTHDmYjiG+9ruGJgzXwd2RF69Nj
 cClw==
X-Gm-Message-State: AOAM530DVoV5n0jfdtRE+eb7Jj3mnbdHOeOaQd5K/NTd57ZUCFAUE5Rj
 tpy2EBYsiordictTAyI/jvaeaO5/hecV2bw3zYrhOrWkcGgkQ9EA12CzC0v9XQNGyGtOiiMyrWs
 QqZ8qCJ8OUNcYHP0=
X-Received: by 2002:a17:907:3da1:: with SMTP id
 he33mr6397117ejc.603.1643371068199; 
 Fri, 28 Jan 2022 03:57:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8QGlKCjktOFMQsphP3N/x4Dqci0aBFjmLv6KGiuUTIHLx1HWEgKt+438EFVTQO5AN73ZgoQ==
X-Received: by 2002:a17:907:3da1:: with SMTP id
 he33mr6397105ejc.603.1643371067980; 
 Fri, 28 Jan 2022 03:57:47 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id b30sm12979298edn.16.2022.01.28.03.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 03:57:47 -0800 (PST)
Message-ID: <26486e0e-adb5-aa3b-e70d-82ab21a0d2be@redhat.com>
Date: Fri, 28 Jan 2022 12:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Block alignment of qcow2 compress driver
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <20220128110732.GA19514@redhat.com>
 <e07b998f-9a62-7587-0526-bf51eae54ed6@redhat.com>
 <20220128114815.GQ1127@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220128114815.GQ1127@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, andrey.shinkevich@virtuozzo.com, eblake@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.01.22 12:48, Richard W.M. Jones wrote:
> On Fri, Jan 28, 2022 at 12:39:11PM +0100, Hanna Reitz wrote:
>> So I actually don’t know why it works for you.  OTOH, I don’t
>> understand why the block size affects you over NBD, because I would
>> have expected qemu to internally auto-align requests when they are
>> not aligned (in bdrv_co_pwritev_part()).
> I checked it again and my hack definitely fixes nbdcopy.  But maybe
> that's expected if qemu-nbd is auto-aligning requests?  (I'm only
> accessing the block layer through qemu-nbd, not with qemu-io)

It’s not just qemu-io, with your diff[3] I get the same EINVAL over NBD, 
too:

$ ./qemu-img create -f qcow2 test.qcow2 64M
Formatting 'test.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off 
compression_type=zlib size=67108864 lazy_refcounts=off refcount_bits=16

$ ./qemu-nbd --fork --image-opts \
driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=test.qcow2

$ ./qemu-io -c 'write 0 32k' -f raw nbd://localhost
write failed: Invalid argument

>> Like, when I set the NBD
>> block driver’s alignment to 512[2], the following still succeeds:
> Did you just patch that line in the code or is there a qemu-nbd
> option/image-opts to do this?

I just changed that line of code [2], as shown in [4].  I suppose the 
better thing to do would be to have an option for the NBD server to 
force-change the announced request alignment, because it can expect the 
qemu block layer code to auto-align requests through RMW.  Doing it in 
the client is wrong, because the NBD server might want to detect that 
the client sends unaligned requests and reject them (though ours 
doesn’t, it just traces such events[5] – note that it’s explicitly noted 
there that qemu will auto-align requests).

Hanna

> Rich.
>
>> [1] https://gitlab.com/qemu-project/qemu/-/blob/master/block/qcow2.c#L4662
>> [2] https://gitlab.com/qemu-project/qemu/-/blob/master/block/nbd.c#L1918

[3]
diff --git a/block/filter-compress.c b/block/filter-compress.c
index d5be538619..5a11d77231 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -114,7 +114,7 @@ static void compress_refresh_limits(BlockDriverState 
*bs, Error **errp)
          return;
      }

-    bs->bl.request_alignment = bdi.cluster_size;
+    bs->bl.request_alignment = 4096;
  }

[4]
diff --git a/block/nbd.c b/block/nbd.c
index 63dbfa807d..8608055800 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1915,7 +1915,7 @@ static void nbd_refresh_limits(BlockDriverState 
*bs, Error **errp)
                 s->info.base_allocation) ? 1 : BDRV_SECTOR_SIZE;
      }

-    bs->bl.request_alignment = min;
+    bs->bl.request_alignment = 512;
      bs->bl.max_pdiscard = QEMU_ALIGN_DOWN(INT_MAX, min);
      bs->bl.max_pwrite_zeroes = max;
      bs->bl.max_transfer = max;

[5] https://gitlab.com/qemu-project/qemu/-/blob/master/nbd/server.c#L2355


