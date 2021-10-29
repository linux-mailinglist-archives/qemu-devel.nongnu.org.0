Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBEB440309
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:21:05 +0200 (CEST)
Received: from localhost ([::1]:43870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXR2-0003WX-Gq
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mgXEt-0001Hv-63
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:08:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mgXEo-0004uH-3g
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635534504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d7x66euueHVlH0XPVE262gqkIN3RqO8SJXfLSMHm0Ew=;
 b=Goy5G+x5Kt1gEhZ/9rtdVAdy8Qe6MX+HWoev0TB3Lnl7r2OeClaWO9FHHp3Nf0ntSSaE+x
 0+1VgVBAUNgtbt3pEWU/GVSEWXkj2Uh+RWUc7aE+F+Tb6Z4EW7ZgQA1+rvq530m14r/Wyh
 nXkkojWc7qPKBa/LHi0Qkjxq5wWtCzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-kUfynGkHN52DQKrA59sEqA-1; Fri, 29 Oct 2021 15:08:21 -0400
X-MC-Unique: kUfynGkHN52DQKrA59sEqA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 165F410A8E03;
 Fri, 29 Oct 2021 19:08:20 +0000 (UTC)
Received: from localhost (unused-10-15-17-6.yyz.redhat.com [10.15.17.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4323260CA1;
 Fri, 29 Oct 2021 19:07:59 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/1] x86 CPU model queue, 2021-10-29
Date: Fri, 29 Oct 2021 15:07:57 -0400
Message-Id: <20211029190758.2021640-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I should have flushed the queue a long time ago.  Apologies for
taking so long.

A single patch, by now.  Probably there are others I missed on
the mailing list, and if necessary I will send another pull
request.

The following changes since commit a92cecba2791cd408d2bca04ce181dc2abaf9695:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20211028' into staging (2021-10-29 08:39:44 -0700)

are available in the Git repository at:

  https://gitlab.com/ehabkost/qemu.git tags/x86-next-pull-request

for you to fetch changes up to 07db29f20a9a845c8408df11936889e5411ff44f:

  target/i386: Remove core-capability in Snowridge CPU model (2021-10-29 15:02:30 -0400)

----------------------------------------------------------------
x86 queue, 2021-10-29

Bug fixes:
* Remove core-capability in Snowridge CPU model

----------------------------------------------------------------

Chenyi Qiang (1):
  target/i386: Remove core-capability in Snowridge CPU model

 target/i386/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.32.0


