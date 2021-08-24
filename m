Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334EE3F61C8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:37:13 +0200 (CEST)
Received: from localhost ([::1]:48160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYUC-0007tq-85
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIYSr-0005sk-Un
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:35:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIYSo-0004AX-WA
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629819346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vrMv4AwL9rE9R0cBQ6Kbg/vmNzPTsIApau/32pg7Bh4=;
 b=S7B3HHAPVtfdwXFVqMqAG4Zd1DWO5L/KNosF1o38G49GWSDUcgtH7MFRxbyihclj7u+KOK
 jhAZKStQEPuxFbmZlQXujDS+m58oXYnAf7vu9gCLgM6JtQQvn+XZyfkZvM2HfyKIF6XlcO
 bSt86knaqw7NLeDa0syR2TeLFIxsJB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-So1km0y5PlS7x0NfMSpN7Q-1; Tue, 24 Aug 2021 11:35:43 -0400
X-MC-Unique: So1km0y5PlS7x0NfMSpN7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 544BC87180F;
 Tue, 24 Aug 2021 15:35:42 +0000 (UTC)
Received: from localhost (unknown [10.39.192.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED3CA19C44;
 Tue, 24 Aug 2021 15:35:41 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] iotests: Fix pylint warnings
Date: Tue, 24 Aug 2021 17:35:38 +0200
Message-Id: <20210824153540.177128-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I’ve updated my pylint to 2.10.2 and was greeted with some new warnings.
Some are fixed by John’s “Run iotest linters during Python CI” series
(https://lists.nongnu.org/archive/html/qemu-block/2021-07/msg00611.html),
but some are not (namely unspecified-encoding, use-list-literal, and
use-dict-literal).  This series cleans up that rest.


Hanna Reitz (2):
  iotests: Fix unspecified-encoding pylint warnings
  iotests: Fix use-{list,dict}-literal warnings

 tests/qemu-iotests/297        |  2 +-
 tests/qemu-iotests/iotests.py | 12 +++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.31.1


