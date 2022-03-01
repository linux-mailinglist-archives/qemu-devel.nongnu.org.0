Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C1C4C98FA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 00:14:01 +0100 (CET)
Received: from localhost ([::1]:51258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPBgt-0008JX-Tq
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 18:13:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org>)
 id 1nPBfI-0007FR-T0
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 18:12:21 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:34750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org>)
 id 1nPBfG-0002ia-W9
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 18:12:20 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56A1561482
 for <qemu-devel@nongnu.org>; Tue,  1 Mar 2022 23:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B37BC340F1
 for <qemu-devel@nongnu.org>; Tue,  1 Mar 2022 23:12:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="HGfxvj7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1646176332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QVWwDfP6vCdKSXIrReokkbeYI07Avo5/7iLxJ3qVrMM=;
 b=HGfxvj7+VzxINY1Yi+tcbZLrWeAlGcyZm6PJfGtkl/IKhfcK1PcxnKFUd7YHlvI3N/xszj
 b3ETebNOtKo/6UbFNEAXq0iSdDd25lufP6oEFJ4H94Y/0rynsQkgTEtHgCgatDggeAiVHw
 KBwvcdvL891pKLoKH4OQ04PIsz4yJpU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b658068d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 1 Mar 2022 23:12:12 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id bt13so30398953ybb.2
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 15:12:12 -0800 (PST)
X-Gm-Message-State: AOAM531Ej8MLhhaVhEBRn2lVHvD3Ia9YvfDdfVlIO2dVn6XSMTxLBPOG
 T+m5VgmZpsy6xYHzMC1Sm4TN7IfsQGTrlpZfOlY=
X-Google-Smtp-Source: ABdhPJxG1EP2z5Lx925intNmaJt+8bpR2v0QoOtdNwKnXQnbrqMvRmDH6t8H149eZ3tCCAwnI0z6h3junDyhTjBtpjE=
X-Received: by 2002:a05:6902:693:b0:613:7f4f:2e63 with SMTP id
 i19-20020a056902069300b006137f4f2e63mr26499795ybt.271.1646176331461; Tue, 01
 Mar 2022 15:12:11 -0800 (PST)
MIME-Version: 1.0
References: <Yh4+9+UpanJWAIyZ@zx2c4.com> <Yh5fbe71BTT6xc8h@kroah.com>
 <CAHmME9oGcp7HNLeieptMKztgg7Fq4MnOuAEsiFJxsLbmjSuFCw@mail.gmail.com>
 <Yh528WPZrQn5s7vO@kroah.com>
In-Reply-To: <Yh528WPZrQn5s7vO@kroah.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 2 Mar 2022 00:12:00 +0100
X-Gmail-Original-Message-ID: <CAHmME9oxEWK6Nvra9eZBZnHKGNnWyeEzvE8d4HGy3NRPkajrvA@mail.gmail.com>
Message-ID: <CAHmME9oxEWK6Nvra9eZBZnHKGNnWyeEzvE8d4HGy3NRPkajrvA@mail.gmail.com>
Subject: Re: propagating vmgenid outward and upward
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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
Cc: "Brown, Len" <len.brown@intel.com>, linux-hyperv@vger.kernel.org,
 Colm MacCarthaigh <colmmacc@amazon.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, adrian@parity.io,
 KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
 Linux PM <linux-pm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <graf@amazon.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Laszlo Ersek <lersek@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 1, 2022 at 8:41 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 01, 2022 at 07:24:11PM +0100, Jason A. Donenfeld wrote:
> > Hi Greg,
> >
> > On Tue, Mar 1, 2022 at 7:01 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > A notifier block like this makes sense, but why tie onto the PM_ stuff?
> > > This isn't power management issues, it's a system-wide change that I am
> > > sure others will want to know about that doesn't reflect any power
> > > changes.
> > >
> > > As much as I hate adding new notifiers in the kernel, that might be all
> > > you need here.
> >
> > You might indeed be right. I guess I was thinking that "resuming from
> > suspend" and "resuming from a VM fork" are kind of the same thing.
> > There _is_ a certain kind of similarity between the two. I was hoping
> > if the similarity was a strong enough one, maybe it'd make sense to do
> > them together rather than adding another notifier. But I suppose you
> > disagree, and it sounds like Rafael might too --
> > <https://lore.kernel.org/lkml/CAJZ5v0g+GihH_b9YvwuHzdrUVNGXOeabOznDC1vK6qLi8gtSTQ@mail.gmail.com/>.
>
> Hey, nice, we agree!  :)

It is now done and posted here:
https://lore.kernel.org/lkml/20220301231038.530897-1-Jason@zx2c4.com/

Jason

