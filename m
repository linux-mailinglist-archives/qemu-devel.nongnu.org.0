Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBD746B621
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 09:36:46 +0100 (CET)
Received: from localhost ([::1]:38764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVxt-0006S6-Bn
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 03:36:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muVwd-0004yg-Cw
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 03:35:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muVwa-0005nV-8o
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 03:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638866123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwK+SFEvqiKiNejcsbYu/b5Sp3swuY5I/aR2OZ7dcgU=;
 b=amKwMWr44pnpcyKXA0Zi7rhnYydBZgFUcBW/EO+bUBipmualnoRXqJhO8zZFeHIocV2sgr
 TS7qJznrtNOQV1hu1MO1dyqFtuMfxRzv3QNOzJ0qsN1qMCrK6kamtZumjtJM9Uxgo9gSU/
 DwIebXmYumvKbnvZzBewFoMtzjgS4XA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-5JiQGrsuOTKkBSdWY1FkKA-1; Tue, 07 Dec 2021 03:35:22 -0500
X-MC-Unique: 5JiQGrsuOTKkBSdWY1FkKA-1
Received: by mail-wm1-f71.google.com with SMTP id
 187-20020a1c02c4000000b003335872db8dso7392337wmc.2
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 00:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EwK+SFEvqiKiNejcsbYu/b5Sp3swuY5I/aR2OZ7dcgU=;
 b=qsLgoQmAjlJwpWpE9i+yMV8UDwP1QSCKNCBW7s/7O93gL2FKKpKZdsIc67r1sqccGa
 h1AHlvS/xX9dF9dYQYUgrpqfHEp0VlYwEg4K7251UcLUKi2IB3dti7T+QJeh/P6gvCkV
 dsy+EgQ//1DM+5QWp2ox0Vny2Z/RnkIcy8q5mhsfJlxnQFC6QWEjPImruL9xxFuKXdRO
 qEbaVFSJUnVc1jKh3HLfWP/EoA+82a/e4v9ydaZeWxnjHU2D3hc+HWpDTaJTbH9IpUlh
 PVAjTvvYIQ97sDPWMY5xmX3Vo5V57VdoRBz9xwoGUeNQT9W5TjVd5w7L3wtop87/zqtM
 9T7w==
X-Gm-Message-State: AOAM532HQqpgs9Go2VC3VK1liAsGShpjiqm3TSLtisyduXe9Ywo4MEuA
 PfQv8vAAKUfxSd7h2xUwn9g1doLxZfRNQ8LiKzM3qWzmuQuTNnK9Di715rxq2PpydcctoS7s4SL
 n/exFd4CYOVLYu+8=
X-Received: by 2002:a05:6000:110b:: with SMTP id
 z11mr49563909wrw.32.1638866121172; 
 Tue, 07 Dec 2021 00:35:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlRK0LG2EdNjNqF/FKjRogXnLe0IRHob+SU6zb3nBE8J+FwtzFnj3h9DiX3kmQyrVsVxOUaA==
X-Received: by 2002:a05:6000:110b:: with SMTP id
 z11mr49563878wrw.32.1638866120909; 
 Tue, 07 Dec 2021 00:35:20 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id j134sm1929405wmj.3.2021.12.07.00.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 00:35:20 -0800 (PST)
Message-ID: <7d398af6-2383-a09a-b4ca-b821bf94fd11@redhat.com>
Date: Tue, 7 Dec 2021 09:35:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 5/6] test/libqtest: add some virtio-net failover
 migration cancelling tests
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211206222040.3872253-1-lvivier@redhat.com>
 <20211206222040.3872253-6-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211206222040.3872253-6-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/2021 23.20, Laurent Vivier wrote:
> Add some tests to check the state of the machine if the migration
> is cancelled while we are using virtio-net failover.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   tests/qtest/virtio-net-failover.c | 291 ++++++++++++++++++++++++++++++
>   1 file changed, 291 insertions(+)
> 
> diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
> index c88f8ddec39a..57abb99e7f6e 100644
> --- a/tests/qtest/virtio-net-failover.c
> +++ b/tests/qtest/virtio-net-failover.c
> @@ -682,6 +682,289 @@ static void test_migrate_in(gconstpointer opaque)
>       machine_stop(qts);
>   }
>   
> +static void test_migrate_abort_wait_unplug(gconstpointer opaque)
> +{
> +    QTestState *qts;
> +    QDict *resp, *args, *data, *ret;
> +    g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
> +    const gchar *status;
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-netdev user,id=hs1 ",
> +                     2);
> +
> +    check_one_card(qts, false, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby0",
> +                         "{'bus': 'root0',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs0',"
> +                         "'mac': '"MAC_STANDBY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    start_virtio_net(qts, 1, 0, "standby0");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "primary0",
> +                         "{'bus': 'root1',"
> +                         "'failover_pair_id': 'standby0',"
> +                         "'netdev': 'hs1',"
> +                         "'rombar': 0,"
> +                         "'romfile': '',"
> +                         "'mac': '"MAC_PRIMARY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    args = qdict_from_jsonf_nofail("{}");
> +    g_assert_nonnull(args);
> +    qdict_put_str(args, "uri", uri);
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'migrate', 'arguments': %p}", args);
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    /* the event is sent whan QEMU asks the OS to unplug the card */
> +    resp = qtest_qmp_eventwait_ref(qts, "UNPLUG_PRIMARY");
> +    g_assert(qdict_haskey(resp, "data"));
> +
> +    data = qdict_get_qdict(resp, "data");
> +    g_assert(qdict_haskey(data, "device-id"));
> +    g_assert_cmpstr(qdict_get_str(data, "device-id"), ==, "primary0");
> +
> +    qobject_unref(resp);
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'migrate_cancel' }");
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    /* migration has been cancelled while the unplug was in progress */
> +
> +    /* while the card is not ejected, we must be in "cancelling" state */
> +    ret = migrate_status(qts);
> +
> +    status = qdict_get_str(ret, "status");
> +    g_assert_cmpstr(status, ==, "cancelling");
> +    qobject_unref(ret);
> +
> +    /* OS unplugs the cards, QEMU can move from wait-unplug state */
> +    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
> +
> +    while (true) {
> +        ret = migrate_status(qts);
> +
> +        status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "cancelled") == 0) {
> +            break;
> +        }
> +        g_assert_cmpstr(status, !=, "failed");
> +        g_assert_cmpstr(status, !=, "active");
> +        qobject_unref(ret);
> +    }
> +    qobject_unref(ret);
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    machine_stop(qts);
> +}
> +
> +static void test_migrate_abort_active(gconstpointer opaque)
> +{
> +    QTestState *qts;
> +    QDict *resp, *args, *data, *ret;
> +    g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
> +    const gchar *status;
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-netdev user,id=hs1 ",
> +                     2);
> +
> +    check_one_card(qts, false, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby0",
> +                         "{'bus': 'root0',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs0',"
> +                         "'mac': '"MAC_STANDBY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    start_virtio_net(qts, 1, 0, "standby0");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "primary0",
> +                         "{'bus': 'root1',"
> +                         "'failover_pair_id': 'standby0',"
> +                         "'netdev': 'hs1',"
> +                         "'rombar': 0,"
> +                         "'romfile': '',"
> +                         "'mac': '"MAC_PRIMARY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    args = qdict_from_jsonf_nofail("{}");
> +    g_assert_nonnull(args);
> +    qdict_put_str(args, "uri", uri);
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'migrate', 'arguments': %p}", args);
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    /* the event is sent whan QEMU asks the OS to unplug the card */
> +    resp = qtest_qmp_eventwait_ref(qts, "UNPLUG_PRIMARY");
> +    g_assert(qdict_haskey(resp, "data"));
> +
> +    data = qdict_get_qdict(resp, "data");
> +    g_assert(qdict_haskey(data, "device-id"));
> +    g_assert_cmpstr(qdict_get_str(data, "device-id"), ==, "primary0");
> +
> +    qobject_unref(resp);
> +
> +    /* OS unplugs the cards, QEMU can move from wait-unplug state */
> +    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
> +
> +    while (true) {
> +        ret = migrate_status(qts);
> +
> +        status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "wait-unplug") != 0) {
> +            break;
> +        }
> +        g_assert_cmpstr(status, !=, "failed");
> +        qobject_unref(ret);
> +    }
> +    qobject_unref(resp);
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'migrate_cancel' }");
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    while (true) {
> +        ret = migrate_status(qts);
> +
> +        status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "cancelled") == 0) {
> +            break;
> +        }
> +        g_assert_cmpstr(status, !=, "failed");
> +        g_assert_cmpstr(status, !=, "active");
> +        qobject_unref(ret);
> +    }
> +    qobject_unref(ret);
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    machine_stop(qts);
> +}
> +
> +static void test_migrate_abort_timeout(gconstpointer opaque)
> +{
> +    QTestState *qts;
> +    QDict *resp, *args, *data, *ret;
> +    g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
> +    const gchar *status;
> +    int total;
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-netdev user,id=hs1 ",
> +                     2);
> +
> +    check_one_card(qts, false, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby0",
> +                         "{'bus': 'root0',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs0',"
> +                         "'mac': '"MAC_STANDBY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    start_virtio_net(qts, 1, 0, "standby0");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "primary0",
> +                         "{'bus': 'root1',"
> +                         "'failover_pair_id': 'standby0',"
> +                         "'netdev': 'hs1',"
> +                         "'rombar': 0,"
> +                         "'romfile': '',"
> +                         "'mac': '"MAC_PRIMARY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    args = qdict_from_jsonf_nofail("{}");
> +    g_assert_nonnull(args);
> +    qdict_put_str(args, "uri", uri);
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'migrate', 'arguments': %p}", args);
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    /* the event is sent whan QEMU asks the OS to unplug the card */
> +    resp = qtest_qmp_eventwait_ref(qts, "UNPLUG_PRIMARY");
> +    g_assert(qdict_haskey(resp, "data"));
> +
> +    data = qdict_get_qdict(resp, "data");
> +    g_assert(qdict_haskey(data, "device-id"));
> +    g_assert_cmpstr(qdict_get_str(data, "device-id"), ==, "primary0");
> +
> +    qobject_unref(resp);
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'migrate_cancel' }");
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    /* migration has been cancelled while the unplug was in progress */
> +
> +    /* while the card is not ejected, we must be in "cancelling" state */
> +
> +    total = 0;
> +    while (true) {
> +        ret = migrate_status(qts);
> +
> +        status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "cancelled") == 0) {
> +            break;
> +        }
> +        g_assert_cmpstr(status, ==, "cancelling");
> +        g_assert(qdict_haskey(ret, "total-time"));
> +        total = qdict_get_int(ret, "total-time");
> +        qobject_unref(ret);
> +    }
> +    qobject_unref(ret);
> +
> +    /*
> +     * migration timeout in this case is 30 seconds
> +     * check we exit on the timeout (ms)
> +     */
> +    g_assert_cmpint(total, >, 30000);
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    machine_stop(qts);
> +}
> +
>   int main(int argc, char **argv)
>   {
>       gchar *tmpfile = g_strdup_printf("/tmp/failover_test_migrate-%u-%u",
> @@ -714,6 +997,14 @@ int main(int argc, char **argv)
>                           test_migrate_out);
>       qtest_add_data_func("failover-virtio-net/migrate/in", tmpfile,
>                           test_migrate_in);
> +    qtest_add_data_func("failover-virtio-net/migrate/abort/wait-unplug",
> +                        tmpfile, test_migrate_abort_wait_unplug);
> +    qtest_add_data_func("failover-virtio-net/migrate/abort/active", tmpfile,
> +                        test_migrate_abort_active);
> +    if (g_test_slow()) {
> +        qtest_add_data_func("failover-virtio-net/migrate/abort/timeout",
> +                            tmpfile, test_migrate_abort_timeout);
> +    }
>   
>       ret = g_test_run();

Acked-by: Thomas Huth <thuth@redhat.com>


