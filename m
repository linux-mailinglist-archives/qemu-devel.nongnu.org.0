Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8D83C1943
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:37:03 +0200 (CEST)
Received: from localhost ([::1]:49726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YtS-0002MK-TG
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1YpO-00052Z-BB
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:32:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1YpL-0001tE-2T
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625769165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KRUtV5Wi4a34TPzyeTVw/QvGisP45sf85tRJ6Y07P50=;
 b=SvqR8JBULYRr8B2xBMk0rVs0me2nOVVY7B0NeNL7yOm/WABVWnPTYXT8pBwBOs8X1GDcEq
 rF6O/qpt1JlfaKtkhWizadBBEDKtSW7MpbBcwqH0p1/k+OT+pL6wk36RJEVGedCaEd093o
 aUguGCMYbqAnBxQSVSM2uYYB37whR/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-hODd61OnNZWDEnSnhSNb3w-1; Thu, 08 Jul 2021 14:32:44 -0400
X-MC-Unique: hODd61OnNZWDEnSnhSNb3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CCE184F224
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 18:32:43 +0000 (UTC)
Received: from worklaptop.home (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F306069281;
 Thu,  8 Jul 2021 18:32:42 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] contrib: qemu-guest-agent.service updates
Date: Thu,  8 Jul 2021 14:31:58 -0400
Message-Id: <cover.1625769000.git.crobinso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series extends qemu-guest-agent.service with some bits that
distros are adding, mostly changes from RHEL that have bubbled up
to Fedora.

Cole Robinson (4):
  contrib: qemu-guest-agent.service: s/BindTo/BindsTo/g
  contrib: qemu-guest-agent.service: Add Documentation= link
  contrib: qemu-guest-agent.service: Don't ignore failure
  contrib: qemu-guest-agent.service: Use IgnoreOnIsolate=True

 contrib/systemd/qemu-guest-agent.service | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.31.1


