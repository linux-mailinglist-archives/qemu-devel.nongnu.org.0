Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3830E4468AE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 19:54:38 +0100 (CET)
Received: from localhost ([::1]:48298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj4MH-000743-Cn
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 14:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mj4K5-000537-76; Fri, 05 Nov 2021 14:52:21 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:42536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mj4K3-0005WV-C2; Fri, 05 Nov 2021 14:52:20 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 g91-20020a9d12e4000000b0055ae68cfc3dso11706378otg.9; 
 Fri, 05 Nov 2021 11:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kd7KKZc3HnLkW75lMBUr64KgQlGXASFpgUeE9m3h2uc=;
 b=bCZDPZtxmvXRHZhbzVVYgAu/6Mx73R3NKCH2HQlG5nWPriQzyBtKUUEFPSSZPUAa28
 WCjpwiE7JYGyIlr4x2Pvli94c7Xllj1mYJHlfOf1+2CJMnruhYs7UPIlzuV9kPeWIZJy
 IinfdZ0C3ZjwIghCIU2E72pIRPNRC6R8JCVurF2Z6rmYsuCSbX5n+1ed8PtJqmA+8yZe
 6DlUCfsydIraFDmHcVVYYApwZPT+J8YPgv9YSLSimzmNF+L0eqynybIhD19YGQO6ly3i
 6zux/9B2mnMkT41CKwD2GH8YOdUXY4+j4HFJiHZ/Jj9pAYX9hxWwCcMR9TGtUwSAY2tL
 CTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kd7KKZc3HnLkW75lMBUr64KgQlGXASFpgUeE9m3h2uc=;
 b=pKsXNBnwPvdOPPw5TmFcjVT8+dU6ChW+ybX182P5ySTPmOmeBafvBN5kJ6bTjNkLa0
 2uQu/ib4c7fNRJwzZwjs+mtdhEO2WkNPPNwOBbY7utp/sH37LzGlqVX+i7mAjn0JhaqJ
 qIPDPujsfQPJcao0KKw5lnF3fh/yhX+fNnqw9I0dDdozUc4/uyxppzHARqjOVVyXIrma
 Nr9NZ5qe4Tbi4RAa/IPSdSIoJYvjtFs16Wud8O+FK7zO82jcBWBLflu2LU8lBhUYF9bh
 OcrRos6Ce+zinQ4s5G3k7oyD1S7uxGY1CBAnb54tYDPQEVM8+pRiCtM5YBGeWM+Cjl0N
 yE/A==
X-Gm-Message-State: AOAM533KtRxhpyDj9B3raXdHfzz6fVkK0A9NWBPdxux1FfODoBjKajNV
 Z5afT8gO2dr5EWc4Uw7x4dY=
X-Google-Smtp-Source: ABdhPJw5ajscwJKWg6SFoCIj2MVnebctlaAQTeAG29sA5hW9tdnsIhcVTPqba2zUdzW99Ul6XNsiJQ==
X-Received: by 2002:a9d:20c7:: with SMTP id x65mr9385402ota.173.1636138336681; 
 Fri, 05 Nov 2021 11:52:16 -0700 (PDT)
Received: from [192.168.10.222] (201-42-211-153.dsl.telesp.net.br.
 [201.42.211.153])
 by smtp.gmail.com with ESMTPSA id q12sm2690497otl.66.2021.11.05.11.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 11:52:16 -0700 (PDT)
Message-ID: <555804ca-e59e-6dfb-c133-0087b7c0ffd0@gmail.com>
Date: Fri, 5 Nov 2021 15:52:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] spapr_numa.c: FORM2 table handle nodes with no distance
 info
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
References: <20211105135137.1584840-1-npiggin@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211105135137.1584840-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/5/21 10:51, Nicholas Piggin wrote:
> A configuration that specifies multiple nodes without distance info
> results in the non-local points in the FORM2 matrix having a distance of
> 0. This causes Linux to complain "Invalid distance value range" because
> a node distance is smaller than the local distance.
> 
> Fix this by building a simple local / remote fallback for points where
> distance information is missing.

Thanks for looking this up. I checked the output of this same scenario with
a FORM1 guest and 4 distance-less NUMA nodes. This is what I got:

[root@localhost ~]# numactl -H
available: 4 nodes (0-3)
(...)
node distances:
node   0   1   2   3
   0:  10  160  160  160
   1:  160  10  160  160
   2:  160  160  10  160
   3:  160  160  160  10
[root@localhost ~]#


With this patch we're getting '20' instead of '160' because you're using
NUMA_DISTANCE_DEFAULT, while FORM1 will default this case to the maximum
NUMA distance the kernel allows for that affinity (160).

I do not have strong feelings about changing this behavior between FORM1 and
FORM2. I tested the same scenario with a x86_64 guest and they also uses '20'
in this case as well, so far as QEMU goes using NUMA_DISTANCE_DEFAULT is
consistent.

Aneesh is already in CC, so I believe he'll let us know if there's something
we're missing and we need to preserve the '160' distance in FORM2 for this
case as well.

For now:


> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>



>   hw/ppc/spapr_numa.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 5822938448..56ab2a5fb6 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -546,12 +546,24 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>                * NUMA nodes, but QEMU adds the default NUMA node without
>                * adding the numa_info to retrieve distance info from.
>                */
> -            if (src == dst) {
> -                distance_table[i++] = NUMA_DISTANCE_MIN;
> -                continue;
> +            distance_table[i] = numa_info[src].distance[dst];
> +            if (distance_table[i] == 0) {
> +                /*
> +                 * In case QEMU adds a default NUMA single node when the user
> +                 * did not add any, or where the user did not supply distances,
> +                 * the value will be 0 here. Populate the table with a fallback
> +                 * simple local / remote distance.
> +                 */
> +                if (src == dst) {
> +                    distance_table[i] = NUMA_DISTANCE_MIN;
> +                } else {
> +                    distance_table[i] = numa_info[src].distance[dst];
> +                    if (distance_table[i] < NUMA_DISTANCE_MIN) {
> +                        distance_table[i] = NUMA_DISTANCE_DEFAULT;
> +                    }
> +                }
>               }
> -
> -            distance_table[i++] = numa_info[src].distance[dst];
> +            i++;
>           }
>       }
>   
> 

