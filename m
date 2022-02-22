Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5624BFF0E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:42:27 +0100 (CET)
Received: from localhost ([::1]:57380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYF7-0000X8-Us
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:42:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMY7m-00086K-FJ
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 11:34:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMY7i-0008Rf-HG
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 11:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645547682;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lR2k7bKdcXua5Q+iGZLzfX6bYaOXrnRIkvziVnVYivg=;
 b=W65OzzhSYP2B9JVuquhsydyIX4TaodHvKiP9P0Va/V90LCj2+wXzDMUHt+alUs3c4/WT7B
 hY/+Pve2cfq06bmf9qP2glfIGyZzzTZH+9UwFKT0/meacy7Vfpblr3+ku9BgM5HDUjx436
 ZUiAgs9emqTbbaUwHd4VnTXmnMVgsxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-m98AaQVkOKGczFFE2effrA-1; Tue, 22 Feb 2022 11:34:39 -0500
X-MC-Unique: m98AaQVkOKGczFFE2effrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8400F1006AA5;
 Tue, 22 Feb 2022 16:34:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65E727A55B;
 Tue, 22 Feb 2022 16:34:19 +0000 (UTC)
Date: Tue, 22 Feb 2022 16:34:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH] Added parameter to take screenshot with screendump as PNG
Message-ID: <YhUQg9gReZWiVhbS@redhat.com>
References: <20220222152758.207415-1-kshitij.suri@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220222152758.207415-1-kshitij.suri@nutanix.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

You're going to need to update configure here.

Currently libpng is only detected if VNC is enabled.

This proposed change means we need to detect libpng
any time the build of system emulators is enabled.

The CONFIG_VNC_PNG option will also need renaming
to CONFIG_PNG

> +        .args_type  = "filename:F,device:s?,head:i?,format:f?",
> +        .params     = "filename [device [head]] [format]",
> +        .help       = "save screen from head 'head' of display device 'device'"
> +                      "in specified format 'format' as image 'filename'."
> +                      "Default format for screendump is PPM.",

Mention what other formats are permitted, making it clear that
the format is in fact 'png' and 'ppm', not 'PPM'

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

This 'format' should not be a string, it needs to be an enum type.

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

Anything declared with 'g_auto*' must always be explicitly initialized
to NULL at time of declaration to avoid risk of gree'ing uninitialized
memory

> +    g_autofree png_bytep *row_pointers = g_malloc(height * sizeof(png_bytep));

g_new(png_bytep, height) 

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
> +
> +    for (y = 0; y < height; ++y) {
> +        row_pointers[y] = (png_bytep)(src_data + y * width);
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
> +
> +#else /* no png support */
> +
> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
> +{
> +    error_setg(errp, "Enable VNC PNG support for png screendump");
> +    return false;
> +}
> +
> +#endif /* CONFIG_VNC_PNG */
> +
>  static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
>  {
>      int width = pixman_image_get_width(image);
> @@ -327,7 +461,8 @@ static void graphic_hw_update_bh(void *con)
>  /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
>  void coroutine_fn
>  qmp_screendump(const char *filename, bool has_device, const char *device,
> -               bool has_head, int64_t head, Error **errp)
> +               bool has_head, int64_t head, bool has_format,
> +               const char *format, Error **errp)
>  {
>      g_autoptr(pixman_image_t) image = NULL;
>      QemuConsole *con;
> @@ -383,8 +518,22 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
>       * yields and releases the BQL. It could produce corrupted dump, but
>       * it should be otherwise safe.
>       */
> -    if (!ppm_save(fd, image, errp)) {
> +
> +    if (has_format && strcmp(format, "png") == 0) {
> +        /* PNG format specified for screendump */
> +        if (!png_save(fd, image, errp)) {
> +            qemu_unlink(filename);
> +        }
> +    } else if (!has_format || (has_format && strcmp(format, "ppm") == 0)) {
> +        /* PPM format specified/default for screendump */
> +        if (!ppm_save(fd, image, errp)) {
> +            qemu_unlink(filename);
> +        }
> +    } else {
> +        /* Invalid specified for screendump */
> +        error_setg(errp, "Invalid format provided for screendump.");
>          qemu_unlink(filename);
> +        return;
>      }
>  }
>  
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


