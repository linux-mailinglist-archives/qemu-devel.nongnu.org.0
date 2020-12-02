Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFF42CB55C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 07:55:18 +0100 (CET)
Received: from localhost ([::1]:42376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkM2n-0002yf-3t
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 01:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kkM17-0002WV-A6
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 01:53:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kkM14-0000SP-Cr
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 01:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606892008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TFaqYINT04rUzRP/drAAbf5gU7vkb6HMAHyFZw89sL8=;
 b=Mgc7w2HS/plmU2yo+VNwIh9ChjdLziYNkfrdmo6GNmSWSLfrXyjhNYJ7pAPDyfkbeeJalG
 Nw0+VJvgcrr/s5awkMZYiFjrIo9xgdTEUgfR30N06NOCDBf4dGrP6qeGe8QDBa+SuYn0tc
 Or+UnMnodrlLSke6rysfkaFBTxBTWI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537--hz2pFREOJKLjTtW1xe3pA-1; Wed, 02 Dec 2020 01:53:25 -0500
X-MC-Unique: -hz2pFREOJKLjTtW1xe3pA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E0A5100C677;
 Wed,  2 Dec 2020 06:53:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C1D460C17;
 Wed,  2 Dec 2020 06:53:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6C446113864E; Wed,  2 Dec 2020 07:53:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Doug Evans <1906463@bugs.launchpad.net>
Subject: Re: [Bug 1906463] [NEW] "-device help" does not report all devices
References: <160687065946.3791.11439184384818467145.malonedeb@soybean.canonical.com>
Date: Wed, 02 Dec 2020 07:53:22 +0100
In-Reply-To: <160687065946.3791.11439184384818467145.malonedeb@soybean.canonical.com>
 (Doug Evans's message of "Wed, 02 Dec 2020 00:57:39 -0000")
Message-ID: <871rg87l7h.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Doug Evans <1906463@bugs.launchpad.net> writes:

> Public bug reported:
>
> -device help doesn't report all devices.
> E.g., devices that are instantiated by a board don't get printed in part because they don't exist when "-device help" is processed. As an experiment I deferred processing of "-device help" as long as possible and some devices were still not printed, so there's more going on here.
>
> QEMU commit hash: 944fdc5e27a5b5adbb765891e8e70e88ba9a00ec
>
> Repro:
> $ configure --target-list=arm-softmmu
> $ make
> $ ./qemu-system-arm -device help | grep npcm7xx
> <empty>
>
> I'd expect to see things like npcm7xx-rng in the output.

Works as intended.

"-device help" shows the devices that are available with -device.
npcm7xx-rng isn't:

    $ qemu-system-arm -M virt -device npcm7xx-rng
    qemu-system-arm: -device npcm7xx-rng: Parameter 'driver' expects pluggable device type

Monitor command "info qdm" shows all devices, including npcm7xx-rng:

    $ qemu-system-arm -M virt -monitor stdio
    QEMU 5.1.92 monitor - type 'help' for more information
    (qemu) info qdm
    [...]
    name "npcm7xx-rng", bus System, desc "NPCM7xx Random Number Generator", no-user
    [...]

Note "no-user": it's not available with -device.

> I can imagine enumerating board-provided devices is a challenge.
> Still, it'd be really nice if "-device help" printed them, and having
> "-device $driver,help" work as well.

It works:

    $ qemu-system-arm -M virt -device npcm7xx-rng,help
    npcm7xx-rng options:
      regs[0]=<child<qemu:memory-region>>

Hope this helps!


