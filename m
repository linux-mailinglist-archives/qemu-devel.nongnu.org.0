Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284F04C30EF
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 17:07:12 +0100 (CET)
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGe6-0001lR-Q6
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 11:07:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nNGaU-00010F-V8
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:03:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nNGaN-0003AO-46
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645718597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TESTGZ9k+3gzgL2e9khsAassiPcsyRrbXm59eKejbdU=;
 b=G7CQv48JYHEc9I6KhumagyihrYJMgBn7yWY21kTrwhQZI+ygLHmbou4YvmAvW5C0pakCZW
 pX3Y+coygcZbmlLRaxLO3eaajgFsdn1z/FYGVqlbT3gdK6PtTz65mbHjNHQQBuqCyZ8+dS
 hDw+TZokXQ2P/oE7gX+WKQSzoO6BzIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-8gjpbV9uN7Oea0QN5PHk9Q-1; Thu, 24 Feb 2022 11:02:48 -0500
X-MC-Unique: 8gjpbV9uN7Oea0QN5PHk9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1B9E801AAD;
 Thu, 24 Feb 2022 16:02:42 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59CFF866C0;
 Thu, 24 Feb 2022 16:02:30 +0000 (UTC)
Date: Thu, 24 Feb 2022 10:02:28 -0600
From: Eric Blake <eblake@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v2] Added parameter to take screenshot with screendump as
 PNG
Message-ID: <20220224160228.qpeh6vd2257gqfku@redhat.com>
References: <20220224115908.102285-1-kshitij.suri@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220224115908.102285-1-kshitij.suri@nutanix.com>
User-Agent: NeoMutt/20211029-364-42e4ad
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The next release is 7.0, not 6.3.

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

The second sentence is no longer necessary, as the documentation for
the enum type covers that information now.  Missing a '(since 7.0)' tag.

> +#
>  # Returns: Nothing on success
>  #
>  # Since: 0.14
> @@ -99,7 +117,7 @@
>  #
>  ##
>  { 'command': 'screendump',
> -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
> +  'data': {'filename': 'str', '*device': 'str', '*head': 'int', '*format': 'ImageFormat'},

Please wrap the long line.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


