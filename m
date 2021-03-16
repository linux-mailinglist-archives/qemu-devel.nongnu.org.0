Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BEB33D050
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 10:08:56 +0100 (CET)
Received: from localhost ([::1]:60834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM5h9-0004m5-Bw
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 05:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lM5gA-0004LQ-CV
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:07:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lM5g8-0006of-NY
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615885672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=v/OFoT/t2iy3578igeMzEKtuaPzTlblx3qbOKBH7bfw=;
 b=cIxHlMINIHjYHy0bhfT1rV0hqvl7SlSwzqFn4lazaDK0BpAYDy3G/TvIEE+8LLnyDJnWmF
 w2zZZqSON9z2EqAqOtk+d8pqup+QXWA3PsYI7RnSlN9s+Lbp4Bj4oUGzwUVKDraT2HXB3h
 lAN9vwbcunLlwk4asrQTYkSYafEGols=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-V8-wfKoqMoy1EJ-d7WSGtQ-1; Tue, 16 Mar 2021 05:07:50 -0400
X-MC-Unique: V8-wfKoqMoy1EJ-d7WSGtQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7430A192D786
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 09:07:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F04F61B426;
 Tue, 16 Mar 2021 09:07:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5A1461132C12; Tue, 16 Mar 2021 10:07:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: libqemuutil
Date: Tue, 16 Mar 2021 10:07:44 +0100
Message-ID: <87zgz38o0v.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I rebased my "[PATCH v6 00/10] Configurable policy for handling
deprecated interfaces" to master, and it surprisingly fails to link
several utility programs.  Here's the first error:

    gcc  -o tests/bench/benchmark-crypto-hmac tests/bench/benchmark-crypto-hmac.p/benchmark-crypto-hmac.c.o -Wl,--as-needed -Wl,--no-undefined -pie -Wl,--whole-archive libcrypto.fa libauthz.fa libqom.fa -Wl,--no-whole-archive -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m64 -fstack-protector-strong -Wl,--start-group libqemuutil.a subprojects/libvhost-user/libvhost-user-glib.a subprojects/libvhost-user/libvhost-user.a libcrypto.fa libauthz.fa libqom.fa -pthread -lgthread-2.0 -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lgnutls -lutil -lm -lgthread-2.0 -lglib-2.0 -lnettle -lgnutls -lpam -Wl,--end-group
    /usr/bin/ld: libqemuutil.a(util_main-loop.c.o): in function `qemu_set_fd_handler':
    /work/armbru/qemu/bld-x86/../util/main-loop.c:581: multiple definition of `qemu_set_fd_handler'; libqemuutil.a(stubs_set-fd-handler.c.o):/work/armbru/qemu/bld-x86/../stubs/set-fd-handler.c:8: first defined here
    collect2: error: ld returned 1 exit status

Both master and PATCH 01 still link fine, PATCH 02 doesn't.  PATCH 02
doesn't go anywhere near qemu_set_fd_handler().

Turns out libqemuutil.a contains two definitions of
qemu_set_fd_handler().  In master:

    $ nm --defined-only libqemuutil.a | awk '/:$/ { f=$0 } / qemu_set_fd_handler/ { if (f) { print f; f="" } print $0 }'
    util_main-loop.c.o:
    00000000000007fe T qemu_set_fd_handler
    stubs_set-fd-handler.c.o:
    0000000000000000 T qemu_set_fd_handler

This is obviously unhealthy.

I suspect the linker happens to pick the one that makes things work,
until something in my patch makes it pick the other one.

Is qemu_set_fd_handler() the only one?  Nope:

    $ nm --defined-only bld-x86/libqemuutil.a | awk '/ T / { print $NF }' | sort | uniq -c | grep -v '^ *1 '
          2 qemu_set_fd_handler
          2 yank_generic_iochannel
          2 yank_register_function
          2 yank_register_instance
          2 yank_unregister_function
          2 yank_unregister_instance

I didn't run into this issue when I posted my series last Friday.  The
issue now blocks its merge, and today is the soft freeze.  Help!


