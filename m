Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E410415D9D4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 15:53:41 +0100 (CET)
Received: from localhost ([::1]:39878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2cLd-0008Re-06
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 09:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41458)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ovoshcha@redhat.com>) id 1j2cKm-0007Kx-CG
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 09:52:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ovoshcha@redhat.com>) id 1j2cKk-0006Ie-HD
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 09:52:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44632
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ovoshcha@redhat.com>) id 1j2cKk-0006Hi-DG
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 09:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581691965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fQtdIbh6i57m7qpToaJfI9yj3OkfteIL48Fe7DILpi0=;
 b=bh53Io7zikY6jCadhIWZqO4gmkRb/YxCHS1KUVNBvJTO80WiIbPzQzbAQTTi9fPu60xmhs
 KuqC3lU3MzFREH8A1+0qerzMPyG250WDhdhR3xWn8udEsArhGJ8Ku6rvs9SRTePRIb4hyq
 GqyCAPZXca23JAxKxpYBMfTz4sFMguQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-XyqV_aO9N3GdEIzES48i0A-1; Fri, 14 Feb 2020 09:52:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA656107ACC7
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 14:52:42 +0000 (UTC)
Received: from kh066.redhat.com (ovpn-117-55.ams2.redhat.com [10.36.117.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72078790D1;
 Fri, 14 Feb 2020 14:52:36 +0000 (UTC)
From: Oksana Vohchana <ovoshcha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/4] Extension of migration tests
Date: Fri, 14 Feb 2020 16:52:31 +0200
Message-Id: <20200214145235.4378-1-ovoshcha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: XyqV_aO9N3GdEIzES48i0A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: philmd@redhat.com, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds a new migration test through RDMA and provides new
functions to it.
The last update by mistake was not provided a full scenario to the EXEC
migration test. One of patch fixed it.

Oksana Vohchana (4):
  Acceptance test: add address as param
  Acceptance test: EXEC migration
  Acceptance test: provides new functions
  Acceptance test: provides to use RDMA transport for migration

 tests/acceptance/migration.py | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

--=20
2.21.1


