Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4885844E5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 19:24:43 +0200 (CEST)
Received: from localhost ([::1]:50260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH7FX-0007La-KN
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 13:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oH7DY-0005Zk-Np
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 13:22:36 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:38973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oH7DX-00089h-3i
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 13:22:36 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mati7-1njiLF1KPr-00cMqP; Thu, 28 Jul 2022 19:22:30 +0200
Message-ID: <6480fb47-c9cb-41e8-49ca-7f57ad9c2a87@vivier.eu>
Date: Thu, 28 Jul 2022 19:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: Do not treat madvise()'s advice as a bitmask
Content-Language: fr
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220725134100.128035-1-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220725134100.128035-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QyW2h1YuMpfibdNI8LNQzqEwo5x42cxD958kq1MH2RpQYNMdk6O
 9Jb2xb4uliuaTmARZmuT5q4JUdSoD3yffP8bMG+LMI7LQJ1jBtcFxZY3+2k1iQ/lPO9xWo0
 c+LKccXz3ATn7Bhplh+iqDDp4GW51WCIaUeZBrZ5ZYA0RJqrrpL9Dgz+CmuEbgVwCCI+/vC
 4tHPtt9sg3yzbdYmY/Huw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6RBsAIgNqSM=:WzohcYNGxGY/7k+mIrIqjm
 puXl7PGcSzZBhSecCmiC0u1hNBszd06cmp6E2UIa56Iu2nqXUAxxDy5KtAFbk2zhbcvcYlF0c
 57rcCGxL0cbcSkzRgnB8RUUC2ig1HVeSHz/YgVKiUTLXJjI2xg/8hxfFfi/3v6YdfnPK46y62
 UxlvpwgqJnvYFCd4enFS+fCO9X+fSGwf25EhhnwQgz1AR0JcKCpkZ3MQq4L700/v8tUtYQlNU
 Zt1fQlU8aWSKBJWCJLUTB3rkAP8buOl731GVucGGFQc3h1/C0h0qUeP5EaE8Yw3IGw4IrDnhS
 6EiIf9U994sTLtJZ8t2c/SoiaE5N+Gh09TNOy8gRlOnvaiQN+6k5MDyCW010EE3/RryRNVUYf
 05W+TVB65HdFHdL3RXT6urYtP3dAvS2792wln1HWgH3ou2biVENw8USfn4jOyaQqYPUWOgYHi
 VdITw/nFKgu9U27/cpNdBahRKxZu15q+DOHNnm0Cjh1saaXDRgaGYy/o4Av3hKNcD8Fktbj8e
 HgJwTL1azPDOCZvhAgUux5w4f+syRPaJxcDVA10QqJhpxQMcO3Mo/7mlD7FKmQl/MHBV48ANm
 a3p5B80vMqc68CCSaT7mc0PpZGsOvPPXl9o2cp4T0IdzRSGy5VSgZmhPsJYQIZ5JjKWbxAGSV
 XisoGbbTc7mdcPhB+MgbnuCdfhhcAuCimgB44rhdX39K7OjxOk++C3R4mCa0xtV2z69BHSDyk
 /PemCLpIPfKrjscStNf8v5ybWR+v8ZRA0sNJpA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

Le 25/07/2022 à 15:41, Ilya Leoshkevich a écrit :
> Advice is enum, not flags. Doing (advice & MADV_DONTNEED) also matches
> e.g. MADV_MERGEABLE.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/mmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 4e7a6be6ee..edceaca4a8 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -891,7 +891,7 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
>        * anonymous mappings. In this case passthrough is safe, so do it.
>        */
>       mmap_lock();
> -    if ((advice & MADV_DONTNEED) &&
> +    if (advice == MADV_DONTNEED &&
>           can_passthrough_madv_dontneed(start, end)) {
>           ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
>       }

Fixes: 892a4f6a750a ("linux-user: Add partial support for MADV_DONTNEED")
Reviewed-by: Laurent Vivier <laurent@vivier.eu>

