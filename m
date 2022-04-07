Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AB44F8010
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:07:24 +0200 (CEST)
Received: from localhost ([::1]:51098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncRr9-0002YM-6W
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ncRpS-0001A6-LX
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:05:40 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:41714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ncRpQ-0004PS-T6
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:05:38 -0400
Received: by mail-lf1-x130.google.com with SMTP id p15so9507315lfk.8
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 06:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6rHDvnVUvXSepkr/MKaZSTO5jOKquWIXsJH1bLFINTM=;
 b=dQC5HX+ierhRqPnMc648yXZv//dAz203RSR2H4lFpHM5t8iWqZst/dY0U0ZUFF/kQV
 PEW8sAPYQ5//WKJaHYTHTAkaYO6gFkrKJBwySK8mh9MqYoElGxQNkr98uZkEYqCb4TwM
 frpmbVsMGFqYsBjUXyMnf3NvlQMWa6fBMmqOXECbgF/XIANNJihhl3bG+5LilQoxck4G
 8cgIgV1uqisMVz3nXUjmDeDjuq0rFOUtD8UetHUG1TAUKuZb43CgzsX9SH5T3eeAZVDS
 G62uWevDVchVPyBN9v21daEEliaCRn8wuJCHdWl2aQCryQdGGUieP3us5F12pbe8Vmnb
 mFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6rHDvnVUvXSepkr/MKaZSTO5jOKquWIXsJH1bLFINTM=;
 b=ViZ7l74kBDqx2SrPZs6DEFxLvvdLG9bjpGp/cv0fmHe+vzCikJHPGUuU5wZJVOmEtQ
 NIpLdxm/loetukOwYNQnwdOoxJQABlxL3WfLpbVdiWvDQ2jGYDnW/uwC9IbEryPHmicm
 MJn80wkSnIr0Ty4URVuEwKkVL/SpY2jSMr83Z0irWL9nRFwArL9wuLk79J1WXzypSNs4
 gd4ZFfkx207pjCl5n476er8DASf1xT1whz9hTuqumv1ylPj1EHcc4UEZyDbUwoT7VxmP
 akEbyPhby7mLJY8WGiqWO0E9rqA3oKt6K1MyK+m8xnYtW2jXQkn9jsH7XMWChjSnGQF0
 6RQQ==
X-Gm-Message-State: AOAM530XN1l475njzB/1Ox5+IjrVQXWSXmjE5r5Pop+21MWdycmKFH92
 vZS3R0X+x+EOy2BtgOomXm8=
X-Google-Smtp-Source: ABdhPJwhcFX/dnFPccPXOb19NhPDWsCb5hoGdeMoR1AC1kZzji95APgZyP4hoptGXzJ259RfmLOOYA==
X-Received: by 2002:a05:6512:b28:b0:44a:9b62:3212 with SMTP id
 w40-20020a0565120b2800b0044a9b623212mr9404623lfu.320.1649336735027; 
 Thu, 07 Apr 2022 06:05:35 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a056512118f00b0044a835fd17esm2160900lfr.162.2022.04.07.06.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:05:34 -0700 (PDT)
Date: Thu, 7 Apr 2022 15:05:33 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v2 2/5] machine: update machine allowed list related
 functions/fields
Message-ID: <20220407130533.GC3143488@toto>
References: <20220331115312.30018-1-damien.hedde@greensocs.com>
 <20220331115312.30018-3-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220331115312.30018-3-damien.hedde@greensocs.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 01:53:09PM +0200, Damien Hedde wrote:
> The list will now accept any device (not only sysbus devices) so
> we rename the related code and documentation.
> 
> Create some temporary inline functions with old names until
> we've udpated callsites as well.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


> ---
>  include/hw/boards.h | 50 +++++++++++++++++++++++++++------------------
>  hw/core/machine.c   | 10 ++++-----
>  2 files changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index c92ac8815c..1814793175 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -38,35 +38,45 @@ void machine_parse_smp_config(MachineState *ms,
>                                const SMPConfiguration *config, Error **errp);
>  
>  /**
> - * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
> + * machine_class_allow_dynamic_device: Add type to list of valid devices
>   * @mc: Machine class
> - * @type: type to allow (should be a subtype of TYPE_SYS_BUS_DEVICE)
> + * @type: type to allow (should be a subtype of TYPE_DEVICE having the
> + *        uc_requires_machine_allowance flag)
>   *
>   * Add the QOM type @type to the list of devices of which are subtypes
> - * of TYPE_SYS_BUS_DEVICE but which are still permitted to be dynamically
> - * created (eg by the user on the command line with -device).
> - * By default if the user tries to create any devices on the command line
> - * that are subtypes of TYPE_SYS_BUS_DEVICE they will get an error message;
> - * for the special cases which are permitted for this machine model, the
> - * machine model class init code must call this function to add them
> - * to the list of specifically permitted devices.
> + * of TYPE_DEVICE but which are only permitted to be dynamically
> + * created (eg by the user on the command line with -device) if the
> + * machine allowed it.
> + *
> + * Otherwise if the user tries to create such a device on the command line,
> + * it will get an error message.
>   */
> -void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
> +void machine_class_allow_dynamic_device(MachineClass *mc, const char *type);
> +static inline void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc,
> +                                                          const char *type)
> +{
> +    machine_class_allow_dynamic_device(mc, type);
> +}
>  
>  /**
> - * device_type_is_dynamic_sysbus: Check if type is an allowed sysbus device
> + * device_type_is_dynamic_allowed: Check if type is an allowed device
>   * type for the machine class.
>   * @mc: Machine class
> - * @type: type to check (should be a subtype of TYPE_SYS_BUS_DEVICE)
> + * @type: type to check (should be a subtype of TYPE_DEVICE)
>   *
>   * Returns: true if @type is a type in the machine's list of
> - * dynamically pluggable sysbus devices; otherwise false.
> + * dynamically pluggable devices; otherwise false.
>   *
> - * Check if the QOM type @type is in the list of allowed sysbus device
> - * types (see machine_class_allowed_dynamic_sysbus_dev()).
> + * Check if the QOM type @type is in the list of allowed device
> + * types (see machine_class_allowed_dynamic_device()).
>   * Note that if @type has a parent type in the list, it is allowed too.
>   */
> -bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type);
> +bool device_type_is_dynamic_allowed(MachineClass *mc, const char *type);
> +static inline bool device_type_is_dynamic_sysbus(MachineClass *mc,
> +                                                 const char *type)
> +{
> +    return device_type_is_dynamic_allowed(mc, type);
> +}
>  
>  /**
>   * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
> @@ -74,12 +84,12 @@ bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type);
>   * @dev: device to check
>   *
>   * Returns: true if @dev is a sysbus device on the machine's list
> - * of dynamically pluggable sysbus devices; otherwise false.
> + * of dynamically pluggable devices; otherwise false.
>   *
>   * This function checks whether @dev is a valid dynamic sysbus device,
>   * by first confirming that it is a sysbus device and then checking it
> - * against the list of permitted dynamic sysbus devices which has been
> - * set up by the machine using machine_class_allow_dynamic_sysbus_dev().
> + * against the list of permitted dynamic devices which has been
> + * set up by the machine using machine_class_allow_dynamic_device().
>   *
>   * It is valid to call this with something that is not a subclass of
>   * TYPE_SYS_BUS_DEVICE; the function will return false in this case.
> @@ -263,7 +273,7 @@ struct MachineClass {
>      bool ignore_memory_transaction_failures;
>      int numa_mem_align_shift;
>      const char **valid_cpu_types;
> -    strList *allowed_dynamic_sysbus_devices;
> +    strList *allowed_dynamic_devices;
>      bool auto_enable_numa_with_memhp;
>      bool auto_enable_numa_with_memdev;
>      bool ignore_boot_device_suffixes;
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d856485cb4..fb1f7c8e5a 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -545,9 +545,9 @@ static void machine_set_nvdimm_persistence(Object *obj, const char *value,
>      nvdimms_state->persistence_string = g_strdup(value);
>  }
>  
> -void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
> +void machine_class_allow_dynamic_device(MachineClass *mc, const char *type)
>  {
> -    QAPI_LIST_PREPEND(mc->allowed_dynamic_sysbus_devices, g_strdup(type));
> +    QAPI_LIST_PREPEND(mc->allowed_dynamic_devices, g_strdup(type));
>  }
>  
>  bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
> @@ -558,16 +558,16 @@ bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
>          return false;
>      }
>  
> -    return device_type_is_dynamic_sysbus(mc, object_get_typename(obj));
> +    return device_type_is_dynamic_allowed(mc, object_get_typename(obj));
>  }
>  
> -bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type)
> +bool device_type_is_dynamic_allowed(MachineClass *mc, const char *type)
>  {
>      bool allowed = false;
>      strList *wl;
>      ObjectClass *klass = object_class_by_name(type);
>  
> -    for (wl = mc->allowed_dynamic_sysbus_devices;
> +    for (wl = mc->allowed_dynamic_devices;
>           !allowed && wl;
>           wl = wl->next) {
>          allowed |= !!object_class_dynamic_cast(klass, wl->value);
> -- 
> 2.35.1
> 
> 

