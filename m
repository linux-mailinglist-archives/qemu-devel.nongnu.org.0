Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7594853747C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 08:54:18 +0200 (CEST)
Received: from localhost ([::1]:49310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvZI9-0002hZ-34
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 02:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nvZEE-0001pU-7M
 for qemu-devel@nongnu.org; Mon, 30 May 2022 02:50:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nvZEA-0001jm-7j
 for qemu-devel@nongnu.org; Mon, 30 May 2022 02:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653893405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OA2EU1n3m5GYJZ5id1x49ev2OO8TYlhuVqKxXwmud78=;
 b=jNN37wvfN8rQ3Vy3dCnCQ1QwJWJwmrN1qHZffJK8Pi4zGUIFS5CzSM/oBnl8XGYNBH/U77
 v1d47IfTAoHYE0he8iOVoYTIF9Kxxhh0Q8J0mPpiVZH6EFHZ1C7pB2QBsjvD37TxeLl0zJ
 aoTQEw1fbYR+hBIShMGIWz5+A3jyhgE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-Ht-FPVPaNziss61pjxJivg-1; Mon, 30 May 2022 02:50:04 -0400
X-MC-Unique: Ht-FPVPaNziss61pjxJivg-1
Received: by mail-wr1-f72.google.com with SMTP id
 g22-20020adfa496000000b002101fcd7c86so740971wrb.11
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 23:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=OA2EU1n3m5GYJZ5id1x49ev2OO8TYlhuVqKxXwmud78=;
 b=crQZA9NEkGeY02g4BuigiPYEylyNHpFAjbY5UVRr3oJxZyHd1uuMa9K+pW9I/XfI4J
 ukY8uqRMp27WwXQaXgUza4HDY+fFVYbNA6nY/+p93GKoObLUK24AnxRkHUbAf3Xz5cVP
 G7mJVKT+MTrXn3H/oefZTWnX//ML0nZt0FBfI+JMkkCWFtHfOHF6i5Ts5jeRiQHSwE/p
 5x+lxyMoLWD3tPMe7o5+EUKjwLSbF/nfodfiRrJRTOcafJFHa/JjSbPGaSOLC66lzecC
 I/QEucKRIiYxUyn25XCVR0tlYfal0GRIKMvnhHV/nO/nACzimzXo2iQo8Dos5n3KS9yU
 7PWA==
X-Gm-Message-State: AOAM533wKsKpyqv+r+6mveYlTzgXHmECVavdbEB/EE4EmmjW/IhiU5XM
 ZZrEXx2v2im8WVykx4mdyAwXCSCSreQsxVJXU8pl7F70OfaiH74bo9uV/Bo9A8+MbuBNwVoJSCK
 YR2fFehhsmZnNuoY=
X-Received: by 2002:adf:9cca:0:b0:210:2f76:93fe with SMTP id
 h10-20020adf9cca000000b002102f7693femr4575101wre.12.1653893403106; 
 Sun, 29 May 2022 23:50:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ4OTL2ca2wmWyNO4crgHpqC/B3lDmwhG91OltBGji82xyGj9aMMNAtDCPwYTN03OTbIPtxw==
X-Received: by 2002:adf:9cca:0:b0:210:2f76:93fe with SMTP id
 h10-20020adf9cca000000b002102f7693femr4575084wre.12.1653893402877; 
 Sun, 29 May 2022 23:50:02 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:7c00:aaa9:2ce5:5aa0:f736?
 (p200300cbc7047c00aaa92ce55aa0f736.dip0.t-ipconnect.de.
 [2003:cb:c704:7c00:aaa9:2ce5:5aa0:f736])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a5d64a5000000b0020c5253d8casm9032773wrp.22.2022.05.29.23.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 23:50:02 -0700 (PDT)
Message-ID: <2d742b58-efd2-9a74-0af6-68948a06bfe8@redhat.com>
Date: Mon, 30 May 2022 08:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>, akpm@linux-foundation.org,
 naoya.horiguchi@nec.com, mst@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 peterx@redhat.com, qemu-devel@nongnu.org
References: <20220520070648.1794132-1-pizhenwei@bytedance.com>
 <20220520070648.1794132-3-pizhenwei@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 2/3] mm/memory-failure.c: support reset PTE during unpoison
In-Reply-To: <20220520070648.1794132-3-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20.05.22 09:06, zhenwei pi wrote:
> Origianlly, unpoison_memory() is only used by hwpoison-inject, and
> unpoisons a page which is poisoned by hwpoison-inject too. The kernel PTE
> entry has no change during software poison/unpoison.
> 
> On a virtualization platform, it's possible to fix hardware corrupted page
> by hypervisor, typically the hypervisor remaps the error HVA(host virtual
> address). So add a new parameter 'const char *reason' to show the reason
> called by.
> 
> Once the corrupted page gets fixed, the guest kernel needs put page to
> buddy. Reuse the page and hit the following issue(Intel Platinum 8260):
>  BUG: unable to handle page fault for address: ffff888061646000
>  #PF: supervisor write access in kernel mode
>  #PF: error_code(0x0002) - not-present page
>  PGD 2c01067 P4D 2c01067 PUD 61aaa063 PMD 10089b063 PTE 800fffff9e9b9062
>  Oops: 0002 [#1] PREEMPT SMP NOPTI
>  CPU: 2 PID: 31106 Comm: stress Kdump: loaded Tainted: G   M       OE     5.18.0-rc6.bm.1-amd64 #6
>  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
>  RIP: 0010:clear_page_erms+0x7/0x10
> 
> The kernel PTE entry of the fixed page is still uncorrected, kernel hits
> page fault during prep_new_page. So add 'bool reset_kpte' to get a change
> to fix the PTE entry if the page is fixed by hypervisor.

Why don't we want to do that for the hwpoison case?

> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  include/linux/mm.h   |  2 +-
>  mm/hwpoison-inject.c |  2 +-
>  mm/memory-failure.c  | 26 +++++++++++++++++++-------
>  3 files changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 665873c2788c..7ba210e86401 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3191,7 +3191,7 @@ enum mf_flags {
>  extern int memory_failure(unsigned long pfn, int flags);
>  extern void memory_failure_queue(unsigned long pfn, int flags);
>  extern void memory_failure_queue_kick(int cpu);
> -extern int unpoison_memory(unsigned long pfn);
> +extern int unpoison_memory(unsigned long pfn, bool reset_kpte, const char *reason);
>  extern int sysctl_memory_failure_early_kill;
>  extern int sysctl_memory_failure_recovery;
>  extern void shake_page(struct page *p);
> diff --git a/mm/hwpoison-inject.c b/mm/hwpoison-inject.c
> index 5c0cddd81505..0dd17ba98ade 100644
> --- a/mm/hwpoison-inject.c
> +++ b/mm/hwpoison-inject.c
> @@ -57,7 +57,7 @@ static int hwpoison_unpoison(void *data, u64 val)
>  	if (!capable(CAP_SYS_ADMIN))
>  		return -EPERM;
>  
> -	return unpoison_memory(val);
> +	return unpoison_memory(val, false, "hwpoison-inject");

s/hwpoison-inject/hwpoison/

or maybe

s/hwpoison-inject/debugfs/

>  }
>  
>  DEFINE_DEBUGFS_ATTRIBUTE(hwpoison_fops, NULL, hwpoison_inject, "%lli\n");
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index 95c218bb0a37..a46de3be1dd7 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -2132,21 +2132,26 @@ core_initcall(memory_failure_init);
>  /**
>   * unpoison_memory - Unpoison a previously poisoned page
>   * @pfn: Page number of the to be unpoisoned page
> + * @reset_kpte: Reset the PTE entry for kmap
> + * @reason: The callers tells why unpoisoning the page
>   *
> - * Software-unpoison a page that has been poisoned by
> - * memory_failure() earlier.
> + * Unpoison a page that has been poisoned by memory_failure() earlier.
>   *
> - * This is only done on the software-level, so it only works
> - * for linux injected failures, not real hardware failures
> + * For linux injected failures, there is no need to reset PTE entry.
> + * It's possible to fix hardware memory failure on a virtualization platform,
> + * once hypervisor fixes the failure, guest needs put page back to buddy and
> + * reset the PTE entry in kernel.

Why can't we do this unconditionally? Just check if the PTE is poisoned,
and if so, reset it.

-- 
Thanks,

David / dhildenb


