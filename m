Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D36032B7DC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:42:59 +0100 (CET)
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQqA-0007NP-12
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHQoV-0006UQ-I2
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:41:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHQoR-0004ob-Kz
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614775266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T/JUrreC0FqoZVhzfMz2StmEPujQ2RhHJpWjQVNIH38=;
 b=M+GGBe97FP39wRGbc+7qktsUdmxhQ/TqSKdJqL1ylE3/jfXIqPDUXlXlvFci1dVTyB71qm
 dvzxNlYC8vkW2MPtDvN9QO4kgt2SthW4PxK760T/vGlN2vH41KtIF3UaNPv/WOPURHt8OO
 7UWl6NwHVfNsTnUL7RWwvkH9KmRFsuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-EzsHDeEBMKScQSdAtlFrHQ-1; Wed, 03 Mar 2021 07:41:03 -0500
X-MC-Unique: EzsHDeEBMKScQSdAtlFrHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F1B9100A8E9;
 Wed,  3 Mar 2021 12:41:01 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-195.ams2.redhat.com [10.36.113.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5F0B5D9C2;
 Wed,  3 Mar 2021 12:40:49 +0000 (UTC)
Date: Wed, 3 Mar 2021 13:40:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 00/12] block/export: vhost-user-blk server tests and
 input validation
Message-ID: <20210303124047.GD5254@merkur.fritz.box>
References: <20210223144653.811468-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223144653.811468-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.02.2021 um 15:46 hat Stefan Hajnoczi geschrieben:
> v3:
>  * Rebased onto qemu.git/master (7ef8134565dc)
>  * I asked Coiby Xu for clarification on a comment about vhost-user-blk-test in
>    v2. Please wait for that discussion to finish before merging.
> 
> v2:
>  * Add abrt handler that terminates qemu-storage-daemon to
>    vhost-user-blk-test. No more orphaned processes on test failure. [Peter]
>  * Fix sector number calculation in vhost-user-blk-server.c
>  * Introduce VIRTIO_BLK_SECTOR_BITS/SIZE to make code clearer [Max]
>  * Fix vhost-user-blk-server.c blk_size double byteswap
>  * Fix vhost-user-blk blkcfg->num_queues endianness [Peter]
>  * Squashed cleanups into Coiby vhost-user-blk-test commit so the code is
>    easier to review
> 
> The vhost-user-blk server test was already in Michael Tsirkin's recent vhost
> pull request, but was dropped because it exposed vhost-user regressions
> (b7c1bd9d7848 and the Based-on tag below). Now that the vhost-user regressions
> are fixed we can re-introduce the test case.
> 
> This series adds missing input validation that led to a Coverity report. The
> virtio-blk read, write, discard, and write zeroes commands need to check
> sector/byte ranges and other inputs. This solves the issue Peter Maydell raised
> in "[PATCH for-5.2] block/export/vhost-user-blk-server.c: Avoid potential
> integer overflow".
> 
> Merging just the input validation patches would be possible too, but I prefer
> to merge the corresponding tests so the code is exercised by the CI.

Thanks, applied to the block branch.

Kevin


