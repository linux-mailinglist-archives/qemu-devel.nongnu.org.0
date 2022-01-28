Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AF749FAC2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 14:33:45 +0100 (CET)
Received: from localhost ([::1]:59860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDRNn-0004l1-T1
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 08:33:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nDQPK-00057a-Ph
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 07:31:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nDQPD-0001c1-4Y
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 07:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643373047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x9hNsREuXdswfpavQeXKImZDVQUFKtrrKj/4rgyk/Wg=;
 b=RUoXNb8jJuAnlg437kgfi1afHZBhNT6G5uVWVggFooTqLZTrdczYvJX2IjAIM3fsSXFN84
 fV+/8w9kmPyFMpsFRGzXuZwDxi0BYtifnMJUspC6wSJw2A7CJhCSZqQKA/dIPOoP6tygqi
 OQKFXJEdXI6n8ybaLVHlLUv5LL157Gw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-I0-6c72CPS-pgYqsMBkiEQ-1; Fri, 28 Jan 2022 07:30:46 -0500
X-MC-Unique: I0-6c72CPS-pgYqsMBkiEQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 i22-20020a0564020f1600b00407b56326a2so2974183eda.18
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 04:30:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x9hNsREuXdswfpavQeXKImZDVQUFKtrrKj/4rgyk/Wg=;
 b=qDLywY2omSD+DWjrU7Y/w4gIRwD3AlQyXfaN23FSRexkySJ/y2Nop8BA2ylgSZuDOz
 gS58Ivr09ycz+ka87LW+/DiHS6a/Nv/2flR84CBc0tmoD6gsIm5a1HnoVXM05nfWms/R
 LzIh4Sy1RJQ9du7nW3g+TEEY+tM8kdY1Dg8EyXKrYsqP96h0ofjjk1brV6AbYS7v703P
 /Z9NGtP7V3Wi5LhsTl5W+R7/sPeVxO7ZXkDlVtJj9OxVu50UcfQmSfVmicsdHkweOoab
 Fys95bq29YJyYRVcfVNMWJltYuyiglM5d5F2BzNG9rBQMS3b2j7QxXHjiWIZbMijPA8w
 hZ6w==
X-Gm-Message-State: AOAM532Q0FgZzBosCueJfgxW53yWRanfzWu8y4DVUcPj8TbfmAcAunJM
 tQcFr+AV6KrNpFqMutOHiDykdRVIXuEAm1KWY0tj70+J1XjO9uJAbRAmIEE55ePWPHT17NbKNvA
 npQU39WVRBkmiuew=
X-Received: by 2002:a05:6402:11c7:: with SMTP id
 j7mr8072167edw.124.1643373044552; 
 Fri, 28 Jan 2022 04:30:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEz4bGBydNtHW6J+n/slSOrRz/Lgqvg1XCRnW++17wox7zU1c7xoDASCBxPkJNtBqYFQ+Baw==
X-Received: by 2002:a05:6402:11c7:: with SMTP id
 j7mr8072141edw.124.1643373044218; 
 Fri, 28 Jan 2022 04:30:44 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id y23sm12858161edo.31.2022.01.28.04.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 04:30:43 -0800 (PST)
Message-ID: <54f3a548-ebea-9ed5-6387-5dda2bf92c4e@redhat.com>
Date: Fri, 28 Jan 2022 13:30:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Block alignment of qcow2 compress driver
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <20220128110732.GA19514@redhat.com>
 <e07b998f-9a62-7587-0526-bf51eae54ed6@redhat.com>
 <20220128114815.GQ1127@redhat.com>
 <26486e0e-adb5-aa3b-e70d-82ab21a0d2be@redhat.com>
 <20220128121803.GS1127@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220128121803.GS1127@redhat.com>
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
Cc: kwolf@redhat.com, andrey.shinkevich@virtuozzo.com, eblake@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.01.22 13:18, Richard W.M. Jones wrote:
> On Fri, Jan 28, 2022 at 12:57:47PM +0100, Hanna Reitz wrote:
>> On 28.01.22 12:48, Richard W.M. Jones wrote:
>>> On Fri, Jan 28, 2022 at 12:39:11PM +0100, Hanna Reitz wrote:
>>>> So I actually don’t know why it works for you.  OTOH, I don’t
>>>> understand why the block size affects you over NBD, because I would
>>>> have expected qemu to internally auto-align requests when they are
>>>> not aligned (in bdrv_co_pwritev_part()).
>>> I checked it again and my hack definitely fixes nbdcopy.  But maybe
>>> that's expected if qemu-nbd is auto-aligning requests?  (I'm only
>>> accessing the block layer through qemu-nbd, not with qemu-io)
>> It’s not just qemu-io, with your diff[3] I get the same EINVAL over
>> NBD, too:
>>
>> $ ./qemu-img create -f qcow2 test.qcow2 64M
>> Formatting 'test.qcow2', fmt=qcow2 cluster_size=65536
>> extended_l2=off compression_type=zlib size=67108864
>> lazy_refcounts=off refcount_bits=16
>>
>> $ ./qemu-nbd --fork --image-opts \
>> driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=test.qcow2
>>
>> $ ./qemu-io -c 'write 0 32k' -f raw nbd://localhost
>> write failed: Invalid argument
> Strange - is that error being generated by qemu's nbd client code?

It’s generated by qcow2, namely the exact place I pointed out (as [1]).  
I can see that when I put an fprintf there.

> Here's my test not involving qemu's client code:
>
> $ qemu-nbd --version
> qemu-nbd 6.2.0 (qemu-6.2.0-2.fc36)
>
> $ qemu-img create -f qcow2 output.qcow2 1M
> Formatting 'output.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 lazy_refcounts=off refcount_bits=16
>
> $ qemu-nbd --fork --image-opts driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=output.qcow2
>
> $ nbdsh -u nbd://localhost
> nbd> h.get_strict_mode()
> 31
> nbd> h.set_strict_mode(31 & ~nbd.STRICT_ALIGN)
> nbd> h.get_strict_mode()
> 15
> nbd> h.pwrite(b'1'*1024, 0)
> nbd> exit
>
> So an unaligned 1K write works (after disabling libnbd's client-side
> alignment checks).

It does work when having the NBD client side simply ignore the request 
alignment (my diff [4]), but it doesn’t work (for me) when only reducing 
the compress filter’s request alignment (my diff [3]).

>> I just changed that line of code [2], as shown in [4].  I suppose
>> the better thing to do would be to have an option for the NBD server
>> to force-change the announced request alignment, because it can
>> expect the qemu block layer code to auto-align requests through
>> RMW.  Doing it in the client is wrong, because the NBD server might
>> want to detect that the client sends unaligned requests and reject
>> them (though ours doesn’t, it just traces such events[5] – note that
>> it’s explicitly noted there that qemu will auto-align requests).
> I know I said I didn't care about performance (in this case), but is
> there in fact a penalty to sending unaligned requests to the qcow2
> layer?  Or perhaps it cannot compress them?

In qcow2, only the whole cluster can be compressed, so writing 
compressed data means having to write the whole cluster.  qcow2 could 
implement the padding by itself, but we decided to just leave the burden 
of only writing full clusters (with the COMPRESSED write flag) on the 
callers.

Things like qemu-img convert and blockdev-backup just adhere to that by 
design; and the compress driver makes sure to set its request alignment 
accordingly so that requests to it will always be aligned to the cluster 
size (either by its user, or by the qemu block layer which performs the 
padding automatically).

Hanna


