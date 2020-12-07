Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817B92D15E8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 17:27:12 +0100 (CET)
Received: from localhost ([::1]:51848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmJLz-0001k1-JV
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 11:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmJJq-0000D3-V3
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:25:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmJJm-0005pd-VL
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:24:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607358293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LNFLbAvIn8RLYkSrVWYmBV5/6mrtb/EzptcAwXX2Mho=;
 b=ffHx/Y53BxgAZFZJLWveIjxgy2l0USx0bk2Wn8fFsEJcfLM0fNZqEreWuteFUXbDrNWBxx
 dyukSJJ5yMDY7Bnue+vA5lpDeHTJpc+nBUtwIBj6N2Cex/9li+WyFZlmB4LFX06hawtyBG
 cOMyDXVQKv7R3yesVs4/6zMp04yKX9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-yOzj4EGjMgGJaMSnY1Kzrw-1; Mon, 07 Dec 2020 11:24:51 -0500
X-MC-Unique: yOzj4EGjMgGJaMSnY1Kzrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F550858194
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 16:24:50 +0000 (UTC)
Received: from localhost (unknown [10.40.208.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B0D66B8DD;
 Mon,  7 Dec 2020 16:24:49 +0000 (UTC)
Date: Mon, 7 Dec 2020 17:24:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 11/15] qtest: add a QOM object for qtest
Message-ID: <20201207172447.77d22d17@redhat.com>
In-Reply-To: <20201202081854.4126071-12-pbonzini@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-12-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed,  2 Dec 2020 03:18:50 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> The qtest server right now can only be created using the -qtest
> and -qtest-log options.  Allow an alternative way to create it
> using "-object qtest,chardev=...,log=...".
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/qtest.c | 144 ++++++++++++++++++++++++++++++++++++++++++++----
>  softmmu/vl.c    |   5 +-
>  2 files changed, 135 insertions(+), 14 deletions(-)
> 
> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
> index 7965dc9a16..d255c9681a 100644
> --- a/softmmu/qtest.c
> +++ b/softmmu/qtest.c
> @@ -27,6 +27,8 @@
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qemu/cutils.h"
> +#include "qapi/qmp/qerror.h"
> +#include "qom/object_interfaces.h"
>  #include CONFIG_DEVICES
>  #ifdef CONFIG_PSERIES
>  #include "hw/ppc/spapr_rtas.h"
> @@ -849,18 +851,9 @@ static void qtest_event(void *opaque, QEMUChrEvent event)
>          break;
>      }
>  }
> -void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **errp)
> -{
> -    Chardev *chr;
> -
> -    chr = qemu_chr_new("qtest", qtest_chrdev, NULL);
> -
> -    if (chr == NULL) {
> -        error_setg(errp, "Failed to initialize device for qtest: \"%s\"",
> -                   qtest_chrdev);
> -        return;
> -    }
>  
> +static bool qtest_server_start(Chardev *chr, const char *qtest_log, Error **errp)
> +{
>      if (qtest_log) {
>          if (strcmp(qtest_log, "none") != 0) {
>              qtest_log_fp = fopen(qtest_log, "w+");
> @@ -869,7 +862,9 @@ void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **
>          qtest_log_fp = stderr;
>      }
>  
> -    qemu_chr_fe_init(&qtest_chr, chr, errp);
> +    if (!qemu_chr_fe_init(&qtest_chr, chr, errp)) {
> +        return false;
> +    }
>      qemu_chr_fe_set_handlers(&qtest_chr, qtest_can_read, qtest_read,
>                               qtest_event, NULL, &qtest_chr, NULL, true);
>      qemu_chr_fe_set_echo(&qtest_chr, true);
> @@ -879,8 +874,25 @@ void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **
>      if (!qtest_server_send) {
>          qtest_server_set_send_handler(qtest_server_char_be_send, &qtest_chr);
>      }
> +    return true;
> +}
> +
> +void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **errp)
> +{
> +    Chardev *chr;
> +
> +    chr = qemu_chr_new("qtest", qtest_chrdev, NULL);
> +
> +    if (chr == NULL) {
> +        error_setg(errp, "Failed to initialize device for qtest: \"%s\"",
> +                   qtest_chrdev);
> +        return;
> +    }
> +
> +    qtest_server_start(chr, qtest_log, errp);

why not create qtest object here instead of trying to preserve old way,
or create it directly at the place that calls qtest_server_init()?

>  }
>  
> +
>  void qtest_server_set_send_handler(void (*send)(void*, const char*),
>                                     void *opaque)
>  {
> @@ -905,3 +917,111 @@ void qtest_server_inproc_recv(void *dummy, const char *buf)
>          g_string_truncate(gstr, 0);
>      }
>  }
> +
> +#define TYPE_QTEST "qtest"
> +
> +OBJECT_DECLARE_SIMPLE_TYPE(QTest, QTEST)
> +
> +struct QTest {
> +    Object parent;
> +
> +    bool complete;
> +    char *chr_name;
> +    Chardev *chr;
> +    char *log;
> +};
> +
> +static void qtest_complete(UserCreatable *uc, Error **errp)
> +{
> +    QTest *q = QTEST(uc);
> +    if (qtest_driver()) {
> +        error_setg(errp, "Only one instance of qtest can be created");
> +        return;
> +    }
> +    if (!q->chr_name) {
> +        error_setg(errp, "No backend specified");
> +        return;
> +    }
> +
> +    if (!qtest_server_start(q->chr, q->log, errp)) {
> +        return;
> +    }
> +    q->complete = true;
> +}
> +
> +static void qtest_set_log(Object *obj, const char *value, Error **errp)
> +{
> +    QTest *q = QTEST(obj);
> +
> +    if (q->complete) {
> +        error_setg(errp, QERR_PERMISSION_DENIED);
> +    } else {
> +        g_free(q->log);
> +        q->log = g_strdup(value);
> +    }
> +}
> +
> +static char *qtest_get_log(Object *obj, Error **errp)
> +{
> +    QTest *q = QTEST(obj);
> +
> +    return g_strdup(q->log);
> +}
> +
> +static void qtest_set_chardev(Object *obj, const char *value, Error **errp)
> +{
> +    QTest *q = QTEST(obj);
> +    Chardev *chr;
> +
> +    if (q->complete) {
> +        error_setg(errp, QERR_PERMISSION_DENIED);
> +        return;
> +    }
> +
> +    chr = qemu_chr_find(value);
> +    if (!chr) {
> +        error_setg(errp, "Cannot find character device '%s'", value);
> +        return;
> +    }
> +
> +    g_free(q->chr_name);
> +    q->chr_name = g_strdup(value);
> +    q->chr = chr;
> +}
> +
> +static char *qtest_get_chardev(Object *obj, Error **errp)
> +{
> +    QTest *q = QTEST(obj);
> +
> +    return g_strdup(q->chr_name);
> +}
> +
> +static void qtest_class_init(ObjectClass *oc, void *data)
> +{
> +    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
> +
> +    ucc->complete = qtest_complete;
> +
> +    object_class_property_add_str(oc, "chardev",
> +                                  qtest_get_chardev, qtest_set_chardev);
> +    object_class_property_add_str(oc, "log",
> +                                  qtest_get_log, qtest_set_log);
> +}
> +
> +static const TypeInfo qtest_info = {
> +    .name = TYPE_QTEST,
> +    .parent = TYPE_OBJECT,
> +    .class_init = qtest_class_init,
> +    .instance_size = sizeof(QTest),
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_USER_CREATABLE },
> +        { }
> +    }
> +};
> +
> +static void register_types(void)
> +{
> +    type_register_static(&qtest_info);
> +}
> +
> +type_init(register_types);
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 0f7222af31..e5f3c42049 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1685,8 +1685,9 @@ static bool object_create_early(const char *type, QemuOpts *opts)
>       * add one, state the reason in a comment!
>       */
>  
> -    /* Reason: rng-egd property "chardev" */
> -    if (g_str_equal(type, "rng-egd")) {
> +    /* Reason: property "chardev" */
> +    if (g_str_equal(type, "rng-egd") ||
> +        g_str_equal(type, "qtest")) {
>          return false;
>      }
>  


