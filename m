Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE7244695D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 20:57:54 +0100 (CET)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj5LV-00029y-FU
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 15:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mj5Kd-0001Ji-Fd
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 15:56:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mj5KZ-0004AD-Ri
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 15:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636142214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nPj3v0YMBa59wn+p64UvpVrfo+flqnWiMXR65nVzuZM=;
 b=K5x+W+OAsgJ7SqIQTzg1CA8VOGmz+5wNBzTinuNuFpXjdQtPL+vGrM9cQwHHPenL/CtGa0
 lXe/1FLQn0knsvdGg1IinYjMiasBmRh+/GptMOhLUXz6pbBGD4/1P2Oat5wjIxzHkmjwh5
 YGinvj85mBZ8I8NSgBkush9RN5l6NZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-x5ws1FrUODOyuTwbvYDZRg-1; Fri, 05 Nov 2021 15:56:48 -0400
X-MC-Unique: x5ws1FrUODOyuTwbvYDZRg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5145EC1A3;
 Fri,  5 Nov 2021 19:56:46 +0000 (UTC)
Received: from redhat.com (ovpn-112-104.phx2.redhat.com [10.3.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81AFD67843;
 Fri,  5 Nov 2021 19:56:30 +0000 (UTC)
Date: Fri, 5 Nov 2021 14:56:28 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 3/3] qapi: deprecate drive-backup
Message-ID: <20211105195628.fwq7tdjvrmggf6ez@redhat.com>
References: <20211104085811.1736654-1-armbru@redhat.com>
 <20211104085811.1736654-4-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104085811.1736654-4-armbru@redhat.com>
User-Agent: NeoMutt/20211029-10-fe244a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, kchamart@redhat.com,
 libvir-list@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 04, 2021 at 09:58:11AM +0100, Markus Armbruster wrote:
> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
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
> The documentation is updated in a minimal way, so that drive-backup is
> noted only as a deprecated command, and blockdev-backup used in most of
> places.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

I think this is appropriate for inclusion in 6.2, even if it did not
quite make soft freeze, so that we aren't delaying the deprecation for
an entire cycle.

>  docs/about/deprecated.rst              | 11 ++++++
>  docs/interop/live-block-operations.rst | 47 +++++++++++++++++---------
>  qapi/block-core.json                   |  5 ++-
>  qapi/transaction.json                  |  6 +++-
>  4 files changed, 51 insertions(+), 18 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


