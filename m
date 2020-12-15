Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84042DAF0E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:38:51 +0100 (CET)
Received: from localhost ([::1]:33434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBTW-00089D-Ti
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kpBQy-0005fe-Ln
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:36:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kpBQw-0006c8-7G
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:36:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608042969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3M5BDFhS8MlbPxfM0OPIRLFiPypyaPvhSI2/19bgfpQ=;
 b=GqvLRiAL47mCTDEmEii79yHRCHKig8vK+EnKIhMvERbSpQJmq/9DBYKXIjC90gU5udZcxw
 xYgkEnbsbwNaZP6Bk9ojhDZtdF4Lp7oiij5GEmY/Ogdyg8yHVkgSkogA2iq7Id8Pm+QnuT
 LfficJQcGJMmeJ97eKNlftxfq+0i/FE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-FNt-QhYGPB611KjsoASRpw-1; Tue, 15 Dec 2020 09:36:07 -0500
X-MC-Unique: FNt-QhYGPB611KjsoASRpw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A90D3801817;
 Tue, 15 Dec 2020 14:36:06 +0000 (UTC)
Received: from localhost (ovpn-113-127.ams2.redhat.com [10.36.113.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1627F5D9E8;
 Tue, 15 Dec 2020 14:35:59 +0000 (UTC)
Date: Tue, 15 Dec 2020 15:35:58 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 27/32] qdev: Rename qdev_propinfo_* to field_prop_*
Message-ID: <20201215153558.594b130c@redhat.com>
In-Reply-To: <20201211220529.2290218-28-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-28-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 17:05:24 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> These functions will be moved to be part of QOM, so rename them.
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Changes v2:
> * Rename to field_prop_* instead of object_propinfo_*
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  hw/core/qdev-prop-internal.h     | 28 +++++++--------
>  hw/core/qdev-properties-system.c | 48 ++++++++++++-------------
>  hw/core/qdev-properties.c        | 62 ++++++++++++++++----------------
>  3 files changed, 69 insertions(+), 69 deletions(-)
>=20
> diff --git a/hw/core/qdev-prop-internal.h b/hw/core/qdev-prop-internal.h
> index 6f17ddf271..740a5e530b 100644
> --- a/hw/core/qdev-prop-internal.h
> +++ b/hw/core/qdev-prop-internal.h
> @@ -8,22 +8,22 @@
>  #ifndef HW_CORE_QDEV_PROP_INTERNAL_H
>  #define HW_CORE_QDEV_PROP_INTERNAL_H
> =20
> -void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
> -                            void *opaque, Error **errp);
> -void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
> -                            void *opaque, Error **errp);
> +void field_prop_get_enum(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp);
> +void field_prop_set_enum(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp);
> =20
> -void qdev_propinfo_set_default_value_enum(ObjectProperty *op,
> -                                          const Property *prop);
> -void qdev_propinfo_set_default_value_int(ObjectProperty *op,
> -                                         const Property *prop);
> -void qdev_propinfo_set_default_value_uint(ObjectProperty *op,
> -                                          const Property *prop);
> +void field_prop_set_default_value_enum(ObjectProperty *op,
> +                                       const Property *prop);
> +void field_prop_set_default_value_int(ObjectProperty *op,
> +                                      const Property *prop);
> +void field_prop_set_default_value_uint(ObjectProperty *op,
> +                                       const Property *prop);
> =20
> -void qdev_propinfo_get_int32(Object *obj, Visitor *v, const char *name,
> -                             void *opaque, Error **errp);
> -void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
> -                              void *opaque, Error **errp);
> +void field_prop_get_int32(Object *obj, Visitor *v, const char *name,
> +                          void *opaque, Error **errp);
> +void field_prop_get_size32(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp);
> =20
>  /**
>   * object_property_add_field: Add a field property to an object instance
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-s=
ystem.c
> index f31aea3de1..590c5f3d97 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -537,9 +537,9 @@ QEMU_BUILD_BUG_ON(sizeof(LostTickPolicy) !=3D sizeof(=
int));
>  const PropertyInfo qdev_prop_losttickpolicy =3D {
>      .name  =3D "LostTickPolicy",
>      .enum_table  =3D &LostTickPolicy_lookup,
> -    .get   =3D qdev_propinfo_get_enum,
> -    .set   =3D qdev_propinfo_set_enum,
> -    .set_default_value =3D qdev_propinfo_set_default_value_enum,
> +    .get   =3D field_prop_get_enum,
> +    .set   =3D field_prop_set_enum,
> +    .set_default_value =3D field_prop_set_default_value_enum,
>  };
> =20
>  /* --- blocksize --- */
> @@ -568,9 +568,9 @@ const PropertyInfo qdev_prop_blocksize =3D {
>      .name  =3D "size",
>      .description =3D "A power of two between " MIN_BLOCK_SIZE_STR
>                     " and " MAX_BLOCK_SIZE_STR,
> -    .get   =3D qdev_propinfo_get_size32,
> +    .get   =3D field_prop_get_size32,
>      .set   =3D set_blocksize,
> -    .set_default_value =3D qdev_propinfo_set_default_value_uint,
> +    .set_default_value =3D field_prop_set_default_value_uint,
>  };
> =20
>  /* --- Block device error handling policy --- */
> @@ -582,9 +582,9 @@ const PropertyInfo qdev_prop_blockdev_on_error =3D {
>      .description =3D "Error handling policy, "
>                     "report/ignore/enospc/stop/auto",
>      .enum_table =3D &BlockdevOnError_lookup,
> -    .get =3D qdev_propinfo_get_enum,
> -    .set =3D qdev_propinfo_set_enum,
> -    .set_default_value =3D qdev_propinfo_set_default_value_enum,
> +    .get =3D field_prop_get_enum,
> +    .set =3D field_prop_set_enum,
> +    .set_default_value =3D field_prop_set_default_value_enum,
>  };
> =20
>  /* --- BIOS CHS translation */
> @@ -596,9 +596,9 @@ const PropertyInfo qdev_prop_bios_chs_trans =3D {
>      .description =3D "Logical CHS translation algorithm, "
>                     "auto/none/lba/large/rechs",
>      .enum_table =3D &BiosAtaTranslation_lookup,
> -    .get =3D qdev_propinfo_get_enum,
> -    .set =3D qdev_propinfo_set_enum,
> -    .set_default_value =3D qdev_propinfo_set_default_value_enum,
> +    .get =3D field_prop_get_enum,
> +    .set =3D field_prop_set_enum,
> +    .set_default_value =3D field_prop_set_default_value_enum,
>  };
> =20
>  /* --- FDC default drive types */
> @@ -608,9 +608,9 @@ const PropertyInfo qdev_prop_fdc_drive_type =3D {
>      .description =3D "FDC drive type, "
>                     "144/288/120/none/auto",
>      .enum_table =3D &FloppyDriveType_lookup,
> -    .get =3D qdev_propinfo_get_enum,
> -    .set =3D qdev_propinfo_set_enum,
> -    .set_default_value =3D qdev_propinfo_set_default_value_enum,
> +    .get =3D field_prop_get_enum,
> +    .set =3D field_prop_set_enum,
> +    .set_default_value =3D field_prop_set_default_value_enum,
>  };
> =20
>  /* --- MultiFDCompression --- */
> @@ -620,9 +620,9 @@ const PropertyInfo qdev_prop_multifd_compression =3D =
{
>      .description =3D "multifd_compression values, "
>                     "none/zlib/zstd",
>      .enum_table =3D &MultiFDCompression_lookup,
> -    .get =3D qdev_propinfo_get_enum,
> -    .set =3D qdev_propinfo_set_enum,
> -    .set_default_value =3D qdev_propinfo_set_default_value_enum,
> +    .get =3D field_prop_get_enum,
> +    .set =3D field_prop_set_enum,
> +    .set_default_value =3D field_prop_set_default_value_enum,
>  };
> =20
>  /* --- Reserved Region --- */
> @@ -766,9 +766,9 @@ const PropertyInfo qdev_prop_pci_devfn =3D {
>      .name  =3D "int32",
>      .description =3D "Slot and optional function number, example: 06.0 o=
r 06",
>      .print =3D print_pci_devfn,
> -    .get   =3D qdev_propinfo_get_int32,
> +    .get   =3D field_prop_get_int32,
>      .set   =3D set_pci_devfn,
> -    .set_default_value =3D qdev_propinfo_set_default_value_int,
> +    .set_default_value =3D field_prop_set_default_value_int,
>  };
> =20
>  /* --- pci host address --- */
> @@ -882,9 +882,9 @@ const PropertyInfo qdev_prop_off_auto_pcibar =3D {
>      .name =3D "OffAutoPCIBAR",
>      .description =3D "off/auto/bar0/bar1/bar2/bar3/bar4/bar5",
>      .enum_table =3D &OffAutoPCIBAR_lookup,
> -    .get =3D qdev_propinfo_get_enum,
> -    .set =3D qdev_propinfo_set_enum,
> -    .set_default_value =3D qdev_propinfo_set_default_value_enum,
> +    .get =3D field_prop_get_enum,
> +    .set =3D field_prop_set_enum,
> +    .set_default_value =3D field_prop_set_default_value_enum,
>  };
> =20
>  /* --- PCIELinkSpeed 2_5/5/8/16 -- */
> @@ -954,7 +954,7 @@ const PropertyInfo qdev_prop_pcie_link_speed =3D {
>      .enum_table =3D &PCIELinkSpeed_lookup,
>      .get =3D get_prop_pcielinkspeed,
>      .set =3D set_prop_pcielinkspeed,
> -    .set_default_value =3D qdev_propinfo_set_default_value_enum,
> +    .set_default_value =3D field_prop_set_default_value_enum,
>  };
> =20
>  /* --- PCIELinkWidth 1/2/4/8/12/16/32 -- */
> @@ -1042,7 +1042,7 @@ const PropertyInfo qdev_prop_pcie_link_width =3D {
>      .enum_table =3D &PCIELinkWidth_lookup,
>      .get =3D get_prop_pcielinkwidth,
>      .set =3D set_prop_pcielinkwidth,
> -    .set_default_value =3D qdev_propinfo_set_default_value_enum,
> +    .set_default_value =3D field_prop_set_default_value_enum,
>  };
> =20
>  /* --- UUID --- */
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 8436b60ec4..d2f565f552 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -96,8 +96,8 @@ static ObjectPropertyAccessor *field_prop_setter(const =
PropertyInfo *info)
>      return info->set ? field_prop_set : NULL;
>  }
> =20
> -void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
> -                            void *opaque, Error **errp)
> +void field_prop_get_enum(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
>      int *ptr =3D qdev_get_prop_ptr(obj, prop);
> @@ -105,8 +105,8 @@ void qdev_propinfo_get_enum(Object *obj, Visitor *v, =
const char *name,
>      visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
>  }
> =20
> -void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
> -                            void *opaque, Error **errp)
> +void field_prop_set_enum(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
>      int *ptr =3D qdev_get_prop_ptr(obj, prop);
> @@ -114,8 +114,8 @@ void qdev_propinfo_set_enum(Object *obj, Visitor *v, =
const char *name,
>      visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
>  }
> =20
> -void qdev_propinfo_set_default_value_enum(ObjectProperty *op,
> -                                          const Property *prop)
> +void field_prop_set_default_value_enum(ObjectProperty *op,
> +                                       const Property *prop)
>  {
>      object_property_set_default_str(op,
>          qapi_enum_lookup(prop->info->enum_table, prop->defval.i));
> @@ -123,9 +123,9 @@ void qdev_propinfo_set_default_value_enum(ObjectPrope=
rty *op,
> =20
>  const PropertyInfo qdev_prop_enum =3D {
>      .name  =3D "enum",
> -    .get   =3D qdev_propinfo_get_enum,
> -    .set   =3D qdev_propinfo_set_enum,
> -    .set_default_value =3D qdev_propinfo_set_default_value_enum,
> +    .get   =3D field_prop_get_enum,
> +    .set   =3D field_prop_set_enum,
> +    .set_default_value =3D field_prop_set_default_value_enum,
>  };
> =20
>  /* Bit */
> @@ -278,14 +278,14 @@ static void set_uint8(Object *obj, Visitor *v, cons=
t char *name, void *opaque,
>      visit_type_uint8(v, name, ptr, errp);
>  }
> =20
> -void qdev_propinfo_set_default_value_int(ObjectProperty *op,
> -                                         const Property *prop)
> +void field_prop_set_default_value_int(ObjectProperty *op,
> +                                      const Property *prop)
>  {
>      object_property_set_default_int(op, prop->defval.i);
>  }
> =20
> -void qdev_propinfo_set_default_value_uint(ObjectProperty *op,
> -                                          const Property *prop)
> +void field_prop_set_default_value_uint(ObjectProperty *op,
> +                                       const Property *prop)
>  {
>      object_property_set_default_uint(op, prop->defval.u);
>  }
> @@ -294,7 +294,7 @@ const PropertyInfo qdev_prop_uint8 =3D {
>      .name  =3D "uint8",
>      .get   =3D get_uint8,
>      .set   =3D set_uint8,
> -    .set_default_value =3D qdev_propinfo_set_default_value_uint,
> +    .set_default_value =3D field_prop_set_default_value_uint,
>  };
> =20
>  /* --- 16bit integer --- */
> @@ -321,7 +321,7 @@ const PropertyInfo qdev_prop_uint16 =3D {
>      .name  =3D "uint16",
>      .get   =3D get_uint16,
>      .set   =3D set_uint16,
> -    .set_default_value =3D qdev_propinfo_set_default_value_uint,
> +    .set_default_value =3D field_prop_set_default_value_uint,
>  };
> =20
>  /* --- 32bit integer --- */
> @@ -344,8 +344,8 @@ static void set_uint32(Object *obj, Visitor *v, const=
 char *name,
>      visit_type_uint32(v, name, ptr, errp);
>  }
> =20
> -void qdev_propinfo_get_int32(Object *obj, Visitor *v, const char *name,
> -                             void *opaque, Error **errp)
> +void field_prop_get_int32(Object *obj, Visitor *v, const char *name,
> +                          void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
>      int32_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> @@ -366,14 +366,14 @@ const PropertyInfo qdev_prop_uint32 =3D {
>      .name  =3D "uint32",
>      .get   =3D get_uint32,
>      .set   =3D set_uint32,
> -    .set_default_value =3D qdev_propinfo_set_default_value_uint,
> +    .set_default_value =3D field_prop_set_default_value_uint,
>  };
> =20
>  const PropertyInfo qdev_prop_int32 =3D {
>      .name  =3D "int32",
> -    .get   =3D qdev_propinfo_get_int32,
> +    .get   =3D field_prop_get_int32,
>      .set   =3D set_int32,
> -    .set_default_value =3D qdev_propinfo_set_default_value_int,
> +    .set_default_value =3D field_prop_set_default_value_int,
>  };
> =20
>  /* --- 64bit integer --- */
> @@ -418,14 +418,14 @@ const PropertyInfo qdev_prop_uint64 =3D {
>      .name  =3D "uint64",
>      .get   =3D get_uint64,
>      .set   =3D set_uint64,
> -    .set_default_value =3D qdev_propinfo_set_default_value_uint,
> +    .set_default_value =3D field_prop_set_default_value_uint,
>  };
> =20
>  const PropertyInfo qdev_prop_int64 =3D {
>      .name  =3D "int64",
>      .get   =3D get_int64,
>      .set   =3D set_int64,
> -    .set_default_value =3D qdev_propinfo_set_default_value_int,
> +    .set_default_value =3D field_prop_set_default_value_int,
>  };
> =20
>  /* --- string --- */
> @@ -477,15 +477,15 @@ const PropertyInfo qdev_prop_on_off_auto =3D {
>      .name =3D "OnOffAuto",
>      .description =3D "on/off/auto",
>      .enum_table =3D &OnOffAuto_lookup,
> -    .get =3D qdev_propinfo_get_enum,
> -    .set =3D qdev_propinfo_set_enum,
> -    .set_default_value =3D qdev_propinfo_set_default_value_enum,
> +    .get =3D field_prop_get_enum,
> +    .set =3D field_prop_set_enum,
> +    .set_default_value =3D field_prop_set_default_value_enum,
>  };
> =20
>  /* --- 32bit unsigned int 'size' type --- */
> =20
> -void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
> -                              void *opaque, Error **errp)
> +void field_prop_get_size32(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
>      uint32_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> @@ -518,9 +518,9 @@ static void set_size32(Object *obj, Visitor *v, const=
 char *name, void *opaque,
> =20
>  const PropertyInfo qdev_prop_size32 =3D {
>      .name  =3D "size",
> -    .get =3D qdev_propinfo_get_size32,
> +    .get =3D field_prop_get_size32,
>      .set =3D set_size32,
> -    .set_default_value =3D qdev_propinfo_set_default_value_uint,
> +    .set_default_value =3D field_prop_set_default_value_uint,
>  };
> =20
>  /* --- support for array properties --- */
> @@ -617,7 +617,7 @@ const PropertyInfo qdev_prop_arraylen =3D {
>      .name =3D "uint32",
>      .get =3D get_uint32,
>      .set =3D set_prop_arraylen,
> -    .set_default_value =3D qdev_propinfo_set_default_value_uint,
> +    .set_default_value =3D field_prop_set_default_value_uint,
>  };
> =20
>  /* --- public helpers --- */
> @@ -816,7 +816,7 @@ const PropertyInfo qdev_prop_size =3D {
>      .name  =3D "size",
>      .get =3D get_size,
>      .set =3D set_size,
> -    .set_default_value =3D qdev_propinfo_set_default_value_uint,
> +    .set_default_value =3D field_prop_set_default_value_uint,
>  };
> =20
>  /* --- object link property --- */


