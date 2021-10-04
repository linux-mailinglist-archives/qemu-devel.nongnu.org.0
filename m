Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7D742197A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:54:12 +0200 (CEST)
Received: from localhost ([::1]:45030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVuV-0002rw-BO
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXVtC-0001QB-H7
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:52:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXVt8-0002OT-MP
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633384364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9SDbX+RiVmBo3pgplbjoeU1tydDBnoRfWRnYk7coPdU=;
 b=JeatGhXJVcFQICWSGoy47DL97dYZcgA6Mc5ljw2goDCdJwsFkgRWArfrWXO3vxTUEl5893
 yQnyH+zg9wlJ5kFGNFMgPbf9okD004ONta8COrsNZglNa1rymCV3eqB7nR3JTy9AHY68g+
 DKIGVPlncUe8Hjpj8uUeO1Qh4BHBfh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-jSxWB5kaNPSQsRo-h5vG1g-1; Mon, 04 Oct 2021 17:52:43 -0400
X-MC-Unique: jSxWB5kaNPSQsRo-h5vG1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D15A9108468C;
 Mon,  4 Oct 2021 21:52:41 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DF7619C59;
 Mon,  4 Oct 2021 21:52:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] docs/sphinx: change default `role` to "any"
Date: Mon,  4 Oct 2021 17:52:35 -0400
Message-Id: <20211004215238.1523082-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 John Snow <jsnow@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V4: Fixed more occurrences that have occurred since V3.=0D
=0D
V3: Removed bad rebase confetti=0D
    fixed the OSS-Fuzz link to ... actually be a link.=0D
=0D
(Patch 2 can be squashed into patch 1 on merge, but this keeps the diff=0D
easy to see and review.)=0D
=0D
--js=0D
=0D
John Snow (3):=0D
  docs: remove non-reference uses of single backticks=0D
  docs: (further) remove non-reference uses of single backticks=0D
  docs/sphinx: change default role to "any"=0D
=0D
 docs/conf.py                           | 5 +++++=0D
 docs/devel/fuzzing.rst                 | 9 +++++----=0D
 docs/devel/tcg-plugins.rst             | 2 +-=0D
 docs/interop/live-block-operations.rst | 2 +-=0D
 docs/system/guest-loader.rst           | 2 +-=0D
 docs/system/i386/sgx.rst               | 6 +++---=0D
 qapi/block-core.json                   | 4 ++--=0D
 include/qemu/module.h                  | 6 +++---=0D
 qemu-options.hx                        | 4 ++--=0D
 9 files changed, 23 insertions(+), 17 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


