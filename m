Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD8CAE895
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 12:46:01 +0200 (CEST)
Received: from localhost ([::1]:37784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7deq-0005VD-8J
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 06:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59805)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <amit@infradead.org>) id 1i7dP8-0006Yp-T9
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 06:29:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <amit@infradead.org>) id 1i7dP6-0005e7-Kv
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 06:29:46 -0400
Received: from bombadil.infradead.org ([2607:7c80:54:e::133]:36980)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <amit@infradead.org>) id 1i7dP6-0005US-5C
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 06:29:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Mime-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zTTU7HKbJaGzMRtsAZLZuaETIVA44xlVGhAtXyVmh7w=; b=Y+FjBQ9L1y5KcQ2xRTDYhuru6
 nmR4EBgGnNSaLSfzLZstBossWU50pT0wMVRkBNn40ZQhj+1u+m8Ii9sPZsp19pQ4dTBRTlJ2qctsu
 vg9ztGrW3VfVS/oJYamEDodR4cgNu+1d/qFYz3/g/qtXGMpQJ9zYoPNQ/qySewkRcJJmKTgJNMIqj
 9yS/RbwHKKIRFH46ekz9qan4sZS6O70eXoz4IIpHpsLVIhFW7Bet3op9tmJuATGJr+Hz3OgTNaWon
 cEUSWD5sDzsmMRaEeTGA9/d7QYXLd1DiaMuZsKBlwCJJzcCaM6YqpU/BqKoIai+5yT98Ab9M8X8GK
 TPzLKhNZQ==;
Received: from [54.239.6.185] (helo=u601e653ff81a58.ant.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i7dOw-0001oD-Im; Tue, 10 Sep 2019 10:29:34 +0000
Message-ID: <99084671fb9e5d3317897edf9c8bc32aa93a5038.camel@infradead.org>
From: Amit Shah <amit@infradead.org>
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 12:29:31 +0200
In-Reply-To: <20190909180549.18760-1-lvivier@redhat.com>
References: <20190909180549.18760-1-lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:7c80:54:e::133
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: update virtio-rng and
 virtio-serial maintainer
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2019-09-09 at 20:05 +0200, Laurent Vivier wrote:
> As discussed with Amit, I volunteer to maintain virtio-rng and
> virtio-serial
> previously maintained by Amit.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Acked-by: Amit Shah <amit@kernel.org>

> ---
>  MAINTAINERS | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50eaf005f40e..db916ade55cd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1554,7 +1554,8 @@ F: include/hw/virtio/virtio-input.h
>  F: contrib/vhost-user-input/*
>  
>  virtio-serial
> -M: Amit Shah <amit@kernel.org>
> +M: Laurent Vivier <lvivier@redhat.com>
> +R: Amit Shah <amit@kernel.org>
>  S: Supported
>  F: hw/char/virtio-serial-bus.c
>  F: hw/char/virtio-console.c
> @@ -1563,7 +1564,8 @@ F: tests/virtio-console-test.c
>  F: tests/virtio-serial-test.c
>  
>  virtio-rng
> -M: Amit Shah <amit@kernel.org>
> +M: Laurent Vivier <lvivier@redhat.com>
> +R: Amit Shah <amit@kernel.org>
>  S: Supported
>  F: hw/virtio/virtio-rng.c
>  F: include/hw/virtio/virtio-rng.h


