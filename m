Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A09492509
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:38:11 +0100 (CET)
Received: from localhost ([::1]:44760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9moU-0005KE-1T
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:38:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9mkn-0001t2-O5; Tue, 18 Jan 2022 06:34:21 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:46583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9mkl-0001Lz-EM; Tue, 18 Jan 2022 06:34:20 -0500
Received: from [192.168.100.1] ([82.142.13.186]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mq33i-1mVU7B1f4U-00n8ll; Tue, 18 Jan 2022 12:34:07 +0100
Message-ID: <e878ef6a-f759-5e0f-816a-79f0a37c64ad@vivier.eu>
Date: Tue, 18 Jan 2022 12:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] softmmu: Provide a clue as to why device tree loading
 failed
Content-Language: fr
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220116114649.40859-1-shentey@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220116114649.40859-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2ySk6UO45EizpAzrlhVMc4yaKNxLc+z9SbxuiQVJmyC5N7uxtgx
 mbFmF8P2x5zDwmSozesmuoNL3zKSzCgY1E4Xzi+NwE1ODCzb8JnFcaDVTil5/3wElbjbAqe
 aNZgmJDWmL3HPYKoFu6mJ2T2yj7ska4wT8ts617nSWNQqopo6s4bDboxXN4CmGKBo9quv1z
 EU67A2ltpwv6idxeD+KIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NuVqYiUcD7w=:CQrvzAHEmGQWt5N4Uam7nF
 FmVoTpAB4jneuq5ZYAlnxLFpnhmM8YqZHDmwB3n/SfBQCyZpDI8jBEVHJc5soH1AZ409TGisE
 MSSO4W0WIKaJxXPvhFzjRIv2ti9jGhpYSPUPurhYLMv3uireV/DC+h8W04ZpTJQmFVAz+pWar
 hbLkadIsHo67rnqHtPKp1Rcm/VqWE0EYSDYlIVvKM/9gShtAy6ZUq6ZjY9Ju9NLYTxmqjlUS9
 +mcxcGi+Ai9g7Pztph0oqHHvCOlZHl03z+MQCepSJJtQ87Oe6XBunPvIo7BR0GGBQXrOzXVPG
 fyET2uMlXQ8OYLnBXvdpwJroZFyWijYZg64oyAhPXbAo/gvQoQRU1NkOqdsR0PtpyS8hjy7KQ
 HmOnbx8iM58XMYcdUOvosN2y85DgfMqGt4VuSNdk/vyXQeTNUOXeT+qyS3xGJYcS8PXWjgNZw
 xHC8m8dv/RzZZg2KylGPaXG09BvDrNNQa74Zxc0gV3o4CuTzG5BqMJOfJV8WLc7zQtjsB/IPO
 zVksXPqsE4JYZzywEHN2xa3CEyQfdBOkWoFlKVeXTyKkAlvzVfWX0T04WQoU7OV9JPpJwX5Ac
 Na1o+q9kjwXh+va/urkOfCjDzZyVa0xqjDyVbIVDlovN6tx7g89vNTAYC/1TOAr0UXviT1jwT
 2nlOIg+oejLtkR7jIzr3glje6qljuk9bw2ev7gcYdLhP0SQYCvxYt39pLL8ejLH5n4Jg=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/01/2022 à 12:46, Bernhard Beschow a écrit :
> fdt_open_into() obligingly returns an error code in case the operation
> failed. So be obliging as well and use it in the error message.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   softmmu/device_tree.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 3965c834ca..31d1066940 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -60,7 +60,8 @@ void *create_device_tree(int *sizep)
>       }
>       ret = fdt_open_into(fdt, fdt, *sizep);
>       if (ret) {
> -        error_report("Unable to copy device tree in memory");
> +        error_report("%s: Unable to copy device tree into memory: %s",
> +                     __func__, fdt_strerror(ret));
>           exit(1);
>       }
>   
> @@ -104,7 +105,8 @@ void *load_device_tree(const char *filename_path, int *sizep)
>   
>       ret = fdt_open_into(fdt, fdt, dt_size);
>       if (ret) {
> -        error_report("Unable to copy device tree in memory");
> +        error_report("%s: Unable to copy device tree into memory: %s",
> +                     __func__, fdt_strerror(ret));
>           goto fail;
>       }
>   


Applied to my trivial-patches branch.

Thanks,
Laurent

