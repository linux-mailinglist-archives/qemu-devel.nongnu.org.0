Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87C1459E8A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 09:48:21 +0100 (CET)
Received: from localhost ([::1]:42096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpRTQ-0001BK-Qi
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 03:48:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpRS7-0000T4-W3
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:47:01 -0500
Received: from [2a00:1450:4864:20::529] (port=41957
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpRS5-0002mo-UG
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:46:59 -0500
Received: by mail-ed1-x529.google.com with SMTP id g14so88889483edb.8
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 00:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7HA05XhYlCzTp4qvhhSBcSuSKybJ0PulYKdWBwG+DL8=;
 b=eRxUC+sJSCTIGOoVdTOOhCcUZfnZdG7DdFIkTVEmTD9NGwphMQiid3xEfITu5XW/Fm
 OPcyu0o0RT6S6BanewL3NWZY6xVwmP0C439+0yWwFxG7UfkAXRzQPZpRKz3tzk18JnVw
 HtjSX+daGQP8TGpv1J7Hr4rpLkhRhWOvo2U6K+oZWNz38u91Wa2/oojHfKIIW/fP8O/2
 ahzoMGXbn8rp25gMWGp0CrvgXNrpYwO9AUUeMsfLXR/CR8EAjxMYcttXW0FO+AjATfG+
 AGb2k3JRmpq499iNZ+yWcjQK0WwJ6RmYDNO89V0hqqHW4QFAC87ThcSmDD7gnTTsYtlu
 0MVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7HA05XhYlCzTp4qvhhSBcSuSKybJ0PulYKdWBwG+DL8=;
 b=Zsxa+VBcJsu6OPINLsanLRdSurpGQE8rVWXuinJ7eWjad34Mq9KDIrwt7I/sEnCmmy
 4TtXPdQhnRjydxeQE00Z6gaONzjg30JCQDk3mVcXAFb7WMBIHBcV7XXPTYcdSPI4N/a1
 nX4TgMEVkWcJgvuBHreQTRGdFOlnMN9zjF+BheR2ThvmspLTz9/pzTY5k0DG7Hv01+cN
 oLuwVR70zG5gR53xR35wFfoO37cA2ga5/tseTVsIGbH0Z/UQJq+kDIE1/fIXSoOcX8dG
 illyxIpi7LxxGKiqNJfDT4Q/GhQ8OuXSE8ejdP+ehTYQA8Xb2d4zsUObEIqdXdwyfTml
 NFNg==
X-Gm-Message-State: AOAM533WWOqlVhRe1cSexXmp81S9CvO8zaHOqgXFYSkTyf2xKXO1xNz7
 9fpaNG9mZcxQ8uDuOM06G04=
X-Google-Smtp-Source: ABdhPJygultcXZ5O6UR+Ra3FMuRkjBlnywYkj/YSuUzgBBN4t/ktdv6OEJaf5N8LyoDiF4gs7MeeKQ==
X-Received: by 2002:a17:906:974c:: with SMTP id
 o12mr2362914ejy.229.1637657214203; 
 Tue, 23 Nov 2021 00:46:54 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id cs12sm5074681ejc.15.2021.11.23.00.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:46:53 -0800 (PST)
Message-ID: <4041d98a-23df-e9ed-b245-5edd7151fec5@redhat.com>
Date: Tue, 23 Nov 2021 09:46:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 PATCH 09/13] KVM: Introduce kvm_memfd_invalidate_range
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-10-chao.p.peng@linux.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211119134739.20218-10-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Wanpeng Li <wanpengli@tencent.com>, luto@kernel.org, david@redhat.com,
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 jun.nakajima@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 14:47, Chao Peng wrote:
> +
> +	/* Prevent memslot modification */
> +	spin_lock(&kvm->mn_invalidate_lock);
> +	kvm->mn_active_invalidate_count++;
> +	spin_unlock(&kvm->mn_invalidate_lock);
> +
> +	ret = __kvm_handle_useraddr_range(kvm, &useraddr_range);
> +
> +	spin_lock(&kvm->mn_invalidate_lock);
> +	kvm->mn_active_invalidate_count--;
> +	spin_unlock(&kvm->mn_invalidate_lock);
> +


You need to follow this with a rcuwait_wake_up as in 
kvm_mmu_notifier_invalidate_range_end.

It's probably best if you move the manipulations of 
mn_active_invalidate_count from kvm_mmu_notifier_invalidate_range_* to 
two separate functions.

Paolo

