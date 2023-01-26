Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DEE67C3D0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:20:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKtj6-00055k-0f; Wed, 25 Jan 2023 23:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKtj3-00055K-Tn
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:19:01 -0500
Received: from esa12.hc2706-39.iphmx.com ([216.71.137.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKtj0-0003Z8-DN
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:19:01 -0500
X-IronPort-RemoteIP: 209.85.160.200
X-IronPort-MID: 254323623
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VydCi6JZ3+z+ouz7FE+Rb5clxSXFcZb7ZxGr2PjKsXjdYENShTBRz
 mIfC23XaPyDYzekftF2a4S09hwA6sCEm4Q3SgtorCE8RH908vbIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOOn9Twkj/rgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8rWo4ow/jb8kg35a6s4GpwUmEWPpingnePzxH5M7pCfcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aue60Tqm0xK6aID76vR2nRHe545gXBYqhea7vB3S9zx54
 I0lWZVd0m7FNIWV8AgWe0Aw/y2TocSqUVIISJSymZX78qHIT5fj69tyDlwuGKsjxsxUJDxW1
 qBEGgkLVw/W0opawJrjIgVtrsEqLc2uJZ9G/386lWmfAvEhTpTOBa7N4Le03h9q3pEITauYP
 pRBL2A3NHwsYDUWUrsTIJs6jOGknFH1bntVpE/9Sa8fuTWPl1YqjuK2WDbTUt+zau5vsn+gm
 kPXz03cUkhZLP+QzTXQpxpAgceKx0sXQrk6DbC967tmjUOewkQVDxsZU0b9puO24nNSQPpaI
 k0QvzMy9O08rhTzCNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBfJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:7kGddKPsFbsD38BcThejsMiBIKoaSvp037Dk7TEXdfVwSL3kqy
 nOpoVg6faQslwssR4b6LK90cW7MBbhHNtOkPUs1NSZLXLbUQmTXfhfBOLZqlWKak7DH6xmpN
 9dmsBFaOEYZmIK6/oSjjPId+oI8Z2s3Jrtq93j70pAeylXVoAI1XYHNu9ZKCFLrct9aKbR2K
 Dz2iOPnVXARUgq
Received: from mail-qt1-f200.google.com ([209.85.160.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jan 2023 23:18:53 -0500
Received: by mail-qt1-f200.google.com with SMTP id
 cn7-20020a05622a248700b003b7f2a89829so307325qtb.6
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n3jAuGfcRVyZ64cbD6dmc2V7mL6ZeVbAgsAGjD9ba74=;
 b=XwX4yqg+J0JEzvJ29Hsb6jBgG2sh4sOgNahC4Sk8aDS0vkKaAmma/2lfpkJH0Hy3hA
 plDO3KqatdrDmXN+nNrPMLWQlk/aIFEpOj29Sn7zUu/Qlry7VFa8N/IvLL/UL8/e28Sy
 v8SMWRKaIPButgHoQCCQJhqUyzhJAlfu1PFDzyUO2w0qwqLFgLwdF346h+6435i4s3b4
 fZBfVuW6DXYFun3sPJPG/vqw+C2JMLoiOu2F0fZsHKjLDjGbOvQlbg/G4S5MEzTR8Y+F
 m7hw9D+QZMZX6opzSlJSFh4zWRpW5K8yW+7o5eVSiHy+quk3KYlqn7diH01HUqHw2D/w
 faIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n3jAuGfcRVyZ64cbD6dmc2V7mL6ZeVbAgsAGjD9ba74=;
 b=iJ+v55awkeKeVBTO1cDuuH941WlJmt65ETc+rT8o42CNuScYiBQexOgVHhYZTNzNms
 Xv8JPHszX7jkKDYnL5i3t9A38Zu8+pxkb8Daio82KI1LoTNVzEVa30ZzB1GSy5St36Eh
 YtOdonF4I0Xe2uzTqDnsFU5MF49TthNjgUfKlpOb7JVLl2M8wvD9tkp0tXKhwcL9F2Hl
 6CdvoDHMFDDGNx/eXx8ZNzY0S63FC4K+oQJyYXubytPWptKEy5Sw6hbw+ILciOS/3Nfx
 c5f6hHidTLCYCJjrUimYnIRLUc3qW5TqOKh7SirU710EsPkxguxJpTXlfhOIBjDf4FgA
 5rVw==
X-Gm-Message-State: AFqh2kpjGXM0bfOIor32E0i5ckLrHazBaneONet4w3UytEeOygcincBe
 //c3nY2Q+PI3fEYd6QHM9qCraK3S8BdrBqaH/sFUsI/UQC50Cdlt819b3UC0g+SMHPRRegVEbjV
 PjAFM8f3HsRiS74YlaPfdoK9fS5dt/A==
X-Received: by 2002:ac8:7ed7:0:b0:3b6:3260:fa1d with SMTP id
 x23-20020ac87ed7000000b003b63260fa1dmr49950347qtj.45.1674706732857; 
 Wed, 25 Jan 2023 20:18:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsQyranx81B2g4BAC2E7P+B3Jm85oU0rh+DFdSpYZbgJb/wXMvmiRwOv4NLb8q1lontU/v4Zg==
X-Received: by 2002:ac8:7ed7:0:b0:3b6:3260:fa1d with SMTP id
 x23-20020ac87ed7000000b003b63260fa1dmr49950312qtj.45.1674706732431; 
 Wed, 25 Jan 2023 20:18:52 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 f8-20020ac84648000000b003b6464eda40sm85569qto.25.2023.01.25.20.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:18:51 -0800 (PST)
Date: Wed, 25 Jan 2023 23:18:45 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>
Subject: Re: [PATCH v4 2/3] async: Add an optional reentrancy guard to the BH
 API
Message-ID: <20230126041845.6oasqvrpj2ltgto4@mozz.bu.edu>
References: <20230119070308.321653-1-alxndr@bu.edu>
 <20230119070308.321653-3-alxndr@bu.edu> <Y9Gd/BDwNXeElTNR@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9Gd/BDwNXeElTNR@fedora>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.82; envelope-from=alxndr@bu.edu;
 helo=esa12.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
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

On 230125 1624, Stefan Hajnoczi wrote:
> On Thu, Jan 19, 2023 at 02:03:07AM -0500, Alexander Bulekov wrote:
> > Devices can pass their MemoryReentrancyGuard (from their DeviceState),
> > when creating new BHes. Then, the async API will toggle the guard
> > before/after calling the BH call-back. This prevents bh->mmio reentrancy
> > issues.
> > 
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >  docs/devel/multiple-iothreads.txt |  2 ++
> >  include/block/aio.h               | 18 ++++++++++++++++--
> >  include/qemu/main-loop.h          |  7 +++++--
> >  tests/unit/ptimer-test-stubs.c    |  3 ++-
> >  util/async.c                      | 12 +++++++++++-
> >  util/main-loop.c                  |  5 +++--
> >  6 files changed, 39 insertions(+), 8 deletions(-)
> > 
> > diff --git a/docs/devel/multiple-iothreads.txt b/docs/devel/multiple-iothreads.txt
> > index 343120f2ef..e4fafed9d9 100644
> > --- a/docs/devel/multiple-iothreads.txt
> > +++ b/docs/devel/multiple-iothreads.txt
> > @@ -61,6 +61,7 @@ There are several old APIs that use the main loop AioContext:
> >   * LEGACY qemu_aio_set_event_notifier() - monitor an event notifier
> >   * LEGACY timer_new_ms() - create a timer
> >   * LEGACY qemu_bh_new() - create a BH
> > + * LEGACY qemu_bh_new_guarded() - create a BH with a device re-entrancy guard
> >   * LEGACY qemu_aio_wait() - run an event loop iteration
> >  
> >  Since they implicitly work on the main loop they cannot be used in code that
> > @@ -72,6 +73,7 @@ Instead, use the AioContext functions directly (see include/block/aio.h):
> >   * aio_set_event_notifier() - monitor an event notifier
> >   * aio_timer_new() - create a timer
> >   * aio_bh_new() - create a BH
> > + * aio_bh_new_guarded() - create a BH with a device re-entrancy guard
> >   * aio_poll() - run an event loop iteration
> >  
> >  The AioContext can be obtained from the IOThread using
> > diff --git a/include/block/aio.h b/include/block/aio.h
> > index 0f65a3cc9e..94d661ff7e 100644
> > --- a/include/block/aio.h
> > +++ b/include/block/aio.h
> > @@ -23,6 +23,8 @@
> >  #include "qemu/thread.h"
> >  #include "qemu/timer.h"
> >  #include "block/graph-lock.h"
> > +#include "hw/qdev-core.h"
> > +
> >  
> >  typedef struct BlockAIOCB BlockAIOCB;
> >  typedef void BlockCompletionFunc(void *opaque, int ret);
> > @@ -332,9 +334,11 @@ void aio_bh_schedule_oneshot_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
> >   * is opaque and must be allocated prior to its use.
> >   *
> >   * @name: A human-readable identifier for debugging purposes.
> > + * @reentrancy_guard: A guard set when entering a cb to prevent
> > + * device-reentrancy issues
> >   */
> >  QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
> > -                        const char *name);
> > +                        const char *name, MemReentrancyGuard *reentrancy_guard);
> >  
> >  /**
> >   * aio_bh_new: Allocate a new bottom half structure
> > @@ -343,7 +347,17 @@ QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
> >   * string.
> >   */
> >  #define aio_bh_new(ctx, cb, opaque) \
> > -    aio_bh_new_full((ctx), (cb), (opaque), (stringify(cb)))
> > +    aio_bh_new_full((ctx), (cb), (opaque), (stringify(cb)), NULL)
> > +
> > +/**
> > + * aio_bh_new_guarded: Allocate a new bottom half structure with a
> > + * reentrancy_guard
> > + *
> > + * A convenience wrapper for aio_bh_new_full() that uses the cb as the name
> > + * string.
> > + */
> > +#define aio_bh_new_guarded(ctx, cb, opaque, guard) \
> > +    aio_bh_new_full((ctx), (cb), (opaque), (stringify(cb)), guard)
> >  
> >  /**
> >   * aio_notify: Force processing of pending events.
> > diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> > index c25f390696..84d1ce57f0 100644
> > --- a/include/qemu/main-loop.h
> > +++ b/include/qemu/main-loop.h
> > @@ -389,9 +389,12 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, int ms);
> >  
> >  void qemu_fd_register(int fd);
> >  
> > +#define qemu_bh_new_guarded(cb, opaque, guard) \
> > +    qemu_bh_new_full((cb), (opaque), (stringify(cb)), guard)
> >  #define qemu_bh_new(cb, opaque) \
> > -    qemu_bh_new_full((cb), (opaque), (stringify(cb)))
> > -QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name);
> > +    qemu_bh_new_full((cb), (opaque), (stringify(cb)), NULL)
> > +QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name,
> > +                         MemReentrancyGuard *reentrancy_guard);
> >  void qemu_bh_schedule_idle(QEMUBH *bh);
> >  
> >  enum {
> > diff --git a/tests/unit/ptimer-test-stubs.c b/tests/unit/ptimer-test-stubs.c
> > index f5e75a96b6..24d5413f9d 100644
> > --- a/tests/unit/ptimer-test-stubs.c
> > +++ b/tests/unit/ptimer-test-stubs.c
> > @@ -107,7 +107,8 @@ int64_t qemu_clock_deadline_ns_all(QEMUClockType type, int attr_mask)
> >      return deadline;
> >  }
> >  
> > -QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name)
> > +QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name,
> > +                         MemReentrancyGuard *reentrancy_guard)
> >  {
> >      QEMUBH *bh = g_new(QEMUBH, 1);
> >  
> > diff --git a/util/async.c b/util/async.c
> > index 14d63b3091..08924c3212 100644
> > --- a/util/async.c
> > +++ b/util/async.c
> > @@ -65,6 +65,7 @@ struct QEMUBH {
> >      void *opaque;
> >      QSLIST_ENTRY(QEMUBH) next;
> >      unsigned flags;
> > +    MemReentrancyGuard *reentrancy_guard;
> >  };
> >  
> >  /* Called concurrently from any thread */
> > @@ -133,7 +134,7 @@ void aio_bh_schedule_oneshot_full(AioContext *ctx, QEMUBHFunc *cb,
> >  }
> >  
> >  QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
> > -                        const char *name)
> > +                        const char *name, MemReentrancyGuard *reentrancy_guard)
> >  {
> >      QEMUBH *bh;
> >      bh = g_new(QEMUBH, 1);
> > @@ -142,13 +143,22 @@ QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
> >          .cb = cb,
> >          .opaque = opaque,
> >          .name = name,
> > +        .reentrancy_guard = reentrancy_guard,
> >      };
> >      return bh;
> >  }
> >  
> >  void aio_bh_call(QEMUBH *bh)
> >  {
> > +    if (bh->reentrancy_guard) {
> > +        bh->reentrancy_guard->engaged_in_io = true;
> > +    }
> > +
> >      bh->cb(bh->opaque);
> > +
> > +    if (bh->reentrancy_guard) {
> > +        bh->reentrancy_guard->engaged_in_io = false;
> > +    }
> >  }
> 
> QEMU supports nested event loops. I think aio_bh_call() -> cb() ->
> aio_poll() -> aio_bh_call() -> ... is possible although it should be
> rare.
> 

Maybe 9p's v9fs_co_run_in_worker is an example of that, though I'm not
sure. That was one of the calls to qemu_bh_new that I could not find
a straightforward way to refactor..

> ->engaged_in_io will set to false after the innermost aio_bh_call()
> returns. Therefore the protection doesn't cover the remainder of the
> parent cb() functions.
> 
> I think aio_bh_call() should be:
> 
>   void aio_bh_call(QEMUBH *bh)
>   {
>       bool last_engaged_in_io = false;
> 
>       if (bh->reentrancy_guard) {
>           last_engaged_in_io = bh->reentrancy_guard->engaged_in_io;
>           bh->reentrancy_guard->engaged_in_io = true;
>       }
> 
>       bh->cb(bh->opaque);
> 
>       if (bh->reentrancy_guard) {
>           bh->reentrancy_guard->engaged_in_io = last_engaged_in_io;
>       }
>   }
> 
> That way nested aio_poll() calls work as expected.
> 
> This also raises the question whether aio_bh_call() should call abort(3)
> if ->engaged_in_io is already true when the function is entered? I think
> that may be too strict, but I'm not sure. A scenario where this can
> happen:
> 
> The memory region read/write function calls aio_poll() -> aio_bh_call()
> and a BH with our device's re-entrancy guard is executed.
> 

Is this sort of "bh reentrancy" only likely through a deliberate
design-decision by the code author? If so then, maybe it doesn't need to
be treated with the same severity as the memory-reentrancy case. I'll
add a tracepoint in the next version.
Thanks
-Alex

> >  
> >  /* Multiple occurrences of aio_bh_poll cannot be called concurrently. */
> > diff --git a/util/main-loop.c b/util/main-loop.c
> > index 58f776a8c9..07d2e2040a 100644
> > --- a/util/main-loop.c
> > +++ b/util/main-loop.c
> > @@ -617,9 +617,10 @@ void main_loop_wait(int nonblocking)
> >  
> >  /* Functions to operate on the main QEMU AioContext.  */
> >  
> > -QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name)
> > +QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name, MemReentrancyGuard *reentrancy_guard)
> >  {
> > -    return aio_bh_new_full(qemu_aio_context, cb, opaque, name);
> > +    return aio_bh_new_full(qemu_aio_context, cb, opaque, name,
> > +                           reentrancy_guard);
> >  }
> >  
> >  /*
> > -- 
> > 2.39.0
> > 



