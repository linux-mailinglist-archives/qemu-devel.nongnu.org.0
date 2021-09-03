Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B840054B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:48:57 +0200 (CEST)
Received: from localhost ([::1]:38590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEFE-0005bA-OU
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMEDx-00049B-7W
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:47:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMEDt-0000it-GD
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:47:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630694852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EYZsbV4wUWyqDWxSzL4dBSSn9Os4+GIjd4Vt7ksqvJU=;
 b=XykWfKRpyArT8tKiio8m3bRoR9vzf1JSyuJGnHmpJVT3X7az8OruPTrd7T1gyL+76HXDLG
 3InbFtqFlpkH2V7fBb/ToKg/Oglo18F2F/oi5jDC7+uB3HVTV4ERDT07ZonpJqUJGq+wnE
 olLdfhTEQGaSql9glcxx6PRx7Eymgeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-Lgdu3WH5NBKG2pHw1lX9DA-1; Fri, 03 Sep 2021 14:47:29 -0400
X-MC-Unique: Lgdu3WH5NBKG2pHw1lX9DA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4CB3800FF3;
 Fri,  3 Sep 2021 18:47:28 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AC7E10016F5;
 Fri,  3 Sep 2021 18:47:27 +0000 (UTC)
Date: Fri, 3 Sep 2021 13:47:26 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] block: drop BLK_PERM_GRAPH_MOD
Message-ID: <20210903184726.rsz35o4jz6bzddbi@redhat.com>
References: <20210902093754.2352-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210902093754.2352-1-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 armbru@redhat.com, qemu-devel@nongnu.org, hreitz@redhat.com, crosa@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 12:37:54PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> First, this permission never protected a node from being changed, as
> generic child-replacing functions don't check it.
> 
> Second, it's a strange thing: it presents a permission of parent node
> to change its child. But generally, children are replaced by different
> mechanisms, like jobs or qmp commands, not by nodes.
> 
> Graph-mod permission is hard to understand. All other permissions
> describe operations which done by parent node on its child: read,
> write, resize. Graph modification operations are something completely
> different.
> 
> The only place where BLK_PERM_GRAPH_MOD is used as "perm" (not shared
> perm) is mirror_start_job, for s->target. Still modern code should use
> bdrv_freeze_backing_chain() to protect from graph modification, if we
> don't do it somewhere it may be considered as a bug. So, it's a bit
> risky to drop GRAPH_MOD, and analyzing of possible loss of protection
> is hard. But one day we should do it, let's do it now.
> 
> One more bit of information is that locking the corresponding byte in
> file-posix doesn't make sense at all.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> v2: fix grammar
> 
>  qapi/block-core.json          |  7 ++-----
>  include/block/block.h         |  9 +++++----
>  block.c                       |  7 +------
>  block/commit.c                |  1 -
>  block/mirror.c                | 15 +++------------
>  hw/block/block.c              |  3 +--
>  scripts/render_block_graph.py |  1 -
>  tests/qemu-iotests/273.out    |  4 ----
>  8 files changed, 12 insertions(+), 35 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 06674c25c9..6fa2c4ab82 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -1825,14 +1825,11 @@
>  #
>  # @resize: This permission is required to change the size of a block node.
>  #
> -# @graph-mod: This permission is required to change the node that this
> -#             BdrvChild points to.
> -#

Do we need to mention that graph-mod was removed in 6.2?

>  # Since: 4.0
>  ##
>  { 'enum': 'BlockPermission',
> -  'data': [ 'consistent-read', 'write', 'write-unchanged', 'resize',
> -            'graph-mod' ] }
> +  'data': [ 'consistent-read', 'write', 'write-unchanged', 'resize' ] }
> +
>  ##
>  # @XDbgBlockGraphEdge:
>  #

Otherwise the patch makes sense to me, but I'd rather that Kevin chime in.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


