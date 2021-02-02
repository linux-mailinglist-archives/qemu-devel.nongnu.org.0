Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A126530CBAE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 20:33:01 +0100 (CET)
Received: from localhost ([::1]:47680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l71Q4-00014j-8I
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 14:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l71O8-0008Iu-Dz
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 14:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l71O4-0001Ex-FO
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 14:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612294255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8oRC097U+Zct0ihkxG6tCLI7RTqwcVuslrcl+XB4rvY=;
 b=ZXlt6vGydgtNPS5v7x4LxPAeoAvgmwWYAFvzC/dlJgfb3Zq7jvRe6gMYJOm6r2C6P0IRsS
 L8NEdQ+ikRP6/KGbr3UT2sDnCPIcewzIsJUDutSykPEFBa4fvMfnQpQQ10V8w/aFh5wi7f
 JREltj/CzRkUVHyOX5U1Oknfu8PDGTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-NrQlPkiSMCijikzig0bk4g-1; Tue, 02 Feb 2021 14:30:50 -0500
X-MC-Unique: NrQlPkiSMCijikzig0bk4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DB44BBF10;
 Tue,  2 Feb 2021 19:30:23 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2F8174AA9;
 Tue,  2 Feb 2021 19:30:21 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/3] Machine queue, 2021-02-02
Date: Tue,  2 Feb 2021 14:30:17 -0500
Message-Id: <20210202193020.4107711-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I still have a huge list of patches to review, but I don't keep=0D
this series stuck in the queue while I try to catch up.=0D
=0D
The following changes since commit 74208cd252c5da9d867270a178799abd802b9338=
:=0D
=0D
  Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pul=
l-request' into staging (2021-01-29 19:51:25 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request=0D
=0D
for you to fetch changes up to dbd730e8598701e11b2fb7aee1704f4ec1787e86:=0D
=0D
  nvdimm: check -object memory-backend-file, readonly=3Don option (2021-02-=
01 17:07:34 -0500)=0D
=0D
----------------------------------------------------------------=0D
Machine queue, 2021-02-02=0D
=0D
Feature:=0D
* nvdimm: read-only file support (Stefan Hajnoczi)=0D
=0D
----------------------------------------------------------------=0D
=0D
Stefan Hajnoczi (3):=0D
  memory: add readonly support to memory_region_init_ram_from_file()=0D
  hostmem-file: add readonly=3Don|off option=0D
  nvdimm: check -object memory-backend-file, readonly=3Don option=0D
=0D
 include/exec/memory.h     |  2 ++=0D
 include/exec/ram_addr.h   |  5 +++--=0D
 include/qemu/mmap-alloc.h |  2 ++=0D
 backends/hostmem-file.c   | 28 +++++++++++++++++++++++++++-=0D
 docs/nvdimm.txt           | 24 +++++++++++++++++-------=0D
 hw/mem/nvdimm.c           |  9 +++++++++=0D
 qemu-options.hx           |  5 ++++-=0D
 softmmu/memory.c          |  7 +++++--=0D
 softmmu/physmem.c         | 18 +++++++++++-------=0D
 util/mmap-alloc.c         | 10 ++++++----=0D
 util/oslib-posix.c        |  2 +-=0D
 11 files changed, 87 insertions(+), 25 deletions(-)=0D
=0D
--=20=0D
2.28.0=0D
=0D


