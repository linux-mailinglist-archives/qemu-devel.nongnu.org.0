Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973AA2B782F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:11:02 +0100 (CET)
Received: from localhost ([::1]:47492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfIYO-0002I0-CU
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kfIWm-0001Rt-Qh
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:09:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kfIWj-0001lo-St
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605686956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2aSv3V+nzQlRcJOpu4DvBCFL9Hkoy3FCHDhFeALmjHY=;
 b=Z9q8+Jqu98BdGRllcDaAub4sc6/pGJnFxdVSelUYOIM8fOwXOH3jZfZBQSEmW3oDpZ6kg6
 JwlIY+pMai3s/I9uLI97x1vWYN+uZ7+0jmkG1m3/QW9x1MhFkxrI3LS0+N0x9ux7VF/G8G
 /pF8GSg604ssq/5ZCfUAe2tXYZgZ1p4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-8j9nPEVXN82Auf7qwCyoaA-1; Wed, 18 Nov 2020 03:09:14 -0500
X-MC-Unique: 8j9nPEVXN82Auf7qwCyoaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AD6E802B71
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 08:09:13 +0000 (UTC)
Received: from localhost (unknown [10.36.110.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5BE91002393;
 Wed, 18 Nov 2020 08:09:05 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] libvhost-user: lower dependency on QEMU headers
Date: Wed, 18 Nov 2020 12:09:00 +0400
Message-Id: <20201118080902.30033-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 armbru@redhat.com, stefanha@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
libvhost-user is meant to be free of glib dependency, and easily=0D
copyable/reusable outside of QEMU. Clean-up some dependencies that crept in=
=0D
recently (the one remaining is qemu/atomic.h, from which a subset is used)=
=0D
=0D
Marc-Andr=C3=A9 Lureau (2):=0D
  libvhost-user: replace qemu/bswap.h with glibc endian.h=0D
  libvhost-user: replace qemu/memfd.h usage=0D
=0D
 contrib/libvhost-user/libvhost-user.c | 127 +++++++++++++++++---------=0D
 1 file changed, 83 insertions(+), 44 deletions(-)=0D
=0D
--=20=0D
2.29.0=0D
=0D


