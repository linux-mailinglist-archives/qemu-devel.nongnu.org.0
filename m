Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A28013A496
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 10:56:07 +0100 (CET)
Received: from localhost ([::1]:35626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irIve-0001lJ-EY
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 04:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58239)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1irIVs-0000Ki-QC
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:29:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1irIVr-0006x0-KJ
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:29:28 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29414
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1irIVr-0006wo-Gh
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FUnX6nm58uSiXz/k03L2wtjACMFk0lN4FuY8uDF6ic0=;
 b=AL9B70CluxezE/XDr0i/ZrkEgSOz4cfMYrMRYtIeJxsQx9en7HcZXiPmIXh6JVGZj27tjV
 BrGwJDtKF8eGDjkyhtOZoROqXog60Z8OKGbhKjkwEShy3wFq072pem4eToBoGr2eRmJeLb
 f2PRIk8PiAlU7uU8vjzSKPV3oK/tNAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-5_3IA9NlPti7wlfIwqxlBA-1; Tue, 14 Jan 2020 04:29:23 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B635810054E3;
 Tue, 14 Jan 2020 09:29:22 +0000 (UTC)
Received: from localhost (unknown [10.36.118.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DC1B60BF7;
 Tue, 14 Jan 2020 09:29:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Tracing patches
Date: Tue, 14 Jan 2020 09:29:17 +0000
Message-Id: <20200114092918.117399-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 5_3IA9NlPti7wlfIwqxlBA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit dc65a5bdc9fa543690a775b50d4ffbeb22c56d6d=
:

  Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-5.0-20200108' =
into staging (2020-01-10 16:15:04 +0000)

are available in the Git repository at:

  https://github.com/stefanha/qemu.git tags/tracing-pull-request

for you to fetch changes up to 3f0097169bb60268cc5dda0c5ea47c31ab57b22f:

  trace: update qemu-trace-stap to Python 3 (2020-01-13 16:42:20 +0000)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

Stefan Hajnoczi (1):
  trace: update qemu-trace-stap to Python 3

 scripts/qemu-trace-stap | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--=20
2.24.1


