Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13122F7596
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:38:28 +0100 (CET)
Received: from localhost ([::1]:58638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0LYp-0003CQ-Rv
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1l0LXk-0002Jv-2o
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:37:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1l0LXi-0002fg-Ck
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610703436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BBFmHW/hskTQGqFHdrpkVNS/QUPIu1bLyKfDfQNSiSs=;
 b=bF8yfRwwZv8dnZTAoWLfV0qMx1g2RsNREIb4bJWoHs5/ttQUHov4ydzwOMSPBZcS13HHaI
 VqWezX1JhccB7YvknHREgnC6Q4d2TUIx5rMA1QBGm7GDZNa49jhxQsXOcibOewYA0zUebT
 bzY5CJ+U4oDNXIVbi50J5dW9cYVpI5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-J3vP7BfiNDu4vGuaE0Z64Q-1; Fri, 15 Jan 2021 04:36:09 -0500
X-MC-Unique: J3vP7BfiNDu4vGuaE0Z64Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76B1F1922028
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 09:36:08 +0000 (UTC)
Received: from [10.40.194.52] (unknown [10.40.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A44C5C1A3;
 Fri, 15 Jan 2021 09:36:07 +0000 (UTC)
Subject: Re: [PATCH v2] machine: add missing doc for memory-backend option
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210114234612.795621-1-imammedo@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <d3bb0b7d-6c1f-90d9-1bd9-a89eef994462@redhat.com>
Date: Fri, 15 Jan 2021 10:36:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114234612.795621-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, pkrempa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 12:46 AM, Igor Mammedov wrote:
> Add documentation for '-machine memory-backend' CLI option and
> how to use it.
> 
> And document that x-use-canonical-path-for-ramblock-id,
> is considered to be stable to make sure it won't go away by accident.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v2:
>   - add doc that x-use-canonical-path-for-ramblock-id is considered stable,
>     (Peter Krempa <pkrempa@redhat.com>)
> ---
>   backends/hostmem.c | 10 ++++++++++
>   qemu-options.hx    | 28 +++++++++++++++++++++++++++-
>   2 files changed, 37 insertions(+), 1 deletion(-)
> 


> @@ -96,6 +97,31 @@ SRST
>       ``hmat=on|off``
>           Enables or disables ACPI Heterogeneous Memory Attribute Table
>           (HMAT) support. The default is off.
> +
> +     ``memory-backend='id'``
> +        An alternative to legacy ``-mem-path`` and ``mem-prealloc`` options.
> +        Allows to use a memory backend as main RAM.
> +
> +        For example:
> +        ::
> +        -object memory-backend-file,id=pc.ram,size=512M,mem-path=/hugetlbfs,prealloc=on,share=on
> +        -machine memory-backend=pc.ram
> +        -m 512M
> +
> +        Migration compatibility note:
> +        a) as backend id one shall use value of 'default-ram-id', advertised by
> +        machine type (available via ``query-machines`` QMP command)
> +        b) for machine types 4.0 and older, user shall
> +        use ``x-use-canonical-path-for-ramblock-id=on`` backend option
> +        (this option must be considered stable, as if it didn't have the 'x-'
> +        prefix including deprecation period, as long as 4.0 and older machine
> +        types exists),
> +        if migration to/from old QEMU (<5.0) is expected.
> +        For example:
> +        ::
> +        -object memory-backend-ram,id=pc.ram,size=512M,x-use-canonical-path-for-ramblock-id=on
> +        -machine memory-backend=pc.ram
> +        -m 512M

Igor, this doesn't correspond with your comment in bugzilla:

https://bugzilla.redhat.com/show_bug.cgi?id=1836043#c31

In fact, we had to turn the attribute OFF so that canonical path is not 
used. Isn't ON the default state anyway?

Michal


