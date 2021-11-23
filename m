Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB55345A9E0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:20:45 +0100 (CET)
Received: from localhost ([::1]:47868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZTG-00057l-NG
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:20:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1mpZQ9-0002Ia-Tf
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:17:29 -0500
Received: from [2607:f8b0:4864:20::f2a] (port=38437
 helo=mail-qv1-xf2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1mpZQ7-0001tS-1i
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:17:29 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id a24so15467455qvb.5
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dC7uVzt5MrM2Gpk9LsKlRUHiHwvI+5kbQiNrhRQEF6A=;
 b=HM1ELBL6+qrvalddZKiZw/V6FXnHcMyFZLZfs67w7amsPIslJxelFU4TMjYnUqS5mW
 8NGMFJ7vfDrM/iIXSd6jsaSLlTg0VQj+QMdCvE41WvkoCQBAGaDgpZRmoNmqkXvsB1cJ
 QgaGAk/Av+gjr7UM7Zq7HZnZkL2lyALAZbInsSeNoJir4dw7UbP1UIjcPig45faa/64/
 jvC+pTThM3ceUYvLfwJ1+QSyuWBdAknmdurKpKyDdLKAg+5N3alo4Ec3Wbpm2S8/Uv2w
 AYnn8nIrJjy1LY7CJh3Z1dDw4IS8yETG0cN3IlthsDTwSlINDkSJBQLctYDFC3FUmN8E
 3+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dC7uVzt5MrM2Gpk9LsKlRUHiHwvI+5kbQiNrhRQEF6A=;
 b=2ikHE7KDznm4Kvd4Y7kDpsLV2A/Jgh6KKxc+GE5254qbw8i3PDXRlGXyDnaraF6GfM
 v3ffxTt3gcQeU9UgEJe7fzLbdIJltvIcuUCEmZoTA6Ne5YJarKzxL4o+quWe2mdCgaii
 Javz9tnjCmpfi/yrNnvoZp04HxyPWetXJFBmXTsdDFoOoVn8CWi9zBr1dnlo6JQkr1mg
 a2wOgxrAzc7rzDHMItrkExAjAuLigvzlwHy1cBQXYbYtIhUA+PXTAxmsnUHwHIR0cj3a
 l8hqnz91fjZYYyIKIET3CGJ1GST8g0bj7b2bartsR8aiTGwLw6JbUwKNdLOGZSEsOyuq
 CZbg==
X-Gm-Message-State: AOAM532S7lynGDCXEpwWKQGTR5eaIYAPQPwVNX/AvWxPWhspWI4QaeLM
 /xcjJx9gqdtp5T9DGwEk55zR5w==
X-Google-Smtp-Source: ABdhPJxtD1ArRYMjSPPd0YoD13PmNVq/BXBvjflzk5qi5Q9ez9zBHlK3Jkepb5uP7WHDg9Rr2wTk4Q==
X-Received: by 2002:a05:6214:246e:: with SMTP id
 im14mr8350503qvb.14.1637687844906; 
 Tue, 23 Nov 2021 09:17:24 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id x21sm6354233qkf.77.2021.11.23.09.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:17:23 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mpZQ3-000Dij-2a; Tue, 23 Nov 2021 13:17:23 -0400
Date: Tue, 23 Nov 2021 13:17:23 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Message-ID: <20211123171723.GD5112@ziepe.ca>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
 <6de78894-8269-ea3a-b4ee-a5cc4dad827e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6de78894-8269-ea3a-b4ee-a5cc4dad827e@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a; envelope-from=jgg@ziepe.ca;
 helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "J . Bruce Fields" <bfields@fieldses.org>,
 linux-mm@kvack.org, "H . Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 23, 2021 at 10:06:02AM +0100, Paolo Bonzini wrote:

> I think it's great that memfd hooks are usable by more than one subsystem,
> OTOH it's fair that whoever needs it does the work---and VFIO does not need
> it for confidential VMs, yet, so it should be fine for now to have a single
> user.

I think adding a new interface to a core kernel subsystem should come
with a greater requirement to work out something generally useful and
not be overly wedded to a single use case (eg F_SEAL_GUEST)

Especially if something like 'single user' is not just a small
implementation artifact but a key design tennant of the whole eventual
solution.

Jason

