Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB772B424B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:12:51 +0100 (CET)
Received: from localhost ([::1]:57650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecRG-0003o9-3I
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kecPH-0001zk-19
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:10:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kecPE-000280-CI
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605525043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ag7tlISKt0mnwCPnqsEhoWwMeJJPThKuY/eWaLD8gdw=;
 b=OmzuCGL8OE+p1ud99i6Xx7B02hjWaBgtrYqOghwtEGsqL9eFDRLuNkLm2Z1Bx1gqumsN86
 tbni73NYsBZXzqNpZYM4v1lanc8o2jpnLSo/ncTTSN9YadUX70a6hbQSwceXen+eVD4WJ+
 erD38XHSF9SN+bjyCRhTYzVOQBzPyTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-eLDLXa1iPuCkCA3XkT7aZQ-1; Mon, 16 Nov 2020 06:10:41 -0500
X-MC-Unique: eLDLXa1iPuCkCA3XkT7aZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80F86873114
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 11:10:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45FA651919;
 Mon, 16 Nov 2020 11:10:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2B72A16E31; Mon, 16 Nov 2020 12:10:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Fixes 20201116 patches
Date: Mon, 16 Nov 2020 12:10:30 +0100
Message-Id: <20201116111036.12820-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit b50ea0d54bbca7d440315c3d0c0f7a4d6537b180=
:=0D
=0D
  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-2=
0201113-1' into staging (2020-11-14 11:22:07 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/fixes-20201116-pull-request=0D
=0D
for you to fetch changes up to c590fe3aa23acb923159c41c741dd694cba9c544:=0D
=0D
  xhci: move sanity checks (2020-11-16 09:11:21 +0100)=0D
=0D
----------------------------------------------------------------=0D
usb: a bunch of fixes for guest-triggerable asserts=0D
(should have been in last friday's pull, sorry ...).=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (6):=0D
  usb-storage: switch trace events=0D
  usb-storage: add commandlog property=0D
  usb-storage: use bool for removable property=0D
  usb-storage: fill csw on cancel=0D
  xhci: fix guest triggerable assert=0D
  xhci: move sanity checks=0D
=0D
 hw/usb/dev-storage.c | 60 +++++++++++++++++++++-----------------------=0D
 hw/usb/hcd-xhci.c    | 11 +++++---=0D
 hw/usb/trace-events  | 12 +++++++++=0D
 3 files changed, 48 insertions(+), 35 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


