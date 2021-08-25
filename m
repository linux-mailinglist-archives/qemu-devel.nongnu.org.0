Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71883F719E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 11:21:57 +0200 (CEST)
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIp6a-0001bv-IL
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 05:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIp5L-0000ES-Ri
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:20:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIp5I-0004Df-Dq
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629883234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=166YygCoOtJURIibomf2On5IumRRd/7fW4IPiHvRD6Q=;
 b=PhK+Q0mA4HlSJQXROGBII7JDrrInXVGxzN78zlPhJgAhHmsZ78g6/GcST76BlOOSdgUFtK
 tQqotoAa36xZaDjkiZz49VTFltPt8RQs3Jz3G8hE7DijHSyUFa+AqngRVNoHbVKMYzVTWT
 WVC5AOZDSJFGhdf7hx7yyJOVD+aqfJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-DCW4kXZZOUSO035mesb1nw-1; Wed, 25 Aug 2021 05:20:33 -0400
X-MC-Unique: DCW4kXZZOUSO035mesb1nw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B9431082922
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 09:20:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A91E60CC4;
 Wed, 25 Aug 2021 09:20:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 0/3] softmmu/vl: Deprecate old and crufty display ui options
Date: Wed, 25 Aug 2021 11:20:20 +0200
Message-Id: <20210825092023.81396-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-display sdl uses a hand-crafted parser in vl.c, which is quite ugly
since the other parts of -display have been QAPIfied already. A straight
conversion to QAPI is not advisable since the "alt_grab" and "ctrl_grab"
parameters are not the best solution anyway. So this patch series
introduces a new "grab-mod" parameter as replacement instead and then
deprecates the old and crufty options.

While we're at it, the third patch also suggests to deprecated the
old -sdl and -curses top-level options.

v2:
 - Update version numbers to 6.2
 - Added Acked-bys from Peter Krempa

Thomas Huth (3):
  softmmu/vl: Add a "grab-mod" parameter to the -display sdl option
  softmmu/vl: Deprecate the old grab options
  softmmu/vl: Deprecate the -sdl and -curses option

 docs/about/deprecated.rst | 20 ++++++++++++++++++++
 qemu-options.hx           | 18 +++++++++++++-----
 softmmu/vl.c              | 24 +++++++++++++++++++++---
 3 files changed, 54 insertions(+), 8 deletions(-)

-- 
2.27.0


