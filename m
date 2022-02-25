Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72644C4448
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 13:07:50 +0100 (CET)
Received: from localhost ([::1]:47698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNZO2-0000mW-1T
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 07:07:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNZIP-0005uL-0C
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:02:01 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:55166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNZIM-00056D-77
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:02:00 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C7F09B82F5B
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF52CC340F3
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:01:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="e7rrjGXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645790511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GohLlxwoxaOoPO6gq3rFNZF19DV6zVVxobKNLJM1ook=;
 b=e7rrjGXJDtydRXPyIDoT+OPUxWBEJJ/zwifDOp42UT7q9C8lkd+zFHiTU84mPsBAI3EV5Y
 28KvaAl1O1o5rk7b1n/OIQ8ndKsSRhOUPf3zrtRqIFP3wahS0gQDt+we92jeyUFXKppdi3
 XuWwjFDhN6+/UrfFY5Z7ZWkuMrLsDeQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 764e6367
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Fri, 25 Feb 2022 12:01:51 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2d625082ae2so31049597b3.1
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 04:01:51 -0800 (PST)
X-Gm-Message-State: AOAM530KAUyx6IoXTJ9QReGMIFlfkPVf4fYMx8i0UrXYDc6/Q+Ys3UXd
 N5k14CGAYa+HW0P9vAVyl6YZCOwTV0UAdqOIKhA=
X-Google-Smtp-Source: ABdhPJxCQEzCbIKLSycXajwp41qtjzUjR23a2R6uPz1/UKSpnSCt39obJbUOj0pGZOb3yMkzR1pQyesGew6EIssKfhc=
X-Received: by 2002:a81:1413:0:b0:2d9:d452:9c6a with SMTP id
 19-20020a811413000000b002d9d4529c6amr1051547ywu.231.1645790508130; Fri, 25
 Feb 2022 04:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20220224133906.751587-1-Jason@zx2c4.com>
 <20220224133906.751587-3-Jason@zx2c4.com>
 <CAMj1kXE-2sknZD7o72G-ZARpfm4Q0m+im1pTLuPhPu6TkqKOPQ@mail.gmail.com>
 <20220225064445-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220225064445-mutt-send-email-mst@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 25 Feb 2022 13:01:37 +0100
X-Gmail-Original-Message-ID: <CAHmME9omqUy51EnUMNccewQ2UH69h2-uAR0r_B5u=RH9W+AEvw@mail.gmail.com>
Message-ID: <CAHmME9omqUy51EnUMNccewQ2UH69h2-uAR0r_B5u=RH9W+AEvw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] virt: vmgenid: introduce driver for reinitializing
 RNG on VM fork
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: linux-hyperv@vger.kernel.org, KVM list <kvm@vger.kernel.org>, "Weiss,
 Radu" <raduweis@amazon.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 KY Srinivasan <kys@microsoft.com>, Ard Biesheuvel <ardb@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 ben@skyportsystems.com, Dexuan Cui <decui@microsoft.com>,
 Eric Biggers <ebiggers@kernel.org>, Laszlo Ersek <lersek@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, adrian@parity.io,
 Jann Horn <jannh@google.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Alexander Graf <graf@amazon.com>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Colm MacCarthaigh <colmmacc@amazon.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 12:52 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >  if VIRT_DRIVERS
> > >
> > > +config VMGENID
> > > +       tristate "Virtual Machine Generation ID driver"
> > > +       default y
> >
> > Please make this default m - this code can run as a module and the
> > feature it relies on is discoverable by udev
>
> Or don't supply a default - I don't see why this has any preference.

It's inside of VIRT_DRIVERS. If you enabled VIRT_DRIVERS, you more
than likely want and need this.

