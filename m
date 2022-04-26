Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1DF50EF6F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 05:59:09 +0200 (CEST)
Received: from localhost ([::1]:33978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njCM0-0001PO-33
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 23:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1njCKh-0000WO-E9; Mon, 25 Apr 2022 23:57:47 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1njCKf-0000G0-6J; Mon, 25 Apr 2022 23:57:47 -0400
Received: by mail-pf1-x430.google.com with SMTP id z16so16771064pfh.3;
 Mon, 25 Apr 2022 20:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OpOE/h/hR9CW9GZv2fZjKkLwZWLwvnHbtm0Z7QGaw5A=;
 b=Dk0nXxl/FKrxnG2A+2SZ59XSd2Xcv0MANY7zbuBZZ+I5duNNC/Mc7FiXFc8hCVTM60
 lp7xCj0ucpY0Ixq/JAx3DEIPBPWn+rRocCACRSQgbNedchHF8huU3wvYpFdqo55wnJLR
 P9QPzrSFhcdT9apwn0o0ow8lWqestVXF8kyc3HGJ7lwOwzXJ1M880Mrnv5H5Hl4KB5az
 tqI8N0gBypS3mtPOrHg29/gr43fWE2exLnImG7Lbju39P7g7DSRjd9A+JryBv7BAh6zs
 XLc0iWT6wHI1bP1qRa1EKNHFH0UfJVH0Zm/0MRa08vkZ9fSuyRi6tdj4mCRkxdLw8eoo
 CaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OpOE/h/hR9CW9GZv2fZjKkLwZWLwvnHbtm0Z7QGaw5A=;
 b=luJlTR2E9I3E+nyE90P8L0MWR9YtXXYJ7N9OIFi+AU9KxtT2+ozl4dMb3vn3wVQR43
 lYNmpZjJXSJsIXRrQ0K+FI+cNBgHy90mg8eLApJn73YLZHdKY8kM1GWLk8A8QKxxAbL6
 X5IEXTzl20//eNUrj2NN1byOy0jcxtRdCwkYrA/AsLWaVJtZzvhfYQg0kInlfz81kZy4
 Krxb8ZJRdhkk9neHh+jp3Ba95JrH+WyZiJF1z+xc5ELTzu8UgfTelYnJq1U2KNH7B0pz
 dEQrRdZbQjRLSVrAdP1S2SLOI5sQLVxvx36atd4VN3W6ueCoYkZaHHi/RT40suLOHvDV
 ojPA==
X-Gm-Message-State: AOAM533TD4M4a4+/V2IF1w2+EvJoYF+DJXq9rFbtyCzqy2wCjYP+2Cpp
 yiBINPwULMXeSLC9IPoxIyY=
X-Google-Smtp-Source: ABdhPJw0rd4HJbUHU6n4lJAZWpjygt+E2VcGVg671VLav48a6kurvuzrT+hqSWCuEzO8WVbj7q29IA==
X-Received: by 2002:a63:fd04:0:b0:3aa:6473:1859 with SMTP id
 d4-20020a63fd04000000b003aa64731859mr18035646pgh.151.1650945462438; 
 Mon, 25 Apr 2022 20:57:42 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00239000b004fa7103e13csm13916373pfc.41.2022.04.25.20.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 20:57:41 -0700 (PDT)
Message-ID: <94dfcb65-6901-6a56-d527-581b9b088d2c@gmail.com>
Date: Tue, 26 Apr 2022 12:57:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <1750044.XWheshbc2e@silver> <eafd4bbf-dbff-323a-179f-8f29905701e1@gmail.com>
 <3849551.ofAv5PygDX@silver>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <3849551.ofAv5PygDX@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Greg Kurz <groug@kaod.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/04/25 3:45, Christian Schoenebeck wrote:
>>>>> +    }
>>>>> +    err = chmod(addr.sun_path, mode);
>>>>
>>>> I'm not sure if it is fine to have a time window between bind() and
>>>> chmod(). Do you have some rationale?
>>>
>>> Good question. QEMU's 9p server is multi-threaded; all 9p requests come in
>>> serialized and the 9p server controller portion (9p.c) is only running on
>>> QEMU main thread, but the actual filesystem driver calls are then
>>> dispatched to QEMU worker threads and therefore running concurrently at
>>> this point:
>>>
>>> https://wiki.qemu.org/Documentation/9p#Threads_and_Coroutines
>>>
>>> Similar situation on Linux 9p client side: it handles access to a mounted
>>> 9p filesystem concurrently, requests are then serialized by 9p driver on
>>> Linux and sent over wire to 9p server (host).
>>>
>>> So yes, there might be implications by that short time windows. But could
>>> that be exploited on macOS hosts in practice?
>>>
>>> The socket file would have mode srwxr-xr-x for a short moment.
>>>
>>> For security_model=mapped* this should not be a problem.
>>>
>>> For security_model=none|passhrough, in theory, maybe? But how likely is
>>> that? If you are using a Linux client for instance, trying to brute-force
>>> opening the socket file, the client would send several 9p commands
>>> (Twalk, Tgetattr, Topen, probably more). The time window of the two
>>> commands above should be much smaller than that and I would expect one of
>>> the 9p commands to error out in between.
>>>
>>> What would be a viable approach to avoid this issue on macOS?
>>
>> It is unlikely that a naive brute-force approach will succeed to
>> exploit. The more concerning scenario is that the attacker uses the
>> knowledge of the underlying implementation of macOS to cause resource
>> contention to widen the window. Whether an exploitation is viable
>> depends on how much time you spend digging XNU.
>>
>> However, I'm also not sure if it really *has* a race condition. Looking
>> at v9fs_co_mknod(), it sequentially calls s->ops->mknod() and
>> s->ops->lstat(). It also results in an entity called "path name based
>> fid" in the code, which inherently cannot identify a file when it is
>> renamed or recreated.
>>
>> If there is some rationale it is safe, it may also be applied to the
>> sequence of bind() and chmod(). Can anyone explain the sequence of
>> s->ops->mknod() and s->ops->lstat() or path name based fid in general?
> 
> You are talking about 9p server's controller level: I don't see something that
> would prevent a concurrent open() during this bind() ... chmod() time window
> unfortunately.
> 
> Argument 'fidp' passed to function v9fs_co_mknod() reflects the directory in
> which the new device file shall be created. So 'fidp' is not the device file
> here, nor is 'fidp' modified during this function.
> 
> Function v9fs_co_mknod() is entered by 9p server on QEMU main thread. At the
> beginning of the function it first acquires a read lock on a (per 9p export)
> global coroutine mutex:
> 
>      v9fs_path_read_lock(s);
> 
> and holds this lock until returning from function v9fs_co_mknod(). But that's
> just a read lock. Function v9fs_co_open() also just gains a read lock. So they
> can happen concurrently.
> 
> Then v9fs_co_run_in_worker({...}) is called to dispatch and execute all the
> code block (think of it as an Obj-C "block") inside this (macro actually) on a
> QEMU worker thread. So an arbitrary background thread would then call the fs
> driver functions:
> 
>      s->ops->mknod()
>      v9fs_name_to_path()
>      s->ops->lstat()
> 
> and then at the end of the code block the background thread would dispatch
> back to QEMU main thread. So when we are reaching:
> 
>      v9fs_path_unlock(s);
> 
> we are already back on QEMU main thread, hence unlocking on main thread now
> and finally leaving function v9fs_co_mknod().
> 
> The important thing to understand is, while that
> 
>      v9fs_co_run_in_worker({...})
> 
> code block is executed on a QEMU worker thread, the QEMU main thread (9p
> server controller portion, i.e. 9p.c) is *not* sleeping, QEMU main thread
> rather continues to process other (if any) client requests in the meantime. In
> other words v9fs_co_run_in_worker() neither behaves exactly like Apple's GCD
> dispatch_async(), nor like dispatch_sync(), as GCD is not coroutine based.
> 
> So 9p server might pull a pending 'Topen' client request from the input FIFO
> in the meantime and likewise dispatch that to a worker thread, etc. Hence a
> concurrent open() might in theory be possible, but I find it quite unlikely to
> succeed in practice as the open() call on guest is translated by Linux client
> into a bunch of synchronous 9p requests on the path passed with the open()
> call on guest, and a round trip for each 9p message is like what, ~0.3ms or
> something in this order. That's quite huge compared to the time window I would
> expect between bind() ... open().
> 
> Does this answer your questions?

The time window may be widened by a malicious actor if the actor knows 
XNU well so the window length inferred from experiences is not really 
enough to claim it safe, particularly when considering about security.

On the other hand, I'm wondering if there is same kind of a time window 
between s->ops->mknodat() and s->ops->lstat(). Also, there should be 
similar time windows among operations with "path name based fid" as they 
also use path names as identifiers. If there is a rationale that it is 
considered secure, we may be able to apply the same logic to the time 
window between bind() and chmod() and claim it secure.
I need a review from someone who understands that part of the code, 
therefore.

Regards,
Akihiko Odaki

