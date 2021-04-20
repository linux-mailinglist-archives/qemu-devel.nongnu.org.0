Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B173651F8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 07:55:32 +0200 (CEST)
Received: from localhost ([::1]:49542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYjMB-0000gM-Ch
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 01:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYjKf-0008GA-Rk
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 01:53:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYjKe-0004xr-3M
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 01:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618898035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wEkzzaSvGbGOOIWU4lUJSgKpG7XRNsQrGq5EjDyIjdE=;
 b=UBlTdttYp5aO++TM5Djw8Lsk2l8uCX688JC2PKNmSO+yeLCRjXIb67qjBkNSlcv7LyQCds
 9abxvwIEpwC+q1fvnX+jLciGSBADMCLa9mrrueM5Z6262MlKVpHtGUo4+aSSNN7qAyFG6w
 2zXINj+G8eGUccoZ1YBmw4iC3ljNJs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-huHQu9PzOFqZMl9s2CVg8w-1; Tue, 20 Apr 2021 01:53:53 -0400
X-MC-Unique: huHQu9PzOFqZMl9s2CVg8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E2DF835BC5;
 Tue, 20 Apr 2021 05:53:52 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 424BC101F965;
 Tue, 20 Apr 2021 05:53:47 +0000 (UTC)
Subject: Re: [PATCH 02/14] hw/block/nvme: rename __nvme_advance_zone_wp
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210419192801.62255-1-its@irrelevant.dk>
 <20210419192801.62255-3-its@irrelevant.dk>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3c87c7a4-94dd-2b73-c5fb-d268d6addf5d@redhat.com>
Date: Tue, 20 Apr 2021 07:53:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210419192801.62255-3-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/2021 21.27, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Get rid of the (reserved) double underscore use.
> 
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/block/nvme.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 002c0672b397..d1b94e36c6fb 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1745,8 +1745,8 @@ static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone)
>       return nvme_zrm_open_flags(ns, zone, 0);
>   }
>   
> -static void __nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
> -                                   uint32_t nlb)
> +static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
> +                                 uint32_t nlb)
>   {
>       zone->d.wp += nlb;
>   
> @@ -1766,7 +1766,7 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
>       nlb = le16_to_cpu(rw->nlb) + 1;
>       zone = nvme_get_zone_by_slba(ns, slba);
>   
> -    __nvme_advance_zone_wp(ns, zone, nlb);
> +    nvme_advance_zone_wp(ns, zone, nlb);
>   }
>   
>   static inline bool nvme_is_write(NvmeRequest *req)
> @@ -2155,7 +2155,7 @@ out:
>           uint64_t sdlba = le64_to_cpu(copy->sdlba);
>           NvmeZone *zone = nvme_get_zone_by_slba(ns, sdlba);
>   
> -        __nvme_advance_zone_wp(ns, zone, ctx->nlb);
> +        nvme_advance_zone_wp(ns, zone, ctx->nlb);
>       }
>   
>       g_free(ctx->bounce);
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


