Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BED4EE1C1
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 21:33:31 +0200 (CEST)
Received: from localhost ([::1]:46018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na0Xy-0001j1-TX
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 15:33:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na0Vr-0008KV-OC; Thu, 31 Mar 2022 15:31:19 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:44425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na0Vq-0000Sy-6n; Thu, 31 Mar 2022 15:31:19 -0400
Received: from [192.168.100.1] ([82.142.13.234]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M4384-1na0Vm1NqK-0005SL; Thu, 31 Mar 2022 21:31:14 +0200
Message-ID: <79d5d50f-a22a-e1a2-cac1-bfd6cf1a4fff@vivier.eu>
Date: Thu, 31 Mar 2022 21:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] vhost-vdpa: fix typo in a comment
Content-Language: fr
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
References: <20220328152022.73245-1-sgarzare@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220328152022.73245-1-sgarzare@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lkyrJRGUgR9BDlWJ7vV3DYHa74BFo7i6Z8djQ8oA0rYadMV4gBx
 k2AyLkr0eomiltXHCDeHBq7Qdxsg6PpWv5j88qqhtmZdMOObl7sRw76u3JhOlgs8f+skfbR
 tOQ+ZWNOTQ8/+d+n0CKqZCB6tB1QZz8TGaYp6bzKNGRq9lNyJQ8t4jTpQhnohXmBgRx7nRF
 TMc2T8EJQ2gsGMl8lTrsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oN+CQpt+pFg=:Nu6kUHmHyn9doXSimA5hjy
 y1IoLIqcIzlaTsxZsVA81a77tL+uvAjMOziNZImooBLEPUPr0PXquQUTdsPqkOU12vbb7nnCT
 p2u5J1hWF+8uXTw1dohfcC+A1IGPyJ2d+DEBshFNlEQOITvz3jk6NYedabmiCYFV+UgN6JdYk
 lKPKVcUMU0aOuK3jbMAA6xI4JWw5vAf3JpEQJiqQJthk7k0F7Itl96TaFFgfMPFvyN6Qxf006
 wvG57GLJh2Edu+H9w0sXmS458ugUAk7njZNtzo2t3rKKTDA+q9xENZ/9wGoz5MMixw4YSM0wY
 Qk+C/MDF+nKocHiIdULlYQvVXQRYYVulAc96aX4BuEs/d/okOULJ3vDmvzp7xw30LiSDw+Si+
 ETKtQR9hpLpTd80UXdzEGGtj+wn5Nwv66+WC92K7ywWRUamz7t6UWyzzLEdDY6M6YMR2yt9Hp
 azkmpK0TxbXWDp7uso9S7tWEv7TShfc0CdhzDGkcx4A9HH/Lnwxz6BzKAjKc+4wBSF1wpo4K7
 dTDVLspag3kCBaP3ZcgVpIVsnnRwHI1UvqSpTOgG96Cxp4dz0DM1pacfOEeFHxUFrhG8HT1o+
 /gjK2p7ztwZ0GGFO+AbzFEjiqgyp7mLdpF6IL5WZzhfO4i1yYhdirfiq8/0V01iX1Hm40qtn0
 /reOCL70nimxbX8ValOtSypk8LrNHNDO6cnl76dBkT8+b4M4a2R351MEY3VbECvzXMhE=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 28/03/2022 à 17:20, Stefano Garzarella a écrit :
> Replace vpda with vdpa.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index c5ed7a3779..8adf7c0b92 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -299,7 +299,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>       memory_region_unref(section->mr);
>   }
>   /*
> - * IOTLB API is used by vhost-vpda which requires incremental updating
> + * IOTLB API is used by vhost-vdpa which requires incremental updating
>    * of the mapping. So we can not use generic vhost memory listener which
>    * depends on the addnop().
>    */

Applied to my trivial-patches branch.

Thanks,
Laurent


