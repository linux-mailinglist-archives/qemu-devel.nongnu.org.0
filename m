Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F8A4922FE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 10:43:29 +0100 (CET)
Received: from localhost ([::1]:38764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9l1T-0005Vy-Qo
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 04:43:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9kzX-0004de-0t
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:41:27 -0500
Received: from [2a00:1450:4864:20::332] (port=54936
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9kzS-0000D8-O9
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:41:24 -0500
Received: by mail-wm1-x332.google.com with SMTP id p18so26276454wmg.4
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 01:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iFgNmHuHt5y/j3H8Tutu8lSHsdboxVy4VCgXSl8Gp+c=;
 b=e4Voc0fMOqW5qm9lcEfLiDnhnQlQ6ZFzbAF5cwxJ5mcDpg1XMC/Vyh+ISO1xjBLFHn
 OZBmu2WBQ32xYA5gY6rZ5u/wY0gIMbMOaCXhmxdWEL/YktAbkUhPn0sBgNnD6WBfO4DZ
 3lgS5FAKp1slZEpEdZdF1kvBqji5sCHgY1Z5VYVRUY5XCBAh4H+zmAMqkWOKBen3pCKS
 2xp25/UlpA2npVVRg0Krh4ljjtJgh7O4WBzK2+ajjOeLfP6kc35kOL5O3XeLGrYVEt5e
 +OOlNWim2KvAfRD1p+w92PjKRBI7tqlc3+o8+GuaLoT3fyKPHPFgTwxzDUtGyu1OKYTj
 y4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iFgNmHuHt5y/j3H8Tutu8lSHsdboxVy4VCgXSl8Gp+c=;
 b=GjMWbiSpGSHyt63M8r7b/HHJZpI+a/CMyJvJZZ4Dcn+iA+h1in0a/po19JSnUtc5qO
 iNQRj6Tp1KmpDa2EqRzVkLz64TeIheOBgx4/V44u3fXxpg7Ghn+b9nEc4QkUfeCg10AQ
 zMpEym6qJgu8GJNqsS1vNMzew5MFFc9NeQFS1E3W3Hg2gO3SoixRiYQg8vngZmFN/IMt
 IbDFgkEp4fItxd23pXlMc5Mh++WOpL3VlgaSGti4Rzlzz1+lQtl++mNLz2LWs/FuoIX9
 myIYruln34n2vMQo0jo35keQj2GgFOd33AWf1gjnUKOl4z/BakpmmioVzMOF/Bi0b8Ie
 GhBA==
X-Gm-Message-State: AOAM532PHzBTpkKagfDkKlOEdSuHy/g3S1o/4SyF8InLzVNFOj1hehi+
 FhMCna9Qpy0OsveF6PtuitQ=
X-Google-Smtp-Source: ABdhPJxVIuos7uF9wvC6FVb9WmzGng58cHgSsM5JWVjupB9kHiycluSpCGN3CNa/ueTUPlfFqJJAKA==
X-Received: by 2002:a1c:1f82:: with SMTP id f124mr888011wmf.157.1642498879254; 
 Tue, 18 Jan 2022 01:41:19 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id v13sm18556810wro.90.2022.01.18.01.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:41:18 -0800 (PST)
Message-ID: <0ea887e9-1fd4-1962-cbaa-92b648b28b53@amsat.org>
Date: Tue, 18 Jan 2022 10:41:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 10/13] softmmu/physmem: Add private memory address
 space
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 david@redhat.com, "J . Bruce Fields" <bfields@fieldses.org>,
 dave.hansen@intel.com, "H . Peter Anvin" <hpa@zytor.com>,
 ak@linux.intel.com, Jonathan Corbet <corbet@lwn.net>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov
 <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
 <20211111141352.26311-11-chao.p.peng@linux.intel.com>
In-Reply-To: <20211111141352.26311-11-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi,

On 11/11/21 15:13, Chao Peng wrote:
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  include/exec/address-spaces.h |  2 ++
>  softmmu/physmem.c             | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/include/exec/address-spaces.h b/include/exec/address-spaces.h
> index db8bfa9a92..b3f45001c0 100644
> --- a/include/exec/address-spaces.h
> +++ b/include/exec/address-spaces.h
> @@ -27,6 +27,7 @@
>   * until a proper bus interface is available.
>   */
>  MemoryRegion *get_system_memory(void);
> +MemoryRegion *get_system_private_memory(void);
>  
>  /* Get the root I/O port region.  This interface should only be used
>   * temporarily until a proper bus interface is available.
> @@ -34,6 +35,7 @@ MemoryRegion *get_system_memory(void);
>  MemoryRegion *get_system_io(void);
>  
>  extern AddressSpace address_space_memory;
> +extern AddressSpace address_space_private_memory;
>  extern AddressSpace address_space_io;
>  
>  #endif
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index f4d6eeaa17..a2d339fd88 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -85,10 +85,13 @@
>  RAMList ram_list = { .blocks = QLIST_HEAD_INITIALIZER(ram_list.blocks) };
>  
>  static MemoryRegion *system_memory;
> +static MemoryRegion *system_private_memory;
>  static MemoryRegion *system_io;
>  
>  AddressSpace address_space_io;
>  AddressSpace address_space_memory;
> +AddressSpace address_space_private_memory;
> +
>  
>  static MemoryRegion io_mem_unassigned;
>  
> @@ -2669,6 +2672,11 @@ static void memory_map_init(void)
>      memory_region_init(system_memory, NULL, "system", UINT64_MAX);
>      address_space_init(&address_space_memory, system_memory, "memory");
>  
> +    system_private_memory = g_malloc(sizeof(*system_private_memory));
> +
> +    memory_region_init(system_private_memory, NULL, "system-private", UINT64_MAX);
> +    address_space_init(&address_space_private_memory, system_private_memory, "private-memory");

Since the description is quite scarce, I don't understand why we need to
add this KVM specific "system-private" MR/AS to all machines on all
architectures.

>      system_io = g_malloc(sizeof(*system_io));
>      memory_region_init_io(system_io, NULL, &unassigned_io_ops, NULL, "io",
>                            65536);

(We already want to get ride of the "io" MR/AS which is specific to
x86 or machines).

> @@ -2680,6 +2688,11 @@ MemoryRegion *get_system_memory(void)
>      return system_memory;
>  }
>  
> +MemoryRegion *get_system_private_memory(void)
> +{
> +    return system_private_memory;
> +}
> +
>  MemoryRegion *get_system_io(void)
>  {
>      return system_io;

