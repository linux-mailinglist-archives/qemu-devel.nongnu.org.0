Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929746F87A0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 19:32:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puzH9-000524-Dn; Fri, 05 May 2023 13:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ZD1VZAYKCl0N95IE7BJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--seanjc.bounces.google.com>)
 id 1puzH6-00051v-Hs
 for qemu-devel@nongnu.org; Fri, 05 May 2023 13:31:20 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ZD1VZAYKCl0N95IE7BJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--seanjc.bounces.google.com>)
 id 1puzH4-0006Ng-Rl
 for qemu-devel@nongnu.org; Fri, 05 May 2023 13:31:20 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-52c7ac1abdeso1447322a12.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 10:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683307876; x=1685899876;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=qAOxuvlzoNXvPjKXSolx+GWj91lIdWlZPd2J+lepu+A=;
 b=YajfbfW6/wtHmrsLEvn1JkH+xI6N003d6IHsKYEdYKyQ4XBOf/ltXYAA8TT//7kx7h
 8wJuT8QRTxgAHxrmJYouhI/7YgQTZm4mO10KjPCgeJdJMeuE5+h/bLiahSr81Gm/ecKB
 zDx4TcPrzUJvkSrnc51y29YU+lehMTLTirJ8zF6Y7AvgQTUcfYtQ37OJnKLDHV7h0smL
 PJn351waqBTnvLrthFCgyYl4ojqlUIUMdMZ9mvD3/1gMVpPtasu86bb2kRnLpCKWJhO/
 k73RbTIykvnJHtRsAnnJa8Km60QZxDXHqCZ+6V04mHM7fIYa6vKKdRMKt3CdepgXl1bi
 CXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683307876; x=1685899876;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qAOxuvlzoNXvPjKXSolx+GWj91lIdWlZPd2J+lepu+A=;
 b=Mg6BBd4wQsuFmZ6SqnC0ZtouPc4zTKczm7VRX3kg/lACqO0cTUxDHL9+et5L+uUeVg
 UpkuvU6Lul/0K572YG5ojnqQJ49dWCmrnhVCWqpDTu+ArKOf1D4Qlt9357Q+Mm3LciY5
 X7wdl2Gk0XdLXtw26Zu1eRkGOzORh7YUeg8BQ843dJqiomk/UNbL/O2CU87V+XQCHO0b
 vM7TyqcjpdfQnIQqREEWtGcdfzxrjm8k126qnvMLzMcBmpkzpZq+Th3lfzOtgikFHAe8
 4aWv66w0gJbGfyCXxsk/VqVpSzsvEnjV6E31z5nuuBkNiczLsIcTB/YRQJX7a74YOT4t
 aR8Q==
X-Gm-Message-State: AC+VfDwNGXaTiVS3X/ifO0nNKr8tKMUhcKPjpOfL6P7vjyACzOxVddK2
 ufoOKprVqrHEfXpDAjfFSRqlPNE7kOI=
X-Google-Smtp-Source: ACHHUZ5AKtrEhFxY1tyiq165vY9w3gn7Qqc7+wcBsvMx8OszEeBENNSnTQn/dNy8sL8BRZ1pG6YlJeRQjuk=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:152:0:b0:52c:407a:2279 with SMTP id
 79-20020a630152000000b0052c407a2279mr529292pgb.0.1683307876644; Fri, 05 May
 2023 10:31:16 -0700 (PDT)
Date: Fri, 5 May 2023 10:31:15 -0700
In-Reply-To: <6412bf27-4d05-eab8-3db1-d4efa44af3aa@digikod.net>
Mime-Version: 1.0
References: <20230505152046.6575-1-mic@digikod.net>
 <20230505152046.6575-3-mic@digikod.net>
 <ZFUumGdZDNs1tkQA@google.com>
 <6412bf27-4d05-eab8-3db1-d4efa44af3aa@digikod.net>
Message-ID: <ZFU9YzqG/T+Ty9gY@google.com>
Subject: Re: [PATCH v1 2/9] KVM: x86/mmu: Add support for prewrite page
 tracking
From: Sean Christopherson <seanjc@google.com>
To: "=?iso-8859-1?Q?Micka=EBl_Sala=FCn?=" <mic@digikod.net>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Kees Cook <keescook@chromium.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Alexander Graf <graf@amazon.com>, Forrest Yuan Yu <yuanyu@google.com>, 
 James Morris <jamorris@linux.microsoft.com>,
 John Andersen <john.s.andersen@intel.com>, 
 Liran Alon <liran.alon@oracle.com>, 
 "Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>,
 Marian Rotariu <marian.c.rotariu@gmail.com>, 
 "Mihai =?utf-8?B?RG9uyJt1?=" <mdontu@bitdefender.com>, 
 "=?utf-8?B?TmljdciZb3IgQ8OuyJt1?=" <nicu.citu@icloud.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Thara Gopinath <tgopinath@microsoft.com>, Will Deacon <will@kernel.org>, 
 Zahra Tarkhani <ztarkhani@microsoft.com>, 
 "=?utf-8?Q?=C8=98tefan_=C8=98icleru?=" <ssicleru@bitdefender.com>,
 dev@lists.cloudhypervisor.org, 
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-security-module@vger.kernel.org, qemu-devel@nongnu.org, 
 virtualization@lists.linux-foundation.org, x86@kernel.org, 
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3ZD1VZAYKCl0N95IE7BJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--seanjc.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

On Fri, May 05, 2023, Micka=EF=BF=BDl Sala=EF=BF=BDn wrote:
>=20
> On 05/05/2023 18:28, Sean Christopherson wrote:
> > I have no doubt that we'll need to solve performance and scaling issues=
 with the
> > memory attributes implementation, e.g. to utilize xarray multi-range su=
pport
> > instead of storing information on a per-4KiB-page basis, but AFAICT, th=
e core
> > idea is sound.  And a very big positive from a maintenance perspective =
is that
> > any optimizations, fixes, etc. for one use case (CoCo vs. hardening) sh=
ould also
> > benefit the other use case.
> >=20
> > [1] https://lore.kernel.org/all/20230311002258.852397-22-seanjc@google.=
com
> > [2] https://lore.kernel.org/all/Y2WB48kD0J4VGynX@google.com
> > [3] https://lore.kernel.org/all/Y1a1i9vbJ%2FpVmV9r@google.com
>=20
> I agree, I used this mechanism because it was easier at first to rely on =
a
> previous work, but while I was working on the MBEC support, I realized th=
at
> it's not the optimal way to do it.
>=20
> I was thinking about using a new special EPT bit similar to
> EPT_SPTE_HOST_WRITABLE, but it may not be portable though. What do you
> think?

On x86, SPTEs are even more ephemeral than memslots.  E.g. for historical r=
easons,
KVM zaps all SPTEs if _any_ memslot is deleted, which is problematic if the=
 guest
is moving around BARs, using option ROMs, etc.

ARM's pKVM tracks metadata in its stage-2 PTEs, i.e. doesn't need an xarray=
 to
otrack attributes, but that works only because pKVM is more privileged than=
 the
host kernel, and the shared vs. private memory attribute that pKVM cares ab=
out
is very, very restricted in how it can be used and changed.

I tried shoehorning private vs. shared metadata into x86's SPTEs in the pas=
t, and
it ended up being a constant battle with the kernel, e.g. page migration, a=
nd with
KVM itself, e.g. the above memslot mess.

