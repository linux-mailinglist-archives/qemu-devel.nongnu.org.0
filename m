Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7F13B0543
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:54:46 +0200 (CEST)
Received: from localhost ([::1]:60564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvfvR-00019M-Q4
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfs9-0006lN-N3
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:51:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfs6-0000o7-IB
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624366277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UE/4Cvd26+sEsywTBnAkegJjaL3n1R2fEa7jCX323fc=;
 b=dUyFBowTSFIQum3kLElzv0JDJLZX3HzJpAPuq82TrDbRVVl2mYkZ8/bWoDgQ16CZpdWWdR
 pB4z1MGw4IBAmXoTDWoc6ycxa6XIGHQT4xO7e3aJULgY2SPxyu8AvUIifcUhfVd62WAyb2
 sZblw3nJoiN2xNm7yxpnF7yh+DiR098=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-qZVeviauMNGJBnQzSzj_Yw-1; Tue, 22 Jun 2021 08:51:16 -0400
X-MC-Unique: qZVeviauMNGJBnQzSzj_Yw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5B808015D0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 12:51:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BD0F5D9CA;
 Tue, 22 Jun 2021 12:51:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B552F180060E; Tue, 22 Jun 2021 14:51:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] modules: update developer documentation
Date: Tue, 22 Jun 2021 14:51:06 +0200
Message-Id: <20210622125110.262843-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depends on the "modules: add meta-data database" patch series.=0D
=0D
Gerd Hoffmann (4):=0D
  modules: add documentation for module sourcesets=0D
  modules: add module_obj() note to QOM docs=0D
  modules: module.h kerneldoc annotations=0D
  modules: hook up modules.h to docs build=0D
=0D
 include/qemu/module.h       | 59 ++++++++++++++++++++++++++++---------=0D
 docs/devel/build-system.rst | 17 +++++++++++=0D
 docs/devel/index.rst        |  1 +=0D
 docs/devel/modules.rst      |  5 ++++=0D
 docs/devel/qom.rst          |  8 +++++=0D
 5 files changed, 76 insertions(+), 14 deletions(-)=0D
 create mode 100644 docs/devel/modules.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


