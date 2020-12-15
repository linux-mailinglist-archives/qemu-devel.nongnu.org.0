Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C675C2DB012
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:30:13 +0100 (CET)
Received: from localhost ([::1]:57274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCHE-0003E4-Mb
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:30:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8z-0008LT-Mn
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8r-0002QU-E2
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=klhNdDwGhgBuJ6oyiHDyzC7Zg1AI9nDgvIkWpcILJeY=;
 b=gF3m1zJip2uRqeT9aNzAfD11C1F0kCybMpei9Z9hNfh//jVZznNaIoD2R89XsMaxrybpLg
 CP+GWMh0Z55HC6llML0DxyDtsHnbpV0hGL6iL09aL+sl9aXM5kG8K3aUYrffd20xoPQ1Dl
 yWejBCwGlx3dxqlVdZgDJ0aa2UOFJBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-d5WuWxWDMau1VyAB03SV5A-1; Tue, 15 Dec 2020 10:21:29 -0500
X-MC-Unique: d5WuWxWDMau1VyAB03SV5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F2BD81D8B;
 Tue, 15 Dec 2020 15:19:44 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B950A19C47;
 Tue, 15 Dec 2020 15:19:43 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/25] Machine queue, 2020-12-15
Date: Tue, 15 Dec 2020 10:19:17 -0500
Message-Id: <20201215151942.3125089-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 37f04b71a9cd62ca0f2d24a70fe843619ad45cd0=
:=0D
=0D
  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.0-20201214=
' into staging (2020-12-14 16:31:15 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/ehabkost/qemu.git tags/machine-next-pull-request=0D
=0D
for you to fetch changes up to f953c100693dec2338d643ec21d131d411e9d38e:=0D
=0D
  MAINTAINERS: Update my git repository URLs (2020-12-15 10:02:07 -0500)=0D
=0D
----------------------------------------------------------------=0D
Machine queue, 2020-12-15=0D
=0D
* qdev code cleanup=0D
* Convert some QOM instance properties to class properties=0D
* Update git URLs on MAINTAINERS=0D
=0D
----------------------------------------------------------------=0D
=0D
Eduardo Habkost (25):=0D
  vexpress: Register "secure" as class property=0D
  vexpress-a15: Register "virtualization" as class property=0D
  tmp421: Register properties as class properties=0D
  i386: Register feature bit properties as class properties=0D
  arm/virt: Register most properties as class properties=0D
  virt: Register "its" as class property=0D
  arm/cpu64: Register "aarch64" as class property=0D
  can_host: Use class properties=0D
  netfilter: Reorder functions=0D
  netfilter: Use class properties=0D
  cs4231: Get rid of empty property array=0D
  cpu: Move cpu_common_props to hw/core/cpu.c=0D
  qdev: Move property code to qdev-properties.[ch]=0D
  qdev: Check dev->realized at set_size()=0D
  sparc: Check dev->realized at sparc_set_nwindows()=0D
  qdev: Don't use dev->id on set_size32() error message=0D
  qdev: Make PropertyInfo.print method get Object* argument=0D
  qdev: Make bit_prop_set() get Object* argument=0D
  qdev: Make qdev_get_prop_ptr() get Object* arg=0D
  qdev: Make qdev_find_global_prop() get Object* argument=0D
  qdev: Make check_prop_still_unset() get Object* argument=0D
  qdev: Make error_set_from_qdev_prop_error() get Object* argument=0D
  qdev: Make qdev_propinfo_get_uint16() static=0D
  qdev: Move UUID property to qdev-properties-system.c=0D
  MAINTAINERS: Update my git repository URLs=0D
=0D
 hw/core/cpu.c                    |  15 ++=0D
 hw/core/qdev-prop-internal.h     |   2 -=0D
 hw/core/qdev-properties-system.c | 135 ++++++++++-----=0D
 hw/core/qdev-properties.c        | 285 ++++++++++++++++++-------------=0D
 hw/core/qdev.c                   | 120 -------------=0D
 include/hw/core/cpu.h            |   1 -=0D
 include/hw/qdev-core.h           |  37 ----=0D
 include/hw/qdev-properties.h     |  44 ++++-=0D
 MAINTAINERS                      |   6 +-=0D
 backends/tpm/tpm_util.c          |   8 +-=0D
 cpu.c                            |  15 --=0D
 hw/arm/vexpress.c                |  25 +--=0D
 hw/arm/virt.c                    |  88 +++++-----=0D
 hw/audio/cs4231.c                |   5 -=0D
 hw/block/xen-block.c             |   5 +-=0D
 hw/misc/tmp421.c                 |  30 ++--=0D
 hw/s390x/css.c                   |   7 +-=0D
 hw/s390x/s390-pci-bus.c          |   4 +-=0D
 hw/vfio/pci-quirks.c             |   5 +-=0D
 net/can/can_host.c               |  16 +-=0D
 net/dump.c                       |  10 +-=0D
 net/filter-buffer.c              |  26 ++-=0D
 net/filter-mirror.c              |  64 +++----=0D
 net/filter-rewriter.c            |   7 +-=0D
 net/filter.c                     |  24 +--=0D
 softmmu/qdev-monitor.c           |   1 +=0D
 target/arm/cpu64.c               |  16 +-=0D
 target/i386/cpu.c                |  40 ++---=0D
 target/sparc/cpu.c               |   6 +=0D
 29 files changed, 504 insertions(+), 543 deletions(-)=0D
=0D
--=20=0D
2.28.0=0D
=0D


