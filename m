Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D76D443500
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:01:52 +0100 (CET)
Received: from localhost ([::1]:55034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhy6Z-0005Z4-EW
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy2N-0007pA-GI
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:57:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy2H-0006mI-Rm
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635875843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MakvkKssQxXQbFigVRdfqWA1GqAADcnP0cEJWscYqAs=;
 b=Ypij9tmH60YRQY85uylWnGu1fttLAY0rVQ8ctmwObOik7d2t4hfvB+yV7aKJteUHQLz5eE
 XxgWBZvy4XX6XaCIf6sATWYL604YM0kgQgARQv6hS9itBngOePrvjxv57Z0Sdbbs5u1JUh
 gyevoHatR3/wPeVsr+IyRM3kvcfiGjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-HDaPBh8JMYingyRA03Vl6g-1; Tue, 02 Nov 2021 13:57:20 -0400
X-MC-Unique: HDaPBh8JMYingyRA03Vl6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83A0610055DF;
 Tue,  2 Nov 2021 17:57:19 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA35D19C59;
 Tue,  2 Nov 2021 17:57:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/18] HMP-to-QMP info command patches
Date: Tue,  2 Nov 2021 17:56:42 +0000
Message-Id: <20211102175700.1175996-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 91e8394415f9bc9cd81c02bfafe02012855d4f98=
:=0D
=0D
  Merge remote-tracking branch 'remotes/juanquintela/tags/migration-2021103=
1-pull-request' into staging (2021-11-02 10:07:27 -0400)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/berrange/qemu tags/hmp-x-qmp-620-pull-request=0D
=0D
for you to fetch changes up to b6a7f3e0d28248861cf46f59521129b179e8748d:=0D
=0D
  qapi: introduce x-query-opcount QMP command (2021-11-02 15:57:20 +0000)=
=0D
=0D
----------------------------------------------------------------=0D
Initial conversion of HMP debugging commands to QMP=0D
=0D
This introduces a new policy that all HMP commands will be converted to=0D
have QMP equivalents, marked unstable if no formal QAPI modelling is=0D
intended to be done.=0D
=0D
New unstable commands are added as follows:=0D
=0D
  - HMP "info roms" =3D> QMP "x-query-roms"=0D
  - HMP "info profile" =3D> QMP "x-query-profile"=0D
  - HMP "info numa" =3D> QMP "x-query-numa"=0D
  - HMP "info usb" =3D> QMP "x-query-usb"=0D
  - HMP "info rdma" =3D> QMP "x-query-rdma"=0D
  - HMP "info ramblock" =3D> QMP "x-query-ramblock"=0D
  - HMP "info irq" =3D> QMP "x-query-irq"=0D
  - HMP "info jit" =3D> QMP "x-query-jit"=0D
  - HMP "info opcount" =3D> QMP "x-query-opcount"=0D
=0D
----------------------------------------------------------------=0D
=0D
Daniel P. Berrang=C3=A9 (18):=0D
  monitor: remove 'info ioapic' HMP command=0D
  monitor: make hmp_handle_error return a boolean=0D
  docs/devel: rename file for writing monitor commands=0D
  docs/devel: tweak headings in monitor command docs=0D
  docs/devel: update error handling guidance for HMP commands=0D
  monitor: introduce HumanReadableText and HMP support=0D
  docs/devel: document expectations for QAPI data modelling for QMP=0D
  docs/devel: add example of command returning unstructured text=0D
  docs/devel: document expectations for HMP commands in the future=0D
  qapi: introduce x-query-roms QMP command=0D
  qapi: introduce x-query-profile QMP command=0D
  qapi: introduce x-query-numa QMP command=0D
  qapi: introduce x-query-usb QMP command=0D
  qapi: introduce x-query-rdma QMP command=0D
  qapi: introduce x-query-ramblock QMP command=0D
  qapi: introduce x-query-irq QMP command=0D
  qapi: introduce x-query-jit QMP command=0D
  qapi: introduce x-query-opcount QMP command=0D
=0D
 accel/tcg/cpu-exec.c                          |  51 +++++-=0D
 accel/tcg/hmp.c                               |  22 +--=0D
 accel/tcg/translate-all.c                     |  84 +++++----=0D
 docs/devel/index.rst                          |   2 +-=0D
 ...mands.rst =3D> writing-monitor-commands.rst} | 167 ++++++++++++++++--=
=0D
 hmp-commands-info.hx                          |  29 +--=0D
 hw/core/loader.c                              |  39 ++--=0D
 hw/core/machine-hmp-cmds.c                    |  38 +---=0D
 hw/core/machine-qmp-cmds.c                    |  40 +++++=0D
 hw/rdma/rdma_rm.c                             | 104 +++++------=0D
 hw/rdma/rdma_rm.h                             |   2 +-=0D
 hw/rdma/vmw/pvrdma_main.c                     |  31 ++--=0D
 hw/usb/bus.c                                  |  24 ++-=0D
 include/exec/cpu-all.h                        |   6 +-=0D
 include/exec/ramlist.h                        |   2 +-=0D
 include/hw/rdma/rdma.h                        |   2 +-=0D
 include/monitor/hmp-target.h                  |   1 -=0D
 include/monitor/hmp.h                         |   5 +-=0D
 include/monitor/monitor.h                     |   2 +=0D
 include/qapi/type-helpers.h                   |  14 ++=0D
 include/tcg/tcg.h                             |   4 +-=0D
 monitor/hmp-cmds.c                            |  99 ++---------=0D
 monitor/hmp.c                                 |  32 +++-=0D
 monitor/misc.c                                |  46 ++---=0D
 monitor/monitor-internal.h                    |   7 +=0D
 monitor/qmp-cmds.c                            | 116 ++++++++++++=0D
 qapi/common.json                              |  11 ++=0D
 qapi/machine.json                             | 110 ++++++++++++=0D
 qapi/meson.build                              |   3 +=0D
 qapi/qapi-type-helpers.c                      |  23 +++=0D
 softmmu/physmem.c                             |  19 +-=0D
 stubs/usb-dev-stub.c                          |   8 +=0D
 target/i386/monitor.c                         |   6 -=0D
 tcg/tcg.c                                     |  98 +++++-----=0D
 tests/qtest/qmp-cmd-test.c                    |   8 +=0D
 35 files changed, 829 insertions(+), 426 deletions(-)=0D
 rename docs/devel/{writing-qmp-commands.rst =3D> writing-monitor-commands.=
rst} (75%)=0D
 create mode 100644 include/qapi/type-helpers.h=0D
 create mode 100644 qapi/qapi-type-helpers.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


