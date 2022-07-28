Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D26583B44
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 11:33:08 +0200 (CEST)
Received: from localhost ([::1]:39202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGztC-00054E-S1
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 05:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oGzAF-0000W8-FA
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 04:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oGzAC-0004ga-Oj
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 04:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658997995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KqsnCYIrl6tRNDLrneg7x4soe6jnf/1p8V9BU8tM3lA=;
 b=NZwcgRwCLcHMMYrcD/6B4f0HCCkHWTRsea0SBTkxeOLZulMu14+PXDO2C140WplSruAK7T
 aJebHqABkiyCz+Tq9Z8lTH25zFHapU1R8/4bkb31wgnzqrsAaS3d5GNwygCFutb515Xfov
 irV3nJ3kKTGnmzKkG8LyC/WpDSSaUEE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-kmo8YkQBOWC7NJQiIHGTmQ-1; Thu, 28 Jul 2022 04:46:31 -0400
X-MC-Unique: kmo8YkQBOWC7NJQiIHGTmQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E7FA85A581;
 Thu, 28 Jul 2022 08:46:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 719F81415118;
 Thu, 28 Jul 2022 08:46:30 +0000 (UTC)
Date: Thu, 28 Jul 2022 10:46:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, mst@redhat.com, Coiby Xu <Coiby.Xu@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [PATCH  v1 1/5] block/vhost-user-blk-server: don't expose
 VHOST_USER_F_PROTOCOL_FEATURES
Message-ID: <YuJM5XY9u8lV3pA6@redhat.com>
References: <20220727155653.3974426-1-alex.bennee@linaro.org>
 <20220727155653.3974426-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220727155653.3974426-2-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.07.2022 um 17:56 hat Alex Bennée geschrieben:
> This bit is unused in actual VirtIO feature negotiation and should
> only appear in the vhost-user messages between master and slave.
> 
> [AJB: experiment, this doesn't break the tests but I'm not super
> confident of the range of tests]
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220726192150.2435175-6-alex.bennee@linaro.org>
> ---
>  block/export/vhost-user-blk-server.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
> index 3409d9e02e..d31436006d 100644
> --- a/block/export/vhost-user-blk-server.c
> +++ b/block/export/vhost-user-blk-server.c
> @@ -125,8 +125,7 @@ static uint64_t vu_blk_get_features(VuDev *dev)
>                 1ull << VIRTIO_BLK_F_MQ |
>                 1ull << VIRTIO_F_VERSION_1 |
>                 1ull << VIRTIO_RING_F_INDIRECT_DESC |
> -               1ull << VIRTIO_RING_F_EVENT_IDX |
> -               1ull << VHOST_USER_F_PROTOCOL_FEATURES;
> +               1ull << VIRTIO_RING_F_EVENT_IDX ;

I didn't see this series yet when I replied to the other series this is
split off from, but of course, my comments are still relevant for this
one.

I asked for a changed commit message (the "experiment" part should
probably go away if we're merging it; instead, it should explain that
in vu_get_features_exec(), libvhost-user adds the vhost-user protocol
level VHOST_USER_F_PROTOCOL_FEATURES flag anyway and the device is the
wrong layer to add it, but the behaviour doesn't change with this patch)
and noted the extra space before the semicolon.

Kevin


