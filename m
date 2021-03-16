Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD35133D0B7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 10:26:09 +0100 (CET)
Received: from localhost ([::1]:44346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM5xo-0002DF-AQ
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 05:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lM5wK-0001kJ-IO
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:24:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lM5wF-0008Qs-Dq
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615886669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5EcGtK+hbZtEPfI6Gy+qG4CslCAWyc7VR6LMPXxitgw=;
 b=CItxkAog6S6qe1BCYlahcZKwX9w5VZUYoY+QDEnlnDc3t27YLytFFtQFhi01m31RBxBh/b
 fDSCqJng+zWHe5tzRfFq6nFkn9KnUubc/3ivEzBAjpC1j08qLLBcwCdQxYRDtvOxTjbiti
 M1GbyzIImsk9fNeOE7BSwgYdL6w043A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-iZqOu-JHOYOKYw4dHcuTmg-1; Tue, 16 Mar 2021 05:24:28 -0400
X-MC-Unique: iZqOu-JHOYOKYw4dHcuTmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1996760C0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 09:24:26 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-110.ams2.redhat.com [10.36.112.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E1209CA0;
 Tue, 16 Mar 2021 09:24:22 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <87zgz38o0v.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: libqemuutil
Message-ID: <0c90e3ce-6be7-291f-3121-b6d7d725bcdf@redhat.com>
Date: Tue, 16 Mar 2021 10:24:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87zgz38o0v.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/2021 10.07, Markus Armbruster wrote:
> I rebased my "[PATCH v6 00/10] Configurable policy for handling
> deprecated interfaces" to master, and it surprisingly fails to link
> several utility programs.  Here's the first error:
> 
>      gcc  -o tests/bench/benchmark-crypto-hmac tests/bench/benchmark-crypto-hmac.p/benchmark-crypto-hmac.c.o -Wl,--as-needed -Wl,--no-undefined -pie -Wl,--whole-archive libcrypto.fa libauthz.fa libqom.fa -Wl,--no-whole-archive -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m64 -fstack-protector-strong -Wl,--start-group libqemuutil.a subprojects/libvhost-user/libvhost-user-glib.a subprojects/libvhost-user/libvhost-user.a libcrypto.fa libauthz.fa libqom.fa -pthread -lgthread-2.0 -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lgnutls -lutil -lm -lgthread-2.0 -lglib-2.0 -lnettle -lgnutls -lpam -Wl,--end-group
>      /usr/bin/ld: libqemuutil.a(util_main-loop.c.o): in function `qemu_set_fd_handler':
>      /work/armbru/qemu/bld-x86/../util/main-loop.c:581: multiple definition of `qemu_set_fd_handler'; libqemuutil.a(stubs_set-fd-handler.c.o):/work/armbru/qemu/bld-x86/../stubs/set-fd-handler.c:8: first defined here
>      collect2: error: ld returned 1 exit status
> 
> Both master and PATCH 01 still link fine, PATCH 02 doesn't.  PATCH 02
> doesn't go anywhere near qemu_set_fd_handler().
> 
> Turns out libqemuutil.a contains two definitions of
> qemu_set_fd_handler().  In master:
> 
>      $ nm --defined-only libqemuutil.a | awk '/:$/ { f=$0 } / qemu_set_fd_handler/ { if (f) { print f; f="" } print $0 }'
>      util_main-loop.c.o:
>      00000000000007fe T qemu_set_fd_handler
>      stubs_set-fd-handler.c.o:
>      0000000000000000 T qemu_set_fd_handler
> 
> This is obviously unhealthy.
> 
> I suspect the linker happens to pick the one that makes things work,
> until something in my patch makes it pick the other one.
> 
> Is qemu_set_fd_handler() the only one?  Nope:
> 
>      $ nm --defined-only bld-x86/libqemuutil.a | awk '/ T / { print $NF }' | sort | uniq -c | grep -v '^ *1 '
>            2 qemu_set_fd_handler
>            2 yank_generic_iochannel
>            2 yank_register_function
>            2 yank_register_instance
>            2 yank_unregister_function
>            2 yank_unregister_instance
> 
> I didn't run into this issue when I posted my series last Friday.  The
> issue now blocks its merge, and today is the soft freeze.  Help!

A very, very quick-n-dirty band-aid is likely to mark the function in stubs 
as weak:

diff --git a/stubs/set-fd-handler.c b/stubs/set-fd-handler.c
--- a/stubs/set-fd-handler.c
+++ b/stubs/set-fd-handler.c
@@ -1,6 +1,7 @@
  #include "qemu/osdep.h"
  #include "qemu/main-loop.h"

+__attribute__((weak))
  void qemu_set_fd_handler(int fd,
                           IOHandler *fd_read,
                           IOHandler *fd_write,

  ... should IMHO be good enough for the soft freeze. In the long run, you 
might want to analyze the problem more thoroughly, of course. I had similar 
problems in the past already, and solved them by moving the stubs around. See:

  b0476d6602adbf818132dc896b585e01f47eaf96
  stubs: Move qemu_timer_notify_cb() and remove
  qemu_notify_event() stub

  8c2787629eee73ca8ce4f100cff4f4946583b4e8
  stubs: Move qemu_fd_register stub to util/main-loop.c

HTH,
  Thomas


