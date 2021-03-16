Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3646033D3F9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:37:02 +0100 (CET)
Received: from localhost ([::1]:46898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8wX-0004qc-8O
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lM8tl-0002KQ-Dg
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:34:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lM8ti-0002qm-E5
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615898043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C4dm+4hxZf9bd6Fbfese4K3Gz8zmHfmN38aRA4fj7Jk=;
 b=LWhKA2MqVuINB4MYtKooPWQBZF3eWxN4Li5/q+k9d9GAxNM8Dvo3Y8eG01qTAff5an4ko3
 dcj7Lh/t00xg1PUDsmBHPFxvgNdqf5cgHDfRFjVDV19G+uKpWi0//OpkLjJenLtTnYkS3v
 zVvRYJXFbQ3jiTML7+yiPjTfTPuUQm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-2Ag3qi00NC2Urkmv4O2MCg-1; Tue, 16 Mar 2021 08:33:59 -0400
X-MC-Unique: 2Ag3qi00NC2Urkmv4O2MCg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7DB683DD29;
 Tue, 16 Mar 2021 12:33:57 +0000 (UTC)
Received: from localhost (unknown [10.40.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A683B7A5CE;
 Tue, 16 Mar 2021 12:33:56 +0000 (UTC)
Date: Tue, 16 Mar 2021 13:33:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <20210316133354.20460aca@redhat.com>
In-Reply-To: <20210315220526.GB1004959@private.email.ne.jp>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315220526.GB1004959@private.email.ne.jp>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Reinoud Zandijk <reinoud@NetBSD.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 15:05:26 -0700
Isaku Yamahata <isaku.yamahata@gmail.com> wrote:

> On Mon, Mar 15, 2021 at 05:58:04PM +0100,
> Reinoud Zandijk <reinoud@NetBSD.org> wrote:
> 
> > I think its better to revert this and fix Linux ;) or make it a selectable
> > feature as a workaround that's by default OFF :)  
> 
> Anyway here is a patch to flip the default.
> At the moment, this is compile-only tested to provide the change quickly
> and make discussion progress.
> 
> From 50deeed38832ceccfb68f78dd66de5a1741b2897 Mon Sep 17 00:00:00 2001
> Message-Id: <50deeed38832ceccfb68f78dd66de5a1741b2897.1615845421.git.isaku.yamahata@intel.com>
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> Date: Mon, 15 Mar 2021 14:42:33 -0700
> Subject: [PATCH] ich9, piix4: flip default value for smm-compat
> 
> Make default value for smm-compat of ich9, piix4 true to keep old
> behavior.
> To get new (and more conformance to ACPI spec) behavior, explicitly
> set "-global ICH9-LPC.smm-compat=off" or
> "-global PIIX4_PM.smm-compat=off".

I'm not sure we should do that,
it's fine for non-versioned/new machine type to change in incompatible way with old images,
it's the job of old versioned machines types to maintain compatibility.
It's of cause pain for users if they use are unable to boot old image
on newest machine type, but we never promised that and if we made such
promise we would never be able to fix bugs.

> Reported-by: Reinoud Zandijk <reinoud@NetBSD.org>
> Fixes: 24cd04fce0 ("ich9, piix4: add property, smm-compat, to keep compatibility of SMM")
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>  hw/acpi/piix4.c   | 2 +-
>  hw/core/machine.c | 2 --
>  hw/isa/lpc_ich9.c | 2 +-
>  3 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 1efc0ded9f..34ade2c9bb 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -644,7 +644,7 @@ static Property piix4_pm_properties[] = {
>                       use_acpi_root_pci_hotplug, true),
>      DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
>                       acpi_memory_hotplug.is_enabled, true),
> -    DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, false),
> +    DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 4386f57b5c..e644c4e07d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,8 +37,6 @@
>  #include "hw/virtio/virtio-pci.h"
>  
>  GlobalProperty hw_compat_5_2[] = {
> -    { "ICH9-LPC", "smm-compat", "on"},
> -    { "PIIX4_PM", "smm-compat", "on"},
>  };
>  const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
>  
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 3963b73520..b7ff3a9747 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -775,7 +775,7 @@ static const VMStateDescription vmstate_ich9_lpc = {
>  
>  static Property ich9_lpc_properties[] = {
>      DEFINE_PROP_BOOL("noreboot", ICH9LPCState, pin_strap.spkr_hi, true),
> -    DEFINE_PROP_BOOL("smm-compat", ICH9LPCState, pm.smm_compat, false),
> +    DEFINE_PROP_BOOL("smm-compat", ICH9LPCState, pm.smm_compat, true),
>      DEFINE_PROP_BIT64("x-smi-broadcast", ICH9LPCState, smi_host_features,
>                        ICH9_LPC_SMI_F_BROADCAST_BIT, true),
>      DEFINE_PROP_BIT64("x-smi-cpu-hotplug", ICH9LPCState, smi_host_features,


