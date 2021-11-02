Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDFB442E6D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:48:10 +0100 (CET)
Received: from localhost ([::1]:36492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtCz-0008K1-Ox
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhsoK-00029D-7e
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:22:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhsoH-0005RH-NM
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635855756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uYx+VMM5I8jKTK7+RBefczsoMBXmKPh3mYlbhUF5S+c=;
 b=Gz9Q/x4yjv5Vx6qgdMAa4r8s3JNYAp2Aovg5hnE3ZaJqJnonGD3xAHtlPA6v/a0hRoUUFl
 goDEf6gFkIM5vloYgELE0gjpEhMVdwn4WQvIpcyWg9+EvpbtFDNbc/4xtiXRrD+DnOvsFV
 HfS2e7iTBascwAG9H8mw6GMKnL5OxKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-Wk6LIJ6nO6CmJHRg9lFFgw-1; Tue, 02 Nov 2021 08:22:33 -0400
X-MC-Unique: Wk6LIJ6nO6CmJHRg9lFFgw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A61141006AAA;
 Tue,  2 Nov 2021 12:22:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DB7D79450;
 Tue,  2 Nov 2021 12:22:28 +0000 (UTC)
Date: Tue, 2 Nov 2021 13:22:27 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] block-backend: Silence clang -m32 compiler warning
Message-ID: <YYEtg9PkLt/0J+ut@redhat.com>
References: <20211026090745.30800-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211026090745.30800-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.10.2021 um 11:07 hat Hanna Reitz geschrieben:
> Similarly to e7e588d432d31ecebc26358e47201dd108db964c, there is a
> warning in block/block-backend.c that qiov->size <= INT64_MAX is always
> true on machines where size_t is narrower than a uint64_t.  In said
> commit, we silenced this warning by casting to uint64_t.
> 
> The commit introducing this warning here
> (a93d81c84afa717b0a1a6947524d8d1fbfd6bbf5) anticipated it and so tried
> to address it the same way.  However, it only did so in one of two
> places where this comparison occurs, and so we still need to fix up the
> other one.
> 
> Fixes: a93d81c84afa717b0a1a6947524d8d1fbfd6bbf5
>        ("block-backend: convert blk_aio_ functions to int64_t bytes
>        paramter")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Thanks, applied to the block branch.

Kevin


