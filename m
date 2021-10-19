Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25604331CC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:06:51 +0200 (CEST)
Received: from localhost ([::1]:54864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcl59-0002vG-2C
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcl2S-0000oM-W4
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:04:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcl2Q-0005wO-Ck
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634634240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DsUWeFcFChMJa6xXhSBgxJDJfpTNFw/ReYwmRpZAhbs=;
 b=Pmy9z7S4gt5pJq5TLQ1X0qrsFW0lQJzw7sXPvT667VYPnFCSfdOOjcguhUspflIXzMa1V9
 VwuSSeBPbWjdMb53g98NRrn7tEhgrZ/adFYcie8gNirKHha69EmtRf4/mZ8J3chRAI9YgY
 GGKUS/aqPgyq01NpH1D0UyyXh9h/AMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-Ut2juhzROYCU1OYIFn1SaQ-1; Tue, 19 Oct 2021 05:03:57 -0400
X-MC-Unique: Ut2juhzROYCU1OYIFn1SaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A962410B3944;
 Tue, 19 Oct 2021 09:03:56 +0000 (UTC)
Received: from paraplu.home (unknown [10.39.194.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66BFB70951;
 Tue, 19 Oct 2021 09:03:45 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] rSTify contribution-related wiki pages
Date: Tue, 19 Oct 2021 11:03:38 +0200
Message-Id: <20211019090344.3054300-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
 Kashyap Chamarthy <kchamart@redhat.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My main motivation was to convert SubmitAPatch[1] based on a chat with=0D
Peter Maydell and Dan Berrang=C3=A9 on #qemu channel (on OFTC).  But the pa=
ge=0D
also links to a couple of other contribution-related pages, so I=0D
converted them too:=0D
=0D
  - SubmitAPullRequest: https://wiki.qemu.org/Contribute/SubmitAPullRequest=
=0D
  - KeySigningParty: https://wiki.qemu.org/KeySigningParty=0D
  - SpellCheck: https://wiki.qemu.org/Contribute/SpellCheck=0D
  - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches=0D
=0D
[1] https://wiki.qemu.org/Contribute/SubmitAPatch=0D
=0D
                * * *=0D
=0D
Changes in v2:=0D
=0D
- Consistently use the preferred rST headings: =3D=3D=3D, ---, and ~~~~=0D
  [Paolo]=0D
- Add entries in the devel/toctree.rst [Paolo]=0D
- Clean up the SpellCheck wiki [Peter Maydell]=0D
- In trivial-patches.rst, keep only Laurent as the active maintainer=0D
  [Philippe]=0D
- Convert the wiki SubmitAPullRequest to rST, because this is also=0D
  linked to from the SubmitAPatch wiki page=0D
- Convert the KeySigningParty wiki to rST=0D
- Update the links to point to the rST-generated HTML files, instead of=0D
  wiki=0D
=0D
Kashyap Chamarthy (6):=0D
  docs: rSTify the "TrivialPatches" wiki=0D
  docs: rSTify the "SpellCheck" wiki=0D
  docs: rSTify the "KeySigningParty" wiki=0D
  docs: rSTify the "SubmitAPullRequest" wiki=0D
  docs: rSTify the "SubmitAPatch" wiki=0D
  docs/devel: Update the rST index file=0D
=0D
 docs/devel/index.rst                     |   5 +=0D
 docs/devel/key-signing-party.rst         | 171 +++++++++=0D
 docs/devel/spell-check.rst               |  20 +=0D
 docs/devel/submitting-a-patch.rst        | 460 +++++++++++++++++++++++=0D
 docs/devel/submitting-a-pull-request.rst |  79 ++++=0D
 docs/devel/trivial-patches.rst           |  51 +++=0D
 6 files changed, 786 insertions(+)=0D
 create mode 100644 docs/devel/key-signing-party.rst=0D
 create mode 100644 docs/devel/spell-check.rst=0D
 create mode 100644 docs/devel/submitting-a-patch.rst=0D
 create mode 100644 docs/devel/submitting-a-pull-request.rst=0D
 create mode 100644 docs/devel/trivial-patches.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


