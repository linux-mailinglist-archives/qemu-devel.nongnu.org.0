Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E14E442E93
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:58:20 +0100 (CET)
Received: from localhost ([::1]:33908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtMp-0001Az-DP
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhsuq-0003oo-Qy
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:29:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhsuo-0006LW-G5
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635856161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dXsdeU9RviqlZDHXeb85SjgkS1m3RLgw68YW83mX60=;
 b=OrKhIkAzhd6thCJTQYfLmOy5UAPiXjVrilFbdpMOsfNJN5FpR3kUFxmgsMbKTmvO255/Qp
 xWevx+Hl8fugu67IbxPcHeRNxHembazXqmFKx0wtXNqa6/iQHEEa7Pqu9/7cgte3xXhHzy
 j6vPVEp1IIihWUKpA+RKehCqyNXIoY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-D4cKXJ5AMeG3Cqp9l0W_ZA-1; Tue, 02 Nov 2021 08:29:18 -0400
X-MC-Unique: D4cKXJ5AMeG3Cqp9l0W_ZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8A1B19200CF;
 Tue,  2 Nov 2021 12:29:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D92119811;
 Tue,  2 Nov 2021 12:29:15 +0000 (UTC)
Date: Tue, 2 Nov 2021 13:29:14 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 00/17] iotests: support zstd
Message-ID: <YYEvGrKxnF/w8Nzp@redhat.com>
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
 <2e923c5b-0bfa-6870-be68-cd1ccb7b125d@redhat.com>
 <6de70a00-ff7a-9155-ff97-3e28df4c9059@redhat.com>
 <bfa6945a-a90f-9ec6-72f7-ad8402d606ff@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <bfa6945a-a90f-9ec6-72f7-ad8402d606ff@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Hanna Reitz <hreitz@redhat.com>, jsnow@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.09.2021 um 20:06 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 17.09.2021 17:49, Hanna Reitz wrote:
> > On 15.09.21 16:45, Hanna Reitz wrote:
> > > On 14.09.21 12:25, Vladimir Sementsov-Ogievskiy wrote:
> > > > These series makes tests pass with
> > > > 
> > > >     IMGOPTS='compression_type=zstd'
> > > > 
> > > > Also, python iotests start to support IMGOPTS (they didn't before).
> > > 
> > > Unfortunately, the problem I have now is that it makes the tests fail with other IMGOPTS.
> > > 
> > > My regular test set includes 'refcount_bits=1', 'compat=0.10', and 'data_file=$TEST_IMG.ext_data_file'.  These fail now, because the Python tests don’t have a way to specify which test options they don’t support (like _unsupported_imgopts).  Handling data_file of course is extra tricky because now every disk image consists of two files, and the qemu-img create invocation needs to expand '$TEST_IMG', like _make_test_img does (in the line where imgopts_expanded is set).
> > > 
> > > I think we need an unsupported_imgopts parameter for Python tests, and it needs to be filled (perhaps https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg00082.html can serve as a starting point).  And for the time being, I think Python tests should be skipped altogether when IMGOPTS contains data_file.
> > 
> > (Perhaps I should explicitly say that this means I didn’t include this series in my pull request this week, because, well, my pre-pull tests were failing :/)
> 
> That was clean :) I'll resend

Am I missing something or has this not happened yet?

Kevin


