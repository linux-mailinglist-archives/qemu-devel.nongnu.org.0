Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D0E5396E7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 21:21:33 +0200 (CEST)
Received: from localhost ([::1]:44840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw7Qp-0002bi-M5
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 15:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1nw7Kn-000075-DR
 for qemu-devel@nongnu.org; Tue, 31 May 2022 15:15:17 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1nw7Kl-0006CK-Lq
 for qemu-devel@nongnu.org; Tue, 31 May 2022 15:15:17 -0400
Received: by mail-pf1-x433.google.com with SMTP id p8so14051380pfh.8
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 12:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9LEQ/FAYXiOycH5Pgki0a9z4cyO6Zt9xfMoijJMruHE=;
 b=aoYECPuBKU7Lwlucej90ckQ541ZhjI9tXfhwwrKcylKXIDWfCbS506NUkmQoPpFtjp
 SxY2BDwXcLrnVWuj1tlKZZFXX3boTF7L4/UbiNTvLgRbtbDkTU4iJj5rlChLdWN+AXW9
 /8uU6E9xZwRmy7lGao0XRqc/MNAqTYJl5P/hqXTOYZPGOYjzn/bAAgwSrZzoRfJDN/cT
 SuEfeHBBPefKlsfPtsSVZxWgXtnCDoM36KPdTqy2nZJEgrImggnACjHpxleCCtC3++o9
 yxDwtO9/7vBZwXZmJ1VhyZ/Ls48fokKREiBfE3hRzy/o9DlM+JugKxkM4Tz9Yq/hcS03
 4NUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9LEQ/FAYXiOycH5Pgki0a9z4cyO6Zt9xfMoijJMruHE=;
 b=FFyXzhPhKidhG3k0TEf0ORt6C5T2Ru2IYZxcbnrkdB1n945G/sNcEAm1h1WvAGER3X
 OK6RKuXkrsTB/AWYg9OA53VAAvo41sxtSJnXWp1j5uzZqheGOeFkrCs5POafkDK/LkHx
 7iLny3qBQuFQ6uo9gC4/AO/nvjRCY7Y8+CMB1tnwx5lj0u3aYbpxfEnvvb2zMXidc0u6
 yWjIFYPargUu/eXEPTzaQqSbI8dsC21cwk0m4qWjVuBxQBwQ6Q3d5sro88HU/j4ZTTYh
 rbOeEDfyzhnlb9ybJ/DGsgQqS6eyO2shQYNcXiG+EkZ3sLUtzujYdyjH/RSnzKgD4py/
 tz5Q==
X-Gm-Message-State: AOAM533KHjL104Dx+7n8PPEeNZHfK8/2lD+zbLk71i33yQGN4qIiuEXP
 bzIGxN1ZEsLJXeRoFbjqT26UTYxbMat8ln5tWmYrJg==
X-Google-Smtp-Source: ABdhPJxAPLjjLuJnMkOUKZFNo6VjJcW6gX615tv0A0PeV8j4hPGz6HEz6HuE5g9ZfRLMUWFpXLfK3l0Q4MwhwgPaQrE=
X-Received: by 2002:a63:2ad6:0:b0:3f9:d9fa:2713 with SMTP id
 q205-20020a632ad6000000b003f9d9fa2713mr44449690pgq.512.1654024511581; Tue, 31
 May 2022 12:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-4-chao.p.peng@linux.intel.com>
In-Reply-To: <20220519153713.819591-4-chao.p.peng@linux.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 31 May 2022 12:15:00 -0700
Message-ID: <CAGtprH8EMsPMMoOEzjRu0SMVKT0RqmkLk=n+6uXkBA6-wiRtUA@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] mm/memfd: Introduce MFD_INACCESSIBLE flag
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, 
 Jun Nakajima <jun.nakajima@intel.com>, dave.hansen@intel.com,
 ak@linux.intel.com, 
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com, 
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>, 
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=vannapurve@google.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Thu, May 19, 2022 at 8:41 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
>
> Introduce a new memfd_create() flag indicating the content of the
> created memfd is inaccessible from userspace through ordinary MMU
> access (e.g., read/write/mmap). However, the file content can be
> accessed via a different mechanism (e.g. KVM MMU) indirectly.
>

SEV, TDX, pkvm and software-only VMs seem to have usecases to set up
initial guest boot memory with the needed blobs.
TDX already supports a KVM IOCTL to transfer contents to private
memory using the TDX module but rest of the implementations will need
to invent
a way to do this.

Is there a plan to support a common implementation for either allowing
initial write access from userspace to private fd or adding a KVM
IOCTL to transfer contents to such a file,
as part of this series through future revisions?

Regards,
Vishal

