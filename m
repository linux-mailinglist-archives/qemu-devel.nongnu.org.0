Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A9F109A6A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 09:48:54 +0100 (CET)
Received: from localhost ([::1]:51402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZWWi-0002km-SN
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 03:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47712)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iZWTI-0000cq-Pg
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 03:45:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iZWOn-0000jc-T5
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 03:40:44 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38000)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1iZWOk-0000by-1q
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 03:40:40 -0500
Received: by mail-wr1-x442.google.com with SMTP id i12so21417356wro.5
 for <qemu-devel@nongnu.org>; Tue, 26 Nov 2019 00:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lsifaiWfaIwEIn2EmMTV2nJWyGcOcb5K5KcZG1gv7cA=;
 b=rXKfEZ2zvWm9G67yZrhfnFAt8AlJlwDpKNY6q57DLc7LW31q1ZMkgt6I9mITm5Pgw2
 BXhCmQCz8ovWdaR1XJEzfZH3MAnpnZhU+16Ud7UyB3PJr90Dg4Ix8ySNqdsYTnIuoU/I
 oNX7vOycxDRmVgQLLfFlWBdNy9FZrwX+gbTX/c7NCzxo4qDhT+EuzhoGfJoHjOmbhus/
 bWba5ybFEA/PHpJ4kjXtYTdqj6UiSpYe40eT2V6IxtzJdGSpzYvbPSWEzpuZ5MOdZ9c4
 9MtJt69kf+I3tq/dJYXfm6Vs7qOds/14w3BjGsN+7ASQd+hZwlnQUIldf5x6B2PoFDh5
 yD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lsifaiWfaIwEIn2EmMTV2nJWyGcOcb5K5KcZG1gv7cA=;
 b=oLdUlTwqaFrYRW/Qo6q/a6QlEUf9AlPFZb7dd5QPoAIcUyJriie5qBq5/44vNfFS3G
 QN/MZBUv2P0ocBy/0hTmSTibYv+WV0+3mw455VcaH9TdkRh4B/Hk0jSZgT4AbFvQOdWe
 yl6ex9K9MjVv5Nb2Z438hrGlq0SNbPjvBAsDg9N+megMfIS/Ujpig3eB+kzBafrb4f8i
 pL5AwLiqwJY5lmprz/HyEjkd59mPgxLlhDTmW3nwAndsnr80btF+T2Zvcau9VJrHPwTZ
 nIiom+snxA/wbrC8btufbUTOvYuAXk3KLGApDx3yqP9uGs2FYdbbRRtwvEnSuODl9FC4
 vGJA==
X-Gm-Message-State: APjAAAWGYzRK8p2WpwvjviEhwIX3QGORBDlvBNbYsPMI+9Aog1iKX+pE
 Kz0JiObzZl16n44tX030LN36qFe7A3GDk2est3Q=
X-Google-Smtp-Source: APXvYqwwuyapuybOxzGVY3IkpCBT2uYIlLpmH5LZVgPPgsaSybcK1zluXvpS/6Sm8/WCAudOvYwnsRQD/zvQBoBQbnw=
X-Received: by 2002:a5d:670a:: with SMTP id o10mr37118383wru.312.1574757635764; 
 Tue, 26 Nov 2019 00:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20191125153619.39893-1-felipe@nutanix.com>
 <20191125153619.39893-2-felipe@nutanix.com>
In-Reply-To: <20191125153619.39893-2-felipe@nutanix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 26 Nov 2019 12:40:22 +0400
Message-ID: <CAJ+F1CLAWpUo_Ec6scdre_FOV70+vasBZKgV7VLudnz6Gzusdw@mail.gmail.com>
Subject: Re: [PATCH 1/4] qom/object: enable setter for uint types
To: Felipe Franciosi <felipe@nutanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Nov 25, 2019 at 7:40 PM Felipe Franciosi <felipe@nutanix.com> wrote=
:
>
> Traditionally, the uint-specific property helpers only offer getters.
> When adding object (or class) uint types, one must therefore use the
> generic property helper if a setter is needed.
>
> This enhances the uint-specific property helper APIs by adding a
> 'readonly' field and modifying all users of that API to set this
> parameter to true. If 'readonly' is false, though, the helper will add
> an automatic setter for the value.
>
> Signed-off-by: Felipe Franciosi <felipe@nutanix.com>
> ---
>  hw/acpi/ich9.c       |   4 +-
>  hw/acpi/pcihp.c      |   6 +-
>  hw/acpi/piix4.c      |  12 ++--
>  hw/isa/lpc_ich9.c    |   4 +-
>  hw/ppc/spapr_drc.c   |   2 +-
>  include/qom/object.h |  28 +++++---
>  qom/object.c         | 152 ++++++++++++++++++++++++++++++++++++-------
>  ui/console.c         |   3 +-
>  8 files changed, 163 insertions(+), 48 deletions(-)
>
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 2034dd749e..94dc5147ce 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -454,12 +454,12 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMR=
egs *pm, Error **errp)
>      pm->s4_val =3D 2;
>
>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
> -                                   &pm->pm_io_base, errp);
> +                                   &pm->pm_io_base, true, errp);
>      object_property_add(obj, ACPI_PM_PROP_GPE0_BLK, "uint32",
>                          ich9_pm_get_gpe0_blk,
>                          NULL, NULL, pm, NULL);
>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_GPE0_BLK_LEN,
> -                                   &gpe0_len, errp);
> +                                   &gpe0_len, true, errp);
>      object_property_add_bool(obj, "memory-hotplug-support",
>                               ich9_pm_get_memory_hotplug_support,
>                               ich9_pm_set_memory_hotplug_support,
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 8413348a33..70bc1408e6 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -80,7 +80,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
>
>          *bus_bsel =3D (*bsel_alloc)++;
>          object_property_add_uint32_ptr(OBJECT(bus), ACPI_PCIHP_PROP_BSEL=
,
> -                                       bus_bsel, &error_abort);
> +                                       bus_bsel, true, &error_abort);
>      }
>
>      return bsel_alloc;
> @@ -373,9 +373,9 @@ void acpi_pcihp_init(Object *owner, AcpiPciHpState *s=
, PCIBus *root_bus,
>      memory_region_add_subregion(address_space_io, s->io_base, &s->io);
>
>      object_property_add_uint16_ptr(owner, ACPI_PCIHP_IO_BASE_PROP, &s->i=
o_base,
> -                                   &error_abort);
> +                                   true, &error_abort);
>      object_property_add_uint16_ptr(owner, ACPI_PCIHP_IO_LEN_PROP, &s->io=
_len,
> -                                   &error_abort);
> +                                   true, &error_abort);
>  }
>
>  const VMStateDescription vmstate_acpi_pcihp_pci_status =3D {
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 93aec2dd2c..032ba11e62 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -443,17 +443,17 @@ static void piix4_pm_add_propeties(PIIX4PMState *s)
>      static const uint16_t sci_int =3D 9;
>
>      object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_ACPI_ENABLE_CM=
D,
> -                                  &acpi_enable_cmd, NULL);
> +                                  &acpi_enable_cmd, true, NULL);
>      object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_ACPI_DISABLE_C=
MD,
> -                                  &acpi_disable_cmd, NULL);
> +                                  &acpi_disable_cmd, true, NULL);
>      object_property_add_uint32_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK,
> -                                  &gpe0_blk, NULL);
> +                                  &gpe0_blk, true, NULL);
>      object_property_add_uint32_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK_LEN,
> -                                  &gpe0_blk_len, NULL);
> +                                  &gpe0_blk_len, true, NULL);
>      object_property_add_uint16_ptr(OBJECT(s), ACPI_PM_PROP_SCI_INT,
> -                                  &sci_int, NULL);
> +                                  &sci_int, true, NULL);
>      object_property_add_uint32_ptr(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,
> -                                  &s->io_base, NULL);
> +                                  &s->io_base, true, NULL);
>  }
>
>  static void piix4_pm_realize(PCIDevice *dev, Error **errp)
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 17c292e306..5555ce3342 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -645,9 +645,9 @@ static void ich9_lpc_add_properties(ICH9LPCState *lpc=
)
>                          ich9_lpc_get_sci_int,
>                          NULL, NULL, NULL, NULL);
>      object_property_add_uint8_ptr(OBJECT(lpc), ACPI_PM_PROP_ACPI_ENABLE_=
CMD,
> -                                  &acpi_enable_cmd, NULL);
> +                                  &acpi_enable_cmd, true, NULL);
>      object_property_add_uint8_ptr(OBJECT(lpc), ACPI_PM_PROP_ACPI_DISABLE=
_CMD,
> -                                  &acpi_disable_cmd, NULL);
> +                                  &acpi_disable_cmd, true, NULL);
>
>      ich9_pm_add_properties(OBJECT(lpc), &lpc->pm, NULL);
>  }
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 62f1a42592..76f389f56a 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -553,7 +553,7 @@ static void spapr_dr_connector_instance_init(Object *=
obj)
>      SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(obj);
>      SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(drc);
>
> -    object_property_add_uint32_ptr(obj, "id", &drc->id, NULL);
> +    object_property_add_uint32_ptr(obj, "id", &drc->id, true, NULL);
>      object_property_add(obj, "index", "uint32", prop_get_index,
>                          NULL, NULL, NULL, NULL);
>      object_property_add(obj, "fdt", "struct", prop_get_fdt,
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 128d00c77f..8fc28ed0c9 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1584,60 +1584,72 @@ void object_class_property_add_tm(ObjectClass *kl=
ass, const char *name,
>   * @obj: the object to add a property to
>   * @name: the name of the property
>   * @v: pointer to value
> + * @readonly: don't add setter for value
>   * @errp: if an error occurs, a pointer to an area to store the error
>   *
>   * Add an integer property in memory.  This function will add a
>   * property of type 'uint8'.
>   */
>  void object_property_add_uint8_ptr(Object *obj, const char *name,
> -                                   const uint8_t *v, Error **errp);
> +                                   const uint8_t *v, bool readonly,
> +                                   Error **errp);
>  void object_class_property_add_uint8_ptr(ObjectClass *klass, const char =
*name,
> -                                         const uint8_t *v, Error **errp)=
;
> +                                         const uint8_t *v, bool readonly=
,
> +                                         Error **errp);

It would help readability and extensibility if we had an enum/bitflag:
OBJECT_PROP_WRITABLE, OBJECT_PROP_READABLE (& OBJECT_PROP_READWRITE
alias).

>
>  /**
>   * object_property_add_uint16_ptr:
>   * @obj: the object to add a property to
>   * @name: the name of the property
>   * @v: pointer to value
> + * @readonly: don't add setter for value
>   * @errp: if an error occurs, a pointer to an area to store the error
>   *
>   * Add an integer property in memory.  This function will add a
>   * property of type 'uint16'.
>   */
>  void object_property_add_uint16_ptr(Object *obj, const char *name,
> -                                    const uint16_t *v, Error **errp);
> +                                    const uint16_t *v, bool readonly,
> +                                    Error **errp);
>  void object_class_property_add_uint16_ptr(ObjectClass *klass, const char=
 *name,
> -                                          const uint16_t *v, Error **err=
p);
> +                                          const uint16_t *v, bool readon=
ly,
> +                                          Error **errp);
>
>  /**
>   * object_property_add_uint32_ptr:
>   * @obj: the object to add a property to
>   * @name: the name of the property
>   * @v: pointer to value
> + * @readonly: don't add setter for value
>   * @errp: if an error occurs, a pointer to an area to store the error
>   *
>   * Add an integer property in memory.  This function will add a
>   * property of type 'uint32'.
>   */
>  void object_property_add_uint32_ptr(Object *obj, const char *name,
> -                                    const uint32_t *v, Error **errp);
> +                                    const uint32_t *v, bool readonly,
> +                                    Error **errp);
>  void object_class_property_add_uint32_ptr(ObjectClass *klass, const char=
 *name,
> -                                          const uint32_t *v, Error **err=
p);
> +                                          const uint32_t *v, bool readon=
ly,
> +                                          Error **errp);
>
>  /**
>   * object_property_add_uint64_ptr:
>   * @obj: the object to add a property to
>   * @name: the name of the property
>   * @v: pointer to value
> + * @readonly: don't add setter for value
>   * @errp: if an error occurs, a pointer to an area to store the error
>   *
>   * Add an integer property in memory.  This function will add a
>   * property of type 'uint64'.
>   */
>  void object_property_add_uint64_ptr(Object *obj, const char *name,
> -                                    const uint64_t *v, Error **Errp);
> +                                    const uint64_t *v, bool readonly,
> +                                    Error **Errp);
>  void object_class_property_add_uint64_ptr(ObjectClass *klass, const char=
 *name,
> -                                          const uint64_t *v, Error **Err=
p);
> +                                          const uint64_t *v, bool readon=
ly,
> +                                          Error **Errp);
>
>  /**
>   * object_property_add_alias:
> diff --git a/qom/object.c b/qom/object.c
> index d51b57fba1..775f702465 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -2326,6 +2326,26 @@ static void property_get_uint8_ptr(Object *obj, Vi=
sitor *v, const char *name,
>      visit_type_uint8(v, name, &value, errp);
>  }
>
> +static void property_set_uint8_ptr(Object *obj, Visitor *v, const char *=
name,
> +                                   void *opaque, Error **errp)
> +{
> +    uint8_t *field =3D opaque;
> +    uint8_t value;
> +    Error *local_err =3D NULL;
> +
> +    visit_type_uint8(v, name, &value, &local_err);
> +    if (local_err) {
> +        goto err;
> +    }
> +
> +    *field =3D value;
> +
> +    return;
> +
> +err:
> +    error_propagate(errp, local_err);
> +}


This is probably going to be refactored once the auto error series
land. But in the meantime, it would be nice to remove the goto label.

> +
>  static void property_get_uint16_ptr(Object *obj, Visitor *v, const char =
*name,
>                                      void *opaque, Error **errp)
>  {
> @@ -2333,6 +2353,26 @@ static void property_get_uint16_ptr(Object *obj, V=
isitor *v, const char *name,
>      visit_type_uint16(v, name, &value, errp);
>  }
>
> +static void property_set_uint16_ptr(Object *obj, Visitor *v, const char =
*name,
> +                                    void *opaque, Error **errp)
> +{
> +    uint16_t *field =3D opaque;
> +    uint16_t value;
> +    Error *local_err =3D NULL;
> +
> +    visit_type_uint16(v, name, &value, &local_err);
> +    if (local_err) {
> +        goto err;
> +    }
> +
> +    *field =3D value;
> +
> +    return;
> +
> +err:
> +    error_propagate(errp, local_err);
> +}
> +

same

>  static void property_get_uint32_ptr(Object *obj, Visitor *v, const char =
*name,
>                                      void *opaque, Error **errp)
>  {
> @@ -2340,6 +2380,26 @@ static void property_get_uint32_ptr(Object *obj, V=
isitor *v, const char *name,
>      visit_type_uint32(v, name, &value, errp);
>  }
>
> +static void property_set_uint32_ptr(Object *obj, Visitor *v, const char =
*name,
> +                                    void *opaque, Error **errp)
> +{
> +    uint32_t *field =3D opaque;
> +    uint32_t value;
> +    Error *local_err =3D NULL;
> +
> +    visit_type_uint32(v, name, &value, &local_err);
> +    if (local_err) {
> +        goto err;
> +    }
> +
> +    *field =3D value;
> +
> +    return;
> +
> +err:
> +    error_propagate(errp, local_err);
> +}

etc

> +
>  static void property_get_uint64_ptr(Object *obj, Visitor *v, const char =
*name,
>                                      void *opaque, Error **errp)
>  {
> @@ -2347,60 +2407,104 @@ static void property_get_uint64_ptr(Object *obj,=
 Visitor *v, const char *name,
>      visit_type_uint64(v, name, &value, errp);
>  }
>
> +static void property_set_uint64_ptr(Object *obj, Visitor *v, const char =
*name,
> +                                    void *opaque, Error **errp)
> +{
> +    uint64_t *field =3D opaque;
> +    uint64_t value;
> +    Error *local_err =3D NULL;
> +
> +    visit_type_uint64(v, name, &value, &local_err);
> +    if (local_err) {
> +        goto err;
> +    }
> +
> +    *field =3D value;
> +
> +    return;
> +
> +err:
> +    error_propagate(errp, local_err);
> +}
> +
>  void object_property_add_uint8_ptr(Object *obj, const char *name,
> -                                   const uint8_t *v, Error **errp)
> +                                   const uint8_t *v, bool readonly,
> +                                   Error **errp)
>  {
> -    object_property_add(obj, name, "uint8", property_get_uint8_ptr,
> -                        NULL, NULL, (void *)v, errp);
> +    object_property_add(obj, name, "uint8",
> +                        property_get_uint8_ptr,
> +                        readonly ? NULL : property_set_uint8_ptr,
> +                        NULL, (void *)v, errp);
>  }
>
>  void object_class_property_add_uint8_ptr(ObjectClass *klass, const char =
*name,
> -                                         const uint8_t *v, Error **errp)
> +                                         const uint8_t *v, bool readonly=
,
> +                                         Error **errp)
>  {
> -    object_class_property_add(klass, name, "uint8", property_get_uint8_p=
tr,
> -                              NULL, NULL, (void *)v, errp);
> +    object_class_property_add(klass, name, "uint8",
> +                              property_get_uint8_ptr,
> +                              readonly ? NULL : property_set_uint8_ptr,
> +                              NULL, (void *)v, errp);
>  }
>
>  void object_property_add_uint16_ptr(Object *obj, const char *name,
> -                                    const uint16_t *v, Error **errp)
> +                                    const uint16_t *v, bool readonly,
> +                                    Error **errp)
>  {
> -    object_property_add(obj, name, "uint16", property_get_uint16_ptr,
> -                        NULL, NULL, (void *)v, errp);
> +    object_property_add(obj, name, "uint16",
> +                        property_get_uint16_ptr,
> +                        readonly ? NULL : property_set_uint16_ptr,
> +                        NULL, (void *)v, errp);
>  }
>
>  void object_class_property_add_uint16_ptr(ObjectClass *klass, const char=
 *name,
> -                                          const uint16_t *v, Error **err=
p)
> +                                          const uint16_t *v, bool readon=
ly,
> +                                          Error **errp)
>  {
> -    object_class_property_add(klass, name, "uint16", property_get_uint16=
_ptr,
> -                              NULL, NULL, (void *)v, errp);
> +    object_class_property_add(klass, name, "uint16",
> +                              property_get_uint16_ptr,
> +                              readonly ? NULL : property_set_uint16_ptr,
> +                              NULL, (void *)v, errp);
>  }
>
>  void object_property_add_uint32_ptr(Object *obj, const char *name,
> -                                    const uint32_t *v, Error **errp)
> +                                    const uint32_t *v, bool readonly,
> +                                    Error **errp)
>  {
> -    object_property_add(obj, name, "uint32", property_get_uint32_ptr,
> -                        NULL, NULL, (void *)v, errp);
> +    object_property_add(obj, name, "uint32",
> +                        property_get_uint32_ptr,
> +                        readonly ? NULL : property_set_uint32_ptr,
> +                        NULL, (void *)v, errp);
>  }
>
>  void object_class_property_add_uint32_ptr(ObjectClass *klass, const char=
 *name,
> -                                          const uint32_t *v, Error **err=
p)
> +                                          const uint32_t *v, bool readon=
ly,
> +                                          Error **errp)
>  {
> -    object_class_property_add(klass, name, "uint32", property_get_uint32=
_ptr,
> -                              NULL, NULL, (void *)v, errp);
> +    object_class_property_add(klass, name, "uint32",
> +                              property_get_uint32_ptr,
> +                              readonly ? NULL : property_set_uint32_ptr,
> +                              NULL, (void *)v, errp);
>  }
>
>  void object_property_add_uint64_ptr(Object *obj, const char *name,
> -                                    const uint64_t *v, Error **errp)
> +                                    const uint64_t *v, bool readonly,
> +                                    Error **errp)
>  {
> -    object_property_add(obj, name, "uint64", property_get_uint64_ptr,
> -                        NULL, NULL, (void *)v, errp);
> +    object_property_add(obj, name, "uint64",
> +                        property_get_uint64_ptr,
> +                        property_set_uint64_ptr,
> +                        NULL, (void *)v, errp);
>  }
>
>  void object_class_property_add_uint64_ptr(ObjectClass *klass, const char=
 *name,
> -                                          const uint64_t *v, Error **err=
p)
> +                                          const uint64_t *v, bool readon=
ly,
> +                                          Error **errp)
>  {
> -    object_class_property_add(klass, name, "uint64", property_get_uint64=
_ptr,
> -                              NULL, NULL, (void *)v, errp);
> +    object_class_property_add(klass, name, "uint64",
> +                              property_get_uint64_ptr,
> +                              readonly ? NULL : property_set_uint64_ptr,
> +                              NULL, (void *)v, errp);
>  }
>
>  typedef struct {
> diff --git a/ui/console.c b/ui/console.c
> index 82d1ddac9c..3375c33d71 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1296,8 +1296,7 @@ static QemuConsole *new_console(DisplayState *ds, c=
onsole_type_t console_type,
>                               object_property_allow_set_link,
>                               OBJ_PROP_LINK_STRONG,
>                               &error_abort);
> -    object_property_add_uint32_ptr(obj, "head",
> -                                   &s->head, &error_abort);
> +    object_property_add_uint32_ptr(obj, "head", &s->head, true, &error_a=
bort);
>
>      if (!active_console || ((active_console->console_type !=3D GRAPHIC_C=
ONSOLE) &&
>          (console_type =3D=3D GRAPHIC_CONSOLE))) {
> --
> 2.20.1
>

looks good otherwise


--
Marc-Andr=C3=A9 Lureau

