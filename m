Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8194039FE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:36:54 +0200 (CEST)
Received: from localhost ([::1]:42970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwou-0007X2-Ql
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNwgg-0007w3-3r
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNwgd-0003ru-KZ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631104099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hFGZAoJ2TiDqy/5eihaxOx9iM3KvWq6AXavgN5u5kDc=;
 b=AF3h8iFTRlg8W8q+1biAsMYd2CRy5+z1P9KKxPLoR172vXgGgVaWU05dFu9RGQr7X08uqF
 SVn6McBh4oQTz3PjsyO5jcS7GeCBGotMMzxiSlrMDr0TyyApQudJ0rzENMYcFpXzOlxtNl
 V00pFGXyIp7gWrg2TDmEFdG2W4odCxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-I-9JZ0gmMxiRD0sFcXEQwg-1; Wed, 08 Sep 2021 08:28:17 -0400
X-MC-Unique: I-9JZ0gmMxiRD0sFcXEQwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C8C0DF8A3
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 12:28:16 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FA4060C04;
 Wed,  8 Sep 2021 12:28:14 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH 0/6] Small header/footer layout changes
Date: Wed,  8 Sep 2021 13:28:08 +0100
Message-Id: <20210908122814.707744-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I previously sent a large series to more fully re-design the=0D
website, especially the front page=0D
=0D
  https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg08205.html=0D
=0D
Paolo had some feedback on that which I want to take into account=0D
but playing with CSS / layout always takes me way too long. I=0D
figured it could still be beneficial to take some of the simpler=0D
patches in that series.=0D
=0D
So essentially this small series is the part of that large series=0D
that changes the header and footer. The changes to the front page=0D
body content are cut out until I can get them working better.=0D
=0D
In a slight change from the previous posting for the "edit page"=0D
link at the bottom, I've now used an icon to represent it and=0D
moved its position, such that the layout is more visually=0D
pleasant.=0D
=0D
The slight downside with only taking the header/footer changes=0D
is that some of the links I removed from the footer, would have=0D
been added in the page body of the front page instead. I think=0D
that's probably ok not to have them regardless though, as they=0D
are just a single jump away in an obvious place from the navbar=0D
header.=0D
=0D
Daniel P. Berrang=C3=A9 (6):=0D
  Compress the two front page headings into one=0D
  Simplify copyright and integrate into footer=0D
  Put a full SFC membership blurb in footer of every page=0D
  Move wiki link from footer into the header navbar=0D
  Simplify and restructure the page footer=0D
  Add link to "page source" for all pages=0D
=0D
 _includes/copyright.html     |   8 -----=0D
 _includes/footer.html        |  33 +++++++-----------=0D
 _includes/nav.html           |   1 +=0D
 _layouts/blog.html           |   1 -=0D
 _layouts/home.html           |   1 -=0D
 _layouts/page.html           |   1 -=0D
 assets/css/style-desktop.css |  21 +-----------=0D
 assets/css/style-mobile.css  |  22 +-----------=0D
 assets/css/style.css         |  63 ++++++++++++++++++++++-------------=0D
 assets/images/edit-page.png  | Bin 0 -> 4997 bytes=0D
 index.html                   |   8 +----=0D
 11 files changed, 56 insertions(+), 103 deletions(-)=0D
 delete mode 100644 _includes/copyright.html=0D
 create mode 100644 assets/images/edit-page.png=0D
=0D
--=20=0D
2.31.1=0D
=0D


