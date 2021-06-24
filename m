Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B7F3B381C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 22:46:36 +0200 (CEST)
Received: from localhost ([::1]:51232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwWF9-0006j3-B7
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 16:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwWBX-0004cq-St
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:42:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwWBV-0003hw-Rq
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624567368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MM0YgCRjEgwBnqXfrtPDi4rwMBR/CYU6xR8D9+IQhpM=;
 b=bhtA4iib8mkmHl/QUah0ZTAEhnYyIorH/EhCeiyWyUZUV2EhThIfAr3Q4ie+D6Q9r3QOnj
 Ig2lIVBx5LP/nr9w11OnLYKXeUFHHjP+GnHocWh8MXOUpWcX+I0A6M3UugZV0GApHDy6sz
 HKetfihvaavfV2XdOwYpM2FDxU8D5qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-XTRcjEX3MDK7zuxYv4MNGw-1; Thu, 24 Jun 2021 16:42:45 -0400
X-MC-Unique: XTRcjEX3MDK7zuxYv4MNGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25F1A18D6A32;
 Thu, 24 Jun 2021 20:42:44 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9AAC5D6AB;
 Thu, 24 Jun 2021 20:42:32 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] pc: acpi: revert back to 5.2 PCI slot enumeration
Date: Thu, 24 Jun 2021 16:42:26 -0400
Message-Id: <20210624204229.998824-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: berrange@redhat.com, john.sucaet@ekinops.com, mst@redhat.com,
 stefanha@redhat.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit b7f23f62e40 (pci: acpi: add _DSM method to PCI devices),
regressed network interface naming for Linux guests in some cases.
This reverts PCI slot enumeration to its state before 6.0.
For details see 2/3 patch.

Thanks Stefan for troubleshooting!

Reported-by: john.sucaet@ekinops.com  
CC: stefanha@redhat.com
CC: qemu-stable@nongnu.org
CC: mst@redhat.com
CC: marcel.apfelbaum@gmail.com
CC: berrange@redhat.com

Igor Mammedov (2):
  tests: acpi: prepare for changing DSDT tables
  acpi: pc: revert back to v5.2 PCI slot enumeration

 tests/qtest/bios-tables-test-allowed-diff.h | 10 ++++++++++
 hw/i386/acpi-build.c                        |  9 +++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.27.0


