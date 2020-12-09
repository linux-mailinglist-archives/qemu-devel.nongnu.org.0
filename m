Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429552D3F02
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:43:48 +0100 (CET)
Received: from localhost ([::1]:53282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmw0h-0003pE-CC
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kmvzd-0003M8-Jz
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:42:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kmvza-0005Bj-VC
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607506957;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HHVw64IA+bM2tFhRh09UfdEpLt4ZteIiH+VENvbHXIs=;
 b=cEnDoj1DVFGFqJIif/KGcWgRlLuuf87pYOdm7b60AGaR3WAnjQiBLyW8MJg1Dw3qa8T1+z
 40vzOHlqoxvXsjTps1MoSAx0/i4hmDap2zL/msmPf4FY3rc+wPpQueay92Q7uP0R/sbA5I
 WdFhto9hBo4mx5rV8VXyvyuW22m5icE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-Nyy4YgM6NlSSwhoWwC_egg-1; Wed, 09 Dec 2020 04:42:34 -0500
X-MC-Unique: Nyy4YgM6NlSSwhoWwC_egg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88902800D53
 for <qemu-devel@nongnu.org>; Wed,  9 Dec 2020 09:42:33 +0000 (UTC)
Received: from redhat.com (ovpn-113-70.ams2.redhat.com [10.36.113.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C67FD5D719;
 Wed,  9 Dec 2020 09:42:28 +0000 (UTC)
Date: Wed, 9 Dec 2020 09:42:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] smbios: entry-point-type option
Message-ID: <20201209094225.GE3214234@redhat.com>
References: <20201208212023.1560846-1-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208212023.1560846-1-ehabkost@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 08, 2020 at 04:20:23PM -0500, Eduardo Habkost wrote:
> Add command-line option that lets the SMBIOS entry point type to
> be configured.
> 
> SMBIOS 3.0 support is necessary to allow us to support more
> than 720 VCPUs in x86_64, due to SMBIOS 2.1 table size limits.
> 
> Note that it's still up to firmware to decide whether to generate
> SMBIOS 2.1 and/or 3.0 entry points for the guest, using the
> information contained in etc/smbios/smbios-anchor.  OVMF, for
> example, is able to generate both entry points, depending on the
> value of PcdSmbiosEntryPointProvideMethod.
> 
> The SMBIOS 3.0 entry point won't be enabled by default because it
> is not supported yet by Seabios.  This may be changed once
> Seabios starts supporting SMBIOS 3.0 entry points.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Laszlo, Philippe: do you know how exactly the value of
> PcdSmbiosEntryPointProvideMethod is chosen when running OVMF?

Laszlo proides alot of detail in my original proposal for
selecting SMBIOS entry point here:

https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg03347.html

> ---
>  hw/smbios/smbios.c | 39 +++++++++++++++++++++++++++++++++++++--
>  qemu-options.hx    | 16 +++++++++++++++-
>  2 files changed, 52 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 6a3d39793b..ed5cf7fa9a 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -62,6 +62,7 @@ size_t smbios_tables_len;
>  unsigned smbios_table_max;
>  unsigned smbios_table_cnt;
>  static SmbiosEntryPointType smbios_ep_type = SMBIOS_ENTRY_POINT_21;
> +static bool smbios_ep_type_set;
>  
>  static SmbiosEntryPoint ep;
>  
> @@ -139,6 +140,15 @@ static const QemuOptDesc qemu_smbios_file_opts[] = {
>      { /* end of list */ }
>  };
>  
> +static const QemuOptDesc qemu_smbios_entry_point_opts[] = {
> +    {
> +        .name = "entry-point-type",
> +        .type = QEMU_OPT_STRING,
> +        .help = "SMBIOS Entry Point type (2.1 or 3.0)",
> +    },
> +    { /* end of list */ }
> +};
> +
>  static const QemuOptDesc qemu_smbios_type0_opts[] = {
>      {
>          .name = "type",
> @@ -797,7 +807,9 @@ void smbios_set_defaults(const char *manufacturer, const char *product,
>      smbios_have_defaults = true;
>      smbios_legacy = legacy_mode;
>      smbios_uuid_encoded = uuid_encoded;
> -    smbios_ep_type = ep_type;
> +    if (!smbios_ep_type_set) {
> +        smbios_ep_type = ep_type;
> +    }
>  
>      /* drop unwanted version of command-line file blob(s) */
>      if (smbios_legacy) {
> @@ -1232,5 +1244,28 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>          }
>      }
>  
> -    error_setg(errp, "Must specify type= or file=");
> +    val = qemu_opt_get(opts, "entry-point-type");
> +    if (val) {
> +        if (!qemu_opts_validate(opts, qemu_smbios_entry_point_opts, errp)) {
> +            return;
> +        }
> +
> +        if (smbios_ep_type_set) {
> +            error_setg(errp, "entry-point-type can't be set twice");
> +            return;
> +        }
> +
> +        if (!strcmp(val, "2.1")) {
> +            smbios_ep_type = SMBIOS_ENTRY_POINT_21;
> +            smbios_ep_type_set = true;
> +        } else if (!strcmp(val, "3.0")) {
> +            smbios_ep_type = SMBIOS_ENTRY_POINT_30;
> +            smbios_ep_type_set = true;
> +        } else {
> +            error_setg(errp, "Invalid entry point type: %s", val);
> +        }
> +        return;
> +    }
> +
> +    error_setg(errp, "Must specify type=, file=, or entry-point-type=");
>  }
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 104632ea34..d2a973f8a7 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2294,7 +2294,9 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>      "                specify SMBIOS type 11 fields\n"
>      "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
>      "               [,asset=str][,part=str][,speed=%d]\n"
> -    "                specify SMBIOS type 17 fields\n",
> +    "                specify SMBIOS type 17 fields\n"
> +    "-smbios entry-point-type=2.1|3.0\n"
> +    "                specify SMBIOS entry point type\n",

My previous patch:

  https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg03027.html

exposed the entry point version as a property on the PC machine
rather than the -smbios arg, principally because it is the machin
setup code that currently defines what version is used via the calls
to smbios_set_defaults().

IIUC from Laszlo's reply,  SMBIOS 2.1 is not valid for AArch64
at all - they only support 3.0.  So there's a small benefit from
configuring this against the PC machine types, because it prevents
ability to select 2.1 for ARM SMBIOS which would be invalid.



>      QEMU_ARCH_I386 | QEMU_ARCH_ARM)
>  SRST
>  ``-smbios file=binary``
> @@ -2356,6 +2358,18 @@ SRST
>  
>  ``-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str][,asset=str][,part=str][,speed=%d]``
>      Specify SMBIOS type 17 fields
> +
> +``-smbios entry-point-type=2.1|3.0``
> +    Specify SMBIOS entry point type
> +
> +    SMBIOS 3.0 allows the total size of SMBIOS tables to be much
> +    larger, but note that Seabios for x86 does not support SMBIOS
> +    3.0 (as of Seabios v1.14.0).
> +
> +    Note that this option only affects the SMBIOS data exposed
> +    through fw_cfg.  It's still up to the firmware to generate
> +    the actual SMBIOS entry point(s) seen by the guest operating
> +    system.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


