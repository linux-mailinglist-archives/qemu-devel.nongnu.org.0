Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87EA48C6EC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:16:47 +0100 (CET)
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fMk-0002NT-A6
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:16:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n7eed-0001qa-NF; Wed, 12 Jan 2022 09:31:11 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:45393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n7eeb-0000LZ-UH; Wed, 12 Jan 2022 09:31:11 -0500
Received: from [192.168.100.1] ([82.142.23.158]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M6H7o-1n155840Xw-006bSI; Wed, 12 Jan 2022 15:30:59 +0100
Message-ID: <dc3a2d1d-9f89-263e-5c77-6ed5936462e3@vivier.eu>
Date: Wed, 12 Jan 2022 15:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] hw/scsi/megasas: Simplify using the ldst API
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211218111912.1499377-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211218111912.1499377-1-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+9zGUtIkshAjZLhgFc5HqiK265w8i6eEPbGtuOj0yArFBK9Xd82
 P0ewglq8dQm3gg+BCLvaygZCF0SCbZQkzSyyKQxfM/knUyxEpH9ox+/ZNShkkQ/OfXoNdOx
 dWm64kA5ZSC8qZ1mjAwgUpURVhRtt2A7+VuFD6+WG9wKNfbWk+9Su9lsGqpIIBLbEhETHkz
 eziuElVBBH/OEQPYhZIaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eSgij49ASgw=:QGbs7P1XLyOuidIVscynfm
 xjF/RPhBs8Un/A4tAANJSjRe0nA+TZznihnLOUJSrEqwyuQqJBhhYBHbKByAma4kiWqwlAg6g
 VDwWVtm1FGEUmlVen9D24EQHFEIrTTtBn2ZZJuhe95Ezf++S03OZWFimgorVlWT4MEC7h5MAg
 K9If9yzUAgEJOhJ2JFeCPDq8TOAfvRl0hmTP3RXJwi8iewOelkVxUH5eYmJ3K75jOptHzTsPg
 /ZvOx5rYb5bOPcEah1nRI5fZjYC/F930PRfHElssrHAW9fjgDyVNM7jpMqbPjd/VPvRUXksuM
 st0FIcyuz03cigRl3n2IyPu23EQNPkfp2+PHx5F/ukLD7KchF/aIM43XLRhp6Yxl501TZElNa
 kCpY6x77ce2JijqS7wQ6k6/agbQBQ2pGAJcMT01NjFLfGpy1vWfdcgQTKPEGkGISAlSpR2+QW
 auVpBNfzbcjoj4NRMoKH2ALvSLaDOZ9p7+AVK/9A5H+EYe+gFDWK6PYWqWIQPnz7Wo3dNozdE
 EY/Vnzbf8YkHrtNTW0D3UuCZl+uzpVG0xGSmyW77BMcP7kOZZnA8LdjzPGKmQ2eqmPpIain1S
 dyTg/JkwzUlodL4jE1P5BmvHfN21wwuCQlYNmJNcwMVGJqc5l3affMzhjb4XyTC8VAoI3ZYpj
 xiaspnFcgsU79EXpEIZ+fhxEdmxsroRJgMX5K1kZfvTZLGX6Gka5xpmLjJM21GMUQEvI=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/12/2021 à 12:19, Philippe Mathieu-Daudé a écrit :
> This code is easier to review using the load/store API.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: Fixed offset in megasas_setup_inquiry (rth)
> ---
>   hw/scsi/megasas.c | 17 +++--------------
>   1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index 619b66ef0f3..9a4e9ba87e6 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -375,8 +375,7 @@ static int megasas_setup_inquiry(uint8_t *cdb, int pg, int len)
>           cdb[1] = 0x1;
>           cdb[2] = pg;
>       }
> -    cdb[3] = (len >> 8) & 0xff;
> -    cdb[4] = (len & 0xff);
> +    stw_be_p(&cdb[3], len);
>       return len;
>   }
>   
> @@ -392,18 +391,8 @@ static void megasas_encode_lba(uint8_t *cdb, uint64_t lba,
>       } else {
>           cdb[0] = READ_16;
>       }
> -    cdb[2] = (lba >> 56) & 0xff;
> -    cdb[3] = (lba >> 48) & 0xff;
> -    cdb[4] = (lba >> 40) & 0xff;
> -    cdb[5] = (lba >> 32) & 0xff;
> -    cdb[6] = (lba >> 24) & 0xff;
> -    cdb[7] = (lba >> 16) & 0xff;
> -    cdb[8] = (lba >> 8) & 0xff;
> -    cdb[9] = (lba) & 0xff;
> -    cdb[10] = (len >> 24) & 0xff;
> -    cdb[11] = (len >> 16) & 0xff;
> -    cdb[12] = (len >> 8) & 0xff;
> -    cdb[13] = (len) & 0xff;
> +    stq_be_p(&cdb[2], lba);
> +    stl_be_p(&cdb[2 + 8], len);
>   }
>   
>   /*

Applied to my trivial-patches branch.

Thanks,
Laurent

