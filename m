Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCEB577EAB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 11:29:57 +0200 (CEST)
Received: from localhost ([::1]:33218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDN4f-0008IN-1d
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 05:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oDN2t-0004iM-J7
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oDN2r-000879-Lu
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658136484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=76b+HHeDQeyjrtyjg0Pz3ENGd4hzhI+pHEPZBrlUp2M=;
 b=MJ+0HdTWOctZHaM6+Z+fuKifQfzdKpgxr9MgEChRlr3Sg0vujej0fca5fRMFidqdbwI7vL
 U1aADkCL+o7Zuv9jKn7IZduQocj4hPmoK+QaHY48s7d1cmMDiEv3uF6fUo4WJTtQtzOn1Y
 Uo3noYHQ7a5U903q4Cq6IXu/MHkkEh0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-etV-UNI-MoSyTbCM9ImpVg-1; Mon, 18 Jul 2022 05:28:03 -0400
X-MC-Unique: etV-UNI-MoSyTbCM9ImpVg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB5EB811E76;
 Mon, 18 Jul 2022 09:28:02 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC7791121315;
 Mon, 18 Jul 2022 09:28:01 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 0/1] MAINTAINERS: Add myself as Guest Agent co-maintainer
Date: Mon, 18 Jul 2022 12:27:58 +0300
Message-Id: <20220718092759.2360747-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


The following changes since commit 0ebf76aae58324b8f7bf6af798696687f5f4c2a9:

  Merge tag 'nvme-next-pull-request' of git://git.infradead.org/qemu-nvme into staging (2022-07-15 15:38:13 +0100)

are available in the Git repository at:

  git@github.com:kostyanf14/qemu.git tags/qga-win32-pull-2022-07-18

for you to fetch changes up to e8cbe5842bad80bc2df692dea70134da0d13c556:

  MAINTAINERS: Add myself as Guest Agent co-maintainer (2022-07-18 11:56:09 +0300)

----------------------------------------------------------------
qga-win32-pull-2022-07-18

----------------------------------------------------------------
Konstantin Kostiuk (1):
      MAINTAINERS: Add myself as Guest Agent co-maintainer

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


--
2.25.1


