Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3603A46D060
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 10:53:36 +0100 (CET)
Received: from localhost ([::1]:60750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mutdm-0000qj-BR
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 04:53:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1mutcW-00009r-5J; Wed, 08 Dec 2021 04:52:16 -0500
Received: from mxhk.zte.com.cn ([63.216.63.35]:53660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1mutcT-00038v-1y; Wed, 08 Dec 2021 04:52:15 -0500
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4J8C6r3zBkz4yjYg;
 Wed,  8 Dec 2021 17:49:08 +0800 (CST)
Received: from kjyxapp03.zte.com.cn ([10.30.12.202])
 by mse-fl2.zte.com.cn with SMTP id 1B89q3SS052514;
 Wed, 8 Dec 2021 17:52:03 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from mapi (kjyxapp04[null]) by mapi (Zmail) with MAPI id mid14;
 Wed, 8 Dec 2021 17:52:03 +0800 (CST)
Date: Wed, 8 Dec 2021 17:52:03 +0800 (CST)
X-Zmail-TransId: 2b0661b080436dee1864
X-Mailer: Zmail v1.0
Message-ID: <202112081752032511235@zte.com.cn>
In-Reply-To: <ff84b2f5-4737-7c25-a944-43a0774a2865@redhat.com>
References: 20211207105619.3205-1-wang.yi59@zte.com.cn,
 ff84b2f5-4737-7c25-a944-43a0774a2865@redhat.com
Mime-Version: 1.0
From: <wang.yi59@zte.com.cn>
To: <hreitz@redhat.com>
Subject: =?UTF-8?B?UmU6W1BBVENIXSBtaXJyb3I6IEF2b2lkIGFzc2VydGlvbiBmYWlsZWQgaW4gbWlycm9yX3J1bg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 1B89q3SS052514
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID
 61B07F94.000 by FangMail milter!
X-FangMail-Envelope: 1638956948/4J8C6r3zBkz4yjYg/61B07F94.000/10.30.14.239/[10.30.14.239]/mse-fl2.zte.com.cn/<wang.yi59@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 61B07F94.000/4J8C6r3zBkz4yjYg
Received-SPF: pass client-ip=63.216.63.35; envelope-from=wang.yi59@zte.com.cn;
 helo=mxhk.zte.com.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wang.liang82@zte.com.cn,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, xue.zhihong@zte.com.cn,
 long.yunjian@zte.com.cn, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>[CC-ing qemu-block, Vladimir, Kevin, and John – when sending patches,  
>please look into the MAINTAINERS file or use the  
>scripts/get_maintainer.pl script to find out who to CC on them.  It’s  
>very to overlook patches on qemu-devel :/]
>
>On 07.12.21 11:56, Yi Wang wrote:
>> From: Long YunJian <long.yunjian@zte.com.cn> 
>> 
>> when blockcommit from active leaf node, sometimes, we get assertion failed with
>> "mirror_run: Assertion `QLIST_EMPTY(&bs->tracked_requests)' failed" messages.
>> According to the core file, we find bs->tracked_requests has IO request,
>> so assertion failed.
>> (gdb) bt
>> #0  0x00007f410df707cf in raise () from /lib64/libc.so.6
>> #1  0x00007f410df5ac05 in abort () from /lib64/libc.so.6
>> #2  0x00007f410df5aad9 in __assert_fail_base.cold.0 () from /lib64/libc..so.6
>> #3  0x00007f410df68db6 in __assert_fail () from /lib64/libc.so.6
>> #4  0x0000556915635371 in mirror_run (job=0x556916ff8600, errp=<optimized out>) at block/mirror.c:1092
>> #5  0x00005569155e6c53 in job_co_entry (opaque=0x556916ff8600) at job..c:904
>> #6  0x00005569156d9483 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at util/coroutine-ucontext.c:115
>> (gdb) p s->mirror_top_bs->backing->bs->tracked_requests
>> $12 = {lh_first = 0x7f3f07bfb8b0}
>> (gdb) p s->mirror_top_bs->backing->bs->tracked_requests->lh_first
>> $13 = (struct BdrvTrackedRequest *) 0x7f3f07bfb8b0
>> 
>> Actually, before excuting assert(QLIST_EMPTY(&bs->tracked_requests)),
>> it will excute mirror_flush(s). It may handle new I/O request and maybe
>> pending I/O during this flush. Just likes in bdrv_close fuction,
>> bdrv_drain(bs) followed by bdrv_flush(bs), we should add bdrv_drain fuction
>> to handle pending I/O after mirror_flush.
>
>Oh.  How is that happening, though?  I would have expected that flushing  
>the target BB (and associated BDS) only flushes requests to the OS and  
>lower layers, but the source node (which is `bs`) should (in the case of  
>commit) always be above the target, so I wouldn’t have expected it to  
>get any new requests due to this flush.
>
>Do you have a reproducer for this?

As i know, flush maybe will do some thring write, and then in qcow2_co_pwritev function,
if others aready hold "s->lock" lock, qemu_co_mutex_lock(&s->lock) will go to qemu_coroutine_yield,
and do some other things. Maybe, it will handle new I/O now. 

reproducer:
first, create leaf alpine-min_leaf1.qcow2, alpine-min_leaf1.qcow2 has backing file alpine-min.qcow2,
and create vm from leaf qcow2, xml likes this
<disk type='file' device='disk'>
      <driver name='qemu' type='qcow2' cache='none' iothread='1'/>
      <source file='/home/alpine-min_leaf1.qcow2'/>
      <target dev='vda' bus='virtio'/>
</disk>


and then make I/O request by read and write files all the time in guset os.
finally, run script blockcommit.sh until assertion failed. You should modify script according to actual situation.
script as follows: 

#!/bin/bash
QEMUIMG=/home/qemu-6.0.0-rc2/build/qemu-img
VIRSH=/home/libvirt-7.2.0/build/tools/virsh
DOMID=v6_host7
LEAF1=/home/alpine-min_leaf1.qcow2
LEAF2=/home/alpine-min_leaf2.qcow2
while [ 1 ]
do
        [ -f quitfile ] && break
        ${QEMUIMG} create -f qcow2 -F qcow2 -b ${LEAF1} ${LEAF2}
        sleep 2
        ${VIRSH} -k 0 snapshot-create-as ${DOMID} --disk-only --diskspec vda,file=${LEAF2} --reuse-external --no-metadata
        [ $? -ne 0 ] && break
        sleep 30
        ${VIRSH} blockcommit --domain ${DOMID} vda --base ${LEAF1} --top ${LEAF2} --wait --verbose --active --pivot
        [ $? -ne 0 ] && break
done


The probability of the problem is not high, it's difficult to reproduce the problem, blockcommit hundreds of times at least.

>> Signed-off-by: Long YunJian <long.yunjian@zte.com.cn> 
>> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn> 
>> ---
>>   block/mirror.c | 2 ++
>>   1 file changed, 2 insertions(+)
>> 
>> diff --git a/block/mirror.c b/block/mirror.c
>> index efec2c7674..1eec356310 100644
>> --- a/block/mirror.c
>> +++ b/block/mirror.c
>> @@ -1079,6 +1079,8 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>>                   s->in_drain = false;
>>                   continue;
>>               }
>> +            /* in case flush left pending I/O */
>> +            bdrv_drain(bs);
>
>I don’t think this works, because if we drain, we would also need to  
>flush the target again.  Essentially I believe we’d basically need  
>something like
>
>do {
>     bdrv_drained_begin(bs);
>     mirror_flush(s);
>     if (!QLIST_EMPTY(&bs->tracked_requests)) {
>         bdrv_drained_end(bs);
>     }
>} while (!QLIST_EMPTY(&bs->tracked_requests));
>
>(Which I know is really ugly)
>
>Hanna

Yes, add bdrv_drain(bs) after mirror_flush(s) can't fix this problem. Thank you for your idea of a solution.
and I'd like to modify as follows, how do you like it?
@@ -1074,7 +1074,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
             s->in_drain = true;
             bdrv_drained_begin(bs);
             cnt = bdrv_get_dirty_count(s->dirty_bitmap);
-            if (cnt > 0 || mirror_flush(s) < 0) {
+            if (cnt > 0 || mirror_flush(s) < 0 || !QLIST_EMPTY(&bs->tracked_requests)) {
                 bdrv_drained_end(bs);
                 s->in_drain = false;
                 continue;

>    
>               /* The two disks are in sync.  Exit and report successful
>                * completion.

