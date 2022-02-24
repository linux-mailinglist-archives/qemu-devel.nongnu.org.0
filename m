Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902154C3122
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 17:20:34 +0100 (CET)
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGr3-0006lo-2o
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 11:20:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNGpb-00060x-6a
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:19:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNGpW-0005bI-Rd
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645719536;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NrhP9+F5SsPfXU8DZ6rsT/KNpScjw2DjjOGX1GWJTb0=;
 b=egBYwSRjujqqyvBW87CZHNhELiKsdgibBxMIlfJ9WHwwmyz5bP/e8CoABgLsbT7AMyv0ep
 arI95j4detxVarl7doGzKRxPOBnheTz/nXbA7UFH2/YqvxkbQDoQe4k6A7Nqeqyjz63VoS
 8WfgUFQKSpJA7UznTqoGOi6orbqcGB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-HZdgyYl9Os21xNcpxVZguQ-1; Thu, 24 Feb 2022 11:18:47 -0500
X-MC-Unique: HZdgyYl9Os21xNcpxVZguQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCE3D805742;
 Thu, 24 Feb 2022 16:18:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C4AB804E5;
 Thu, 24 Feb 2022 16:18:17 +0000 (UTC)
Date: Thu, 24 Feb 2022 16:18:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v2] Added parameter to take screenshot with screendump as
 PNG
Message-ID: <YhevxnLUi5BHWJ9G@redhat.com>
References: <20220224115908.102285-1-kshitij.suri@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220224115908.102285-1-kshitij.suri@nutanix.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Thu, Feb 24, 2022 at 11:59:08AM +0000, Kshitij Suri wrote:
> Currently screendump only supports PPM format, which is un-compressed and not
> standard. Added a "format" parameter to qemu monitor screendump capabilites
> to support PNG image capture using libpng. The param was added in QAPI schema
> of screendump present in ui.json along with png_save() function which converts
> pixman_image to PNG. HMP command equivalent was also modified to support the
> feature.
> 
> Example usage:
> { "execute": "screendump", "arguments": { "filename": "/tmp/image", "format":"png" } }
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718
> 
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> ---
> diff to v1:
>   - Removed repeated alpha conversion operation.
>   - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>   - Added a new CONFIG_PNG parameter for libpng support.
>   - Changed input format to enum instead of string.
> 
>  hmp-commands.hx    | 11 +++---
>  meson.build        | 13 +++++--
>  meson_options.txt  |  2 +
>  monitor/hmp-cmds.c |  8 +++-
>  qapi/ui.json       | 24 ++++++++++--
>  ui/console.c       | 97 ++++++++++++++++++++++++++++++++++++++++++++--
>  6 files changed, 139 insertions(+), 16 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 70a9136ac2..e43c9954b5 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -244,17 +244,18 @@ ERST
>  
>      {
>          .name       = "screendump",
> -        .args_type  = "filename:F,device:s?,head:i?",
> -        .params     = "filename [device [head]]",
> -        .help       = "save screen from head 'head' of display device 'device' "
> -                      "into PPM image 'filename'",
> +        .args_type  = "filename:F,device:s?,head:i?,format:f?",
> +        .params     = "filename [device [head]] [format]",
> +        .help       = "save screen from head 'head' of display device 'device'"
> +                      "in specified format 'format' as image 'filename'."
> +                      "Currently only 'png' and 'ppm' formats are supported.",
>          .cmd        = hmp_screendump,
>          .coroutine  = true,
>      },
>  
>  SRST
>  ``screendump`` *filename*
> -  Save screen into PPM image *filename*.
> +  Save screen as an image *filename*.
>  ERST
>  
>      {
> diff --git a/meson.build b/meson.build
> index 8df40bfac4..fd550c01ec 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1112,13 +1112,16 @@ if gtkx11.found()
>    x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
>                     kwargs: static_kwargs)
>  endif
> -vnc = not_found
>  png = not_found
> +png = dependency('libpng', required: get_option('png'),
> +                   method: 'pkg-config', kwargs: static_kwargs)
> +vnc = not_found
> +vnc_png = not_found
>  jpeg = not_found
>  sasl = not_found
>  if get_option('vnc').allowed() and have_system
>    vnc = declare_dependency() # dummy dependency
> -  png = dependency('libpng', required: get_option('vnc_png'),
> +  vnc_png = dependency('libpng', required: get_option('vnc_png'),
>                     method: 'pkg-config', kwargs: static_kwargs)
>    jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
>                      method: 'pkg-config', kwargs: static_kwargs)
> @@ -1537,9 +1540,10 @@ config_host_data.set('CONFIG_TPM', have_tpm)
>  config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
>  config_host_data.set('CONFIG_VDE', vde.found())
>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
> +config_host_data.set('CONFIG_PNG', png.found())
>  config_host_data.set('CONFIG_VNC', vnc.found())
>  config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
> -config_host_data.set('CONFIG_VNC_PNG', png.found())
> +config_host_data.set('CONFIG_VNC_PNG', vnc_png.found())


I think we should be removing  CONFIG_VNC_PNG entirely - the VNC
code should just use  CONFIG_PNG.

I'd suggest splitting ths into two patches.  The first patch
updates meson.build to look for libpng unconditionally and
rename to CONFIG_PNG.  The second patch introduces the PNG
support for screendump.

>  config_host_data.set('CONFIG_VNC_SASL', sasl.found())
>  config_host_data.set('CONFIG_VIRTFS', have_virtfs)
>  config_host_data.set('CONFIG_VTE', vte.found())
> @@ -3579,11 +3583,12 @@ summary_info += {'curses support':    curses}
>  summary_info += {'virgl support':     virgl}
>  summary_info += {'curl support':      curl}
>  summary_info += {'Multipath support': mpathpersist}
> +summary_info += {'PNG support':       png}
>  summary_info += {'VNC support':       vnc}
>  if vnc.found()
>    summary_info += {'VNC SASL support':  sasl}
>    summary_info += {'VNC JPEG support':  jpeg}
> -  summary_info += {'VNC PNG support':   png}
> +  summary_info += {'VNC PNG support':   vnc_png}
>  endif
>  if targetos not in ['darwin', 'haiku', 'windows']
>    summary_info += {'OSS support':     oss}
> diff --git a/meson_options.txt b/meson_options.txt
> index 52b11cead4..88148dec6c 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -177,6 +177,8 @@ option('vde', type : 'feature', value : 'auto',
>         description: 'vde network backend support')
>  option('virglrenderer', type : 'feature', value : 'auto',
>         description: 'virgl rendering support')
> +option('png', type : 'feature', value : 'auto',
> +       description: 'PNG support with libpng')
>  option('vnc', type : 'feature', value : 'auto',
>         description: 'VNC server')
>  option('vnc_jpeg', type : 'feature', value : 'auto',


> diff --git a/qapi/ui.json b/qapi/ui.json
> index 9354f4c467..8caeb2d3bb 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -73,12 +73,27 @@
>  ##
>  { 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
>  
> +##
> +# @ImageFormat:
> +#
> +# Available list of supported types.
> +#
> +# @png: PNG format
> +#
> +# @ppm: PPM format
> +#
> +# Since: 6.3
> +#
> +##
> +{ 'enum': 'ImageFormat',
> +  'data': ['ppm', 'png'] }
> +
>  ##
>  # @screendump:
>  #
> -# Write a PPM of the VGA screen to a file.
> +# Write a screenshot of the VGA screen to a file.
>  #
> -# @filename: the path of a new PPM file to store the image
> +# @filename: the path of a new file to store the image
>  #
>  # @device: ID of the display device that should be dumped. If this parameter
>  #          is missing, the primary display will be used. (Since 2.12)
> @@ -87,6 +102,9 @@
>  #        parameter is missing, head #0 will be used. Also note that the head
>  #        can only be specified in conjunction with the device ID. (Since 2.12)
>  #
> +# @format: image format for screendump is specified. Currently only PNG and
> +#             PPM are supported.

Mention that PPM is the default if omitted.

> diff --git a/ui/console.c b/ui/console.c
> index 40eebb6d2c..911092c908 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -37,6 +37,9 @@
>  #include "exec/memory.h"
>  #include "io/channel-file.h"
>  #include "qom/object.h"
> +#ifdef CONFIG_PNG
> +#include "png.h"

System headers should use  <...> for includes

> +#endif

> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
> +{
> +    int width = pixman_image_get_width(image);
> +    int height = pixman_image_get_height(image);
> +    png_structp png_ptr;
> +    png_infop info_ptr;
> +    g_autoptr(pixman_image_t) linebuf =
> +                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
> +    uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
> +    FILE *f = fdopen(fd, "wb");
> +    int y;
> +    if (!f) {
> +        error_setg(errp, "Failed to create file from file descriptor");
> +        return false;
> +    }

This leaks 'f', as do following error paths.

> +
> +    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
> +                                           NULL, NULL);
> +    if (!png_ptr) {
> +        error_setg(errp, "PNG creation failed. Unable to write struct");
> +        return false;
> +    }
> +
> +    info_ptr = png_create_info_struct(png_ptr);
> +
> +    if (!info_ptr) {
> +        error_setg(errp, "PNG creation failed. Unable to write info");
> +        return false;

This leaks 'png_ptr' too

> +    }
> +
> +    png_init_io(png_ptr, f);
> +
> +    png_set_IHDR(png_ptr, info_ptr, width, height, 8,
> +                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
> +                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
> +
> +    png_write_info(png_ptr, info_ptr);
> +
> +    for (y = 0; y < height; ++y) {
> +        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
> +        png_write_row(png_ptr, buf);
> +    }
> +    qemu_pixman_image_unref(linebuf);
> +
> +    png_write_end(png_ptr, NULL);
> +
> +    png_destroy_write_struct(&png_ptr, &info_ptr);
> +
> +    if (fclose(f) != 0) {
> +        error_setg(errp, "PNG creation failed. Unable to close file");
> +        return false;
> +    }
> +
> +    return true;
> +}

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


