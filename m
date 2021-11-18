Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCD5456484
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 21:51:15 +0100 (CET)
Received: from localhost ([::1]:55120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnoNG-0001Xk-TE
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 15:51:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnoIf-0001nf-HN
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 15:46:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnoIc-0000Lc-Ol
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 15:46:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637268385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iz1LLhiyEAWniKSw6F1GAlqhS0n5hvzYwGMFddNm6aA=;
 b=dGvalQLUq8QiBlkbfnCY60qj4IUyjJOUUZV1ESZwKeswvDTmEcuNBRK7lX+oTv3IryOA3j
 rFSPQGZh4P1UFywmmoaAqDDPFCt5zA329R3B1PI23MLPtI33XPC5ncLYJKpKPKTfVkemkw
 O74bVvJbysClTCyTp9mANPFiPk5TJpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-X2YSmOr9NeeAiIKwKTxQxA-1; Thu, 18 Nov 2021 15:46:23 -0500
X-MC-Unique: X2YSmOr9NeeAiIKwKTxQxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36EA21006AA0
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 20:46:22 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.18.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 808A7604CC;
 Thu, 18 Nov 2021 20:46:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] python: More fixes for 6.2
Date: Thu, 18 Nov 2021 15:46:13 -0500
Message-Id: <20211118204620.1897674-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/pipelines/412040104=0D
=0D
Patch 5 fixes a race condition in machine.py exposed by device-crash-test.=
=0D
Patch 6 fixes a hang in device-crash-test.=0D
Patch 7 fixes send_fd_scm in AQMP under Python 3.6.=0D
=0D
Patches 1-3 provide a minor concurrency fix that happened to get fixed=0D
on my way to fixing the above three.=0D
Patch 4 is just a trivial style thing.=0D
=0D
With this, device-crash-test should be back to producing only strictly=0D
relevant output.=0D
=0D
John Snow (7):=0D
  python/machine: add @sock_dir property=0D
  python/machine: remove _remove_monitor_sockfile property=0D
  python/machine: add instance disambiguator to default nickname=0D
  python/machine: move more variable initializations to _pre_launch=0D
  python/machine: handle "fast" QEMU terminations=0D
  scripts/device-crash-test: Use a QMP timeout=0D
  python/aqmp: fix send_fd_scm for python 3.6.x=0D
=0D
 python/qemu/aqmp/qmp_client.py |  9 ++++--=0D
 python/qemu/machine/machine.py | 59 ++++++++++++++++++++--------------=0D
 scripts/device-crash-test      |  2 +-=0D
 3 files changed, 42 insertions(+), 28 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


