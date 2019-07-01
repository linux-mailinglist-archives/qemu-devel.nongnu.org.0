Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3492050272
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 08:39:23 +0200 (CEST)
Received: from localhost ([::1]:48258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfIdN-0008HJ-KK
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 02:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43481)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peterx@redhat.com>) id 1hfIc1-0007Y8-J7
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 02:37:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hfIbz-0004TG-Vh
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 02:37:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53918)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hfIbz-0004IY-P2
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 02:37:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B3E684E938;
 Mon, 24 Jun 2019 06:37:47 +0000 (UTC)
Received: from xz-x1.redhat.com (ovpn-12-60.pek2.redhat.com [10.72.12.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85FA0608D0;
 Mon, 24 Jun 2019 06:37:36 +0000 (UTC)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2019 14:37:31 +0800
Message-Id: <20190624063733.22079-1-peterx@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 24 Jun 2019 06:37:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] intel_iommu: Fix unexpected unmaps during
 global unmap
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, peterx@redhat.com,
 Auger Eric <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yan & Paolo,

I've re-ordered the patch into two, and I'm making bold to do that
with your authorships and sign-offs as I see correct.  Please reply if
any of you have problem with that.

Yan,

Please feel free to test this series and offer your tested-by again
here.  I can't do that for you because I modified your previous patch
a bit.

Please review, thanks.

Paolo Bonzini (1):
  intel_iommu: Fix unexpected unmaps during global unmap

Yan Zhao (1):
  intel_iommu: Fix incorrect "end" for vtd_address_space_unmap

 hw/i386/intel_iommu.c | 74 +++++++++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 28 deletions(-)

--=20
2.21.0


