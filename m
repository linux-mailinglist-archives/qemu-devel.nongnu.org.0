Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C244445770D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 20:34:36 +0100 (CET)
Received: from localhost ([::1]:53724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo9ed-0003rT-9u
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 14:34:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mo9bi-0001sx-T4
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:31:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mo9be-0007zJ-9E
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637350287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jIwu1S+HkDwi/wqszRota7ElgoZCATZ9ZI1XUd/7mZs=;
 b=YjuFSqddbB2Xpd13C+QqWmW4CSna/8Yts4lqKLKm1jVXAIOou04NnvXNMEBdTKNvx1XjTZ
 qEpcfnbZl6JtZ7lnv+iH5B+8NLqfTrfgrON/CkhMy8Vjb/aJCG4AgaF09BZS5G5Ab8pyKo
 gWCzxd/jO0mwszh6eEpaOQ6OiHgDBlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-6UucOa_tOza5vWEaCWRELA-1; Fri, 19 Nov 2021 14:31:26 -0500
X-MC-Unique: 6UucOa_tOza5vWEaCWRELA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A94361019983;
 Fri, 19 Nov 2021 19:31:25 +0000 (UTC)
Received: from paraplu.home (unknown [10.39.192.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97A3F1972E;
 Fri, 19 Nov 2021 19:31:19 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fix broken rST conversion of "submitting-a-patch.rst"
Date: Fri, 19 Nov 2021 20:31:16 +0100
Message-Id: <20211119193118.949698-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9=20?= <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I completely botched up the merged[0] rST conversion of this document by=0D
accidentally dropping entire hunks (!) of text. :-(  I made it very hard=0D
for reviewers to spot it, as the omitted text was buried deep in the=0D
document.  To fix my hatchet job, I reconverted the "SubmitAPatch"=0D
wiki[1] page from scratch and replaced the existing rST with it, while=0D
making sure I incorporated previous feedback.  Sorry for the sloppiness.=0D
=0D
More details in patch-1.=0D
=0D
[0] https://gitlab.com/qemu-project/qemu/-/commit/9f73de8df033=0D
=0D
Kashyap Chamarthy (2):=0D
  docs: Fix botched rST conversion of 'submitting-a-patch.rst'=0D
  docs: List more commit-message tags "in submitting-a-patch"=0D
=0D
 docs/devel/submitting-a-patch.rst | 202 ++++++++++++++++++++++--------=0D
 1 file changed, 153 insertions(+), 49 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


