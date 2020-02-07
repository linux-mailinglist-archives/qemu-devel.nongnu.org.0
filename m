Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361F115606B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 22:03:10 +0100 (CET)
Received: from localhost ([::1]:35236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j0AmL-0005bl-9s
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 16:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1j0Akr-0004Ph-N7
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 16:01:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1j0Akq-0004ir-NJ
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 16:01:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25892
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1j0Akq-0004hj-JQ
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 16:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581109296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ooiF9hai3+OtANbpPHqnZuVbKZsVntA59H5XV2y+HoA=;
 b=Nm4bf9/NCUEJkT/q0OG00uaaAQiQMnRIt22yvXjVHgf2cycy0KjdXYKCn5lUBYHo3evyC2
 iPYDHsiejASIocYS556Z1CruLuRjDdRx9pKwJUHhon2Eg8www6RujYAyhSZ9OWT8WSuZjl
 kWWzTjDZubR6XpXqLNi1WBYszN2suzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-OGbYLCmFN4i7TaADYkBL5w-1; Fri, 07 Feb 2020 16:01:29 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75D5618FF666;
 Fri,  7 Feb 2020 21:01:28 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
 (virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CF6860BF7;
 Fri,  7 Feb 2020 21:01:25 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] Travis: Fix YAML warnings
Date: Fri,  7 Feb 2020 16:01:23 -0500
Message-Id: <20200207210124.141119-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: OGbYLCmFN4i7TaADYkBL5w-1
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
Cc: fam@euphon.net, philmd@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My Travis configuration for QEMU [1] is debug-enabled, and
in the Web UI it shows some warnings for the YAML file (e.g. see
[2]).

Copy/paste the .travis.yml file into [3] to see the warnings.

This series get rid of those warnings.

[1] https://travis-ci.org/wainersm/qemu
[2] https://travis-ci.org/wainersm/qemu/builds/647461515/config
[3] https://config.travis-ci.com/explore

Wainer dos Santos Moschetta (1):
  travis.yml: Fix Travis YAML configuration warnings

 .travis.yml | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

--=20
2.24.1


