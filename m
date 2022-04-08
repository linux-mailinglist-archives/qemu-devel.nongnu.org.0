Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983544F8D2C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 06:55:41 +0200 (CEST)
Received: from localhost ([::1]:52654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncgeq-0006Or-6b
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 00:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ncgcF-0004YJ-5j
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 00:52:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ncgcD-0000vK-0o
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 00:52:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649393575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L9kfCNSkgsKJNooEIeUqtlLsLGikXlMFQlC4ezKv1Yw=;
 b=Qm2ugbERXISLZ0Q/rkXovLTqNW85ae3c2LjdSlzrPKyw/wvq4Ez+jjvmt7Tg2MQizQE+op
 EZCkVcztpwgr2i7vf4DsbWvP8GOThMQCPE81N1g/04//CfesAAgsQFCFngzm5/nptYbsVS
 FrOF1ptnm+zaoYrQtlmtm4fE2kFyAc0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-6LQ9PDCAM8aioEEgbr5UQw-1; Fri, 08 Apr 2022 00:52:54 -0400
X-MC-Unique: 6LQ9PDCAM8aioEEgbr5UQw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70D083800E94
 for <qemu-devel@nongnu.org>; Fri,  8 Apr 2022 04:52:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30F61401E58;
 Fri,  8 Apr 2022 04:52:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B05EA180061B; Fri,  8 Apr 2022 06:52:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Fixes 20220408 patches
Date: Fri,  8 Apr 2022 06:52:50 +0200
Message-Id: <20220408045252.2375896-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 95a3fcc7487e5bef262e1f937ed8636986764c4e=
:=0D
=0D
  Update version for v7.0.0-rc3 release (2022-04-06 21:26:13 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/fixes-20220408-pull-request=0D
=0D
for you to fetch changes up to fa892e9abb728e76afcf27323ab29c57fb0fe7aa:=0D
=0D
  ui/cursor: fix integer overflow in cursor_alloc (CVE-2021-4206) (2022-04-=
07 12:30:54 +0200)=0D
=0D
----------------------------------------------------------------=0D
two cursor/qxl related security fixes.=0D
=0D
----------------------------------------------------------------=0D
=0D
Mauro Matteo Cascella (2):=0D
  display/qxl-render: fix race condition in qxl_cursor (CVE-2021-4207)=0D
  ui/cursor: fix integer overflow in cursor_alloc (CVE-2021-4206)=0D
=0D
 hw/display/qxl-render.c | 9 ++++++++-=0D
 hw/display/vmware_vga.c | 2 ++=0D
 ui/cursor.c             | 8 +++++++-=0D
 3 files changed, 17 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.35.1=0D
=0D


