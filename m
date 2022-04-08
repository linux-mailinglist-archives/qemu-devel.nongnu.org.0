Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA134F9F4A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 23:43:43 +0200 (CEST)
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncwOM-0002U6-6X
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 17:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1ncwGI-0008AX-UR
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 17:35:23 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1ncwGH-0005tI-5b
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 17:35:22 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 125so8801138pgc.11
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 14:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1qOh37iLUcxnJDmoGj1A0J8wEY8rbxtdTzE2pYYO2Ks=;
 b=K7ke0nxKWUWDfr1v0VmW7e7Sj+uaxy5yBp10RU78CNH/g52aooIPr2w/v94GPqq3yt
 zFQSXrnXOZwWVUdkVrnXqcdRHdIfF/bEXnSJnFQRftzCNuBi1e8Qhjqx8VPGVIHFvCXB
 2Z8dmxdfIM2m4yiW/h/ciGT0wL20FvLMroNAuoVc3UK7tZGvENlBr1v4Ga4ak5TS0xT7
 EVCU5/eAZq6lWcTbvTxiMajlg+tAlQpvVvxFpD9bd10ybCnJ2A+a3w5D0mo5UZtae6pZ
 0Cu/TPA4wIOD9fd48Rf6GMXJ5k7Fa9yM+N6O3DNJ4Y5rx+o8OM4kClD90lO10A1XGyd+
 MH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1qOh37iLUcxnJDmoGj1A0J8wEY8rbxtdTzE2pYYO2Ks=;
 b=Vc+aBrZsOvxpD7V29xYJ6pYp7gq4c+1cZhDwrXfbSSFeSOdky8gxH/zL1jRHZSLqQN
 qUCcd7GjSN8szhAlo+Vh8YnMWQY/FUmnmKikftVTfYtfHJbA0kM6OwAFEmUhh7JiR4Ks
 9W207hsB2kA3Lu4ElLUh7eT+ZDrZcWsbzaR29HgerlJvMgOPt+ITL1xnY0piuhAA1tYw
 uEDXa3uevBhJoQX53TPdxn9Eka475QQbncDcgx49Nkct9akGie6cBWPusxrG0VmO4Bld
 E3myTxVy2RzrddpgWhai7i3FEvClvCTNaFOcv9Ig7/C/rZoiZaPco7eO+vDwOw2xan+s
 seMw==
X-Gm-Message-State: AOAM5329j2ibD2mQZeCLLbhsnzUerJ4lkqe61oe4oSwhNsF++4xplsXo
 9rjZkiTxMNJzK8oukgJJODg75hiKybyOv0aRa/KLEQ==
X-Google-Smtp-Source: ABdhPJxus4Jbsc/w4aGFY60Ag12TVzRnVuVqzB94CGBFmaLEQk//iA1NOJ2EJlj9NmymKztcqpk5RfgvqqLZIEnC9mU=
X-Received: by 2002:a65:53cc:0:b0:382:8506:f1a6 with SMTP id
 z12-20020a6553cc000000b003828506f1a6mr17358980pgr.44.1649453716972; Fri, 08
 Apr 2022 14:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <CALCETrWk1Y47JQC=V028A7Tmc9776Oo4AjgwqRtd9K=XDh6=TA@mail.gmail.com>
In-Reply-To: <CALCETrWk1Y47JQC=V028A7Tmc9776Oo4AjgwqRtd9K=XDh6=TA@mail.gmail.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 8 Apr 2022 11:35:05 -1000
Message-ID: <CAGtprH9DGyxSKSwVhc0Td3x-M4-C6j=+d3DEtkxOty+PPB0V_g@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
To: Andy Lutomirski <luto@kernel.org>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, 
 dave.hansen@intel.com, ak@linux.intel.com, david@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=vannapurve@google.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 08 Apr 2022 17:42:27 -0400
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

On Mon, Mar 28, 2022 at 10:17 AM Andy Lutomirski <luto@kernel.org> wrote:
>
> On Thu, Mar 10, 2022 at 6:09 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >
> > This is the v5 of this series which tries to implement the fd-based KVM
> > guest private memory. The patches are based on latest kvm/queue branch
> > commit:
> >
> >   d5089416b7fb KVM: x86: Introduce KVM_CAP_DISABLE_QUIRKS2
>
> Can this series be run and a VM booted without TDX?  A feature like
> that might help push it forward.
>
> --Andy

I have posted a RFC series with selftests to exercise the UPM feature
with normal non-confidential VMs via
https://lore.kernel.org/kvm/20220408210545.3915712-1-vannapurve@google.com/

-- Vishal

