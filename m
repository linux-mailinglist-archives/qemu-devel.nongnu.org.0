Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594731911AF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 14:47:06 +0100 (CET)
Received: from localhost ([::1]:48996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGjtY-0006VW-VD
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 09:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jGjrZ-0005QA-Vx
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:45:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jGjrX-0005LC-O2
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:45:01 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:24501)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jGjrX-0005KG-Jl
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585057498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=p8CoNhCExbhoygIoF+wwOd7wS7+Lk6DkRugd8fIXl8c=;
 b=PyXH6MEj/EmKELVDZLWtSByTvUNC2hhKg4/cZFUCeuhacmcrrC3IMNgy2EqyGbayAn2mdq
 mLA+U9D9wY2a6i285Mi17p0YemoUyuJMM5J465A/U1uMcPZPrgWYChrHujGxI8/qHLyriJ
 4j29WmrAJpZXbCiaeiqu1V1UquyO9SY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-vqeGdeqwOCquPSlW6wL4bg-1; Tue, 24 Mar 2020 09:44:54 -0400
X-MC-Unique: vqeGdeqwOCquPSlW6wL4bg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0D851005512;
 Tue, 24 Mar 2020 13:44:53 +0000 (UTC)
Received: from [10.10.112.191] (ovpn-112-191.rdu2.redhat.com [10.10.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D33F1001B09;
 Tue, 24 Mar 2020 13:44:48 +0000 (UTC)
Subject: Re: backup transaction with io-thread core dumps
To: Dietmar Maurer <dietmar@proxmox.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>
References: <2007060575.48.1585048408879@webmail.proxmox.com>
 <1512602350.59.1585056617632@webmail.proxmox.com>
 <1806708761.60.1585056799652@webmail.proxmox.com>
From: John Snow <jsnow@redhat.com>
Autocrypt: addr=jsnow@redhat.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <446da3ef-3141-4c77-cb30-352a16a4e9be@redhat.com>
Date: Tue, 24 Mar 2020 09:44:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1806708761.60.1585056799652@webmail.proxmox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Well, that was a rollercoaster of emotions as I read your mails.

On 3/24/20 9:33 AM, Dietmar Maurer wrote:
> spoke too soon - the error is still there, sigh
>  
>> This is fixed with this patch:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg07249.html
>>
>> thanks!
>>
>>> On March 24, 2020 12:13 PM Dietmar Maurer <dietmar@proxmox.com> wrote:
>>>
>>>  
>>> I get a core dump with backup transactions when using io-threads.
>>>
>>> To reproduce, create and start a VM with:
>>>
>>> # qemu-img create disk1.raw 100M
>>> # qemu-img create disk2.raw 100M
>>> #./x86_64-softmmu/qemu-system-x86_64 -chardev 'socket,id=qmp,path=/var/run/qemu-test.qmp,server,nowait' -mon 'chardev=qmp,mode=control' -pidfile /var/run/qemu-server/108.pid  -m 512 -object 'iothread,id=iothread-virtioscsi0' -object 'iothread,id=iothread-virtioscsi1'  -device 'virtio-scsi-pci,id=virtioscsi0,iothread=iothread-virtioscsi0' -drive 'file=disk1.raw,if=none,id=drive-scsi0,format=raw,cache=none,aio=native,detect-zeroes=on' -device 'scsi-hd,bus=virtioscsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0,id=scsi0' -device 'virtio-scsi-pci,id=virtioscsi1,iothread=iothread-virtioscsi1' -drive 'file=disk2.raw,if=none,id=drive-scsi1,format=raw,cache=none,aio=native,detect-zeroes=on' -device 'scsi-hd,bus=virtioscsi1.0,channel=0,scsi-id=0,lun=1,drive=drive-scsi1,id=scsi1'
>>>
>>> Then open socat to the qmp socket
>>> # socat /var/run/qemu-test.qmp -
>>>
>>> And run the following qmp command:
>>>
>>> { "execute": "qmp_capabilities", "arguments": {} }
>>> { "execute": "transaction", "arguments":  { "actions": [{ "type": "drive-backup", "data": { "device": "drive-scsi0", "sync": "full", "target": "backup-sysi0.raw" }}, { "type": "drive-backup", "data": { "device": "drive-scsi1", "sync": "full", "target": "backup-scsi1.raw" }}], "properties": { "completion-mode": "grouped" } } }
>>>
>>> The VM will core dump:
>>>
>>> qemu: qemu_mutex_unlock_impl: Operation not permitted
>>> Aborted (core dumped)
>>> (gdb) bt
>>> #0  0x00007f099d5037bb in __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
>>> #1  0x00007f099d4ee535 in __GI_abort () at abort.c:79
>>> #2  0x000055c04e39525e in error_exit (err=<optimized out>, msg=msg@entry=0x55c04e5122e0 <__func__.16544> "qemu_mutex_unlock_impl") at util/qemu-thread-posix.c:36
>>> #3  0x000055c04e395813 in qemu_mutex_unlock_impl (mutex=mutex@entry=0x7f09903154e0, file=file@entry=0x55c04e51129f "util/async.c", line=line@entry=601)
>>>     at util/qemu-thread-posix.c:108
>>> #4  0x000055c04e38f8e5 in aio_context_release (ctx=ctx@entry=0x7f0990315480) at util/async.c:601
>>> #5  0x000055c04e299073 in bdrv_set_aio_context_ignore (bs=0x7f0929a76500, new_context=new_context@entry=0x7f0990315000, ignore=ignore@entry=0x7ffe08fa7400)
>>>     at block.c:6238
>>> #6  0x000055c04e2990cc in bdrv_set_aio_context_ignore (bs=bs@entry=0x7f092af47900, new_context=new_context@entry=0x7f0990315000, ignore=ignore@entry=0x7ffe08fa7400)
>>>     at block.c:6211
>>> #7  0x000055c04e299443 in bdrv_child_try_set_aio_context (bs=bs@entry=0x7f092af47900, ctx=0x7f0990315000, ignore_child=ignore_child@entry=0x0, errp=errp@entry=0x0)
>>>     at block.c:6324
>>> #8  0x000055c04e299576 in bdrv_try_set_aio_context (errp=0x0, ctx=<optimized out>, bs=0x7f092af47900) at block.c:6333
>>> #9  0x000055c04e299576 in bdrv_replace_child (child=child@entry=0x7f09902ef5e0, new_bs=new_bs@entry=0x0) at block.c:2551
>>> #10 0x000055c04e2995ff in bdrv_detach_child (child=0x7f09902ef5e0) at block.c:2666
>>> #11 0x000055c04e299ec9 in bdrv_root_unref_child (child=<optimized out>) at block.c:2677
>>> #12 0x000055c04e29f3fe in block_job_remove_all_bdrv (job=job@entry=0x7f0927c18800) at blockjob.c:191
>>> #13 0x000055c04e29f429 in block_job_free (job=0x7f0927c18800) at blockjob.c:88
>>> #14 0x000055c04e2a0909 in job_unref (job=0x7f0927c18800) at job.c:359
>>> #15 0x000055c04e2a0909 in job_unref (job=0x7f0927c18800) at job.c:351
>>> #16 0x000055c04e2a0b68 in job_conclude (job=0x7f0927c18800) at job.c:620
>>> #17 0x000055c04e2a0b68 in job_finalize_single (job=0x7f0927c18800) at job.c:688
>>> #18 0x000055c04e2a0b68 in job_finalize_single (job=0x7f0927c18800) at job.c:660
>>> #19 0x000055c04e2a14fc in job_txn_apply (txn=<optimized out>, fn=0x55c04e2a0a50 <job_finalize_single>) at job.c:145
>>> #20 0x000055c04e2a14fc in job_do_finalize (job=0x7f0927c1c200) at job.c:781
>>> #21 0x000055c04e2a1751 in job_completed_txn_success (job=0x7f0927c1c200) at job.c:831
>>> #22 0x000055c04e2a1751 in job_completed (job=0x7f0927c1c200) at job.c:844
>>> #23 0x000055c04e2a1751 in job_completed (job=0x7f0927c1c200) at job.c:835
>>> #24 0x000055c04e2a17b0 in job_exit (opaque=0x7f0927c1c200) at job.c:863
>>> #25 0x000055c04e38ee75 in aio_bh_call (bh=0x7f098ec52000) at util/async.c:164
>>> #26 0x000055c04e38ee75 in aio_bh_poll (ctx=ctx@entry=0x7f0990315000) at util/async.c:164
>>> #27 0x000055c04e3924fe in aio_dispatch (ctx=0x7f0990315000) at util/aio-posix.c:380
>>> #28 0x000055c04e38ed5e in aio_ctx_dispatch (source=<optimized out>, callback=<optimized out>, user_data=<optimized out>) at util/async.c:298
>>> #29 0x00007f099f020f2e in g_main_context_dispatch () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
>>> #30 0x000055c04e391768 in glib_pollfds_poll () at util/main-loop.c:219
>>> #31 0x000055c04e391768 in os_host_main_loop_wait (timeout=<optimized out>) at util/main-loop.c:242
>>> #32 0x000055c04e391768 in main_loop_wait (nonblocking=nonblocking@entry=0) at util/main-loop.c:518
>>> #33 0x000055c04e032329 in qemu_main_loop () at /home/dietmar/pve5-devel/mirror_qemu/softmmu/vl.c:1665
>>> #34 0x000055c04df36a8e in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at /home/dietmar/pve5-devel/mirror_qemu/softmmu/main.c:49
> 

Alright, let's start the field autopsy.

What version of QEMU are you running? Sergio contributed a lot of AIO
context (and iothread) fixes this release; this looks (at a glance) to
be similar and related.

If you are running 4.2 and not the latest HEAD, it's a strong candidate.

Check this out:
https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg01440.html

hth,
--js


