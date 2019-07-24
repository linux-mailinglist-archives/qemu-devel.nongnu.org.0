Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB067303D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 15:50:46 +0200 (CEST)
Received: from localhost ([::1]:51864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqHfJ-00021M-EZ
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 09:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47050)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hqHf2-0001Np-Sr
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 09:50:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hqHf1-0004bu-Rx
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 09:50:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38390)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>)
 id 1hqHew-0004Yk-ER; Wed, 24 Jul 2019 09:50:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 987AA81DEB;
 Wed, 24 Jul 2019 13:50:20 +0000 (UTC)
Received: from localhost (ovpn-116-19.gru2.redhat.com [10.97.116.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91B7B5D9DE;
 Wed, 24 Jul 2019 13:50:19 +0000 (UTC)
Date: Wed, 24 Jul 2019 10:50:17 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20190724135017.GK11469@habkost.net>
References: <20190724103524.20916-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724103524.20916-1-cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 24 Jul 2019 13:50:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.2] hw: add compat machines for 4.2
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
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 24, 2019 at 12:35:24PM +0200, Cornelia Huck wrote:
> Add 4.2 machine types for arm/i440fx/q35/s390x/spapr.
> 
> For i440fx and q35, unversioned cpu models are still translated
> to -v1, as 0788a56bd1ae ("i386: Make unversioned CPU models be
> aliases") states this should only transition to the latest cpu
> model version in 4.3 (or later).
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

I plan to queue it for 4.2, but I think it's OK to queue this in
parallel through other trees if necessary (so patches that depend
on the new machine types can be queued too).

-- 
Eduardo

