Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135CD226210
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 16:27:32 +0200 (CEST)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxWlP-00073g-4D
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 10:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jxWjP-0005fN-9E
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 10:25:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46963
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jxWjN-00048X-Kx
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 10:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595255124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HRJKxZG7T7DrdRJAwW+ig5VaghBtz80w9wqsmeJHYeg=;
 b=YH4RbKlaPP8SbXaSKdH44jj5QFpR7bfwkyiCexGSPQsVK0ER1FBI6GPoz8dqqLSqVXsNgI
 II/OPZlh4lPBgsCJUm0k42bgAOKgVfST7OKtAQMiiaVHxmswgq9A+Vo+lm2C05FxE76YWY
 cZnifcqkx9tIaQLiqnsWw8FLuYUKvu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-xsYYKrOXOhuYhM5JznsR6w-1; Mon, 20 Jul 2020 10:25:22 -0400
X-MC-Unique: xsYYKrOXOhuYhM5JznsR6w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2EAE19200C2
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 14:25:21 +0000 (UTC)
Received: from turbo.dinechin.lan (ovpn-114-55.ams2.redhat.com [10.36.114.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA7F1710D5;
 Mon, 20 Jul 2020 14:25:14 +0000 (UTC)
References: <20200624131045.14512-1-kraxel@redhat.com>
 <20200624131045.14512-4-kraxel@redhat.com>
User-agent: mu4e 1.3.9; emacs 26.3
From: Christophe de Dinechin <dinechin@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v5 03/10] qdev: device module support
In-reply-to: <20200624131045.14512-4-kraxel@redhat.com>
Date: Mon, 20 Jul 2020 16:25:13 +0200
Message-ID: <7hft9mmfg6.fsf@turbo.dinechin.lan>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dinechin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dinechin@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 02:11:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020-06-24 at 15:10 CEST, Gerd Hoffmann wrote...
> Hook module loading into the places where we
> need it when building devices as modules.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/core/qdev.c     | 6 ++++--
>  qdev-monitor.c     | 5 +++--
>  qom/qom-qmp-cmds.c | 3 ++-
>  softmmu/vl.c       | 4 ++--
>  4 files changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 2131c7f951dd..9de16eae05b7 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -137,6 +137,9 @@ void qdev_set_parent_bus(DeviceState *dev, BusState *bus)
>   */
>  DeviceState *qdev_new(const char *name)
>  {
> +    if (!object_class_by_name(name)) {
> +        module_load_qom_one(name);
> +    }

Curious why you don't you call module_object_class_by_name here?


>      return DEVICE(object_new(name));
>  }
>
> @@ -147,10 +150,9 @@ DeviceState *qdev_new(const char *name)
>   */
>  DeviceState *qdev_try_new(const char *name)
>  {
> -    if (!object_class_by_name(name)) {
> +    if (!module_object_class_by_name(name)) {
>          return NULL;
>      }
> -
>      return DEVICE(object_new(name));
>  }
>
> diff --git a/qdev-monitor.c b/qdev-monitor.c
> index 22da107484c5..8e7a7f7bbdbc 100644
> --- a/qdev-monitor.c
> +++ b/qdev-monitor.c
> @@ -147,6 +147,7 @@ static void qdev_print_devinfos(bool show_no_user)
>      int i;
>      bool cat_printed;
>
> +    module_load_qom_all();
>      list = object_class_get_list_sorted(TYPE_DEVICE, false);
>
>      for (i = 0; i <= DEVICE_CATEGORY_MAX; i++) {
> @@ -215,13 +216,13 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>      DeviceClass *dc;
>      const char *original_name = *driver;
>
> -    oc = object_class_by_name(*driver);
> +    oc = module_object_class_by_name(*driver);
>      if (!oc) {
>          const char *typename = find_typename_by_alias(*driver);
>
>          if (typename) {
>              *driver = typename;
> -            oc = object_class_by_name(*driver);
> +            oc = module_object_class_by_name(*driver);
>          }
>      }
>
> diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
> index c5249e44d020..5e2c8cbf333f 100644
> --- a/qom/qom-qmp-cmds.c
> +++ b/qom/qom-qmp-cmds.c
> @@ -116,6 +116,7 @@ ObjectTypeInfoList *qmp_qom_list_types(bool has_implements,
>  {
>      ObjectTypeInfoList *ret = NULL;
>
> +    module_load_qom_all();
>      object_class_foreach(qom_list_types_tramp, implements, abstract, &ret);
>
>      return ret;
> @@ -130,7 +131,7 @@ ObjectPropertyInfoList *qmp_device_list_properties(const char *typename,
>      ObjectPropertyIterator iter;
>      ObjectPropertyInfoList *prop_list = NULL;
>
> -    klass = object_class_by_name(typename);
> +    klass = module_object_class_by_name(typename);
>      if (klass == NULL) {
>          error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
>                    "Device '%s' not found", typename);
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index f669c06ede4a..1297815a5f5b 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1772,8 +1772,8 @@ static bool vga_interface_available(VGAInterfaceType t)
>
>      assert(t < VGA_TYPE_MAX);
>      return !ti->class_names[0] ||
> -           object_class_by_name(ti->class_names[0]) ||
> -           object_class_by_name(ti->class_names[1]);
> +           module_object_class_by_name(ti->class_names[0]) ||
> +           module_object_class_by_name(ti->class_names[1]);
>  }
>
>  static const char *


--
Cheers,
Christophe de Dinechin (IRC c3d)


