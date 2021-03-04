Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFFC32D620
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:11:24 +0100 (CET)
Received: from localhost ([::1]:57082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpdL-0008Tm-Lw
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lHpO9-0001HD-2U
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:55:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lHpO2-0002MZ-KM
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614869733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=59XIxWr6OezcfeCXkbINSF/oRjTLKqgA2W4Gzsq+Hrc=;
 b=D2k1Eg7Hmmf6y35wBlLXBHJl3z9Uh/Yu0y7ND3x9CemDmgV2LJpmgWjswO3uobJgyn8kME
 ewQ3x/7QnP0x5noXxZw0Zcy3p4ei8E8T5XIF26NQKCM6uDDIp03CrkAfH00ayMQmDgGoUB
 MKdlcaRDzRaXILwOUqRbjUczXogu3I4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-0cGcoLG0PWeVxHL1Y9tHUg-1; Thu, 04 Mar 2021 09:55:29 -0500
X-MC-Unique: 0cGcoLG0PWeVxHL1Y9tHUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B2878018A2;
 Thu,  4 Mar 2021 14:55:28 +0000 (UTC)
Received: from [10.3.113.71] (ovpn-113-71.phx2.redhat.com [10.3.113.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45F2850FA2;
 Thu,  4 Mar 2021 14:55:28 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: add Vladimir as co-maintainer of NBD
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210304103503.21008-1-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <78bb72a8-27ce-f919-5e1a-c1bfb86d573a@redhat.com>
Date: Thu, 4 Mar 2021 08:55:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304103503.21008-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 4:35 AM, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> I have good knowledge of the subsystem and I'm an author of large part
> of it :) 

Reviewed-by: Eric Blake <eblake@redhat.com>

I'll include this in my next NBD pull request

> 
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 92ba1fce5e..58994bfafc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3024,6 +3024,7 @@ F: block/iscsi-opts.c
>  
>  Network Block Device (NBD)
>  M: Eric Blake <eblake@redhat.com>
> +M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>  L: qemu-block@nongnu.org
>  S: Maintained
>  F: block/nbd*
> @@ -3034,6 +3035,7 @@ F: blockdev-nbd.c
>  F: docs/interop/nbd.txt
>  F: docs/interop/qemu-nbd.rst
>  T: git https://repo.or.cz/qemu/ericb.git nbd
> +T: git https://src.openvz.org/scm/~vsementsov/qemu.git nbd
>  
>  NFS
>  M: Peter Lieven <pl@kamp.de>
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


