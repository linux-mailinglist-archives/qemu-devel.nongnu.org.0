Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C0024A2C7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 17:24:16 +0200 (CEST)
Received: from localhost ([::1]:60456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8Pwl-00014m-UO
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 11:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8Pvk-000814-N9
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 11:23:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25422
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8Pvi-0000Fk-7r
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 11:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597850588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yf58fg/tNBwH7gFmXGBMkZ0JpF5EzIaDXQDlC2M/yGU=;
 b=cXvsrBoF45Rg/gvsZk4oCVc9ZRI0bXwAoeBuz8MCgoUjo8ntUvm0FnD0vlZISBS0PLQNY4
 X2Kjxsi2eyvGuORg3nYABSdV/4kcAJvnMXWBzOJAZhW3GTuINlgcHnPUjH51XEwh9WdvpB
 cqEDWvlUbxKVNQw/1wY+P6f36ts0waI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-sVfsufHnOfePao5d5qoFDA-1; Wed, 19 Aug 2020 11:23:07 -0400
X-MC-Unique: sVfsufHnOfePao5d5qoFDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 611C78030B7;
 Wed, 19 Aug 2020 15:23:05 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0168E5D9D5;
 Wed, 19 Aug 2020 15:22:58 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/3] Machine queue 2020-08-19
Date: Wed, 19 Aug 2020 11:22:55 -0400
Message-Id: <20200819152258.703874-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 04:00:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 672b2f2695891b6d818bddc3ce0df964c7627969=
:=0D
=0D
  Open 5.2 development tree (2020-08-18 13:44:04 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/ehabkost/qemu.git tags/machine-next-pull-request=0D
=0D
for you to fetch changes up to 3ff3c5d31740484b0e19007843094483fb393e80:=0D
=0D
  hw: add compat machines for 5.2 (2020-08-19 10:45:48 -0400)=0D
=0D
----------------------------------------------------------------=0D
Machine queue 2020-08-19=0D
=0D
Regular post-release changes:=0D
* hw: add compat machines for 5.2 (Cornelia Huck)=0D
=0D
Features:=0D
* qmp: Expose MachineClass::default_ram_id=0D
  (Michal Privoznik)=0D
=0D
Cleanups:=0D
* qdev: Document qdev_prop_set_drive_err() return value=0D
  (Philippe Mathieu-Daud=C3=A9)=0D
=0D
----------------------------------------------------------------=0D
=0D
Cornelia Huck (1):=0D
  hw: add compat machines for 5.2=0D
=0D
Michal Privoznik (1):=0D
  qmp: Expose MachineClass::default_ram_id=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  qdev: Document qdev_prop_set_drive_err() return value=0D
=0D
 qapi/machine.json            |  5 ++++-=0D
 include/hw/boards.h          |  3 +++=0D
 include/hw/i386/pc.h         |  3 +++=0D
 include/hw/qdev-properties.h |  2 ++=0D
 hw/arm/virt.c                |  9 ++++++++-=0D
 hw/core/machine-qmp-cmds.c   |  4 ++++=0D
 hw/core/machine.c            |  3 +++=0D
 hw/i386/pc.c                 |  3 +++=0D
 hw/i386/pc_piix.c            | 14 +++++++++++++-=0D
 hw/i386/pc_q35.c             | 13 ++++++++++++-=0D
 hw/ppc/spapr.c               | 15 +++++++++++++--=0D
 hw/s390x/s390-virtio-ccw.c   | 14 +++++++++++++-=0D
 12 files changed, 81 insertions(+), 7 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


