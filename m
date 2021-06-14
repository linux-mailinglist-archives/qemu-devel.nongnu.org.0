Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6CB3A68D5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:18:31 +0200 (CEST)
Received: from localhost ([::1]:52422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnQ6-000641-FT
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsnNk-0002jv-HE
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsnNi-0007ax-Lj
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623680161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/B8slJ4s9iceoh8JjkfcX3A/+P/5Iitx2JHY6oN3ymA=;
 b=Uvp+N3c7DGwqPJsC8awOe4owHvLPq/azm0MCRhNJckodtL4V4GVrKm2A2NapH0HQL+te6A
 hfHRf+onZUqLuWzgfd6bUd91MW18DPZ6e7qRWXBddWeOwdBgsVPhlUISCo4LsHVvpTO9ZO
 S2GD00Bj/EU7vD5aRmAaf8ACxBjC3P8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-z-_HqVYaMsavC886xOUzag-1; Mon, 14 Jun 2021 10:15:58 -0400
X-MC-Unique: z-_HqVYaMsavC886xOUzag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B7348015C6;
 Mon, 14 Jun 2021 14:15:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-55.ams2.redhat.com
 [10.36.115.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD8CE19C46;
 Mon, 14 Jun 2021 14:15:50 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] Misc fixes patches
Date: Mon, 14 Jun 2021 15:15:36 +0100
Message-Id: <20210614141549.100410-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 894fc4fd670aaf04a67dc7507739f914ff4bacf2=
:=0D
=0D
  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' int=
o staging (2021-06-11 09:21:48 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/berrange/qemu tags/misc-fixes-pull-request=0D
=0D
for you to fetch changes up to 970bc16f60937bcfd334f14c614bd4407c247961:=0D
=0D
  usb/dev-mtp: use GDateTime for formatting timestamp for objects (2021-06-=
14 13:28:50 +0100)=0D
=0D
----------------------------------------------------------------=0D
Merge misc patches=0D
=0D
 - Add documentation of secrets passing=0D
 - Add documentation of authorization framework=0D
 - Modernize SASL documentation=0D
 - Improve tracing of block/migration interaction=0D
 - Use GDateTime for timestamp formatting=0D
=0D
----------------------------------------------------------------=0D
=0D
Daniel P. Berrang=C3=A9 (13):=0D
  docs: add table of contents to QAPI references=0D
  docs: document how to pass secret data to QEMU=0D
  docs: document usage of the authorization framework=0D
  docs: recommend SCRAM-SHA-256 SASL mech instead of SHA-1 variant=0D
  sasl: remove comment about obsolete kerberos versions=0D
  migration: add trace point when vm_stop_force_state fails=0D
  softmmu: add trace point when bdrv_flush_all fails=0D
  block: preserve errno from fdatasync failures=0D
  block: add trace point when fdatasync fails=0D
  block: remove duplicate trace.h include=0D
  migration: use GDateTime for formatting timestamp in snapshot names=0D
  block: use GDateTime for formatting timestamp when dumping snapshot=0D
    info=0D
  usb/dev-mtp: use GDateTime for formatting timestamp for objects=0D
=0D
 block/file-posix.c                           |  10 +-=0D
 block/qapi.c                                 |  11 +-=0D
 block/trace-events                           |   1 +=0D
 docs/interop/qemu-ga-ref.rst                 |   3 +=0D
 docs/interop/qemu-qmp-ref.rst                |   3 +=0D
 docs/interop/qemu-storage-daemon-qmp-ref.rst |   3 +=0D
 docs/system/authz.rst                        | 263 +++++++++++++++++++=0D
 docs/system/index.rst                        |   2 +=0D
 docs/system/secrets.rst                      | 162 ++++++++++++=0D
 docs/system/vnc-security.rst                 |   7 +-=0D
 hw/usb/dev-mtp.c                             |   9 +-=0D
 migration/migration.c                        |   1 +=0D
 migration/savevm.c                           |  13 +-=0D
 migration/trace-events                       |   1 +=0D
 qemu.sasl                                    |  15 +-=0D
 softmmu/cpus.c                               |   7 +-=0D
 softmmu/trace-events                         |   3 +=0D
 17 files changed, 475 insertions(+), 39 deletions(-)=0D
 create mode 100644 docs/system/authz.rst=0D
 create mode 100644 docs/system/secrets.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


