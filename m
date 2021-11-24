Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDDD45CDA0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 21:06:43 +0100 (CET)
Received: from localhost ([::1]:41004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpyXS-0004JB-5Y
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 15:06:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpyA1-0000Qx-MT; Wed, 24 Nov 2021 14:42:29 -0500
Received: from [2607:f8b0:4864:20::92a] (port=34304
 helo=mail-ua1-x92a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpy9z-0002HS-U7; Wed, 24 Nov 2021 14:42:29 -0500
Received: by mail-ua1-x92a.google.com with SMTP id n6so7497914uak.1;
 Wed, 24 Nov 2021 11:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2R5fru4pJrsQv0R2U9Klj2YCvuYawLKJkhQQybFmXvU=;
 b=FSuEtMTp2B/+zZzsAEiAdULFFQmJVa3j/AtBDVHRuhHQRuoDesamUr0bC1shGIG5i8
 3m+MXX8pkg+kihHnUqPMJ8MsUX1qgGA99t/wGu5MWE0y42sBC9a/Q306HLTHpunsUvd6
 bAS1efcgWfIAjlGFg467tUVOlLQaYJz6aVSao4sHQ6cQigL5FOEqlnLJmxmL1FZyj6qe
 9axjp77k+aR0bMtH88Dtkg9zWpwgfSufTKeIem/qvnhqlNd1MSDKYzOi1hqdEw6WMUpS
 x9NEI5KAjYUkVPtfxkcXM75iP0S9k4Ib726sx2D5v/qD6fLdXj9w6ByfAioP+q2eJ6U4
 r5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2R5fru4pJrsQv0R2U9Klj2YCvuYawLKJkhQQybFmXvU=;
 b=d/t07vYuAmOe5ZJp+uLAh6fuomLBtzGNbxJBj9gbf8F2AjnA/6d+sOxXqaQwNeKUdf
 WMgoRVlbAauJIUE46t6xgrZTZuTh5Ek0RSP8K0fJBrujIkuTbl5NlXh5kqPAg5TlpjS8
 ta/kGbT9y55i/APyOAM5xGUUHdkuZYTkPPUrwXQwazTjcOr+rZBgCi/qJSLEkZZhrr8h
 xq1523Uy+xOPzcTaf46H1wKk7j1gsrv7g3t6im6YDFUIkPxJrxAMHJh8wXjW+nYHvkJp
 SH4Ki4ODHZSqPlrHX+1MPpTUL9NP6UnyFkPeDibeVo5V5S8LWXbm10ovL8PZ0q0Sw0U4
 WLBQ==
X-Gm-Message-State: AOAM533nO1fawbK4CY67HCsiVG/sT+YPYx3Bj+FibFbV7tJb/ib8v2qr
 FexFYar99q6D01WnpCCEbq0=
X-Google-Smtp-Source: ABdhPJzIAci9eIkT/ZnaxKmuu/qiJtt2yIBjsSGorF9hO+BG4oRxPkIU1+gqRU39F4ZYj5G+fdK6jQ==
X-Received: by 2002:ab0:3d87:: with SMTP id l7mr14891202uac.108.1637782946759; 
 Wed, 24 Nov 2021 11:42:26 -0800 (PST)
Received: from [192.168.10.222] ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id b129sm504476vsc.5.2021.11.24.11.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 11:42:26 -0800 (PST)
Message-ID: <1d71936e-0ede-811d-fa72-ca70dcbae068@gmail.com>
Date: Wed, 24 Nov 2021 16:42:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/ppc: fix Hash64 MMU update of PTE bit R
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <20211124120046.6831-1-leandro.lupori@eldorado.org.br>
 <00546896-2466-007f-b73c-fe4f889fac2f@gmail.com>
 <1dae4d80-6b0b-5542-b783-7a3bb434bc16@kaod.org>
 <CP2PR80MB35865D04C82D81F7BCBA351CC6619@CP2PR80MB3586.lamprd80.prod.outlook.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CP2PR80MB35865D04C82D81F7BCBA351CC6619@CP2PR80MB3586.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "groug@kaod.org" <groug@kaod.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/24/21 16:17, Leandro Lupori wrote:
> ​​
> 
> 
>     On 11/24/21 14:40, Daniel Henrique Barboza wrote:
>     >
>     >
>     > On 11/24/21 09:00, Leandro Lupori wrote:
>     >> When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
>     >> offset, causing the first byte of the adjacent PTE to be corrupted.
>     >> This caused a panic when booting FreeBSD, using the Hash MMU.
> 
>     I wonder how we never hit this issue before. Are you testing PowerNV
>     and/or pSeries  ?
> 
>     Could you share a FreeBDS image with us ?
> 
> ​I've hit this issue while testing PowerNV. With pSeries it doesn't happen.
> 
> It can be reproduced by trying to boot this iso: https://download.freebsd.org/ftp/snapshots/powerpc/powerpc64/ISO-IMAGES/14.0/FreeBSD-14.0-CURRENT-powerpc-powerpc64-20211028-4827bf76bce-250301-disc1.iso.xz
> 
> It is easier to reproduce it using power8/powernv8.
> ​
> 
>     > If you add a "Fixes:" tag with the commit that introduced the code you're
>     > fixing, we can push it right away as a bug fix in 6.2 (assuming it doesn't
>     > break anything else, of course).
>     >
>     > The commit to be fixed in the case seems to be a2dd4e83e76b ("ppc/hash64:
>     > Rework R and C bit  updates")
> 
>     Indeed.
> 
> ​​Right.
> 
>     > One more comment below:
>     >
>     >>
>     >> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>     >> ---
>     >>   target/ppc/mmu-hash64.c | 2 +-
>     >>   1 file changed, 1 insertion(+), 1 deletion(-)
>     >>
>     >> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
>     >> index 19832c4b46..f165ac691a 100644
>     >> --- a/target/ppc/mmu-hash64.c
>     >> +++ b/target/ppc/mmu-hash64.c
>     >> @@ -786,7 +786,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_idx, uint64_t dar, uint64_t
>     >>   static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>     >>   {
>     >> -    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 16;
>     >> +    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 14;
>     >
>     > Instead of adding a '14' you should add a new #define in mmu-hash64.h with this
>     > value, something like "HPTE64_R_R_SHIFT". This will avoid hardcoding literals
>     > around the code and forcing us to go to the ISA every time we wonder what's
>     > an apparently random number represents. There's also a "HPTE64_R_R" defined
>     > there but I'm not sure if it's usable here, so feel free to create a new
>     > macro if needed.
>     >
>     > In that note, the original commit that added this code also added a lot of
>     > hardcoded "15" values for the C bit update in spapr_hpte_set_c() and
>     > ppc_hash64_set_c(), and a "14" value like you're changing here in spapr_hpte_set_r().
>     > If you're feeling generous I believe that another patch replacing these hardcoded values
>     > with bit shift macros  is warranted as well.
> 
> ​What about creating HPTE64_R_R_BYTEand HPTE64_R_C_BYTE, with the values 14 and 15, respectively,
> to make it clear that these are byte offsets within a PTE?

Looks good to me.


Daniel


> 
>     May be for 7.0 though ?
> 
>     Thanks,
> 
>     C.
> 

