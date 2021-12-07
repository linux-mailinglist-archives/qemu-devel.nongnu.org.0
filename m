Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3731146C4D5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 21:43:22 +0100 (CET)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muhJ2-00083m-N5
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 15:43:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muhH1-0006nP-Hm
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 15:41:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muhGy-0001Po-QO
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 15:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638909671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o/mQDv0klID+KqLG5qpl7jNtupx2gvyx6QYJB4Gg6AQ=;
 b=evKKNzbhBelZ7TZExi9f15AFH5WaU3lYH7aLVMZP4WeC8oPgqJJBXcAkaoSZ8Ws281r9e7
 DNXJ5x8V95KJTFnhnrkPQd/2pRWqk/jJBeWqAw5Cf+E3LAhTygnnagAcKNhLNkkv3mbZzy
 janGCUJJdUEdd6+KZ2M4i+yq7QNvhc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-a1XbWHaHNg-IgEax79GxuA-1; Tue, 07 Dec 2021 15:41:10 -0500
X-MC-Unique: a1XbWHaHNg-IgEax79GxuA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3EA21006AA1;
 Tue,  7 Dec 2021 20:41:09 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F14F5D6CF;
 Tue,  7 Dec 2021 20:40:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Misc: build fixes for Fedora 35, Ubuntu et al
Date: Tue,  7 Dec 2021 15:40:36 -0500
Message-Id: <20211207204038.664133-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe Mathieu Daude <philmd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I didn't push this through in time for 6.2, so this series just worries=0D
about the little fixes necessary for building QEMU under Fedora 35 and=0D
the latest Ubuntu distributions.=0D
=0D
The actual container changes have been cut off of this series in favor=0D
of Dan's larger series that switches us over to using lcitool.=0D
=0D
John Snow (2):=0D
  spice: Update QXLInterface for spice >=3D 0.15.0=0D
  ui/clipboard: Don't use g_autoptr just to free a variable=0D
=0D
 include/ui/qemu-spice.h |  6 ++++++=0D
 hw/display/qxl.c        | 14 +++++++++++++-=0D
 ui/clipboard.c          |  3 +--=0D
 ui/spice-display.c      | 11 +++++++++++=0D
 4 files changed, 31 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


