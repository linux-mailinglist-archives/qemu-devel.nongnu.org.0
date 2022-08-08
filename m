Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2850F58C2C8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 07:23:19 +0200 (CEST)
Received: from localhost ([::1]:38096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKvEU-0001e8-9E
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 01:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oKvBN-0006sp-3F; Mon, 08 Aug 2022 01:20:05 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:54455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oKvBK-0003Dj-SJ; Mon, 08 Aug 2022 01:20:04 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLR5h-1o4Ddr2991-00ISBo; Mon, 08 Aug 2022 07:19:52 +0200
Message-ID: <61f278fd-2720-9237-84c8-37c5828fcdae@vivier.eu>
Date: Mon, 8 Aug 2022 07:19:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
Content-Language: fr
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: raphael.norwitz@nutanix.com, mst@redhat.com, qemu-trivial@nongnu.org
References: <20220630085219.1305519-1-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220630085219.1305519-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JrzjbrOPQ4GmQ2QM1eMmjP4wxNd5wHL2nStgkfOpRPexEgdIJ6e
 qvXLFYB+OkWNgeT6AR+31vnNfJ9wgopGCgPUHnBEZWpwNq9ZsPd2lkl4BqpqZKD0glmekLZ
 V75+M2ljqgUdvtYNunkOShTWIgDOYpUPNw2SO3Zqtc43bkYlvMEIEWZ6DoR6aMhD2YFomHx
 D2MJYlCymFOpOM0jYirqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b7YriJ0MveI=:VmUAlnJOTvB6Gt2cH6ZRnp
 NyflS35aGRI7iEm5uLqUTdeNbxCH90cES6j4dYXa7s//m+A+4N0v7nvn43Wfb/bcbCGV2BJR2
 jFTbQW+accbvOjkFn5lmcocTcli9kRfNqjOGFZ+/da2ODU9uas3w/bv5LnC3NZUWh0tupOn4W
 TiyyvAgUhqoLbD5ZUEM6+dtBNlTX1BGKx04kO46PYexE3Y4vPDqq1p0dReP9ikS3bv8PmKLwP
 mTxpkodJTpunsLd+fNBL9g9XDbWq9TjCPCM9q7JzlqLwXOGZDTJBOTTlxeSN1vW3gE3bWEZWv
 PJW4gQHT3v7EsqpsZeSWu3RHKYRG1qvRm1egUY3c7pmpX2z8DULeAAhl1dbzezIiy7LV6rDzJ
 BKUO+5d+EJSUPlUZIhlphY0PEZj9UNAJleHpkyP90CSS5bj5vlYo5EStFHW2b6Dk8jHfroQ2+
 Cx2DBgSmEeFxVWTCTA5D/Nv/hzt9iAYaVWd2JIwaQ++zW+3wiS4H7wS9aSAqN3gehPP3qbs/v
 ZvdeTyJhWMuwQ+l+61RbCJbbFIcaUhlKSbvILzlG8P5XNCcj0FkYw4wrLGDxCeJUiFeQj+xDW
 vQ/AvBTR+WAeGVSfz7zNM+kt6MWMfniUruLru4aQe9+9oatUMG4m6zKWMCrdKICDYnxoE+xc6
 qcnUTysbQ2oShhUh34czXmhMn81YsnnQhbT5XZz61LOpsPxf0/C56oSKzSiGrELjkVukFOfCn
 qSO2c4FUK+A2xHEdvbfsYMV5wjh8dSvVTKTP8g==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/06/2022 à 10:52, Markus Armbruster a écrit :
> We allocate VuVirtqElement with g_malloc() in
> virtqueue_alloc_element(), but free it with free() in
> vhost-user-blk.c.  Harmless, but use g_free() anyway.
> 
> One of the calls is guarded by a "not null" condition.  Useless,
> because it cannot be null (it's dereferenced right before), and even
> it it could be, free() and g_free() do the right thing.  Drop the
> conditional.
> 
> Fixes: Coverity CID 1490290
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> Not even compile-tested, because I can't figure out how this thing is
> supposed to be built.  Its initial commit message says "make
> vhost-user-blk", but that doesn't work anymore.
> 
>   contrib/vhost-user-blk/vhost-user-blk.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
> index 9cb78ca1d0..d6932a2645 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -106,10 +106,7 @@ static void vub_req_complete(VubReq *req)
>                     req->size + 1);
>       vu_queue_notify(vu_dev, req->vq);
>   
> -    if (req->elem) {
> -        free(req->elem);
> -    }
> -
> +    g_free(req->elem);
>       g_free(req);
>   }
>   
> @@ -243,7 +240,7 @@ static int vub_virtio_process_req(VubDev *vdev_blk,
>       /* refer to hw/block/virtio_blk.c */
>       if (elem->out_num < 1 || elem->in_num < 1) {
>           fprintf(stderr, "virtio-blk request missing headers\n");
> -        free(elem);
> +        g_free(elem);
>           return -1;
>       }
>   
> @@ -325,7 +322,7 @@ static int vub_virtio_process_req(VubDev *vdev_blk,
>       return 0;
>   
>   err:
> -    free(elem);
> +    g_free(elem);
>       g_free(req);
>       return -1;
>   }

Applied to my trivial-patches branch.

Thanks,
Laurent



