Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BA9341FE3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:43:21 +0100 (CET)
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGLQ-00082R-6m
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNGIp-0006C5-62
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:40:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNGIj-0005Ey-0L
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616164831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9jk+kLf6hD3TWo90+wa+IYe212Ar4ontVVrLvdMFcI=;
 b=Wjw3V6cQGO5aAOlH0IPr1Q87KSIvzToo+F/3jivdNeQDQNQmNgnNtBvbq8kTTuch1rFQvA
 rI7/evrOVM5Br+j7cuzuiLiIX6H5zODubwynVWGUtH0k5DzFPv1y090btPX5rMjsY3/2A0
 4JGTlOzUhHrCJ3KrQIskS62IzDsssis=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-n04RJ2LqNouE9S2IC27paQ-1; Fri, 19 Mar 2021 10:40:27 -0400
X-MC-Unique: n04RJ2LqNouE9S2IC27paQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CEE69CC02;
 Fri, 19 Mar 2021 14:40:26 +0000 (UTC)
Received: from gondolin (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D5C95C1BB;
 Fri, 19 Mar 2021 14:40:19 +0000 (UTC)
Date: Fri, 19 Mar 2021 15:40:17 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 1/6] qdev: define list of archs with virtio-pci or
 virtio-ccw
Message-ID: <20210319154017.28b1510f.cohuck@redhat.com>
In-Reply-To: <20210319132537.2046339-2-laurent@vivier.eu>
References: <20210319132537.2046339-1-laurent@vivier.eu>
 <20210319132537.2046339-2-laurent@vivier.eu>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
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
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Mar 2021 14:25:32 +0100
Laurent Vivier <laurent@vivier.eu> wrote:

> This is used to define virtio-*-pci and virtio-*-ccw aliases
> rather than substracting the CCW architecture from all the others.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  include/sysemu/arch_init.h |  7 +++++
>  softmmu/qdev-monitor.c     | 53 ++++++++++++++++++--------------------
>  2 files changed, 32 insertions(+), 28 deletions(-)
> 
> diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
> index 54f069d49126..7217a822a14b 100644
> --- a/include/sysemu/arch_init.h
> +++ b/include/sysemu/arch_init.h
> @@ -35,4 +35,11 @@ extern const uint32_t arch_type;
>  int kvm_available(void);
>  int xen_available(void);
>  

Maybe add a comment

/* default virtio transport per architecture */

> +#define QEMU_ARCH_VIRTIO_PCI (QEMU_ARCH_ALPHA | QEMU_ARCH_ARM | \
> +                              QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
> +                              QEMU_ARCH_MIPS | QEMU_ARCH_PPC |  \
> +                              QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
> +                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
> +#define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
> +
>  #endif

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


