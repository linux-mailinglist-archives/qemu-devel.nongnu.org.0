Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7AD132459
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 11:59:45 +0100 (CET)
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iomaN-0006si-8a
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 05:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59974)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iomUN-0000O7-R1
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 05:53:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iomUM-0006Zv-Fp
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 05:53:31 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59979
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iomUM-0006Zc-Bi
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 05:53:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578394409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=vV1GLUhM7JgDjh0KEj8y2DRizEteVUZki1TyS3d7B/Q=;
 b=Uiiln+5hoSRBVdJy8gb2BdJHE1U0R9HkVvxqaZydvFTTTkIu+c/4GicHB7yOODaDRWrwOQ
 RscrP5nNqenI+NdaSVfNWeXtb4ydVZVJ5Xv49o4z4Yq+GCJld34e8p/ScoAektm8jc9zBV
 yrRpuPFEo9ioO3lkCarHIHUAQwzi6/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-J3HDwmELMlidwnrFTmwifg-1; Tue, 07 Jan 2020 05:53:24 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF0EB64A7E;
 Tue,  7 Jan 2020 10:53:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-116.ams2.redhat.com [10.36.116.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AF345D9D6;
 Tue,  7 Jan 2020 10:53:19 +0000 (UTC)
Subject: Re: [PATCH v3] docs: build an index page for the HTML docs
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20191219135620.1626608-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <a9011505-79cd-27e0-d8f6-eb4d14b7669b@redhat.com>
Date: Tue, 7 Jan 2020 11:53:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191219135620.1626608-1-stefanha@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: J3HDwmELMlidwnrFTmwifg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/12/2019 14.56, Stefan Hajnoczi wrote:
> There is no index.html start page for the QEMU HTML documentation.  An
> index page is needed so that documentation can be browsed easily on the
> web.
> 
> This patch adds an index.html.in template file where the QEMU version
> number is expanded.  It is written in HTML instead of using the existing
> sphinx (rST) and texi documentation generators because they are
> heavyweight and would make this harder.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v3:
>  * Add <html lang="en"> attribute to satisfy the W3 Validator [Thomas Huth]
> ---
>  Makefile           |  6 ++++++
>  docs/index.html.in | 17 +++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 docs/index.html.in
> 
> diff --git a/Makefile b/Makefile
> index 1361def144..9da9cfda73 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -347,6 +347,7 @@ DOCS+=docs/interop/qemu-qmp-ref.html docs/interop/qemu-qmp-ref.txt docs/interop/
>  DOCS+=docs/interop/qemu-ga-ref.html docs/interop/qemu-ga-ref.txt docs/interop/qemu-ga-ref.7
>  DOCS+=docs/qemu-block-drivers.7
>  DOCS+=docs/qemu-cpu-models.7
> +DOCS+=$(MANUAL_BUILDDIR)/index.html
>  ifdef CONFIG_VIRTFS
>  DOCS+=fsdev/virtfs-proxy-helper.1
>  endif
> @@ -819,6 +820,7 @@ install-sphinxdocs: sphinxdocs
>  
>  install-doc: $(DOCS) install-sphinxdocs
>  	$(INSTALL_DIR) "$(DESTDIR)$(qemu_docdir)"
> +	$(INSTALL_DATA) $(MANUAL_BUILDDIR)/index.html "$(DESTDIR)$(qemu_docdir)"
>  	$(INSTALL_DATA) qemu-doc.html "$(DESTDIR)$(qemu_docdir)"
>  	$(INSTALL_DATA) qemu-doc.txt "$(DESTDIR)$(qemu_docdir)"
>  	$(INSTALL_DATA) docs/interop/qemu-qmp-ref.html "$(DESTDIR)$(qemu_docdir)"
> @@ -1025,6 +1027,10 @@ $(MANUAL_BUILDDIR)/specs/index.html: $(call manual-deps,specs)
>  $(MANUAL_BUILDDIR)/interop/qemu-ga.8: $(call manual-deps,interop)
>  	$(call build-manual,interop,man)
>  
> +$(MANUAL_BUILDDIR)/index.html: $(SRC_PATH)/docs/index.html.in qemu-version.h
> +	$(call quiet-command, sed "s|@@VERSION@@|${VERSION}|g" $< >$@, \
> +             "GEN","$@")
> +
>  qemu-options.texi: $(SRC_PATH)/qemu-options.hx $(SRC_PATH)/scripts/hxtool
>  	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -t < $< > $@,"GEN","$@")
>  
> diff --git a/docs/index.html.in b/docs/index.html.in
> new file mode 100644
> index 0000000000..94eb782cf7
> --- /dev/null
> +++ b/docs/index.html.in
> @@ -0,0 +1,17 @@
> +<!DOCTYPE html>
> +<html lang="en">
> +    <head>
> +        <meta charset="UTF-8">
> +        <title>QEMU @@VERSION@@ Documentation</title>
> +    </head>
> +    <body>
> +        <h1>QEMU @@VERSION@@ Documentation</h1>
> +        <ul>
> +            <li><a href="qemu-doc.html">User Documentation</a></li>
> +            <li><a href="qemu-qmp-ref.html">QMP Reference Manual</a></li>
> +            <li><a href="qemu-ga-ref.html">Guest Agent Protocol Reference</a></li>
> +            <li><a href="interop/index.html">System Emulation Management and Interoperability Guide</a></li>
> +            <li><a href="specs/index.html">System Emulation Guest Hardware Specifications</a></li>
> +        </ul>
> +    </body>
> +</html>
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


