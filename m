Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0B73A5856
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 14:48:39 +0200 (CEST)
Received: from localhost ([::1]:57694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsPXa-0003q6-BS
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 08:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lsPWR-0002z2-66; Sun, 13 Jun 2021 08:47:27 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:54075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lsPWP-0003ml-EC; Sun, 13 Jun 2021 08:47:26 -0400
Received: from [192.168.100.1] ([82.142.19.46]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M7auJ-1lxbeH3k21-0086uF; Sun, 13 Jun 2021 14:47:13 +0200
Subject: Re: [PATCH v2] fuzz: Display hexadecimal value with '0x' prefix
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210612195842.1595999-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e947c86c-bd9b-6d91-d0f0-b8ce8833f295@vivier.eu>
Date: Sun, 13 Jun 2021 14:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210612195842.1595999-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:O9ZrO2uIQRQF4OBTX7aBAnH6dfD/sTWq819yiIMHI1O+GFdzugq
 Z6h25jhgx1v3P2XqVO123YInw0EWXLV/rprq5XmaB3IZTZHGmOBc3z1lG1Crg+UG2TxR6kx
 bVfBwpi5xodnLS/sRg//1AWGDfigmEFm8zATzM2E6tYiyjjWA53JyChg4bubK3zxFCAKyO0
 WxdRaABikaSTjvnFbMe0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7qKzFYOEnpE=:RXXy/Dh5IWftt/mMuY3+HM
 Cto8nNFKrrEEyaSEVeeuHfJMsHcIaXYElf6Vbp1vKB0FNWPLZDVa0M3jun3AD7Oj+S5hdEaCg
 jGf1cejuc6c2tK4Oq4+1sotzsOfIvjp2o5ImTmq7DAcPZPcKeklVPEgn3aj+5pfBzgBwRQVBQ
 ttU+3WpPQ8iFp0T1n1YNcbo7dP9b9+0n9AJlk2eBhqbkWhEeRA73H7/9tinKckv5sfel244gd
 UUR55l3aer4UtmhcPWJHdnMPQRrf+IcUZknvsoJ95NvyPWg5D9sGBhxhCMqJbCbjp+AY0ImzO
 jvo540OuM9oRVCqfkiXDtkYs1WrMzQqgxQ+XCJIbbeLOJturgxAbrxy0sb2R9rJbhuTK//YZc
 78eV+V9RPafxb83mMpw36SN8bZdkWVdIf5kH10EDOHPCG2QBtgUvFCA1WpqTipqRRLVoYwg33
 rjSEFqWoOhBQ5mtBkdKGwEKna+A+v/9TSkoe5Km8n5+Toe84qEQmfO4Af1gahozW2xqUaBy0U
 gWVAw0MQKHAP9/tZuEUC6A=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.144,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/06/2021 à 21:58, Philippe Mathieu-Daudé a écrit :
> Use memory_region_size() to get the MemoryRegion size,
> and display it with the '0x' prefix.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2:
> - Use PRIx64 (lvivier)
> - Use memory_region_size()
> ---
>  tests/qtest/fuzz/generic_fuzz.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index cea7d4058e8..6c675227174 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -841,9 +841,9 @@ static void generic_pre_fuzz(QTestState *s)
>  
>      g_hash_table_iter_init(&iter, fuzzable_memoryregions);
>      while (g_hash_table_iter_next(&iter, (gpointer)&mr, NULL)) {
> -        printf("  * %s (size %lx)\n",
> +        printf("  * %s (size 0x%" PRIx64 ")\n",
>                 object_get_canonical_path_component(&(mr->parent_obj)),
> -               (uint64_t)mr->size);
> +               memory_region_size(mr));
>      }
>  
>      if (!g_hash_table_size(fuzzable_memoryregions)) {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

