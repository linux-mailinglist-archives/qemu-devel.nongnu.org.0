Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9923FE05A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:50:25 +0200 (CEST)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTRQ-0002w7-92
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mLSmB-00079A-Tu
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:07:47 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:41265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mLSm7-0002NK-44
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=KszCyhzXzax42Em7vDTDHcWhZnZ/VdIj/wnbOVIJjO0=; b=IIG+6KLXW9HVhIAbprr3Wd4+23
 v5vTuI0CVb4slniQyBycc6YeNkGbWjKUFOSw6RdbJKA5TGatA9EBgDIVoOI3Qq54JBlNX2fmQ+Vt+
 jfzV37kxL6WsQQYPFwUKyLgzYTSx48ESPaEOwo/cCZIu08uk5IzJmQTumMnbRWC3mPpblPvMxoE3s
 dy82MWpBm480hDfT/0QE9P5b05NGqg+h2zD0srcMQYOTeMIPzhkvkbU0xSmRKRbwNjvuijsgwuq7V
 vvsrBEXTzbCsprzgsRzHFndy1GItbCCgavMDbgGbvwJtg/dfvJH078yC4ZeW5xsrqLFH8Z34dfV+V
 2+6GUvNl9fAp2r7ffh1H4CwvYz4hhJJJnwvBhT+TZUUCA/KyNIYFtoJcqrwyTHrP4osh+HFYvNIIu
 97AwtikJ6W+hWonoHuI5NCPjxG0x/HyRStXJBSVKhAHEtFDTvcNcOJXwIbrySKtYXlsvyjo4aaAmn
 f/Xq9MefI0IVY4jNQ8izFbo+JVvw4Am1NHXRz0kXOVm+lRADgcPHvXhYadFKjNM7Y8QbxdXA+5HpW
 Jg5EQk0kFdfyj21v0OixvpuISqsLBUz4UMxsL25vkKOGWdeAgmZAD9/uFn+fEE1ozhKSZVhVBV7lt
 FUizMAowyv7UKFlZJfDQ8zdzyu6zSp/DZIQ4USJD8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org
Subject: Re: 9pfs: Twalk crash
Date: Wed, 01 Sep 2021 18:07:39 +0200
Message-ID: <3500709.Usqnbg2EYA@silver>
In-Reply-To: <20210901174102.715b3169@bahia.lan>
References: <4325838.qn0ATYcOi1@silver> <1825588.ABy5TKrSrS@silver>
 <20210901174102.715b3169@bahia.lan>
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

On Mittwoch, 1. September 2021 17:41:02 CEST Greg Kurz wrote:
> On Wed, 01 Sep 2021 16:21:06 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Mittwoch, 1. September 2021 14:49:37 CEST Christian Schoenebeck wrote:
> > > > > And it triggered, however I am not sure if some of those functions I
> > > > > asserted above are indeed allowed to be executed on a different
> > > > > thread
> > > > > than main thread:
> > > > > 
> > > > > Program terminated with signal SIGABRT, Aborted.
> > > > > #0  __GI_raise (sig=sig@entry=6) at
> > > > > ../sysdeps/unix/sysv/linux/raise.c:50
> > > > > 50      ../sysdeps/unix/sysv/linux/raise.c: No such file or
> > > > > directory.
> > > > > [Current thread is 1 (Thread 0x7fd0bcef1700 (LWP 6470))]
> > > > 
> > > > Based in the thread number, it seems that the signal was raised by
> > > > the main event thread...
> > > 
> > > No, it was not main thread actually, gdb's "current thread is 1" output
> > > is
> > > misleading.
> > > 
> > > Following the thread id trace, I extended the thread assertion checks
> > > over
> > > to v9fs_walk() as well, like this:
> > > 
> > > static void coroutine_fn v9fs_walk(void *opaque)
> > > {
> > > 
> > >     ...
> > >     assert_thread();
> > >     v9fs_co_run_in_worker({
> > >     
> > >         ...
> > >     
> > >     });
> > >     assert_thread();
> > >     ...
> > > 
> > > }
> > > 
> > > and made sure the reference thread id to be compared is really the main
> > > thread.
> > > 
> > > And what happens here is before v9fs_co_run_in_worker() is entered,
> > > v9fs_walk() runs on main thread, but after returning from
> > > v9fs_co_run_in_worker() it runs on a different thread for some reason,
> > > not
> > > on main thread as it would be expected at that point.
> > 
> > Ok, I think I found the root cause: the block is break;-ing out too far.
> > The
> That could explain the breakage indeed since the block you've added
> to v9fs_walk() embeds a bunch of break statements. AFAICT this block
> breaks on errors... do you know which one ?

Yes, I've verified that. In my case an interrupt of Twalk triggered this bug. 
so it was this path exactly:

    v9fs_co_run_in_worker({
        if (v9fs_request_cancelled(pdu)) {
            ...
            break;
        }
        ...
    });

so it was really this break;-ing too far being the root cause of the crash.

> > following patch should fix it:
> > 
> > diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
> > index c51289903d..f83c7dda7b 100644
> > --- a/hw/9pfs/coth.h
> > +++ b/hw/9pfs/coth.h
> > @@ -51,7 +51,9 @@
> > 
> >           */                                                             \
> >          
> >          qemu_coroutine_yield();                                         \
> >          qemu_bh_delete(co_bh);                                          \
> > 
> > -        code_block;                                                     \
> > +        do {                                                            \
> > +            code_block;                                                 \
> > +        } while (0);                                                    \
> 
> Good.
> 
> >          /* re-enter back to qemu thread */                              \
> >          qemu_coroutine_yield();                                         \
> >      
> >      } while (0)
> > 
> > I haven't triggered a crash with that patch, but due to the occasional
> > nature of this issue I'll give it some more spins before officially
> > proclaiming it my bug. :)
> 
> Well, this is a pre-existing limitation with v9fs_co_run_in_worker().
> This wasn't documented as such and not really obvious to detect when
> you optimized TWALK. We've never hit it before because the other
> v9fs_co_run_in_worker() users don't have break statements.

Yes, I know, this was my bad.

> But, indeed, this caused a regression in 6.1 so this will need a Fixes:
> tag and Cc: qemu-stable.

Yep, I'm preparing a patch now.

Best regards,
Christian Schoenebeck



