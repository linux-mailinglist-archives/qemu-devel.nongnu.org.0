Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723301A0D0A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 13:46:45 +0200 (CEST)
Received: from localhost ([::1]:45802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLmgm-0005Ma-ER
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 07:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jLmfY-0003k3-St
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 07:45:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jLmfX-0008Hd-UH
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 07:45:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21432
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jLmfX-0008HM-Pe
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 07:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586259927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GHSzR4cIlflxNeGofat89HgS8O658Ve8Kv4W9C+9vS0=;
 b=XXHlgnGiTSjRL/4gNuwGm0zr8eXyx6c8Q9yjauqdva4R2xd7TohqhSZmYB8acCZuNuXYnI
 GMd+yg7kw3zGtkEvk2gPAWWltCp83gwfSpNzi5ff65/BZKvl01VLonhOnzmJy5QyNN9Dip
 fHoaHsnIuJ1NsTx7SNytLn73s7e88TY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-nenMcm11OPS0SbuKVj-FRw-1; Tue, 07 Apr 2020 07:45:25 -0400
X-MC-Unique: nenMcm11OPS0SbuKVj-FRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4CF28017F5
 for <qemu-devel@nongnu.org>; Tue,  7 Apr 2020 11:45:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D855E244
 for <qemu-devel@nongnu.org>; Tue,  7 Apr 2020 11:45:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3AC0211385C8; Tue,  7 Apr 2020 13:45:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] QAPI patches for 2020-04-07
Date: Tue,  7 Apr 2020 13:45:22 +0200
Message-Id: <20200407114523.27583-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 53ef8a92eb04ee19640f5aad3bff36cd4a36c250=
:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200=
406' into staging (2020-04-06 12:36:45 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2020-04-07

for you to fetch changes up to 1394dc0690e7a1514bd6594322d5a2105e881769:

  json: Fix check for unbalanced right curly brace (2020-04-07 13:10:11 +02=
00)

----------------------------------------------------------------
QAPI patches for 2020-04-07

----------------------------------------------------------------
Simran Singhal (1):
      json: Fix check for unbalanced right curly brace

 qobject/json-streamer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.21.1


