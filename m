Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31D73996D6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 02:13:21 +0200 (CEST)
Received: from localhost ([::1]:41070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loazB-0006OB-1m
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 20:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loaxf-0003dG-V9
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:11:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loaxb-0003bQ-6O
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622679101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JJf+lynczRzMJ53KIf4/ocqq+aN2ZKt6e4w+1JlLClk=;
 b=OiWdKoni2IS4ROjEUGBTw7hwBDdg43vCaJxaLLxKB0ZAJAkozfsNbYsmSvrd5M7hcb819g
 wSz/Ppg85fsKlzw4lpLUWj4V5DBdYKe8+45bPNzWLSdjsRMb9tpm2npdBeB1U5iEwGiCDQ
 4j/Og0lFm5sAOH6hpH0tNxNG3xz4Wwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-nb9AITXpOWGCeCRe9raYXQ-1; Wed, 02 Jun 2021 20:11:38 -0400
X-MC-Unique: nb9AITXpOWGCeCRe9raYXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51EA61020C41;
 Thu,  3 Jun 2021 00:11:37 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DA6C1383F;
 Thu,  3 Jun 2021 00:11:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] Gitlab: Add issue templates
Date: Wed,  2 Jun 2021 20:11:27 -0400
Message-Id: <20210603001129.1319515-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add "Bug" and "Feature Request" templates to the Gitlab interface to=0D
help improve the quality of newly reported issues.=0D
=0D
To see what this looks like, I've temporarily allowed my Gitlab fork to=0D
diverge with these files merged.  See my fork's "new issue" page to see=0D
it in action: https://gitlab.com/jsnow/qemu/-/issues/new?issue=0D
=0D
These patches do not add a "default" template, the user still has to=0D
select one from the list. I recommend that someone with permissions=0D
updates the default template:=0D
=0D
1. https://gitlab.com/qemu-project/qemu/edit=0D
2. ctrl+f "Default description template for issues"=0D
3. Update the default to the (suggested) below:=0D
=0D
```=0D
<!-- Select "Type: Issue" and choose one of the Description templates above=
. -->=0D
```=0D
=0D
We can use this cover letter to discuss/review the wording on that=0D
default template which exists outside of repository data.=0D
=0D
V3:=0D
 - Add pointer to https://www.qemu.org/download/#source=0D
 - Add pointer to https://www.qemu.org/contribute/security-process/=0D
 - Remove blurb covering tracing instructions.=0D
=0D
V2:=0D
- Updated both templates based on feedback from Peter, Daniel, and=0D
  Thomas.=0D
=0D
John Snow (2):=0D
  GitLab: Add "Bug" issue reporting template=0D
  GitLab: Add "Feature Request" issue template.=0D
=0D
 .gitlab/issue_templates/bug.md             | 63 ++++++++++++++++++++++=0D
 .gitlab/issue_templates/feature_request.md | 32 +++++++++++=0D
 2 files changed, 95 insertions(+)=0D
 create mode 100644 .gitlab/issue_templates/bug.md=0D
 create mode 100644 .gitlab/issue_templates/feature_request.md=0D
=0D
--=20=0D
2.31.1=0D
=0D


