Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA7230B5D2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:29:03 +0100 (CET)
Received: from localhost ([::1]:36962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6mNC-0006KK-Dm
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mMI-0005sg-6n
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:28:06 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:60969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mMF-0001ax-Fv
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:28:05 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E9FFE58031C;
 Mon,  1 Feb 2021 22:28:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 01 Feb 2021 22:28:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=z
 3ksqCzA8llV1zXoGHYdLH2cPBeRZRcnD7TPu1xlEoA=; b=aY/N7GA3Z5AYYQ6mH
 ZmsPIBDlPOhzS8Kf/PKyuh6dOgHXBBx49XHhw3GEe35QGXRJ8WyzMIE08zPO6wTo
 SkHbxdqc8AZl007mmW0gRU5Dc7bAxJvZ5Pvpjrg0eLMiTCcnSs5oJLPRTOhTOQ+E
 jQJu5YQlojzyOKJq3RXQGcv5Qqc/dkDfwsJMle8T1TridauyZ8mSTJqmlx4U1Ta6
 aORQ3plISrmkVcawlulTsHxaw4N7pxHII4r3TGXdC2FsEhVWDOS0Dcml0wM932mY
 u2UaZnTXs4UnVa+L5jW+Gmn8XSP23atpMInUXu9WO7AXoueW5E1eCitAmbJv5H1L
 5Cm/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=z3ksqCzA8llV1zXoGHYdLH2cPBeRZRcnD7TPu1xlE
 oA=; b=Pt7o6HjtWXEqLPiiSgBqa8OwZXsv3ZfVFPCBW6s7K8j5KL4pmcQzI5L09
 0O4uo7YkF+xAObQ4+QDySbc2DaeuaOMc4yO/oA2nXMomsNtOC0hkwBDRsIQBGaNW
 JlPfI6VikdJNpDfQNtHJbHqJCVbMA3BcRKhUMYNc8JGoOR28IJF3vcwQd92GpsGJ
 4/sBpTftpkdGU4K7ndTHlzT7qzwOb+OdCXRyiKL3WNo3sFdS5NMcgMXgMW6DbMa3
 fDDBEKFsWfuLdGAi6utA/hSDagPjxjZ+q3N7O27c+IouRJFcAaIebSwMInZRhpuc
 IR6giYlEbROlUc37YUipnUvDpxe9Q==
X-ME-Sender: <xms:wsYYYByBjI6bzeJaKbPih01PdEnutvBWq0T8d8qhuzpf8o_znR7_iA>
 <xme:wsYYYBQ9mINIP8DzxvHErpSomMSvopweKfFYf-1aPrNdg7YjCq9hExKuf6SKwYSWe
 e9sRqUvjF_1utEwIIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeduheegrddujedruddvrdelkeenucevlhhushhtvghrufhiii
 gvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:wsYYYLVRgmz5cXtGnwGY3ijwLawcfdAK3twgbUjleJl8DSazgBnSXg>
 <xmx:wsYYYDjUpNZ4Gzs00cKFRDXFWXiRkvsP_DQzDmrL1lDl5buHRa1Iug>
 <xmx:wsYYYDBwvOpWpkZyNdsI8TM8Hg-WU94pRQnyLtKca-iQ5vKvphIiHA>
 <xmx:wsYYYO8i7_bQHW9JsruzUI60Ctw9hNSFCex2hIyKilKIEJXfSuBi3g>
Received: from [0.0.0.0] (unknown [154.17.12.98])
 by mail.messagingengine.com (Postfix) with ESMTPA id 295DC108005B;
 Mon,  1 Feb 2021 22:27:59 -0500 (EST)
Subject: Re: [PATCH 04/13] target/mips: Remove access_type argument from
 get_physical_address()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
 <20210128144125.3696119-5-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <7d31860f-633b-42e5-1384-33606d917f67@flygoat.com>
Date: Tue, 2 Feb 2021 11:27:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/28 下午10:41, Philippe Mathieu-Daudé 写道:
> get_physical_address() doesn't use the 'access_type' argument,
> remove it to simplify.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   target/mips/tlb_helper.c | 22 +++++++++-------------
>   1 file changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
> index d89ad87cb9d..c9535b7f72f 100644
> --- a/target/mips/tlb_helper.c
> +++ b/target/mips/tlb_helper.c
> @@ -259,7 +259,7 @@ static int get_segctl_physical_address(CPUMIPSState *env, hwaddr *physical,
>   
>   static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
>                                   int *prot, target_ulong real_address,
> -                                int rw, int access_type, int mmu_idx)
> +                                int rw, int mmu_idx)
>   {
>       /* User mode can only access useg/xuseg */
>   #if defined(TARGET_MIPS64)
> @@ -492,7 +492,7 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>       hwaddr phys_addr;
>       int prot;
>   
> -    if (get_physical_address(env, &phys_addr, &prot, addr, 0, ACCESS_INT,
> +    if (get_physical_address(env, &phys_addr, &prot, addr, 0,
>                                cpu_mmu_index(env, false)) != 0) {
>           return -1;
>       }
> @@ -570,7 +570,7 @@ static int walk_directory(CPUMIPSState *env, uint64_t *vaddr,
>       uint64_t w = 0;
>   
>       if (get_physical_address(env, &paddr, &prot, *vaddr, MMU_DATA_LOAD,
> -                             ACCESS_INT, cpu_mmu_index(env, false)) !=
> +                             cpu_mmu_index(env, false)) !=
>                                TLBRET_MATCH) {
>           /* wrong base address */
>           return 0;
> @@ -598,7 +598,7 @@ static int walk_directory(CPUMIPSState *env, uint64_t *vaddr,
>                   *pw_entrylo0 = entry;
>               }
>               if (get_physical_address(env, &paddr, &prot, vaddr2, MMU_DATA_LOAD,
> -                                     ACCESS_INT, cpu_mmu_index(env, false)) !=
> +                                     cpu_mmu_index(env, false)) !=
>                                        TLBRET_MATCH) {
>                   return 0;
>               }
> @@ -752,7 +752,7 @@ static bool page_table_walk_refill(CPUMIPSState *env, vaddr address, int rw,
>       /* Leaf Level Page Table - First half of PTE pair */
>       vaddr |= ptoffset0;
>       if (get_physical_address(env, &paddr, &prot, vaddr, MMU_DATA_LOAD,
> -                             ACCESS_INT, cpu_mmu_index(env, false)) !=
> +                             cpu_mmu_index(env, false)) !=
>                                TLBRET_MATCH) {
>           return false;
>       }
> @@ -765,7 +765,7 @@ static bool page_table_walk_refill(CPUMIPSState *env, vaddr address, int rw,
>       /* Leaf Level Page Table - Second half of PTE pair */
>       vaddr |= ptoffset1;
>       if (get_physical_address(env, &paddr, &prot, vaddr, MMU_DATA_LOAD,
> -                             ACCESS_INT, cpu_mmu_index(env, false)) !=
> +                             cpu_mmu_index(env, false)) !=
>                                TLBRET_MATCH) {
>           return false;
>       }
> @@ -843,16 +843,14 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>   #if !defined(CONFIG_USER_ONLY)
>       hwaddr physical;
>       int prot;
> -    int mips_access_type;
>   #endif
>       int ret = TLBRET_BADADDR;
>   
>       /* data access */
>   #if !defined(CONFIG_USER_ONLY)
>       /* XXX: put correct access by using cpu_restore_state() correctly */
> -    mips_access_type = ACCESS_INT;
>       ret = get_physical_address(env, &physical, &prot, address,
> -                               access_type, mips_access_type, mmu_idx);
> +                               access_type, mmu_idx);
>       switch (ret) {
>       case TLBRET_MATCH:
>           qemu_log_mask(CPU_LOG_MMU,
> @@ -884,7 +882,7 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>           env->hflags |= mode;
>           if (ret_walker) {
>               ret = get_physical_address(env, &physical, &prot, address,
> -                                       access_type, mips_access_type, mmu_idx);
> +                                       access_type, mmu_idx);
>               if (ret == TLBRET_MATCH) {
>                   tlb_set_page(cs, address & TARGET_PAGE_MASK,
>                                physical & TARGET_PAGE_MASK, prot,
> @@ -909,12 +907,10 @@ hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
>   {
>       hwaddr physical;
>       int prot;
> -    int access_type;
>       int ret = 0;
>   
>       /* data access */
> -    access_type = ACCESS_INT;
> -    ret = get_physical_address(env, &physical, &prot, address, rw, access_type,
> +    ret = get_physical_address(env, &physical, &prot, address, rw,
>                                  cpu_mmu_index(env, false));
>       if (ret != TLBRET_MATCH) {
>           raise_mmu_exception(env, address, rw, ret);


