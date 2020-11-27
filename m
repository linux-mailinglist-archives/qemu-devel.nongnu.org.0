Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB0F2C6050
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 08:08:48 +0100 (CET)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiXs6-0004y5-NV
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 02:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kiXql-00046R-Ah
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:07:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kiXqi-0003eD-HR
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606460838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pbzuf+Q+BYijmcSR/hAyiEjQP096mEWOiqOa9tQEMIM=;
 b=L03Bym3ko1ONELGXf8sLn20XdtQIIgzsrCfyW76iDkC5oOURRJQFxDjrseiksYgXsWTe6H
 7r6Na+iMf2O8eFrgA/QdAadAMHxxh7N9hzy4vulpRVb/x79hTbu2KIMJWzdBGDlYlkuGmF
 A9Ty9NHJbUDzE/S0H/RHzJ3JbTxGIrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-OIdL3hdJMLq88rV_tgOLDw-1; Fri, 27 Nov 2020 02:07:15 -0500
X-MC-Unique: OIdL3hdJMLq88rV_tgOLDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07B0110919ED
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 07:07:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8040760862;
 Fri, 27 Nov 2020 07:07:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 86DCD17532; Fri, 27 Nov 2020 08:07:10 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Fixes 20201127 patches
Date: Fri, 27 Nov 2020 08:07:09 +0100
Message-Id: <20201127070710.8851-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit dd3d2340c4076d1735cd0f7cb61f4d8622b9562d=
:=0D
=0D
  Update version for v5.2.0-rc3 release (2020-11-24 22:13:30 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/fixes-20201127-pull-request=0D
=0D
for you to fetch changes up to 6fc5183a65b59d43441296cd2f72f8e55dc5dd04:=0D
=0D
  qxl: fix segfault (2020-11-25 12:33:21 +0100)=0D
=0D
----------------------------------------------------------------=0D
qxl: fix segfault=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (1):=0D
  qxl: fix segfault=0D
=0D
 ui/console.c | 4 +++-=0D
 1 file changed, 3 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


