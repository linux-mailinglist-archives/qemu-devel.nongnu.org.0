Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0B9414893
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:15:08 +0200 (CEST)
Received: from localhost ([::1]:35578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT19W-0000eg-10
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mT15j-0005ow-RW
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:11:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mT15g-0007iV-GX
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632312665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+eEDwqNqwCG7LvGFBJpZvNPOR7eJoUh5dX8IC0iVhyY=;
 b=LmCv65XiI8ab3UVjWtS3IgrtgcrIBtDl98Ro3H9ZOvFY+eNjCowIhDjdFq5tksfLVUTb5Y
 Mww47xj7TZgrU5EDXnvtTSZfM2PBZll/lYGRWGIS7pmEhJkoJ07cPYrJjKsaWS94ogfILc
 Ww+PJ3wETCg0xt8h/Ta6Wj8wJC/JZ9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-YIcDCF2QMxieQj3x9RhWQQ-1; Wed, 22 Sep 2021 08:11:02 -0400
X-MC-Unique: YIcDCF2QMxieQj3x9RhWQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFF01100C667;
 Wed, 22 Sep 2021 12:11:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E62D177C0;
 Wed, 22 Sep 2021 12:10:57 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] rSTify SubmitAPatch, TrivialPatches,
 and SpellCheck wiki pages
Date: Wed, 22 Sep 2021 14:10:51 +0200
Message-Id: <20210922121054.1458051-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
 Kashyap Chamarthy <kchamart@redhat.com>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of writing this, qemu.org is down, so I've used a one-month old=0D
copy[1] of the wiki from 27Aug2021 to do the rST conversion.=0D
=0D
My main motivation was to convert SubmitAPatch (when Peter Maydell=0D
pointed out on IRC that it's still on the wiki).  But it links to a=0D
couple more small wiki pages; so I converted them too:=0D
=0D
  - SpellCheck: https://wiki.qemu.org/Contribute/SpellCheck=0D
  - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches=0D
=0D
[1] https://web.archive.org/web/20210827130706/https://wiki.qemu.org/Contri=
bute/SubmitAPatch=0D
=0D
Kashyap Chamarthy (3):=0D
  docs: rSTify the "SpellCheck" wiki=0D
  docs: rSTify the "TrivialPatches" wiki=0D
  docs: rSTify the "SubmitAPatch" wiki=0D
=0D
 docs/devel/spell-check.rst        |  29 ++=0D
 docs/devel/submitting-a-patch.rst | 460 ++++++++++++++++++++++++++++++=0D
 docs/devel/trivial-patches.rst    |  53 ++++=0D
 3 files changed, 542 insertions(+)=0D
 create mode 100644 docs/devel/spell-check.rst=0D
 create mode 100644 docs/devel/submitting-a-patch.rst=0D
 create mode 100644 docs/devel/trivial-patches.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


