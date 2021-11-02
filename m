Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD284435FE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:48:01 +0100 (CET)
Received: from localhost ([::1]:55256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhypE-0005Fx-J2
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhyle-0001l0-Ny
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:44:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhyld-0003kZ-13
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635878654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ke/apnUj6ltcvK88wrBZRr2HeoDo6T6P8MBaI3Hata4=;
 b=gd+fvoPuAm2uOcTWYHI5U4i/ORtKqALgc46l4dXgp6Wck+JAr4doEkya7v8i/wvhdVz/V3
 iZo0MKnhfpxVVwlP8jdeqMgW89ZHo1i9ow86sWXhvB7Fh8TELCcY7yMMSrHLP0mqTeNPOM
 O8JRisyJsCNhyEJspdBND8RXSDK+UV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-cwOPeDilM2ulBzv86LCrZg-1; Tue, 02 Nov 2021 14:44:11 -0400
X-MC-Unique: cwOPeDilM2ulBzv86LCrZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87EC61B18BC0;
 Tue,  2 Nov 2021 18:44:09 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5453519C59;
 Tue,  2 Nov 2021 18:44:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/4] docs/sphinx: change default `role` to "any"
Date: Tue,  2 Nov 2021 14:43:56 -0400
Message-Id: <20211102184400.1168508-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Alexander Bulekov <alxndr@bu.edu>, Eric Blake <eblake@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Patches 1-3 can be squashed on merge, I just found it easier to tack on=0D
new changes as part of the rebase so that reviewers can easily see=0D
what's new each time.)=0D
=0D
V5: Rebased=0D
V4: Rebased=0D
V3: Removed bad rebase confetti=0D
    fixed the OSS-Fuzz link to ... actually be a link.=0D
=0D
--js=0D
=0D
John Snow (4):=0D
  docs: remove non-reference uses of single backticks=0D
  docs: (further) remove non-reference uses of single backticks=0D
  docs: (further further) remove non-reference uses of single backticks=0D
  docs/sphinx: change default role to "any"=0D
=0D
 docs/conf.py                           |  5 +++++=0D
 docs/devel/build-system.rst            | 21 +++++++++++----------=0D
 docs/devel/fuzzing.rst                 |  9 +++++----=0D
 docs/devel/tcg-plugins.rst             |  2 +-=0D
 docs/interop/live-block-operations.rst |  2 +-=0D
 docs/system/guest-loader.rst           |  2 +-=0D
 docs/system/i386/sgx.rst               |  6 +++---=0D
 qapi/block-core.json                   |  4 ++--=0D
 include/qemu/module.h                  |  6 +++---=0D
 qemu-options.hx                        |  4 ++--=0D
 10 files changed, 34 insertions(+), 27 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


