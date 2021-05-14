Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC6E380E6F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:50:47 +0200 (CEST)
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhb1S-0004s7-B0
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawQ-0005JJ-9N
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawE-0005lo-Oy
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/78rbBxYW+ucMniz8qEn+tN/sttjPaqfiYZtHHDtF0Y=;
 b=Rlwf0xJMINekeCrnjMNWvJFYKc83mdQPt0BcoJjZnII9anO9Mjc/rkoczmSraHfHV9gFs9
 is6N3IEFEq4kZJE5FB/+53wAVWKD/lPv5GWpbL0tAWO05N9bh7p33ltpQv0kdpmvkF2p77
 Ldke7pGZYf4h8TguaROPkbDcZblI/zI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-jV3w5fe3MRamX-2K7J7ZXg-1; Fri, 14 May 2021 12:45:19 -0400
X-MC-Unique: jV3w5fe3MRamX-2K7J7ZXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 838DD803620;
 Fri, 14 May 2021 16:45:18 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B0415D6D1;
 Fri, 14 May 2021 16:45:18 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/19] iotests/231: Update expected deprecation message
Date: Fri, 14 May 2021 18:44:56 +0200
Message-Id: <20210514164514.1057680-2-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Connor Kuehl <ckuehl@redhat.com>

The deprecation message in the expected output has technically been
wrong since the wrong version of a patch was applied to it. Because of
this, the test fails. Correct the expected output so that it passes.

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20210421212343.85524-2-ckuehl@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/231.out | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/231.out b/tests/qemu-iotests/231.out
index 579ba11c16..747dd221bb 100644
--- a/tests/qemu-iotests/231.out
+++ b/tests/qemu-iotests/231.out
@@ -1,9 +1,7 @@
 QA output created by 231
-qemu-img: RBD options encoded in the filename as keyvalue pairs is deprecated.  Future versions may cease to parse these options in the future.
+qemu-img: warning: RBD options encoded in the filename as keyvalue pairs is deprecated
 unable to get monitor info from DNS SRV with service name: ceph-mon
-no monitors specified to connect to.
 qemu-img: Could not open 'json:{'file.driver':'rbd','file.filename':'rbd:rbd/bogus:conf=BOGUS_CONF'}': error connecting: No such file or directory
 unable to get monitor info from DNS SRV with service name: ceph-mon
-no monitors specified to connect to.
 qemu-img: Could not open 'json:{'file.driver':'rbd','file.pool':'rbd','file.image':'bogus','file.conf':'BOGUS_CONF'}': error connecting: No such file or directory
 *** done
-- 
2.31.1


