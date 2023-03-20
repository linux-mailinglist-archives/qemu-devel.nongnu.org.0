Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1722A6C1379
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:33:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFd5-0000zC-Pq; Mon, 20 Mar 2023 09:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peFd3-0000yU-RN
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:32:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peFd2-0006La-7R
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679319167;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Th9aGFJSdcBq95GWzGEzKE0U1sz+mkWoj3+dThbdJpk=;
 b=Eew3S+Kzh9XFYzJM4aiz0FRVXnKfLv1b3fY19uR9jQ4yv8eCXaPntJTi85SY7hheEf0ssy
 4PcJStzvNvr3Q8TAo7kOMsZNkqyi7ds6ElVEYqdN2C6lawxWCQVmBQ72+NHM6DyyPHNSYd
 nIskt7xOQVMAaseKsNROErUP/CeLLMk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-tKwRNE2bNB6CcF7kmnW_FA-1; Mon, 20 Mar 2023 09:32:45 -0400
X-MC-Unique: tKwRNE2bNB6CcF7kmnW_FA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 416731C189B0;
 Mon, 20 Mar 2023 13:32:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D4D61121315;
 Mon, 20 Mar 2023 13:32:44 +0000 (UTC)
Date: Mon, 20 Mar 2023 13:32:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, shentey@gmail.com, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] ui/gtk: fix cursor moved to left corner
Message-ID: <ZBhgen5zqT92fFyr@redhat.com>
References: <20230320132624.1612464-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230320132624.1612464-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Mon, Mar 20, 2023 at 05:26:24PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Do not attempt to move the pointer if the widget is not yet realized.
> The mouse cursor is placed to the corner of the screen, on X11 at least,
> as x_root and y_root are then miscalculated. (this is not reproducible
> on Wayland, because Gtk doesn't implement device warping there)
> 
> This also fixes the following warning at start:
> qemu: Gdk: gdk_window_get_root_coords: assertion 'GDK_IS_WINDOW (window)' failed

Ah, this assertion means that gdk_window_get_root_coords returns
control without setting x_root and y_root. So they contain
whatever garbage is on the stack. They could end up pointing anywhere,
and because max value of an 'int' is way larger than the screen size
they'll usually get capped at the sceen size and thus end up bottom
right corner.

> 
> Fixes: 6effaa16ac98 ("ui: set cursor position upon listener
> registration")
> Reported-by: Bernhard Beschow <shentey@gmail.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/gtk.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


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


