Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AF8F72DD
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 12:14:53 +0100 (CET)
Received: from localhost ([::1]:51088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iU7el-0007Aw-Ri
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 06:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55660)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iU7dz-0006fK-BZ
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 06:14:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iU7dx-0007P5-4C
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 06:14:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37593
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iU7dw-0007ON-PJ
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 06:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573470840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+xVuvsGLHbZ/y0u4VhFKM5FhlE7stS16FGq3Y9x4/Y=;
 b=SK/Jhy/rfTUlMJJEngjIzIYXp3mjMJGItonL4L8bAY4wEmMiC15uFeu/OD1ORfBgIvnmTE
 NwboDBNKuH5KtiRR0pydI6z9QS3iVRbcQztj8m9pbJKrPM6svnW9ZPWdBeaIj+zb8Y9bfQ
 AN6ywg4QKn4hVlI8Meacawd+9t7qWqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-rggnj2TcPiC4dak3UtLtzg-1; Mon, 11 Nov 2019 06:13:59 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC71B1800D63;
 Mon, 11 Nov 2019 11:13:57 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-79.ams2.redhat.com [10.36.117.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D61B65D72C;
 Mon, 11 Nov 2019 11:13:48 +0000 (UTC)
Date: Mon, 11 Nov 2019 12:13:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 05/15] stubs: add stubs for io_uring interface
Message-ID: <20191111111347.GC7297@linux.fritz.box>
References: <20191025160444.31632-1-stefanha@redhat.com>
 <20191025160444.31632-6-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191025160444.31632-6-stefanha@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: rggnj2TcPiC4dak3UtLtzg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Fam Zheng <fam@euphon.net>, oleksandr@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.10.2019 um 18:04 hat Stefan Hajnoczi geschrieben:
> From: Aarushi Mehta <mehta.aaru20@gmail.com>
>=20
> Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

This commit message needs to answer at least where these stubs are
actually used. Aren't all callers protected with #ifdef
CONFIG_LINUX_IO_URING? (And if they aren't, why is abort() okay?)

Kevin


