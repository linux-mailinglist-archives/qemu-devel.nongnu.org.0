Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CAF36AE05
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 09:42:03 +0200 (CEST)
Received: from localhost ([::1]:54344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lavsX-0000n6-M9
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 03:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lavqb-0008Dx-Hl
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 03:40:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lavqX-0000gb-O7
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 03:40:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619422796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=czSxepygqFF4wk1viuHTaihCkuAPiK2DZoEyT3nGE2M=;
 b=hC6jIqimrV4jEb9z1k8w8PavVOLFDr2pZRumcL6LZf6D1vex0fRfo069mItGx6ADr2vHhd
 UB/XVRoWXlFRID6zmt2FucEZdwzqeC3QCjCcDT9xTh4shy2Xd6g7rbosOIKJv7LMLO6w/u
 PEKeNE7ssYt32sfT6jJpGMTxqM6raxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-0svQLKhCOnqBtRIElpqv_Q-1; Mon, 26 Apr 2021 03:39:53 -0400
X-MC-Unique: 0svQLKhCOnqBtRIElpqv_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25E4218B9F00;
 Mon, 26 Apr 2021 07:39:52 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 795C360BE5;
 Mon, 26 Apr 2021 07:39:34 +0000 (UTC)
Date: Mon, 26 Apr 2021 09:39:31 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] qapi: deprecate drive-backup
Message-ID: <YIZuM4X8NC0pt0JS@angien.pipo.sk>
References: <20210423125900.3640-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210423125900.3640-1-vsementsov@virtuozzo.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, nshirokovskiy@virtuozzo.com,
 den@openvz.org, jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 23, 2021 at 15:59:00 +0300, Vladimir Sementsov-Ogievskiy wrote:
> Modern way is using blockdev-add + blockdev-backup, which provides a
> lot more control on how target is opened.
> 
> As example of drive-backup problems consider the following:
> 
> User of drive-backup expects that target will be opened in the same
> cache and aio mode as source. Corresponding logic is in
> drive_backup_prepare(), where we take bs->open_flags of source.
> 
> It works rather bad if source was added by blockdev-add. Assume source
> is qcow2 image. On blockdev-add we should specify aio and cache options
> for file child of qcow2 node. What happens next:
> 
> drive_backup_prepare() looks at bs->open_flags of qcow2 source node.
> But there no BDRV_O_NOCAHE neither BDRV_O_NATIVE_AIO: BDRV_O_NOCAHE is
> places in bs->file->bs->open_flags, and BDRV_O_NATIVE_AIO is nowhere,
> as file-posix parse options and simply set s->use_linux_aio.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Hi all! I remember, I suggested to deprecate drive-backup some time ago,
> and nobody complain.. But that old patch was inside the series with
> other more questionable deprecations and it did not landed.
> 
> Let's finally deprecate what should be deprecated long ago.
> 
> We now faced a problem in our downstream, described in commit message.
> In downstream I've fixed it by simply enabling O_DIRECT and linux_aio
> unconditionally for drive_backup target. But actually this just shows
> that using drive-backup in blockdev era is a bad idea. So let's motivate
> everyone (including Virtuozzo of course) to move to new interfaces and
> avoid problems with all that outdated option inheritance.

libvirt never used 'drive-backup' thus

Reviewed-by: Peter Krempa <pkrempa@redhat.com>


