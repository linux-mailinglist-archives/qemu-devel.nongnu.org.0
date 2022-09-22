Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948A65E6B47
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:54:01 +0200 (CEST)
Received: from localhost ([::1]:34540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obRKi-0001zG-FA
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmattson@google.com>)
 id 1obPlr-0000lp-6k
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 13:13:58 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:43951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jmattson@google.com>)
 id 1obPlp-0004mx-GO
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 13:13:54 -0400
Received: by mail-oi1-x22f.google.com with SMTP id t62so13172854oie.10
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 10:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=rNzmkCAkz9tFhn4H0q5z3OX9gHed8gkTeWIRslHRKi8=;
 b=eg7YwipskwomOZ9AXcRZMtc37FQslIhUMUwbC4Y/cdM1wkPb8wvqonqRdWa/LPrJyj
 lhqKP67hGxVHQmSio+WRXNkmKkwzlLLSVo1Ndw8w7aaS0xExVsM5Rp3DUGy0ZLmFBWTe
 83ngg7MErjW2R6mSsyZ3vYIkFiHGRiXl6LBvnPn5bTPc7o+qhkzhA2hEqQXcrB3zxq+3
 o3mBEAtNjlrfmfDO6Ll48Y0LexHnMmr3sc9xCkX9kMSp4kbZA62qX5XM9C9/NkNMoIMI
 24wJa7qNPoo7qF+gyYRNC9BhpL5SLkNWmSvtcD55h8pCSKbjYkrOAyqjJj7cRTgg72g0
 cIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=rNzmkCAkz9tFhn4H0q5z3OX9gHed8gkTeWIRslHRKi8=;
 b=jj2u+iFNLdT4hWYDHrAWWOV5rXZ6vr88yvU41jRRgCxhYO/QgtwHAA0la2zDTRkiil
 SEzDZUUr7paEkaS0WdvrfHWQZ3jTAHFvFh2HqczyogtyazXbhMlepw+RjLbOX6UEAtOd
 ojD4O3PWUGjXL778CQ8jOCUVwNr61YT7nRYSLlShn5SyDItF5Ixl/QWS1Zc8ER7mAcw8
 0LCS3/nTsK+wYbLkM+2YbFWKr+VDOjFk9q7HFKcu1pyrkqVlsK8qWYcm6Q5UXy8DlMft
 W9Y1hw8KFAr6ZypDSrdcbhBbLS9vmi+LHlUt5T4Nc8sS/DQq9fKfHUq6WQyyv8224t3k
 UDLw==
X-Gm-Message-State: ACrzQf2Lh8VwZ/qg+d1Vwcf+HRyAzIheOmn73G8Z/Ewt11hEz25PABU3
 DZ3XSTDabnqPxjcp/jsAUWU9wGMak2Hv+7OTrbXHpQ==
X-Google-Smtp-Source: AMsMyM640/S01tysX4SbmLMJDMNaPV1ARbxOj0vReuk56z1cCCPujuFJSpE1JpiFZK9iwL2kUwe8+e786QsesLP2C00=
X-Received: by 2002:aca:a8d0:0:b0:34f:7065:84b8 with SMTP id
 r199-20020acaa8d0000000b0034f706584b8mr6943223oie.13.1663866829568; Thu, 22
 Sep 2022 10:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220922101454.1069462-1-kraxel@redhat.com>
 <YyxF2TNwnXaefT6u@redhat.com>
 <20220922122058.vesh352623uaon6e@sirius.home.kraxel.org>
 <CABgObfavcPLUbMzaLQS2Rj2=r5eAhuBuKdiHQ4wJGfgPm_=XsQ@mail.gmail.com>
 <20220922141633.t2dk2jviw2f3i26x@sirius.home.kraxel.org>
In-Reply-To: <20220922141633.t2dk2jviw2f3i26x@sirius.home.kraxel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 22 Sep 2022 10:13:38 -0700
Message-ID: <CALMp9eSEDEit0PEAt_qUwGhBRBPZNsyjasiuJhcrFKT9Zm4K=A@mail.gmail.com>
Subject: Re: [PATCH v4] x86: add etc/phys-bits fw_cfg file
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org, 
 Marcelo Tosatti <mtosatti@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=jmattson@google.com; helo=mail-oi1-x22f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 7:16 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, Sep 22, 2022 at 02:38:02PM +0200, Paolo Bonzini wrote:
> > On Thu, Sep 22, 2022 at 2:21 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > No.  This will basically inform the guest that host-phys-bits has been
> > > enabled (and pass the number of bits).  So the firmware can make use of
> > > the available address space instead of trying to be as conservative as
> > > possible to avoid going beyond the (unknown) limit.
> >
> > Intel processors that are not extremely old have host-phys-bits equal
> > to 39, 46 or 52. Older processors that had 36, in all likelihood,
> > didn't have IOMMUs (so no big 64-bit BARs).
>
> Well, I happen to have a intel box with 36 physbits + iommu.
>
> > 1) set host-phys-bits to true on new machine types when not using TCG
> > (i.e. KVM / HVF / WHPX)
>
> That is probably a good idea, but an independent problem.
>
> Has live migration problems (when hosts have different phys bits),
> which is IIRC the reason this hasn't happen yet.  Maybe that is solved
> meanwhile the one way or another, I've seen some phys-bits changes in
> libvirt recently ...
>
> > 2) in the firmware treat 40 as if it were 39, to support old machine
> > types?
>
> The background of all this is that devices need more and more memory,
> and the very conservative edk2 defaults are becoming increasingly
> problematic.  So what I want do is scale things up with the address
> space size.  Use 1/4 or 1/8 of the physical address space as 64bit
> pci mmio window.  Likewise scale up the default pcie root port window
> sizes, to have more room for hotplug.
>
> For that to work the firmware obviously needs to know how much it
> actually has, which is not the case.
>
> Yes, the problematic cases are intel machines with 36 or 39.
>
> Treating 40 as if it were 39 will explode with 36 cpus.
>
> Treating 40 as if it were 36 will mostly work.  Will leave a big
> chunk of address space unused.  Will cause regressions on guests
> with > 32G of RAM.
>
> Treating 40 as invalid and continue to use the current conservative
> heuristic, otherwise treat phys-bits as valid might work.  Obvious
> corner case is that it'll not catch broken manual configurations
> (host-phys-bits=off,phys-bits=<larger-than-host>), only the broken
> default.  Not sure how much of a problem that is in practice, maybe
> it isn't.
>
> I think I still prefer to explicitly communicate a reliable phys-bits
> value to the guest somehow.

On x86 hardware, KVM is incapable of emulating a guest physical width
that differs from the host physical width. There isn't support in the
hardware for it.

