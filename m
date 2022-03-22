Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4374E3BEA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:49:59 +0100 (CET)
Received: from localhost ([::1]:54818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWb9K-0000lN-GA
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:49:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWb74-0006pg-9y
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:47:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWb72-00027I-Jh
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647942456;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WgabqUtLH4h4vlaV8qFAXdlN5VpaSz2HDcONZIsN9Zc=;
 b=WIFDe7Qr3MnN6JlGvCxRvSv9o928EvRGKkQhDjjAcjrQRukqy4eppjEKumhti8n/2JOXY4
 zwjky0A08fkQcysC7mw2Nrk/JI6nHSy9E32uVIJzfMMUt5Oo/PFqdegrOBfe+2DmO7pZSV
 zkHkpurRS/6iC/AkfqwCOj/wWx0HHtQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-zfZBsv0yMkK3XTj0frYCGQ-1; Tue, 22 Mar 2022 05:47:32 -0400
X-MC-Unique: zfZBsv0yMkK3XTj0frYCGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C3A18038E3;
 Tue, 22 Mar 2022 09:47:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 581651417201;
 Tue, 22 Mar 2022 09:47:30 +0000 (UTC)
Date: Tue, 22 Mar 2022 09:47:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with
 screendump as PNG
Message-ID: <YjmbL3E2CRqjFii1@redhat.com>
References: <20220322081845.19680-1-kshitij.suri@nutanix.com>
 <20220322081845.19680-2-kshitij.suri@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220322081845.19680-2-kshitij.suri@nutanix.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 armbru@redhat.com, qemu-devel@nongnu.org, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 22, 2022 at 08:18:45AM +0000, Kshitij Suri wrote:
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
> diff to v1:
>   - Removed repeated alpha conversion operation.
>   - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>   - Added a new CONFIG_PNG parameter for libpng support.
>   - Changed input format to enum instead of string.
>   - Improved error handling.
>  hmp-commands.hx    |  11 ++---
>  monitor/hmp-cmds.c |  20 ++++++++-
>  qapi/ui.json       |  24 +++++++++--
>  ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
>  4 files changed, 144 insertions(+), 12 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 8476277aa9..19b7cab595 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -244,11 +244,12 @@ ERST
>  
>      {
>          .name       = "screendump",
> -        .args_type  = "filename:F,device:s?,head:i?",
> -        .params     = "filename [device [head]]",
> -        .help       = "save screen from head 'head' of display device 'device' "
> -                      "into PPM image 'filename'",
> -        .cmd        = hmp_screendump,
> +        .args_type  = "filename:F,format:s?,device:s?,head:i?",
> +        .params     = "filename [format] [device [head]]",
> +        .help       = "save screen from head 'head' of display device 'device'"
> +                      "in specified format 'format' as image 'filename'."
> +                      "Currently only 'png' and 'ppm' formats are supported.",
> +         .cmd        = hmp_screendump,
>          .coroutine  = true,
>      },
>  
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 634968498b..bf3ba76bd3 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1720,9 +1720,27 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>      const char *filename = qdict_get_str(qdict, "filename");
>      const char *id = qdict_get_try_str(qdict, "device");
>      int64_t head = qdict_get_try_int(qdict, "head", 0);
> +    const char *input_format  = qdict_get_try_str(qdict, "format");
>      Error *err = NULL;
> +    ImageFormat format;
>  
> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
> +    int val = qapi_enum_parse(&ImageFormat_lookup, input_format,
> +                              IMAGE_FORMAT_PPM, &err);
> +    if (err) {
> +        goto end;
> +    }
> +
> +    switch (val) {
> +    case IMAGE_FORMAT_PNG:
> +        format = IMAGE_FORMAT_PNG;
> +        break;
> +    default:
> +        format = IMAGE_FORMAT_PPM;
> +    }

This switch looks pointless - the code is passing the default into
qapi_enum_parse already, this doesn't need to handle defaulting
again. This just needs

        format = qapi_enum_parse(&ImageFormat_lookup, input_format,
                                 IMAGE_FORMAT_PPM, &err);
        if (err) {
           goto end;
         }

> +
> +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
> +                   input_format != NULL, format, &err);
> +end:
>      hmp_handle_error(mon, err);
>  }
>  

> +    for (y = 0; y < height; ++y) {
> +        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
> +       png_write_row(png_ptr, buf);
> +    }

Tiny style bug, indent off-by-1


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


