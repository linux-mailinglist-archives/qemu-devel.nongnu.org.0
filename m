Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24683D5CFF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:30:18 +0200 (CEST)
Received: from localhost ([::1]:41192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82Yc-0005qM-3O
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m82Uz-0003OK-Vb
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m82Uv-0001Us-Hz
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:26:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627313188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tLfjBXg9M54zBncfvUpJ7qi8dl/5i1XGw308UBgj3Ko=;
 b=LeeLcDwZCo497ecqAgu8NEvvIbMYr1uEiAVzmTgRwSSzOGsRwTTZwDaC9eUJXDp/pOaTor
 FHgMBLwVB7zIsMq1ky4X4MCTwQUU/sY4b3J+zgatKD+r9I5howY9+R0fgIT6DXqRwXBawO
 EHaFFQnteTHErMZ0Ugd1fV5k/8qzwZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-b4myqEGGPWu2ATcQkEG8_w-1; Mon, 26 Jul 2021 11:26:26 -0400
X-MC-Unique: b4myqEGGPWu2ATcQkEG8_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58DCC190D340;
 Mon, 26 Jul 2021 15:26:25 +0000 (UTC)
Received: from redhat.com (ovpn-114-43.phx2.redhat.com [10.3.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1A3C5C1D5;
 Mon, 26 Jul 2021 15:26:24 +0000 (UTC)
Date: Mon, 26 Jul 2021 10:26:23 -0500
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.1? v2 2/7] mirror: Drop s->synced
Message-ID: <20210726152623.nta2drpcp35kxuo6@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-3-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210726144613.954844-3-mreitz@redhat.com>
User-Agent: NeoMutt/20210205-647-5d4e008
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 26, 2021 at 04:46:08PM +0200, Max Reitz wrote:
> As of HEAD^, there is no meaning to s->synced other than whether the job
> is READY or not.  job_is_ready() gives us that information, too.
> 
> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  block/mirror.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


