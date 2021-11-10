Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D8344C368
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 15:52:52 +0100 (CET)
Received: from localhost ([::1]:59946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkoy2-0002ut-R4
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 09:52:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mkouc-0000Qr-E5
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 09:49:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mkouY-0007Om-Ko
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 09:49:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636555753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8kV83NXgFHz3XLH059cbtEsqu4Rw929bcOrWsJLYSow=;
 b=WgPKr4WFiJHCtjHl5OCwSw5i1dESkanosBmjwQvMa2MV8gDi9gCFp8zuhfpYcCf4aO4EsT
 i2EU98sluqcpsVVgFaUB3lzpqtHn7iUv/8mRyc8WJ9P6PhTQI65bqR1nwwAZ8kjSloAtWS
 NQFlWFF44gHCVouBVjqlM0lPeqxwK4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-HQ0ET3sNOISUeXvNSFyLew-1; Wed, 10 Nov 2021 09:49:08 -0500
X-MC-Unique: HQ0ET3sNOISUeXvNSFyLew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41C851927811;
 Wed, 10 Nov 2021 14:49:07 +0000 (UTC)
Received: from paraplu.lan (unknown [10.39.195.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2D5467C64;
 Wed, 10 Nov 2021 14:49:03 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] rSTify contribution-related wiki pages
Date: Wed, 10 Nov 2021 15:48:59 +0100
Message-Id: <20211110144902.388183-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9=20?= <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Eric Blake <eblake@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
  - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches=0D
=0D
[1] https://wiki.qemu.org/Contribute/SubmitAPatch=0D
=0D
I built with `configure --target-list=3Dx86_64-softmmu --enable-docs &&=0D
make -j8`, and verified there isn't any breakage in the rendered docs.=0D
=0D
                * * *=0D
Changes in v3:=0D
=0D
- Update index entry as part of each individual rST conversion patch=0D
  [PeterM]=0D
- Drop the SpellCheck rST [PeterM]=0D
- Drop the KeySigning rST [ThomasH]=0D
- Drop mjt's Git repo from trivial-patches.rst [LaurentV]=0D
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
Kashyap Chamarthy (3):=0D
  docs: rSTify the "TrivialPatches" wiki=0D
  docs: rSTify the "SubmitAPullRequest" wiki=0D
  docs: rSTify the "SubmitAPatch" wiki=0D
=0D
 docs/devel/index.rst                     |   3 +=0D
 docs/devel/submitting-a-patch.rst        | 456 +++++++++++++++++++++++=0D
 docs/devel/submitting-a-pull-request.rst |  76 ++++=0D
 docs/devel/trivial-patches.rst           |  50 +++=0D
 4 files changed, 585 insertions(+)=0D
 create mode 100644 docs/devel/submitting-a-patch.rst=0D
 create mode 100644 docs/devel/submitting-a-pull-request.rst=0D
 create mode 100644 docs/devel/trivial-patches.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


