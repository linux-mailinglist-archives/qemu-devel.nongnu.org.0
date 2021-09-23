Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A7A415C51
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:53:08 +0200 (CEST)
Received: from localhost ([::1]:60008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTMLj-00016R-7H
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTMKK-00087u-87
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:51:40 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:55964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTMK5-0005gh-1k
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:51:39 -0400
Received: by mail-pj1-x1029.google.com with SMTP id t20so4146075pju.5
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=4fJXlclBbnkVQPBywtqy0QsfK3GLzEGhebPQ86PZ4yM=;
 b=UwDv30mJvlcUbc5vsqv5ShtJ3oE0rdWz5cuSzKVT1VMx7oOAhptBwIZn+62mHKdIda
 CcTYo+EH+KpGcDyZdaNnrJToFa4sWqSUcsxSlx9OQMQwM6QNX2Bww7OSG0RQXXbD3De5
 /pWCE/0WJrdF+Yon0++dBCaOxfyz5xkXytI1DQ+bx6EBoEMTn9XJoS68bJ+H7GOwtgB8
 qoSCK6s0PZy1TP/XYoD8RYoHjlNP3fM2zc0dTANnUrIbLemr+exTR/fR3LouYTH11512
 q0A2gT3vXM5gNC++K3kAcqiW6ZU/MP54Ed6BdACd1DXgZye8fizrfC83ybMpvRifxhXA
 lPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=4fJXlclBbnkVQPBywtqy0QsfK3GLzEGhebPQ86PZ4yM=;
 b=WM4p10HxgcxQUe556arl3NOW3VWilmHfk5tRBbgQ5kpjG0Wi1Fjnkb+b1ad+BMFs0a
 COCBWa9qkkVxyinLalVDY4qwFL/0YspGrjCsdUTxCgSM5i9m0qDGID1w8n0Ffp8H7ra1
 gRPcxY5nDejd8pEfPzB2IQFdNL4WuMU2/Aizj2PBZrrl/rm0RzuYs5QTfjD/GSQ7kuw1
 KiVPfgKUqQqeTKNZ6Gl56be/mrjlXuzlo2ZYGW2lAurQ4X2F1LP4nsTdc8n3rXMoLBxk
 2rQDIRwW1Uffuufan9nfYvSapNhP/6KfcQRqALT+Vr3uI8O0jlgntEFmNTqn9VFzt4JF
 D2tQ==
X-Gm-Message-State: AOAM532gMydzkKDz7CO6Ghc0tIoehqSdMax3io6qOvH8jt1kYMRunofI
 sqz75a4eEEfp6/D620y4FWC9yg==
X-Google-Smtp-Source: ABdhPJzia+90/vmutfv9+OVhfiSOiEAHqZONBLVWc1gCXXoo34eh7DSYhO2/LLO7Y/O8VFiKodZgxw==
X-Received: by 2002:a17:90b:4d8f:: with SMTP id
 oj15mr4553491pjb.13.1632394282429; 
 Thu, 23 Sep 2021 03:51:22 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.156.170])
 by smtp.googlemail.com with ESMTPSA id e13sm5257765pfi.210.2021.09.23.03.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 03:51:21 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 23 Sep 2021 16:21:11 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [RFC PATCH v2 07/16] hw/core/machine: add
 machine_class_is_dynamic_sysbus_dev_allowed
In-Reply-To: <20210922161405.140018-8-damien.hedde@greensocs.com>
Message-ID: <alpine.DEB.2.22.394.2109231559230.630@anisinha-lenovo>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-8-damien.hedde@greensocs.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org,
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 22 Sep 2021, Damien Hedde wrote:

> Right now the allowance check for adding a sysbus device using
> -device cli option (or device_add qmp command) is done well after
> the device has been created. It is done during the machine init done
> notifier: machine_init_notify() in hw/core/machine.c
>
> This new function will allow us to check if a sysbus device type is
> allowed to be dynamically created by the machine during the device
> creation time.
>
> Also make device_is_dynamic_sysbus() use the new function.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>
> In the context of our series, we need to be able to do the check at
> device creation time to allow doing it depending on the current
> MACHINE_INIT phase.
> ---
>  include/hw/boards.h | 17 +++++++++++++++++
>  hw/core/machine.c   | 15 ++++++++++++---
>  2 files changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 463a5514f9..934443c1cd 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -51,6 +51,23 @@ void machine_set_cpu_numa_node(MachineState *machine,
>   */
>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
>
> +/**
> + * machine_class_is_dynamic_sysbus_dev_allowed: Check if type is an allowed
> + * sysbus device type for the machine class.
> + * @mc: Machine class
> + * @type: type to check (should be a subtype of TYPE_SYS_BUS_DEVICE)
> + *
> + * Returns: true if @type is a type in the machine's list of
> + * dynamically pluggable sysbus devices; otherwise false.
> + *
> + * Check if the QOM type @type is in the list of allowed sysbus device
> + * types (see machine_class_allowed_dynamic_sysbus_dev()).
> + * Note that if @type is a subtype of a type which is in the list, it is
> + * allowed too.
> + */
> +bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
> +                                                 const char *type);
> +

How about renaming this to device_type_is_allowed_dynamic_sysbus() ?

>  /**
>   * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
>   * @mc: Machine class
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 9125c9aad0..1a18912dc8 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -545,18 +545,27 @@ void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
>
>  bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
>  {
> -    bool allowed = false;
> -    strList *wl;
>      Object *obj = OBJECT(dev);
>
>      if (!object_dynamic_cast(obj, TYPE_SYS_BUS_DEVICE)) {
>          return false;
>      }
>
> +    return machine_class_is_dynamic_sysbus_dev_allowed(mc,
> +            object_get_typename(obj));
> +}
> +
> +bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
> +                                                 const char *type)
> +{
> +    bool allowed = false;
> +    strList *wl;
> +    ObjectClass *klass = object_class_by_name(type);
> +
>      for (wl = mc->allowed_dynamic_sysbus_devices;
>           !allowed && wl;
>           wl = wl->next) {
> -        allowed |= !!object_dynamic_cast(obj, wl->value);
> +        allowed |= !!object_class_dynamic_cast(klass, wl->value);
>      }
>
>      return allowed;
> --
> 2.33.0
>
>

