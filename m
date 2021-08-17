Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6845D3EEEE7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 17:05:12 +0200 (CEST)
Received: from localhost ([::1]:45028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG0eN-0004XZ-7g
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 11:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mG0dM-0003Fz-2q
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:04:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mG0dJ-0001Mh-DM
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:04:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629212644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ru2aqODxCo/khdQLwwbK/H6i+onlBzRDMtTY+2Z4lmU=;
 b=hG7eQ4+NxMTOao8zCmvLq7f6GQmuRKFmxuD0V8sI4kDWjdhT3+9YXir0J6kT8q+TrnrurV
 HTt6h8rQqP117nkWBpdld4EWgoipafqoflQ+bj042jDWxDPfR8MAzUen0cvZfKSdkpBdui
 KGeRtAugejK0qImnOMzE+Kr1Vw19wzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-fwkv2A3rMhiDvcVhcJaYJQ-1; Tue, 17 Aug 2021 11:03:55 -0400
X-MC-Unique: fwkv2A3rMhiDvcVhcJaYJQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C87091082920;
 Tue, 17 Aug 2021 15:03:54 +0000 (UTC)
Received: from redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D8A35D6AB;
 Tue, 17 Aug 2021 15:03:54 +0000 (UTC)
Date: Tue, 17 Aug 2021 10:03:52 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 3/6] block: Clarify that @bytes is no limit on *pnum
Message-ID: <20210817150352.r6hhx6x5ex45oe5w@redhat.com>
References: <20210812084148.14458-1-hreitz@redhat.com>
 <20210812084148.14458-4-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210812084148.14458-4-hreitz@redhat.com>
User-Agent: NeoMutt/20210205-719-68949a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Aug 12, 2021 at 10:41:45AM +0200, Hanna Reitz wrote:
> .bdrv_co_block_status() implementations are free to return a *pnum that
> exceeds @bytes, because bdrv_co_block_status() in block/io.c will clamp
> *pnum as necessary.
> 
> On the other hand, if drivers' implementations return values for *pnum
> that are as large as possible, our recently introduced block-status
> cache will become more effective.
> 
> So, make a note in block_int.h that @bytes is no upper limit for *pnum.
> 
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block_int.h | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


