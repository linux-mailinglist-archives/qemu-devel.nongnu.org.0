Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB302D6A98
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 23:51:38 +0100 (CET)
Received: from localhost ([::1]:48408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knUmf-0003J6-89
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 17:51:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knUdz-0007iV-Az
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 17:42:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knUdp-0001tG-GX
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 17:42:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607640148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z57dRgmPVWkWFSKXds7qr53VZi/uWquVqvn6W2XOjIY=;
 b=Say/W3S37M2CHRP4531/cUfLJAJSHo0sGo3TN10K2ZsbzBY+gkkbZfXmNNL9xxN5tPluo/
 /x1JfFtx7gFMEoMmKian17BaX6S2iDJL8lqdOA1bSe0/CGzxgjrPLa6yb8szECvtvL33PB
 78ut2pnawVwh/oy+zIIDvkPIgXtaEko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-1bZp1JdKP3qJ7Y-RX2ifqQ-1; Thu, 10 Dec 2020 17:42:15 -0500
X-MC-Unique: 1bZp1JdKP3qJ7Y-RX2ifqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7B7F800D55;
 Thu, 10 Dec 2020 22:42:13 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 895F060BF1;
 Thu, 10 Dec 2020 22:42:13 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/3] Machine and x86 queue, 2020-12-10
Date: Thu, 10 Dec 2020 17:42:09 -0500
Message-Id: <20201210224212.2052368-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2ecfc0657afa5d29a373271b342f704a1a3c6737=
:=0D
=0D
  Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2020-12-10' i=
nto staging (2020-12-10 17:01:05 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/ehabkost/qemu.git tags/machine-next-pull-request=0D
=0D
for you to fetch changes up to d1615ea575b08fc96aeeb2630c40c5e51364b95c:=0D
=0D
  i386/cpu: Make the Intel PT LIP feature configurable (2020-12-10 17:33:23=
 -0500)=0D
=0D
----------------------------------------------------------------=0D
Machine queue, 2020-12-10=0D
=0D
Some patches that were queued after 5.2 soft freeze.=0D
=0D
----------------------------------------------------------------=0D
=0D
Ani Sinha (1):=0D
  qom: code hardening - have bound checking while looping with integer=0D
    value=0D
=0D
Luwei Kang (1):=0D
  i386/cpu: Make the Intel PT LIP feature configurable=0D
=0D
Tobin Feldman-Fitzthum (1):=0D
  sev: add sev-inject-launch-secret=0D
=0D
 qapi/misc-target.json     | 18 +++++++++++=0D
 include/monitor/monitor.h |  3 ++=0D
 include/sysemu/sev.h      |  2 ++=0D
 target/i386/cpu.h         |  4 +++=0D
 monitor/misc.c            | 17 +++++++---=0D
 qom/object.c              |  5 +--=0D
 target/i386/cpu.c         | 31 ++++++++++++++++++-=0D
 target/i386/monitor.c     |  7 +++++=0D
 target/i386/sev-stub.c    |  5 +++=0D
 target/i386/sev.c         | 65 +++++++++++++++++++++++++++++++++++++++=0D
 target/i386/trace-events  |  1 +=0D
 11 files changed, 151 insertions(+), 7 deletions(-)=0D
=0D
--=20=0D
2.28.0=0D
=0D


