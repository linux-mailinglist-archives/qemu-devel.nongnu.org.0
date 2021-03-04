Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A6B32D532
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:23:14 +0100 (CET)
Received: from localhost ([::1]:57906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHosj-0004Jt-Bn
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHorW-0003nP-28
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:21:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHorU-0003q1-84
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614867715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+QV+azffOk7F/t0WX2fjYOaweqZTSaJ42GjmdGPp074=;
 b=CA5cgovP6RU7BiPZzAjXHsJ2lOjCRq6wFqmEU9itEyFH4CEf2JHuKbhY1FN/YNteLYX10g
 JOCFwFYciqyNZYiPokGeXLrNpwpbfe2fembiPu+MBEXEUDkzW2dMN2PhnazC9KD7XCfK89
 rX3UKLWbh2HWT25rL2fTJQVZbM4Qj9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-ZVhJ3c7BP_ebC1_3n7hdOw-1; Thu, 04 Mar 2021 09:21:53 -0500
X-MC-Unique: ZVhJ3c7BP_ebC1_3n7hdOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92E801005D4D;
 Thu,  4 Mar 2021 14:21:52 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-64.ams2.redhat.com [10.36.113.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DBB41412A;
 Thu,  4 Mar 2021 14:21:46 +0000 (UTC)
Date: Thu, 4 Mar 2021 15:21:45 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 2/6] parallels.txt: fix bitmap L1 table description
Message-ID: <20210304142145.GC9607@merkur.fritz.box>
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
 <20210224104707.88430-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210224104707.88430-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.02.2021 um 11:47 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Actually L1 table entry offset is in 512 bytes sectors. Fix the spec.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/interop/parallels.txt | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/docs/interop/parallels.txt b/docs/interop/parallels.txt
> index f15bf35bd1..73af9a2c4b 100644
> --- a/docs/interop/parallels.txt
> +++ b/docs/interop/parallels.txt
> @@ -208,21 +208,24 @@ of its data area are:
>    28 - 31:    l1_size
>                The number of entries in the L1 table of the bitmap.
>  
> -  variable:   l1_table (8 * l1_size bytes)
> -              L1 offset table (in bytes)
> +  variable:   L1 offset table (l1_table), size: 8 * l1_size bytes
>  
> -A dirty bitmap is stored using a one-level structure for the mapping to host
> -clusters - an L1 table.
> +Dirty bitmap is stored in the array of clusters inside Parallels Image file.
> +Offsets of these clusters are saved in L1 offset table here. Each L1 table
> +entry is a 64bit integer described below:

I think the English grammar needs some fixes here (missing articles).

If I understand correctly, it's also not really an array, which I would
understand as consecutive clusters.

Maybe something like this:

  The dirty bitmap described by this feature extension is stored in a set
  of clusters inside the Parallels image file. The offsets of these
  clusters are saved in the L1 offset table specified by the feature
  extension. Each L1 table entry is a 64 bit integer as described below:

> -Given an offset in bytes into the bitmap data, the offset in bytes into the
> -image file can be obtained as follows:
> +Given an offset in bytes into the bitmap data, corresponding L1 entry is
>  
> -    offset = l1_table[offset / cluster_size] + (offset % cluster_size)
> +    l1_table[offset / cluster_size]
>  
> -If an L1 table entry is 0, the corresponding cluster of the bitmap is assumed
> -to be zero.
> +If L1 table entry is 0, all bits in the corresponding cluster of the bitmap
> +are assumed to be 0.

"an L1 table", like before.

> -If an L1 table entry is 1, the corresponding cluster of the bitmap is assumed
> -to have all bits set.
> +If L1 table entry is 1, all bits in the corresponding cluster of the bitmap
> +are assumed to be 1.

Same here.

> -If an L1 table entry is not 0 or 1, it allocates a cluster from the data area.
> +If an L1 table entry is not 0 or 1, it contains corresponding cluster offset

"the corresponding cluster offset"

> +(in 512b sectors). Given an offset in bytes into the bitmap data the offset in
> +bytes into the image file can be obtained as follows:
> +
> +    offset = l1_table[offset / cluster_size] * 512 + (offset % cluster_size)

These changes can be made while applying the patch.

Kevin


