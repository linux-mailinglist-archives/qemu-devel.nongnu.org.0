Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6127B4086BC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 10:33:22 +0200 (CEST)
Received: from localhost ([::1]:37106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPhOz-0008Jb-ES
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 04:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhL2-0005wb-Ri
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:29:17 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhL1-0004sm-5D
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:29:16 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so6281536wmq.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=trkgFeu9aw3945fOmebUQtlhpJpxYaGNdUlxA7kRajo=;
 b=Pr0lZEZKteGK97d/XFJSUXsXb2DZB0znjB3nGFyyTJiitil+wwEJHinhVIiQqHUEbF
 68JBHzJr8E4+8EplZF7zBVTeRo5ccyW6YgxflU470dFJzd27gLMUhF3LqqHzmKtzyPla
 p/euHWhDm6rBKudUqFEp+qSwTKZoTgn7Gq3RcnS1H0traDBb8Dp1iSKd32qsnLHkFSTr
 RQ9k1SIf4v10/nCyWUKyyf2WxswfmUWWaKH8jKG6aLQkQelYh0kUiJ8AXAVDNOMUAT1p
 1lvbs+dAbFaSkNpImhcTKc8H4fwJ9q+LZMAuPeRAbPsZUF9qj28MogxJgGt6V1bzXw0F
 +f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=trkgFeu9aw3945fOmebUQtlhpJpxYaGNdUlxA7kRajo=;
 b=EWnUqHJgXjg3e35aWP0CFHENF17RkUHtp0C+48l8R3SHFEJKuPqmbS8vTDu5LItujX
 yH2wg5MGT1/GtwxO8/m7v7iirXrxwdU4Pu1g7K/8RuIhlU+lV6nBfkQYF4FfaXBexSf8
 LiCsaZ1se9TYh3bsdazCsSryagG991Qnz4Ea9ifSYRYdfvvB6+VhxUn2A367P1JhOIW2
 rQASzAV0jtBTkFUgVhLroWY2AuMieDAyw9oady30TyE7Z3Ojv7sl1PRauFkZQVrtZlGi
 4qnBk4jbicjFkqF5eM0SB/Bhhes8HwON5Nql+Jxjpi9YrFykKDUMkgpdJPYYt1tECXla
 VCcQ==
X-Gm-Message-State: AOAM531X9otPI2+roZ+epzB6w1SWbOJtpcShG1wgjNMS33NQiUeU/a0Z
 o7wF+TOOUaXMZCBaFxeJC81iTcvv2ToWpqZAmB6wLw==
X-Google-Smtp-Source: ABdhPJwjDwyUme/X5ywXTFDJznEdtkicBsDcfPoCvp5r5QgM6kminFPsfkFlYtQEF84WGnVcPEpBCsiXYYQ3J3txKDw=
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr9899133wmq.21.1631521753318; 
 Mon, 13 Sep 2021 01:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-16-agraf@csgraf.de>
 <CAFEAcA9S619pfhfEXUxGQkjBBKahOYm14jpxEam2CQTtC1dRTQ@mail.gmail.com>
 <45519c63-06b1-1e06-032d-87d2e1338fd8@csgraf.de>
In-Reply-To: <45519c63-06b1-1e06-032d-87d2e1338fd8@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 09:28:22 +0100
Message-ID: <CAFEAcA_vC0beH4NMRP4hHK0drc6PZt073ZVZM=Majnfngkn_xQ@mail.gmail.com>
Subject: Re: [PATCH v8 15/19] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 12 Sept 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 15.06.21 12:56, Peter Maydell wrote:
> > On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
> >> Now that we have working system register sync, we push more target CPU
> >> properties into the virtual machine. That might be useful in some
> >> situations, but is not the typical case that users want.
> >>
> >> So let's add a -cpu host option that allows them to explicitly pass all
> >> CPU capabilities of their host CPU into the guest.
> >>
> >> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> >> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> >>
> >> ---
> >>
> >> v6 -> v7:
> >>
> >>   - Move function define to own header
> >>   - Do not propagate SVE features for HVF
> >>   - Remove stray whitespace change
> >>   - Verify that EL0 and EL1 do not allow AArch32 mode
> >>   - Only probe host CPU features once
> >> +static void hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >> +{
> >> +    ARMISARegisters host_isar;
> > Can you zero-initialize this (with "= { }"), please? That way we
> > know we have zeroes in the aarch32 ID fields rather than random junk later...
> >
> >> +    const struct isar_regs {
> >> +        int reg;
> >> +        uint64_t *val;
> >> +    } regs[] = {
> >> +        { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.id_aa64pfr0 },
> >> +        { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.id_aa64pfr1 },
> >> +        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
> >> +        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
> >> +        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
> >> +        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
> >> +        { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
> >> +        { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
> >> +        { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.id_aa64mmfr2 },
> >> +    };
> >> +    hv_vcpu_t fd;
> >> +    hv_vcpu_exit_t *exit;
> >> +    int i;
> >> +
> >> +    ahcf->dtb_compatible = "arm,arm-v8";
> >> +    ahcf->features = (1ULL << ARM_FEATURE_V8) |
> >> +                     (1ULL << ARM_FEATURE_NEON) |
> >> +                     (1ULL << ARM_FEATURE_AARCH64) |
> >> +                     (1ULL << ARM_FEATURE_PMU) |
> >> +                     (1ULL << ARM_FEATURE_GENERIC_TIMER);
> >> +
> >> +    /* We set up a small vcpu to extract host registers */
> >> +
> >> +    assert_hvf_ok(hv_vcpu_create(&fd, &exit, NULL));
> >> +    for (i = 0; i < ARRAY_SIZE(regs); i++) {
> >> +        assert_hvf_ok(hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val));
> >> +    }
> >> +    assert_hvf_ok(hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &ahcf->midr));
> >> +    assert_hvf_ok(hv_vcpu_destroy(fd));
> >> +
> >> +    ahcf->isar = host_isar;
> >> +    ahcf->reset_sctlr = 0x00c50078;
> > Why this value in particular? Could we just ask the scratch HVF CPU
> > for the value of SCTLR_EL1 rather than hardcoding something?
>
>
> The fresh scratch hvf CPU has 0 as SCTLR.

Yuck. That's pretty unhelpful of hvf, since it's not an
architecturally valid thing for a freshly reset EL1-only
CPU to have as its SCTLR (some bits are supposed to be RES1
or reset-to-1). In that case we do need to set this to a known
value here, I guess -- but we should have a comment explaining
why we do it and what bits we're setting.

> >> +    /* Make sure we don't advertise AArch32 support for EL0/EL1 */
> >> +    g_assert((host_isar.id_aa64pfr0 & 0xff) == 0x11);
> > This shouldn't really be an assert, I think. error_report() something
> > and return false, and then arm_cpu_realizefn() will fail, which should
> > cause us to exit.
>
>
> I don't follow. We're filling in the -cpu host CPU template here. There
> is no error path anywhere we could take.

Look at how the kvm_arm_get_host_cpu_features() error handling works:
it returns a bool. The caller (kvm_arm_set_cpu_features_from_host())
checks the return value, and if the function failed it sets
the cpu->host_cpu_probe_failed flag, which then results in realize
failing. (You'll want to update the arm_cpu_realizefn to allow hvf
as well as kvm for that error message.)

> This is a case that on today's systems can't happen - M1 does not
> support AArch32 anywhere. So that assert could only ever hit if you run
> macOS on non-Apple hardware (in which case I doubt hvf works as
> intended) or if a new Apple CPU starts supporting AArch32 (again, very
> unlikely).
>
> So overall, I think the assert here is not too bad :)

Well, probably not, but you need the error handling path
anyway for the boring case of "oops, this syscall failed".

-- PMM

