Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C8144B2BE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 19:32:51 +0100 (CET)
Received: from localhost ([::1]:60712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVvO-0008Un-NQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 13:32:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkVtU-0006yT-1Q
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:30:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkVtQ-0000ZY-NZ
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:30:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636482647;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hD/dei9tdPVY+pfx0hbFhQIlSdWvqslt6/EvqJwW6c=;
 b=a2nmRalRp6hZYd0/kH17vpNyNaabBS9TlbUXdBP4kVDVDNDamZ9JYV3EPKAiff8GyBLpQH
 HwIl3jiVQW7c+ReIYGddigKNte+pdYDKQh/NMYyLQ1qd5fjuC4/C0uwzHlovj7EjCjWket
 YDy/e7TrBXdXmxnDhKdOHIvnKn3gp9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-O_AgrDpINTChJ6CneRMiAw-1; Tue, 09 Nov 2021 13:30:35 -0500
X-MC-Unique: O_AgrDpINTChJ6CneRMiAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C68018358F2;
 Tue,  9 Nov 2021 18:30:34 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 068215D9CA;
 Tue,  9 Nov 2021 18:30:32 +0000 (UTC)
Date: Tue, 9 Nov 2021 18:30:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] meson.build: Support ncurses on MacOS
Message-ID: <YYq+Ri3LXbJwPCZN@redhat.com>
References: <20210612080358.61176-1-sw@weilnetz.de>
 <202eedd1-eb24-5463-c17a-64e146b95421@comstyle.com>
 <c3f3e9af-c81e-078c-5200-e2532a468cf7@weilnetz.de>
 <ff5fc830-8df8-7bd6-32df-3e8627edd74b@amsat.org>
 <fa1b9eb9-e707-4dd1-78be-dce4c55c5004@comstyle.com>
 <0b6d171d-4ceb-01a3-dbf6-2a7c964463db@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <0b6d171d-4ceb-01a3-dbf6-2a7c964463db@weilnetz.de>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 06:49:57PM +0100, Stefan Weil wrote:
> Am 15.06.21 um 03:53 schrieb Brad Smith:
> 
> > On 6/14/2021 1:45 AM, Philippe Mathieu-Daudé wrote:
> > > On 6/13/21 8:33 AM, Stefan Weil wrote:
> > > > Am 13.06.21 um 03:40 schrieb Brad Smith:
> > > > 
> > > > > This same problem also applies to OpenBSD as we have the same
> > > > > version of ncurses with support for wide characters. I have a similar
> > > > > patch in our QEMU port.
> > > > 
> > > > Then we should either extend the conditional statement to handle
> > > > OpenBSD
> > > > as well, or simply define both macros unconditionally:
> > > > 
> > > >      # Newer versions of curses use NCURSES_WIDECHAR.
> > > >      # Older versions (e. g. on MacOS, OpenBSD) still require
> > > > _XOPEN_SOURCE_EXTENDED.
> > > >      curses_compile_args = ['-DNCURSES_WIDECHAR=1',
> > > > '-D_XOPEN_SOURCE_EXTENDED=1']
> > > > 
> > > > Defining only _XOPEN_SOURCE_EXTENDED would also work with old and new
> > > > versions, so that's another option.
> > > It is simpler to ask Brad to upstream the OpenBSD patch :)
> > 
> > That doesn't answer his question and that's the part that actually
> > matters.
> 
> 
> The question is still unanswered: which alternative is preferred?
> 
> - define only _XOPEN_SOURCE_EXTENDED=1 unconditionally
> 
> - define DNCURSES_WIDECHAR=1 and _XOPEN_SOURCE_EXTENDED=1 unconditionally
> 
> - define DNCURSES_WIDECHAR=1 and _XOPEN_SOURCE_EXTENDED=1 for MacOS and BSD
> 
> All of them should work. We could also start and merge my commit which does
> not fix the issue for BSD but at least fixes it for MacOS.

Ignoring ncurses for a minute

 * QEMU sets _GNU_SOURCE=1
 * With GLibc on _GNU_SOURCE forces _XOPEN_SOURCE=700
 * _XOPEN_SOURCE_EXTENDED=1 is implied by _XOPEN_SOURCE >= 500

IOW for Linux/GLibC, none of this matters, we always get wide char
support via _GNU_SOURCE.

Setting NCURSES_WIDECHAR was added in

  commit b01a4fd3bd7d6f2ebd9eeba9cb6502d423c3bc85
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Fri Jun 2 15:35:38 2017 +0100

    configure: Define NCURSES_WIDECHAR if we're using curses

for the benefit for benefit of non-Linux / non_GLibC platforms
where _GNU_SOURCE doesn't take affect

Note it explicitly rejected the idea of using _XOPEN_SOURCE

[quote]
    We can't fix this by defining _XOPEN_SOURCE ourselves, because
    that also means "and don't provide any functions that aren't in
    that standard", and not all libcs provide any way to override
    that to also get the non-standard functions. In particular
    FreeBSD has no such mechanism, and OSX's _DARWIN_C_SOURCE
    doesn't reenable everything (for instance getpagesize()
    is still not prototyped if _DARWIN_C_SOURCE and _XOPEN_SOURCE
    are both defined).
[/quote]

Based on Stefan / Brad experiance patching in _XOPEN_SOURCE_EXTENDED=1
it seems it might not be too terrible in its effects, but perhaps we're
simply not noticing a silent bad effect.

I also don't like adding a global flag like _XOPEN_SOURCE_EXTENDED=1
in response to a feature that can be turned on/off via a configure
arg --without-curses.

Overall, I don't think we should be setting _XOPEN_SOURCE_EXTENDED=1
globally in CFLAGS in response to curses.

We could put it in any .c file that includes curses.h ie

  #if defined(__APPLE__) || defined(__OpenBSD__)
  #define _XOPEN_SOURCE_EXTENDED=1
  #endif
  #include <curses.h>

so that we isolate the effects of the global flag from the rest
of the QEMU codebase. The meson.build test would also need to
set this in its test program source.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


