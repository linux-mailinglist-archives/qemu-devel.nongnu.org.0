Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679484C4E72
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 20:14:17 +0100 (CET)
Received: from localhost ([::1]:52330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNg2g-00020O-2I
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 14:14:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNg1T-0001KO-Py
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 14:13:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNg1Q-00012F-91
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 14:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645816375;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VwxyMdj0Hz5jEwzF7LzlQZH2ik1PUM/YmHjpdbvTlQE=;
 b=DBLkKqe9PjKn52rE/nrzZcftNFdlwLDKN6+8ilcDleLYqUVwJZA7ucHPQhorwgS8KSV3Sa
 mAl/iCk8iLV30aUItFl2X3lljT+dn8lzCKcouNw/Xh6dZskoA273PZFrrlOv7VfeqHUF20
 oFSNk105SJrox7IEH/IwS3XnHKCCKUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-WBZGXR16Mv2KiC3PtE8fTA-1; Fri, 25 Feb 2022 14:12:45 -0500
X-MC-Unique: WBZGXR16Mv2KiC3PtE8fTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D15C1006AA5;
 Fri, 25 Feb 2022 19:12:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AAAC825F7;
 Fri, 25 Feb 2022 19:12:36 +0000 (UTC)
Date: Fri, 25 Feb 2022 19:12:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Message-ID: <YhkqIvI/a5So6g8Y@redhat.com>
References: <20220225115830.177899-1-kshitij.suri@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220225115830.177899-1-kshitij.suri@nutanix.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 armbru@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 11:58:29AM +0000, Kshitij Suri wrote:
> Libpng is only detected if VNC is enabled currently. This patch adds a
> generalised png option in the meson build which is aimed to replace use of
> CONFIG_VNC_PNG with CONFIG_PNG.
> 
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> ---
>  meson.build        | 10 +++++-----
>  meson_options.txt  |  4 ++--
>  ui/vnc-enc-tight.c | 18 +++++++++---------
>  ui/vnc.c           |  4 ++--
>  ui/vnc.h           |  2 +-
>  5 files changed, 19 insertions(+), 19 deletions(-)


> diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
> index cebd35841a..14396e9f83 100644
> --- a/ui/vnc-enc-tight.c
> +++ b/ui/vnc-enc-tight.c
> @@ -32,7 +32,7 @@
>     INT32 definitions between jmorecfg.h (included by jpeglib.h) and
>     Win32 basetsd.h (included by windows.h). */
>  
> -#ifdef CONFIG_VNC_PNG
> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)

This (and every repeated instance) can be just

  #ifdef CONFIG_PNG

because the entire file is skipped by the build system
if CONFIG_VNC isn't defined.

>  /* The following define is needed by pngconf.h. Otherwise it won't compile,
>     because setjmp.h was already included by qemu-common.h. */
>  #define PNG_SKIP_SETJMP_CHECK
> @@ -95,7 +95,7 @@ static const struct {
>  };
>  #endif
>  
> -#ifdef CONFIG_VNC_PNG
> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>  static const struct {
>      int png_zlib_level, png_filters;
>  } tight_png_conf[] = {
> @@ -919,7 +919,7 @@ static int send_full_color_rect(VncState *vs, int x, int y, int w, int h)
>      int stream = 0;
>      ssize_t bytes;
>  
> -#ifdef CONFIG_VNC_PNG
> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>      if (tight_can_send_png_rect(vs, w, h)) {
>          return send_png_rect(vs, x, y, w, h, NULL);
>      }
> @@ -966,7 +966,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
>      int stream = 1;
>      int level = tight_conf[vs->tight->compression].mono_zlib_level;
>  
> -#ifdef CONFIG_VNC_PNG
> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>      if (tight_can_send_png_rect(vs, w, h)) {
>          int ret;
>          int bpp = vs->client_pf.bytes_per_pixel * 8;
> @@ -1020,7 +1020,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
>  struct palette_cb_priv {
>      VncState *vs;
>      uint8_t *header;
> -#ifdef CONFIG_VNC_PNG
> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>      png_colorp png_palette;
>  #endif
>  };
> @@ -1082,7 +1082,7 @@ static int send_palette_rect(VncState *vs, int x, int y,
>      int colors;
>      ssize_t bytes;
>  
> -#ifdef CONFIG_VNC_PNG
> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>      if (tight_can_send_png_rect(vs, w, h)) {
>          return send_png_rect(vs, x, y, w, h, palette);
>      }
> @@ -1233,7 +1233,7 @@ static int send_jpeg_rect(VncState *vs, int x, int y, int w, int h, int quality)
>  /*
>   * PNG compression stuff.
>   */
> -#ifdef CONFIG_VNC_PNG
> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>  static void write_png_palette(int idx, uint32_t pix, void *opaque)
>  {
>      struct palette_cb_priv *priv = opaque;
> @@ -1379,7 +1379,7 @@ static int send_png_rect(VncState *vs, int x, int y, int w, int h,
>      buffer_reset(&vs->tight->png);
>      return 1;
>  }
> -#endif /* CONFIG_VNC_PNG */
> +#endif /*(CONFIG_VNC && CONFIG_PNG) */
>  
>  static void vnc_tight_start(VncState *vs)
>  {
> @@ -1706,7 +1706,7 @@ void vnc_tight_clear(VncState *vs)
>  #ifdef CONFIG_VNC_JPEG
>      buffer_free(&vs->tight->jpeg);
>  #endif
> -#ifdef CONFIG_VNC_PNG
> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>      buffer_free(&vs->tight->png);
>  #endif
>  }
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 3ccd33dedc..1bf3790997 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -2165,7 +2165,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
>              vs->features |= VNC_FEATURE_TIGHT_MASK;
>              vs->vnc_encoding = enc;
>              break;
> -#ifdef CONFIG_VNC_PNG
> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>          case VNC_ENCODING_TIGHT_PNG:
>              vs->features |= VNC_FEATURE_TIGHT_PNG_MASK;
>              vs->vnc_encoding = enc;
> @@ -3248,7 +3248,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelSocket *sioc,
>  #ifdef CONFIG_VNC_JPEG
>      buffer_init(&vs->tight->jpeg,     "vnc-tight-jpeg/%p", sioc);
>  #endif
> -#ifdef CONFIG_VNC_PNG
> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>      buffer_init(&vs->tight->png,      "vnc-tight-png/%p", sioc);
>  #endif
>      buffer_init(&vs->zlib.zlib,      "vnc-zlib/%p", sioc);
> diff --git a/ui/vnc.h b/ui/vnc.h
> index a7149831f9..0cabcc2654 100644
> --- a/ui/vnc.h
> +++ b/ui/vnc.h
> @@ -201,7 +201,7 @@ typedef struct VncTight {
>  #ifdef CONFIG_VNC_JPEG
>      Buffer jpeg;
>  #endif
> -#ifdef CONFIG_VNC_PNG
> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>      Buffer png;
>  #endif
>      int levels[4];
> -- 
> 2.22.3
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


