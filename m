Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5A4D07AD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:27:56 +0100 (CET)
Received: from localhost ([::1]:52570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJ1P-0004SJ-4P
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:27:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRIz4-0002Bs-Jo
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:25:30 -0500
Received: from [2607:f8b0:4864:20::c2d] (port=40949
 helo=mail-oo1-xc2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRIz0-0007EZ-Gz
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:25:29 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id
 h16-20020a4a6f10000000b00320507b9ccfso19085884ooc.7
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 11:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iauKfWgAv6yJu9kMpKHyDF2kBUO0PmGIIQcz4fGDANk=;
 b=qHkmcDdEvxL+eCnP5FBeT3YSTVfeW0dEtiU41/auETt2DUvFY8IeF94gCpnLf1Az2o
 cVA9zXsGbV9iTQ9wur4EZtCiT1JBEi3LNW5wHKj5bo5S0WdsdABvTtDDqBHqwGhRn0Zu
 f56aSOOw1k9lTK9fdSmNsdvdObdo2lx1n2OTMXVztZ1TLtVf0e2u2Wg6qmn7maPDNN/J
 hsYxvHB0Lr9rqEs8KmwhRyLV/5kTIbBr6srOo+V9ZaZqwYcvj6yMX1eNRoPK6mHMTSDN
 f+G6CPQXvvYzWr/JqEjsJFPs0SrociLnq/c1ubsubwknBMMjKAE655qc/nKeACaA+a7R
 9LJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iauKfWgAv6yJu9kMpKHyDF2kBUO0PmGIIQcz4fGDANk=;
 b=dY6Q/U7e9GlSVZLWW08nUcfA2Qg57id0NA3qNlgBWySi8PP26EfpXHj4eEFOyEKxDQ
 EfTYOv8Mi/bRQj5CJH2c+PMhz93Jw1D0fegX8biIl/vju1VGKR0Stg7pWi2GkBjJtiOO
 V/Cj5XKpIc4gpCWhZzvGCBdJo5aKFyebVunUMgqeQ8CqQJw+H4jArQwkm4FNL2XaysKw
 k+qYmapIE0GGNICryK5urks2loNhHkn3SJhDpwRVifdblIE0AneQrsnRxVOnpJ3IuwqT
 n8r1ztIphm4N5CoX4/mgu0FRsK3ZYg5UkwmyAfOvtVnvLxxsMN57qLLqu7Jg0mvH1Tws
 b3lQ==
X-Gm-Message-State: AOAM5304vrnRkjOp0SFLbWi53Rma2q9+Vm9cO18gYMyn0+2gKY8rkOUF
 GvlsVvci/hF9jzsdVN1fH9RgOAMglZzVsOvhMNs=
X-Google-Smtp-Source: ABdhPJw+n/TttlOLzKhKVktlWExVJXLeDxXnZJWxUU3G/SZtTPqu7hpelB3+oGwKVkc13/3UNUUBYVgtzUDBcEwR5fw=
X-Received: by 2002:a05:6870:4410:b0:da:38cc:e845 with SMTP id
 u16-20020a056870441000b000da38cce845mr311089oah.88.1646681112562; Mon, 07 Mar
 2022 11:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20220307151004.578069-1-pbonzini@redhat.com>
 <59f773ed-9a1f-10ff-637e-b41848aa534d@gmail.com>
 <CAFEAcA8XshU90eKJM_4+_mLRhUCN+ExWzCkPTveLht0bWBb8=w@mail.gmail.com>
 <CAMVc7JU=easTepCd=j0QHWBcFrry7iYXgX1BbQjs27fmxZGXrA@mail.gmail.com>
 <CAFEAcA8h0E5i=iJswVwC+v_=vs_u92-s90wMgq_C5ZjSTsrZSw@mail.gmail.com>
 <CAMVc7JVZSTpD5VL1Ls8CcWZsoEMMzsZsGApZ+tNkuFhMc8_+cA@mail.gmail.com>
 <89a0316d-7e9a-46d9-31cc-c3507483fffb@redhat.com>
In-Reply-To: <89a0316d-7e9a-46d9-31cc-c3507483fffb@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 8 Mar 2022 04:25:01 +0900
Message-ID: <CAMVc7JVjNOXLuSsgNv4=fw7CiHtUPMbfqKHpF+=gx1QasJ4oeA@mail.gmail.com>
Subject: Re: [RFC uncompiled PATCH] cocoa: run qemu_init in the main thread
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc2d.google.com
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
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 8, 2022 at 2:21 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 3/7/22 17:41, Akihiko Odaki wrote:
> >> That series doesn't remove the general design that has quite a bit
> >> of "we know some other thread holds the lock and waits for us" code.
> > Well, I don't think so. main no longer calls back QEMU code (and it
> > should never do so in my opinion).
>
> That's an arbitrary limitation.  With my patch, until [NSApp run] only
> the main thread has the lock and therefore it can do anything.  In my
> patch I decided to minimize the changes, but if
> register_displaychangelistener() and qemu_clipboard_peer_register() can
> be moved earlier, then the iothread could even be unlocked before [NSApp
> run].

I meant the thread without iothread lock shouldn't call QEMU functions
even if it is clear that another thread is holding the lock and
waiting. The rule should apply after unlocking the mutex in
[-QemuCocoaAppController applicationDidFinishLaunching:].

>
> There's also the advantage that the flow is a lot more similar between
> "-display cocoa" and "-display none", and also between --enable-cocoa
> and --disable-cocoa builds.
>
> Then main() remains as
>
>      /* doesn't hurt in the !cocoa case */
>      NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
>
>      qemu_init(argc, argv);
>      if (!have_cocoa_display) {
>          qemu_main_loop();
>          qemu_cleanup();
>      } else {
>          QemuCocoaAppController *appController =
> [[QemuCocoaAppController alloc] init];
>          [NSApp setDelegate:appController];
>          [NSApp run];
>          [appController release];
>      }
>      [pool release];
>      return 0;
>
> which is in my opinion the best of both worlds.  But my patch (assuming
> it works) really fixes the threading model.  Without it, moving menus to
> the iothread makes it even more complicated.

I don't think the threading model is broken in the current code. There
is always the iothread and main thread and ui/cocoa has to be aware of
that. We could unify them when initializing but it is exceptional. The
broken part is the menu creation code which touches iothread.

The nice part of this change is that it gives control on how to model
threading. It can provide a conventional model when running without
cocoa, and leave a room for changes like moving all of the
initialization code before [+NSApp run].

>
> >> It also gives us the opposite problem that we're now calling a lot
> >> of Cocoa APIs from something other than the main Cocoa thread.
> > Basically NSView is the only thing prohibited from calling from
> > another thread so it shouldn't be a problem.
>
> I'd rather have a single thread that does all things related to Cocoa.
> If my patch doesn't work, I would just call qmp_query_block(NULL) from
> cocoa_display_init() and save the result in a global variable.

The distinction between Cocoa and other platform APIs is arbitrary.
The APIs of Cocoa are mostly thread-independent and NSView is rather
exceptional.

Regards,
Akihiko Odaki

>
> Paolo

