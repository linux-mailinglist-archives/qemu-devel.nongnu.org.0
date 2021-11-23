Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1EE459E9B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 09:53:22 +0100 (CET)
Received: from localhost ([::1]:50024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpRYH-0006gn-Md
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 03:53:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpRX3-00058V-Gj
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:52:05 -0500
Received: from [2a00:1450:4864:20::533] (port=45892
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpRX1-0003SB-N3
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:52:05 -0500
Received: by mail-ed1-x533.google.com with SMTP id y12so88839594eda.12
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 00:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZlSGmgK04sSRdzce60rca16DF7pHY7R8mkHLd+e2EtI=;
 b=ITSbDLvVQF5Pys3yfnDfjJPsOOVVYvoLjUSScohcTrvaJdHl/9EHS8d9i2S5R8Uf/K
 4s2WMJQDwnIFw+lX6/BqKFRfbyJP6lGaNpaGJfzlYYrY9KqADfho7+J+Sc+eKEeB4gQM
 jNQovETzFOv4K7+TmCcvlFvC2Y6H2Kp/3ilLyt+hPn88AWWXvoNtfld/FvPJKoV+jfNQ
 aUdhg6DabReEPo7FO8FG2sjodRYZNH6wlYAuThcxUHpIjKmLyTWqB+b7b/1S5Hn0S7LA
 e7b6tKbcqf9trxQvprbQwmW8C54tdEuqQd+T2O/lOxhqx/ntiNtEeCL1c4i9+S6iIh5Z
 FjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZlSGmgK04sSRdzce60rca16DF7pHY7R8mkHLd+e2EtI=;
 b=5N190BDWCA2o55mkAPNRQkxwc0fkxlk2t/W4eJOlhmsHOt094gngyISdp/Zd1uyIem
 QVbIZJqQLo5PAWle2oSyOXn5ABY6Rbm6mg2w7guPucRYDImiE2bYYa/8fcNkZrYfMAOb
 /6KyP/IYmyBWhuSnHhsCQEOfQ2hUYQ5Q5wP/nCkePmAH+sbDIe1qk/J9DyZzAPr/tIJP
 xZYK2rCKETCFc0UmxSfZXZDFEukhpwmsRAoYUPPVHlWGN7GgLg2HRY6voilptf323zzO
 kGtMCIXVGO1hsboCf/+8B+FrqxZViwjfICqzdji7k6YueN9R3eAYWRpE6CpIacrdzFMi
 y5/g==
X-Gm-Message-State: AOAM5300+i/FCT1rL/1sHO30S/krmysgcm2y7qBiUptzRZ79z5Cfgi83
 T9E5lZDHH6J78AoWc6Up8hY=
X-Google-Smtp-Source: ABdhPJyvvvQQvkGIxCW0eOgt8FiihExxUTGI/KDUle/HeZ8ErdGrPrU0t0a4F1hxpkf//prQqRAmew==
X-Received: by 2002:a17:906:961a:: with SMTP id
 s26mr5477877ejx.494.1637657522264; 
 Tue, 23 Nov 2021 00:52:02 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id hv17sm5182114ejc.66.2021.11.23.00.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:52:01 -0800 (PST)
Message-ID: <edd15117-def0-71b6-6422-66490155448d@redhat.com>
Date: Tue, 23 Nov 2021 09:51:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 PATCH 13/13] KVM: Enable memfd based page
 invalidation/fallocate
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-14-chao.p.peng@linux.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211119134739.20218-14-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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
> +	list_for_each_entry(kvm, &vm_list, vm_list) {
> +		if (kvm == vm)
> +			return false;
> +	}
> +
> +	return true;

This would have to take the kvm_lock, but see my reply to patch 1.

Paolo

