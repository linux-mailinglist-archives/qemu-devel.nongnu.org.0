Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD853E0B64
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 02:49:59 +0200 (CEST)
Received: from localhost ([::1]:38730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBRaA-0001MF-64
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 20:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBRZ9-0008Ot-ES
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 20:48:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBRZ6-00021p-Ga
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 20:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628124530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DVA2XZFMctGlaYWVaIZPHw/2eCgDOu9Ra7Lhasrugkk=;
 b=jWLXf+bElpvy32GGIbi7xlizYa+a69/ebUbX//joUGQnDLkJVyuwn8841VYFkrCechyurH
 Sjw4HZFw/JCgtfuMT4piByydNsU0FzGmcNVDlJXOUgEzPmfiQCGBcVst/HzOFwQ0VUuD8L
 wW6pVNqQy6w/1I5n3uYh7L1H6APAEyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-Ri9A9T60PC2r8PGpTGfpYQ-1; Wed, 04 Aug 2021 20:48:47 -0400
X-MC-Unique: Ri9A9T60PC2r8PGpTGfpYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 183B21084F5B;
 Thu,  5 Aug 2021 00:48:46 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBA085FC23;
 Thu,  5 Aug 2021 00:48:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] docs/sphinx: change default `role` to "any"
Date: Wed,  4 Aug 2021 20:48:35 -0400
Message-Id: <20210805004837.1775306-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first patch that I've been carrying for quite a while got real small=0D
recently ... Apologies to Peter Maydell who re-did all that work.=0D
=0D
John Snow (2):=0D
  docs: remove non-reference uses of single backticks=0D
  docs/sphinx: change default role to "any"=0D
=0D
 docs/conf.py                           |  3 +++=0D
 docs/devel/fuzzing.rst                 | 10 ++++++----=0D
 docs/interop/live-block-operations.rst |  2 +-=0D
 docs/system/guest-loader.rst           |  2 +-=0D
 qapi/block-core.json                   |  4 ++--=0D
 include/qemu/module.h                  |  6 +++---=0D
 6 files changed, 16 insertions(+), 11 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


