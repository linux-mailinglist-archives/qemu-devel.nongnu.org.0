Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E9F60028B
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 19:55:04 +0200 (CEST)
Received: from localhost ([::1]:41294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok7qp-0001zi-SR
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 13:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <julien@xen.org>) id 1ok7p6-0000cb-RH
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 13:53:16 -0400
Received: from mail.xenproject.org ([104.130.215.37]:51040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <julien@xen.org>) id 1ok7p5-0006Ay-Bg
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 13:53:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID;
 bh=UDBmlnzgtdCje0DtWepmdbJUxUQTxMSyPzW8sUlZpIU=; b=KkiiteRmmJp0iKe7sVImkRwXxS
 jiPYGq9v0/po9gtZsFiWhhtk3Pb8bmJFrwRx96Jdj6/USdVkfGbcxXONm1MAhp//Oos4GvolPnxN4
 F9AqTqXWM9+rfzVPNdXbg4N2uTGUfh9ptzBnNPRfEv46EOgQcLcV9e8l6D9VXjepSLz4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ok7p3-0003Px-Rp; Sun, 16 Oct 2022 17:53:13 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.85.34.141])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ok7p3-00030k-Ky; Sun, 16 Oct 2022 17:53:13 +0000
Message-ID: <78881214-c8a1-0156-e279-6c2598348a87@xen.org>
Date: Sun, 16 Oct 2022 18:53:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v1 07/12] include/hw/xen/xen_common: return error from
 xen_create_ioreq_server
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-8-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221015050750.4185-8-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=104.130.215.37; envelope-from=julien@xen.org;
 helo=mail.xenproject.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Vikram,

On 15/10/2022 06:07, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> This is done to prepare for enabling xenpv support for ARM architecture.
> On ARM it is possible to have a functioning xenpv machine with only the
> PV backends and no IOREQ server. If the IOREQ server creation fails,
> continue to the PV backends initialization.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   include/hw/xen/xen_common.h | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> index 77ce17d8a4..c2d2f36bde 100644
> --- a/include/hw/xen/xen_common.h
> +++ b/include/hw/xen/xen_common.h
> @@ -467,8 +467,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
>   {
>   }
>   
> -static inline void xen_create_ioreq_server(domid_t dom,
> -                                           ioservid_t *ioservid)
> +static inline int xen_create_ioreq_server(domid_t dom,
> +                                          ioservid_t *ioservid)
>   {

I think there is a return missing here.

>   }
>   
> @@ -600,8 +600,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
>                                                     PCI_FUNC(pci_dev->devfn));
>   }
>   
> -static inline void xen_create_ioreq_server(domid_t dom,
> -                                           ioservid_t *ioservid)
> +static inline int xen_create_ioreq_server(domid_t dom,
> +                                          ioservid_t *ioservid)
>   {
>       int rc = xendevicemodel_create_ioreq_server(xen_dmod, dom,
>                                                   HVM_IOREQSRV_BUFIOREQ_ATOMIC,
> @@ -609,12 +609,14 @@ static inline void xen_create_ioreq_server(domid_t dom,
>   
>       if (rc == 0) {
>           trace_xen_ioreq_server_create(*ioservid);
> -        return;
> +        return rc;
>       }
>   
>       *ioservid = 0;
>       use_default_ioreq_server = true;
>       trace_xen_default_ioreq_server();
> +
> +    return rc;
>   }
>   
>   static inline void xen_destroy_ioreq_server(domid_t dom,

Cheers,

-- 
Julien Grall

