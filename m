Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C1922932C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 10:11:41 +0200 (CEST)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jy9qm-0007IG-Eb
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 04:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jy9mT-0001Y7-1n
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 04:07:13 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59912
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jy9mR-0004FE-7u
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 04:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595405230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yrxa1p5BmZr+osLbxY5o0rpoSJxg45ocUQABooszVuA=;
 b=YyxKjY95CjeDsOBXD/GLGn/rlKNofP4w9GrmSTjizs1FFaSKbwWG+UzQjYjdMNpPc66SdC
 Md7tCyMVYNwRSrvUpTuurZSZ91fvQdSeLjBo1iMcByDddriLwGejDDasT4xe0/3ilsEusF
 rgb4e3nawrSSvXtOiDZj+ywh6BzWTl0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-Rh7uU2Q5OUKTwhEUVAwtSg-1; Wed, 22 Jul 2020 04:07:09 -0400
X-MC-Unique: Rh7uU2Q5OUKTwhEUVAwtSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17227800C64
 for <qemu-devel@nongnu.org>; Wed, 22 Jul 2020 08:07:08 +0000 (UTC)
Received: from titinator (ovpn-113-160.ams2.redhat.com [10.36.113.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CDD15BAD5;
 Wed, 22 Jul 2020 08:07:00 +0000 (UTC)
References: <20200624131045.14512-1-kraxel@redhat.com>
 <20200624131045.14512-3-kraxel@redhat.com>
User-agent: mu4e 1.5.2; emacs 26.3
From: Christophe de Dinechin <dinechin@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v5 02/10] object: qom module support
In-reply-to: <20200624131045.14512-3-kraxel@redhat.com>
Date: Wed, 22 Jul 2020 10:06:58 +0200
Message-ID: <lyzh7sgehp.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 21:28:05
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
> Little helper function to load modules on demand.  In most cases adding
> module loading support for devices and other objects is just
> s/object_class_by_name/module_object_class_by_name/ in the right spot.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/qom/object.h | 12 ++++++++++++
>  qom/object.c         | 14 ++++++++++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 94a61ccc3fe8..51f188137f1f 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -994,6 +994,18 @@ bool object_class_is_abstract(ObjectClass *klass);
>   */
>  ObjectClass *object_class_by_name(const char *typename);
>
> +/**
> + * module_object_class_by_name:
> + * @typename: The QOM typename to obtain the class for.
> + *
> + * For objects which might be provided by a module.  Behaves like
> + * object_class_by_name, but additionally tries to load the module
> + * needed in case the class is not available.
> + *
> + * Returns: The class for @typename or %NULL if not found.
> + */
> +ObjectClass *module_object_class_by_name(const char *typename);
> +
>  void object_class_foreach(void (*fn)(ObjectClass *klass, void *opaque),
>                            const char *implements_type, bool include_abstract,
>                            void *opaque);
> diff --git a/qom/object.c b/qom/object.c
> index 6ece96bc2bfc..34daaf1280f5 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -985,6 +985,20 @@ ObjectClass *object_class_by_name(const char *typename)
>      return type->class;
>  }
>
> +ObjectClass *module_object_class_by_name(const char *typename)

Re-reading this, it occurred to me that typename is a keyword in C++.

I don't know if we want to make it a rule to not use C++ keywords just in
case we would some day compile that code with a C++ compiler.

> +{
> +    ObjectClass *oc;
> +
> +    oc = object_class_by_name(typename);
> +#ifdef CONFIG_MODULES
> +    if (!oc) {
> +        module_load_qom_one(typename);
> +        oc = object_class_by_name(typename);
> +    }
> +#endif
> +    return oc;
> +}
> +
>  ObjectClass *object_class_get_parent(ObjectClass *class)
>  {
>      TypeImpl *type = type_get_parent(class->type);


--
Cheers,
Christophe de Dinechin (IRC c3d)


