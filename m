Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A5A2CEDFE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 13:22:07 +0100 (CET)
Received: from localhost ([::1]:39116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klA6A-00035B-8u
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 07:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1klA4f-0002Wb-9k
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:20:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1klA4d-0003hh-Fp
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:20:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607084430;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ymnidZ9YeCDJC0uF70l3kRSfo1f7jUi4VKS7jGQOzrA=;
 b=PPLZrBQrIMu9LVhrUMjLsvQ3CeukoRdEMK8wdcigYOTvGSOBXIAmz76o+rRcWsTU+0G90X
 SZ/ma4ASpqKhQxkixZotHfNyVmXY8DAkQpLKGkZ65FGYSTgDmlGgSf4YHbUrDMF+1oP6Xg
 cuftWavf+mK4fag9DZgv5YTUzkhEtEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-uhc2zn5sObyzm3OPNiAR8A-1; Fri, 04 Dec 2020 07:20:28 -0500
X-MC-Unique: uhc2zn5sObyzm3OPNiAR8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84C9C802B4A
 for <qemu-devel@nongnu.org>; Fri,  4 Dec 2020 12:20:27 +0000 (UTC)
Received: from redhat.com (ovpn-115-10.ams2.redhat.com [10.36.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFB5A5D9CA;
 Fri,  4 Dec 2020 12:20:23 +0000 (UTC)
Date: Fri, 4 Dec 2020 12:20:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 9/9] qxl: add ui_info callback
Message-ID: <20201204122020.GF3056135@redhat.com>
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-10-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203110806.13556-10-kraxel@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 12:08:05PM +0100, Gerd Hoffmann wrote:
> This makes qxl respond to user interface window resizes
> when not using spice, so it works with gtk and vnc too.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/qxl.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 431c1070967a..e1df95c3e8a9 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -1177,8 +1177,35 @@ static const QXLInterface qxl_interface = {
>      .client_monitors_config = interface_client_monitors_config,
>  };
>  
> +static int qxl_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
> +{
> +    PCIQXLDevice *qxl = opaque;
> +    VDAgentMonitorsConfig *cfg;
> +    size_t size;
> +
> +    if (using_spice) {
> +        /* spice agent will handle display resize */
> +        return -1;
> +    }

Does this break VNC resizes if  both  VNC + SPICE are enabled
but the client is connected with VNC ?

> +    if (idx > 0) {
> +        /* supporting only single head for now */
> +        return -1;
> +    }
> +
> +    /* go fake a spice agent message */
> +    size = sizeof(VDAgentMonitorsConfig) + sizeof(VDAgentMonConfig);
> +    cfg = g_malloc0(size);
> +    cfg->num_of_monitors = 1;
> +    cfg->monitors[0].width = info->width;
> +    cfg->monitors[0].height = info->height;
> +    interface_client_monitors_config(&qxl->ssd.qxl, cfg);
> +    g_free(cfg);
> +    return 0;
> +}
> +
>  static const GraphicHwOps qxl_ops = {
>      .gfx_update  = qxl_hw_update,
> +    .ui_info     = qxl_ui_info,
>      .gfx_update_async = true,
>  };
>  
> -- 
> 2.27.0
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


