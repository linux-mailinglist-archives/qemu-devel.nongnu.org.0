Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E10D31F30A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:26:50 +0100 (CET)
Received: from localhost ([::1]:45490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsh7-0003i1-Ay
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lCsep-0001yQ-2O
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:24:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lCsek-00012U-Lm
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613690661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=detIwkNULC1h/yBTZbsvSPFfdledbLjSKN5UtBI4qEs=;
 b=Vc1Hxf8XbkgAXW5y8huaNYm4e9HTc2Q2suxAHUg2DBaZBAxiES74aeusMnkgQetGWeHXxi
 W/CS4prbxHHA8P/v2TGupQqUs8CKmU6+clgTDWYhC9kVecNqq+RhEHDvlK9x2Cy9qeIW1y
 28Mz4UttIIY2jELw+9Gt0fIAbUTY0r0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-Ns630hooMpimt6gXJzSpag-1; Thu, 18 Feb 2021 18:24:17 -0500
X-MC-Unique: Ns630hooMpimt6gXJzSpag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46AAE801965;
 Thu, 18 Feb 2021 23:24:16 +0000 (UTC)
Received: from localhost (ovpn-3-246.rdu2.redhat.com [10.22.3.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C624919C47;
 Thu, 18 Feb 2021 23:24:15 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/3] Machine and x86 queue, 2021-02-18
Date: Thu, 18 Feb 2021 18:24:12 -0500
Message-Id: <20210218232415.1001078-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm hugely behind in backlog of qemu-devel messages and patches=0D
to queue/review (my apologies to all waiting for something from=0D
me).  I'm flushing the few patches I had queued so they don't get=0D
stale.=0D
=0D
The following changes since commit c79f01c9450bcf90c08a77f13fbf67bdba59a316=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210218' =
into staging (2021-02-18 16:33:36 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request=0D
=0D
for you to fetch changes up to bf475162d70a16a6cef478272aa32be1025aa72a:=0D
=0D
  hostmem: Don't report pmem attribute if unsupported (2021-02-18 16:43:17 =
-0500)=0D
=0D
----------------------------------------------------------------=0D
Machine and x86 queue, 2021-02-18=0D
=0D
Feature:=0D
* i386: Add the support for AMD EPYC 3rd generation processors=0D
  (Babu Moger)=0D
=0D
Bug fix:=0D
* hostmem: Don't report pmem attribute if unsupported=0D
  (Michal Privoznik)=0D
=0D
Cleanup:=0D
* device-crash-test: Remove problematic language=0D
  (Eduardo Habkost)=0D
=0D
----------------------------------------------------------------=0D
=0D
Babu Moger (1):=0D
  i386: Add the support for AMD EPYC 3rd generation processors=0D
=0D
Eduardo Habkost (1):=0D
  device-crash-test: Remove problematic language=0D
=0D
Michal Privoznik (1):=0D
  hostmem: Don't report pmem attribute if unsupported=0D
=0D
 target/i386/cpu.h         |   4 ++=0D
 backends/hostmem-file.c   |  13 ++---=0D
 scripts/device-crash-test |  96 +++++++++++++++++-----------------=0D
 target/i386/cpu.c         | 107 +++++++++++++++++++++++++++++++++++++-=0D
 4 files changed, 162 insertions(+), 58 deletions(-)=0D
=0D
--=20=0D
2.28.0=0D
=0D


