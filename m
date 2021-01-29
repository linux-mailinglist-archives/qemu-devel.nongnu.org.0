Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06F3308785
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:43:41 +0100 (CET)
Received: from localhost ([::1]:50470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5QJY-0007VQ-RF
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5QFN-0004j3-Gj
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:39:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5QFL-0005Xm-8w
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611913158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=01TV4XaTRj+lCvx0n1xoGv1Xk/N/CjVMoYyvMRxjhwE=;
 b=Ay/FjcJDVWS0nNyiKaJe4b/Uu2dTLyafqK5Vh3j2QwIwOHwCLvs+u6hsIJfgf92zCHh2fQ
 +zN0NamztdKgY7Tkym8hLJrUZAdS5o/SKvcbaUVKCnXz1fiRd/VXNddeiu2Bc6Rvp3RKTO
 TZDjX5M7XEoV1XxtmymBhMmdqqioTQU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-nZa-VWB1M7S3OKjqjuCyeQ-1; Fri, 29 Jan 2021 04:39:16 -0500
X-MC-Unique: nZa-VWB1M7S3OKjqjuCyeQ-1
Received: by mail-wr1-f71.google.com with SMTP id o17so4739791wrv.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 01:39:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=01TV4XaTRj+lCvx0n1xoGv1Xk/N/CjVMoYyvMRxjhwE=;
 b=Or/7RiQwgnsUJgzZnpZPgMtnj/CvIc82/dmEqj69FMDHigUQZYObEvYMLMdeRftGV5
 V5iLIUv6xpXDrKasq80+yXWJSztleGE4MrHy5rmEU/VX1+uS8/+l7U0QKn9ZVz716jAC
 rIlpgprlqHB+DtMk7UbRR4OyTiWkg+rVQb3Lo8rqqfUIL7uYrq2RiS2Mhj5ixonlRVUS
 QZSKwMil3oS5TtFZYfH914ZaY+fuffFDlbTxniDWD1R4fEFCuWTwzOjXDs171ZsEvmKV
 046NjBVtRoABUWNF3FdIWrji4v/iRofLYTyQyChWzGW6Ij+N+pqu1+67VGdyu29g0+FE
 kWOw==
X-Gm-Message-State: AOAM533aJv6CPIJla+ySoM2OZumqr4HiI6h94cP4CU2qJLec/OJ/LNh8
 FLIAmb6rO9gOqs2GVywOpSlSRLZ1OZOi0+O8jxDwRYnm2e2Hngn87+J43VA8kYWcuVsVMMhrz6b
 akYWEYA9E47cIXjA=
X-Received: by 2002:adf:f307:: with SMTP id i7mr3396044wro.367.1611913155045; 
 Fri, 29 Jan 2021 01:39:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTQ87FSDS52w4/aOQGFIfiW4xS5fmwYhjA16XfYBD4rdRW8DRc1uDl62NhPMp1XxtzmbIqdA==
X-Received: by 2002:adf:f307:: with SMTP id i7mr3396033wro.367.1611913154910; 
 Fri, 29 Jan 2021 01:39:14 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m82sm9281880wmf.29.2021.01.29.01.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 01:39:14 -0800 (PST)
Subject: Re: [PATCH] pnv/ppc: Set default RAM size to 1 GB
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210129092936.769412-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <efcf457d-8390-4352-6180-ac9fd6d78b24@redhat.com>
Date: Fri, 29 Jan 2021 10:39:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129092936.769412-1-clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Joel Stanley <joel@jms.id.au>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 10:29 AM, Cédric Le Goater wrote:
> Any value below will result in a skiboot crash :
> 
>     [    0.034949905,3] MEM: Partial overlap detected between regions:
>     [    0.034959039,3] MEM: ibm,firmware-stacks [0x31c10000-0x3a450000] (new)
>     [    0.034968576,3] MEM: ibm,firmware-allocs-memory@0 [0x31c10000-0x38400000]
>     [    0.034980367,3] Out of memory adding skiboot reserved areas
>     [    0.035074945,3] ***********************************************
>     [    0.035093627,3] < assert failed at core/mem_region.c:1129 >
>     [    0.035104247,3]     .
>     [    0.035108025,3]      .
>     [    0.035111651,3]       .
>     [    0.035115231,3]         OO__)
>     [    0.035119198,3]        <"__/
>     [    0.035122980,3]         ^ ^
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/ppc/pnv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 50810df83815..70ce12f6dc73 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1994,7 +1994,7 @@ static void pnv_machine_class_init(ObjectClass *oc, void *data)
>       * RAM defaults to less than 2048 for 32-bit hosts, and large
>       * enough to fit the maximum initrd size at it's load address
>       */
> -    mc->default_ram_size = INITRD_LOAD_ADDR + INITRD_MAX_SIZE;
> +    mc->default_ram_size = 1 * GiB;

Maybe also just in case add before the definitions:

  QEMU_BUILD_BUG_ON(INITRD_LOAD_ADDR + INITRD_MAX_SIZE > 1 * GiB);

?

>      mc->default_ram_id = "pnv.ram";
>      ispc->print_info = pnv_pic_print_info;
>      nc->nmi_monitor_handler = pnv_nmi;
> 


