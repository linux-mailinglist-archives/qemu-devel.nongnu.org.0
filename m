Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EDB2E01A3
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 21:50:21 +0100 (CET)
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krS8K-000267-NO
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 15:50:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1krS3x-0008Kt-F4; Mon, 21 Dec 2020 15:45:49 -0500
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:35049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1krS3t-00075H-Oj; Mon, 21 Dec 2020 15:45:49 -0500
Received: by mail-qk1-x72e.google.com with SMTP id n142so10085183qkn.2;
 Mon, 21 Dec 2020 12:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=++OKdv9Nz73q/t15CMlOcvvBUOX0drrx0UAEldE5a08=;
 b=smFQnT8XUzm4XXCoCZMY0STcKNXZPM7m0HTKUnGsZvKNMXVIAynNohPfFV5RzuaixU
 wiULogF3JjUfubHJudQpd6dqV2nuieElWCn+MbYTpO19NHczvlOYyRpHDaSRdzaLiopI
 9wqjc0DnmB4Un60ym6NafgYyOk3Z7qFp+gxtu9+YaGk5BSJpqgsdJkJxjASkInfsWkF3
 BMJGkd4JBT+shsmcClYq4+mY6BobtxVfa4wYjVlRUMVHL6CUtNniSr80Psue7gaB+NUM
 MBzs6Try1pIp2AXtOSBtB5oAC7zzXCecgcRARXFxM87ceIpAr2MbVmoqWZ40o7YTg1DT
 M21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=++OKdv9Nz73q/t15CMlOcvvBUOX0drrx0UAEldE5a08=;
 b=jZ5l4O7G3SJ8YKb53vl5tpHFDb7nXAGeNBBFPFdp8d7uDCSuqHQmo/vVYsvVAUHaNV
 novSHZYnIYtBiCYT7LKceVzudkVQM0ONXqcXP9wPuwUjrxaGKk1MqGrOrwX+RNHEbNsl
 izAR12p36FwWhvVP/SuT+1PUo8tFbE47gHsCm89Moix5nLQZjCVYKhelh87NNyYWvtWv
 jGa0T/zBk+n6241nEg0K3/opB/9fhHnVs/M5MAkLTXUjgjwCvfliITpjbIKijsky2YJh
 MAUFcDEUNM3pa8P+Yd9lg0svgLXUVOBoViKtoMBl9MTFZtIO6zFWpMvy8lJwDDB+Yl+D
 ALQw==
X-Gm-Message-State: AOAM532INBoOeZNuDNfRHHazQ0AtMKw+WMpp+t/tULavt35XBhhuqPMD
 2RUJLxsnA455oz8NRzaL/sxnY4oLr5E=
X-Google-Smtp-Source: ABdhPJymM2HNqFN2VFEc5gyYhE9UbfgHnwp+tjZPeTUB+EH4VLdArcx4vY7WCD9C+QM+2whXhgtSgg==
X-Received: by 2002:a37:851:: with SMTP id 78mr19132959qki.46.1608583544141;
 Mon, 21 Dec 2020 12:45:44 -0800 (PST)
Received: from ?IPv6:2804:431:c7c6:556d:fa44:43b8:486b:f066?
 ([2804:431:c7c6:556d:fa44:43b8:486b:f066])
 by smtp.gmail.com with ESMTPSA id x185sm11774800qkb.87.2020.12.21.12.45.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 12:45:43 -0800 (PST)
Subject: Re: [PATCH 6/6] spapr: Model DR connectors as simple objects
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20201218103400.689660-1-groug@kaod.org>
 <20201218103400.689660-7-groug@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <24e7484f-5976-e2a2-8339-76be1c76f134@gmail.com>
Date: Mon, 21 Dec 2020 17:45:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218103400.689660-7-groug@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.233,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/18/20 7:34 AM, Greg Kurz wrote:
> Modeling DR connectors as individual devices raises some
> concerns, as already discussed a year ago in this thread:
> 
> https://patchew.org/QEMU/20191017205953.13122-1-cheloha@linux.vnet.ibm.com/
> 
> First, high maxmem settings creates too many DRC devices.
> This causes scalability issues. It severely increase boot

s/increase/increases

> time because the multiple traversals of the DRC list that
> are performed during machine setup are quadratic operations.
> This is directly related to the fact that DRCs are modeled
> as individual devices and added to the composition tree.
> 
> Second, DR connectors are really an internal concept of
> PAPR. They aren't something that the user or management
> layer can manipulate in any way. We already don't allow
> their creation with device_add by clearing user_creatable.
> 
> DR connectors don't even need to be modeled as actual
> devices since they don't sit in a bus. They just need
> to be associated to an 'owner' object and to have the
> equivalent of realize/unrealize functions.
> 
> Downgrade them to be simple objects. Convert the existing
> realize() and unrealize() to be methods of the DR connector
> base class. Also have the base class to inherit from the
> vmstate_if interface directly. The get_id() hook simply
> returns NULL, just as device_vmstate_if_get_id() does for
> devices that don't sit in a bus. The DR connector is no
> longer made a child object. This means that it must be
> explicitely freed when no longer needed. This is only


s/explicitely/explicitly

> required for PHBs and PCI bridges actually : have them to
> free the DRC with spapr_dr_connector_free() instead of
> object_unparent().
> 
> No longer add the DRCs to the QOM composition tree. Track
> them with a glib hash table using the global DRC index as
> the key instead. This makes traversal a linear operation.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---


Code LGTM. The maintainer is welcome to fix the nits while pushing.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>




>   include/hw/ppc/spapr_drc.h |   8 +-
>   hw/ppc/spapr_drc.c         | 166 ++++++++++++++-----------------------
>   hw/ppc/spapr_pci.c         |   2 +-
>   3 files changed, 69 insertions(+), 107 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
> index 8982927d5c24..a26aa8b9d4c3 100644
> --- a/include/hw/ppc/spapr_drc.h
> +++ b/include/hw/ppc/spapr_drc.h
> @@ -170,7 +170,7 @@ typedef enum {
>   
>   typedef struct SpaprDrc {
>       /*< private >*/
> -    DeviceState parent;
> +    Object parent;
>   
>       uint32_t id;
>       Object *owner;
> @@ -193,7 +193,7 @@ struct SpaprMachineState;
>   
>   typedef struct SpaprDrcClass {
>       /*< private >*/
> -    DeviceClass parent;
> +    ObjectClass parent;
>       SpaprDrcState empty_state;
>       SpaprDrcState ready_state;
>   
> @@ -209,6 +209,9 @@ typedef struct SpaprDrcClass {
>   
>       int (*dt_populate)(SpaprDrc *drc, struct SpaprMachineState *spapr,
>                          void *fdt, int *fdt_start_offset, Error **errp);
> +
> +    void (*realize)(SpaprDrc *drc);
> +    void (*unrealize)(SpaprDrc *drc);
>   } SpaprDrcClass;
>   
>   typedef struct SpaprDrcPhysical {
> @@ -232,6 +235,7 @@ SpaprDrcType spapr_drc_type(SpaprDrc *drc);
>   
>   SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
>                                            uint32_t id);
> +void spapr_dr_connector_free(SpaprDrc *drc);
>   SpaprDrc *spapr_drc_by_index(uint32_t index);
>   SpaprDrc *spapr_drc_by_id(const char *type, uint32_t id);
>   int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask);
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 8571d5bafe4e..e26763f8b5a4 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -27,7 +27,6 @@
>   #include "sysemu/reset.h"
>   #include "trace.h"
>   
> -#define DRC_CONTAINER_PATH "/dr-connector"
>   #define DRC_INDEX_TYPE_SHIFT 28
>   #define DRC_INDEX_ID_MASK ((1ULL << DRC_INDEX_TYPE_SHIFT) - 1)
>   
> @@ -503,65 +502,56 @@ static const VMStateDescription vmstate_spapr_drc = {
>       }
>   };
>   
> -static void drc_realize(DeviceState *d, Error **errp)
> +static GHashTable *drc_hash_table(void)
>   {
> -    SpaprDrc *drc = SPAPR_DR_CONNECTOR(d);
> -    Object *root_container;
> -    gchar *link_name;
> -    const char *child_name;
> +    static GHashTable *dht;
>   
> +    if (!dht) {
> +        dht = g_hash_table_new(NULL, NULL);
> +    }
> +
> +    return dht;
> +}
> +
> +
> +static void drc_realize(SpaprDrc *drc)
> +{
>       trace_spapr_drc_realize(spapr_drc_index(drc));
> -    /* NOTE: we do this as part of realize/unrealize due to the fact
> -     * that the guest will communicate with the DRC via RTAS calls
> -     * referencing the global DRC index. By unlinking the DRC
> -     * from DRC_CONTAINER_PATH/<drc_index> we effectively make it
> -     * inaccessible by the guest, since lookups rely on this path
> -     * existing in the composition tree
> -     */
> -    root_container = container_get(object_get_root(), DRC_CONTAINER_PATH);
> -    link_name = g_strdup_printf("%x", spapr_drc_index(drc));
> -    child_name = object_get_canonical_path_component(OBJECT(drc));
> -    trace_spapr_drc_realize_child(spapr_drc_index(drc), child_name);
> -    object_property_add_alias(root_container, link_name,
> -                              drc->owner, child_name);
> -    g_free(link_name);
> +
> +    g_hash_table_insert(drc_hash_table(),
> +                        GUINT_TO_POINTER(spapr_drc_index(drc)), drc);
>       vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spapr_drc,
>                        drc);
>       trace_spapr_drc_realize_complete(spapr_drc_index(drc));
>   }
>   
> -static void drc_unrealize(DeviceState *d)
> +static void drc_unrealize(SpaprDrc *drc)
>   {
> -    SpaprDrc *drc = SPAPR_DR_CONNECTOR(d);
> -    Object *root_container;
> -    gchar *name;
> -
>       trace_spapr_drc_unrealize(spapr_drc_index(drc));
>       vmstate_unregister(VMSTATE_IF(drc), &vmstate_spapr_drc, drc);
> -    root_container = container_get(object_get_root(), DRC_CONTAINER_PATH);
> -    name = g_strdup_printf("%x", spapr_drc_index(drc));
> -    object_property_del(root_container, name);
> -    g_free(name);
> +    g_hash_table_remove(drc_hash_table(),
> +                        GUINT_TO_POINTER(spapr_drc_index(drc)));
>   }
>   
>   SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
>                                            uint32_t id)
>   {
>       SpaprDrc *drc = SPAPR_DR_CONNECTOR(object_new(type));
> -    char *prop_name;
>   
>       drc->id = id;
> -    drc->owner = owner;
> -    prop_name = g_strdup_printf("dr-connector[%"PRIu32"]",
> -                                spapr_drc_index(drc));
> -    object_property_add_child(owner, prop_name, OBJECT(drc));
> -    object_unref(OBJECT(drc));
> -    qdev_realize(DEVICE(drc), NULL, NULL);
> -    g_free(prop_name);
> +    drc->owner = object_ref(owner);
> +    SPAPR_DR_CONNECTOR_GET_CLASS(drc)->realize(drc);
>   
>       return drc;
>   }
>   
> +void spapr_dr_connector_free(SpaprDrc *drc)
> +{
> +    SPAPR_DR_CONNECTOR_GET_CLASS(drc)->unrealize(drc);
> +    object_unref(drc->owner);
> +    object_unref(drc);
> +}
> +
>   static void spapr_dr_connector_instance_init(Object *obj)
>   {
>       SpaprDrc *drc = SPAPR_DR_CONNECTOR(obj);
> @@ -575,17 +565,19 @@ static void spapr_dr_connector_instance_init(Object *obj)
>       drc->state = drck->empty_state;
>   }
>   
> +static char *drc_vmstate_if_get_id(VMStateIf *obj)
> +{
> +    return NULL;
> +}
> +
>   static void spapr_dr_connector_class_init(ObjectClass *k, void *data)
>   {
> -    DeviceClass *dk = DEVICE_CLASS(k);
> +    SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_CLASS(k);
> +    VMStateIfClass *vc = VMSTATE_IF_CLASS(k);
>   
> -    dk->realize = drc_realize;
> -    dk->unrealize = drc_unrealize;
> -    /*
> -     * Reason: DR connector needs to be wired to either the machine or to a
> -     * PHB in spapr_dr_connector_new().
> -     */
> -    dk->user_creatable = false;
> +    drck->realize = drc_realize;
> +    drck->unrealize = drc_unrealize;
> +    vc->get_id = drc_vmstate_if_get_id;
>   }
>   
>   static bool drc_physical_needed(void *opaque)
> @@ -623,39 +615,32 @@ static void drc_physical_reset(void *opaque)
>       }
>   }
>   
> -static void realize_physical(DeviceState *d, Error **errp)
> +static void realize_physical(SpaprDrc *drc)
>   {
> -    SpaprDrcPhysical *drcp = SPAPR_DRC_PHYSICAL(d);
> -    Error *local_err = NULL;
> -
> -    drc_realize(d, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> +    SpaprDrcPhysical *drcp = SPAPR_DRC_PHYSICAL(drc);
>   
> +    drc_realize(drc);
>       vmstate_register(VMSTATE_IF(drcp),
>                        spapr_drc_index(SPAPR_DR_CONNECTOR(drcp)),
>                        &vmstate_spapr_drc_physical, drcp);
>       qemu_register_reset(drc_physical_reset, drcp);
>   }
>   
> -static void unrealize_physical(DeviceState *d)
> +static void unrealize_physical(SpaprDrc *drc)
>   {
> -    SpaprDrcPhysical *drcp = SPAPR_DRC_PHYSICAL(d);
> +    SpaprDrcPhysical *drcp = SPAPR_DRC_PHYSICAL(drc);
>   
> -    drc_unrealize(d);
> -    vmstate_unregister(VMSTATE_IF(drcp), &vmstate_spapr_drc_physical, drcp);
>       qemu_unregister_reset(drc_physical_reset, drcp);
> +    vmstate_unregister(VMSTATE_IF(drcp), &vmstate_spapr_drc_physical, drcp);
> +    drc_unrealize(drc);
>   }
>   
>   static void spapr_drc_physical_class_init(ObjectClass *k, void *data)
>   {
> -    DeviceClass *dk = DEVICE_CLASS(k);
>       SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_CLASS(k);
>   
> -    dk->realize = realize_physical;
> -    dk->unrealize = unrealize_physical;
> +    drck->realize = realize_physical;
> +    drck->unrealize = unrealize_physical;
>       drck->dr_entity_sense = physical_entity_sense;
>       drck->isolate = drc_isolate_physical;
>       drck->unisolate = drc_unisolate_physical;
> @@ -731,12 +716,16 @@ static void spapr_drc_pmem_class_init(ObjectClass *k, void *data)
>   
>   static const TypeInfo spapr_dr_connector_info = {
>       .name          = TYPE_SPAPR_DR_CONNECTOR,
> -    .parent        = TYPE_DEVICE,
> +    .parent        = TYPE_OBJECT,
>       .instance_size = sizeof(SpaprDrc),
>       .instance_init = spapr_dr_connector_instance_init,
>       .class_size    = sizeof(SpaprDrcClass),
>       .class_init    = spapr_dr_connector_class_init,
>       .abstract      = true,
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_VMSTATE_IF },
> +        { }
> +    },
>   };
>   
>   static const TypeInfo spapr_drc_physical_info = {
> @@ -789,14 +778,9 @@ static const TypeInfo spapr_drc_pmem_info = {
>   
>   SpaprDrc *spapr_drc_by_index(uint32_t index)
>   {
> -    Object *obj;
> -    gchar *name;
> -
> -    name = g_strdup_printf("%s/%x", DRC_CONTAINER_PATH, index);
> -    obj = object_resolve_path(name, NULL);
> -    g_free(name);
> -
> -    return !obj ? NULL : SPAPR_DR_CONNECTOR(obj);
> +    return
> +        SPAPR_DR_CONNECTOR(g_hash_table_lookup(drc_hash_table(),
> +                                               GUINT_TO_POINTER(index)));
>   }
>   
>   SpaprDrc *spapr_drc_by_id(const char *type, uint32_t id)
> @@ -824,13 +808,12 @@ SpaprDrc *spapr_drc_by_id(const char *type, uint32_t id)
>    */
>   int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask)
>   {
> -    Object *root_container;
> -    ObjectProperty *prop;
> -    ObjectPropertyIterator iter;
> +    GHashTableIter iter;
>       uint32_t drc_count = 0;
>       GArray *drc_indexes, *drc_power_domains;
>       GString *drc_names, *drc_types;
>       int ret;
> +    SpaprDrc *drc;
>   
>       /*
>        * This should really be only called once per node since it overwrites
> @@ -851,26 +834,12 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask)
>       drc_names = g_string_set_size(g_string_new(NULL), sizeof(uint32_t));
>       drc_types = g_string_set_size(g_string_new(NULL), sizeof(uint32_t));
>   
> -    /* aliases for all DRConnector objects will be rooted in QOM
> -     * composition tree at DRC_CONTAINER_PATH
> -     */
> -    root_container = container_get(object_get_root(), DRC_CONTAINER_PATH);
> -
> -    object_property_iter_init(&iter, root_container);
> -    while ((prop = object_property_iter_next(&iter))) {
> -        Object *obj;
> -        SpaprDrc *drc;
> +    g_hash_table_iter_init(&iter, drc_hash_table());
> +    while (g_hash_table_iter_next(&iter, NULL, (gpointer) &drc)) {
>           SpaprDrcClass *drck;
>           char *drc_name = NULL;
>           uint32_t drc_index, drc_power_domain;
>   
> -        if (!strstart(prop->type, "link<", NULL)) {
> -            continue;
> -        }
> -
> -        obj = object_property_get_link(root_container, prop->name,
> -                                       &error_abort);
> -        drc = SPAPR_DR_CONNECTOR(obj);
>           drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
>   
>           if (owner && (drc->owner != owner)) {
> @@ -951,23 +920,12 @@ out:
>   
>   void spapr_drc_reset_all(SpaprMachineState *spapr)
>   {
> -    Object *drc_container;
> -    ObjectProperty *prop;
> -    ObjectPropertyIterator iter;
> +    GHashTableIter iter;
> +    SpaprDrc *drc;
>   
> -    drc_container = container_get(object_get_root(), DRC_CONTAINER_PATH);
>   restart:
> -    object_property_iter_init(&iter, drc_container);
> -    while ((prop = object_property_iter_next(&iter))) {
> -        SpaprDrc *drc;
> -
> -        if (!strstart(prop->type, "link<", NULL)) {
> -            continue;
> -        }
> -        drc = SPAPR_DR_CONNECTOR(object_property_get_link(drc_container,
> -                                                          prop->name,
> -                                                          &error_abort));
> -
> +    g_hash_table_iter_init(&iter, drc_hash_table());
> +    while (g_hash_table_iter_next(&iter, NULL, (gpointer) &drc)) {
>           /*
>            * This will complete any pending plug/unplug requests.
>            * In case of a unplugged PHB or PCI bridge, this will
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 76d7c91e9c64..ca0cca664e3c 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1262,7 +1262,7 @@ static void remove_drcs(SpaprPhbState *phb, PCIBus *bus)
>           SpaprDrc *drc = drc_from_devfn(phb, chassis, i);
>   
>           if (drc) {
> -            object_unparent(OBJECT(drc));
> +            spapr_dr_connector_free(drc);
>           }
>       }
>   }
> 

