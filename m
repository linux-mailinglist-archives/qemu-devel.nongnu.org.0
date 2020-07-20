Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B69226262
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 16:44:21 +0200 (CEST)
Received: from localhost ([::1]:58576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxX1g-0005PF-Pi
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 10:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jxX0r-0004ZI-9W
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 10:43:29 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35679
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jxX0o-0006m2-Mi
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 10:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595256205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TVoeMQzIjpE407rvpxT8jTStQOn8DVipQosehYA01Rg=;
 b=D6Ns14l/H9gblTaWkSLA9boLHAPO0oXKvUSU/i7Xx8zBFPlL+7vazlBFXPVzTJ1Scr7gvD
 XSQT0ZBO9MmVSswdL9iz23MuBLKWjUt2D1NEBKG4rj0PQ99HWBN989StiSVSmXD+ZxZxan
 4ssIPVh5ysUQD9988d9BDo8hSoH2sXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-xHR6dojWO32ev8XIy-889Q-1; Mon, 20 Jul 2020 10:43:20 -0400
X-MC-Unique: xHR6dojWO32ev8XIy-889Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23543800688
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 14:43:19 +0000 (UTC)
Received: from turbo.dinechin.lan (ovpn-114-55.ams2.redhat.com [10.36.114.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A07A60E1C;
 Mon, 20 Jul 2020 14:43:11 +0000 (UTC)
References: <20200624131045.14512-1-kraxel@redhat.com>
 <20200624131045.14512-7-kraxel@redhat.com>
User-agent: mu4e 1.5.5; emacs 26.3
From: Christophe de Dinechin <dinechin@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v5 06/10] usb: build usb-redir as module
In-reply-to: <20200624131045.14512-7-kraxel@redhat.com>
Date: Mon, 20 Jul 2020 16:43:07 +0200
Message-ID: <7hsgdmqmbo.fsf@turbo.dinechin.lan>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/19 21:45:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020-06-24 at 15:10 CEST, Gerd Hoffmann wrote...
> Drops libusbredirparser.so dependency from core qemu.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  util/module.c        | 1 +
>  hw/usb/Makefile.objs | 9 ++++++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/util/module.c b/util/module.c
> index 89da9a3cce05..e3226165e91c 100644
> --- a/util/module.c
> +++ b/util/module.c
> @@ -263,6 +263,7 @@ static struct {
>  } const qom_modules[] = {
>      { "ccid-card-passthru",    "hw-", "usb-smartcard"         },
>      { "ccid-card-emulated",    "hw-", "usb-smartcard"         },
> +    { "usb-redir",             "hw-", "usb-redirect"          },
>  };
>
>  static bool module_loaded_qom_all;
> diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
> index 3c5b3d4fadd3..e342ff59fab0 100644
> --- a/hw/usb/Makefile.objs
> +++ b/hw/usb/Makefile.objs
> @@ -43,9 +43,12 @@ endif
>
>  # usb redirection
>  ifeq ($(CONFIG_USB),y)
> -common-obj-$(CONFIG_USB_REDIR) += redirect.o quirks.o
> -redirect.o-cflags = $(USB_REDIR_CFLAGS)
> -redirect.o-libs = $(USB_REDIR_LIBS)
> +ifeq ($(CONFIG_USB_REDIR),y)
> +common-obj-m += redirect.mo
> +redirect.mo-objs = redirect.o quirks.o
> +redirect.mo-cflags = $(USB_REDIR_CFLAGS)
> +redirect.mo-libs = $(USB_REDIR_LIBS)
> +endif
>  endif
>
>  # usb pass-through

With the same questions as for earlier patches

Reviewed-by: Christophe de Dinechin <dinechin@redhat.com>


--
Cheers,
Christophe de Dinechin (IRC c3d)


