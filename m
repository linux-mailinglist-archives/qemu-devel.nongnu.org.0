Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A693D5822DE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:14:33 +0200 (CEST)
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGd7g-0000f4-F4
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGczc-0002No-4g
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGczZ-0007zt-SO
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658912769;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6ExMoPAvviraAdlyGFwv6r7eiQPiz1PlcsgJqObg1EI=;
 b=QfDCHDhOYFNqkKT4QPqAaqBFooU42vTcrUPlcprAbXwtjH3ewI2kteAJ0FcZMA0iVUWedp
 VbwHslWXKy23Z/fNBCYtOeFWuF2py7VFKiP9yFu/q04njlakThwsc1yIiilg0Th807jMui
 y6+EX1TS4chXDN5G3JT7PQ0JNkbiMT0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-3mrIJDM6O-KVh9joFahdPQ-1; Wed, 27 Jul 2022 05:06:05 -0400
X-MC-Unique: 3mrIJDM6O-KVh9joFahdPQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85B77101A54E;
 Wed, 27 Jul 2022 09:06:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 816E91121314;
 Wed, 27 Jul 2022 09:06:03 +0000 (UTC)
Date: Wed, 27 Jul 2022 10:06:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH 0/5] Enable unix socket support on Windows
Message-ID: <YuD/+ehoLlwvzopk@redhat.com>
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220727073542.811420-1-bmeng.cn@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 27, 2022 at 03:35:37PM +0800, Bin Meng wrote:
> Support for the unix socket has existed both in BSD and Linux for the
> longest time, but not on Windows. Since Windows 10 build 17063 [1],
> the native support for the unix socket has came to Windows. Starting
> this build, two Win32 processes can use the AF_UNIX address family
> over Winsock API to communicate with each other.
> 
> Introduce a new build time config option CONFIG_AF_UNIX when the build
> host has such a capability, and a run-time check afunix_available() for
> Windows host in the QEMU sockets util codes.
> 
> [1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
> 
> 
> Bin Meng (5):
>   util/qemu-sockets: Replace the call to close a socket with
>     closesocket()
>   util/oslib-win32: Add a helper to get the Windows version
>   qga/commands-win32: Use os_get_win_version()
>   util/qemu-sockets: Enable unix socket support on Windows
>   chardev/char-socket: Update AF_UNIX for Windows
> 
>  meson.build               |  6 +++++
>  include/sysemu/os-win32.h |  2 ++
>  chardev/char-socket.c     |  8 +++++-
>  qga/commands-win32.c      | 27 +-------------------
>  util/oslib-win32.c        | 15 +++++++++++
>  util/qemu-sockets.c       | 52 ++++++++++++++++++++++++++++++++-------
>  6 files changed, 74 insertions(+), 36 deletions(-)

What about net/socket.c ?

Also there are many tests using AF_UNIX and this doesn't appear to
have enablede any of them.  I'd at least exepct to see  the sockets
tests-io-channel-socket.c test enabled to prove this functionality
is working.

There are a few other AF_UNIX references in teh code, though many
seems to be Linux specific.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


