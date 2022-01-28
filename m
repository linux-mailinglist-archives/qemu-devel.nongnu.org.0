Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62FD49F871
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 12:41:52 +0100 (CET)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDPdV-0007Cl-L8
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 06:41:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nDPb6-0006Ob-TF
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:39:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nDPb2-0001hf-VX
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643369955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQEc9AGGokHMKRhSWQoWm3IVqgmHIT/NPwi/Wy0BGzg=;
 b=F/Bx0MTY3nsp8kBOpUVOKFDCxjdavWf9WFHQ/vM1y3jsWvyoamHhSYvCjzN+4XftesgMmv
 iTNyartqYhj13Ipcatfi6Jp97uvmRbE16S24EFf2ZwWPLsrbYdtEqCv47C9ygOGu2uqwsD
 Mb+lvW/zmd4tH1/B2iXyreNeO980Gdw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-CCbMePLeOM-nqGjhZmDXhQ-1; Fri, 28 Jan 2022 06:39:14 -0500
X-MC-Unique: CCbMePLeOM-nqGjhZmDXhQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 o5-20020a50c905000000b00403bbdcef64so2448129edh.14
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 03:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EQEc9AGGokHMKRhSWQoWm3IVqgmHIT/NPwi/Wy0BGzg=;
 b=2PugXWAbG5jy77U5YnH/4wnJw0f91ZpbYevjRENbODsG/YEjr99ImuWr+WqvS+bsZ9
 wl+pP17oJiQALiJI78SP3Ym/VuphGSCZ9VbjffzwU/AmmiO6m+yWB8PcrBzVuZy65VV9
 DfxVqUI2+sk0O3/jDKjiovSfJup/O6X39iQr9/QGNpFJJgF/gcm4tSnLadim/WhWWvlw
 xMBBRdWq7huqwI8N9zMernxtoV2bDwTcJLgVpYmspoflBiUkk6iFlB5yBMQPNdUq3FON
 xwrVkpwWqo+78aGxIRFrnS7ykLMzI15j4Ut+8nnJQlZ9nf0dAuEJrMRcyFDBwnR2byZ2
 +ydg==
X-Gm-Message-State: AOAM5326GUPBAHG5tQplD7vtiPqgx1V5JWRkzkvsXdvK+X0D8pnNI9gn
 a/EHC1Iw6T7UlzZx/i9wcbcbtdhchZB4VwjpLW3GgondypjCOCkTERlV7ioc6G6dm9qVaVaSLXj
 ImTpEM0Ce27mOzas=
X-Received: by 2002:a17:907:608f:: with SMTP id
 ht15mr6542383ejc.484.1643369952700; 
 Fri, 28 Jan 2022 03:39:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkLsH+/+YfN4hB5x+3Mvs7ZPj9oHdHTLghZ6y/RlG7H+vGBgGOy58X/Xoe5X6JZCffarfPqQ==
X-Received: by 2002:a17:907:608f:: with SMTP id
 ht15mr6542367ejc.484.1643369952388; 
 Fri, 28 Jan 2022 03:39:12 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id bv2sm9806601ejb.154.2022.01.28.03.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 03:39:11 -0800 (PST)
Message-ID: <e07b998f-9a62-7587-0526-bf51eae54ed6@redhat.com>
Date: Fri, 28 Jan 2022 12:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Block alignment of qcow2 compress driver
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20220128110732.GA19514@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220128110732.GA19514@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, andrey.shinkevich@virtuozzo.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.01.22 12:07, Richard W.M. Jones wrote:
> The commands below set up a sparse RAM disk, with an allocated block
> at offset 32K and another one at offset 1M-32K.  Then it tries to copy
> this to a compressed qcow2 file using qemu-nbd + the qemu compress
> filter:
>
>    $ qemu-img create -f qcow2 output.qcow2 1M
>    $ qemu-nbd -t --image-opts driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=output.qcow2 & sleep 1
>    $ nbdkit -U - \
>             data '@32768 1*32768 @1015808 1*32768' \
>             --run 'nbdcopy $uri nbd://localhost -p'
>
> The nbdcopy command fails when zeroing the first 32K with:
>
>    nbd://localhost: nbd_aio_zero: request is unaligned: Invalid argument
>
> This is a bug in nbdcopy because it ignores the minimum block size
> being correctly declared by the compress filter:
>
>    $ nbdinfo nbd://localhost
>    protocol: newstyle-fixed without TLS
>    export="":
> 	export-size: 1048576 (1M)
> 	uri: nbd://localhost:10809/
> 	contexts:
>    ...
> 		block_size_minimum: 65536          <----
> 		block_size_preferred: 65536
> 		block_size_maximum: 33554432
>
> The compress filter sets the minimum block size to the the same as the
> qcow2 cluster size here:
>
>    https://gitlab.com/qemu-project/qemu/-/blob/cfe63e46be0a1f8a7fd2fd5547222f8344a43279/block/filter-compress.c#L117
>
> I patched qemu to force this to 4K:
>
> -    bs->bl.request_alignment = bdi.cluster_size;
> +    //bs->bl.request_alignment = bdi.cluster_size;
> +    bs->bl.request_alignment = 4096;
>
> and the copy above works, and the output file is compressed!
>
> So my question is, does the compress filter in qemu really need to
> declare the large minimum block size?  I'm not especially concerned
> about efficiency, I'd prefer it just worked, and changing nbdcopy to
> understand block sizes is painful.
>
> Is it already adjustable at run time?  (I tried using --image-opts
> like compress.request_alignment=4096 but it seems like the filter
> doesn't support anything I could think of, and I don't know how to
> list the supported options.)

I’m kind of amazed this works because the qcow2 driver rejects unaligned 
compressed writes[1].

And if I apply your diff, I can see that, too:
$ ./qemu-img create -f qcow2 test.qcow2 64M
Formatting 'test.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off 
compression_type=zlib size=67108864 lazy_refcounts=off refcount_bits=16

$ ./qemu-io -c 'write 0 32k' --image-opts \
driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=test.qcow2
write failed: Invalid argument

So I actually don’t know why it works for you.  OTOH, I don’t understand 
why the block size affects you over NBD, because I would have expected 
qemu to internally auto-align requests when they are not aligned (in 
bdrv_co_pwritev_part()).  Like, when I set the NBD block driver’s 
alignment to 512[2], the following still succeeds:

$ ./qemu-img create -f qcow2 test.qcow2 64M
Formatting 'test.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off 
compression_type=zlib size=67108864 lazy_refcounts=off refcount_bits=16

$ ./qemu-nbd --fork --image-opts \
driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=test.qcow2

$ ./qemu-io -c 'write 0 32k' -f raw nbd://localhost
wrote 32768/32768 bytes at offset 0
32 KiB, 1 ops; 00.00 sec (9.034 MiB/sec and 289.0960 ops/sec)


So I wonder why your diff works on your end, and I also wonder whether 
we couldn’t just have the NBD server expose some custom alignment 
(because qemu should auto-align all requests the NBD server generates 
anyway).

Hanna

[1] https://gitlab.com/qemu-project/qemu/-/blob/master/block/qcow2.c#L4662
[2] https://gitlab.com/qemu-project/qemu/-/blob/master/block/nbd.c#L1918


