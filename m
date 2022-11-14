Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFDA628E80
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:38:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouire-000510-S5; Mon, 14 Nov 2022 18:27:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ouihh-0004K8-1C
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:17:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ouRsw-0005eD-EQ
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 00:19:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668403192;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cQRMEBR8zESgawCjWsKuy1MeklujBJqjneqPP9aQdNo=;
 b=BsmJbRDn7PSiuVMX9boi8kJb+QB70wC5tpykiQPbpTT4vm7TBr+HQg776f5HbfgvRpflgQ
 Tahz70Q8uAKsZPeb2ixg1Yx5e+6t6dNPbUKaz2VDKuKoBmaTIDE7vmts6aclUhFZlakWz6
 SWjITGpYMAP/7apFWerVRrTMtQGJ9cw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-t0bw63QHM02qiAkTLRknQQ-1; Mon, 14 Nov 2022 00:19:48 -0500
X-MC-Unique: t0bw63QHM02qiAkTLRknQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65759833A09;
 Mon, 14 Nov 2022 05:19:48 +0000 (UTC)
Received: from [10.67.24.81] (unknown [10.67.24.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C2AB39D6A;
 Mon, 14 Nov 2022 05:19:44 +0000 (UTC)
Subject: Re: [PATCH v4] qapi/qom: Memory backend property prealloc-threads doc
 fix
To: Zhenyu Zhang <zhenyzha@redhat.com>, qemu-devel@nongnu.org
Cc: imammedo@redhat.com, armbru@redhat.com, philmd@linaro.org,
 eric.auger@redhat.com, lijin@redhat.com
References: <20221114032431.195098-1-zhenyzha@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <721da29c-cf24-c39a-c649-e5028ce1d7ca@redhat.com>
Date: Mon, 14 Nov 2022 13:19:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20221114032431.195098-1-zhenyzha@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/14/22 11:24 AM, Zhenyu Zhang wrote:
> Commit ffac16fab3 "hostmem: introduce "prealloc-threads" property"
> (v5.0.0) changed the default number of threads from number of CPUs
> to 1.  This was deemed a regression, and fixed in commit f8d426a685
> "hostmem: default the amount of prealloc-threads to smp-cpus".
> Except the documentation remained unchanged.
> 
> Update 'qapi/qom.json' to reflect the change in commit f8d426a6852c.
> 
> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
> 
> v4: Fix the line exceeding 80 characters limitation issue  (Gavin)
> v3: Covers historical descriptions                         (Markus)
> v2: The property is changed to smp-cpus since 5.0          (Phild)
> 
> ---
>   qapi/qom.json | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/qapi/qom.json b/qapi/qom.json
> index 30e76653ad..f4a7917f3d 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -576,7 +576,8 @@
>   #
>   # @prealloc: if true, preallocate memory (default: false)
>   #
> -# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
> +# @prealloc-threads: number of CPU threads to use for prealloc
> +#                    (default: number of CPUs) (since 5.0)
>   #
>   # @prealloc-context: thread context to use for creation of preallocation threads
>   #                    (default: none) (since 7.2)
> 


