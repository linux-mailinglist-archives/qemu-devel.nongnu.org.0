Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC6459E70
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 09:43:00 +0100 (CET)
Received: from localhost ([::1]:39222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpROD-0007Tw-L5
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 03:42:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpRN8-0006P0-Jl
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:41:50 -0500
Received: from [2a00:1450:4864:20::432] (port=45605
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpRN5-0002CX-82
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:41:49 -0500
Received: by mail-wr1-x432.google.com with SMTP id o13so2673831wrs.12
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 00:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g0d3QqsCZsAQe09AQzK3FGjRTfaWx8wJ4QGwqSaUY0s=;
 b=Mw62+XRWvlT8qzBeQZ/h0IBf67LqzhudM5xDapZFn6GgfYhCFcPBmka7Oj1ocwxvUQ
 /cNvmDmqTcYcrSyuuxeDgHc0xFZUqCTComJMB86gBn2KEDpFumMcEqIXhxSwB6YMjubD
 lt3NXPRM2NtOwMMqJs0LE8AhzdddiT36Z6qT5lxRIodNyCjTuauigZnaHO1DCx5GVDql
 epdOGzox9iGOjYi+i7ugyfur4oshX7Ze5oXbADgUgZ+gz+Z0B8y4Vn5a0HN+V8Nh+J7S
 HwMyR5sLcNaGdSCjB99j7FaSlB31s+kjOffJkUhXlpnG/VQ5xi3wdnNC3HpGS7PAxaV6
 VRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g0d3QqsCZsAQe09AQzK3FGjRTfaWx8wJ4QGwqSaUY0s=;
 b=6TC118b1KcCwCOWk7P7mUYmakaLCp11MAoiY4nOtHhazlZShTOA7G48Wq56FZG7nRt
 TFnnIUvBhFtQkTpfXj+EgVe4uvBWcGbD7OvYh+coB57R3NRRsX5/8H7U+z5hqRM1LkMh
 BZWK4xP+jFp0FCIXCihNA0kPOJSMJn1FVbnzJxtyBEkSJfmUY3XldcXq4q3YXFxSWj8e
 Te4/qqNBUuroy0Wt6nU9ZWOc7vWoEUmMczPVxQoZ+CBJku/16ctxC3WfLYmVkj3L0U+5
 xL/5nlNOSwoNm1UMgqE0WOoCa9qTOyP6bKDQqEt7pr1GdZOI+X7upxv2aFqdflZYcIoJ
 s4rw==
X-Gm-Message-State: AOAM533y8d/k6NysNnIQjdURa+Gxpl8bfwZNX1YO8kcHQ5e9zE8G8eMY
 1RslSJvCja715+Ig6z1xtdU=
X-Google-Smtp-Source: ABdhPJwvHgZSqW8ZEVCAO/5N69oBusE0Bm0f9EvZzy4r53G0pOj/QfdnMwTLqTwvVRJp7btLIQMB3Q==
X-Received: by 2002:adf:cd02:: with SMTP id w2mr5046687wrm.269.1637656904964; 
 Tue, 23 Nov 2021 00:41:44 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id p27sm348736wmi.28.2021.11.23.00.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:41:44 -0800 (PST)
Message-ID: <d54d58a4-3cd0-5fa3-3a81-b4bb27a7f511@redhat.com>
Date: Tue, 23 Nov 2021 09:41:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 PATCH 04/13] KVM: Add fd-based memslot data structure and
 utils
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-5-chao.p.peng@linux.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211119134739.20218-5-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
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
> For fd-based memslot store the file references for shared fd and the
> private fd (if any) in the memslot structure. Since there is no 'hva'
> concept we cannot call hva_to_pfn() to get a pfn, instead kvm_memfd_ops
> is added to get_pfn/put_pfn from the memory backing stores that provide
> these fds.
> 
> Signed-off-by: Yu Zhang<yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng<chao.p.peng@linux.intel.com>
> ---

What about kvm_read/write_guest?  Maybe the proposal which kept 
userspace_addr for the shared fd is more doable (it would be great to 
ultimately remove the mandatory userspace mapping for the shared fd, but 
I think KVM is not quite ready for that).

Paolo

