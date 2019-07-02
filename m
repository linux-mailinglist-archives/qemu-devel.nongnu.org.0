Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53215D11E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 16:02:19 +0200 (CEST)
Received: from localhost ([::1]:53654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiJMR-0000zU-38
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 10:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40622)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hiJIq-0006y1-5N
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 09:58:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hiJIm-0007Rd-Jl
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 09:58:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33652)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hiJIm-0007Qn-D1
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 09:58:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 54536307D860;
 Tue,  2 Jul 2019 13:58:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6616B1799F;
 Tue,  2 Jul 2019 13:58:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9B6CD16E05; Tue,  2 Jul 2019 15:58:25 +0200 (CEST)
Date: Tue, 2 Jul 2019 15:58:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Message-ID: <20190702135825.ymepsqz2oecbthdo@sirius.home.kraxel.org>
References: <20190702121106.28374-1-slp@redhat.com>
 <20190702121106.28374-5-slp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702121106.28374-5-slp@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 02 Jul 2019 13:58:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 4/4] hw/i386: Introduce the microvm
 machine type
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
Cc: ehabkost@redhat.com, maran.wilson@oracle.com, mst@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, sgarzare@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +#define MICROVM_MAX_BELOW_4G  0xe0000000
> +
> +/* Platform virtio definitions */
> +#define VIRTIO_MMIO_BASE      0xd0000000

That isn't going to fly ...

I'd also suggest to add a microvm.txt file to docs/ with specification
(io memory, io ports, memory layout in pvh mode, in firmware mode, ...)
and usage information.

cut & paste the bits sprinkled all over in commit messages and cover
letter would be a good start.

cheers,
  Gerd


