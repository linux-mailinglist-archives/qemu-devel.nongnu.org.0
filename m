Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C231612450F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 11:50:48 +0100 (CET)
Received: from localhost ([::1]:52376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihWuj-00080X-Hl
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 05:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38099)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ihWt6-0006df-B6
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:49:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ihWt5-000089-Ev
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:49:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40192
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ihWt5-00006v-Bc
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576666143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=36ShyvxdEy7Py/DU+PfLmOkxx2z1tfYicYAP3nhVk6Q=;
 b=SMBiUraYa4pK60BKZiYdE9YLzwXNgYPRiSyWuUtIYsSFXVpe+2vpZrw2KnsnACVafIRANC
 c4F0YfEV9npsBmFr//qTbL1fNTmf6N0efeMYcfDBEeiu3Yri0Cr1FtFcpUtiSNBDmjJzRM
 jgyZl9w1zYihV7FAtcS1yaU1s3dv7d0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-I3kKXSXkOjqvolF5WGTiMw-1; Wed, 18 Dec 2019 05:48:58 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7CCFDB64;
 Wed, 18 Dec 2019 10:48:57 +0000 (UTC)
Received: from localhost (ovpn-205-177.brq.redhat.com [10.40.205.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B9EF7D8E1;
 Wed, 18 Dec 2019 10:48:57 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] iotests: Minor fixes
Date: Wed, 18 Dec 2019 11:48:53 +0100
Message-Id: <20191218104855.42566-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: I3kKXSXkOjqvolF5WGTiMw-1
X-Mimecast-Spam-Score: 0
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

These are just two minor fixes for things I noticed recently.


Max


Max Reitz (2):
  iotests/273: Filter format-specific information
  iotests: Fix IMGOPTSSYNTAX for nbd

 tests/qemu-iotests/273       |  3 ++-
 tests/qemu-iotests/273.out   | 27 ---------------------------
 tests/qemu-iotests/common.rc |  3 ++-
 3 files changed, 4 insertions(+), 29 deletions(-)

--=20
2.23.0


