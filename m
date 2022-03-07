Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6314D039C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:01:34 +0100 (CET)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRFne-0006Xr-Th
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:01:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRFlY-0004gH-7N
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:59:20 -0500
Received: from [2607:f8b0:4864:20::22f] (port=46975
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRFlT-0007il-Gn
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:59:16 -0500
Received: by mail-oi1-x22f.google.com with SMTP id l25so15615771oic.13
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 07:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RLbtc21WOvF88azVxgT+m84w+1WkHbo3aJPQ3bzqjiA=;
 b=bJZExiVEbwo7gOZ0WaSZ24736YKjVvDpLZiolJEU6y+0Z8VGyLbaKACbwfxp9A5Ly5
 5EXs9iVI00Q7o4n5ifAPTHui7I3CWQ6+rahreU7TwJ7EOIxhNvLtdS2XzloFF6AV6A7L
 kHOwwlZLjbx3ePvnLkge3Ub7USR7AWbvwRMpnSZlqn0wBuU7IO8UN3PTEI0StHcLVkoY
 hOyk5bRlh5Eke+Bnm4SIh5fDopb4kxF3+SEFA4Ki2up2Ti8FMCqncAdFIyi4n1/YmwnZ
 hLnVYQdMetIdTO6/AMWsrVPOQVx0HaKX3+HcQ3rOjCw/oWpIBUHItUYzbQW8fNgstl6P
 ICIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RLbtc21WOvF88azVxgT+m84w+1WkHbo3aJPQ3bzqjiA=;
 b=FVyo8wr2RhH6kgRugdQ0dZakX+A0kD1O/ceihxomGbiMwbfHfR9V0+oe/ttNL/mnCK
 w+y2T9l64i5LwyalGqHgc50MtEkrFs0+hE2qfdnoSGXNB2s+5MVFniDAFq1+vff1GBO9
 wgYN7iONKeWhTHT4xejTTtYx/Tm1j0jDkljbvrGojusbwNQXjduXgbpauncHfjV3BJ4/
 hJi88ezTNIWEUoQf26Rz/f6hohYsCVrgx+AcWoF5mjYBt3V/Hjf1vkCDc5Y1HT1j1FC5
 eyriB7CGaaRMgPCS1YqxSLfYuMoS9nQe/WjqVf5kJansFcrIbb8dsVyOMJQdzZOySZPG
 asuQ==
X-Gm-Message-State: AOAM5314JJSWTxqVz1dGQFrMPcXVsxVuP3Xpa9ukmejsAcO46XHTJbRR
 RWJ3JcqKa8/eQDnEJpkWZagJY49HU9LkElG+eYU=
X-Google-Smtp-Source: ABdhPJy22Ji7WQX9AsOlHUUA0anl3iUOd//Wsw6Syp6dvERbo6k/mXQ/EONuSaKS1uybwEPVvjxSBMUF02BRZfCbwKc=
X-Received: by 2002:a05:6808:3020:b0:2d9:b433:ddbf with SMTP id
 ay32-20020a056808302000b002d9b433ddbfmr5947738oib.172.1646668752616; Mon, 07
 Mar 2022 07:59:12 -0800 (PST)
MIME-Version: 1.0
References: <20220307134946.61407-1-akihiko.odaki@gmail.com>
 <085b9a6d-5deb-9225-f7d1-81627576020f@redhat.com>
In-Reply-To: <085b9a6d-5deb-9225-f7d1-81627576020f@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 8 Mar 2022 00:59:01 +0900
Message-ID: <CAMVc7JUBMhmLVAD8Zac4tJCoCrjHDqoev9Q1-q2es1aVsMCNGg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Create menus in iothread
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 8, 2022 at 12:32 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 3/7/22 14:49, Akihiko Odaki wrote:
> > ui/cocoa: Create menus in iothread
> >
> > Commit 0439c5a4623d674efa0c72abd62ca6e98bb7cf87 introduced an
> > assertion that blk_all_next is called in the main thread. The function
> > is called in the following chain:
> > - blk_all_next
> > - qmp_query_block
> > - addRemovableDevicesMenuItems
> > - main
> >
> > This change moves the menu creation to the iothread. This also changes
> > the menu creation procedure to construct the entire menu tree before
> > setting to NSApp, which is necessary because a menu set once cannot be
> > modified if NSApp is already running.
>
> I wonder if you actually need the iothread/secondary thread separation
> during initialization.  It's needed to run the "secondary" main loop,
> but until that point nobody should care what thread things run on.
> cocoa_display_init() is close enough to the end of qemu_init() that I
> think you can just do:
>
>    main()
>      qemu_init()
>        /* takes iothread lock */
>        cocoa_display_init()
>          /* just save a few values from opts */
>      ... create menus ...
>      [NSApp run]
>        applicationDidFinishLaunching:
>          /* do what was in cocoa_display_init() */
>          qemu_unlock_mutex_iothread();
>          qemu_thread_create(call_qemu_main_loop)
>                                                     call_qemu_main_loop()
>                                                       qemu_main_loop()
>
> This might even obsolete the allow_events hack, because now the main
> thread has the iothread lock until applicationDidFinishLaunching:.

allow_events was necessary not because of the separation of the
thread, but because cocoa_display_init waits the main thread for
finishing the initialization. It can be simply removed if it doesn't
wait for app_started_sem.

Regards,
Akihiko Odaki

>
> Paolo
>
> > v2: Separate a change moving create_initial_menus (Peter Maydell)
> >
> > Akihiko Odaki (2):
> >    ui/cocoa: Move create_initial_menus
> >    ui/cocoa: Create menus in iothread
> >
> >   ui/cocoa.m | 209 +++++++++++++++++++++++++----------------------------
> >   1 file changed, 98 insertions(+), 111 deletions(-)
> >
>

