Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BE61075A8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 17:20:53 +0100 (CET)
Received: from localhost ([::1]:52728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iYBfw-0006Ea-B2
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 11:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iYBcw-0004xW-AR
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:17:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iYBcu-0000Nh-UI
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:17:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56132
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iYBcu-0000NJ-Qa
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:17:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574439463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vGw8jwblj0mJutAxe6bb/vvJuR3ehuwBf1Z1SdXJb8=;
 b=b0OYwu5bhIfDJMQENVbdC22VmGIjouT3n/LqCfbeNTxUFUCsOitzTCPu/AAdp0S1+Jlbxi
 jk/o45Iv9TXWvXMLhTSFcmsM2ch7doxvPHcc/59TM9JMlBnisdCruS+09eFtnb3w7GWMMf
 bpWvO0ryliUyaH9NvQE0O0dNRJ/tnXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-rLHFvWFMMP-1DDIgfIrrtQ-1; Fri, 22 Nov 2019 11:17:40 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CE561005509;
 Fri, 22 Nov 2019 16:17:39 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F38B63742;
 Fri, 22 Nov 2019 16:17:35 +0000 (UTC)
Date: Fri, 22 Nov 2019 17:17:33 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v2 1/5] s390x: Don't do a normal reset on the initial cpu
Message-ID: <20191122171733.3d60d767.cohuck@redhat.com>
In-Reply-To: <20191122140002.42972-2-frankja@linux.ibm.com>
References: <20191122140002.42972-1-frankja@linux.ibm.com>
 <20191122140002.42972-2-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: rLHFvWFMMP-1DDIgfIrrtQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Nov 2019 08:59:58 -0500
Janosch Frank <frankja@linux.ibm.com> wrote:

> The initiating cpu needs to be reset with an initial reset. While
> doing a normal reset followed by a initial reset is not wron per-se,

s/wron per-se/wrong per se/

> the Ultravisor will only allow the correct reset to be performed.

So... the uv has stricter rules than the architecture has in that
respect?

> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/s390x/s390-virtio-ccw.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index d3edeef0ad..c1d1440272 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -348,6 +348,9 @@ static void s390_machine_reset(MachineState *machine)
>          break;
>      case S390_RESET_LOAD_NORMAL:
>          CPU_FOREACH(t) {
> +            if (t == cs) {
> +                continue;
> +            }
>              run_on_cpu(t, s390_do_cpu_reset, RUN_ON_CPU_NULL);
>          }
>          subsystem_reset();


