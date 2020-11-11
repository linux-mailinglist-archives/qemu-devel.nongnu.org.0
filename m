Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA2B2AF955
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 20:57:02 +0100 (CET)
Received: from localhost ([::1]:33420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcwEn-0000rD-LW
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 14:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcwD4-0007wC-Cd
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 14:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcwD2-0007lT-Fl
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 14:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605124511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DPC1c9mBwsROOV9sOff02++vnkieK3F/OKXJmllXTNE=;
 b=huTr5fDzGg4ewnrM89x/+ilzpN9y9BybYK4KuUWcduZOhdRaHhTyvVhohf3eiKmr74ZgaG
 0jvytgpwfzjB3m1wT8LJMoM4Rjvg3JbrqTIK/yGC4qP0fLOFTx237Q3p2h0K9C9LVZeI27
 2rdxK2IlZRNR25AqS8Ye1wDPaH6obXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-oNrHZDR3M6uP5aTDrPcGsQ-1; Wed, 11 Nov 2020 14:55:08 -0500
X-MC-Unique: oNrHZDR3M6uP5aTDrPcGsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 051915F9ED;
 Wed, 11 Nov 2020 19:55:07 +0000 (UTC)
Received: from work-vm (ovpn-113-88.ams2.redhat.com [10.36.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C844160BF3;
 Wed, 11 Nov 2020 19:55:02 +0000 (UTC)
Date: Wed, 11 Nov 2020 19:55:00 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Haotian Li <lihaotian9@huawei.com>
Subject: Re: [Virtio-fs] [PATCH 3/3] virtiofsd: check whether strdup
 lo.source return NULL in main func
Message-ID: <20201111195500.GP3232@work-vm>
References: <3477d902-ace9-1aa1-531a-9d20d6e93a05@huawei.com>
 <f1e48ca8-d6de-d901-63c8-4f4024bda518@huawei.com>
MIME-Version: 1.0
In-Reply-To: <f1e48ca8-d6de-d901-63c8-4f4024bda518@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
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
Cc: virtio-fs@redhat.com, linfeilong@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Haotian Li (lihaotian9@huawei.com) wrote:
> In main func, strdup lo.source may fail. So check whether strdup
> lo.source return NULL before using it.
> 
> Signed-off-by: Haotian Li <lihaotian9@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 3e9bbc7a04..0c11134fb5 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -3525,6 +3525,10 @@ int main(int argc, char *argv[])
>          }
>      } else {
>          lo.source = strdup("/");
> +        if (!lo.source) {
> +            fuse_log(FUSE_LOG_ERR, "failed to strdup source\n");
> +            goto err_out1;
> +        }
>      }
> 

(It's interesting we use exit's in some places, goto's in others)

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>      if (lo.xattrmap) {
> -- 
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://www.redhat.com/mailman/listinfo/virtio-fs
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


