Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D944459EF4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 10:11:34 +0100 (CET)
Received: from localhost ([::1]:37186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpRpt-0001HK-FL
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 04:11:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpRoG-0008CI-6u
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 04:09:52 -0500
Received: from [2a00:1450:4864:20::430] (port=40950
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpRo8-0005mR-5g
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 04:09:48 -0500
Received: by mail-wr1-x430.google.com with SMTP id r8so37621778wra.7
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 01:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=EXjLq27uLPPwTfA6AVps4YfQwfYtoD5QB3WDXMP9avc=;
 b=VQpajBwcKuhcQjhlfCRYaCEPr3KvnCcA5Ih+sgVXncsJXlKSw74iRRii+5fS6bli2l
 KtFWmUca+J/l9XwEvj7CkfYgyJs/PbK/88dBzW5Sr4vYLhsZ/P6dRWsSV0dA4LjrNZNR
 AQIuw4Y3+tsAsszXSUvHAxpHcOYNKQ0kNly3sRhn9vI7re6S+hXr2Qf/O1X5o2b+lcT8
 i7mNaroeCwT3gqv//CO6AYxwGlqY2w1f7EHxgi+skJRyuy22XRWLdvPuULUgRIxg1H4D
 V0Bw9p2jST4AMgrnxUOgMvXrRE5FcT7pUEuY9kQ1AfBLuz8mSasigRr6uPlCUcvE4jCk
 RVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=EXjLq27uLPPwTfA6AVps4YfQwfYtoD5QB3WDXMP9avc=;
 b=gepr7IKB762uQHj2VvxXJPhZ+dUzlnrmKtlFn2Fzs6l05hRRvSYAriNh/zcetEUGJP
 xbod0LELKubbAGPJQ5YBYZ9nbCY0t4lK9HXymbLR+SRL666fKqUQCBrjOo8spZPoZxVS
 lz9EglREJZjxfZrE2LWOFm8L0Ilt5BqGb46KXP7I6H26tbEC2+Afypzl8DL17EAcqJan
 CX3Uns1nP7zL2tEhfUYuQ5GqisZG5REMQBPvccA8hyyHmA57QfYhjKdGmhss+RtrqiDN
 x3utU8nST94qNKVIaRUZkJUZ+qUP9UTB8noG/XEz+ewchN5UhkUbaBUn5SG085phgD05
 FLpg==
X-Gm-Message-State: AOAM5312m18wl10MuVlppxwhsh0a9haKZ715sXvgxzLcK9+EtWyUzE0x
 83KbjPC7bqbjEtDWmwlPnIo=
X-Google-Smtp-Source: ABdhPJwy1AzQRo/b3ioO4YgKfTSHULKRa4G3QiCYJTl72yZ7edFn0WP/0Q5lVgW3dJZi8IC+A1P4hA==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr4870376wrs.273.1637658581691; 
 Tue, 23 Nov 2021 01:09:41 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id m36sm522420wms.25.2021.11.23.01.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 01:09:41 -0800 (PST)
Message-ID: <2f3e9d7e-ce15-e47b-54c6-3ca3d7195d70@redhat.com>
Date: Tue, 23 Nov 2021 10:09:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-14-chao.p.peng@linux.intel.com>
 <20211122141647.3pcsywilrzcoqvbf@box.shutemov.name>
 <20211123010639.GA32088@chaop.bj.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v2 PATCH 13/13] KVM: Enable memfd based page
 invalidation/fallocate
In-Reply-To: <20211123010639.GA32088@chaop.bj.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.515,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 linux-mm@kvack.org, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 02:06, Chao Peng wrote:
>> Maybe the kvm has to be tagged with a sequential id that incremented every
>> allocation. This id can be checked here.
> Sounds like a sequential id will be needed, no existing fields in struct
> kvm can work for this.

There's no need to new concepts when there's a perfectly usable 
reference count. :)

Paolo

