Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40FA2B806A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:28:16 +0100 (CET)
Received: from localhost ([::1]:57950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPNX-0000wr-V7
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kfPMc-0000F0-BK
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:27:18 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:54446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kfPMa-00034b-9q
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:27:18 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-_zX-gj4oPOyUlgO8tmVsZg-1; Wed, 18 Nov 2020 10:27:00 -0500
X-MC-Unique: _zX-gj4oPOyUlgO8tmVsZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 630C61005D44;
 Wed, 18 Nov 2020 15:26:58 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4D6010016FD;
 Wed, 18 Nov 2020 15:26:56 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/1] ppc-for-5.2 patch queue 2020-11-18
Date: Wed, 18 Nov 2020 16:26:38 +0100
Message-Id: <20201118152639.173860-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 10:27:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Cedric Le Goater <clg@fr.ibm.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 66a300a107ec286725bdc943601cbd4247b82158=
:

  Update version for v5.2.0-rc2 release (2020-11-17 22:58:10 +0000)

are available in the Git repository at:

  https://github.com/gkurz/qemu.git tags/ppc-for-5.2-20201118

for you to fetch changes up to 6d24795ee7e3199d199d3c415312c93382ad1807:

  Revert series "spapr/xive: Allocate vCPU IPIs from the vCPU contexts" (20=
20-11-18 11:05:56 +0100)

----------------------------------------------------------------
ppc patch queue for 2020-11-18

This fixes a regression that badly breaks some guest setups because
IPIs end up misconfigured in the XIVE interrupt controller. Hopefully,
the last fix for sPAPR. I'm sending this PR with the blessing of David
who is currently on holidays.

----------------------------------------------------------------
Greg Kurz (1):
      Revert series "spapr/xive: Allocate vCPU IPIs from the vCPU contexts"

 hw/intc/spapr_xive_kvm.c | 102 +++++++++----------------------------------=
----
 1 file changed, 18 insertions(+), 84 deletions(-)
--=20
2.26.2


