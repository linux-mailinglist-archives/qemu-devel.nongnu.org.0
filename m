Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40625F41D0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 13:14:26 +0200 (CEST)
Received: from localhost ([::1]:58538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1offsY-0000Ey-48
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 07:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YHNL=2F=zx2c4.com=Jason@kernel.org>)
 id 1offov-0005Mw-OZ
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:10:41 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:44964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YHNL=2F=zx2c4.com=Jason@kernel.org>)
 id 1offot-0005pP-QR
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:10:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A46261329
 for <qemu-devel@nongnu.org>; Tue,  4 Oct 2022 11:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E90C433D6
 for <qemu-devel@nongnu.org>; Tue,  4 Oct 2022 11:10:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="RbPV9pZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664881833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ajBRTUqWYq/z16/huV0n8Gpu7U+LrPQQWNIxTi9igwE=;
 b=RbPV9pZhKiaNu2vUFot+rletGTf/dZiNwMQ6GfirtAqbQSlhtqn/eyeW595oiK9SgyIQLT
 y+qVvyHGd+wzRNjWU69zWhtu5jfxwLx8dXHzOjm5hQs8kWtZK+3lXcAMsvBpuCURzrpOzD
 C2jHvWKKHq+aK2pZ5sTvHCcCVyiuJzw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9fa73634
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 4 Oct 2022 11:10:33 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id p4so2930885uao.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 04:10:32 -0700 (PDT)
X-Gm-Message-State: ACrzQf2Sxdf2iOipKECJxafDYuPlr6qtf0hceMW1U+8M1seUjGbVwj3n
 29G2XPcLZl0M381HW23ThbMR/0QcekPHq2MSk1w=
X-Google-Smtp-Source: AMsMyM7DVIxxPkp0Lz8qvkNYFm/cvlfmn+NmBE7zmMD51WOMVMRia/+Jif0CtqlJgBm/cX49zhZSqB64Y6oWaU0Jprg=
X-Received: by 2002:ab0:6154:0:b0:398:c252:23d8 with SMTP id
 w20-20020ab06154000000b00398c25223d8mr12012501uan.65.1664881831677; Tue, 04
 Oct 2022 04:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <YziPyCqwl5KIE2cf@zx2c4.com>
 <20221003103627.947985-1-Jason@zx2c4.com>
 <b529059a-7819-e49d-e4dc-7ae79ee21ec5@amsat.org>
 <CAHmME9pUuduiEcmi2xaY3cd87D_GNX1bkVeXNqVq6AL_e=Kt+Q@mail.gmail.com>
 <YzwM+KhUG0bg+P2e@zx2c4.com>
 <CAFEAcA9KsooNnYxiqQG-RHustSx0Q3-F8ibpQbXbwxDCA+2Fhg@mail.gmail.com>
 <CAHmME9qmSX=QmBa-k4T1U=Gnz-EtahnYxLmOewpN85H9TqNSmA@mail.gmail.com>
 <CAFEAcA9-_qmtJgy_WRJT5TUKMm_60U53Mb9a+_BqUnQSS7PPcg@mail.gmail.com>
In-Reply-To: <CAFEAcA9-_qmtJgy_WRJT5TUKMm_60U53Mb9a+_BqUnQSS7PPcg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 4 Oct 2022 13:10:20 +0200
X-Gmail-Original-Message-ID: <CAHmME9qDN_m6+6R3OiNueHc0qEcvptpO9+0HxZ713knZ=8fkoQ@mail.gmail.com>
Message-ID: <CAHmME9qDN_m6+6R3OiNueHc0qEcvptpO9+0HxZ713knZ=8fkoQ@mail.gmail.com>
Subject: Re: [PATCH v2] mips/malta: pass RNG seed to to kernel via env var
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, kvm-devel <kvm@vger.kernel.org>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=YHNL=2F=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Oct 4, 2022 at 1:03 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> What I'm asking, I guess, is why you're messing with this board
> model at all if you haven't added this functionality to u-boot.
> This is just an emulation of an ancient bit of MIPS hardware, which
> nobody really cares about very much I hope.

I think most people emulating MIPS would disagree. This is basically a
reference platform for most intents and purposes. As I mentioned, this
involves `-kernel` -- the thing that's used when you explicitly opt-in
to not using a bootloader, so when you sign up for QEMU arranging the
kernel image and its environment. Neglecting to pass an RNG seed would
be a grave mistake.

> I'm not saying this is a bad patch -- I'm just saying that
> QEMU should not be in the business of defining bootloader-to-kernel
> interfaces if it can avoid it, so usually the expectation is
> that we are just implementing interfaces that are already
> defined, documented and implemented by a real bootloader and kernel.

Except that's not really the way things have ever worked here. The
kernel now has the "rngseed" env var functionality, which is useful
for a variety of scenarios -- kexec, firmware, and *most importantly*
for QEMU. Don't block progress here.

> -kernel generally means "emulate the platform's boot loader"

And here, a platform bootloader could pass this, just as is the case
with m68k's BI_RNG_SEED or x86's setup_data RNG SEED or device tree's
rng-seed or EFI's LINUX_EFI_RANDOM_SEED_TABLE_GUID or MIPS' "rngseed"
fw environment variable. These are important facilities to have.
Bootloaders and hypervisors alike must implement them. *Do not block
progress here.*

Jason

