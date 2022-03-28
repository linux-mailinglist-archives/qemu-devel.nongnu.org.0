Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271AC4E9206
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 11:54:11 +0200 (CEST)
Received: from localhost ([::1]:34642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYm4f-0000zt-Rx
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 05:54:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nYm3S-00007w-DA
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:52:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nYm3O-0004cy-Sz
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648461169;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5vGH+bBepiNiFpMmj3vkr4Ik8dW+NohGGojtacPy/g4=;
 b=Dz/olK+ZpLLhjd2zbEVMUsiW9AO7mbOMwXXNXvhDyt/9HVxXFGTltPIchF7ZxciKymxTeN
 ImM8NzdfPAftOz7yNowHjkIUQT6YUQE2dRyXO1tQu61hLSs1lSvEgfTpbaRla9DZBQ/Dql
 SF21iO7DIgFOkXrTx0I2o9NvRasZn08=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-R4nYPeeVPEeIPshf-U_9Zw-1; Mon, 28 Mar 2022 05:52:35 -0400
X-MC-Unique: R4nYPeeVPEeIPshf-U_9Zw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75742800882;
 Mon, 28 Mar 2022 09:52:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 627DC202660D;
 Mon, 28 Mar 2022 09:52:27 +0000 (UTC)
Date: Mon, 28 Mar 2022 10:52:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with
 screendump as PNG
Message-ID: <YkGFWVo0jk/v68xo@redhat.com>
References: <20220322104953.27731-1-kshitij.suri@nutanix.com>
 <20220322104953.27731-2-kshitij.suri@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220322104953.27731-2-kshitij.suri@nutanix.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
 armbru@redhat.com, qemu-devel@nongnu.org, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 22, 2022 at 10:49:53AM +0000, Kshitij Suri wrote:
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
>  monitor/hmp-cmds.c |  12 +++++-
>  qapi/ui.json       |  24 +++++++++--
>  ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
>  4 files changed, 136 insertions(+), 12 deletions(-)


> diff --git a/qapi/ui.json b/qapi/ui.json
> index 664da9e462..e8060d6b3c 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -157,12 +157,27 @@
>  ##
>  { 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
>  
> +##
> +# @ImageFormat:
> +#
> +# Supported image format types.
> +#
> +# @png: PNG format
> +#
> +# @ppm: PPM format
> +#
> +# Since: 7.0

This will probably end up being 7.1 at this point.

> +#
> +##
> +{ 'enum': 'ImageFormat',
> +  'data': ['ppm', 'png'] }
> +
>  ##
>  # @screendump:
>  #
> -# Write a PPM of the VGA screen to a file.
> +# Capture the contents of a screen and write it to a file.
>  #
> -# @filename: the path of a new PPM file to store the image
> +# @filename: the path of a new file to store the image
>  #
>  # @device: ID of the display device that should be dumped. If this parameter
>  #          is missing, the primary display will be used. (Since 2.12)
> @@ -171,6 +186,8 @@
>  #        parameter is missing, head #0 will be used. Also note that the head
>  #        can only be specified in conjunction with the device ID. (Since 2.12)
>  #
> +# @format: image format for screendump is specified. (default: ppm) (Since 7.0)

Likewise probably 7.1


None the less,

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


