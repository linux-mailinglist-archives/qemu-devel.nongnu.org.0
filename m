Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C288A4C112D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 12:22:41 +0100 (CET)
Received: from localhost ([::1]:49384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMpjE-0001K8-TY
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 06:22:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMphS-0000Wx-H5
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:20:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMphP-0000Zz-Bc
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:20:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645615246;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=n8CX4F7qEY7/QOEsB4zyqz2QaPebzt7pF5+zeQzBGLQ=;
 b=DQ7PBybJwOx3q7PoYnbU2cFV66CYIVHripYf8kMZdtm7l+MU9EbILboaqhbfhrpwKV4ylB
 DqsGdRYSMZvtCUrh8u43MNIBmjNOoNULWYufmrHr0Z+QK8/Dm3CvyUPcvh7TQhuIpNmLCt
 sJyXyEIUUKPib6pa1oxIZ7Y46yQGCXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-F4mbApxYN5uEBZSjYyZUHQ-1; Wed, 23 Feb 2022 06:20:45 -0500
X-MC-Unique: F4mbApxYN5uEBZSjYyZUHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 774A81006AA6;
 Wed, 23 Feb 2022 11:20:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF0941053B31;
 Wed, 23 Feb 2022 11:20:41 +0000 (UTC)
Date: Wed, 23 Feb 2022 11:20:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH] Added parameter to take screenshot with screendump as PNG
Message-ID: <YhYYho6m53uu9/yk@redhat.com>
References: <20220222152758.207415-1-kshitij.suri@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220222152758.207415-1-kshitij.suri@nutanix.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 armbru@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 03:27:58PM +0000, Kshitij Suri wrote:
> Currently screendump only supports PPM format, which is un-compressed and not
> standard. Added an "format" parameter to qemu monitor screendump capabilites
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
>  hmp-commands.hx    |  11 ++--
>  monitor/hmp-cmds.c |   4 +-
>  qapi/ui.json       |   7 ++-
>  ui/console.c       | 153 ++++++++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 165 insertions(+), 10 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 70a9136ac2..2163337f35 100644
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
> +                      "Default format for screendump is PPM.",
>          .cmd        = hmp_screendump,
>          .coroutine  = true,
>      },
>  
>  SRST
>  ``screendump`` *filename*
> -  Save screen into PPM image *filename*.
> +  Save screen as image *filename*.
>  ERST
>  
>      {
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 2669156b28..3fb1394561 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1665,9 +1665,11 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>      const char *filename = qdict_get_str(qdict, "filename");
>      const char *id = qdict_get_try_str(qdict, "device");
>      int64_t head = qdict_get_try_int(qdict, "head", 0);
> +    const char *format  = qdict_get_str(qdict, "format");
>      Error *err = NULL;
>  
> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
> +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
> +                   format != NULL, format, &err);
>      hmp_handle_error(mon, err);
>  }
>  
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 9354f4c467..9fdb56b60b 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -76,7 +76,7 @@
>  ##
>  # @screendump:
>  #
> -# Write a PPM of the VGA screen to a file.
> +# Write a screenshot of the VGA screen to a file.
>  #
>  # @filename: the path of a new PPM file to store the image
>  #
> @@ -87,6 +87,9 @@
>  #        parameter is missing, head #0 will be used. Also note that the head
>  #        can only be specified in conjunction with the device ID. (Since 2.12)
>  #
> +# @format: image format for screendump is specified. Currently only PNG and
> +#             PPM are supported.
> +#
>  # Returns: Nothing on success
>  #
>  # Since: 0.14
> @@ -99,7 +102,7 @@
>  #
>  ##
>  { 'command': 'screendump',
> -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
> +  'data': {'filename': 'str', '*device': 'str', '*head': 'int', '*format': 'str'},
>    'coroutine': true }
>  
>  ##
> diff --git a/ui/console.c b/ui/console.c
> index 40eebb6d2c..7813b195ac 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -37,6 +37,9 @@
>  #include "exec/memory.h"
>  #include "io/channel-file.h"
>  #include "qom/object.h"
> +#ifdef CONFIG_VNC_PNG
> +#include "png.h"
> +#endif
>  
>  #define DEFAULT_BACKSCROLL 512
>  #define CONSOLE_CURSOR_PERIOD 500
> @@ -289,6 +292,137 @@ void graphic_hw_invalidate(QemuConsole *con)
>      }
>  }
>  
> +#ifdef CONFIG_VNC_PNG
> +/**
> + * a8r8g8b8_to_rgba: Convert a8r8g8b8 to rgba format
> + *
> + * @dst: Destination pointer.
> + * @src: Source pointer.
> + * @n_pixels: Size of image.
> + */
> +static void a8r8g8b8_to_rgba(uint32_t *dst, uint32_t *src, int n_pixels)
> +{
> +    uint8_t *dst8 = (uint8_t *)dst;
> +    int i;
> +
> +    for (i = 0; i < n_pixels; ++i) {
> +        uint32_t p = src[i];
> +        uint8_t a, r, g, b;
> +
> +        a = (p & 0xff000000) >> 24;
> +        r = (p & 0x00ff0000) >> 16;
> +        g = (p & 0x0000ff00) >> 8;
> +        b = (p & 0x000000ff) >> 0;
> +
> +        if (a != 0) {
> +            #define DIVIDE(c, a) \
> +            do { \
> +                int t = ((c) * 255) / a; \
> +                (c) = t < 0 ? 0 : t > 255 ? 255 : t; \
> +            } while (0)
> +
> +            DIVIDE(r, a);
> +            DIVIDE(g, a);
> +            DIVIDE(b, a);
> +            #undef DIVIDE
> +        }
> +
> +        *dst8++ = r;
> +        *dst8++ = g;
> +        *dst8++ = b;
> +        *dst8++ = a;
> +    }
> +}
> +
> +/**
> + * png_save: Take a screenshot as PNG
> + *
> + * Saves screendump as a PNG file
> + *
> + * Returns true for success or false for error.
> + * Inspired from png test utils from https://github.com/aseprite/pixman
> + *
> + * @fd: File descriptor for PNG file.
> + * @image: Image data in pixman format.
> + * @errp: Pointer to an error.
> + */
> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
> +{
> +    int width = pixman_image_get_width(image);
> +    int height = pixman_image_get_height(image);
> +    int stride = width * 4;
> +    g_autofree uint32_t *src_data = g_malloc(height * stride);
> +    g_autofree uint32_t *dest_data = g_malloc(height * stride);
> +    g_autoptr(pixman_image_t) src_copy;
> +    g_autoptr(pixman_image_t) dest_copy;
> +    g_autofree png_struct *write_struct;
> +    g_autofree png_info *info_struct;
> +    g_autofree png_bytep *row_pointers = g_malloc(height * sizeof(png_bytep));
> +    FILE *f = fdopen(fd, "wb");
> +    int y;
> +    if (!f) {
> +        error_setg(errp, "Failed to create file from file descriptor");
> +        return false;
> +    }
> +
> +    src_copy = pixman_image_create_bits(PIXMAN_a8r8g8b8, width, height,
> +                                        src_data, stride);
> +
> +    pixman_image_composite32(PIXMAN_OP_SRC, image, NULL, src_copy, 0, 0, 0, 0,
> +                             0, 0, width, height);
> +
> +    memcpy(dest_data, src_data, sizeof(*src_data));
> +
> +    a8r8g8b8_to_rgba(dest_data, src_data, height * width);

dest_data is not used after this point...

> +
> +    for (y = 0; y < height; ++y) {
> +        row_pointers[y] = (png_bytep)(src_data + y * width);

Here you are setting things up for libpng to write out 'src_data'.

So what was the point in the dest_data allocation & conversion ?

> +    }
> +
> +    write_struct = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
> +                                                 NULL, NULL);
> +    if (!write_struct) {
> +        error_setg(errp, "PNG creation failed. Unable to write struct");
> +        return false;
> +    }
> +
> +    info_struct = png_create_info_struct(write_struct);
> +
> +    if (!info_struct) {
> +        error_setg(errp, "PNG creation failed. Unable to write info");
> +        return false;
> +    }
> +
> +    png_init_io(write_struct, f);
> +
> +    png_set_IHDR(write_struct, info_struct, width, height, 8,
> +                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
> +                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
> +
> +    png_write_info(write_struct, info_struct);
> +
> +    png_write_image(write_struct, row_pointers);
> +
> +    png_write_end(write_struct, NULL);
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


