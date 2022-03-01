Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7118C4C9378
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 19:42:59 +0100 (CET)
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP7Sb-00061G-OD
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 13:42:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org>)
 id 1nP7NL-0004qb-SQ
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:37:32 -0500
Received: from [2604:1380:4601:e00::1] (port=56126 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org>)
 id 1nP7NJ-0000m9-Nw
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:37:31 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9E542B81BFD
 for <qemu-devel@nongnu.org>; Tue,  1 Mar 2022 18:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163ACC340F7
 for <qemu-devel@nongnu.org>; Tue,  1 Mar 2022 18:37:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="aQfeTqt3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1646159840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VSlbgJdpoP+AY+bV5mfkN+zErWZpSrp0RJgkPDVSc0A=;
 b=aQfeTqt3Blqmd7xwmnnemPOkABs2OSRQfD3vrWDfSpclMht5sVb5NhIpVgxjRlEiCLkj7u
 TWiA9VszkWjvxE0Yx8q/qb/9de6ZpRvFOxGB1JCkF6eZfpa4GxXxMZ/IWhlVmVPlgRK2e5
 TKYSF2+nWIzlxjGcVXAAqFsV6gVdKi4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7b12e22b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 1 Mar 2022 18:37:20 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-2d646fffcc2so154937137b3.4
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 10:37:19 -0800 (PST)
X-Gm-Message-State: AOAM533lKnZYb3MnvEIS3OE4H2Qh3jJHFTsZcw+MYxZcTSqUGkdIRakM
 ttmgQPhiyC/R5WreRuLGTWvo1mqJPM/mPeuZsWE=
X-Google-Smtp-Source: ABdhPJxjsymwg5XYl+9GOoc41diKHCjvuVitOGfsmWq8BKG7jLc7Bwscjb/8sbN68Rx5awXeXGZ28M5wy+3vS8Wf7hE=
X-Received: by 2002:a81:8984:0:b0:2db:6b04:be0c with SMTP id
 z126-20020a818984000000b002db6b04be0cmr13093941ywf.2.1646159837032; Tue, 01
 Mar 2022 10:37:17 -0800 (PST)
MIME-Version: 1.0
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
 <223f858c-34c5-3ccd-b9e8-7585a976364d@redhat.com>
 <Yh5JwK6toc/zBNL7@zx2c4.com> <20220301121419-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220301121419-mutt-send-email-mst@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 1 Mar 2022 19:37:06 +0100
X-Gmail-Original-Message-ID: <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
Message-ID: <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
Subject: Re: propagating vmgenid outward and upward
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4601:e00::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <graf@amazon.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Theodore Ts'o <tytso@mit.edu>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Laszlo Ersek <lersek@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On Tue, Mar 1, 2022 at 6:17 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> Hmm okay, so it's a performance optimization... some batching then? Do
> you really need to worry about every packet? Every 64 packets not
> enough?  Packets are after all queued at NICs etc, and VM fork can
> happen after they leave wireguard ...

Unfortunately, yes, this is an "every packet" sort of thing -- if the
race is to be avoided in a meaningful way. It's really extra bad:
ChaCha20 and AES-CTR work by xoring a secret stream of bytes with
plaintext to produce a ciphertext. If you use that same secret stream
and xor it with a second plaintext and transmit that too, an attacker
can combine the two different ciphertexts to learn things about the
original plaintext.

But, anyway, it seems like the race is here to stay given what we have
_currently_ available with the virtual hardware. That's why I'm
focused on trying to get something going that's the least bad with
what we've currently got, which is racy by design. How vitally
important is it to have something that doesn't race in the far future?
I don't know, really. It seems plausible that that ACPI notifier
triggers so early that nothing else really even has a chance, so the
race concern is purely theoretical. But I haven't tried to measure
that so I'm not sure.

Jason

