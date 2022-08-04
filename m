Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A6E589CA6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:28:44 +0200 (CEST)
Received: from localhost ([::1]:49344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJau3-0003fj-1W
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJarN-00079P-OK
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:25:57 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:36104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJarL-0004SE-KJ
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:25:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8697061806
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 13:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3209C43140
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 13:25:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="KvF7F/jT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659619550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZJwChJPqW5yYgZvwHhdHDcO5vZjLpvP+FfYNZRPIs/g=;
 b=KvF7F/jTWTei3Ylx8KpVUMsXR++z/X9kxskbih2vi44wJPldRf3rf26Xn2wxn3yu9ZxibM
 eAXsLMEffmh2C5hefTWf1Wz3yhQgOkuBMGWn3yDDkqvszm7hDd52VCbjf1n1hZ7YikZcKr
 Xh/mH8U5Jb/6K8ZejXHH4wu6L1fFHFM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2f5ad91a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 4 Aug 2022 13:25:50 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-31f445bd486so200188167b3.13
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 06:25:49 -0700 (PDT)
X-Gm-Message-State: ACgBeo3F8PCeHXI8ZvOoBR4lan/I+JbI7jq+AFQ/QLSy5LdwG6OrOcM0
 fxHrxj19o/1PFDoH8bhk7+gwHAOXQBW/8GprM5o=
X-Google-Smtp-Source: AA6agR7VGtCGDy/xKzbNIibGDkvBRNQqDdAzczsuC9aF07Ujc+qdaysyi5sjNLsMZUR8VVk6yeBqaUU5f63RfmjsN9I=
X-Received: by 2002:a81:1590:0:b0:328:2f5c:4704 with SMTP id
 138-20020a811590000000b003282f5c4704mr1731575ywv.79.1659619548364; Thu, 04
 Aug 2022 06:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <YusVVLNbLgsk49PK@zx2c4.com>
 <20220804004411.1343158-1-Jason@zx2c4.com>
 <20220804030012-mutt-send-email-mst@kernel.org>
 <bfa5704d-755c-5a52-e7cc-bd9b34e5bb03@redhat.com>
 <YuuQb3D/YY1SiUqY@redhat.com>
 <CAMj1kXFr6Bv4_G0-wCTu4fp_iCrG060NHJx_j2dbnyiFJKYYeQ@mail.gmail.com>
 <eadc852a-63f9-a017-aef7-f046eb56e28f@redhat.com> <Yuu3YeTRLE/gx6YC@zx2c4.com>
 <CAHmME9qQQZH1+Dy4zY5L-MdxN4kXtujW9XaH1x+RyCn-SjsTOA@mail.gmail.com>
 <5528ca40-50fb-8e92-7f24-80e20c4c983e@redhat.com>
In-Reply-To: <5528ca40-50fb-8e92-7f24-80e20c4c983e@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 4 Aug 2022 15:25:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9pjwaHeczJjLgZoXe__J_OnMH4zAnwFyo=ieMtj7QMEDw@mail.gmail.com>
Message-ID: <CAHmME9pjwaHeczJjLgZoXe__J_OnMH4zAnwFyo=ieMtj7QMEDw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
To: Laszlo Ersek <lersek@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, linux-efi <linux-efi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laszlo,

On Thu, Aug 4, 2022 at 3:17 PM Laszlo Ersek <lersek@redhat.com> wrote:
>
> On 08/04/22 14:47, Jason A. Donenfeld wrote:
> > On Thu, Aug 4, 2022 at 2:11 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >>
> >> Hi Laszlo,
> >>
> >> On Thu, Aug 04, 2022 at 01:31:36PM +0200, Laszlo Ersek wrote:
> >>> None of the existing info passing methods seem early enough, generic
> >>> enough, and secure enough (at the same time)...
> >>
> >> Can you look at the v2 patch? It seems to work on every configuration I
> >> throw at it. Keep in mind that setup_data is only used very, very early.
> >> I can think of a few other places to put it too, looking at the x86
> >> memory map, that will survive long enough.
> >>
> >> I think this might actually be a straightforwardly solvable problem if
> >> you think about it more basically.
> >
> > And just to put things in perspective here... We only need like 48
> > bytes or something at some easy fixed address. That's not much. That's
> > *got* to be a fairly tractable problem. If v2 has issues, I can't see
> > why there wouldn't be a different easy place to put a meger 48 bytes
> > of stuff that then is allowed to be wiped out after early boot.
>
> I've looked at v2. It still relies on passing information from QEMU to
> the guest kernel through guest RAM such that the whole firmware
> execution takes place in-between, without the firmware knowing anything
> about that particular area -- effectively treating it as free system
> RAM. Such exceptions are time bombs.
>
> We *have* used hard-coded addresses, sometimes they are unavoidable, but
> then they are open-coded in both QEMU and the firmware, and some early
> part of the firmware takes care to either move the data to a "safe"
> place, or to cover it in-place with a kind of reservation that prevents
> other parts of the firmware from trampling over it. I've debugged
> mistakes (memory corruption) when such reservation was forgotten; it's
> not fun.
>
> In short, I have nothing against the QEMU patch, but then the current
> OvmfPkg maintainers should accept a patch for the firmware too, for
> protecting the area from later firmware components, as early as possible.

What you say mostly makes sense. Though, I was wondering if there's
some unused space (maybe a historical low address) that nothing
touches because it's always been considered reserved. Some kind of
ancient video data region, for example. We only need 48 bytes after
all... My hope was that somebody with a lot of deep x86 knowledge
would be able to smell their way to something that's always good like
that. (Alternatively, there's my real_addr thing from v2.)

Jason

