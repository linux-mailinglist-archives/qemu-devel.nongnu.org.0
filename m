Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8346F3326
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:49:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVl5-0003jk-Oo; Mon, 01 May 2023 11:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVl3-0003iu-BL
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:48:09 -0400
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVl1-0000fk-JC
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:48:09 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MlNcr-1qXoiH3z3N-00lnAb; Mon, 01 May 2023 17:48:05 +0200
Message-ID: <c0a2207c-9e43-cb0b-51a9-984b2b5df892@vivier.eu>
Date: Mon, 1 May 2023 17:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] linux-user: Add new flag VERIFY_NONE
Content-Language: fr
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>, qemu-devel@nongnu.org
References: <20230422100314.1650-1-thomas@t-8ch.de>
 <20230422100314.1650-2-thomas@t-8ch.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230422100314.1650-2-thomas@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5RBcnobQ2e0IAAiHebfFM9H1+YyV36n7Inr76HX3wMozqdgWDsi
 DpiCm5SndbXVtJQRxeqNcKB1hpwby3cHEMYe6G92yRLsmgT+PMT51IRKjdleWrGVtO/S7M2
 JGvBQATmzmYATwkJ+Y5kIvg9a01gCNzJc9xF/QE3tt2qEgpHUr/fgqGwwWwVyhKOz40WJ6t
 YwYunDZ9zLuvYxZY4eg/w==
UI-OutboundReport: notjunk:1;M01:P0:FzGvsXvIUDE=;ReRk+XgvFUWFPsSRSPtsUMnjQB0
 PUgDrScjdyset+fZNOZH0/odcR2IcAmCkD6CUc0Zuwx+j5g7IEHZjRhC8nK2h1HJPz/cfzJvh
 R2R1pJeu/sK2HQCmMXf9ziMAPUzvvtSVulhX+OHIHckjcOESfg04EXV7ndjUFUGmVPdyj+4pa
 YjGMj9CnRln8rm3AufMwYAI4bUU8DM5vZqMxkw4bSeO6SCPADH72lt/a2PUIfCilwpuxSOuGj
 uuyA7FG/Hj6TixfRkav9i1mD5vO5pdnK99OE+Ivbljqu8sIugXqN02rmct1veV9fmOsOU6Mwp
 30evzH6NeHYMMjSXsf/WRQsHZKEFvqJ7Mco0BMKf4ivAE6Zbwb6B7aFE/Chh88Dxn+I88f0P5
 O2A5jx9BNRCRQdEyAo8ouL8YeSL9B6xKdeN6eDFyM5eZJ3eR9NfnQuHPwQR8f/7gadGbzfOyU
 zGCV9K5or2aEwhAWVWIq9L31nWRkL2reXAnEfHfKA697scPWZ4IVPTn6NEYP9ic/wresr6aPt
 ppOWSLMDu0O669I/91y43kKoNMSc4wzJBDbJOUN/q4M5aG6IM1Igat3emWPn53RqAEq0xy4WF
 KqnE7HkLcz9L/0JWTk1eK7RMdGDp1a0Jx828EbLdGHN0RwCAT3t94HnRuMrdK1uzDd6TrXryB
 4sP8iIdxugG624nBLJ898IPNudgeSlz7H2iYQtRZeg==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 22/04/2023 à 12:03, Thomas Weißschuh a écrit :
> This can be used to validate that an address range is mapped but without
> being readable or writable.
> 
> It will be used by an updated implementation of mincore().
> 
> Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
> ---
>   linux-user/qemu.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index e2e93fbd1d5d..92f9f5af41c7 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -168,6 +168,7 @@ abi_long do_brk(abi_ulong new_brk);
>   
>   /* user access */
>   
> +#define VERIFY_NONE  0
>   #define VERIFY_READ  PAGE_READ
>   #define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
>   

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


