Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0630750B693
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:52:41 +0200 (CEST)
Received: from localhost ([::1]:47738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrq4-0006uf-0r
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhr7W-0006ew-NY
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:06:38 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhr7U-0003xp-T1
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:06:38 -0400
Received: by mail-ed1-x52c.google.com with SMTP id p18so4818737edr.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3oAXziqhWecaTicJ1TJAzNJot2O+F74s+fvWsJ5jiW0=;
 b=Z3UhoC2SUhjVWlGPrlQSCEy7Q2VUy1KM4Eawia1E0+bVsrQRDiAdB6aIu4tDq2rs+W
 l9URZMyEh1mlY2HNOo0fbW8C4oce1X3bqvloH5MOIvkgz3r2jqhRYvjTsifFBwC26dWz
 5u/OY2dcl/pTD5xnO1Ni/MGueOugkU/ZLsAfbDYl7NqXeIQgGYKNTCcaQywEZyd7ps8i
 bPdq5KKW1neU+1Bd7F3mozZg+0jDg3J3+YRy5LENlRrOK8obiW4Z2YyZ2F6IKRhopHVL
 s1vBPqS9vZo27+goT+fgxRzTty8QEX+Y/XPWBFQacTwOcOmSKZgZtV1qMUX4xQ0CcbVI
 Pjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3oAXziqhWecaTicJ1TJAzNJot2O+F74s+fvWsJ5jiW0=;
 b=cA4QHHOlDHey05wYKaUMf/DzWLYW1zA/U1B7FPzv0n83CXNNjqdHT4pQZ16y4a7OX6
 tvLeKxnG+MUtIGQFK5rSyY6EpIzBjYmfJxbGqLxtWfYRsM2xeDSiG+YT8qbG64CNAKfT
 tOZ2oIeT7EWVAPIoOqPTfSr/Cimv+pZoCCl35xrKKyEde5p7fTpacm76AIM3IEeZhbVx
 iqMSmD3R5YVI8u7kEHyvadd3nurn9d2L4235am+q4CqPh/Nhc9WAYM+G4KI3sflgtc/2
 upaYj3+Dtz819AdCMMmbbH4NgxjNjtx2cRjswgH6oQnUk6w3mKjYx5rwzQl8KwzT0/JB
 Gnbw==
X-Gm-Message-State: AOAM5332RymevhDqt8rInK8BdugigL5ZiklDcR7gUr3FLl/9bI9vkiKt
 Q9/GImCpK4AcXcPS2BbUk6Q=
X-Google-Smtp-Source: ABdhPJwM5GvWcrt60tN0WmgY/AWsqlmKQqrmRmCB40Mt12b/qqhMcJz2Oau7CJ0N11yndzI6Kklg6g==
X-Received: by 2002:a05:6402:1385:b0:413:2bc6:4400 with SMTP id
 b5-20020a056402138500b004132bc64400mr4272735edv.94.1650625595094; 
 Fri, 22 Apr 2022 04:06:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id
 x19-20020a05640226d300b004228faf83desm808347edd.12.2022.04.22.04.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 04:06:34 -0700 (PDT)
Message-ID: <ae7c9c7a-ecda-8c80-751f-f05dbc6489d7@redhat.com>
Date: Fri, 22 Apr 2022 13:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>
References: <YkQzfjgTQaDd2E2T@google.com> <YkSaUQX89ZEojsQb@google.com>
 <80aad2f9-9612-4e87-a27a-755d3fa97c92@www.fastmail.com>
 <YkcTTY4YjQs5BRhE@google.com>
 <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
 <YksIQYdG41v3KWkr@google.com> <Ykslo2eo2eRXrpFR@google.com>
 <eefc3c74-acca-419c-8947-726ce2458446@www.fastmail.com>
 <Ykwbqv90C7+8K+Ao@google.com> <YkyEaYiL0BrDYcZv@google.com>
 <20220422105612.GB61987@chaop.bj.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220422105612.GB61987@chaop.bj.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, the arch/x86 maintainers <x86@kernel.org>,
 Hugh Dickins <hughd@google.com>, Steven Price <steven.price@arm.com>,
 Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, Quentin Perret <qperret@google.com>,
 Linux API <linux-api@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 12:56, Chao Peng wrote:
>          /* memfile notifier flags */
>          #define MFN_F_USER_INACCESSIBLE   0x0001  /* memory allocated in the file is inaccessible from userspace (e.g. read/write/mmap) */
>          #define MFN_F_UNMOVABLE           0x0002  /* memory allocated in the file is unmovable */
>          #define MFN_F_UNRECLAIMABLE       0x0003  /* memory allocated in the file is unreclaimable (e.g. via kswapd or any other pathes) */

You probably mean BIT(0/1/2) here.

Paolo

>      When memfile_notifier is being registered, memfile_register_notifier will
>      need check these flags. E.g. for MFN_F_USER_INACCESSIBLE, it fails when
>      previous mmap-ed mapping exists on the fd (I'm still unclear on how to do
>      this). When multiple consumers are supported it also need check all
>      registered consumers to see if any conflict (e.g. all consumers should have
>      MFN_F_USER_INACCESSIBLE set). Only when the register succeeds, the fd is
>      converted into a private fd, before that, the fd is just a normal (shared)
>      one. During this conversion, the previous data is preserved so you can put
>      some initial data in guest pages (whether the architecture allows this is
>      architecture-specific and out of the scope of this patch).


