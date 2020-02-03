Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41F215064F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 13:44:01 +0100 (CET)
Received: from localhost ([::1]:39406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyb56-00050m-RX
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 07:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56514)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iyazn-0004Hr-So
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:38:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iyazm-0005yB-W2
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:38:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36298
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iyazm-0005xZ-S0
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580733510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=np1mN3DW35IWZEkuFyN8DHqAYmknUGCbOR5Hn3+rgZk=;
 b=QQCP/RSIrqfwGczPm427xB8If9QuBWRDgIIlaDFDLE0TqG4a3uPfU1uW+0/qd/AP7Rfd24
 j16kv4w8a8NHone5nRIwrP4fe4unxnSMgfSFtjthFOkCzxKxFhFE402SZL78x8jZTPgQsS
 zymVfA3p3bQtaQ3jCO96XLdvqRxjCnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-oQxDr_sLPF-AK36bKV--5w-1; Mon, 03 Feb 2020 07:38:28 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53C66800D41;
 Mon,  3 Feb 2020 12:38:27 +0000 (UTC)
Received: from thuth.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8424261070;
 Mon,  3 Feb 2020 12:38:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/13] hw/bt: Remove empty Kconfig file
Date: Mon,  3 Feb 2020 13:38:06 +0100
Message-Id: <20200203123811.8651-9-thuth@redhat.com>
In-Reply-To: <20200203123811.8651-1-thuth@redhat.com>
References: <20200203123811.8651-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: oQxDr_sLPF-AK36bKV--5w-1
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

While removing the bluetooth code some weeks ago, I had to leave the
hw/bt/Kconfig file around. Otherwise some of the builds would have been
broken since the generated dependency files tried to include it before
they were rebuilt. Meanwhile, all those dependency files should have
been updated, so we can remove the empty Kconfig file now, too.

Message-Id: <20200123064525.6935-1-thuth@redhat.com>
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


