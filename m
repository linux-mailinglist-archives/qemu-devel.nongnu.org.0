Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8DC4910E5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 21:14:04 +0100 (CET)
Received: from localhost ([::1]:36356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9YOB-0002S9-Vr
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 15:14:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9YMl-0001eg-VC
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:12:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9YMi-0002ok-Jr
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:12:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642450350;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lFdh9yCbNCJye7AbdxgLnz0EiAO6JYYsLPEtfrT7+dw=;
 b=H62D51z11xroNDDgbdJti+kTVecXgj+ts6QdCZgo57/8UedVaGkYkW2TM7sY6UyFLLDjX0
 cP9WT0e/Y+XoZSyNrTj7h3iMBqjnGzQ7FiLqfGu0PSHYMZcOAjbN49EMZdH3Rkg/7bD3MX
 cl7a8uMB88kkMaPgKvup48PGh0I13z4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-yMDpPQilP6CgiQvGhiJwXQ-1; Mon, 17 Jan 2022 15:12:26 -0500
X-MC-Unique: yMDpPQilP6CgiQvGhiJwXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F6F8343CA;
 Mon, 17 Jan 2022 20:12:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFAD912E22;
 Mon, 17 Jan 2022 20:12:20 +0000 (UTC)
Date: Mon, 17 Jan 2022 20:12:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw/i386/pc_piix: Mark the machine types from version 1.4
 to 1.7 as deprecated
Message-ID: <YeXNoKzsFeIPSy6E@redhat.com>
References: <20220117191639.278497-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220117191639.278497-1-thuth@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 08:16:39PM +0100, Thomas Huth wrote:
> The list of machine types grows larger and larger each release ... and
> it is unlikely that many people still use the very old ones for live
> migration. QEMU v1.7 has been released more than 8 years ago, so most
> people should have updated their machines to a newer version in those
> 8 years at least once. Thus let's mark the very old 1.x machine types
> as deprecated now.

What criteria did you use for picking v1.7 as the end point ?

I'm fine with the idea of aging out machine types, but I'd like us
to explain the criteria we use for this, so that we can set clear
expectations for users. I'm not a fan of adhoc decisions that have
different impact every time we randomly decide to apply them.

A simple rule could be time based - eg we could say

  "we'll keep machine type versions for 5 years or 15 releases."

one factor is how long our downstream consumers have been keeping
machines around for.

In RHEL-9 for example, the oldest machine is "pc-i440fx-rhel7.6.0"
which IIUC is derived from QEMU 2.12.0. RHEL-9 is likely to rebase
QEMU quite a few times over the coming years, so that 2.12.0 version
sets an example baseline for how long machines might need to live for.
That's 4 years this April, and could potentially be 6-7 years by the
time RHEL-9 stops rebasing QEMU.

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 8 ++++++++
>  hw/i386/pc_piix.c         | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index e21e07478f..652a4d43b6 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -318,6 +318,14 @@ machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
>  been implemented), so there is not much value added by this board. Use the
>  ``ref405ep`` machine instead.
>  
> +``pc-i440fx-1.4`` up to ``pc-i440fx-1.7`` (since 7.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +These old machine types are quite neglected nowadays and thus might have
> +various pitfalls with regards to live migration. Use a newer machine type
> +instead.
> +
> +
>  Backend options
>  ---------------
>  
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index d9b344248d..84f3633223 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -757,6 +757,7 @@ static void pc_i440fx_1_7_machine_options(MachineClass *m)
>      m->hw_version = "1.7.0";
>      m->default_machine_opts = NULL;
>      m->option_rom_has_mr = true;
> +    m->deprecation_reason = "old and unattended - use a newer version instead";
>      compat_props_add(m->compat_props, pc_compat_1_7, pc_compat_1_7_len);
>      pcmc->smbios_defaults = false;
>      pcmc->gigabyte_align = false;
> -- 
> 2.27.0
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


