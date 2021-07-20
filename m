Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4943D05F0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:58:20 +0200 (CEST)
Received: from localhost ([::1]:54254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zcx-0003VC-E5
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5zbD-0001TS-EN
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:56:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5zbA-0007RE-E9
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626825386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lScd01gP/GYmkFtNEgb3jnyWElpceRSsT8dBfixns6Y=;
 b=DiXaCTDoah3En9ggFvLq4JXe66JYEIcLXyyqLgKwqVr29Fp2wCL6JrGUhOi9Buku3uHRol
 ylLXFq92a5T2QsPEtUnUFFsG1ZrmmrP8k+oVNY0LyQbkbXfmhdEH9Ds4KFjoOfJ6C2ITXg
 nodrDcE6YaJrpYAiGWvBJEpaRwfetLc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-KBcU4EYYMtKgHiwZbHCOqg-1; Tue, 20 Jul 2021 19:56:25 -0400
X-MC-Unique: KBcU4EYYMtKgHiwZbHCOqg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1018C100B3AC;
 Tue, 20 Jul 2021 23:56:24 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-193.rdu2.redhat.com [10.10.119.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 079675C1CF;
 Tue, 20 Jul 2021 23:56:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] docs: convert qapi-code-gen.txt to qapi-code-gen.rst
Date: Tue, 20 Jul 2021 19:56:16 -0400
Message-Id: <20210720235619.2048797-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch 1 does (roughly) the bare minimum, patch 2 adds some formatting,=0D
and patch 3 adds cross-references.=0D
=0D
John Snow (3):=0D
  docs: convert qapi-code-gen.txt to ReST=0D
  docs/qapi-code-gen: Beautify formatting=0D
  docs/qapi-code-gen: add cross-references=0D
=0D
 docs/devel/index.rst                          |   1 +=0D
 .../{qapi-code-gen.txt =3D> qapi-code-gen.rst}  | 800 ++++++++++--------=
=0D
 2 files changed, 441 insertions(+), 360 deletions(-)=0D
 rename docs/devel/{qapi-code-gen.txt =3D> qapi-code-gen.rst} (76%)=0D
=0D
--=20=0D
2.31.1=0D
=0D


