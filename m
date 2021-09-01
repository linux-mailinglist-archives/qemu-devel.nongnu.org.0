Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4E93FDDBF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:22:17 +0200 (CEST)
Received: from localhost ([::1]:49358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLR83-0002ye-V5
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mLR71-0002KB-Td
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:21:11 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:55669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mLR6z-0002jW-Ux
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=dBBmTjmovBNdkorovXN4QGRQqy578ZWBi/tll03/IKE=; b=eCaZTFw2IIf3hxNcsTV82+16Fl
 qf0usT1k4rXcQgNveGweEdKlmi/1nfgISNMpGbcmoDUvNo/PMmzw+gbL4x40ckl+VZvytdNdXuZf3
 T4I1dzVxwWt3qzYh3WdhLzm/fpmExBdOCFxhf1m4DYlUZcnh/m4Xi0JY1OwtT0wVgIio6iHaLAFSa
 llGy/TaVywBEESFizR5ZD2Qoq6tlnq5NbBH9GV3LhY2UHVvsHZF+/N2Fl/1mo350p5boe7nXg2336
 3b3Odb+PTeNqHW5ieX9UcKs0JA2Y1LzSQuDQwfqgsRjkgYaZxD33aOBwd71tsMFv1XD7W83NvpnOT
 60gZ77+RPAatRDtWCZi7T0n3w/TNsguppofJDVnaLllDRXI5lSl8tU8T608qSMh/GTEwTUB863yhD
 NAv/urc/2hVf/KMUhNm9+A8yaCeETImlWDCr2bAk8VO4ZfuNZGfc1LPcu4IBicb5fmMpvB2BNX/Nd
 aWw/5l5I6EBMTyYY3mDwIHnYyOgG4VRilIqBbEjPw4KaME5KN9hX07SA90329LBhJaevc1+Yg66E2
 lHk3Ph7ur45UVE+pMDfEx3lqB0ZkL36atn11s0CSWjIvKHJN+3OBgrJqycJ4cFYvR0wfvlOUtl7yp
 s1BekWhXC9upTxQRCcoIAM7sHGNuvBIto1Kip4vRo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: 9pfs: Twalk crash
Date: Wed, 01 Sep 2021 16:21:06 +0200
Message-ID: <1825588.ABy5TKrSrS@silver>
In-Reply-To: <37058587.QroWqLRJlK@silver>
References: <4325838.qn0ATYcOi1@silver> <20210831190454.5c725f2b@bahia.lan>
 <37058587.QroWqLRJlK@silver>
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

On Mittwoch, 1. September 2021 14:49:37 CEST Christian Schoenebeck wrote:
> > > And it triggered, however I am not sure if some of those functions I
> > > asserted above are indeed allowed to be executed on a different thread
> > > than main thread:
> > > 
> > > Program terminated with signal SIGABRT, Aborted.
> > > #0  __GI_raise (sig=sig@entry=6) at
> > > ../sysdeps/unix/sysv/linux/raise.c:50
> > > 50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
> > > [Current thread is 1 (Thread 0x7fd0bcef1700 (LWP 6470))]
> > 
> > Based in the thread number, it seems that the signal was raised by
> > the main event thread...
> 
> No, it was not main thread actually, gdb's "current thread is 1" output is
> misleading.
> 
> Following the thread id trace, I extended the thread assertion checks over
> to v9fs_walk() as well, like this:
> 
> static void coroutine_fn v9fs_walk(void *opaque)
> {
>     ...
>     assert_thread();
>     v9fs_co_run_in_worker({
>         ...
>     });
>     assert_thread();
>     ...
> }
> 
> and made sure the reference thread id to be compared is really the main
> thread.
> 
> And what happens here is before v9fs_co_run_in_worker() is entered,
> v9fs_walk() runs on main thread, but after returning from
> v9fs_co_run_in_worker() it runs on a different thread for some reason, not
> on main thread as it would be expected at that point.

Ok, I think I found the root cause: the block is break;-ing out too far. The 
following patch should fix it:

diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
index c51289903d..f83c7dda7b 100644
--- a/hw/9pfs/coth.h
+++ b/hw/9pfs/coth.h
@@ -51,7 +51,9 @@
          */                                                             \
         qemu_coroutine_yield();                                         \
         qemu_bh_delete(co_bh);                                          \
-        code_block;                                                     \
+        do {                                                            \
+            code_block;                                                 \
+        } while (0);                                                    \
         /* re-enter back to qemu thread */                              \
         qemu_coroutine_yield();                                         \
     } while (0)

I haven't triggered a crash with that patch, but due to the occasional nature 
of this issue I'll give it some more spins before officially proclaiming it my 
bug. :)

Best regards,
Christian Schoenebeck



