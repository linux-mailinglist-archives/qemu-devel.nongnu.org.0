Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC17D2D9A46
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:49:38 +0100 (CET)
Received: from localhost ([::1]:53702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopAP-00036F-I8
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kop8n-0001c0-Um
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:47:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kop8k-0000hg-FV
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:47:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607957273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KJFsHehAshcmLnAwyPFFkgIaX8fBFMfCz31i4KrA46A=;
 b=fweGphhOqje2Tl8S7rop5QoWYMG2D6hA6Em6O7tKProiDl6ED7V/PqwQ1kwpxlfB8e9NN3
 hZzJe7zORs+h+l8pHq5hjcVWBfJkqq3r54pYOnm0oZ8Kfi8K8kvigxkLtLksU4t3IDgHKw
 YcjzViNe464SA4ToDef4/EzzmPvAR1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-tXMQ3i1COUiQbNyeByuzjw-1; Mon, 14 Dec 2020 09:47:51 -0500
X-MC-Unique: tXMQ3i1COUiQbNyeByuzjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E33C107ACE8;
 Mon, 14 Dec 2020 14:47:50 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DF385D6AB;
 Mon, 14 Dec 2020 14:47:44 +0000 (UTC)
Date: Mon, 14 Dec 2020 15:47:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 21/32] qdev: Add name argument to PropertyInfo.create
 method
Message-ID: <20201214154743.1416ab76@redhat.com>
In-Reply-To: <20201211220529.2290218-22-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-22-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 17:05:18 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> This will make it easier to remove the Property.name field in the
> future.
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> This is a new patch added in series v2
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  include/hw/qdev-properties.h | 2 +-
>  hw/core/qdev-properties.c    | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 476737b9da..ab9c538ba4 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -34,7 +34,7 @@ struct PropertyInfo {
>      const QEnumLookup *enum_table;
>      int (*print)(Object *obj, Property *prop, char *dest, size_t len);
>      void (*set_default_value)(ObjectProperty *op, const Property *prop);
> -    void (*create)(ObjectClass *oc, Property *prop);
> +    void (*create)(ObjectClass *oc, const char *name, Property *prop);
>      ObjectPropertyAccessor *get;
>      ObjectPropertyAccessor *set;
>      ObjectPropertyRelease *release;
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 457c7fe4ba..c68a20695d 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -851,9 +851,10 @@ const PropertyInfo qdev_prop_size =3D {
> =20
>  /* --- object link property --- */
> =20
> -static void create_link_property(ObjectClass *oc, Property *prop)
> +static void create_link_property(ObjectClass *oc, const char *name,
> +                                 Property *prop)
>  {
> -    object_class_property_add_link(oc, prop->name, prop->link_type,
> +    object_class_property_add_link(oc, name, prop->link_type,
>                                     prop->offset,
>                                     qdev_prop_allow_set_link_before_reali=
ze,
>                                     OBJ_PROP_LINK_STRONG);
> @@ -893,7 +894,7 @@ static void qdev_class_add_property(DeviceClass *klas=
s, const char *name,
>      ObjectClass *oc =3D OBJECT_CLASS(klass);
> =20
>      if (prop->info->create) {
> -        prop->info->create(oc, prop);
> +        prop->info->create(oc, name, prop);
>      } else {
>          ObjectProperty *op;
> =20


