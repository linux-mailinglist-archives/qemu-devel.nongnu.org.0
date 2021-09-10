Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92D6406A1D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 12:24:57 +0200 (CEST)
Received: from localhost ([::1]:45198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOdiK-0001Jt-OJ
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 06:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOdgh-0007lj-9K
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:23:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOdgf-0005vQ-0e
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631269389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yih9WHp6UOaQ94D9YhK/ASlsnGflhY1RR4xLzMq8txQ=;
 b=BmmE/5iPchsDlA57R0RpHtcTZT9f4gRmAOgrfl9r7dtbkli8XYBoWQ/ktePsEWbfDnx4sa
 0FtIr1SoV6ONubL8PC8QNhOAMkQsrxQJqWh/oHiIxW43PmHbLhQG/9xIVwqIl2ZpNdjwJ9
 mbdg4NBczEE/z/q/IngYLKWvkudqR6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-QP3Ft7cGPdqBvvoXowzXUQ-1; Fri, 10 Sep 2021 06:23:08 -0400
X-MC-Unique: QP3Ft7cGPdqBvvoXowzXUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0F2618414A3
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 10:23:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA3A2188E4;
 Fri, 10 Sep 2021 10:23:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D044C18000AA; Fri, 10 Sep 2021 12:23:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Input 20210910 patches
Date: Fri, 10 Sep 2021 12:22:57 +0200
Message-Id: <20210910102300.3589982-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit bd662023e683850c085e98c8ff8297142c2dd9f2=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-2021090=
8' into staging (2021-09-08 11:06:17 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/input-20210910-pull-request=0D
=0D
for you to fetch changes up to 4e9bddcbaa74e2463f0a79350fea5311c9890982:=0D
=0D
  ps2: migration support for command reply queue (2021-09-10 07:32:32 +0200=
)=0D
=0D
----------------------------------------------------------------=0D
input: ps2 fixes.=0D
=0D
----------------------------------------------------------------=0D
=0D
Volker R=C3=BCmelin (3):=0D
  ps2: use the whole ps2 buffer but keep queue size=0D
  ps2: use a separate keyboard command reply queue=0D
  ps2: migration support for command reply queue=0D
=0D
 hw/input/ps2.c | 214 ++++++++++++++++++++++++++++++-------------------=0D
 1 file changed, 133 insertions(+), 81 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


