Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C66632F3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 10:42:06 +0200 (CEST)
Received: from localhost ([::1]:47838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hklhN-0000y6-V1
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 04:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33703)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hklem-0007PM-3y
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 04:39:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hklek-0007mW-8P
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 04:39:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42424)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hklei-0007lK-BM; Tue, 09 Jul 2019 04:39:21 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F0967C0546D3;
 Tue,  9 Jul 2019 08:39:11 +0000 (UTC)
Received: from gondolin (unknown [10.40.205.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1793E5C2FD;
 Tue,  9 Jul 2019 08:39:05 +0000 (UTC)
Date: Tue, 9 Jul 2019 10:39:02 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Collin Walling <walling@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Henderson <rth@twiddle.net>, David Hildenbrand <david@redhat.com>
Message-ID: <20190709103902.334a381e.cohuck@redhat.com>
In-Reply-To: <20190708125433.16927-1-cohuck@redhat.com>
References: <20190708125433.16927-1-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 09 Jul 2019 08:39:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.1 0/2] s390x: fallthrough annotations
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  8 Jul 2019 14:54:31 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> I looked through the build log linked to in
> <591d71a5-5b10-ab22-4751-01da8613d84c@weilnetz.de> and came up
> with the following patches for s390x. I plan to queue them to
> my fixes branch for 4.1.

Queued patch 2; still waiting for a final ack for patch 1.

> 
> Cornelia Huck (2):
>   s390x/pci: add some fallthrough annotations
>   s390x/tcg: move fallthrough annotation
> 
>  hw/s390x/s390-pci-inst.c        | 2 ++
>  target/s390x/translate_vx.inc.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 


