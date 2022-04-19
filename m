Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02D0507199
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 17:23:55 +0200 (CEST)
Received: from localhost ([::1]:60090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngphq-0004BZ-8X
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 11:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=oEXL=U5=zx2c4.com=Jason@kernel.org>)
 id 1ngpfI-0001ZI-9r
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 11:21:16 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:37938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=oEXL=U5=zx2c4.com=Jason@kernel.org>)
 id 1ngpXH-0003Mz-E3
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 11:13:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C970461628
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 15:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBE4C385AC
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 15:12:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Q/37OvJm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650381170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MQyU07hi01iEyPXxllEOCsC9A0SZXJB5Wi7OpTYio9w=;
 b=Q/37OvJmn6L6JA4hxc+U0Bn3ttmZ0CZK7DJgmf01GPUpJjg128RaHv5HvvhszqeqWVGnDL
 l2SlbN/Xi0ms/oUYvl2yitT4K4ENydlAVTCInOxrGQapJh2v0VztNLHKWKgpPG0QUe+Y1P
 ctRzvD0PsnFwOfRBcf+wRwQBHLblAwA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 37d62801
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 19 Apr 2022 15:12:50 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2ec42eae76bso175735767b3.10
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 08:12:48 -0700 (PDT)
X-Gm-Message-State: AOAM5307UedZSxkTIZEhAJiqw77TsQIX2ZjaND07NPVLZbasPuSN+srr
 pWBOFf7a9xa932A9VQZrp4PN+BTxpGvwJDvbpI8=
X-Google-Smtp-Source: ABdhPJwPT8kpwudgm4aOLhhyxVPvw6QiVqCwGpv5AaqyiB3KI2pHaKNZHoMfD/PEIqVraDr3btr5C9vb1YaKvou13Fo=
X-Received: by 2002:a0d:c005:0:b0:2eb:d29d:8bf5 with SMTP id
 b5-20020a0dc005000000b002ebd29d8bf5mr17186902ywd.404.1650381167579; Tue, 19
 Apr 2022 08:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
 <c5181fb5-38fb-f261-9de5-24655be1c749@amazon.com>
 <CAHmME9rTMDkE7UA3_wg87mrDVYps+YaHw+dZwF0EbM0zC4pQQw@mail.gmail.com>
 <47137806-9162-0f60-e830-1a3731595c8c@amazon.com>
In-Reply-To: <47137806-9162-0f60-e830-1a3731595c8c@amazon.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 19 Apr 2022 17:12:36 +0200
X-Gmail-Original-Message-ID: <CAHmME9pwfKfKp_qqbmAO5tEaQSZ5srCO5COThK3vWZR4avRF1g@mail.gmail.com>
Message-ID: <CAHmME9pwfKfKp_qqbmAO5tEaQSZ5srCO5COThK3vWZR4avRF1g@mail.gmail.com>
Subject: Re: propagating vmgenid outward and upward
To: Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=oEXL=U5=zx2c4.com=Jason@kernel.org;
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, adrian@parity.io,
 KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Colm MacCarthaigh <colmmacc@amazon.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey Alex,

On Thu, Mar 10, 2022 at 12:18 PM Alexander Graf <graf@amazon.com> wrote:
> I agree on the slightly racy compromise and that it's a step into the
> right direction. Doing this is a no brainer IMHO and I like the proc
> based poll approach.

Alright. I'm going to email a more serious patch for that in the next
few hours and you can have a look. Let's do that for 5.19.

> I have an additional problem you might have an idea for with the poll
> based path. In addition to the clone notification, I'd need to know at
> which point everyone who was listening to a clone notification is
> finished acting up it. If I spawn a tiny VM to do "work", I want to know
> when it's safe to hand requests into it. How do I find out when that
> point in time is?

Seems tricky to solve. Even a count of current waiters and a
generation number won't be sufficient, since it wouldn't take into
account users who haven't _yet_ gotten to waiting. But maybe it's not
the right problem to solve? Or somehow not necessary? For example, if
the problem is a bit more constrained a solution becomes easier: you
have a fixed/known set of readers that you know about, and you
guarantee that they're all waiting before the fork. Then after the
fork, they all do something to alert you in their poll()er, and you
count up how many alerts you get until it matches the number of
expected waiters. Would that work? It seems like anything more general
than that is just butting heads with the racy compromise we're already
making.

Jason

