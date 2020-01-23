Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BED4146226
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 07:47:10 +0100 (CET)
Received: from localhost ([::1]:51838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuWGj-0000A1-5x
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 01:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iuWFG-0007sH-FW
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 01:45:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iuWFD-0007hc-LB
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 01:45:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56176
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iuWFC-0007Uz-Bl
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 01:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579761933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wa/wOvDKIKjfYFWPzA0F93y0kOqKY3rHPjDTfSCfC/0=;
 b=dAey8bcY085+o8R0WQYa9xBc0BrzyUnmAgOT6XRUULhHiRIForzigLQYlAVmF6mhxv96DT
 zEGHukce4fdjH+shisDd5JBy9hk2a9limSBIYERIz2NitzJNMDCshrwn7n1/cvtx0/MX6B
 kyhKsr/R2Ss9QosNfwJODhdDg6vovso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-D8-5FDHYN5WNhSjUDK-JKw-1; Thu, 23 Jan 2020 01:45:30 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E90E010054E3;
 Thu, 23 Jan 2020 06:45:29 +0000 (UTC)
Received: from thuth.com (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17DE686448;
 Thu, 23 Jan 2020 06:45:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/bt: Remove empty Kconfig file
Date: Thu, 23 Jan 2020 07:45:25 +0100
Message-Id: <20200123064525.6935-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: D8-5FDHYN5WNhSjUDK-JKw-1
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While removing the bluetooth code some weeks ago, I had to leave the
hw/bt/Kconfig file around. Otherwise some of the builds would have been
broken since the generated dependency files tried to include it before
they were rebuilt. Meanwhile, all those dependency files should have
been updated, so we can remove the empty Kconfig file now, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/bt/Kconfig | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 hw/bt/Kconfig

diff --git a/hw/bt/Kconfig b/hw/bt/Kconfig
deleted file mode 100644
index e69de29bb2..0000000000
--=20
2.18.1


