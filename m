Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8702458CC87
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 19:09:29 +0200 (CEST)
Received: from localhost ([::1]:37922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL6Fr-0003X7-LF
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 13:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oL6Ai-0006ZN-W5
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 13:04:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oL6Ae-00028u-0s
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 13:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659978242;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30Nom3EROhcXcWW9Wnvoz5wBWSw4u7mvzRFnef18IJ0=;
 b=AnVFcZB22gX2YX+NSej1t1RJ0w76PoUIjKLqujX2O8FWUdgjOuwO/5CTWNuH6u2+epZ2Lt
 9vWdZjKdE03dLFhrijoaSBsJjDZV8mhOtdPi30ZcDHHHIe0zmcgHQmdvaoE5l58teJ45Li
 AhQL2X+pz9shZNz9WjY/jOvji2xEE7Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-vgAjMRtLNgOZ9A_Ol8MEqQ-1; Mon, 08 Aug 2022 13:04:00 -0400
X-MC-Unique: vgAjMRtLNgOZ9A_Ol8MEqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C7D8294EDCE
 for <qemu-devel@nongnu.org>; Mon,  8 Aug 2022 17:04:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5526D9457F;
 Mon,  8 Aug 2022 17:03:59 +0000 (UTC)
Date: Mon, 8 Aug 2022 18:03:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 1/1] tests/qtest: add scenario for -readconfig handling
Message-ID: <YvFB/DZ+lYRHbd+U@redhat.com>
References: <20220805115529.124544-1-berrange@redhat.com>
 <20220805115529.124544-2-berrange@redhat.com>
 <0d00fbb9-3b47-6041-4afa-63bb618689f0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d00fbb9-3b47-6041-4afa-63bb618689f0@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Aug 08, 2022 at 07:55:50AM +0200, Thomas Huth wrote:
> On 05/08/2022 13.55, Daniel P. Berrangé wrote:
> > This test of -readconfig validates the last three regressions we
> > have fixed with -readconfig:
> > 
> >   * Interpretation of memory size units as MiB not bytes
> >   * Allow use of [spice]
> >   * Allow use of [object]
> 
> Good idea!
> 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   tests/qtest/meson.build       |   1 +
> >   tests/qtest/readconfig-test.c | 195 ++++++++++++++++++++++++++++++++++
> >   2 files changed, 196 insertions(+)
> >   create mode 100644 tests/qtest/readconfig-test.c
> > 
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index 3a474010e4..be4b30dea2 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -26,6 +26,7 @@ qtests_generic = [
> >     'qom-test',
> >     'test-hmp',
> >     'qos-test',
> > +  'readconfig-test',
> >   ]
> >   if config_host.has_key('CONFIG_MODULES')
> >     qtests_generic += [ 'modules-test' ]
> > diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
> > new file mode 100644
> > index 0000000000..2e604d7c2d
> > --- /dev/null
> > +++ b/tests/qtest/readconfig-test.c
> > @@ -0,0 +1,195 @@
> > +/*
> > + * Validate -readconfig
> > + *
> > + * Copyright (c) 2022 Red Hat, Inc.
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "libqtest.h"
> > +#include "qapi/error.h"
> > +#include "qapi/qapi-visit-machine.h"
> > +#include "qapi/qapi-visit-qom.h"
> > +#include "qapi/qapi-visit-ui.h"
> > +#include "qapi/qmp/qdict.h"
> > +#include "qapi/qmp/qlist.h"
> > +#include "qapi/qobject-input-visitor.h"
> > +#include "qapi/qmp/qstring.h"
> > +#include "qemu/units.h"
> > +
> > +static QTestState *qtest_init_with_config(const char *cfgdata)
> > +{
> > +    GError *error = NULL;
> > +    g_autofree char *args = NULL;
> > +    int cfgfd = -1;
> > +    g_autofree char *cfgpath = NULL;
> > +    QTestState *qts;
> > +    ssize_t ret;
> > +
> > +    cfgfd = g_file_open_tmp("readconfig-test-XXXXXX", &cfgpath, &error);
> > +    g_assert_no_error(error);
> > +    g_assert_cmpint(cfgfd, >=, 0);
> > +
> > +    ret = qemu_write_full(cfgfd, cfgdata, strlen(cfgdata));
> > +    if (ret < 0) {
> > +        unlink(cfgpath);
> > +    }
> > +    g_assert_cmpint(ret, ==, strlen(cfgdata));
> > +
> > +    close(cfgfd);
> 
> Maybe move the close() before the "if (ret < 0)"
> 
> > +    args = g_strdup_printf("-nodefaults -machine none -readconfig %s", cfgpath);
> > +
> > +    qts = qtest_init(args);
> > +
> > +    unlink(cfgpath);
> > +
> > +    return qts;
> > +}
> > +
> > +static void test_x86_memdev_resp(QObject *res)
> > +{
> > +    Visitor *v;
> > +    g_autoptr(MemdevList) memdevs = NULL;
> > +    Memdev *memdev;
> > +
> > +    g_assert(res);
> > +    v = qobject_input_visitor_new(res);
> > +    visit_type_MemdevList(v, NULL, &memdevs, &error_abort);
> > +
> > +    g_assert(memdevs);
> > +    g_assert(memdevs->value);
> > +    g_assert(!memdevs->next);
> > +
> > +    memdev = memdevs->value;
> > +    g_assert_cmpstr(memdev->id, ==, "ram");
> > +    g_assert_cmpint(memdev->size, ==, 200 * MiB);
> > +
> > +    visit_free(v);
> > +}
> > +
> > +static void test_x86_memdev(void)
> > +{
> > +    QDict *resp;
> > +    QTestState *qts;
> > +    const char *cfgdata =
> > +        "[memory]\n"
> > +        "size = \"200\"";
> > +
> > +    qts = qtest_init_with_config(cfgdata);
> > +   /* Test valid command */
> 
> Comment has bad indentation.
> 
> > +    resp = qtest_qmp(qts, "{ 'execute': 'query-memdev' }");
> > +    test_x86_memdev_resp(qdict_get(resp, "return"));
> > +    qobject_unref(resp);
> > +
> > +    qtest_quit(qts);
> > +}
> > +
> > +
> > +#ifdef CONFIG_SPICE
> > +static void test_spice_resp(QObject *res)
> > +{
> > +    Visitor *v;
> > +    g_autoptr(SpiceInfo) spice = NULL;
> > +
> > +    g_assert(res);
> > +    v = qobject_input_visitor_new(res);
> > +    visit_type_SpiceInfo(v, "spcie", &spice, &error_abort);
> 
> That "spcie" looks like a typo?

Yes, but I believe this argument is ignored by the visitor in this
scenario - it didn't fail for me at least.

Regardless, sHould be fixed of course


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


