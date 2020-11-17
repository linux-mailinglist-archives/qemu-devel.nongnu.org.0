Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC1A2B5B7B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:04:50 +0100 (CET)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kewuu-0005NG-Va
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewsk-0004LY-Ct
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:02:35 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:38432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewsb-0000Wt-M3
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:02:30 -0500
Received: by mail-ej1-x644.google.com with SMTP id a16so579386ejj.5
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 01:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A2CratjeSEReKGRMG0NHOWM1tau7Hm+7W/bgp3OlqkU=;
 b=SdXeFjzvCDbpK7h4sYFHu73aUbiAKr++L1y6CTq6xIonDmfR3bOn6zT8jnLXJ2gCab
 7mvTDOWP9cdgzltkZr/0dO40qoqm3EfBzUUefu6L+glGycPpNCxHaCTjt8F8Nyz3GBMR
 CgpRuGGLw8klMKxTBCC2ebWmTlr5jy6lP62L2r+xk3PoW36sULgMiQy2A+87ZyrGlkcr
 OdIdhhYR3ZG6RacFdFlVjudoGN0Mrp3cU99iPvbwKhMew3JDK7aDdv/my7Lnb2xjP4JE
 bTu8qGYPwYIsmTJqgA+Bp6jZ4La3Gi6Ckx2hcgi+fCHHaBwDWIbN3KEkIvKzk4JFQmX4
 Bjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A2CratjeSEReKGRMG0NHOWM1tau7Hm+7W/bgp3OlqkU=;
 b=c2iehQr4MTrklLWxFoQvhWlJlRTQDrDV5Yi1EwKorJf/UyIFDYUn4v42UOACrmSOcz
 F4TOXBjfT02WAwXH9R2u/PS10KG0lQ3cQbNj6pO/DgvxEkay2pz5FUAGcGEQ50mUvku0
 oAxQ9w+l/STJS6nqC4XGT+tmFMaHfC4PkqxYG87xrpKqMXfBBPamr926QIFfdVn6v1nx
 jzVLEU66vaW1R3JvOY0wPcan8QAZmzthGhGz1Zr7omRyd91em1s4XrbwE2cFhQu7kDxF
 X+uKgXs656sH3jIZKbH1yAAimWaS+SHP8vUGbbPPzy+92tgBT++JuQcwjMefW415WQBe
 45BA==
X-Gm-Message-State: AOAM530SpKDHJvtdImbvG2tygFJQnthaxFTx/vYVOeJGd43Q51Dspul1
 W6aUMdlOqZRJpqGvBGbOzQCafa0i9RlmqxU+MDk=
X-Google-Smtp-Source: ABdhPJx4r74hpS7PAe0RFM5QGvP6Yl9k7vFue7e0EVU8fe+KMfrlwQaLoBVBKA2GSpVaewm0x8BBSHrz4f7iYMBms00=
X-Received: by 2002:a17:906:7c54:: with SMTP id
 g20mr18800209ejp.105.1605603743777; 
 Tue, 17 Nov 2020 01:02:23 -0800 (PST)
MIME-Version: 1.0
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-9-ehabkost@redhat.com>
In-Reply-To: <20201116224143.1284278-9-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 17 Nov 2020 13:02:12 +0400
Message-ID: <CAJ+F1CLt07cm992Pt46=zS7H-kn+pr-5PjSq25e3Za-q9QAc1g@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] qom: Use qlit to represent property defaults
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cc508305b449c051"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cc508305b449c051
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 2:45 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> Using QLitObject lets us get rid of most of the
> .set_default_value functions, and just use
> object_property_set_default() directly.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
> Changes v1 -> v2:
> * Instead of initializing defval to QLIT_QNULL
>   by default, just check for QTYPE_NONE, to find out if .defval
>   was explicitly set.  This avoids extra complexity at
>   set_prop_arraylen().
> ---
>  include/hw/qdev-properties-system.h   |  2 +-
>  include/qom/field-property-internal.h |  4 ---
>  include/qom/field-property.h          | 26 ++++++++-----------
>  include/qom/property-types.h          | 19 ++++++--------
>  hw/core/qdev-properties-system.c      |  8 ------
>  qom/field-property.c                  | 27 ++++++++++++++------
>  qom/property-types.c                  | 36 ++++-----------------------
>  7 files changed, 42 insertions(+), 80 deletions(-)
>
> diff --git a/include/hw/qdev-properties-system.h
> b/include/hw/qdev-properties-system.h
> index 0ac327ae60..a586424a33 100644
> --- a/include/hw/qdev-properties-system.h
> +++ b/include/hw/qdev-properties-system.h
> @@ -65,7 +65,7 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
>
>  #define DEFINE_PROP_UUID(_name, _state, _field) \
>      DEFINE_PROP(_name, _state, _field, qdev_prop_uuid, QemuUUID, \
> -                .set_default =3D true)
> +                .defval =3D QLIT_QSTR("auto"))
>
>  #define DEFINE_PROP_AUDIODEV(_n, _s, _f) \
>      DEFINE_PROP(_n, _s, _f, qdev_prop_audiodev, QEMUSoundCard)
> diff --git a/include/qom/field-property-internal.h
> b/include/qom/field-property-internal.h
> index a7b7e2b69d..9bc29e9b67 100644
> --- a/include/qom/field-property-internal.h
> +++ b/include/qom/field-property-internal.h
> @@ -15,10 +15,6 @@ void field_prop_set_enum(Object *obj, Visitor *v, cons=
t
> char *name,
>
>  void field_prop_set_default_value_enum(ObjectProperty *op,
>                                         const Property *prop);
> -void field_prop_set_default_value_int(ObjectProperty *op,
> -                                      const Property *prop);
> -void field_prop_set_default_value_uint(ObjectProperty *op,
> -                                       const Property *prop);
>
>  void field_prop_get_int32(Object *obj, Visitor *v, const char *name,
>                            void *opaque, Error **errp);
> diff --git a/include/qom/field-property.h b/include/qom/field-property.h
> index 0cb1fe2217..3cfd19cc14 100644
> --- a/include/qom/field-property.h
> +++ b/include/qom/field-property.h
> @@ -6,6 +6,7 @@
>
>  #include "qom/object.h"
>  #include "qapi/util.h"
> +#include "qapi/qmp/qlit.h"
>
>  /**
>   * struct Property: definition of a field property
> @@ -27,21 +28,8 @@ struct Property {
>      const PropertyInfo *info;
>      ptrdiff_t    offset;
>      uint8_t      bitnr;
> -    /**
> -     * @set_default: true if the default value should be set from @defva=
l,
> -     *    in which case @info->set_default_value must not be NULL
> -     *    (if false then no default value is set by the property system
> -     *     and the field retains whatever value it was given by
> instance_init).
> -     */
> -    bool         set_default;
> -    /**
> -     * @defval: default value for the property. This is used only if
> @set_default
> -     *     is true.
> -     */
> -    union {
> -        int64_t i;
> -        uint64_t u;
> -    } defval;
> +    /** @defval: If not QTYPE_NONE, the default value for the property *=
/
> +    QLitObject defval;
>      /* private: */
>      int          arrayoffset;
>      const PropertyInfo *arrayinfo;
> @@ -61,7 +49,13 @@ struct PropertyInfo {
>      const QEnumLookup *enum_table;
>      /** @print: String formatting function, for the human monitor */
>      int (*print)(Object *obj, Property *prop, char *dest, size_t len);
> -    /** @set_default_value: Callback for initializing the default value =
*/
> +    /**
> +     * @set_default_value: Optional callback for initializing the defaul=
t
> value
> +     *
> +     * Most property types don't need to set this, as by default
> +     * object_property_set_default() is called with the value at
> +     * Property.defval.
> +     */
>      void (*set_default_value)(ObjectProperty *op, const Property *prop);
>      /** @create: Optional callback for creation of property */
>      ObjectProperty *(*create)(ObjectClass *oc, const char *name,
> diff --git a/include/qom/property-types.h b/include/qom/property-types.h
> index 3132ddafd9..869d1a993a 100644
> --- a/include/qom/property-types.h
> +++ b/include/qom/property-types.h
> @@ -5,6 +5,7 @@
>  #define QOM_PROPERTY_TYPES_H
>
>  #include "qom/field-property.h"
> +#include "qapi/qmp/qlit.h"
>
>  extern const PropertyInfo prop_info_bit;
>  extern const PropertyInfo prop_info_bit64;
> @@ -25,34 +26,29 @@ extern const PropertyInfo prop_info_link;
>
>  #define PROP_SIGNED(_state, _field, _defval, _prop, _type, ...) \
>      FIELD_PROP(_state, _field, _prop, _type,                    \
> -               .set_default =3D true,                             \
> -               .defval.i    =3D (_type)_defval,                   \
> +               .defval =3D QLIT_QNUM_INT((_type)_defval),               =
 \
>                 __VA_ARGS__)
>
>  #define PROP_UNSIGNED(_state, _field, _defval, _prop, _type, ...) \
>      FIELD_PROP(_state, _field, _prop, _type,                    \
> -               .set_default =3D true,                             \
> -               .defval.u  =3D (_type)_defval,                     \
> +               .defval =3D QLIT_QNUM_UINT((_type)_defval),              =
 \
>                 __VA_ARGS__)
>
>  #define PROP_BIT(_state, _field, _bit, _defval, ...) \
>      FIELD_PROP(_state, _field, prop_info_bit, uint32_t,         \
>                 .bitnr       =3D (_bit),                           \
> -               .set_default =3D true,                             \
> -               .defval.u    =3D (bool)_defval,                    \
> +               .defval =3D QLIT_QBOOL(_defval),                   \
>                 __VA_ARGS__)
>
>  #define PROP_BIT64(_state, _field, _bit, _defval, ...) \
>      FIELD_PROP(_state, _field, prop_info_bit64, uint64_t,       \
>                 .bitnr    =3D (_bit),                              \
> -               .set_default =3D true,                             \
> -               .defval.u  =3D (bool)_defval,                      \
> +               .defval =3D QLIT_QBOOL(_defval),                   \
>                 __VA_ARGS__)
>
>  #define PROP_BOOL(_state, _field, _defval, ...) \
>      FIELD_PROP(_state, _field, prop_info_bool, bool,            \
> -               .set_default =3D true,                             \
> -               .defval.u    =3D (bool)_defval,                    \
> +               .defval =3D QLIT_QBOOL(_defval),                   \
>                 __VA_ARGS__)
>
>  #define PROP_LINK(_state, _field, _type, _ptr_type, ...) \
> @@ -131,8 +127,7 @@ extern const PropertyInfo prop_info_link;
>                            _arrayfield, _arrayprop, _arraytype) \
>      DEFINE_PROP((PROP_ARRAY_LEN_PREFIX _name),                 \
>                  _state, _field, prop_info_arraylen, uint32_t,  \
> -                .set_default =3D true,                           \
> -                .defval.u =3D 0,                                 \
> +                .defval =3D QLIT_QNUM_UINT(0),                   \
>                  .arrayinfo =3D &(_arrayprop),                    \
>                  .arrayfieldsize =3D sizeof(_arraytype),          \
>                  .arrayoffset =3D offsetof(_state, _arrayfield))
> diff --git a/hw/core/qdev-properties-system.c
> b/hw/core/qdev-properties-system.c
> index 8da68f076c..d9be5372f6 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -570,7 +570,6 @@ const PropertyInfo qdev_prop_blocksize =3D {
>                     " and " MAX_BLOCK_SIZE_STR,
>      .get   =3D field_prop_get_size32,
>      .set   =3D set_blocksize,
> -    .set_default_value =3D field_prop_set_default_value_uint,
>  };
>
>  /* --- Block device error handling policy --- */
> @@ -768,7 +767,6 @@ const PropertyInfo qdev_prop_pci_devfn =3D {
>      .print =3D print_pci_devfn,
>      .get   =3D field_prop_get_int32,
>      .set   =3D set_pci_devfn,
> -    .set_default_value =3D field_prop_set_default_value_int,
>  };
>
>  /* --- pci host address --- */
> @@ -1080,16 +1078,10 @@ static void set_uuid(Object *obj, Visitor *v,
> const char *name, void *opaque,
>      g_free(str);
>  }
>
> -static void set_default_uuid_auto(ObjectProperty *op, const Property
> *prop)
> -{
> -    object_property_set_default_str(op, UUID_VALUE_AUTO);
> -}
> -
>  const PropertyInfo qdev_prop_uuid =3D {
>      .name  =3D "str",
>      .description =3D "UUID (aka GUID) or \"" UUID_VALUE_AUTO
>          "\" for random value (default)",
>      .get   =3D get_uuid,
>      .set   =3D set_uuid,
> -    .set_default_value =3D set_default_uuid_auto,
>  };
> diff --git a/qom/field-property.c b/qom/field-property.c
> index cb729626ce..9cb5ded41a 100644
> --- a/qom/field-property.c
> +++ b/qom/field-property.c
> @@ -47,6 +47,20 @@ static ObjectPropertyAccessor *field_prop_setter(const
> PropertyInfo *info)
>      return info->set ? field_prop_set : NULL;
>  }
>
> +static void field_prop_set_default_value(ObjectProperty *op,
> +                                         Property *prop)
> +{
> +    if (qlit_type(&prop->defval) =3D=3D QTYPE_NONE) {
> +        return;
> +    }
> +
> +    if (prop->info->set_default_value) {
> +        prop->info->set_default_value(op, prop);
> +    } else {
> +        object_property_set_default(op, qobject_from_qlit(&prop->defval)=
);
> +    }
> +}
> +
>  /*
>   * Property release callback for dynamically-created properties:
>   * We call the underlying element's property release hook, and
> @@ -83,11 +97,9 @@ object_property_add_field(Object *obj, const char *nam=
e,
>      object_property_set_description(obj, name,
>                                      newprop->info->description);
>
> -    if (newprop->set_default) {
> -        newprop->info->set_default_value(op, newprop);
> -        if (op->init) {
> -            op->init(obj, op);
> -        }
> +    field_prop_set_default_value(op, prop);
> +    if (op->init) {
> +        op->init(obj, op);
>      }
>
>      op->allow_set =3D allow_set;
> @@ -113,9 +125,8 @@ object_class_property_add_field_static(ObjectClass
> *oc, const char *name,
>                                         prop->info->release,
>                                         prop);
>      }
> -    if (prop->set_default) {
> -        prop->info->set_default_value(op, prop);
> -    }
> +
> +    field_prop_set_default_value(op, prop);
>      if (prop->info->description) {
>          object_class_property_set_description(oc, name,
>                                                prop->info->description);
> diff --git a/qom/property-types.c b/qom/property-types.c
> index 4b3fe15b6a..fe96f1f49a 100644
> --- a/qom/property-types.c
> +++ b/qom/property-types.c
> @@ -28,8 +28,11 @@ void field_prop_set_enum(Object *obj, Visitor *v, cons=
t
> char *name,
>  void field_prop_set_default_value_enum(ObjectProperty *op,
>                                         const Property *prop)
>  {
> -    object_property_set_default_str(op,
> -        qapi_enum_lookup(prop->info->enum_table, prop->defval.i));
> +    QObject *defval =3D qobject_from_qlit(&prop->defval);
> +    const char *str =3D qapi_enum_lookup(prop->info->enum_table,
> +                                       qnum_get_int(qobject_to(QNum,
> defval)));
> +    object_property_set_default_str(op, str);
> +    qobject_unref(defval);
>  }
>
>  const PropertyInfo prop_info_enum =3D {
> @@ -80,17 +83,11 @@ static void prop_set_bit(Object *obj, Visitor *v,
> const char *name,
>      bit_prop_set(obj, prop, value);
>  }
>
> -static void set_default_value_bool(ObjectProperty *op, const Property
> *prop)
> -{
> -    object_property_set_default_bool(op, prop->defval.u);
> -}
> -
>  const PropertyInfo prop_info_bit =3D {
>      .name  =3D "bool",
>      .description =3D "on/off",
>      .get   =3D prop_get_bit,
>      .set   =3D prop_set_bit,
> -    .set_default_value =3D set_default_value_bool,
>  };
>
>  /* Bit64 */
> @@ -139,7 +136,6 @@ const PropertyInfo prop_info_bit64 =3D {
>      .description =3D "on/off",
>      .get   =3D prop_get_bit64,
>      .set   =3D prop_set_bit64,
> -    .set_default_value =3D set_default_value_bool,
>  };
>
>  /* --- bool --- */
> @@ -166,7 +162,6 @@ const PropertyInfo prop_info_bool =3D {
>      .name  =3D "bool",
>      .get   =3D get_bool,
>      .set   =3D set_bool,
> -    .set_default_value =3D set_default_value_bool,
>  };
>
>  /* --- 8bit integer --- */
> @@ -189,23 +184,10 @@ static void set_uint8(Object *obj, Visitor *v, cons=
t
> char *name, void *opaque,
>      visit_type_uint8(v, name, ptr, errp);
>  }
>
> -void field_prop_set_default_value_int(ObjectProperty *op,
> -                                      const Property *prop)
> -{
> -    object_property_set_default_int(op, prop->defval.i);
> -}
> -
> -void field_prop_set_default_value_uint(ObjectProperty *op,
> -                                       const Property *prop)
> -{
> -    object_property_set_default_uint(op, prop->defval.u);
> -}
> -
>  const PropertyInfo prop_info_uint8 =3D {
>      .name  =3D "uint8",
>      .get   =3D get_uint8,
>      .set   =3D set_uint8,
> -    .set_default_value =3D field_prop_set_default_value_uint,
>  };
>
>  /* --- 16bit integer --- */
> @@ -232,7 +214,6 @@ const PropertyInfo prop_info_uint16 =3D {
>      .name  =3D "uint16",
>      .get   =3D get_uint16,
>      .set   =3D set_uint16,
> -    .set_default_value =3D field_prop_set_default_value_uint,
>  };
>
>  /* --- 32bit integer --- */
> @@ -277,14 +258,12 @@ const PropertyInfo prop_info_uint32 =3D {
>      .name  =3D "uint32",
>      .get   =3D get_uint32,
>      .set   =3D set_uint32,
> -    .set_default_value =3D field_prop_set_default_value_uint,
>  };
>
>  const PropertyInfo prop_info_int32 =3D {
>      .name  =3D "int32",
>      .get   =3D field_prop_get_int32,
>      .set   =3D set_int32,
> -    .set_default_value =3D field_prop_set_default_value_int,
>  };
>
>  /* --- 64bit integer --- */
> @@ -329,14 +308,12 @@ const PropertyInfo prop_info_uint64 =3D {
>      .name  =3D "uint64",
>      .get   =3D get_uint64,
>      .set   =3D set_uint64,
> -    .set_default_value =3D field_prop_set_default_value_uint,
>  };
>
>  const PropertyInfo prop_info_int64 =3D {
>      .name  =3D "int64",
>      .get   =3D get_int64,
>      .set   =3D set_int64,
> -    .set_default_value =3D field_prop_set_default_value_int,
>  };
>
>  /* --- string --- */
> @@ -431,7 +408,6 @@ const PropertyInfo prop_info_size32 =3D {
>      .name  =3D "size",
>      .get =3D field_prop_get_size32,
>      .set =3D set_size32,
> -    .set_default_value =3D field_prop_set_default_value_uint,
>  };
>
>  /* --- support for array properties --- */
> @@ -495,7 +471,6 @@ const PropertyInfo prop_info_arraylen =3D {
>      .name =3D "uint32",
>      .get =3D get_uint32,
>      .set =3D set_prop_arraylen,
> -    .set_default_value =3D field_prop_set_default_value_uint,
>  };
>
>  /* --- 64bit unsigned int 'size' type --- */
> @@ -522,7 +497,6 @@ const PropertyInfo prop_info_size =3D {
>      .name  =3D "size",
>      .get =3D get_size,
>      .set =3D set_size,
> -    .set_default_value =3D field_prop_set_default_value_uint,
>  };
>
>  /* --- object link property --- */
> --
> 2.28.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cc508305b449c051
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 2:45 AM Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Us=
ing QLitObject lets us get rid of most of the<br>
.set_default_value functions, and just use<br>
object_property_set_default() directly.<br>
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
Changes v1 -&gt; v2:<br>
* Instead of initializing defval to QLIT_QNULL<br>
=C2=A0 by default, just check for QTYPE_NONE, to find out if .defval<br>
=C2=A0 was explicitly set.=C2=A0 This avoids extra complexity at<br>
=C2=A0 set_prop_arraylen().<br>
---<br>
=C2=A0include/hw/qdev-properties-system.h=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0include/qom/field-property-internal.h |=C2=A0 4 ---<br>
=C2=A0include/qom/field-property.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 26 +=
+++++++-----------<br>
=C2=A0include/qom/property-types.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 19 +=
+++++--------<br>
=C2=A0hw/core/qdev-properties-system.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ------=
<br>
=C2=A0qom/field-property.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 27 ++++++++++++++------<br>
=C2=A0qom/property-types.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 36 ++++-----------------------<br>
=C2=A07 files changed, 42 insertions(+), 80 deletions(-)<br>
<br>
diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properti=
es-system.h<br>
index 0ac327ae60..a586424a33 100644<br>
--- a/include/hw/qdev-properties-system.h<br>
+++ b/include/hw/qdev-properties-system.h<br>
@@ -65,7 +65,7 @@ extern const PropertyInfo qdev_prop_pcie_link_width;<br>
<br>
=C2=A0#define DEFINE_PROP_UUID(_name, _state, _field) \<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP(_name, _state, _field, qdev_prop_uuid, Qemu=
UUID, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .set_default =3D t=
rue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .defval =3D QLIT_Q=
STR(&quot;auto&quot;))<br>
<br>
=C2=A0#define DEFINE_PROP_AUDIODEV(_n, _s, _f) \<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP(_n, _s, _f, qdev_prop_audiodev, QEMUSoundCa=
rd)<br>
diff --git a/include/qom/field-property-internal.h b/include/qom/field-prop=
erty-internal.h<br>
index a7b7e2b69d..9bc29e9b67 100644<br>
--- a/include/qom/field-property-internal.h<br>
+++ b/include/qom/field-property-internal.h<br>
@@ -15,10 +15,6 @@ void field_prop_set_enum(Object *obj, Visitor *v, const =
char *name,<br>
<br>
=C2=A0void field_prop_set_default_value_enum(ObjectProperty *op,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const Pr=
operty *prop);<br>
-void field_prop_set_default_value_int(ObjectProperty *op,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const Property =
*prop);<br>
-void field_prop_set_default_value_uint(ObjectProperty *op,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const Pro=
perty *prop);<br>
<br>
=C2=A0void field_prop_get_int32(Object *obj, Visitor *v, const char *name,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *opaque, Error **errp);<br>
diff --git a/include/qom/field-property.h b/include/qom/field-property.h<br=
>
index 0cb1fe2217..3cfd19cc14 100644<br>
--- a/include/qom/field-property.h<br>
+++ b/include/qom/field-property.h<br>
@@ -6,6 +6,7 @@<br>
<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
=C2=A0#include &quot;qapi/util.h&quot;<br>
+#include &quot;qapi/qmp/qlit.h&quot;<br>
<br>
=C2=A0/**<br>
=C2=A0 * struct Property: definition of a field property<br>
@@ -27,21 +28,8 @@ struct Property {<br>
=C2=A0 =C2=A0 =C2=A0const PropertyInfo *info;<br>
=C2=A0 =C2=A0 =C2=A0ptrdiff_t=C2=A0 =C2=A0 offset;<br>
=C2=A0 =C2=A0 =C2=A0uint8_t=C2=A0 =C2=A0 =C2=A0 bitnr;<br>
-=C2=A0 =C2=A0 /**<br>
-=C2=A0 =C2=A0 =C2=A0* @set_default: true if the default value should be se=
t from @defval,<br>
-=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 in which case @info-&gt;set_default_val=
ue must not be NULL<br>
-=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 (if false then no default value is set =
by the property system<br>
-=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0and the field retains whatever va=
lue it was given by instance_init).<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_default;<br>
-=C2=A0 =C2=A0 /**<br>
-=C2=A0 =C2=A0 =C2=A0* @defval: default value for the property. This is use=
d only if @set_default<br>
-=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0is true.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 union {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t u;<br>
-=C2=A0 =C2=A0 } defval;<br>
+=C2=A0 =C2=A0 /** @defval: If not QTYPE_NONE, the default value for the pr=
operty */<br>
+=C2=A0 =C2=A0 QLitObject defval;<br>
=C2=A0 =C2=A0 =C2=A0/* private: */<br>
=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arrayoffset;<br>
=C2=A0 =C2=A0 =C2=A0const PropertyInfo *arrayinfo;<br>
@@ -61,7 +49,13 @@ struct PropertyInfo {<br>
=C2=A0 =C2=A0 =C2=A0const QEnumLookup *enum_table;<br>
=C2=A0 =C2=A0 =C2=A0/** @print: String formatting function, for the human m=
onitor */<br>
=C2=A0 =C2=A0 =C2=A0int (*print)(Object *obj, Property *prop, char *dest, s=
ize_t len);<br>
-=C2=A0 =C2=A0 /** @set_default_value: Callback for initializing the defaul=
t value */<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* @set_default_value: Optional callback for initializi=
ng the default value<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* Most property types don&#39;t need to set this, as b=
y default<br>
+=C2=A0 =C2=A0 =C2=A0* object_property_set_default() is called with the val=
ue at<br>
+=C2=A0 =C2=A0 =C2=A0* Property.defval.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0void (*set_default_value)(ObjectProperty *op, const Pro=
perty *prop);<br>
=C2=A0 =C2=A0 =C2=A0/** @create: Optional callback for creation of property=
 */<br>
=C2=A0 =C2=A0 =C2=A0ObjectProperty *(*create)(ObjectClass *oc, const char *=
name,<br>
diff --git a/include/qom/property-types.h b/include/qom/property-types.h<br=
>
index 3132ddafd9..869d1a993a 100644<br>
--- a/include/qom/property-types.h<br>
+++ b/include/qom/property-types.h<br>
@@ -5,6 +5,7 @@<br>
=C2=A0#define QOM_PROPERTY_TYPES_H<br>
<br>
=C2=A0#include &quot;qom/field-property.h&quot;<br>
+#include &quot;qapi/qmp/qlit.h&quot;<br>
<br>
=C2=A0extern const PropertyInfo prop_info_bit;<br>
=C2=A0extern const PropertyInfo prop_info_bit64;<br>
@@ -25,34 +26,29 @@ extern const PropertyInfo prop_info_link;<br>
<br>
=C2=A0#define PROP_SIGNED(_state, _field, _defval, _prop, _type, ...) \<br>
=C2=A0 =C2=A0 =C2=A0FIELD_PROP(_state, _field, _prop, _type,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.set_default =3D tr=
ue,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.defval.i=C2=A0 =C2=
=A0 =3D (_type)_defval,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.defval =3D QLIT_QN=
UM_INT((_type)_defval),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __VA_ARGS__)<br>
<br>
=C2=A0#define PROP_UNSIGNED(_state, _field, _defval, _prop, _type, ...) \<b=
r>
=C2=A0 =C2=A0 =C2=A0FIELD_PROP(_state, _field, _prop, _type,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.set_default =3D tr=
ue,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.defval.u=C2=A0 =3D=
 (_type)_defval,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.defval =3D QLIT_QN=
UM_UINT((_type)_defval),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __VA_ARGS__)<br>
<br>
=C2=A0#define PROP_BIT(_state, _field, _bit, _defval, ...) \<br>
=C2=A0 =C2=A0 =C2=A0FIELD_PROP(_state, _field, prop_info_bit, uint32_t,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bitnr=C2=A0 =C2=A0=
 =C2=A0 =C2=A0=3D (_bit),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.set_default =3D tr=
ue,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.defval.u=C2=A0 =C2=
=A0 =3D (bool)_defval,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.defval =3D QLIT_QB=
OOL(_defval),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __VA_ARGS__)<br>
<br>
=C2=A0#define PROP_BIT64(_state, _field, _bit, _defval, ...) \<br>
=C2=A0 =C2=A0 =C2=A0FIELD_PROP(_state, _field, prop_info_bit64, uint64_t,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bitnr=C2=A0 =C2=A0=
 =3D (_bit),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.set_default =3D tr=
ue,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.defval.u=C2=A0 =3D=
 (bool)_defval,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.defval =3D QLIT_QB=
OOL(_defval),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __VA_ARGS__)<br>
<br>
=C2=A0#define PROP_BOOL(_state, _field, _defval, ...) \<br>
=C2=A0 =C2=A0 =C2=A0FIELD_PROP(_state, _field, prop_info_bool, bool,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.set_default =3D tr=
ue,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.defval.u=C2=A0 =C2=
=A0 =3D (bool)_defval,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.defval =3D QLIT_QB=
OOL(_defval),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __VA_ARGS__)<br>
<br>
=C2=A0#define PROP_LINK(_state, _field, _type, _ptr_type, ...) \<br>
@@ -131,8 +127,7 @@ extern const PropertyInfo prop_info_link;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0_arrayfield, _arrayprop, _arraytype) \<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP((PROP_ARRAY_LEN_PREFIX _name),=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_state, _fiel=
d, prop_info_arraylen, uint32_t,=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .set_default =3D t=
rue,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .defval.u =3D 0,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .defval =3D QLIT_Q=
NUM_UINT(0),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.arrayinfo =
=3D &amp;(_arrayprop),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.arrayfieldsi=
ze =3D sizeof(_arraytype),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.arrayoffset =
=3D offsetof(_state, _arrayfield))<br>
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-sys=
tem.c<br>
index 8da68f076c..d9be5372f6 100644<br>
--- a/hw/core/qdev-properties-system.c<br>
+++ b/hw/core/qdev-properties-system.c<br>
@@ -570,7 +570,6 @@ const PropertyInfo qdev_prop_blocksize =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
; and &quot; MAX_BLOCK_SIZE_STR,<br>
=C2=A0 =C2=A0 =C2=A0.get=C2=A0 =C2=A0=3D field_prop_get_size32,<br>
=C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0=3D set_blocksize,<br>
-=C2=A0 =C2=A0 .set_default_value =3D field_prop_set_default_value_uint,<br=
>
=C2=A0};<br>
<br>
=C2=A0/* --- Block device error handling policy --- */<br>
@@ -768,7 +767,6 @@ const PropertyInfo qdev_prop_pci_devfn =3D {<br>
=C2=A0 =C2=A0 =C2=A0.print =3D print_pci_devfn,<br>
=C2=A0 =C2=A0 =C2=A0.get=C2=A0 =C2=A0=3D field_prop_get_int32,<br>
=C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0=3D set_pci_devfn,<br>
-=C2=A0 =C2=A0 .set_default_value =3D field_prop_set_default_value_int,<br>
=C2=A0};<br>
<br>
=C2=A0/* --- pci host address --- */<br>
@@ -1080,16 +1078,10 @@ static void set_uuid(Object *obj, Visitor *v, const=
 char *name, void *opaque,<br>
=C2=A0 =C2=A0 =C2=A0g_free(str);<br>
=C2=A0}<br>
<br>
-static void set_default_uuid_auto(ObjectProperty *op, const Property *prop=
)<br>
-{<br>
-=C2=A0 =C2=A0 object_property_set_default_str(op, UUID_VALUE_AUTO);<br>
-}<br>
-<br>
=C2=A0const PropertyInfo qdev_prop_uuid =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =3D &quot;str&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.description =3D &quot;UUID (aka GUID) or \&quot;&quot;=
 UUID_VALUE_AUTO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\&quot; for random value (default)&=
quot;,<br>
=C2=A0 =C2=A0 =C2=A0.get=C2=A0 =C2=A0=3D get_uuid,<br>
=C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0=3D set_uuid,<br>
-=C2=A0 =C2=A0 .set_default_value =3D set_default_uuid_auto,<br>
=C2=A0};<br>
diff --git a/qom/field-property.c b/qom/field-property.c<br>
index cb729626ce..9cb5ded41a 100644<br>
--- a/qom/field-property.c<br>
+++ b/qom/field-property.c<br>
@@ -47,6 +47,20 @@ static ObjectPropertyAccessor *field_prop_setter(const P=
ropertyInfo *info)<br>
=C2=A0 =C2=A0 =C2=A0return info-&gt;set ? field_prop_set : NULL;<br>
=C2=A0}<br>
<br>
+static void field_prop_set_default_value(ObjectProperty *op,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pr=
operty *prop)<br>
+{<br>
+=C2=A0 =C2=A0 if (qlit_type(&amp;prop-&gt;defval) =3D=3D QTYPE_NONE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (prop-&gt;info-&gt;set_default_value) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prop-&gt;info-&gt;set_default_value(op, prop);=
<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_default(op, qobject_from_q=
lit(&amp;prop-&gt;defval));<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0/*<br>
=C2=A0 * Property release callback for dynamically-created properties:<br>
=C2=A0 * We call the underlying element&#39;s property release hook, and<br=
>
@@ -83,11 +97,9 @@ object_property_add_field(Object *obj, const char *name,=
<br>
=C2=A0 =C2=A0 =C2=A0object_property_set_description(obj, name,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newprop-&gt;info=
-&gt;description);<br>
<br>
-=C2=A0 =C2=A0 if (newprop-&gt;set_default) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 newprop-&gt;info-&gt;set_default_value(op, new=
prop);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (op-&gt;init) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 op-&gt;init(obj, op);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 field_prop_set_default_value(op, prop);<br>
+=C2=A0 =C2=A0 if (op-&gt;init) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 op-&gt;init(obj, op);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0op-&gt;allow_set =3D allow_set;<br>
@@ -113,9 +125,8 @@ object_class_property_add_field_static(ObjectClass *oc,=
 const char *name,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prop-&gt=
;info-&gt;release,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prop);<b=
r>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (prop-&gt;set_default) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 prop-&gt;info-&gt;set_default_value(op, prop);=
<br>
-=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 field_prop_set_default_value(op, prop);<br>
=C2=A0 =C2=A0 =C2=A0if (prop-&gt;info-&gt;description) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_class_property_set_description(oc,=
 name,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0prop-&gt;info-&gt;description);<br>
diff --git a/qom/property-types.c b/qom/property-types.c<br>
index 4b3fe15b6a..fe96f1f49a 100644<br>
--- a/qom/property-types.c<br>
+++ b/qom/property-types.c<br>
@@ -28,8 +28,11 @@ void field_prop_set_enum(Object *obj, Visitor *v, const =
char *name,<br>
=C2=A0void field_prop_set_default_value_enum(ObjectProperty *op,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const Pr=
operty *prop)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 object_property_set_default_str(op,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_enum_lookup(prop-&gt;info-&gt;enum_table,=
 prop-&gt;defval.i));<br>
+=C2=A0 =C2=A0 QObject *defval =3D qobject_from_qlit(&amp;prop-&gt;defval);=
<br>
+=C2=A0 =C2=A0 const char *str =3D qapi_enum_lookup(prop-&gt;info-&gt;enum_=
table,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qnum_get_=
int(qobject_to(QNum, defval)));<br>
+=C2=A0 =C2=A0 object_property_set_default_str(op, str);<br>
+=C2=A0 =C2=A0 qobject_unref(defval);<br>
=C2=A0}<br>
<br>
=C2=A0const PropertyInfo prop_info_enum =3D {<br>
@@ -80,17 +83,11 @@ static void prop_set_bit(Object *obj, Visitor *v, const=
 char *name,<br>
=C2=A0 =C2=A0 =C2=A0bit_prop_set(obj, prop, value);<br>
=C2=A0}<br>
<br>
-static void set_default_value_bool(ObjectProperty *op, const Property *pro=
p)<br>
-{<br>
-=C2=A0 =C2=A0 object_property_set_default_bool(op, prop-&gt;defval.u);<br>
-}<br>
-<br>
=C2=A0const PropertyInfo prop_info_bit =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =3D &quot;bool&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.description =3D &quot;on/off&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.get=C2=A0 =C2=A0=3D prop_get_bit,<br>
=C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0=3D prop_set_bit,<br>
-=C2=A0 =C2=A0 .set_default_value =3D set_default_value_bool,<br>
=C2=A0};<br>
<br>
=C2=A0/* Bit64 */<br>
@@ -139,7 +136,6 @@ const PropertyInfo prop_info_bit64 =3D {<br>
=C2=A0 =C2=A0 =C2=A0.description =3D &quot;on/off&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.get=C2=A0 =C2=A0=3D prop_get_bit64,<br>
=C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0=3D prop_set_bit64,<br>
-=C2=A0 =C2=A0 .set_default_value =3D set_default_value_bool,<br>
=C2=A0};<br>
<br>
=C2=A0/* --- bool --- */<br>
@@ -166,7 +162,6 @@ const PropertyInfo prop_info_bool =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =3D &quot;bool&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.get=C2=A0 =C2=A0=3D get_bool,<br>
=C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0=3D set_bool,<br>
-=C2=A0 =C2=A0 .set_default_value =3D set_default_value_bool,<br>
=C2=A0};<br>
<br>
=C2=A0/* --- 8bit integer --- */<br>
@@ -189,23 +184,10 @@ static void set_uint8(Object *obj, Visitor *v, const =
char *name, void *opaque,<br>
=C2=A0 =C2=A0 =C2=A0visit_type_uint8(v, name, ptr, errp);<br>
=C2=A0}<br>
<br>
-void field_prop_set_default_value_int(ObjectProperty *op,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const Property =
*prop)<br>
-{<br>
-=C2=A0 =C2=A0 object_property_set_default_int(op, prop-&gt;defval.i);<br>
-}<br>
-<br>
-void field_prop_set_default_value_uint(ObjectProperty *op,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const Pro=
perty *prop)<br>
-{<br>
-=C2=A0 =C2=A0 object_property_set_default_uint(op, prop-&gt;defval.u);<br>
-}<br>
-<br>
=C2=A0const PropertyInfo prop_info_uint8 =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =3D &quot;uint8&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.get=C2=A0 =C2=A0=3D get_uint8,<br>
=C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0=3D set_uint8,<br>
-=C2=A0 =C2=A0 .set_default_value =3D field_prop_set_default_value_uint,<br=
>
=C2=A0};<br>
<br>
=C2=A0/* --- 16bit integer --- */<br>
@@ -232,7 +214,6 @@ const PropertyInfo prop_info_uint16 =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =3D &quot;uint16&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.get=C2=A0 =C2=A0=3D get_uint16,<br>
=C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0=3D set_uint16,<br>
-=C2=A0 =C2=A0 .set_default_value =3D field_prop_set_default_value_uint,<br=
>
=C2=A0};<br>
<br>
=C2=A0/* --- 32bit integer --- */<br>
@@ -277,14 +258,12 @@ const PropertyInfo prop_info_uint32 =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =3D &quot;uint32&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.get=C2=A0 =C2=A0=3D get_uint32,<br>
=C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0=3D set_uint32,<br>
-=C2=A0 =C2=A0 .set_default_value =3D field_prop_set_default_value_uint,<br=
>
=C2=A0};<br>
<br>
=C2=A0const PropertyInfo prop_info_int32 =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =3D &quot;int32&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.get=C2=A0 =C2=A0=3D field_prop_get_int32,<br>
=C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0=3D set_int32,<br>
-=C2=A0 =C2=A0 .set_default_value =3D field_prop_set_default_value_int,<br>
=C2=A0};<br>
<br>
=C2=A0/* --- 64bit integer --- */<br>
@@ -329,14 +308,12 @@ const PropertyInfo prop_info_uint64 =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =3D &quot;uint64&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.get=C2=A0 =C2=A0=3D get_uint64,<br>
=C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0=3D set_uint64,<br>
-=C2=A0 =C2=A0 .set_default_value =3D field_prop_set_default_value_uint,<br=
>
=C2=A0};<br>
<br>
=C2=A0const PropertyInfo prop_info_int64 =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =3D &quot;int64&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.get=C2=A0 =C2=A0=3D get_int64,<br>
=C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0=3D set_int64,<br>
-=C2=A0 =C2=A0 .set_default_value =3D field_prop_set_default_value_int,<br>
=C2=A0};<br>
<br>
=C2=A0/* --- string --- */<br>
@@ -431,7 +408,6 @@ const PropertyInfo prop_info_size32 =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =3D &quot;size&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.get =3D field_prop_get_size32,<br>
=C2=A0 =C2=A0 =C2=A0.set =3D set_size32,<br>
-=C2=A0 =C2=A0 .set_default_value =3D field_prop_set_default_value_uint,<br=
>
=C2=A0};<br>
<br>
=C2=A0/* --- support for array properties --- */<br>
@@ -495,7 +471,6 @@ const PropertyInfo prop_info_arraylen =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D &quot;uint32&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.get =3D get_uint32,<br>
=C2=A0 =C2=A0 =C2=A0.set =3D set_prop_arraylen,<br>
-=C2=A0 =C2=A0 .set_default_value =3D field_prop_set_default_value_uint,<br=
>
=C2=A0};<br>
<br>
=C2=A0/* --- 64bit unsigned int &#39;size&#39; type --- */<br>
@@ -522,7 +497,6 @@ const PropertyInfo prop_info_size =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =3D &quot;size&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.get =3D get_size,<br>
=C2=A0 =C2=A0 =C2=A0.set =3D set_size,<br>
-=C2=A0 =C2=A0 .set_default_value =3D field_prop_set_default_value_uint,<br=
>
=C2=A0};<br>
<br>
=C2=A0/* --- object link property --- */<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000cc508305b449c051--

