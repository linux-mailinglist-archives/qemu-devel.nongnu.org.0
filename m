Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82603674CC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 23:29:30 +0200 (CEST)
Received: from localhost ([::1]:57594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZKPZ-0001iH-KX
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 17:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lZKKH-0006SV-RC
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 17:24:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lZKKF-0008Kq-Ap
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 17:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619040238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kgfSc+fZlI3rsE9qwzpzbzGJGP1E9cy4mRIxo/S/Z8w=;
 b=DXjoJBp0KyT/uHKf+qYFfBm09XG8mkDJa3uqJu+UfkgbGFbYh5e+49QwMWSYOiK+fqcQhx
 4AySTBIh9gZV39V+TE0Ndbvm2ERwc/LXObzlFdBdji/yTnf+63D9RJn2BTIDRHpMF57LX7
 ocbpNzclxVx+rNwpRTf429ov2ePyuzA=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-y8Ih5AhsNqeWSUOPQK79Fg-1; Wed, 21 Apr 2021 17:23:47 -0400
X-MC-Unique: y8Ih5AhsNqeWSUOPQK79Fg-1
Received: by mail-oi1-f200.google.com with SMTP id
 c3-20020a0568081383b029010231e3ec8cso15411647oiw.22
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 14:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kgfSc+fZlI3rsE9qwzpzbzGJGP1E9cy4mRIxo/S/Z8w=;
 b=VPI1SSh7wqAbPFGVKwLKDrQ6+y74+xy0Lpm9BpKM2MMmV5FULO/oVJpxtiar2Yqa8f
 GyAf1+wmMrJSHnx/IealkpaqoyYqjIapKebvX4u80jUoC592VgmFBa0t4kxvkvL38iIT
 n/XOxpEwxtmpdH1IAubrw15yzdWW4hiyMZ4ZSALNMxZ2ViPxM5X1qnxukQlQYl/e8BOt
 ChrMMk3ac3zZ1smM7pm7VC/OKmc/cUH6OluC3m6iU+tHo57E8Xt8jzIKold0nTU/1Aws
 BOSleJjJt2SBekZWP7dJH2YSQ22zJtdp87rvRSifMljNoKjve78ovIZN8ST1iXuUEtvf
 vw3A==
X-Gm-Message-State: AOAM530qjnQYcHF9W87E+daG2g/UI71zkuDqXvYnFRSq+1mm4SI8jTxq
 +C1UH3YuXwv9qeSwwxGNHf5g0IfM34gkS+bkvFPvYDhecAvo9KUxAYIAokLPn7XExFwPAGszQkC
 ELXmPYaZcV2VtbjE=
X-Received: by 2002:aca:4791:: with SMTP id u139mr9133oia.83.1619040226381;
 Wed, 21 Apr 2021 14:23:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhk5laa9dHRXAnCf2ZtYTLAB29gOJt+sdlgifLTrADk0fjqH+zbyUHP4uryny9zibo+6IPiQ==
X-Received: by 2002:aca:4791:: with SMTP id u139mr9128oia.83.1619040226240;
 Wed, 21 Apr 2021 14:23:46 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id n13sm141031otk.61.2021.04.21.14.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 14:23:45 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 1/2] iotests/231: Update expected deprecation message
Date: Wed, 21 Apr 2021 16:23:42 -0500
Message-Id: <20210421212343.85524-2-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210421212343.85524-1-ckuehl@redhat.com>
References: <20210421212343.85524-1-ckuehl@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, sgarzare@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The deprecation message in the expected output has technically been
wrong since the wrong version of a patch was applied to it. Because of
this, the test fails. Correct the expected output so that it passes.

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
---
v3 -> v4:
  * Added Stefano's s-o-b to the commit message

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
2.30.2


