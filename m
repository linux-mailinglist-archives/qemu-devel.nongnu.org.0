Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862BB300871
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 17:18:24 +0100 (CET)
Received: from localhost ([::1]:49548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2z8h-00037U-EU
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 11:18:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2z6w-0002UV-5u
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2z6r-0004t2-Kf
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611332186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k4aQq+zSxUhJjY0CX1QjXKe9Ilt+mRu8pdI7oTlZhZU=;
 b=Mnvgw5hrEd1d9NyM5RHXFz47nyyjxsAXxdLNEyaH0wJ97mk3R/XkqhJUidGumS0T+apMRw
 IiaKtoku0dX7uHGTrH+InYf471PyVBoTUpUwB92Y6rokMFev4N9nz97xNeIEqEA2QAkpDV
 5vK/qI0ECzYFUJNrmQAPZY6/fZEB5bg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-TWnFF0tGM3ilA6kjTAqm1g-1; Fri, 22 Jan 2021 11:16:23 -0500
X-MC-Unique: TWnFF0tGM3ilA6kjTAqm1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D88DB8144E3;
 Fri, 22 Jan 2021 16:16:21 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33927100AE3F;
 Fri, 22 Jan 2021 16:16:20 +0000 (UTC)
Date: Fri, 22 Jan 2021 17:16:18 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 00/11] Rework iotests/check
Message-ID: <20210122161618.GK15866@merkur.fritz.box>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210116134424.82867-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> These series has 3 goals:
> 
>  - get rid of group file (to forget about rebase and in-list conflicts)
>  - introduce human-readable names for tests
>  - rewrite check into python
> 
> v7:
>   - fix wording and grammar
>   - satisfy python linters
>   - move argv interfaces all into one in new check script
>   - support '-n' == '--dry-run' option
>   - update check-block to run check with correct PYTHON

Okay, I think I'm finished with the review for this version.

I also tried pylint/mypy again and it's mostly clean now (pylint
complains about the TODO comments, I think we should just disable that
warning).

Feel free to include the following as patch 12 in v8.

Kevin


diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 85bc1c0c85..8aaa3e455c 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -31,13 +31,15 @@ if ! type -p "mypy" > /dev/null; then
     _notrun "mypy not found"
 fi

-pylint-3 --score=n iotests.py
+FILES="findtests.py iotests.py testenv.py testrunner.py check"
+
+pylint-3 --score=n $FILES

 MYPYPATH=../../python/ mypy --warn-unused-configs --disallow-subclassing-any \
     --disallow-any-generics --disallow-incomplete-defs \
     --disallow-untyped-decorators --no-implicit-optional \
     --warn-redundant-casts --warn-unused-ignores \
-    --no-implicit-reexport iotests.py
+    --no-implicit-reexport $FILES

 # success, all done
 echo "*** done"
diff --git a/tests/qemu-iotests/297.out b/tests/qemu-iotests/297.out
index 6acc843649..85213ef96e 100644
--- a/tests/qemu-iotests/297.out
+++ b/tests/qemu-iotests/297.out
@@ -1,3 +1,3 @@
 QA output created by 297
-Success: no issues found in 1 source file
+Success: no issues found in 5 source files
 *** done
diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
index cd3702e23c..980bfa7b20 100644
--- a/tests/qemu-iotests/pylintrc
+++ b/tests/qemu-iotests/pylintrc
@@ -9,7 +9,8 @@
 # --enable=similarities". If you want to run only the classes checker, but have
 # no Warning level messages displayed, use "--disable=all --enable=classes
 # --disable=W".
-disable=invalid-name,
+disable=fixme,
+        invalid-name,
         no-else-return,
         too-few-public-methods,
         too-many-arguments,


