Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D164032EEAA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:23:25 +0100 (CET)
Received: from localhost ([::1]:50574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICIW-00072J-SW
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIC7L-0000HT-68
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:11:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIC7J-0000Xj-Fq
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614957108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L9JLs8Ed1vdzsRnne80vszLk8S8fCUawTjhIDUazbmk=;
 b=DhZgQYEsjy+UL5kLCJzI/l+xtbLTbxC1U/kfjke0gN+XrSejI1upl+jdBsvlvY004ZLF5o
 ProDrgxUUkVRGwYePm3Q/1s2z0KsPH1kuC4/vqXSUf5PmlSdPcCafWfi12GdwfK5P2M4V9
 yGd26KBha7ienJDB21EkezMlHN6YGUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-OAHNgSL2P0GhQLoAA5RVyg-1; Fri, 05 Mar 2021 10:11:47 -0500
X-MC-Unique: OAHNgSL2P0GhQLoAA5RVyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38D081966323;
 Fri,  5 Mar 2021 15:11:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CABF5032D;
 Fri,  5 Mar 2021 15:11:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 84CE41132C12; Fri,  5 Mar 2021 16:11:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] QAPI patches patches for 2021-03-05
Date: Fri,  5 Mar 2021 16:11:39 +0100
Message-Id: <20210305151143.741181-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit fe352f5c0056b4d21ae033ec49acc0bce9897e53:

  Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210304-pull-request' into staging (2021-03-04 12:58:50 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-03-05

for you to fetch changes up to 0e92a19b8c3b269dee377b76898c8bd7cadc1273:

  qapi: Fix parse errors for removal of null from schema language (2021-03-05 15:40:50 +0100)

----------------------------------------------------------------
QAPI patches patches for 2021-03-05

----------------------------------------------------------------
Eric Blake (1):
      qga: Utilize QAPI_LIST_APPEND in qmp_guest_network_get_interfaces

Markus Armbruster (2):
      error: Fix "Converting to ERRP_GUARD()" doc on "valid at return"
      qapi: Fix parse errors for removal of null from schema language

Philippe Mathieu-Daudé (1):
      qapi: Remove QMP events and commands from user-mode builds

 include/qapi/error.h                      |  2 +-
 qga/commands-posix.c                      | 75 +++++++++++++------------------
 qapi/meson.build                          | 12 +++--
 scripts/qapi/parser.py                    |  8 ++--
 tests/qapi-schema/leading-comma-list.err  |  2 +-
 tests/qapi-schema/trailing-comma-list.err |  2 +-
 6 files changed, 45 insertions(+), 56 deletions(-)

-- 
2.26.2


