Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A673465228F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:28:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dau-0005RN-Rb; Tue, 20 Dec 2022 09:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p7daj-0005Pl-JN
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:27:37 -0500
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p7dag-0007Wa-C3
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:27:37 -0500
Received: by mail-qk1-x734.google.com with SMTP id k2so5318597qkk.7
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:user-agent:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=8AGhFFY9zDkGgil2gcOvSQWdEDnQQaJstOyF8+WSV8g=;
 b=SoIt5/C297D3RfEcTVqpX/aOB2ZveS42vyxLkkbsAWHV3Ke9ddeXeoh33sfurfdLy2
 MC0jAenbdtb+QFO1k3RHwxkEZFAnkdM0NbEDwvmkHxI5fMN1o7kxUDXn8iF7/YtyNG/2
 09h96NhtbK7mM/g+WYF7cKFbi2h9Ojwy2b0sQuydsqZZuA1oEM5/mFXT4UPjU+fE2l1+
 ioerAy0NAYV+h/7Y+F/8Y9cUF8cMOGHtLYVaVIdvFMbWcChf6bLn0uYRC9IjBJsC0l+5
 3IYJwe9avtpPzeGOmeSz6/5u1EP6UbA5Qyj0NAOjM9+c4CBEWipGXSUUrPoYORbHJmOb
 S8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:user-agent:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8AGhFFY9zDkGgil2gcOvSQWdEDnQQaJstOyF8+WSV8g=;
 b=rAwHGWTDmkb3nM397NRRmmKmd5luUSjpuCHz30LIjW1yx2Izr7ffGVRWjl0cfUXWoP
 RS0GtiLmQbJHusHAS+5lq7EB7Z0q4ZxWfZpZmzz2y/D6kvlk/TM4DfLORms+HA0glqi5
 QU5XjH7vRo2FAQLN2ghgzk+tMD6C6nxOTvc2nzdsqY3vNPmzOghpEayH+/CzgdoIv6c9
 YYZWABXs6FbOrx+UFdx6VIFgjKjpMYOPd7gUi8OcU36SyIpp8LZlIyE1T1RCeDXNqQh0
 TWMTgonOuX8+po/jdwWKdPbilD+qGKg0CmCZXlQnzTvSvKJAQimemdYHWA7A/07NYKQ/
 69Bw==
X-Gm-Message-State: ANoB5pkbL8TUtXcmdR6uAFBDTif4aVZN+uwE8b4Xanh/YBIfIPBnRgCv
 gbvSsDEFs3X2xeRGweTFuRvaYAYSSFUPwBJJgv0CAA==
X-Google-Smtp-Source: AA0mqf6Z7N8fi2eUZhJ3nQUY8eioSOiFsL98CedKXP5XpW+tg4Naz0OXu7NLye7DBZbUxjCVbdoPoY4RVAXn3rfKpbo=
X-Received: by 2002:ae9:c202:0:b0:6fc:9712:2121 with SMTP id
 j2-20020ae9c202000000b006fc97122121mr34541222qkg.762.1671546447973; Tue, 20
 Dec 2022 06:27:27 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Tue, 20 Dec 2022 06:27:27 -0800
Mime-Version: 1.0
In-Reply-To: <Y5tFkJpo0abKBc4U@x1n>
References: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
 <20221213133510.1279488-2-xuchuangxclwt@bytedance.com>
 <CALophuvwZHsqfTo=vshQawO+hPs6rkfHVDFZuukmaf_s+TGqJA@mail.gmail.com>
 <Y5pCbClzAz/BFDVE@x1n> <Y5tFkJpo0abKBc4U@x1n>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
From: Chuang Xu <xuchuangxclwt@bytedance.com>
Date: Tue, 20 Dec 2022 06:27:27 -0800
Message-ID: <CALophuuzk9BRZXKu19SLYVKW7BdV=_7_8pXAQ9wV9jC6YX5FLg@mail.gmail.com>
Subject: Re: [RFC v3 1/3] memory: add depth assert in address_space_to_flatview
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com, 
 david@redhat.com, f4bug@amsat.org, zhouyibo@bytedance.com, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004200a705f0433c47"
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_MUA_MOZILLA=2.309, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=1,
 HK_RANDOM_FROM=0.999, HTML_MESSAGE=0.001, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000004200a705f0433c47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2022/12/16 =E4=B8=8A=E5=8D=8812:04, Peter Xu wrote:

On Wed, Dec 14, 2022 at 04:38:52PM -0500, Peter Xu wrote:

On Wed, Dec 14, 2022 at 08:03:38AM -0800, Chuang Xu wrote:

On 2022/12/13 =E4=B8=8B=E5=8D=889:35, Chuang Xu wrote:

Before using any flatview, sanity check we're not during a memory
region transaction or the map can be invalid.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
<xuchuangxclwt@bytedance.com><xuchuangxclwt@bytedance.com>
<xuchuangxclwt@bytedance.com>
---
 include/exec/memory.h | 9 +++++++++
 softmmu/memory.c      | 1 -
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..b43cd46084 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1069,8 +1069,17 @@ struct FlatView {
     MemoryRegion *root;
 };

+static unsigned memory_region_transaction_depth;
+
 static inline FlatView *address_space_to_flatview(AddressSpace *as)
 {
+    /*
+     * Before using any flatview, sanity check we're not during a memory
+     * region transaction or the map can be invalid.  Note that this can
+     * also be called during commit phase of memory transaction, but that
+     * should also only happen when the depth decreases to 0 first.
+     */
+    assert(memory_region_transaction_depth =3D=3D 0);
     return qatomic_rcu_read(&as->current_map);
 }

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bc0be3f62c..f177c40cd8 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -37,7 +37,6 @@

 //#define DEBUG_UNASSIGNED

-static unsigned memory_region_transaction_depth;
 static bool memory_region_update_pending;
 static bool ioeventfd_update_pending;
 unsigned int global_dirty_tracking;

Here are some new situations to be synchronized.

I found that there is a probability to trigger assert in the QEMU startup p=
hase.

Here is the coredump backtrace:

#0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:=
50
#1  0x00007f7825e33535 in __GI_abort () at abort.c:79
#2  0x00007f7825e3340f in __assert_fail_base (fmt=3D0x7f7825f94ef0
"%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=3D0x5653c643add8
"memory_region_transaction_depth =3D=3D 0",
    file=3D0x5653c63dad78
"/data00/migration/qemu-open/include/exec/memory.h", line=3D1082,
function=3D<optimized out>) at assert.c:92
#3  0x00007f7825e411a2 in __GI___assert_fail
(assertion=3Dassertion@entry=3D0x5653c643add8
"memory_region_transaction_depth =3D=3D 0",
    file=3Dfile@entry=3D0x5653c63dad78
"/data00/migration/qemu-open/include/exec/memory.h",
line=3Dline@entry=3D1082,
    function=3Dfunction@entry=3D0x5653c643bd00 <__PRETTY_FUNCTION__.18101>
"address_space_to_flatview") at assert.c:101
#4  0x00005653c60f0383 in address_space_to_flatview (as=3D0x5653c6af2340
<address_space_memory>) at
/data00/migration/qemu-open/include/exec/memory.h:1082
#5  address_space_to_flatview (as=3D0x5653c6af2340
<address_space_memory>) at
/data00/migration/qemu-open/include/exec/memory.h:1074
#6  address_space_get_flatview (as=3D0x5653c6af2340
<address_space_memory>) at ../softmmu/memory.c:809
#7  0x00005653c60fef04 in address_space_cache_init
(cache=3Dcache@entry=3D0x7f781fff8420, as=3D<optimized out>,
addr=3D63310635776, len=3D48, is_write=3Dis_write@entry=3Dfalse)
    at ../softmmu/physmem.c:3352
#8  0x00005653c60c08c5 in virtqueue_split_pop (vq=3D0x7f781c576270,
sz=3D264) at ../hw/virtio/virtio.c:1959
#9  0x00005653c60c0b7d in virtqueue_pop (vq=3Dvq@entry=3D0x7f781c576270,
sz=3D<optimized out>) at ../hw/virtio/virtio.c:2177
#10 0x00005653c609f14f in virtio_scsi_pop_req
(s=3Ds@entry=3D0x5653c9034300, vq=3Dvq@entry=3D0x7f781c576270) at
../hw/scsi/virtio-scsi.c:219
#11 0x00005653c60a04a3 in virtio_scsi_handle_cmd_vq
(vq=3D0x7f781c576270, s=3D0x5653c9034300) at ../hw/scsi/virtio-scsi.c:735
#12 virtio_scsi_handle_cmd (vdev=3D0x5653c9034300, vq=3D0x7f781c576270) at
../hw/scsi/virtio-scsi.c:776
#13 0x00005653c60ba72f in virtio_queue_notify_vq (vq=3D0x7f781c576270)
at ../hw/virtio/virtio.c:2847
#14 0x00005653c62d9706 in aio_dispatch_handler
(ctx=3Dctx@entry=3D0x5653c84909e0, node=3D0x7f68e4007840) at
../util/aio-posix.c:369
#15 0x00005653c62da254 in aio_dispatch_ready_handlers
(ready_list=3D0x7f781fffe6a8, ctx=3D0x5653c84909e0) at
../util/aio-posix.c:399
#16 aio_poll (ctx=3D0x5653c84909e0, blocking=3Dblocking@entry=3Dtrue) at
../util/aio-posix.c:713
#17 0x00005653c61b2296 in iothread_run
(opaque=3Dopaque@entry=3D0x5653c822c390) at ../iothread.c:67
#18 0x00005653c62dcd8a in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:505
#19 0x00007f7825fd8fa3 in start_thread (arg=3D<optimized out>) at
pthread_create.c:486
#20 0x00007f7825f0a06f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

This does look like a bug to me.

Paolo/Michael?

Hmm, I found that virtqueue_split_pop() took the rcu lock.. then I think
it's fine.

Chuang, I think what you can try next is add a helper to detect holding of
rcu lock, then assert with "depth=3D=3D0 || rcu_read_locked()".  I think th=
at's:

static inline bool rcu_read_locked(void)
{
    struct rcu_reader_data *p_rcu_reader =3D get_ptr_rcu_reader();

    return p_rcu_reader->depth > 0;
}

Then IIUC you can even drop patch 2 because virtio_load() also takes the
rcu lock.


Good idea! Later I'll try this way in my v4 patches.

Thanks very much!

--0000000000004200a705f0433c47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix"><div id=3D"lark-mail-quote-c00db2a4c9ad4=
c733e0880034eae10e0">On 2022/12/16 =E4=B8=8A=E5=8D=8812:04, Peter Xu wrote:=
<br>
    </div></div>
    <blockquote type=3D"cite" cite=3D"mid:Y5tFkJpo0abKBc4U@x1n">
      <pre class=3D"moz-quote-pre">On Wed, Dec 14, 2022 at 04:38:52PM -0500=
, Peter Xu wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre">On Wed, Dec 14, 2022 at 08:03:38AM -08=
00, Chuang Xu wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre">On 2022/12/13 =E4=B8=8B=E5=8D=889:35=
, Chuang Xu wrote:

Before using any flatview, sanity check we&#39;re not during a memory
region transaction or the map can be invalid.

Signed-off-by: Chuang Xu <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
xuchuangxclwt@bytedance.com">&lt;xuchuangxclwt@bytedance.com&gt;</a>
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:xuchuangxclwt@bytedance.c=
om">&lt;xuchuangxclwt@bytedance.com&gt;</a>
---
 include/exec/memory.h | 9 +++++++++
 softmmu/memory.c      | 1 -
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..b43cd46084 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1069,8 +1069,17 @@ struct FlatView {
     MemoryRegion *root;
 };

+static unsigned memory_region_transaction_depth;
+
 static inline FlatView *address_space_to_flatview(AddressSpace *as)
 {
+    /*
+     * Before using any flatview, sanity check we&#39;re not during a memo=
ry
+     * region transaction or the map can be invalid.  Note that this can
+     * also be called during commit phase of memory transaction, but that
+     * should also only happen when the depth decreases to 0 first.
+     */
+    assert(memory_region_transaction_depth =3D=3D 0);
     return qatomic_rcu_read(&amp;as-&gt;current_map);
 }

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bc0be3f62c..f177c40cd8 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -37,7 +37,6 @@

 //#define DEBUG_UNASSIGNED

-static unsigned memory_region_transaction_depth;
 static bool memory_region_update_pending;
 static bool ioeventfd_update_pending;
 unsigned int global_dirty_tracking;

Here are some new situations to be synchronized.

I found that there is a probability to trigger assert in the QEMU startup p=
hase.

Here is the coredump backtrace:

#0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:=
50
#1  0x00007f7825e33535 in __GI_abort () at abort.c:79
#2  0x00007f7825e3340f in __assert_fail_base (fmt=3D0x7f7825f94ef0
&quot;%s%s%s:%u: %s%sAssertion `%s&#39; failed.\n%n&quot;, assertion=3D0x56=
53c643add8
&quot;memory_region_transaction_depth =3D=3D 0&quot;,
    file=3D0x5653c63dad78
&quot;/data00/migration/qemu-open/include/exec/memory.h&quot;, line=3D1082,
function=3D&lt;optimized out&gt;) at assert.c:92
#3  0x00007f7825e411a2 in __GI___assert_fail
(assertion=3Dassertion@entry=3D0x5653c643add8
&quot;memory_region_transaction_depth =3D=3D 0&quot;,
    file=3Dfile@entry=3D0x5653c63dad78
&quot;/data00/migration/qemu-open/include/exec/memory.h&quot;,
line=3Dline@entry=3D1082,
    function=3Dfunction@entry=3D0x5653c643bd00 &lt;__PRETTY_FUNCTION__.1810=
1&gt;
&quot;address_space_to_flatview&quot;) at assert.c:101
#4  0x00005653c60f0383 in address_space_to_flatview (as=3D0x5653c6af2340
&lt;address_space_memory&gt;) at
/data00/migration/qemu-open/include/exec/memory.h:1082
#5  address_space_to_flatview (as=3D0x5653c6af2340
&lt;address_space_memory&gt;) at
/data00/migration/qemu-open/include/exec/memory.h:1074
#6  address_space_get_flatview (as=3D0x5653c6af2340
&lt;address_space_memory&gt;) at ../softmmu/memory.c:809
#7  0x00005653c60fef04 in address_space_cache_init
(cache=3Dcache@entry=3D0x7f781fff8420, as=3D&lt;optimized out&gt;,
addr=3D63310635776, len=3D48, is_write=3Dis_write@entry=3Dfalse)
    at ../softmmu/physmem.c:3352
#8  0x00005653c60c08c5 in virtqueue_split_pop (vq=3D0x7f781c576270,
sz=3D264) at ../hw/virtio/virtio.c:1959
#9  0x00005653c60c0b7d in virtqueue_pop (vq=3Dvq@entry=3D0x7f781c576270,
sz=3D&lt;optimized out&gt;) at ../hw/virtio/virtio.c:2177
#10 0x00005653c609f14f in virtio_scsi_pop_req
(s=3Ds@entry=3D0x5653c9034300, vq=3Dvq@entry=3D0x7f781c576270) at
../hw/scsi/virtio-scsi.c:219
#11 0x00005653c60a04a3 in virtio_scsi_handle_cmd_vq
(vq=3D0x7f781c576270, s=3D0x5653c9034300) at ../hw/scsi/virtio-scsi.c:735
#12 virtio_scsi_handle_cmd (vdev=3D0x5653c9034300, vq=3D0x7f781c576270) at
../hw/scsi/virtio-scsi.c:776
#13 0x00005653c60ba72f in virtio_queue_notify_vq (vq=3D0x7f781c576270)
at ../hw/virtio/virtio.c:2847
#14 0x00005653c62d9706 in aio_dispatch_handler
(ctx=3Dctx@entry=3D0x5653c84909e0, node=3D0x7f68e4007840) at
../util/aio-posix.c:369
#15 0x00005653c62da254 in aio_dispatch_ready_handlers
(ready_list=3D0x7f781fffe6a8, ctx=3D0x5653c84909e0) at
../util/aio-posix.c:399
#16 aio_poll (ctx=3D0x5653c84909e0, blocking=3Dblocking@entry=3Dtrue) at
../util/aio-posix.c:713
#17 0x00005653c61b2296 in iothread_run
(opaque=3Dopaque@entry=3D0x5653c822c390) at ../iothread.c:67
#18 0x00005653c62dcd8a in qemu_thread_start (args=3D&lt;optimized out&gt;) =
at
../util/qemu-thread-posix.c:505
#19 0x00007f7825fd8fa3 in start_thread (arg=3D&lt;optimized out&gt;) at
pthread_create.c:486
#20 0x00007f7825f0a06f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre">This does look like a bug to me.

Paolo/Michael?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre">Hmm, I found that virtqueue_split_pop() =
took the rcu lock.. then I think
it&#39;s fine.

Chuang, I think what you can try next is add a helper to detect holding of
rcu lock, then assert with &quot;depth=3D=3D0 || rcu_read_locked()&quot;.  =
I think that&#39;s:

static inline bool rcu_read_locked(void)
{
    struct rcu_reader_data *p_rcu_reader =3D get_ptr_rcu_reader();
   =20
    return p_rcu_reader-&gt;depth &gt; 0;
}

Then IIUC you can even drop patch 2 because virtio_load() also takes the
rcu lock.

</pre>
    </blockquote>
    <pre>Good idea! Later I&#39;ll try this way in my v4 patches.

Thanks very much!
</pre>
 =20
</body></html>

--0000000000004200a705f0433c47--

