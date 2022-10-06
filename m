Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58985F6875
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:46:54 +0200 (CEST)
Received: from localhost ([::1]:56430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogRDB-0002TJ-71
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogR9K-0004sC-Su
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:42:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogR9H-0006sR-HJ
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665063770;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=loZxHqRhemkea9l3yFlY4yLW7JCW/zvi/25BAFM4/8Q=;
 b=IZuhke96hPWRZDNYyWgiPp41XBOZoq5mg4bKY4qNqCuGfNrXtMc1SMuhfO0oqdBTSM620Q
 bBJYBbhhmGiBXKMoIS1FZ9tOG2ILzL2Edt8fSVMRwnLD01D7LAbDXQAkbjcJxtEVMhbYyg
 IPf1Sb8xD9X05+ik6s+sHO9fDyBFKqU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-Pe9ENDv4Omm6wBJA8-gkPg-1; Thu, 06 Oct 2022 09:42:49 -0400
X-MC-Unique: Pe9ENDv4Omm6wBJA8-gkPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D62F2932497
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 13:42:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4BCB17584;
 Thu,  6 Oct 2022 13:42:47 +0000 (UTC)
Date: Thu, 6 Oct 2022 14:42:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qtest: start a VNC test
Message-ID: <Yz7bVdjGtnfmZ/Uj@redhat.com>
References: <20221006130513.2683873-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006130513.2683873-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 06, 2022 at 05:05:13PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This is some of the simplest test we could perform, it simply connects
> to the VNC server via passed-in socket FDs and checks the connection can
> be established.
> 
> Another series will make this test work on Windows as well.
> 
> As always, more tests can be added later! :)

This test program uses GTK-VNC's  VncConnection class, which makes sense
for testing the expected behaviour, not least because GTK-VNC is what
alot of QEMU clients will use. IOW, its good to ensure we don't regress
with GTK-VNC.

Looking at testing from a robustness POV though, it is desirable to be
able to try various bad things in an attempt to trip up QEMU's VNC server
and potentially exploit it. This will be pretty much impossible todo using
VncConnection, and would require being able to speak the raw VNC protocol
on the sockets, and take unsual actions like sending requests but not
processing the results.

Any thoughts on the "bad" testing ?

> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/qtest/vnc-display-test.c | 103 +++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build        |   8 ++-
>  2 files changed, 110 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/vnc-display-test.c
> 
> diff --git a/tests/qtest/vnc-display-test.c b/tests/qtest/vnc-display-test.c
> new file mode 100644
> index 0000000000..e2a9d682bb
> --- /dev/null
> +++ b/tests/qtest/vnc-display-test.c
> @@ -0,0 +1,103 @@
> +/*
> + * VNC display tests
> + *
> + * Copyright (c) 2022 Red Hat, Inc.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/sockets.h"
> +#include "libqtest.h"
> +#include <gio/gio.h>
> +#include <gvnc.h>
> +
> +typedef struct Test {
> +    QTestState *qts;
> +    VncConnection *conn;
> +    GMainLoop *loop;
> +} Test;
> +
> +static void on_vnc_error(VncConnection* self,
> +                         const char* msg)
> +{
> +    g_error("vnc-error: %s", msg);
> +}
> +
> +static void on_vnc_auth_failure(VncConnection *self,
> +                                const char *msg)
> +{
> +    g_error("vnc-auth-failure: %s", msg);
> +}
> +
> +static bool
> +test_setup(Test *test)
> +{
> +#ifdef WIN32
> +    g_test_skip("Not supported on Windows yet");
> +    return false;
> +#else
> +    int pair[2];
> +
> +    test->qts = qtest_init("-vnc none -name vnc-test");
> +
> +    g_assert_cmpint(qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, pair), ==, 0);
> +
> +    qtest_qmp_add_client(test->qts, "vnc", pair[1]);
> +
> +    test->conn = vnc_connection_new();
> +    g_signal_connect(test->conn, "vnc-error",
> +                     G_CALLBACK(on_vnc_error), NULL);
> +    g_signal_connect(test->conn, "vnc-auth-failure",
> +                     G_CALLBACK(on_vnc_auth_failure), NULL);
> +    vnc_connection_set_auth_type(test->conn, VNC_CONNECTION_AUTH_NONE);
> +    vnc_connection_open_fd(test->conn, pair[0]);
> +
> +    test->loop = g_main_loop_new(NULL, FALSE);
> +    return true;
> +#endif
> +}
> +
> +static void
> +test_vnc_basic_on_vnc_initialized(VncConnection *self,
> +                                 Test *test)
> +{
> +    const char *name = vnc_connection_get_name(test->conn);
> +
> +    g_assert_cmpstr(name, ==, "QEMU (vnc-test)");
> +    g_main_loop_quit(test->loop);
> +}
> +
> +static void
> +test_vnc_basic(void)
> +{
> +    Test test;
> +
> +    if (!test_setup(&test)) {
> +        return;
> +    }
> +
> +    g_signal_connect(test.conn, "vnc-initialized",
> +                     G_CALLBACK(test_vnc_basic_on_vnc_initialized), &test);
> +
> +    g_main_loop_run(test.loop);
> +
> +    qtest_quit(test.qts);
> +    g_object_unref(test.conn);
> +    g_main_loop_unref(test.loop);
> +}
> +
> +int
> +main(int argc, char **argv)
> +{
> +    if (getenv("GTK_VNC_DEBUG")) {
> +        vnc_util_set_debug(true);
> +    }
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/vnc-display/basic", test_vnc_basic);
> +
> +    return g_test_run();
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 455f1bbb7e..c07a5b1a5f 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -306,8 +306,14 @@ qtests = {
>    'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
>  }
>  
> +gvnc = dependency('gvnc-1.0', required: false)
> +if gvnc.found()
> +  qtests += {'vnc-display-test': [gvnc]}
> +  qtests_generic += [ 'vnc-display-test' ]
> +endif
> +
>  if dbus_display
> -qtests += {'dbus-display-test': [dbus_display1, gio]}
> +  qtests += {'dbus-display-test': [dbus_display1, gio]}
>  endif
>  
>  qtest_executables = {}
> -- 
> 2.37.3
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


