Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC46C2DCAA4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 02:49:18 +0100 (CET)
Received: from localhost ([::1]:46122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpiPt-0000LE-D1
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 20:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kpiO7-0008B9-8j
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:47:27 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:39101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kpiO3-0005iK-Om
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:47:26 -0500
Received: by mail-io1-xd2a.google.com with SMTP id d9so25976435iob.6
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 17:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VZ4JZTy9+IKB/FbonfM/ldsdg2nn5Yf2TNc8FXof9Fw=;
 b=UCKfAQeBD/lJG4xTZujpMykS46OkdwA9BPik0ZiiP21lmRgJi3/09ohZX9ainMiDKI
 zRxn1vaP+CfpIESFJS/QD4RnMwzU19wODWEC1xxljKq7id5AuvYG5Dhj6VKCiWpO2Bmu
 xepCxxs/nvgAXLsdCo2asTTHWcfi0AsBbedsUSJ6VQp8rpnwvC6QtDd2SbN9Spb44SUF
 VwSXJD16Eaw04aOWV7lxsiFWYQZtc8M40srQyPH6OUeMdOAFhkyMivfM99Y42ik6mm5N
 g+0+Fxj5swtGtbxryrmlwpv3/CKawNt0PwS4A8NM3EMTCg9KLXX30DBH0v5yRbhKLl3w
 dcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VZ4JZTy9+IKB/FbonfM/ldsdg2nn5Yf2TNc8FXof9Fw=;
 b=EPKv0JzNgow/97xukHtLG7GMNdmH2e2LlaYmBJSknGdLPRM2moiY8KCsDMZ5dneYUM
 ylMJhXfo5a0fiPrdRxSFM2xh+ToaQvnRU6tya7OX5bAygrIVBlL53aFZcM1P5Ab5TJhc
 e8wmKyTtMxz/2FbjtmsCWg/kZCDfTjH21a8ijVhhiwSlYkYyanin1lItkH/K8UAKNo/t
 Pk1VWj9X8PcyCAMnBZ+5T1CflLIIDh007t+iIq9vSCy3WRrcRctL01NWHFporluOBdGJ
 jwYI2KSwfmXPxKPDGfodr98qcyEI9FCH4CaaMg3lpmJIMjJDPv0PxoRchC4k514W+yrx
 +agg==
X-Gm-Message-State: AOAM531D37g9zcnfs8uEqt/fiGwRv4GN268MzfLCGmggBvpN+fp8RY4I
 zmCfbD0Lhx7hntz9MCidoA1GDFwPdLDaO78rNgfj
X-Google-Smtp-Source: ABdhPJyjbWC+MxAHpU9U15X6j6tLnLYjUbu31cSB3o9cVK1vZQtR1OSioJ1js/51Pmr9o1T76zygxv5g3/iHHIbTXNs=
X-Received: by 2002:a5e:8e05:: with SMTP id a5mr44246697ion.133.1608169642340; 
 Wed, 16 Dec 2020 17:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20201119153901.53705-1-steven.price@arm.com>
 <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
 <20201119184248.4bycy6ouvaxqdiiy@kamzik.brq.redhat.com>
 <db5ad775fa7cfe7defbd78d9ca6ccfd8@kernel.org>
 <c25c297e-e9b5-ab3f-e401-c21ddd4d2ad1@arm.com>
 <CAJc+Z1H7akXwDtVvQLiGVVyZ0DfmsxyJQhE7Sno6aAO9GaafEA@mail.gmail.com>
 <46fd98a2-ee39-0086-9159-b38c406935ab@arm.com>
 <CAJc+Z1EzaUjbQ0o8BSF_+PQy_KnwPp1NqO+94RMphvaUu=dnug@mail.gmail.com>
 <29a7229d-a1ff-98a5-3007-1addcc85aa04@arm.com>
In-Reply-To: <29a7229d-a1ff-98a5-3007-1addcc85aa04@arm.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Thu, 17 Dec 2020 09:47:10 +0800
Message-ID: <CAJc+Z1E0rdWcDD1N1R=d-v8FnWSWw=Yu7qypUjRFG_pXw1xybQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
To: Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Juan Quintela <quintela@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 kvmarm <kvmarm@lists.cs.columbia.edu>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Dec 2020 at 18:23, Steven Price <steven.price@arm.com> wrote:
>
> On 16/12/2020 07:31, Haibo Xu wrote:
> [...]
> > Hi Steve,
>
> Hi Haibo
>
> > I have finished verifying the POC on a FVP setup, and the MTE test case can
> > be migrated from one VM to another successfully. Since the test case is very
> > simple which just maps one page with MTE enabled and does some memory
> > access, so I can't say it's OK for other cases.
>
> That's great progress.
>
> >
> > BTW, I noticed that you have sent out patch set v6 which mentions that mapping
> > all the guest memory with PROT_MTE was not feasible. So what's the plan for the
> > next step? Will new KVM APIs which can facilitate the tag store and recover be
> > available?
>
> I'm currently rebasing on top of the KASAN MTE patch series. My plan for
> now is to switch back to not requiring the VMM to supply PROT_MTE (so
> KVM 'upgrades' the pages as necessary) and I'll add an RFC patch on the
> end of the series to add an KVM API for doing bulk read/write of tags.
> That way the VMM can map guest memory without PROT_MTE (so device 'DMA'
> accesses will be unchecked), and use the new API for migration.
>

Great! Will have a try with the new API in my POC!

> Thanks,
>
> Steve

