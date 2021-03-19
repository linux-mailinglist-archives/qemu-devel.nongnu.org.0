Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1481341B98
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:37:51 +0100 (CET)
Received: from localhost ([::1]:35082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDRv-0002Vl-2g
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNDQf-0001OG-Pk
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNDQd-0007nR-9c
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616153789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R1J9O2ZLQ8AtWtz8ZJofgSCMFUkh0boX/IE+FMHT0Kw=;
 b=hKH/XFy4xWrCh1GkNHI9fT/gJNW1uJ/pmmpMK/K9892r/xYuovci/IrCAkMwoKSyMwAkfr
 EKkhozS2fwmXD5VW3MB4uI4VpiEUpJ2Em7sQk33tu6zMsyZfh2lOUWOIDWogLJI0YDNyaN
 3ysKNwhQtQQjNlh/J1zRU40+Z7Pv1iE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-983PEfh6PFSehKlQIgfOJw-1; Fri, 19 Mar 2021 07:36:27 -0400
X-MC-Unique: 983PEfh6PFSehKlQIgfOJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 129811044BC8;
 Fri, 19 Mar 2021 11:36:26 +0000 (UTC)
Received: from gondolin (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CF515D9F2;
 Fri, 19 Mar 2021 11:36:23 +0000 (UTC)
Date: Fri, 19 Mar 2021 12:36:20 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 1/4] m68k: add the virtio devices aliases
Message-ID: <20210319123620.211ae2ea.cohuck@redhat.com>
In-Reply-To: <20210318223907.1344870-2-laurent@vivier.eu>
References: <20210318223907.1344870-1-laurent@vivier.eu>
 <20210318223907.1344870-2-laurent@vivier.eu>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGll?= =?UTF-8?B?dS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 23:39:04 +0100
Laurent Vivier <laurent@vivier.eu> wrote:

> Similarly to 5f629d943cb0 ("s390x: fix s390 virtio aliases"),
> define the virtio aliases.
> 
> This allows to start machines with virtio devices without
> knowledge of the implementation type.
> 
> For instance, we can use "-device virtio-scsi" on
> m68k, s390x or PC, and the device will be
> "virtio-scsi-device", "virtio-scsi-ccw" or "virtio-scsi-pci".
> 
> This already exists for s390x and -ccw interfaces, adds them
> for m68k and MMIO (-device) interfaces.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  softmmu/qdev-monitor.c | 46 +++++++++++++++++++++++++++---------------
>  1 file changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 8dc656becca9..262d38b8c01e 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -42,6 +42,8 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/clock.h"
>  
> +#define QEMU_ARCH_NO_PCI (QEMU_ARCH_S390X | QEMU_ARCH_M68K)

The name of the #define is a tad misleading (we do have virtio-pci
devices on s390x, unlike in 2012, we just don't want the aliases to
point to them.) Maybe QEMU_ARCH_NONPCI_DEFAULT?

> +
>  /*
>   * Aliases were a bad idea from the start.  Let's keep them
>   * from spreading further.

Otherwise, LGTM.


