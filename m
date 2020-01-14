Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D742413A4B8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 10:58:19 +0100 (CET)
Received: from localhost ([::1]:35682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irIxm-0004kF-FU
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 04:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58712)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1irIXO-0002ik-MK
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:31:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1irIXM-0007Pk-Mx
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:31:02 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59452
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1irIXM-0007Pd-Jp
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OeY3eZ5SoQOLYuQipI2aR3Mi+pmvPxk459AovKzoYoE=;
 b=EvXlqpj3mtFGlIrlyQECHOo8cfEKHN7k4klbd57PIGT7s/2UqA4buPKq/WX3aBJSZqd8rZ
 MRrChbAHiQkw7rqgsyGjPH/w90mfSZpYTxiSOsrkV4pwDPRPuSRxTIRFNS2zpW8We1Ipm/
 jlJck+d+4ZaqV0SLTLnLF2tgi/d1FbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-he30hZd-NFWQf66SV3EsBg-1; Tue, 14 Jan 2020 04:30:57 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25FFBDBE5;
 Tue, 14 Jan 2020 09:30:56 +0000 (UTC)
Received: from localhost (unknown [10.36.118.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C2E019756;
 Tue, 14 Jan 2020 09:30:53 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Block patches
Date: Tue, 14 Jan 2020 09:30:51 +0000
Message-Id: <20200114093052.117848-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: he30hZd-NFWQf66SV3EsBg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit dc65a5bdc9fa543690a775b50d4ffbeb22c56d6d=
:

  Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-5.0-20200108' =
into staging (2020-01-10 16:15:04 +0000)

are available in the Git repository at:

  https://github.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to 2558cb8dd4150512bc8ae6d505cdcd10d0cc46bb:

  linux-aio: increasing MAX_EVENTS to a larger hardcoded value (2020-01-13 =
16:41:45 +0000)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

Wangyong (1):
  linux-aio: increasing MAX_EVENTS to a larger hardcoded value

 block/linux-aio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.24.1


