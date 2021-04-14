Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB21035F222
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 13:22:43 +0200 (CEST)
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWdbW-0001e3-Or
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 07:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWdZB-0000BL-VA
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:20:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWdZ8-0001UP-GA
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618399213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+WdVsSQWRF5Cx7d3B/r8HKUyxzRYFDImi2HtX12vCq0=;
 b=iHTvJsAVwUe9tZN3gTOqJGNetup9kKKBl6vuafxKQLRcGIRxhfWhheszwGaLP8y9Gi8FWn
 tbOk5hmow+agksxNDX3ZZ8W1QcUFNwysQ8y7P4XiBoalcXc4UlDrzsLx9Om0/FlgLIrTn7
 X7yeB5MiTCuiLk3ojhxRSdfwsw4ukMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-r-Rpt2yWOEGyDcnz1r0uOw-1; Wed, 14 Apr 2021 07:20:11 -0400
X-MC-Unique: r-Rpt2yWOEGyDcnz1r0uOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A33A8189C7;
 Wed, 14 Apr 2021 11:20:10 +0000 (UTC)
Received: from thuth.com (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08D891037E81;
 Wed, 14 Apr 2021 11:20:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-6.1 0/4] Poison more CONFIG switches
Date: Wed, 14 Apr 2021 13:20:00 +0200
Message-Id: <20210414112004.943383-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Markus Armbruster <armbru@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using target-specific CONFIG_xxx switches in common code via "#ifdef"s
is wrong, since these macros are only defined for target-specific code.
We already poison many switches in common code to avoid the bugs with
dead code here, but these problems still keep creeping in ...
This series now improves the situation by poisoning more symbols,
especially by generating these from the target-specific config headers
automatically.

Thomas Huth (4):
  include/sysemu: Poison all accelerator CONFIG switches in common code
  migration: Move populate_vfio_info() into a separate file
  qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common code
  configure: Poison all current target-specific #defines

 Makefile              |  2 +-
 configure             |  5 +++++
 include/exec/poison.h |  6 ++++++
 include/sysemu/hax.h  |  4 ++++
 include/sysemu/hvf.h  |  4 ++++
 include/sysemu/whpx.h |  4 ++++
 migration/meson.build |  3 ++-
 migration/migration.c | 15 ---------------
 migration/migration.h |  2 ++
 migration/target.c    | 25 +++++++++++++++++++++++++
 qapi/qom.json         |  4 ++--
 11 files changed, 55 insertions(+), 19 deletions(-)
 create mode 100644 migration/target.c

-- 
2.27.0


