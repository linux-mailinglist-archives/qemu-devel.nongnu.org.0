Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099A028CB19
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 11:40:10 +0200 (CEST)
Received: from localhost ([::1]:53018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSGmu-0005Le-Qx
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 05:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kSGm5-0004pt-LY
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 05:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kSGm3-00056q-8d
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 05:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602581953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LoR0eLPJ2ghxPKVpk3sga7S4LTQKZdGI9kMwMcQgKzU=;
 b=IKRcsbC8JdKymGLJdVxy2mh0lT+VnuWWMFSJGe70Q5ABt+zE1PlaZExlgWFuuFzB05FT4m
 zVDHdgQBefOYkOSrNoZr35K8os73nCMO6vGd2MzKQp+fOHzwqDDtPRS2bxbvsSoFVn6Zg5
 UQWUMEV9wwPyz6AJcwAul4Iod4xVbLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-GeJhyWadMRWCkChIsXRQNQ-1; Tue, 13 Oct 2020 05:39:12 -0400
X-MC-Unique: GeJhyWadMRWCkChIsXRQNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D665D1020902;
 Tue, 13 Oct 2020 09:39:10 +0000 (UTC)
Received: from work-vm (ovpn-114-238.ams2.redhat.com [10.36.114.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D19B976667;
 Tue, 13 Oct 2020 09:39:08 +0000 (UTC)
Date: Tue, 13 Oct 2020 10:39:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Bihong Yu <yubihong@huawei.com>
Subject: Re: [PATCH v2 1/8] migration: Do not use C99 // comments
Message-ID: <20201013093905.GB2920@work-vm>
References: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
 <1602508140-11372-2-git-send-email-yubihong@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1602508140-11372-2-git-send-email-yubihong@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 03:04:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: zhengchuan@huawei.com, quintela@redhat.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Bihong Yu (yubihong@huawei.com) wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

another task at some point would be to rewrite the DPRINTF's in
migration/block.c to use trace_ instead.

> ---
>  migration/block.c | 2 +-
>  migration/rdma.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/block.c b/migration/block.c
> index 737b649..4b8576b 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -40,7 +40,7 @@
>  #define MAX_IO_BUFFERS 512
>  #define MAX_PARALLEL_IO 16
>  
> -//#define DEBUG_BLK_MIGRATION
> +/* #define DEBUG_BLK_MIGRATION */
>  
>  #ifdef DEBUG_BLK_MIGRATION
>  #define DPRINTF(fmt, ...) \
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 0340841..0eb42b7 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -1288,7 +1288,7 @@ const char *print_wrid(int wrid)
>   * workload information or LRU information is available, do not attempt to use
>   * this feature except for basic testing.
>   */
> -//#define RDMA_UNREGISTRATION_EXAMPLE
> +/* #define RDMA_UNREGISTRATION_EXAMPLE */
>  
>  /*
>   * Perform a non-optimized memory unregistration after every transfer
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


