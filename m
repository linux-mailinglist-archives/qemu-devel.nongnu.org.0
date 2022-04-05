Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADF14F296B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 11:24:53 +0200 (CEST)
Received: from localhost ([::1]:58638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbfQi-0000O3-45
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 05:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nbfMB-0006mM-Ru
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:20:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nbfM8-0001or-4x
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649150404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1VlvXenxK6WuieOv1E5Sfqk8bIz3nEL53FlZ6n8xpLY=;
 b=Y8+G8niuq3CxoeFO9WUeEckZAtrs5zIRu87fYN2FYQSd6dXEjaueY3jyNoWpfevLQA8mVH
 14dOIjwvRbMXfC+qPzwTudaYW6R5AJJV4WmIUVd2lpXqcJcMRAUS/mcdCB+2ngpa/S/A4I
 l2wPVz7sk8PbL563W8h3HTuff15tpdM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-G4f5kWqrMv-xBmYkpyCPHw-1; Tue, 05 Apr 2022 05:20:03 -0400
X-MC-Unique: G4f5kWqrMv-xBmYkpyCPHw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B9813800511
 for <qemu-devel@nongnu.org>; Tue,  5 Apr 2022 09:20:03 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.32.181.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C5762167D9B
 for <qemu-devel@nongnu.org>; Tue,  5 Apr 2022 09:20:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Misc changes for 2022-04-05
Date: Tue,  5 Apr 2022 11:19:58 +0200
Message-Id: <20220405092001.104507-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 20661b75ea6093f5e59079d00a778a972d6732c5:

  Merge tag 'pull-ppc-20220404' of https://github.com/legoater/qemu into staging (2022-04-04 15:48:55 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 776a6a32b4982a68d3b7a77cbfaae6c2b363a0b8:

  docs/system/i386: Add measurement calculation details to amd-memory-encryption (2022-04-05 10:42:06 +0200)

----------------------------------------------------------------
* fix vss-win32 compilation with clang++

* update Coverity model

* add measurement calculation to amd-memory-encryption docs

----------------------------------------------------------------
Dov Murik (1):
      docs/system/i386: Add measurement calculation details to amd-memory-encryption

Helge Konetzka (1):
      qga/vss-win32: fix compilation with clang++

Paolo Bonzini (1):
      coverity: update model for latest tools

 docs/system/i386/amd-memory-encryption.rst | 54 +++++++++++++++++++++++++++---
 qga/vss-win32/install.cpp                  |  3 +-
 scripts/coverity-scan/model.c              |  3 +-
 3 files changed, 54 insertions(+), 6 deletions(-)
-- 
2.35.1


