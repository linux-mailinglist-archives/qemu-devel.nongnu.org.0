Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FF830E297
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:35:08 +0100 (CET)
Received: from localhost ([::1]:58948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Mzb-00044h-4W
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7MxM-0002qp-2u
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:32:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7MxJ-0005qd-M1
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612377164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F38rsvgJ+i3O3X3fQgILxB4L+MT0Afi+g3XzSrV6Jm0=;
 b=EjeTG8fbLnCy77yAFUKIafTsZpJ/b4Pd0xiKASYOM2gsoxYjkxZw7481EZtlfsv9mhdBSF
 uPhLIGtyhq7a4vN1n4X0NvKu0JuJ1b1FkgKQysYIYp6Otb6D6hgsoDRlLGK7JonjFxGSYy
 4X+m1jNTesFKcqo7vlzRWhtktONNPKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-JGrz26LAMGWwv9V0CwScDQ-1; Wed, 03 Feb 2021 13:32:40 -0500
X-MC-Unique: JGrz26LAMGWwv9V0CwScDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 265541934126;
 Wed,  3 Feb 2021 18:32:39 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 533CE722C8;
 Wed,  3 Feb 2021 18:32:37 +0000 (UTC)
Date: Wed, 3 Feb 2021 18:32:34 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 07/18] migration/rdma: add rdma field into multifd
 send/recv param
Message-ID: <20210203183234.GR2950@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-8-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-8-git-send-email-zhengchuan@huawei.com>
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
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yubihong@huawei.com, berrange@redhat.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> Note we do want to export any rdma struct, take void * instead.

You don't need to make this a void *; add a typedef struct RDMAContext
into include/qemu/typedefs.h  and then you can use the right type here
without actually exporting the interesting contents of the type or
being dependent on rdma being built.

Dave

> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/multifd.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index d57756c..b17a2c1 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -108,6 +108,10 @@ typedef struct {
>      QemuSemaphore sem_sync;
>      /* used for compression methods */
>      void *data;
> +    /* used for multifd rdma */
> +    void *rdma;
> +    /* communication channel */
> +    QEMUFile *file;
>  }  MultiFDSendParams;
>  
>  typedef struct {
> @@ -147,6 +151,10 @@ typedef struct {
>      QemuSemaphore sem_sync;
>      /* used for de-compression methods */
>      void *data;
> +    /* used for multifd rdma */
> +    void *rdma;
> +    /* communication channel */
> +    QEMUFile *file;
>  } MultiFDRecvParams;
>  
>  typedef struct {
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


