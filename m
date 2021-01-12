Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B510B2F37B0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:53:59 +0100 (CET)
Received: from localhost ([::1]:59946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNri-0005c2-P9
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kzNax-0003ef-8E
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:36:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kzNat-0003yH-P5
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610472994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gBudWHChTBaJFq49EEYlAbW0H49RGq8FOG1p0A7I3mg=;
 b=ZJ2L2wMevCEw/wvjn3cWTpdvTknZ/e5qazZXqUlJpyiHQxHD3WkBEaWJWx4R2oKMToTrb3
 dEV3xqcpyUMrFo+cxjFQvFC2ej7lAv1KwYpXgTu29r6sKmN+s7IyT0Eza7QpMda2kEaGbG
 mFcRiMhtw1ignb8QDDnzKOw94bMqQqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-AHjZ4uXZMCi1WknouowgQA-1; Tue, 12 Jan 2021 12:36:30 -0500
X-MC-Unique: AHjZ4uXZMCi1WknouowgQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41FB3190A7A0;
 Tue, 12 Jan 2021 17:36:29 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-194.ams2.redhat.com [10.36.115.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F0E75D9CD;
 Tue, 12 Jan 2021 17:36:27 +0000 (UTC)
Date: Tue, 12 Jan 2021 18:36:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 08/11] iotests: add testenv.py
Message-ID: <20210112173626.GC6075@merkur.fritz.box>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-9-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210109122631.167314-9-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Add TestEnv class, which will handle test environment in a new python
> iotests running framework.
> 
> Difference with current ./check interface:
> - -v (verbose) option dropped, as it is unused
> 
> - -xdiff option is dropped, until somebody complains that it is needed
> - same for -n option
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

+************* Module testenv
+testenv.py:48:0: R0902: Too many instance attributes (34/7) (too-many-instance-attributes)
+testenv.py:212:16: R1722: Consider using sys.exit() (consider-using-sys-exit)
+testenv.py:214:16: R1722: Consider using sys.exit() (consider-using-sys-exit)
+testenv.py:324:8: R1722: Consider using sys.exit() (consider-using-sys-exit)
+testenv.py:1:0: R0801: Similar lines in 2 files
+==findtests:45
+==testenv:72
+    _argparser = None
+    @classmethod
+    def get_argparser(cls) -> argparse.ArgumentParser:
+        if cls._argparser is not None:
+            return cls._argparser
+ (duplicate-code)
+testenv.py:294: error: Function is missing a type annotation for one or more arguments

I wonder whether we should just disable the "similar lines" check? The
instance attributes one looks kind of arbitrary, too. The rest looks
valid enough.

Kevin


