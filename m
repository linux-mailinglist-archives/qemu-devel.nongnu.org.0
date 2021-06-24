Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C343D3B2A70
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:34:16 +0200 (CEST)
Received: from localhost ([::1]:53904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKoR-0005oG-Ph
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKnD-0003y7-89
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:32:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKn9-00017o-TY
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624523574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JnRAVqEhTS9wndRhtlFe4eR9fplYoTKXqOUjzyfiEpI=;
 b=Q6l2vZWL2EgZtVji8WuG2IKu3mlgYKy4TdDk1DQBjy3MIxGoC5se3vBGV8Nk9OHSqm8LCy
 8m66VkIN/eLKkkBGfoGBR8HqCfXkrwTsP1/g9QFQ9zduEJDdgXPc0nOknbBSTnZzrwiqHj
 Dx2/FdVQbq7H6Om3Pex/tkkEyrwZA1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-yj6E8K3kN-ysvjFyyCmdvA-1; Thu, 24 Jun 2021 04:32:53 -0400
X-MC-Unique: yj6E8K3kN-ysvjFyyCmdvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D44A100A44D;
 Thu, 24 Jun 2021 08:32:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BFB860916;
 Thu, 24 Jun 2021 08:32:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EE9F4180060E; Thu, 24 Jun 2021 10:32:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Ui 20210624 patches
Date: Thu, 24 Jun 2021 10:32:41 +0200
Message-Id: <20210624083246.2297440-1-kraxel@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit b22726abdfa54592d6ad88f65b0297c0e8b363e2=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pul=
l-request' into staging (2021-06-22 16:07:53 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/ui-20210624-pull-request=0D
=0D
for you to fetch changes up to 66c2207fd28a6025792fbb75151ee848b911dc35:=0D
=0D
  ui: Make the DisplayType enum entries conditional (2021-06-23 14:42:30 +0=
200)=0D
=0D
----------------------------------------------------------------=0D
ui: better cocoa integration (ui info + clipboard).=0D
ui: add lang1+lang2 keys, fixes, doc updates.=0D
=0D
----------------------------------------------------------------=0D
=0D
Ahmed Abouzied (1):=0D
  Add display suboptions to man pages=0D
=0D
Akihiko Odaki (3):=0D
  ui/cocoa: Set UI information=0D
  ui/cocoa: Add clipboard support=0D
  input: Add lang1 and lang2 to QKeyCode=0D
=0D
Thomas Huth (1):=0D
  ui: Make the DisplayType enum entries conditional=0D
=0D
 include/ui/clipboard.h |   2 +-=0D
 softmmu/vl.c           |  20 +++++-=0D
 ui/clipboard.c         |   2 +-=0D
 ui/console.c           |   8 ++-=0D
 qapi/ui.json           |  29 ++++++--=0D
 qemu-options.hx        |  35 ++++-----=0D
 ui/cocoa.m             | 158 +++++++++++++++++++++++++++++++++++++++++=0D
 7 files changed, 224 insertions(+), 30 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


