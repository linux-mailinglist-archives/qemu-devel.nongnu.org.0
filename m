Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37554EB454
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 21:57:16 +0200 (CEST)
Received: from localhost ([::1]:45934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZHxr-0004Wq-Ug
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 15:57:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZHve-0002mn-Uy
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:55:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZHva-0004Lr-HO
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648583693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmMXMjFG6EIQhuN9UGtsOJjiCfOfvYrZ0KP7jFxjA50=;
 b=aGuODrUSSiJ0AQTxqgEwPnhp3xupnuGhRZ27rBscSPf3r6DaIiDjJuCBfYbSZNArxspm5c
 kLtIxj4Ja0TZvLdNbZ08YFCocYXJQcF7xBmaSbRCA10st8sUCptSsfmSAFeeOQ4bz21hGl
 KS87LXzXV4XCKxX023B+7XVJd15bF5I=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-AjUy9s74PuasYxDTkRYP8w-1; Tue, 29 Mar 2022 15:54:51 -0400
X-MC-Unique: AjUy9s74PuasYxDTkRYP8w-1
Received: by mail-qt1-f198.google.com with SMTP id
 k1-20020ac85fc1000000b002e1c5930386so15666270qta.3
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 12:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HmMXMjFG6EIQhuN9UGtsOJjiCfOfvYrZ0KP7jFxjA50=;
 b=Nf4qQbvmSkK2hE6GEXoyNmSSLh4/wSkL1nOYhLa2550hoJDA2wLotWBKXO/W2Wae5C
 YUrfGEAhBXn15Fa2L9IVA817302BdTB70jXo6kCYDdHZYt26DMdkjCTZeQMRfheuEDFi
 XuYsbRS34HoC9ok/4rC8xtzwIzPRo2EBNt1AJNO0dIQOkX0lwKFCE6aYsw9M62Xnu0v9
 2q4m7kuGU0u52A5IIvuH2QBN4Fqr1nW6lQ8/puYMu6ozKHdVvArj3YkXZUc6fsvr31bC
 4TRD3gNiKX8lio+A9LAYcrJmiP1it6kMtaJw/UyOErDafErit01l8Mp0EfbfUFNMxaWY
 COBA==
X-Gm-Message-State: AOAM533QbMh7mY6y4iJQx+byPMLzKTjd/Kr6Qi32YWrQcqUOhtwy4FzL
 J4FQRqv2M0ipXISiRc2VgBUf3lNYRL/ZVraQl0Yq4X+SYo4V8rFjSDUgWvXlNtFZnG6pmf0PiNu
 8zqtIZWqPP5+I62A=
X-Received: by 2002:a05:620a:2981:b0:67d:6a35:70f2 with SMTP id
 r1-20020a05620a298100b0067d6a3570f2mr21331914qkp.404.1648583691192; 
 Tue, 29 Mar 2022 12:54:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeYGPD6h7WMzc/5aNNf7l95lOZ7RkReHZzvz/TtqBjN4ivuUZ22tYily+gqdTOU5aXF114rQ==
X-Received: by 2002:a05:620a:2981:b0:67d:6a35:70f2 with SMTP id
 r1-20020a05620a298100b0067d6a3570f2mr21331904qkp.404.1648583690853; 
 Tue, 29 Mar 2022 12:54:50 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 188-20020a3709c5000000b0067b147584c2sm9928238qkj.102.2022.03.29.12.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 12:54:50 -0700 (PDT)
Date: Tue, 29 Mar 2022 15:54:49 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v21 9/9] tests: Add dirty page rate limit test
Message-ID: <YkNkCWCXj3ZM5kyv@xz-m1.local>
References: <cover.1647435820.git.huangy81@chinatelecom.cn>
 <22a74578fb2127fc65fd98b0c04ed3a7706a7f08.1647435820.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <22a74578fb2127fc65fd98b0c04ed3a7706a7f08.1647435820.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 09:07:21PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Add dirty page rate limit test if kernel support dirty ring,
> create a standalone file to implement the test case.
> 
> The following qmp commands are covered by this test case:
> "calc-dirty-rate", "query-dirty-rate", "set-vcpu-dirty-limit",
> "cancel-vcpu-dirty-limit" and "query-vcpu-dirty-limit".
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  tests/qtest/dirtylimit-test.c | 327 ++++++++++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build       |   2 +
>  2 files changed, 329 insertions(+)
>  create mode 100644 tests/qtest/dirtylimit-test.c
> 
> diff --git a/tests/qtest/dirtylimit-test.c b/tests/qtest/dirtylimit-test.c
> new file mode 100644
> index 0000000..b8d9960
> --- /dev/null
> +++ b/tests/qtest/dirtylimit-test.c
> @@ -0,0 +1,327 @@
> +/*
> + * QTest testcase for Dirty Page Rate Limit
> + *
> + * Copyright (c) 2022 CHINA TELECOM CO.,LTD.
> + *
> + * Authors:
> + *  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqos/libqtest.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qlist.h"
> +#include "qapi/qobject-input-visitor.h"
> +#include "qapi/qobject-output-visitor.h"
> +
> +#include "migration-helpers.h"
> +#include "tests/migration/i386/a-b-bootblock.h"
> +
> +/*
> + * Dirtylimit stop working if dirty page rate error
> + * value less than DIRTYLIMIT_TOLERANCE_RANGE
> + */
> +#define DIRTYLIMIT_TOLERANCE_RANGE  25  /* MB/s */
> +
> +static const char *tmpfs;
> +
> +static QDict *qmp_command(QTestState *who, const char *command, ...)
> +{
> +    va_list ap;
> +    QDict *resp, *ret;
> +
> +    va_start(ap, command);
> +    resp = qtest_vqmp(who, command, ap);
> +    va_end(ap);
> +
> +    g_assert(!qdict_haskey(resp, "error"));
> +    g_assert(qdict_haskey(resp, "return"));
> +
> +    ret = qdict_get_qdict(resp, "return");
> +    qobject_ref(ret);
> +    qobject_unref(resp);
> +
> +    return ret;
> +}
> +
> +static void calc_dirty_rate(QTestState *who, uint64_t calc_time)
> +{
> +    qobject_unref(qmp_command(who,
> +                  "{ 'execute': 'calc-dirty-rate',"
> +                  "'arguments': { "
> +                  "'calc-time': %ld,"
> +                  "'mode': 'dirty-ring' }}",
> +                  calc_time));
> +}
> +
> +static QDict *query_dirty_rate(QTestState *who)
> +{
> +    return qmp_command(who, "{ 'execute': 'query-dirty-rate' }");
> +}
> +
> +static void dirtylimit_set_all(QTestState *who, uint64_t dirtyrate)
> +{
> +    qobject_unref(qmp_command(who,
> +                  "{ 'execute': 'set-vcpu-dirty-limit',"
> +                  "'arguments': { "
> +                  "'dirty-rate': %ld } }",
> +                  dirtyrate));
> +}
> +
> +static void cancel_vcpu_dirty_limit(QTestState *who)
> +{
> +    qobject_unref(qmp_command(who,
> +                  "{ 'execute': 'cancel-vcpu-dirty-limit' }"));
> +}
> +
> +static QDict *query_vcpu_dirty_limit(QTestState *who)
> +{
> +    QDict *rsp;
> +
> +    rsp = qtest_qmp(who, "{ 'execute': 'query-vcpu-dirty-limit' }");
> +    g_assert(!qdict_haskey(rsp, "error"));
> +    g_assert(qdict_haskey(rsp, "return"));
> +
> +    return rsp;
> +}
> +
> +static bool calc_dirtyrate_ready(QTestState *who)
> +{
> +    QDict *rsp_return;
> +    gchar *status;
> +
> +    rsp_return = query_dirty_rate(who);
> +    g_assert(rsp_return);
> +
> +    status = g_strdup(qdict_get_str(rsp_return, "status"));
> +    g_assert(status);
> +
> +    return g_strcmp0(status, "measuring");
> +}
> +
> +static void wait_for_calc_dirtyrate_complete(QTestState *who,
> +                                             int64_t calc_time)
> +{
> +    int max_try_count = 200;
> +    usleep(calc_time);
> +
> +    while (!calc_dirtyrate_ready(who) && max_try_count--) {
> +        usleep(1000);
> +    }
> +
> +    /*
> +     * Set the timeout with 200 ms(max_try_count * 1000us),
> +     * if dirtyrate measurement not complete, test failed.
> +     */
> +    g_assert_cmpint(max_try_count, !=, 0);

200ms might be still too challenging for busy systems?  How about make it
in seconds (e.g. 10 seconds)?

> +}
> +
> +static int64_t get_dirty_rate(QTestState *who)
> +{
> +    QDict *rsp_return;
> +    gchar *status;
> +    QList *rates;
> +    const QListEntry *entry;
> +    QDict *rate;
> +    int64_t dirtyrate;
> +
> +    rsp_return = query_dirty_rate(who);
> +    g_assert(rsp_return);
> +
> +    status = g_strdup(qdict_get_str(rsp_return, "status"));
> +    g_assert(status);
> +    g_assert_cmpstr(status, ==, "measured");
> +
> +    rates = qdict_get_qlist(rsp_return, "vcpu-dirty-rate");
> +    g_assert(rates && !qlist_empty(rates));
> +
> +    entry = qlist_first(rates);
> +    g_assert(entry);
> +
> +    rate = qobject_to(QDict, qlist_entry_obj(entry));
> +    g_assert(rate);
> +
> +    dirtyrate = qdict_get_try_int(rate, "dirty-rate", -1);
> +
> +    qobject_unref(rsp_return);
> +    return dirtyrate;
> +}
> +
> +static int64_t get_limit_rate(QTestState *who)
> +{
> +    QDict *rsp_return;
> +    QList *rates;
> +    const QListEntry *entry;
> +    QDict *rate;
> +    int64_t dirtyrate;
> +
> +    rsp_return = query_vcpu_dirty_limit(who);
> +    g_assert(rsp_return);
> +
> +    rates = qdict_get_qlist(rsp_return, "return");
> +    g_assert(rates && !qlist_empty(rates));
> +
> +    entry = qlist_first(rates);
> +    g_assert(entry);
> +
> +    rate = qobject_to(QDict, qlist_entry_obj(entry));
> +    g_assert(rate);
> +
> +    dirtyrate = qdict_get_try_int(rate, "limit-rate", -1);
> +
> +    qobject_unref(rsp_return);
> +    return dirtyrate;
> +}
> +
> +static QTestState *start_vm(void)
> +{
> +    QTestState *vm = NULL;
> +    g_autofree gchar *cmd = NULL;
> +    const char *arch = qtest_get_arch();
> +    g_autofree char *bootpath = NULL;
> +
> +    assert((strcmp(arch, "x86_64") == 0));
> +    bootpath = g_strdup_printf("%s/bootsect", tmpfs);
> +    assert(sizeof(x86_bootsect) == 512);
> +    init_bootfile(bootpath, x86_bootsect, sizeof(x86_bootsect));
> +
> +    cmd = g_strdup_printf("-accel kvm,dirty-ring-size=4096 "
> +                          "-name dirtylimit-test,debug-threads=on "
> +                          "-m 150M -smp 1 "
> +                          "-serial file:%s/vm_serial "
> +                          "-drive file=%s,format=raw ",
> +                          tmpfs, bootpath);
> +
> +    vm = qtest_init(cmd);
> +    return vm;
> +}
> +
> +static void cleanup(const char *filename)
> +{
> +    g_autofree char *path = g_strdup_printf("%s/%s", tmpfs, filename);
> +    unlink(path);
> +}

Duplicated code - again, I'd suggest we drop previous patch and simply add
a new test into migration-test.c.  We could do the split later at any time,
but we'll need to think about how to split, not do that randomly..

> +
> +static void stop_vm(QTestState *vm)
> +{
> +    qtest_quit(vm);
> +    cleanup("bootsect");
> +    cleanup("vm_serial");
> +}
> +
> +static void test_vcpu_dirty_limit(void)
> +{
> +    QTestState *vm;
> +    int64_t origin_rate;
> +    int64_t quota_rate;
> +    int64_t rate ;
> +    int max_try_count = 5;
> +    int hit = 0;
> +
> +    vm = start_vm();
> +    if (!vm) {
> +        return;
> +    }

vm should always exist.

> +
> +    /* Wait for the first serial output from the vm*/
> +    wait_for_serial(tmpfs, "vm_serial");
> +
> +    /* Do dirtyrate measurement with calc time equals 1s */
> +    calc_dirty_rate(vm, 1);
> +
> +    /* Sleep a calc time and wait for calc dirtyrate complete */
> +    wait_for_calc_dirtyrate_complete(vm, 1 * 1000000);

1*1000000 reads odd..  I'd pass in 1 here and make the variable called
"seconds", then multiply there in the helper.

> +
> +    /* Query original dirty page rate */
> +    origin_rate = get_dirty_rate(vm);
> +
> +    /* VM booted from bootsect should dirty memory */
> +    assert(origin_rate != 0);
> +
> +    /* Setup quota dirty page rate at one-third of origin */
> +    quota_rate = origin_rate / 3;
> +
> +    /* Set dirtylimit and wait a bit to check if it take effect */
> +    dirtylimit_set_all(vm, quota_rate);
> +    usleep(2000000);

Nit: could move this to be after the g_assert check, because the limit
should apply immediately.

> +
> +    /*
> +     * Check if set-vcpu-dirty-limit and query-vcpu-dirty-limit
> +     * works literally
> +     */
> +    g_assert_cmpint(quota_rate, ==, get_limit_rate(vm));
> +
> +    /* Check if dirtylimit take effect realistically */
> +    while (--max_try_count) {
> +        calc_dirty_rate(vm, 1);
> +        wait_for_calc_dirtyrate_complete(vm, 1 * 1000000);
> +        rate = get_dirty_rate(vm);
> +
> +        /*
> +         * Assume hitting if current rate is less
> +         * than quota rate (within accepting error)
> +         */
> +        if (rate < (quota_rate + DIRTYLIMIT_TOLERANCE_RANGE)) {
> +            hit = 1;
> +            break;
> +        }
> +    }

I'm not sure 5 loops would be enough; bigger? I'd try running this test in
parallel with e.g. 20 instances on the host and see how slow it could
be. :)

The rest keeps look good to me.

Thanks,

> +
> +    g_assert_cmpint(hit, ==, 1);
> +
> +    hit = 0;
> +    max_try_count = 5;
> +
> +    /* Check if dirtylimit cancellation take effect */
> +    cancel_vcpu_dirty_limit(vm);
> +    while (--max_try_count) {
> +        calc_dirty_rate(vm, 1);
> +        wait_for_calc_dirtyrate_complete(vm, 1 * 1000000);
> +        rate = get_dirty_rate(vm);
> +
> +        /*
> +         * Assume dirtylimit be canceled if current rate is
> +         * greater than quota rate (within accepting error)
> +         */
> +        if (rate > (quota_rate + DIRTYLIMIT_TOLERANCE_RANGE)) {
> +            hit = 1;
> +            break;
> +        }
> +    }
> +
> +    g_assert_cmpint(hit, ==, 1);
> +    stop_vm(vm);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    char template[] = "/tmp/dirtylimit-test-XXXXXX";
> +    int ret;
> +
> +    tmpfs = mkdtemp(template);
> +    if (!tmpfs) {
> +        g_test_message("mkdtemp on path (%s): %s", template, strerror(errno));
> +    }
> +    g_assert(tmpfs);
> +
> +    if (!kvm_dirty_ring_supported()) {
> +        return 0;
> +    }
> +
> +    g_test_init(&argc, &argv, NULL);
> +    qtest_add_func("/dirtylimit/test", test_vcpu_dirty_limit);
> +    ret = g_test_run();
> +
> +    g_assert_cmpint(ret, ==, 0);
> +
> +    ret = rmdir(tmpfs);
> +    if (ret != 0) {
> +        g_test_message("unable to rmdir: path (%s): %s",
> +                       tmpfs, strerror(errno));
> +    }
> +
> +    return ret;
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index d25f82b..6b041e0 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -32,6 +32,7 @@ qtests_generic = \
>    'qom-test',
>    'test-hmp',
>    'qos-test',
> +  'dirtylimit-test',
>  ]
>  if config_host.has_key('CONFIG_MODULES')
>    qtests_generic += [ 'modules-test' ]
> @@ -296,6 +297,7 @@ qtests = {
>    'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>    'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>    'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
> +  'dirtylimit-test': files('migration-helpers.c'),
>  }
>  
>  if dbus_display
> -- 
> 1.8.3.1
> 

-- 
Peter Xu


