Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16813D0B83
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:37:30 +0200 (CEST)
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68fR-00066v-VW
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m68dA-0003Ua-Vo
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:35:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m68d9-0006k7-1g
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626860106;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9w+gfWxwCvj24rlWnzalgbrbAKDAF+wPKNb+lLC+kk=;
 b=G6AE4Ge9sgyQncXrQ+QsNg6CcdgVpmao7MdCkDhtHcBE5IdzfrvlUS9xPS3J4kB3g9aO7D
 0xj6Etgf60lF+G/w13Op5cZwBg5nY6YbcGpdG8qLd0cwYacmYkSi1RVH6vgMcEHq5vte67
 6UHkXPB5ZYzd/jcvBKKfc/1Mn029LnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-gSsBP4R0PsCZsaYP_OAPEQ-1; Wed, 21 Jul 2021 05:34:57 -0400
X-MC-Unique: gSsBP4R0PsCZsaYP_OAPEQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6D98802E29;
 Wed, 21 Jul 2021 09:34:56 +0000 (UTC)
Received: from redhat.com (ovpn-114-135.ams2.redhat.com [10.36.114.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BB7160583;
 Wed, 21 Jul 2021 09:34:51 +0000 (UTC)
Date: Wed, 21 Jul 2021 10:34:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Jose R. Ziviani" <jziviani@suse.de>
Subject: Re: [PATCH 2/2] qom: Improve error message in
 module_object_class_by_name()
Message-ID: <YPfqOOl5DvsAMr+z@redhat.com>
References: <20210720223120.21711-1-jziviani@suse.de>
 <20210720223120.21711-3-jziviani@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210720223120.21711-3-jziviani@suse.de>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: ehabkost@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 cfontana@suse.de, pbonzini@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 07:31:20PM -0300, Jose R. Ziviani wrote:
> module_object_class_by_name() calls module_load_qom_one if the object
> is provided by a dynamically linked library. Such library might not be
> available at this moment - for instance, it can be a package not yet
> installed. Thus, instead of assert error messages, this patch outputs
> more friendly messages.
> 
> Current error messages:
> $ ./qemu-system-x86_64 -machine q35 -accel tcg -kernel /boot/vmlinuz
> ...
> ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: (ops != NULL)
> Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: (ops != NULL)
> [1]    31964 IOT instruction (core dumped)  ./qemu-system-x86_64 ...
> 
> New error message:
> $ ./qemu-system-x86_64 -machine q35 -accel tcg -kernel /boot/vmlinuz
> accel-tcg-x86_64 module is missing, install the package or config the library path correctly.
> 
> Or with other modules, when possible:
> $ ./qemu-system-x86_64 -machine q35 -accel kvm -kernel /boot/vmlinuz -vga qxl                                                                     ✹
> hw-display-qxl module is missing, install the package or config the library path correctly.
> qemu-system-x86_64: QXL VGA not available
> 
> $ make check
> ...
> Running test qtest-x86_64/test-filter-mirror
> Running test qtest-x86_64/endianness-test
> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
> accel-tcg-x86_64 module is missing, install the package or config the library path correctly.
> ...
> 
> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> ---
>  accel/accel-softmmu.c | 5 ++++-
>  qom/object.c          | 9 +++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
> index 67276e4f52..52449ac2d0 100644
> --- a/accel/accel-softmmu.c
> +++ b/accel/accel-softmmu.c
> @@ -79,7 +79,10 @@ void accel_init_ops_interfaces(AccelClass *ac)
>       * all accelerators need to define ops, providing at least a mandatory
>       * non-NULL create_vcpu_thread operation.
>       */
> -    g_assert(ops != NULL);
> +    if (ops == NULL) {
> +        exit(1);
> +    }
> +
>      if (ops->ops_init) {
>          ops->ops_init(ops);
>      }
> diff --git a/qom/object.c b/qom/object.c
> index 6a01d56546..3a170ea9df 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -10,6 +10,7 @@
>   * See the COPYING file in the top-level directory.
>   */
>  
> +#include "qemu/module.h"
>  #include "qemu/osdep.h"
>  #include "hw/qdev-core.h"
>  #include "qapi/error.h"
> @@ -1031,8 +1032,16 @@ ObjectClass *module_object_class_by_name(const char *typename)
>      oc = object_class_by_name(typename);
>  #ifdef CONFIG_MODULES
>      if (!oc) {
> +        const char *module_name = module_get_name_from_obj(typename);
>          module_load_qom_one(typename);
>          oc = object_class_by_name(typename);
> +        if (!oc && module_name) {
> +            if (!module_is_loaded(module_name)) {
> +                fprintf(stderr, "%s module is missing, install the "
> +                                "package or config the library path "
> +                                "correctly.\n", module_name);
> +            }
> +        }
>      }

Introducing a call to module_is_loaded is feels like it isn't really
addressing the root cause.

The error scenario here exists because module_load_qom_one() can
fail to load the requested module. We don't detect that failure
because module_load_qom_one() is "void" for some reason. There
are several possible causes of failure and missing file on disk
is only one of them.

This general error message about "module_name" being missing is
misleading when there are dependancies involved. "module_name"
may well exist, but something it depends on might be missing.
Or the modules might have been built from wrong QEMU and be
unable to be dlopened despite existing.

I think we need to fix module_load_qom_one() so that it can
actually report failure via an "Error **errp" parameter.
This will also entail fixing a number of methods it in turn
calls.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


