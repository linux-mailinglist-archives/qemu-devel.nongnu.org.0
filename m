Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F3508C58
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:43:38 +0200 (CEST)
Received: from localhost ([::1]:37120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCUT-0007OZ-U0
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhCLS-00015e-K7
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhCLR-0000tO-2F
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650468856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4FMT46XyfSvvD0jNnH73nXc22GQRYxzPoPaYUPwY5WE=;
 b=ZofTbf/Zithj/q9L60ZgLCaBvh4mvDboSmXxN9TA+tixJ2QvHz6a08c+mcfzTfDlwIlheq
 /4jshsBzpqYI9FoPThi2Izd7aiaOPgreDyZ8pcVDJ1VwyYxbxH64N3BhE0pmSvICC4lnv2
 z9vVsxVzG8CTCSZORsjm7j9ejSzbNOg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-Z-C-ntofMWKa7mcjl9Buyg-1; Wed, 20 Apr 2022 11:34:13 -0400
X-MC-Unique: Z-C-ntofMWKa7mcjl9Buyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CEE73810D23;
 Wed, 20 Apr 2022 15:34:12 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF8A140D0161;
 Wed, 20 Apr 2022 15:34:10 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] qapi: Random small fixes
Date: Wed, 20 Apr 2022 17:34:05 +0200
Message-Id: <20220420153408.243584-1-abologna@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=0D
=0D
Andrea Bolognani (3):=0D
  docs: qapi: Remove outdated reference to simple unions=0D
  qapi: Fix documentation for query-xen-replication-status=0D
  qapi: Fix typo=0D
=0D
 docs/devel/qapi-code-gen.rst | 4 ++--=0D
 qapi/migration.json          | 2 +-=0D
 qapi/sockets.json            | 2 +-=0D
 3 files changed, 4 insertions(+), 4 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D


