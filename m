Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0A72B07EE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:57:38 +0100 (CET)
Received: from localhost ([::1]:46632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdE2b-0002lH-EZ
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdE13-0001is-3z
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:56:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdE0w-0000L4-TF
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605192953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YDaFZBe9H/l5NRtHUvwJP/BI62z84wcEUkbn+ztX+3E=;
 b=SQYj+TpbSXq0wuM5jWFJYU2MFbuKc71Cz7P+wyKbxIAIiQ9ECMDJcgGMtgWTqWLajw/1W4
 mdQWm2sIkD3q6YExQmoeqQKaMxvxTIjbLrHSsfzSEwA5VzZNZnsZsLCgCzKpMOLURGQ2Pj
 fJw2nRuDt2gk4BziWGsG7UvR2G7L2JA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-EveIPOktN7OfiI0n46g24Q-1; Thu, 12 Nov 2020 09:55:52 -0500
X-MC-Unique: EveIPOktN7OfiI0n46g24Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B138A56ADD;
 Thu, 12 Nov 2020 14:55:50 +0000 (UTC)
Received: from work-vm (ovpn-115-60.ams2.redhat.com [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFFA060C13;
 Thu, 12 Nov 2020 14:55:48 +0000 (UTC)
Date: Thu, 12 Nov 2020 14:55:46 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH] migration/dirtyrate: simplify inlcudes in dirtyrate.c
Message-ID: <20201112145546.GE13424@work-vm>
References: <1604030281-112946-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1604030281-112946-1-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 qemu-devel@nongnu.org, xiexiangyou@huawei.com, alex.chen@huawei.com,
 wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> Remove redundant blank line which is left by Commit 662770af7c6e8c,
> also take this opportunity to remove redundant includes in dirtyrate.c.
> 
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>

and queued

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/dirtyrate.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index 8f728d2..ccb9814 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -11,17 +11,12 @@
>   */
>  
>  #include "qemu/osdep.h"
> -
>  #include <zlib.h>
>  #include "qapi/error.h"
>  #include "cpu.h"
> -#include "qemu/config-file.h"
> -#include "exec/memory.h"
>  #include "exec/ramblock.h"
> -#include "exec/target_page.h"
>  #include "qemu/rcu_queue.h"
>  #include "qapi/qapi-commands-migration.h"
> -#include "migration.h"
>  #include "ram.h"
>  #include "trace.h"
>  #include "dirtyrate.h"
> -- 
> 1.8.3.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


