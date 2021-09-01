Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649553FD9E2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:57:16 +0200 (CEST)
Received: from localhost ([::1]:38960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPnn-000053-F9
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mLPgX-0001wL-Bx
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:49:45 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:59251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mLPgU-00056c-Dv
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=PlSN2gSTw1pqvUXs5trq7bO8542HLtSyPbXRZNkv/vA=; b=wTKPa5FG+qmNTjlfO4ICE2yoFp
 0Kxh+G+L9jpvEmDMzPHtVxUEFFuZtHgVJJ28lhDFYUoVW21NBNBvBqlXYI7DnbcNZ9VidQa4Vcoyn
 FXFDO3R+FiJxob5gGzlf/RI57MPWdMxuyrLBnK/yvVGX2df25q4Fva1Hz4jP2dhxxrPd4PEDIzuWz
 qo6wKtiwBw+Rx87tLTNnRhbrODhBZusp0+xkOMDisJGOaMsmwJmuLns9pgBCKM4fi6fOso1E2VmUx
 +k2bpyJgZaOt2L2TJyzRaTKkYLGKqL+FpOQUJWCwDAmdwIRQzyXMPyL/2r5G2qyDzEgDzZoEz+Igy
 IjljrgOwwuucuy5auYJA5JbiWnZ/VNHYK5I+XH2V+Ckz1QfKjo5/1I0pamsKEeB/PpTZ8JZqC/N93
 ZXfCEryTxnWZ4FHuQSKIjgAsn73sIW0517Gbb6DniSWUVpXbFQ/r8G5EPRC7OjxodKBjW8nSROQ0j
 dEbfzPdTOGYXPVXfWCVd3LTAmqoagx7WoZLORs0CD1wEukdFV/GtNPyrjL9RhLBF01xH0dzckq+oF
 tmQKCINH5eErNsmJQGKcv6HrnLSTj42lQoQ5nYJdp8mcosiad8le2OELVO618LuaxgzQzWWlmOlCp
 ZDPnqAleocz/lFqT1pp+nny9j+nTn++5iPAzpChpQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: 9pfs: Twalk crash
Date: Wed, 01 Sep 2021 14:49:37 +0200
Message-ID: <37058587.QroWqLRJlK@silver>
In-Reply-To: <20210831190454.5c725f2b@bahia.lan>
References: <4325838.qn0ATYcOi1@silver> <1644903.jVc9DcbYlq@silver>
 <20210831190454.5c725f2b@bahia.lan>
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

On Dienstag, 31. August 2021 19:04:54 CEST Greg Kurz wrote:
> > Ok, I made a quick "is same thread" assertion check:
> > 
> > diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
> > index 54ee93b71f..bb6ebd16aa 100644
> > --- a/hw/9pfs/virtio-9p-device.c
> > +++ b/hw/9pfs/virtio-9p-device.c
> > @@ -28,12 +28,25 @@
> > 
> >  #include "qemu/module.h"
> >  #include "sysemu/qtest.h"
> > 
> > +static void assert_thread(void) {
> > +    static QemuThread thread;
> > +    static bool calledBefore;
> > +    if (!calledBefore) {
> > +        calledBefore = 1;
> > +        qemu_thread_get_self(&thread);
> > +        return;
> > +    }
> > +    assert(qemu_thread_is_self(&thread));
> > +}
> > +
[...]
> > And it triggered, however I am not sure if some of those functions I
> > asserted above are indeed allowed to be executed on a different thread
> > than main thread:
> > 
> > Program terminated with signal SIGABRT, Aborted.
> > #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> > 50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
> > [Current thread is 1 (Thread 0x7fd0bcef1700 (LWP 6470))]
> 
> Based in the thread number, it seems that the signal was raised by
> the main event thread...

No, it was not main thread actually, gdb's "current thread is 1" output is 
misleading.

Following the thread id trace, I extended the thread assertion checks over to 
v9fs_walk() as well, like this:

static void coroutine_fn v9fs_walk(void *opaque)
{
    ...
    assert_thread();
    v9fs_co_run_in_worker({
        ...
    });
    assert_thread();
    ...
}

and made sure the reference thread id to be compared is really the main 
thread.

And what happens here is before v9fs_co_run_in_worker() is entered, 
v9fs_walk() runs on main thread, but after returning from 
v9fs_co_run_in_worker() it runs on a different thread for some reason, not on 
main thread as it would be expected at that point.

This is my test patch:

----

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 2815257f42..fa706c10e6 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1717,6 +1717,8 @@ static void coroutine_fn v9fs_walk(void *opaque)
     V9fsState *s = pdu->s;
     V9fsQID qid;
 
+    assert_thread();
+
     err = pdu_unmarshal(pdu, offset, "ddw", &fid, &newfid, &nwnames);
     if (err < 0) {
         pdu_complete(pdu, err);
@@ -1724,10 +1726,15 @@ static void coroutine_fn v9fs_walk(void *opaque)
     }
     offset += err;
 
+    assert_thread();
+
     trace_v9fs_walk(pdu->tag, pdu->id, fid, newfid, nwnames);
 
+    assert_thread();
+
     if (nwnames > P9_MAXWELEM) {
         err = -EINVAL;
+        assert_thread();
         goto out_nofid;
     }
     if (nwnames) {
@@ -1738,10 +1745,12 @@ static void coroutine_fn v9fs_walk(void *opaque)
         for (i = 0; i < nwnames; i++) {
             err = pdu_unmarshal(pdu, offset, "s", &wnames[i]);
             if (err < 0) {
+                assert_thread();
                 goto out_nofid;
             }
             if (name_is_illegal(wnames[i].data)) {
                 err = -ENOENT;
+                assert_thread();
                 goto out_nofid;
             }
             offset += err;
@@ -1750,6 +1759,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
     fidp = get_fid(pdu, fid);
     if (fidp == NULL) {
         err = -ENOENT;
+        assert_thread();
         goto out_nofid;
     }
 
@@ -1767,6 +1777,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
      * Twalk client request) as small as possible, run all the required fs
      * driver code altogether inside the following block.
      */
+    assert_thread();
     v9fs_co_run_in_worker({
         if (v9fs_request_cancelled(pdu)) {
             err = -EINTR;
@@ -1807,6 +1818,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
             }
         }
     });
+    assert_thread();
     /*
      * Handle all the rest of this Twalk request on main thread ...
      */
diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 54ee93b71f..abf8a33b3b 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -27,6 +27,21 @@
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "sysemu/qtest.h"
+#include <sys/types.h>
+#include <sys/syscall.h>
+
+static pid_t main_thread_id = -1;
+
+void assert_thread(void) {
+    assert(main_thread_id != -1);
+    pid_t tid = syscall(__NR_gettid);
+    if (tid != main_thread_id) {
+        printf("Unexpected thread id %d (should be %d) - process id is %d\n",
+               tid, main_thread_id, getpid());
+        fflush(stdout);
+    }
+    assert(tid == main_thread_id);
+}
 
 static void virtio_9p_push_and_notify(V9fsPDU *pdu)
 {
@@ -34,6 +49,8 @@ static void virtio_9p_push_and_notify(V9fsPDU *pdu)
     V9fsVirtioState *v = container_of(s, V9fsVirtioState, state);
     VirtQueueElement *elem = v->elems[pdu->idx];
 
+    assert_thread();
+
     /* push onto queue and notify */
     virtqueue_push(v->vq, elem, pdu->size);
     g_free(elem);
@@ -51,6 +68,8 @@ static void handle_9p_output(VirtIODevice *vdev, VirtQueue 
*vq)
     ssize_t len;
     VirtQueueElement *elem;
 
+    assert_thread();
+
     while ((pdu = pdu_alloc(s))) {
         P9MsgHeader out;
 
@@ -125,6 +144,8 @@ static ssize_t virtio_pdu_vmarshal(V9fsPDU *pdu, size_t 
offset,
     VirtQueueElement *elem = v->elems[pdu->idx];
     ssize_t ret;
 
+    assert_thread();
+
     ret = v9fs_iov_vmarshal(elem->in_sg, elem->in_num, offset, 1, fmt, ap);
     if (ret < 0) {
         VirtIODevice *vdev = VIRTIO_DEVICE(v);
@@ -143,6 +164,8 @@ static ssize_t virtio_pdu_vunmarshal(V9fsPDU *pdu, size_t 
offset,
     VirtQueueElement *elem = v->elems[pdu->idx];
     ssize_t ret;
 
+    assert_thread();
+
     ret = v9fs_iov_vunmarshal(elem->out_sg, elem->out_num, offset, 1, fmt, 
ap);
     if (ret < 0) {
         VirtIODevice *vdev = VIRTIO_DEVICE(v);
@@ -160,6 +183,8 @@ static void virtio_init_in_iov_from_pdu(V9fsPDU *pdu, 
struct iovec **piov,
     VirtQueueElement *elem = v->elems[pdu->idx];
     size_t buf_size = iov_size(elem->in_sg, elem->in_num);
 
+    assert_thread();
+
     if (buf_size < size) {
         VirtIODevice *vdev = VIRTIO_DEVICE(v);
 
@@ -180,6 +205,8 @@ static void virtio_init_out_iov_from_pdu(V9fsPDU *pdu, 
struct iovec **piov,
     VirtQueueElement *elem = v->elems[pdu->idx];
     size_t buf_size = iov_size(elem->out_sg, elem->out_num);
 
+    assert_thread();
+
     if (buf_size < size) {
         VirtIODevice *vdev = VIRTIO_DEVICE(v);
 
@@ -251,6 +278,10 @@ static Property virtio_9p_properties[] = {
 
 static void virtio_9p_class_init(ObjectClass *klass, void *data)
 {
+    main_thread_id = syscall(__NR_gettid);
+    printf("Main thread ID is %d\n", main_thread_id);
+    fflush(stdout);
+
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
 
diff --git a/hw/9pfs/virtio-9p.h b/hw/9pfs/virtio-9p.h
index 20fa118f3a..eb7d1293cb 100644
--- a/hw/9pfs/virtio-9p.h
+++ b/hw/9pfs/virtio-9p.h
@@ -17,4 +17,6 @@ struct V9fsVirtioState {
 #define TYPE_VIRTIO_9P "virtio-9p-device"
 OBJECT_DECLARE_SIMPLE_TYPE(V9fsVirtioState, VIRTIO_9P)
 
+void assert_thread(void);
+
 #endif


----

Output:

Unexpected thread id 10780 (should be 10754) - process id is 10754
qemu-system-x86_64: ../hw/9pfs/virtio-9p-device.c:43: assert_thread: Assertion 
`tid == main_thread_id' failed.
Aborted (core dumped)

So the initially captured thread ID 10754 at process startup matches the 
process ID, hence 10754 was the main thread, and hence the assertion was 
triggered on a thread that was not main thread.

Backtrace:

Program terminated with signal SIGABRT, Aborted.
#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
[Current thread is 1 (Thread 0x7fb4637fe700 (LWP 10780))]
(gdb) bt
#0  0x00007fb7ac6d87bb in __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/
sysv/linux/raise.c:50
#1  0x00007fb7ac6c3535 in __GI_abort () at abort.c:79
#2  0x00007fb7ac6c340f in __assert_fail_base
    (fmt=0x7fb7ac825ee0 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", 
assertion=0x562e6126072f "tid == main_thread_id", file=0x562e612606fc "../hw/2
#3  0x00007fb7ac6d1102 in __GI___assert_fail
    (assertion=assertion@entry=0x562e6126072f "tid == main_thread_id", 
file=file@entry=0x562e612606fc "../hw/9pfs/virtio-9p-device.c", line=line@e1
#4  0x0000562e60ef3965 in assert_thread () at ../hw/9pfs/virtio-9p-device.c:43
#5  0x0000562e60ef3965 in assert_thread () at ../hw/9pfs/virtio-9p-device.c:35
#6  0x0000562e60cef125 in v9fs_walk (opaque=0x562e6405c288) at ../hw/9pfs/
9p.c:1821
#7  0x0000562e6114f79b in coroutine_trampoline (i0=<optimized out>, 
i1=<optimized out>) at ../util/coroutine-ucontext.c:173
#8  0x00007fb7ac6edb50 in __correctly_grouped_prefixwc
    (begin=0x2 <error: Cannot access memory at address 0x2>, end=0x0, 
thousands=0 L'\000', grouping=0x7fb7ac6d87bb <__GI_raise+267> "H\213\214$\b\1
#9  0x0000000000000000 in  ()

And 9p.c:1821 is exactly:

    assert_thread();
    v9fs_co_run_in_worker({
        if (v9fs_request_cancelled(pdu)) {
            err = -EINTR;
            break;
        }
        err = s->ops->lstat(&s->ctx, &dpath, &fidst);
        if (err < 0) {
            err = -errno;
            break;
        }
        stbuf = fidst;
        for (name_idx = 0; name_idx < nwnames; name_idx++) {
            if (v9fs_request_cancelled(pdu)) {
                err = -EINTR;
                break;
            }
            if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
                strcmp("..", wnames[name_idx].data))
            {
                err = s->ops->name_to_path(&s->ctx, &dpath,
                                        wnames[name_idx].data, &path);
                if (err < 0) {
                    err = -errno;
                    break;
                }
                if (v9fs_request_cancelled(pdu)) {
                    err = -EINTR;
                    break;
                }
                err = s->ops->lstat(&s->ctx, &path, &stbuf);
                if (err < 0) {
                    err = -errno;
                    break;
                }
                stbufs[name_idx] = stbuf;
                v9fs_path_copy(&dpath, &path);
                v9fs_path_copy(&pathes[name_idx], &path);
            }
        }
    });
    assert_thread(); //<--- HERE

> > > > [Current thread is 1 (Thread 0x7f3bddd2ac40 (LWP 7811))]
> > > > (gdb) bt full
> > > > #0  0x000055a934dfb9a7 in virtio_pdu_vunmarshal (pdu=0x55a93717cde8,
> > > > offset=7, fmt=0x55a9352766d1 "ddw", ap=0x7f38a9ad9cd0) at
> > > > ../hw/9pfs/virtio-9p-device.c: 146
> > > > 
> > > >         s = 0x55a93717b4b8
> > > >         v = 0x55a93717aee0
> > > >         elem = 0x0
> > > 
> > > So this is v->elems[pdu->idx]... what's the value of pdu->idx ?
> > 
> > In that originally posted core dump it was 113:
> > 
> > #0  virtio_pdu_vunmarshal (pdu=0x55a93717cde8, offset=7,
> > fmt=0x55a9352766d1
> > "ddw", ap=0x7f38a9ad9cd0) at ../hw/9pfs/virtio-9p-device.c:146
> > 146         ret = v9fs_iov_vunmarshal(elem->out_sg, elem->out_num, offset,
> > 1, fmt, ap);
> > [Current thread is 1 (Thread 0x7f3bddd2ac40 (LWP 7811))]
> > (gdb) p pdu->idx
> > $1 = 113
> 
> Ok, so it is a valid index (not over MAX_REQ). So it would mean
> that someone cleared the slot in our back ?

Yes, the slot is within valid boundaries. Assertion checks for that in 
virtio-9p-device.c in future wouldn't hurt though.

Best regards,
Christian Schoenebeck



