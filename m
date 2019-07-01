Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1D85B97E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 12:53:31 +0200 (CEST)
Received: from localhost ([::1]:57068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhtw9-0001Dz-Ih
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 06:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38218)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hhtur-0000ki-0L
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 06:52:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hhtuq-00060p-1M
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 06:52:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56182)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hhtup-0005Do-Qg; Mon, 01 Jul 2019 06:52:07 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6FE205AFE3;
 Mon,  1 Jul 2019 10:51:38 +0000 (UTC)
Received: from gondolin (ovpn-117-220.ams2.redhat.com [10.36.117.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75A3077DC0;
 Mon,  1 Jul 2019 10:51:35 +0000 (UTC)
Date: Mon, 1 Jul 2019 12:51:30 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>
Message-ID: <20190701125130.08a9bf19.cohuck@redhat.com>
In-Reply-To: <20190626130820.12290-1-cohuck@redhat.com>
References: <20190626130820.12290-1-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 01 Jul 2019 10:51:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] s390x: add cpu feature/model files to KVM
 section
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Jun 2019 15:08:20 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> The cpu features/models are not only relevant for TCG, but
> also for KVM. Make sure that the KVM maintainers are cc:ed
> on patches as well.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cad58b948791..d9b6c129076a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -383,6 +383,8 @@ F: target/s390x/kvm-stub.c
>  F: target/s390x/ioinst.[ch]
>  F: target/s390x/machine.c
>  F: target/s390x/sigp.c
> +F: target/s390x/cpu_features*.[ch]
> +F: target/s390x/cpu_models.[ch]
>  F: hw/intc/s390_flic.c
>  F: hw/intc/s390_flic_kvm.c
>  F: include/hw/s390x/s390_flic.h

Queued to s390-next.

