Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3543168A7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 15:04:27 +0100 (CET)
Received: from localhost ([::1]:45998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9q6U-0003yM-BJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 09:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9q1q-0001re-GK
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:59:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9q1n-0006K7-9X
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612965571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dBTAuA5s3qIh9Ebfpq7J4yTahr4QnKY2rwusJKpKkts=;
 b=XX/VErviGoHFyFkjgvRC03ajQBDM0H9WAKpcEiquczccg+biDOZtH57wiMfferGQZRutwZ
 J/vymBvYUTklwSMFBh4CS6abwVXv0aMBhppcU2DPR8MDuwYV94SOVUshkmveqLvtPgGygP
 QFmx86tEIHszoZjyOnZ4HvAlBskKXLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-K5FwM9vmMGu4CSojRR5XQQ-1; Wed, 10 Feb 2021 08:59:29 -0500
X-MC-Unique: K5FwM9vmMGu4CSojRR5XQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA2CD801965;
 Wed, 10 Feb 2021 13:59:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AAB360622;
 Wed, 10 Feb 2021 13:59:27 +0000 (UTC)
Date: Wed, 10 Feb 2021 14:59:25 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] iotests/210: Fix reference output
Message-ID: <20210210135925.GC5144@merkur.fritz.box>
References: <20210209181923.497688-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209181923.497688-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.02.2021 um 19:19 hat Max Reitz geschrieben:
> Commit 69b55e03f has changed an error message, adjust the reference
> output to account for it.
> 
> Fixes: 69b55e03f7e65a36eb954d0b7d4698b258df2708
>        ("block: refactor bdrv_check_request: add errp")
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>

> diff --git a/tests/qemu-iotests/210.out b/tests/qemu-iotests/210.out
> index dc1a3c9786..2e9fc596eb 100644
> --- a/tests/qemu-iotests/210.out
> +++ b/tests/qemu-iotests/210.out
> @@ -182,7 +182,7 @@ Job failed: The requested file size is too large
>  === Resize image with invalid sizes ===
>  
>  {"execute": "block_resize", "arguments": {"node-name": "node1", "size": 9223372036854775296}}
> -{"error": {"class": "GenericError", "desc": "Required too big image size, it must be not greater than 9223372035781033984"}}
> +{"error": {"class": "GenericError", "desc": "offset(9223372036854775296) exceeds maximum(9223372035781033984)"}}

This doesn't exactly feel like an improved error message...

Kevin


