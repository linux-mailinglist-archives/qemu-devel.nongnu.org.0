Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5682C3ACA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 09:20:38 +0100 (CET)
Received: from localhost ([::1]:53756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khq2X-0007qv-0v
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 03:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khq11-0007OA-QC
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 03:19:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khq0v-0003lI-6m
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 03:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606292334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y822EpX5Gk5EzWXGLSuJhb7Juugx0XdZYTgIrtTIkgo=;
 b=NR7IScII7pI5B/ZrPWXv9bbXSBK6488Xz/7VM1zLJyKy5nXrDZqSapA/VOObIPPIB/ykU7
 UPLG2h/S7ApVR3hRrNGDgorpEynXc2AnwQ9e5hcKEEFv3SRMtF4RJy7M7KHXoWQdRCFCth
 /8HIjwoipOicyPNyTUsNTr3ek5i9uPM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-wcg0UT0fNpS5URZ_nCQ5Zg-1; Wed, 25 Nov 2020 03:18:50 -0500
X-MC-Unique: wcg0UT0fNpS5URZ_nCQ5Zg-1
Received: by mail-wr1-f69.google.com with SMTP id w17so488677wrl.8
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 00:18:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y822EpX5Gk5EzWXGLSuJhb7Juugx0XdZYTgIrtTIkgo=;
 b=P1pSArkVcQVNPpQckbljdV7P7MBOjQANS03GoR+rgqq7G1G37H2+8PCk5baKDlClMV
 hJN2aKAoljnlL3GaVHqdM8mNrwGCijKg6lo4hV4wLlke8SbKXdyWofl5Ova2XU9sWyx3
 kIc/pEp0BuYMqsw5UdtU7rcMFnA+wOSvzhHawnvqK3PRmNPReogb+nAQBP/I/GJWKj25
 VQGz704QdPryLTiWf+a8pIDYrb2gzc+bfl6QD7z4iefRA6TqxJICpB1rfEgSSiMiqJyv
 GJRVtDVvDw0wpwVo/ZtRnK/WQCdKaHCFgwNBnj/b2/fm9w7baPvNHfvb+J2X6bBW+/9u
 HXDA==
X-Gm-Message-State: AOAM5314gdi/vt0x6/9zU8LYmWFQIDBZjHjAD5BmRYO5rXx6j6PcWRm0
 8NMRr+GrgMp3+y6cwUKh7goyJOW8Rde/QPslqKF5FCMgv3fsTZesZ/XcGf5N5VlIvPSa/YzrKPL
 3P7aICGzzktZGZoupTsPHbCrUrcZmHf9IkOB2zLgYhHoJmPtVy09CAELkg7irDPLt
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr2699379wrp.242.1606292329178; 
 Wed, 25 Nov 2020 00:18:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwE8ZGn304ypQDdT9SMNwjU4gQJWHm6eP6nTqpG1ynRiTJJP8b54GvZYReIXjbCMKDpjzYSQw==
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr2699353wrp.242.1606292328922; 
 Wed, 25 Nov 2020 00:18:48 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id d3sm3176643wmb.5.2020.11.25.00.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 00:18:48 -0800 (PST)
Subject: Re: [Bug 1905521] [NEW] assert issue locates in
 hw/scsi/lsi53c895a.c:624: lsi_do_dma: Assertion `s->current' failed
To: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <160628893217.26625.10789422824158727924.malonedeb@chaenomeles.canonical.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3e1f041f-90d3-4f76-2a87-6a807dca9d66@redhat.com>
Date: Wed, 25 Nov 2020 09:18:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <160628893217.26625.10789422824158727924.malonedeb@chaenomeles.canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org, Bug 1905521 <1905521@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Fam directly because his launchpad account
contact points to invalid email address.

On 11/25/20 8:22 AM, Gaoning Pan wrote:
> Public bug reported:
> 
> Hello,
> 
> I found an assertion failure in hw/scsi/lsi53c895a.c:624
> 
> This was found in latest version 5.2.0.
> 
> 
> my reproduced environment is as follows:
>     Host: ubuntu 18.04
>     Guest: ubuntu 18.04
> 
> 
> QEMU boot command line:
> qemu-system-x86_64 -enable-kvm -boot c -m 4G -drive format=qcow2,file=./ubuntu.img -nic user,hostfwd=tcp:0.0.0.0:5555-:22 -display none -device lsi53c895a -trace lsi\*
> 
> Backtrace is as follows:
> #0  0x00007f845c6eff47 in __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:51
> #1  0x00007f845c6f18b1 in __GI_abort () at abort.c:79
> #2  0x00007f845c6e142a in __assert_fail_base (fmt=0x7f845c868a38 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=assertion@entry=0x55a1034486a0 "s->current", file=file@entry=0x55a103448360 "../hw/scsi/lsi53c895a.c", line=line@entry=624, function=function@entry=0x55a10344ae60 <__PRETTY_FUNCTION__.31674> "lsi_do_dma") at assert.c:92
> #3  0x00007f845c6e14a2 in __GI___assert_fail (assertion=0x55a1034486a0 "s->current", file=0x55a103448360 "../hw/scsi/lsi53c895a.c", line=624, function=0x55a10344ae60 <__PRETTY_FUNCTION__.31674> "lsi_do_dma") at assert.c:101
> #4  0x000055a102049c65 in lsi_do_dma (s=0x62600000c100, out=1) at ../hw/scsi/lsi53c895a.c:624
> #5  0x000055a102051573 in lsi_execute_script (s=0x62600000c100) at ../hw/scsi/lsi53c895a.c:1250
> #6  0x000055a10205b05d in lsi_reg_writeb (s=0x62600000c100, offset=47, val=178 '\262') at ../hw/scsi/lsi53c895a.c:1984
> #7  0x000055a10205fef8 in lsi_io_write (opaque=0x62600000c100, addr=47, val=178, size=1) at ../hw/scsi/lsi53c895a.c:2146
> #8  0x000055a102d1b791 in memory_region_write_accessor (mr=0x62600000cbe0, addr=47, value=0x7f8349dfe2f8, size=1, shift=0, mask=255, attrs=...) at ../softmmu/memory.c:484
> #9  0x000055a102d1bba8 in access_with_adjusted_size (addr=47, value=0x7f8349dfe2f8, size=1, access_size_min=1, access_size_max=1, access_fn=0x55a102d1b4de <memory_region_write_accessor>, mr=0x62600000cbe0, attrs=...) at ../softmmu/memory.c:545
> #10 0x000055a102d261ef in memory_region_dispatch_write (mr=0x62600000cbe0, addr=47, data=178, op=MO_8, attrs=...) at ../softmmu/memory.c:1494
> #11 0x000055a102b57c3c in flatview_write_continue (fv=0x6060000ea920, addr=49199, attrs=..., ptr=0x7f8449efb000, len=1, addr1=47, l=1, mr=0x62600000cbe0) at ../softmmu/physmem.c:2767
> #12 0x000055a102b57f07 in flatview_write (fv=0x6060000ea920, addr=49199, attrs=..., buf=0x7f8449efb000, len=1) at ../softmmu/physmem.c:2807
> #13 0x000055a102b587cb in address_space_write (as=0x55a105ebca80 <address_space_io>, addr=49199, attrs=..., buf=0x7f8449efb000, len=1) at ../softmmu/physmem.c:2899
> #14 0x000055a102b58878 in address_space_rw (as=0x55a105ebca80 <address_space_io>, addr=49199, attrs=..., buf=0x7f8449efb000, len=1, is_write=true) at ../softmmu/physmem.c:2909
> #15 0x000055a102ad4d50 in kvm_handle_io (port=49199, attrs=..., data=0x7f8449efb000, direction=1, size=1, count=1) at ../accel/kvm/kvm-all.c:2283
> #16 0x000055a102ad6a0f in kvm_cpu_exec (cpu=0x62e000000400) at ../accel/kvm/kvm-all.c:2529
> #17 0x000055a102c26fbb in kvm_vcpu_thread_fn (arg=0x62e000000400) at ../accel/kvm/kvm-cpus.c:49
> #18 0x000055a1032c08f8 in qemu_thread_start (args=0x603000082780) at ../util/qemu-thread-posix.c:521
> #19 0x00007f845caa96db in start_thread (arg=0x7f8349dff700) at pthread_create.c:463
> #20 0x00007f845c7d2a3f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
> 
> 
> The poc is attached.
> 
> ** Affects: qemu
>      Importance: Undecided
>      Assignee: Gaoning Pan (hades0506)
>          Status: New
> 
> ** Attachment added: "lsi-assert.c"
>    https://bugs.launchpad.net/bugs/1905521/+attachment/5437756/+files/lsi-assert.c
> 
> ** Changed in: qemu
>      Assignee: (unassigned) => Gaoning Pan (hades0506)
> 


