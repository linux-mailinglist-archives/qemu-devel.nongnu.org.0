Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5515630277C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:09:55 +0100 (CET)
Received: from localhost ([::1]:59602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44R8-00074E-Du
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l44Pq-00063E-Ot
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:08:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l44Pk-00054N-7J
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611590906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wll6Mf+URSYwsdNiT6pCE5NBwKA5H8AcjsbC1RwHLP0=;
 b=io8+YaMYyjI4kklDoS0CkDvvXPPNAuDOSMBIJOqzbdv62lk140D9absbcEdJjIZw97SGbn
 6SdQZLKDVtYVXj87155EWRJWGKnzMlpGH5cGapXd5eHfg5kzzU5qhqoZTksw7xxlQgukcv
 romlT2zE+0NAmHZKN5fMLRQAOcr7VNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-Lhf7tQjYMvaJfO3dzyX8Og-1; Mon, 25 Jan 2021 11:08:24 -0500
X-MC-Unique: Lhf7tQjYMvaJfO3dzyX8Og-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53C0D190A7A6;
 Mon, 25 Jan 2021 16:08:23 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-150.ams2.redhat.com [10.36.115.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B41356F983;
 Mon, 25 Jan 2021 16:08:21 +0000 (UTC)
Date: Mon, 25 Jan 2021 17:08:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v8 0/5] Rework iotests/check
Message-ID: <20210125160820.GD7107@merkur.fritz.box>
References: <20210123210428.27220-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210123210428.27220-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: qemu-block@nongnu.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.01.2021 um 22:04 hat Vladimir Sementsov-Ogievskiy geschrieben:
> v8:
> 
> about linters:
> 
> I didn't modify 297, as Max already staged 297 modifications to test all files.
> 
> Also, now I have two complains:
> +************* Module testenv
> +testenv.py:158:4: R0915: Too many statements (53/50) (too-many-statements)
> +************* Module testrunner
> +testrunner.py:222:4: R0911: Too many return statements (7/6) (too-many-return-statements)
>  Success: no issues found in 5 source files
> 
> And I feel, I'm tired to refactor it now.. Probably we can ignore them in 297. Probably I can
> do some refactoring as a follow-up.

I don't think these warning are very helpful, I would agree with
disabling them (even globally).

When testing this with the other image formats, I found some problems.

1. The first one probably means that we have changed the order of some
   checks: 150 and 178 have reference outputs for raw and qcow2, but no
   other formats.

   Previously, the _supported_fmt line in the test would just skip the test:

   $ build/check -vhdx 150 178
   150      not run    [16:45:46] [16:45:46]                    not suitable for this image format: vhdx
   178      not run    [16:45:46] [16:45:46]                    not suitable for this image format: vhdx

   Now we seem to test first if a reference output exists and fail:

   150   fail       [16:49:18] [16:49:18]   ...                  No qualified output (expected /home/kwolf/source/qemu/tests/qemu-iotests/150.out)
   178   fail       [16:49:18] [16:49:18]   ...                  No qualified output (expected /home/kwolf/source/qemu/tests/qemu-iotests/178.out)

2. Test case 146 for vpc passed previously, it fails now. This seems to
   be because of whitespace that is checked now.

3. Skipped tests display either "..." or "0.1s" as the elapsed time. The
   old check implementation didn't display any time for them. I don't
   really mind either of the three ways, but a consistent result would
   be nice.

Kevin


