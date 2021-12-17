Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8714C47888E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 11:13:40 +0100 (CET)
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myAF9-00021e-6w
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 05:13:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myACz-0000ej-7p; Fri, 17 Dec 2021 05:11:25 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:36301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myACx-0002S4-Dk; Fri, 17 Dec 2021 05:11:24 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N7Qt9-1mQPHc2uk9-017qA5; Fri, 17 Dec 2021 11:11:17 +0100
Message-ID: <63a9aa27-c7a0-a106-b8f2-a53047d94774@vivier.eu>
Date: Fri, 17 Dec 2021 11:11:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] device_tree: Fix compiler error
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20211108200756.1302697-1-sw@weilnetz.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211108200756.1302697-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Z3dsSa1iU3PoiXe8thnTuK0NSP8F8pVqNWDnmVTFaV2gk4t1HHJ
 S3BtorzEgGpVItsuEIP9OkT3B28HhvC4Js/la1bMoxjBkxYsuh5CpDOKMAdbuyLvgWtAW0H
 cTfl/QP160Dbtb5wTjm2RztwX49zr/hbs+W6tvqQVyN9stnl6X8H28SxrhI5zzEr7zfVJ6X
 plDcLu8OdKReVWzaz/JpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dQAgJuVxvj4=:QWVTycz2dQM3g2faK2rb4T
 8czXtGicTBrp6MSJFebTwVo6S6IF2fOGeypkNXl/Rj32d9SCrsdoYyCk98weRnvu1HnmPkdht
 3cT7a6S60FYE96KWSLfXIS6LmNjCSpmH9hkOkTidOyTILo6DacJMWKJw9nzNJudiMNtSrWOUZ
 I0PufBiMBKROlmPEgQnVHzJCKJL37zkFIe4X7gmVUfsrAM39ttnOhRL7UBsPqXmfUlVw/S+jl
 bhDEweupKu2fMWW1BbBJwYXa7WnYfnyrkljXF3vcVDGNytbAeTKcsozXvX6pPZwNAnMLnmxVw
 ZViqHnxLw3TKUqK1XyQ1Kd5X00MeaKoeemhuFTxdgLlLbGCs10Y6Sl0l/Hcyn+jvN7ERglCIR
 gff0gkeolvmWJpBvyL5ugPIzk0Vml/2sOBZu2/y/KMqe0XMtsVh/H74/L3gW3FFTqOwYTPPpu
 hAOJBNOdkhUNsE5CKZMsNVUl9K0njge1dMot5KUDIuEJbZcrZwFZ/olECAUwPhXq7Z92HXIQZ
 wFaBsfJqA0bVkdlVPzM+IQZbG96rOfOyyz+QD0vDkgsJIqP5PQWkhwrMaR3aRygpppdCpvUVe
 FWUdUJRJmq9hS6509MDmpKC5otcPPihVN6hUiWbICP+32jghbAxxzso9CQwidWL63V3Vgvojj
 8aIPr9jZUhH1GfYMBmhtQfdvbi60E8O8cQo688HFTDg/x+Msvfy/gx/fmcsvdEqMJbu0=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
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
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/11/2021 à 21:07, Stefan Weil a écrit :
> A build with gcc (Debian 10.2.1-6) 10.2.1 20210110 fails:
> 
> ../../../softmmu/device_tree.c: In function ‘qemu_fdt_add_path’:
> ../../../softmmu/device_tree.c:560:18: error: ‘retval’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    560 |     int namelen, retval;
>        |                  ^~~~~~
> 
> This is not a real error, but the compiler can be satisfied with a small change.
> 
> Fixes: b863f0b75852 ("device_tree: Add qemu_fdt_add_path")
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   softmmu/device_tree.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 3965c834ca..9e96f5ecd5 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -564,7 +564,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>           return -1;
>       }
>   
> -    while (p) {
> +    do {
>           name = p + 1;
>           p = strchr(name, '/');
>           namelen = p != NULL ? p - name : strlen(name);
> @@ -584,7 +584,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>           }
>   
>           parent = retval;
> -    }
> +    } while (p);
>   
>       return retval;
>   }
> 

I think to add a "g_assert_nonull(p);" before the loop would inform the compiler that we always go 
in the loop and remove the compiler error.

Thanks,
Laurent

