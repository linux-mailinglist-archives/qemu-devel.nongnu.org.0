Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BDD30E2C9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:50:55 +0100 (CET)
Received: from localhost ([::1]:45724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7NEs-0002ty-MT
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7NDm-0001w9-39
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:49:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7NDi-00051I-OU
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:49:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612378181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UQksloDP4hDIFqMIYTUqIC0Oegqz1X+Obao84dBWX9w=;
 b=TTZpJm2Dw3lIzU4L8ulWPq2s1F0vuY/YdfBCd5Nm1tUW16j7lLKsglk1I2OSoghU8VDvzY
 iFUPn+Ge288J7Hj9qAhCGMtYnjlnriukvxAf0v2X/THtqlzGm2rwtC2X9C0dPbBUpUbffR
 4O6AtDVYzU3t5xn+DPf+G+eozcX9Pr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-lKFdkCLJPd6LLgJ_bsRasw-1; Wed, 03 Feb 2021 13:49:40 -0500
X-MC-Unique: lKFdkCLJPd6LLgJ_bsRasw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC4D8107ACE8;
 Wed,  3 Feb 2021 18:49:38 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E53215D9E8;
 Wed,  3 Feb 2021 18:49:36 +0000 (UTC)
Date: Wed, 3 Feb 2021 18:49:33 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 08/18] migration/rdma: export getQIOChannel to get
 QIOchannel in rdma
Message-ID: <20210203184933.GS2950@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-9-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-9-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/qemu-file.c | 5 +++++
>  migration/qemu-file.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index be21518..37f6201 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -260,6 +260,11 @@ void ram_control_before_iterate(QEMUFile *f, uint64_t flags)
>      }
>  }
>  
> +void *getQIOChannel(QEMUFile *f)
> +{
> +    return f->opaque;
> +}
> +

Unfortunately that's not right, since the opaque isn't always a
QUIChannel, so getOpaque would be a suitable name here.

It's a shame this is needed; I'm surprised you ever have a QEMUFIle* in
the rdma code in somewhere you don't have the QIOChannel; could you
avoid this by adding a QIOChannel pointer into the RDAMContext to point
back to the channel which it's for?

Dave

>  void ram_control_after_iterate(QEMUFile *f, uint64_t flags)
>  {
>      int ret = 0;
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index a9b6d6c..4cef043 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -165,6 +165,7 @@ void qemu_file_set_blocking(QEMUFile *f, bool block);
>  void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
>  void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
>  void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data);
> +void *getQIOChannel(QEMUFile *f);
>  
>  /* Whenever this is found in the data stream, the flags
>   * will be passed to ram_control_load_hook in the incoming-migration
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


