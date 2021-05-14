Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BCC3811C6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 22:25:44 +0200 (CEST)
Received: from localhost ([::1]:38930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lheNT-0003sI-ES
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 16:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lheLm-00034K-9T
 for qemu-devel@nongnu.org; Fri, 14 May 2021 16:23:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lheLi-0007KF-7r
 for qemu-devel@nongnu.org; Fri, 14 May 2021 16:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621023833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ucy01WrR8uvHXPggnjtllCVHzvDMFN+LrkM/O9ncj+Y=;
 b=gjX2Fj80YvvpJDu0KTOGQkhMqtzNwjKgobdGrkpB1AR5OtlnrlM51WvC3867w17XTdnmc8
 FKO0rPktSdZuniWnWfIPv5ZCf0l/HXbTF2UF2f1aWq1kV4Q7mBmcs4pVt9MCaFxy4zpaCL
 fMIb4mdAX1mAYitsjOWZKfbGwndFLZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-qHW3sK0GOHGt8BTt5nkrFA-1; Fri, 14 May 2021 16:23:51 -0400
X-MC-Unique: qHW3sK0GOHGt8BTt5nkrFA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 273CD107ACC7;
 Fri, 14 May 2021 20:23:50 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57BAB6060F;
 Fri, 14 May 2021 20:23:44 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] docs/block-replication: use blockdev-backup
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210505135803.67896-1-vsementsov@virtuozzo.com>
 <20210505135803.67896-2-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <5b11ec16-e0a5-e208-5446-dde794df1d28@redhat.com>
Date: Fri, 14 May 2021 16:23:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505135803.67896-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pkrempa@redhat.com, berrange@redhat.com, kchamart@redhat.com,
 libvir-list@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, yur@virtuozzo.com,
 nshirokovskiy@virtuozzo.com, den@openvz.org, dim@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 9:58 AM, Vladimir Sementsov-Ogievskiy wrote:
> We are going to deprecate drive-backup, so don't mention it here.
> Moreover, blockdev-backup seems more correct in the context.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>   docs/block-replication.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/block-replication.txt b/docs/block-replication.txt
> index 108e9166a8..59eb2b33b3 100644
> --- a/docs/block-replication.txt
> +++ b/docs/block-replication.txt
> @@ -79,7 +79,7 @@ Primary |                 ||  Secondary disk <--------- hidden-disk 5 <---------
>                             ||        |                         |
>                             ||        |                         |
>                             ||        '-------------------------'
> -                          ||           drive-backup sync=none 6
> +                          ||         blockdev-backup sync=none 6
>   
>   1) The disk on the primary is represented by a block device with two
>   children, providing replication between a primary disk and the host that
> @@ -101,7 +101,7 @@ should support bdrv_make_empty() and backing file.
>   that is modified by the primary VM. It should also start as an empty disk,
>   and the driver supports bdrv_make_empty() and backing file.
>   
> -6) The drive-backup job (sync=none) is run to allow hidden-disk to buffer
> +6) The blockdev-backup job (sync=none) is run to allow hidden-disk to buffer
>   any state that would otherwise be lost by the speculative write-through
>   of the NBD server into the secondary disk. So before block replication,
>   the primary disk and secondary disk should contain the same data.
> 


