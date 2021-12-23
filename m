Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC5E47E99D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 00:11:56 +0100 (CET)
Received: from localhost ([::1]:46146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0XFa-0007SX-WE
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 18:11:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0XDh-0006k5-5F
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 18:09:57 -0500
Received: from [2a00:1450:4864:20::32e] (port=44829
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0XDf-0004Og-CB
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 18:09:56 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 f134-20020a1c1f8c000000b00345c05bc12dso3957116wmf.3
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 15:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dgbT8DN+Tw3GNuf5KJthTWpp6lDkFZBiYQzZimRcuRE=;
 b=ehxbIBRAS2aXNbnGgB0k0x6R5UnwGvaUuLQwHieKejHDCyBTff1JOdaDIPIckgtJou
 8hYkLoqNGiii4+iF8QW2us8YgNv9kljvbT4qGb/bQUff9DbRMmIrP0045w7Uw3CUCOK8
 TTwrauAIdVxgec9tqmZeT0ABn4zy0J9Ld1K8K1eW8x56QfvdoJ4Dm/BexqyjR/YwzPZw
 lDqlfT6bv88bZRj1nDoITdfdxhxwY3gc40PVSTqhV1FQbyf1IA5N0iLVeBCj3xHVVZgn
 NV7mk5eCxTD4+SUpFaDQwPqH182VQ8mtL51XgD/+4dSE1ey1EoQe53Wn8U4cWrQUgaMC
 9neA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dgbT8DN+Tw3GNuf5KJthTWpp6lDkFZBiYQzZimRcuRE=;
 b=GxbQCq4rT2P+3ckx2UBlwof4lt+JOtlKLfLV+qzw2/15v21ofdeJyF0cZfvAj229p7
 43rfCVOVr36Y0a8cFPFzwA9aq3c9w/KBllDNEzFOfxqt9UnX48WdDqdI2LkhN6TBKW/E
 wdRSg2uCqiKlu2aVmzAsTBb/ExEZ5ncG3222AEl3pe2QztAJnpM8ON8oJXu6RSrh2fLt
 SnWaDJ5chK8eQcHtlB8X+L3kLsMzVaVkLMr56u4+ROCZSel2/+OhMTQbKurZDzb4PbLS
 +qRWJ2pkHI3yzdSV573T3ah6c98vertbPuzm7rx1W1zPLuHCC8sRkWML6a//k6PBsz7l
 8ArQ==
X-Gm-Message-State: AOAM530/4TVrPXj0KycSZ33qI7RGg5JjGxVcoqoEDGhRIHOkpdzseFP+
 bKoQNlZWcJ5aiAhmkgg/C7c=
X-Google-Smtp-Source: ABdhPJxl1U9OmTr5nW/WPKnQ66/Eyo9O1/bfTZjkkZoBY6qhl1LyNXjyknMXkm7SCe/TuBNlpdLL3A==
X-Received: by 2002:a05:600c:c7:: with SMTP id u7mr3032584wmm.85.1640300993673; 
 Thu, 23 Dec 2021 15:09:53 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id c11sm10989913wmq.48.2021.12.23.15.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 15:09:53 -0800 (PST)
Message-ID: <e3fe04eb-1a01-bea4-f1ea-cb9ee98ee216@redhat.com>
Date: Fri, 24 Dec 2021 00:09:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 kvm/queue 06/16] KVM: Implement fd-based memory using
 MEMFD_OPS interfaces
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Chao Peng <chao.p.peng@linux.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-7-chao.p.peng@linux.intel.com>
 <YcTBLpVlETdI8JHi@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YcTBLpVlETdI8JHi@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 19:34, Sean Christopherson wrote:
>>   	select HAVE_KVM_PM_NOTIFIER if PM
>> +	select MEMFD_OPS
> MEMFD_OPS is a weird Kconfig name given that it's not just memfd() that can
> implement the ops.
> 

Or, it's kvm that implements them to talk to memfd?

Paolo

