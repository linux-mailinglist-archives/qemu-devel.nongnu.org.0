Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17609346312
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:38:51 +0100 (CET)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOj7K-0006VU-3Z
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lOj59-0004ba-4k
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lOj51-0002zd-Fm
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616513785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ElDE0e7H/7b0C2Ek6QT3JphJn80RjrMVQMDBjgEHH8A=;
 b=CXYNfRsecdSuOsAV24gO4R8UvUcKf7euwqRklhL1yXd1hgZTE/K+fEhyOBCLcvsOnAuJHr
 rNBiUWEXnAEsUumvTXgI6NYz0jbBEHY8i+JRveU1NaJKVEvbWG4uMBXBC+CYqs9k5BAXzV
 kh3LvLCoC1mnivYjTn6kkm6JLWiUp8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-YRuDCyAdPhqSL9tMDfPhXw-1; Tue, 23 Mar 2021 11:36:23 -0400
X-MC-Unique: YRuDCyAdPhqSL9tMDfPhXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB5975B37E
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 15:36:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F85819705;
 Tue, 23 Mar 2021 15:36:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DB2EB18000A7; Tue, 23 Mar 2021 16:36:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Ui 20210323 patches
Date: Tue, 23 Mar 2021 16:36:11 +0100
Message-Id: <20210323153616.873822-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c95bd5ff1660883d15ad6e0005e4c8571604f51a=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd/tags/mips-fixes-20210322' in=
to=3D=0D
 staging (2021-03-22 14:26:13 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/ui-20210323-pull-request=0D
=0D
for you to fetch changes up to 40c503079ffcb5394be2b407e817de6104db9cfc:=0D
=0D
  edid: prefer standard timings (2021-03-23 12:37:13 +0100)=0D
=0D
----------------------------------------------------------------=0D
fixes for 6.0=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (1):=0D
  edid: prefer standard timings=0D
=0D
Peter Maydell (1):=0D
  include/ui/console.h: Delete is_surface_bgr()=0D
=0D
Zihao Chang (3):=0D
  crypto: add reload for QCryptoTLSCredsClass=0D
  vnc: support reload x509 certificates for vnc=0D
  qmp: add new qmp display-reload=0D
=0D
 include/crypto/tlscreds.h  |  8 +++--=0D
 include/ui/console.h       | 11 +------=0D
 crypto/tlscredsx509.c      | 48 ++++++++++++++++++++++++++++++=0D
 hw/display/edid-generate.c | 15 +++++-----=0D
 monitor/qmp-cmds.c         | 17 +++++++++++=0D
 ui/vnc.c                   | 28 +++++++++++++++++=0D
 qapi/ui.json               | 61 ++++++++++++++++++++++++++++++++++++++=0D
 7 files changed, 168 insertions(+), 20 deletions(-)=0D
=0D
--=3D20=0D
2.30.2=0D
=0D


