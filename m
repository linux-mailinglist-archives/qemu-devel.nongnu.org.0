Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E134C4E52
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 20:09:39 +0100 (CET)
Received: from localhost ([::1]:50046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNfyD-0000Ao-NF
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 14:09:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nNfx7-0007xU-BO
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 14:08:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nNfx4-00009S-4r
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 14:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645816104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NTx6hEqash7INEOc8t0EDWiFJwNm3WUGl0WJMSEzxOQ=;
 b=ZkdqSgYXnRol6Arw+/kmgodibztbIb0jZls6VTD0V/o8fgcHWtkyd47fxmqTtYscsdtvPz
 sWXEvj5+voyL4cmR7hCn0YDTtCF9Nd6/hC14M57pH9HArrt5skwIkQqEQIsUpVKQAX5W1D
 W4j8KUcg2iB+mzGgBQIdR33BWaZdKBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-b9BrqfqHM72QyUDdbVZRPQ-1; Fri, 25 Feb 2022 14:08:22 -0500
X-MC-Unique: b9BrqfqHM72QyUDdbVZRPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8D4E801DDB;
 Fri, 25 Feb 2022 19:08:21 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0F048428B;
 Fri, 25 Feb 2022 19:07:50 +0000 (UTC)
Date: Fri, 25 Feb 2022 13:07:48 -0600
From: Eric Blake <eblake@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH 2/2] Added parameter to take screenshot with screendump
 as PNG
Message-ID: <20220225190748.uqcdoutdbwwksous@redhat.com>
References: <20220225115830.177899-1-kshitij.suri@nutanix.com>
 <20220225115830.177899-2-kshitij.suri@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220225115830.177899-2-kshitij.suri@nutanix.com>
User-Agent: NeoMutt/20211029-364-42e4ad
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 armbru@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 11:58:30AM +0000, Kshitij Suri wrote:
> Currently screendump only supports PPM format, which is un-compressed and not
> standard. Added a "format" parameter to qemu monitor screendump capabilites
> to support PNG image capture using libpng. The param was added in QAPI schema
> of screendump present in ui.json along with png_save() function which converts
> pixman_image to PNG. HMP command equivalent was also modified to support the
> feature.
> 
> Example usage:
> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
> "format":"png" } }
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718
> 
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> ---

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

Maybe:

as an image *filename*, with default format of PPM.

>  ERST
>  
>      {
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 8c384dc1b2..c300545f34 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1677,9 +1677,15 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>      const char *filename = qdict_get_str(qdict, "filename");
>      const char *id = qdict_get_try_str(qdict, "device");
>      int64_t head = qdict_get_try_int(qdict, "head", 0);
> +    const char *input_format  = qdict_get_str(qdict, "format");
>      Error *err = NULL;
> +    ImageFormat format = IMAGE_FORMAT_PPM;
> +    if (input_format != NULL && strcmp(input_format, "png") == 0) {
> +        format = IMAGE_FORMAT_PNG;
> +    }

Instead of open-coding the string-to-enum translation (which will be
hard to located if we expand to a third format down the road), you
should use qapi_enum_parse(&ImageFormat_lookup, ...).

> +++ b/ui/console.c
> @@ -37,6 +37,9 @@
>  #include "exec/memory.h"
>  #include "io/channel-file.h"
>  #include "qom/object.h"
> +#ifdef CONFIG_PNG
> +#include <png.h>
> +#endif
>  
>  #define DEFAULT_BACKSCROLL 512
>  #define CONSOLE_CURSOR_PERIOD 500
> @@ -289,6 +292,87 @@ void graphic_hw_invalidate(QemuConsole *con)
>      }
>  }
>  
> +#ifdef CONFIG_PNG
> +/**
> + * png_save: Take a screenshot as PNG
> + *
> + * Saves screendump as a PNG file
> + *
> + * Returns true for success or false for error.
> + *
> + * @fd: File descriptor for PNG file.
> + * @image: Image data in pixman format.
> + * @errp: Pointer to an error.
> + */
> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
> +{
> +    int width = pixman_image_get_width(image);
> +    int height = pixman_image_get_height(image);
> +    g_autofree png_struct *png_ptr = NULL;
> +    g_autofree png_info *info_ptr = NULL;
> +    g_autoptr(pixman_image_t) linebuf =
> +                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
> +    uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
> +    FILE *f = fdopen(fd, "wb");
> +    int y;
> +    if (!f) {
> +        error_setg(errp, "Failed to create file from file descriptor");

error_setg_errno() might be nicer to use here, since fdopen() failure sets errno.

> +        return false;
> +    }
> +
> +    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
> +                                           NULL, NULL);

Indentation looks off.

> +    if (!png_ptr) {
> +        error_setg(errp, "PNG creation failed. Unable to write struct");
> +        free(f);

free() is the wrong function to call on FILE*.  You meant fclose().

> +        return false;
> +    }
> +
> +    info_ptr = png_create_info_struct(png_ptr);
> +
> +    if (!info_ptr) {
> +        error_setg(errp, "PNG creation failed. Unable to write info");
> +        free(f);

and again

> +        png_destroy_write_struct(&png_ptr, &info_ptr);
> +        return false;
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

Another spot for error_setg_errno

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


