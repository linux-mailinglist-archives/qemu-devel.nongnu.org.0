Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCE55180E2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:21:38 +0200 (CEST)
Received: from localhost ([::1]:35176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nloiv-0006DC-2y
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nlofM-00045l-MI
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:18:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nlofK-00014l-M3
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:17:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651569472;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5YdmXk0We02RnsTSr7YxPvcQUAMIg/yOCTRVqaYYAys=;
 b=erL98a7ONcodyb8lZYWQ1hl8qiifzPXPfIKdpp8cuIrfKZm7KzMX/oKeq6zjbY57XVw8bN
 jAGxn4mOFEfNNO3ktucXINUCLinzuKKkaj0T2WbjQAn0pw5V29CXEbokpFe8Lok1AfpylT
 ihem7U8gcWavUfbg7VBXJVxNY+pRm0Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-z5jBzThxOr28DJ7HRVS7Vg-1; Tue, 03 May 2022 05:17:49 -0400
X-MC-Unique: z5jBzThxOr28DJ7HRVS7Vg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 724DD802819;
 Tue,  3 May 2022 09:17:49 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6931015378A7;
 Tue,  3 May 2022 09:17:48 +0000 (UTC)
Date: Tue, 3 May 2022 10:17:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org, philmd@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 3/3] ui/gtk: specify detached window's size and location
Message-ID: <YnDzOlLvFNIG7y8M@redhat.com>
References: <20220428231304.19472-1-dongwon.kim@intel.com>
 <20220428231304.19472-4-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220428231304.19472-4-dongwon.kim@intel.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28, 2022 at 04:13:04PM -0700, Dongwon Kim wrote:
> Specify location and size of detached window based on top level
> window's location and size info when detachment happens.

Can you explain what problem is being solved by this change ?
What's wrong with default size/placement logic ?

In terms of size at least, I would hope we are resizing
windows any time the guest changes the resolution of the
virtual video adapter.  If there are 2 outputs, they can
be at different resolution, so copying the size of the
existing window feels wrong - we need to copy the guest
resolution currently set.

Why do we need to mess around with position at all ?

> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  ui/gtk.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/ui/gtk.c b/ui/gtk.c
> index f1ca6a7275..7dadf3b588 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -1338,6 +1338,8 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
>                                         FALSE);
>      }
>      if (!vc->window) {
> +        gint x, y, w, h;
> +        int i;
>          gtk_widget_set_sensitive(vc->menu_item, false);
>          vc->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
>  #if defined(CONFIG_OPENGL)
> @@ -1351,7 +1353,18 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
>          }
>  #endif
>          gd_widget_reparent(s->notebook, vc->window, vc->tab_item);
> +        gtk_window_get_position(GTK_WINDOW(s->window), &x, &y);
> +        gtk_window_get_size(GTK_WINDOW(s->window), &w, &h);
> +
> +        for (i = 0; i < s->nb_vcs; i++) {
> +            if (vc == &s->vc[i]) {
> +                break;
> +            }
> +        }
>  
> +        gtk_window_move(GTK_WINDOW(vc->window),
> +                        x + w * (i % (s->nb_vcs/2) + 1), y + h * (i / (s->nb_vcs/2)));
> +        gtk_window_resize(GTK_WINDOW(vc->window), w, h);
>          g_signal_connect(vc->window, "delete-event",
>                           G_CALLBACK(gd_tab_window_close), vc);
>          gtk_widget_show_all(vc->window);
> -- 
> 2.30.2
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


