Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21D76C11BA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 13:21:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peEV4-0008Qn-Ro; Mon, 20 Mar 2023 08:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peEV2-0008QP-TI
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 08:20:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peEUx-0008C6-Jq
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 08:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679314822;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kjPA2Z0FmKLhpnaWhw0JoSJARBF0zJPfcrpSEPvo1JQ=;
 b=Dl6QSEqxkbcpGUSDoW5oyhUuP56alFhDAVpo/dXmTtVfPDEjYoTwFfa+ifg1R2gp64Iy/J
 r+TdCaAQ7IMb4HTHsgH0Up2JG4QseFlct7PgpDNq+s60wEwFx00bqb8scijN8VAB6DPwmt
 qfxOSGPpLcxiICXgTsTZhdx08IToTtU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-EXKy8FInNaqfRfwcXzPz5g-1; Mon, 20 Mar 2023 08:20:19 -0400
X-MC-Unique: EXKy8FInNaqfRfwcXzPz5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEB66858F09;
 Mon, 20 Mar 2023 12:20:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 113A52027047;
 Mon, 20 Mar 2023 12:20:17 +0000 (UTC)
Date: Mon, 20 Mar 2023 12:20:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, shentey@gmail.com, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] ui/gtk: fix cursor moved to lower-left corner
Message-ID: <ZBhPf8XRWxIibvnL@redhat.com>
References: <20230320114756.1531772-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230320114756.1531772-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 20, 2023 at 03:47:56PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Do not attempt to move the pointer if the widget is not yet realized.
> (this is reproducible with X11)

What is reproducible ? Can you describe the problem that was
reported by Bernhard ?

> 
> Fixes: 6effaa16ac98 ("ui: set cursor position upon listener
> registration")
> Reported-by: Bernhard Beschow <shentey@gmail.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/gtk.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/ui/gtk.c b/ui/gtk.c
> index fd82e9b1ca..e9564f2baa 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -450,7 +450,8 @@ static void gd_mouse_set(DisplayChangeListener *dcl,
>      GdkDisplay *dpy;
>      gint x_root, y_root;
>  
> -    if (qemu_input_is_absolute()) {
> +    if (!gtk_widget_get_realized(vc->gfx.drawing_area) ||
> +        qemu_input_is_absolute()) {
>          return;
>      }
>  
> -- 
> 2.39.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


