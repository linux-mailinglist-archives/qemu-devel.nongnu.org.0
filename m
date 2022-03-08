Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223824D2489
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 23:58:53 +0100 (CET)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRin5-0000gt-Qp
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 17:58:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nRikw-0007ES-UW
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 17:56:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nRikt-0007J0-Hh
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 17:56:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646780194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5BCJMaktOzou0zldpiMIO84etbqVn161CRJP7MdyMS8=;
 b=YSxKft86SRgg496XAeUn2kGOsigGVOe+whgu47Tf16aWkuOV2Ji89PavoMasSRbmV7oBTd
 QEdF7LbPgv/Nn+N6h1ZuWAnSbX+dFOfMM2F7kwQY7C5K9AQrl0TJL2dCmhUmorFBZKdael
 cCQ5c3BTHx0nEWf8QUoWrkXi7xaOVeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-PeQNZB1jMQus48vZp6UL7g-1; Tue, 08 Mar 2022 17:56:29 -0500
X-MC-Unique: PeQNZB1jMQus48vZp6UL7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95CC75200;
 Tue,  8 Mar 2022 22:56:28 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE30B70A04;
 Tue,  8 Mar 2022 22:56:26 +0000 (UTC)
Date: Tue, 8 Mar 2022 16:56:24 -0600
From: Eric Blake <eblake@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 04/11] edk2: .git can be a file
Message-ID: <20220308225624.e2pug7rinf7tifn4@redhat.com>
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-5-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220308145521.3106395-5-kraxel@redhat.com>
User-Agent: NeoMutt/20211029-410-d8ee8c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 03:55:14PM +0100, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  roms/Makefile.edk2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/roms/Makefile.edk2 b/roms/Makefile.edk2
> index 3d75a842a4df..a669019fe5b2 100644
> --- a/roms/Makefile.edk2
> +++ b/roms/Makefile.edk2
> @@ -51,7 +51,7 @@ all: $(foreach flashdev,$(flashdevs),../pc-bios/edk2-$(flashdev).fd.bz2) \
>  # we're building from a tarball and that they've already been fetched by
>  # make-release/tarball scripts.
>  submodules:
> -	if test -d edk2/.git; then \
> +	if test -d edk2/.git -o -f edk2/.git; then \

'test ... -o ...' is not portable.  Either write this as:

if test -d edk2/.git || test -f edk2/.git; then \

or go with the shorter:

if test -e edk2/.git; then \

>  		cd edk2 && git submodule update --init --force -- \
>  			ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3 \
>  			BaseTools/Source/C/BrotliCompress/brotli \
> -- 
> 2.35.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


