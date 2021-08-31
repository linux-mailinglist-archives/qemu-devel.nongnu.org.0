Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD833FCA77
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 17:02:40 +0200 (CEST)
Received: from localhost ([::1]:59250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL5Hb-0005Il-Ez
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 11:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mL5Fe-0003pn-OM
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 11:00:38 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:34937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mL5Fb-0002vZ-V2
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 11:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Zym6CiRFp0D4xorA7QmrGyBJZZWKHbt/kk7wfJcUuvk=; b=D70feHeZCldqSfShQ8vMC0+Rz0
 tK6UI4rXuLu597foyccvEkYXkXRitACOXY5ouNYgz+ydYkbbwn57uwGLCkwjcLxRXpyP/u5BI+joE
 i40rkrCBPhtD+V5bElvubqnehGYKX4SzNEwqrlxY/lu3KJicj/7mQh4Dn7tleZKHBf3ObnZ+wshUE
 IQMMzkr2/s7e7H3tEHJTtWF37/lCctXzMxsKdkuUTaIGS+BsH9sTwew03ldi0uA6pdwyekQQOK6vt
 u6F2IeZC+E346UXh/Y7HG9iF/5VrZvTVHCG7Mb26gn2I6bICOgSWJSTxL2oU07UPWLP8ISFmqYNmm
 52XNrpVl0HPs/KU46srFnREpeD0nrg7lLsL5d+RM2yKgzTP3Kd3GvkpfwvGcOYacy5ITcYujWC8kW
 RS3AwYtfpf3J6oFesFJVVyWN0Wg301vev5+Lc0UN0GiuCG15R4rxKV4m0QugCNvonPTSL1HWG4Ysb
 mWA7z5RkAfuNx42TOIPetfXznNAyB8sYML8yaYTbtSxW3u9mFQdw+jvA2R+ffLg8ioqvtLNJtMrXS
 RCf1Z37yCrdWdHtnaz9C8l6nmLEjgHfG+UrCXJm3n/RXpsqKCCxctVjezoV9DTS907PCBviTOX4vG
 fjMPHdnIzX/IxcWZMuPr+4Q9rDgW7+ASkX3xuDATE=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: 9pfs: Twalk crash
Date: Tue, 31 Aug 2021 17:00:32 +0200
Message-ID: <1644903.jVc9DcbYlq@silver>
In-Reply-To: <20210831125749.15c42c33@bahia.lan>
References: <4325838.qn0ATYcOi1@silver> <20210831125749.15c42c33@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 31. August 2021 12:57:49 CEST Greg Kurz wrote:
> On Mon, 30 Aug 2021 17:55:04 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > Apparently commit 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4 '9pfs: reduce
> > latency of Twalk' has introduced occasional crashes.
> > 
> > My first impression after looking at the backtrace: looks like the patch
> > itself is probably not causing this, but rather unmasked this issue (i.e.
> > increased the chance to be triggered).
> > 
> > The crash is because of 'elem' is NULL in virtio_pdu_vunmarshal() (frame
> > 0).
> Ouch... this certainly isn't expected to happen :-\
> 
> elem is popped out the vq in handle_9p_output():
> 
>         elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
>         if (!elem) {
>             goto out_free_pdu;
>         }
> [...]
>         v->elems[pdu->idx] = elem;
> 
> and cleared on PDU completion in virtio_9p_push_and_notify() :
> 
>     v->elems[pdu->idx] = NULL;
> 
> 
> I can't think of a way where push_and_notify() could collide
> with handle_output()... both are supposed to be run sequentially
> by the main event loop.

Ok, I made a quick "is same thread" assertion check:

diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 54ee93b71f..bb6ebd16aa 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -28,12 +28,25 @@
 #include "qemu/module.h"
 #include "sysemu/qtest.h"
 
+static void assert_thread(void) {
+    static QemuThread thread;
+    static bool calledBefore;
+    if (!calledBefore) {
+        calledBefore = 1;
+        qemu_thread_get_self(&thread);
+        return;
+    }
+    assert(qemu_thread_is_self(&thread));
+}
+
 static void virtio_9p_push_and_notify(V9fsPDU *pdu)
 {
     V9fsState *s = pdu->s;
     V9fsVirtioState *v = container_of(s, V9fsVirtioState, state);
     VirtQueueElement *elem = v->elems[pdu->idx];
 
+    assert_thread();
+
     /* push onto queue and notify */
     virtqueue_push(v->vq, elem, pdu->size);
     g_free(elem);
@@ -51,6 +64,8 @@ static void handle_9p_output(VirtIODevice *vdev, VirtQueue 
*vq)
     ssize_t len;
     VirtQueueElement *elem;
 
+    assert_thread();
+
     while ((pdu = pdu_alloc(s))) {
         P9MsgHeader out;
 
@@ -125,6 +140,8 @@ static ssize_t virtio_pdu_vmarshal(V9fsPDU *pdu, size_t 
offset,
     VirtQueueElement *elem = v->elems[pdu->idx];
     ssize_t ret;
 
+    assert_thread();
+
     ret = v9fs_iov_vmarshal(elem->in_sg, elem->in_num, offset, 1, fmt, ap);
     if (ret < 0) {
         VirtIODevice *vdev = VIRTIO_DEVICE(v);
@@ -143,6 +160,8 @@ static ssize_t virtio_pdu_vunmarshal(V9fsPDU *pdu, size_t 
offset,
     VirtQueueElement *elem = v->elems[pdu->idx];
     ssize_t ret;
 
+    assert_thread();
+
     ret = v9fs_iov_vunmarshal(elem->out_sg, elem->out_num, offset, 1, fmt, 
ap);
     if (ret < 0) {
         VirtIODevice *vdev = VIRTIO_DEVICE(v);
@@ -160,6 +179,8 @@ static void virtio_init_in_iov_from_pdu(V9fsPDU *pdu, 
struct iovec **piov,
     VirtQueueElement *elem = v->elems[pdu->idx];
     size_t buf_size = iov_size(elem->in_sg, elem->in_num);
 
+    assert_thread();
+
     if (buf_size < size) {
         VirtIODevice *vdev = VIRTIO_DEVICE(v);
 
@@ -180,6 +201,8 @@ static void virtio_init_out_iov_from_pdu(V9fsPDU *pdu, 
struct iovec **piov,
     VirtQueueElement *elem = v->elems[pdu->idx];
     size_t buf_size = iov_size(elem->out_sg, elem->out_num);
 
+    assert_thread();
+
     if (buf_size < size) {
         VirtIODevice *vdev = VIRTIO_DEVICE(v);
 
And it triggered, however I am not sure if some of those functions I asserted 
above are indeed allowed to be executed on a different thread than main 
thread:

Program terminated with signal SIGABRT, Aborted.
#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
[Current thread is 1 (Thread 0x7fd0bcef1700 (LWP 6470))]
(gdb) bt
#0  0x00007fd3fe6db7bb in __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/
sysv/linux/raise.c:50
#1  0x00007fd3fe6c6535 in __GI_abort () at abort.c:79
#2  0x00007fd3fe6c640f in __assert_fail_base
    (fmt=0x7fd3fe828ee0 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", 
assertion=0x563569935704 "qemu_thread_is_self(&thread)", file=0x5635699356e6 2
#3  0x00007fd3fe6d4102 in __GI___assert_fail
    (assertion=assertion@entry=0x563569935704 "qemu_thread_is_self(&thread)", 
file=file@entry=0x5635699356e6 "../hw/9pfs/virtio-9p-device.c", line1
#4  0x00005635695c98aa in assert_thread () at ../hw/9pfs/virtio-9p-device.c:39
#5  0x00005635695c98aa in assert_thread () at ../hw/9pfs/virtio-9p-device.c:31
#6  0x00005635695c9a4b in virtio_9p_push_and_notify (pdu=0x56356bc38f38) at 
../hw/9pfs/virtio-9p-device.c:48
#7  0x00005635693c2f28 in pdu_complete (pdu=pdu@entry=0x56356bc38f38, 
len=<optimized out>, len@entry=-4) at ../hw/9pfs/9p.c:1059
#8  0x00005635693c49e0 in v9fs_walk (opaque=0x56356bc38f38) at ../hw/9pfs/
9p.c:1868
#9  0x00005635698256bb in coroutine_trampoline (i0=<optimized out>, 
i1=<optimized out>) at ../util/coroutine-ucontext.c:173
#10 0x00007fd3fe6f0b50 in __correctly_grouped_prefixwc
    (begin=0x2 <error: Cannot access memory at address 0x2>, end=0x0, 
thousands=0 L'\000', grouping=0x7fd3fe6db7bb <__GI_raise+267> "H\213\214$\b\1
#11 0x0000000000000000 in  ()
(gdb)

Also there is no official qemu_main_thread() function it seems yet. That might 
be useful in general.

> Maybe active some traces ?

I need to read up on how to use traces, then I'll check that as well. But 
probably ensuring thread sanity in a way proposed above would probably make 
sense first.

I also tried a little retry hack as a test, just in case this was some sort of 
"not ready yet" issue, because I saw Philippe was working on some virtio queue 
not ready issue lately:
https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04460.html
https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04471.html

diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 54ee93b71f..ba332c27b6 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -141,6 +141,19 @@ static ssize_t virtio_pdu_vunmarshal(V9fsPDU *pdu, size_t 
offset,
     V9fsState *s = pdu->s;
     V9fsVirtioState *v = container_of(s, V9fsVirtioState, state);
     VirtQueueElement *elem = v->elems[pdu->idx];
+    for (int i = 0; !elem; ++i) {
+        bool in_coroutine = qemu_in_coroutine();
+        printf("TRIGGERED %d (in_coroutine=%d)!\n", i, in_coroutine);
+        fflush(stdout);
+        if (in_coroutine) {
+            qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 100000);
+        } else {
+            g_usleep(100);
+        }
+        s = pdu->s;
+        v = container_of(s, V9fsVirtioState, state);
+        elem = v->elems[pdu->idx];
+    }
     ssize_t ret;
 
     ret = v9fs_iov_vunmarshal(elem->out_sg, elem->out_num, offset, 1, fmt, 
ap);

But that did not bring much:

TRIGGERED 0 (in_coroutine=1)!
TRIGGERED 1 (in_coroutine=1)!
TRIGGERED 2 (in_coroutine=1)!
...
TRIGGERED 43 (in_coroutine=1)!
TRIGGERED 44 (in_coroutine=1)!
qemu_aio_coroutine_enter: Co-routine was already scheduled in 
'qemu_co_sleep_ns'
Aborted (core dumped)

> > bt taken with HEAD being 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4:
> > 
> > Program terminated with signal SIGSEGV, Segmentation fault.
> > #0  virtio_pdu_vunmarshal (pdu=0x55a93717cde8, offset=7,
> > fmt=0x55a9352766d1
> > "ddw", ap=0x7f38a9ad9cd0) at ../hw/9pfs/virtio-9p-device.c:146
> > 146         ret = v9fs_iov_vunmarshal(elem->out_sg, elem->out_num, offset,
> > 1, fmt, ap);
> > [Current thread is 1 (Thread 0x7f3bddd2ac40 (LWP 7811))]
> > (gdb) bt full
> > #0  0x000055a934dfb9a7 in virtio_pdu_vunmarshal (pdu=0x55a93717cde8,
> > offset=7, fmt=0x55a9352766d1 "ddw", ap=0x7f38a9ad9cd0) at
> > ../hw/9pfs/virtio-9p-device.c: 146
> > 
> >         s = 0x55a93717b4b8
> >         v = 0x55a93717aee0
> >         elem = 0x0
> 
> So this is v->elems[pdu->idx]... what's the value of pdu->idx ?

In that originally posted core dump it was 113:

#0  virtio_pdu_vunmarshal (pdu=0x55a93717cde8, offset=7, fmt=0x55a9352766d1 
"ddw", ap=0x7f38a9ad9cd0) at ../hw/9pfs/virtio-9p-device.c:146
146         ret = v9fs_iov_vunmarshal(elem->out_sg, elem->out_num, offset, 1, 
fmt, ap);
[Current thread is 1 (Thread 0x7f3bddd2ac40 (LWP 7811))]
(gdb) p pdu->idx
$1 = 113

> >         ret = <optimized out>
> > 
> > #1  0x000055a934bf35e8 in pdu_unmarshal (pdu=pdu@entry=0x55a93717cde8,
> > offset=offset@entry=7, fmt=fmt@entry=0x55a9352766d1 "ddw") at
> > ../hw/9pfs/9p.c: 71
> > 
> >         ret = <optimized out>
> >         ap = {{gp_offset = 24, fp_offset = 48, overflow_arg_area =
> > 
> > 0x7f38a9ad9db0, reg_save_area = 0x7f38a9ad9cf0}}
> > #2  0x000055a934bf68db in v9fs_walk (opaque=0x55a93717cde8) at ../hw/9pfs/
> > 9p.c:1720
> > 
> >         name_idx = <optimized out>
> >         qids = 0x0
> >         i = <optimized out>
> >         err = 0
> >         dpath = {size = 0, data = 0x0}
> >         path = {size = 0, data = 0x0}
> >         pathes = 0x0
> >         nwnames = 1
> >         stbuf =
> >         
> >             {st_dev = 2050, st_ino = 1199848, st_nlink = 1, st_mode =
> >             41471,
> > 
> > st_uid = 0, st_gid = 0, __pad0 = 0, st_rdev = 0, st_size = 13, st_blksize
> > =
> > 4096, st_blocks = 16, s}
> > 
> >         fidst =
> >         
> >             {st_dev = 2050, st_ino = 1198183, st_nlink = 3, st_mode =
> >             16877,
> > 
> > st_uid = 0, st_gid = 0, __pad0 = 0, st_rdev = 0, st_size = 12288,
> > st_blksize = 4096, st_blocks = 32}
> > 
> >         stbufs = 0x0
> >         offset = 7
> >         fid = 299
> >         newfid = 687
> >         wnames = 0x0
> >         fidp = <optimized out>
> >         newfidp = 0x0
> >         pdu = 0x55a93717cde8
> >         s = 0x55a93717b4b8
> >         qid = {type = 2 '\002', version = 1556732739, path = 2399697}
> > 
> > #3  0x000055a93505760b in coroutine_trampoline (i0=<optimized out>,
> > i1=<optimized out>) at ../util/coroutine-ucontext.c:173



