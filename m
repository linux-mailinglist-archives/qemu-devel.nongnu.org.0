Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BDE39E092
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 17:33:44 +0200 (CEST)
Received: from localhost ([::1]:36560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHG3-0002jE-6Z
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 11:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqHEn-0000kC-ET
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:32:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqHEl-0002GD-8R
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623079942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FSS5LwaFSNmdHy9M80wjaIcp3zDmDrZJvXf5a/Pel3U=;
 b=OfZq/yJ8uY7W9BMPmjy7LPCt6MgrLZ9+u827xP3y8FXLOrf7s53plRRUQlHme6iiFXOVx2
 xwdhsk8eYLyPyk8UiG1D80kiB73iX5S/R6LfByuS/HxeXeLLOhcJBAfVomjfJokv/5Co/n
 lc04asQUiAJ1nFnYIpBhKLLVUjxlfeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-c8NPGLNQO2umhHNkdboC2w-1; Mon, 07 Jun 2021 11:32:03 -0400
X-MC-Unique: c8NPGLNQO2umhHNkdboC2w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F07859F92B;
 Mon,  7 Jun 2021 15:32:00 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90CB65D9D3;
 Mon,  7 Jun 2021 15:31:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] Gitlab: Add issue templates
Date: Mon,  7 Jun 2021 11:31:53 -0400
Message-Id: <20210607153155.1760158-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
(It's outdated a bit for V4, but you get the idea.)=0D
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
V4:=0D
 - Change the "build on master" to be more of a nudge than a mandate,=0D
   with improved instructions (stefanha, danpb)=0D
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
 .gitlab/issue_templates/bug.md             | 64 ++++++++++++++++++++++=0D
 .gitlab/issue_templates/feature_request.md | 32 +++++++++++=0D
 2 files changed, 96 insertions(+)=0D
 create mode 100644 .gitlab/issue_templates/bug.md=0D
 create mode 100644 .gitlab/issue_templates/feature_request.md=0D
=0D
--=20=0D
2.31.1=0D
=0D


