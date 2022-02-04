Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0B94AA318
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 23:22:59 +0100 (CET)
Received: from localhost ([::1]:56540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG6yo-0004NC-8a
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 17:22:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG6uF-0007Ok-UR
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:18:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG6uC-0005oU-0Q
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644013090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rVBT/xioCt7Yc80ifpJIyELhh2gSiGD0yPK4gFqwxVM=;
 b=TbZ/ECZ3uGQBo4YyewYk/QmbYZ7d9C0YEMcH6L2yI7LpskrEirDQFNv0g0N5Rqg6RGIsTZ
 xaHd62RRGlAol2KfCE94IUmIxRcpjWTP0uKG/i85/xUyAzSB+dembJL3/fTwGlsvCnAmde
 3CGmiV0P6oJ1jYHtO/hkew2verMpqG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-n1AXeLnvNbWWhPCUOCeu1A-1; Fri, 04 Feb 2022 17:18:07 -0500
X-MC-Unique: n1AXeLnvNbWWhPCUOCeu1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60E2F1006AA9;
 Fri,  4 Feb 2022 22:18:06 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85F6B4E2DA;
 Fri,  4 Feb 2022 22:18:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Python: setuptools v60+ workaround
Date: Fri,  4 Feb 2022 17:18:02 -0500
Message-Id: <20220204221804.2047468-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Long story short: Python 3.7/3.8 on Fedora with setuptools v60.0.0+=0D
together create a bug that ultimately causes pylint to fail. See the=0D
first commit message for more detail.=0D
=0D
I sent out a hotfix two weeks ago to fix this behavior on our CI, but=0D
there's a better workaround. This adds the better workaround and reverts=0D
the hotfix.=0D
=0D
John Snow (2):=0D
  Python: add setuptools v60.0 workaround=0D
  Revert "python: pin setuptools below v60.0.0"=0D
=0D
 python/Makefile                | 2 --=0D
 python/setup.cfg               | 1 -=0D
 python/tests/iotests-pylint.sh | 3 ++-=0D
 python/tests/pylint.sh         | 3 ++-=0D
 4 files changed, 4 insertions(+), 5 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


