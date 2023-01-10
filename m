Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8486664F20
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 23:53:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFNTG-0000e5-9r; Tue, 10 Jan 2023 17:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1pFNTD-0000c2-9i
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 17:51:51 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1pFNTB-00043W-Cn
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 17:51:50 -0500
Received: by mail-qt1-x834.google.com with SMTP id v14so12343995qtq.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 14:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nj+/7ufbi+mzc9WLMV9MhKIZ+vKN2tVNdm/p4PveWiw=;
 b=Z+LHP8EFN813rSHrstCkLabK4IngHI+cKeRWcxWaVpq6IuYGolxjNslezLPrqVjGqV
 q49LhzsEKIYTJGC5ECSyLgvYu9H6+d3+MoSEXFRuBNZkhp/bFYsGHLQVlAUclwstgUl/
 HA4F75LkF1TDyFZhI9t2f3OaD8uDIFSGgQkDwmVvJv1HJfjnrob4MIuu2lTVJTGD2K5s
 FR5lWKSZN3r86ua09Ari4/MY00ieOSSs2Nxy9skABpdMmfZbUcY4CQ2ZJ0yT0Fd/fH8u
 ay9FGbUCFo1jWFIKVNRkSTNDVKrkth2p5YEk7hVBNMXL4/rfsK5UKUx7+zHk/wkSssr/
 8Vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nj+/7ufbi+mzc9WLMV9MhKIZ+vKN2tVNdm/p4PveWiw=;
 b=JMfAYgmK+uLrJN0zXYluzwtMq411jMVisuAHS6KwUVNOpXSwpgSzip/XkACgKQFouN
 7g7ac+8bmJqrKgc32fppvZvo19HRG12/iXKMIbjqLhiNHPIXVC9uQawdvekBbJ2YTsTE
 dgPPwkNxyEEhgO4B34YkWtkSfmgsKfYEIL8dv9Ng6ZzIpdTYpm8UwHaO5Gy30MlPCq8Q
 PjgzYEDgF6Z4mvnw0u/2P3fxkg2Ymfffrx8gEaCSkmbKNA29wSL9jMWKcIvt65ZT1K//
 Dz4F0ZEJVXcsvnSJ/8C6fP/x4M8ZyWinlDAlt+SMJws7VXrTun6AGhBzJEPVkSq4AVco
 pXIw==
X-Gm-Message-State: AFqh2krOvKORSSshUQX/bqCwFwsvuRfGXNfwAXwq6oMs2dp9NUTV3CkU
 2pDgK9X8aaZQGIcuArvM7aj78K7v5NIRqz+8wHFkWw==
X-Google-Smtp-Source: AMrXdXtCmgtL7XJA1AjxTGWmxlUVgcif515aqBGzxNtC4EL5mTP/V3O8hTigwzRJaQTQTj8cDIyP79kG4mIF4ZDOg8Y=
X-Received: by 2002:a05:622a:5c1a:b0:3a6:ee88:63dd with SMTP id
 gd26-20020a05622a5c1a00b003a6ee8863ddmr3310643qtb.446.1673391106667; Tue, 10
 Jan 2023 14:51:46 -0800 (PST)
MIME-Version: 1.0
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-4-chao.p.peng@linux.intel.com>
 <Y7azFdnnGAdGPqmv@kernel.org>
 <20230106094000.GA2297836@chaop.bj.intel.com> <Y7xrtf9FCuYRYm1q@google.com>
 <20230110091432.GA2441264@chaop.bj.intel.com>
In-Reply-To: <20230110091432.GA2441264@chaop.bj.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 10 Jan 2023 14:51:35 -0800
Message-ID: <CAGtprH_V84eSDE1ohRBd24k=MuL+Y0zF1YVbKBjK4ROEHPJEpA@mail.gmail.com>
Subject: Re: [PATCH v10 3/9] KVM: Extend the memslot to support fd-based
 private memory
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, kvm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>, 
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, 
 dave.hansen@intel.com, ak@linux.intel.com, david@redhat.com, 
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, 
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=vannapurve@google.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 10, 2023 at 1:19 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >
> > Regarding the userspace side of things, please include Vishal's selftests in v11,
> > it's impossible to properly review the uAPI changes without seeing the userspace
> > side of things.  I'm in the process of reviewing Vishal's v2[*], I'll try to
> > massage it into a set of patches that you can incorporate into your series.
>
> Previously I included Vishal's selftests in the github repo, but not
> include them in this patch series. It's OK for me to incorporate them
> directly into this series and review together if Vishal is fine.
>

Yeah, I am ok with incorporating selftest patches into this series and
reviewing them together.

Regards,
Vishal

> Chao
> >
> > [*] https://lore.kernel.org/all/20221205232341.4131240-1-vannapurve@google.com

