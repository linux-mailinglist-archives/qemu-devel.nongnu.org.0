Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C1226D155
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 04:51:28 +0200 (CEST)
Received: from localhost ([::1]:57462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIk19-0004ur-RD
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 22:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kIjzd-0003wD-Mj
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 22:49:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kIjzc-0007Ua-09
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 22:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600310991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6g0MrqRYMl2fktS7+t7DNPAs0uIrlGIwQEokf5CK5kA=;
 b=eqNiYO7k5EPxume4/iAFeRwKKVdnX8YFrUq+wEtCyKJlMpTxobP45LIGpXvbrDmGSeaXmx
 vW3Bl/hRvCe259Uug+HY5PkxOv7p2tZeCYt27ahc9iUgI2xjVew3iVlsHXiIHuhGJbaICk
 HV/8DGL+Ti8wM0Qds+vnE/fJ8U3VmJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-9PscgIFMP9CRnOI0ANbLxg-1; Wed, 16 Sep 2020 22:49:49 -0400
X-MC-Unique: 9PscgIFMP9CRnOI0ANbLxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67AD58D49DE;
 Thu, 17 Sep 2020 02:49:48 +0000 (UTC)
Received: from localhost (ovpn-119-217.rdu2.redhat.com [10.10.119.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F2D868866;
 Thu, 17 Sep 2020 02:49:48 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] qom: DECLARE_INTERFACE_CHECKER macro
Date: Wed, 16 Sep 2020 22:49:45 -0400
Message-Id: <20200917024947.707586-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 22:47:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an alternative to the series:=0D
  Subject: [PATCH 0/3] qom: Replace INTERFACE_CHECK with OBJECT_CHECK=0D
  https://lore.kernel.org/qemu-devel/20200916193101.511600-1-ehabkost@redha=
t.com/=0D
=0D
Instead of removing INTERFACE_CHECK completely, keep it but use a=0D
DECLARE_INTERFACE_CHECKER macro to define the type checking functions for=
=0D
interface types.=0D
=0D
Changes v1 -> v2:=0D
* Move declaration after typedefs, so the code actually compiles=0D
=0D
Link to v1:=0D
https://lore.kernel.org/qemu-devel/20200916223258.599367-1-ehabkost@redhat.=
com=0D
=0D
Eduardo Habkost (2):=0D
  qom: DECLARE_INTERFACE_CHECKER macro=0D
  qom: Use DECLARE_INTERFACE_CHECKER macro=0D
=0D
 include/hw/acpi/acpi_dev_interface.h |  7 +++----=0D
 include/hw/arm/linux-boot-if.h       |  6 +++---=0D
 include/hw/fw-path-provider.h        |  6 +++---=0D
 include/hw/hotplug.h                 |  6 +++---=0D
 include/hw/intc/intc.h               |  7 +++----=0D
 include/hw/ipmi/ipmi.h               |  6 +++---=0D
 include/hw/isa/isa.h                 |  4 ++--=0D
 include/hw/mem/memory-device.h       |  6 +++---=0D
 include/hw/nmi.h                     |  6 +++---=0D
 include/hw/ppc/pnv_xscom.h           |  4 ++--=0D
 include/hw/ppc/spapr_irq.h           |  4 ++--=0D
 include/hw/ppc/xics.h                |  4 ++--=0D
 include/hw/ppc/xive.h                | 12 ++++++------=0D
 include/hw/rdma/rdma.h               |  7 +++----=0D
 include/hw/rtc/m48t59.h              |  6 +++---=0D
 include/hw/stream.h                  |  6 +++---=0D
 include/hw/vmstate-if.h              |  6 +++---=0D
 include/qom/object.h                 | 14 ++++++++++++++=0D
 include/qom/object_interfaces.h      |  7 +++----=0D
 include/sysemu/tpm.h                 |  6 +++---=0D
 target/arm/idau.h                    |  6 +++---=0D
 tests/check-qom-interface.c          |  6 +++---=0D
 22 files changed, 76 insertions(+), 66 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


