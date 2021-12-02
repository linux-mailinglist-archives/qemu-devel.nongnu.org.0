Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B3A4668C5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:00:56 +0100 (CET)
Received: from localhost ([::1]:46742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspS2-0007mo-PT
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:00:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mspOj-0005ni-Ax
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:57:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mspOf-0007KZ-9p
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638464244;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TufORAFGKNqwXFT72XnjGH0ad6WAMGgjXywwZSnOFfM=;
 b=cF6WlmDkyVFRbM5TPqZWbUdk0AS4pIAWYM7l07eZZv8jeaV19CFcYjDUpFo2EQrgexrytw
 9IwZA68wIQ+MM383wYyFcrcK3QYVAdRVMFoULzf9T8DJt/CSuZSTh9Xixec08+1DctKm2z
 cxlj9hZU4HDUzerDvi6A4vNhR4GPBdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-RTFUjiEiNMCrL0kuvaO6uw-1; Thu, 02 Dec 2021 11:57:18 -0500
X-MC-Unique: RTFUjiEiNMCrL0kuvaO6uw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 237E1760C0;
 Thu,  2 Dec 2021 16:57:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8928F5D9CA;
 Thu,  2 Dec 2021 16:57:02 +0000 (UTC)
Date: Thu, 2 Dec 2021 16:57:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH for 6.2?] Revert "vga: don't abort when adding a
 duplicate isa-vga device"
Message-ID: <Yaj63Mkx22/lmDbJ@redhat.com>
References: <20211202164929.1119036-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211202164929.1119036-1-alex.bennee@linaro.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 02, 2021 at 04:49:29PM +0000, Alex Bennée wrote:
> This reverts commit 7852a77f598635a67a222b6c1463c8b46098aed2.
> 
> The check is bogus as it ends up finding itself and falling over.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu.git/-/issues/733
> ---
>  hw/display/vga-isa.c | 10 ----------
>  1 file changed, 10 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

This turns the qemu-system-mips64el CLI scenario from a
pretty error back into an abort. Either way the user
in question isn't getting a running mips VM, so that's
preferrable to blocking valid usage scenarios.

I agree this should go into 6.2, as it a regression
introduced since 6.1, and this revert is low risk
since it is simply deleting lines.

When a PULL is done we should re-open

  https://gitlab.com/qemu-project/qemu/-/issues/44


> 
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 8cea84f2be..90851e730b 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -33,7 +33,6 @@
>  #include "hw/loader.h"
>  #include "hw/qdev-properties.h"
>  #include "qom/object.h"
> -#include "qapi/error.h"
>  
>  #define TYPE_ISA_VGA "isa-vga"
>  OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
> @@ -62,15 +61,6 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>      MemoryRegion *vga_io_memory;
>      const MemoryRegionPortio *vga_ports, *vbe_ports;
>  
> -    /*
> -     * make sure this device is not being added twice, if so
> -     * exit without crashing qemu
> -     */
> -    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
> -        error_setg(errp, "at most one %s device is permitted", TYPE_ISA_VGA);
> -        return;
> -    }
> -
>      s->global_vmstate = true;
>      vga_common_init(s, OBJECT(dev));
>      s->legacy_address_space = isa_address_space(isadev);
> -- 
> 2.30.2
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


