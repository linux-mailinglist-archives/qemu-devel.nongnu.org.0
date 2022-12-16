Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C01F64EE0D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:43:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Cqg-0003mL-9g; Fri, 16 Dec 2022 10:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6Cqd-0003lV-27
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:42:07 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6Cqb-0006O1-3B
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:42:06 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so2715220pjj.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 07:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5PhRlO7aTerKKYnPH7f7hzlS2UXHz8ikzoKeblr1SPM=;
 b=by5U7k9d6Ojfo5Nz40j7eBk5t/6HaLBWvEYw6uFAJ5xZBtQx5NMTg9K9QEdhY80ye7
 29k1eFgi6R6EF0H39rwGBEvLn290pa4uDlM9yUEyyBcQN1ShQ6vfUWEJ/gmMxmrWgEAT
 XlYOt9jXhzACETr/H8QGP3lQ6NMiCsRKPz/x3Lk6bo1a0/gFuN2HDx8K0IKqhsZzilrm
 /MKvDj/NCBCpEKFIB6zahYavVrfWfxIW46pov6kTL+AEpkV2snBYJQ3gJmfk8aXl3/Aq
 nwSPf5iO9fwe0SCEqCysjpJD8n3nd8yIrslKWTliUOPrKz/893bum3lFfON5KrFZjteZ
 FkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5PhRlO7aTerKKYnPH7f7hzlS2UXHz8ikzoKeblr1SPM=;
 b=FL/tbWL9S7zMtxNuGzk8WezDmoW0CSb2H2ICdLeiNFUuJQbTrT6HFoR5fXkJyiiUv+
 7pRLUlhHbEwKaPRHOMOe2tEbYwJhrn02ByErd+fsffjcalHw4oRdK2wN7LwcKKvAB38o
 3iu0ZxKdLCDEYCDy5l5zLb6hJz7MQ8WDOVAqa4CE991tieJJtuds/q5QvqbnL9o7d40h
 //0YDELH6gPm8+xY+F3YGjEEP60XGpYmWo28dzO8W9eEnmlJ56N5G4XHczygNejerXWQ
 +O3oqtT24V/e92yxn21s8ZE4LUsQOo44rZwfVZQUTWlEVvcSyjgD2jcMAQ7k0tCGBZAU
 U07A==
X-Gm-Message-State: ANoB5pk849tJtjkRP6RKOdDz/EBLmrs6gsVgDXhdsQBUbGBZkrtkVigS
 ndmL1PdZFMrfP6sICQtzP7/gtDMec2jgdSZQnjECTQ==
X-Google-Smtp-Source: AA0mqf4hh61TKxSp7ElBjQ24q6uUIZs8mAqWg4JMmQxl/WhTBxSwI9xgEhoub7zWH5IXt8rArGD9AjAP/qhQfmEi5+k=
X-Received: by 2002:a17:903:2053:b0:189:cdc8:7261 with SMTP id
 q19-20020a170903205300b00189cdc87261mr23714045pla.168.1671205323533; Fri, 16
 Dec 2022 07:42:03 -0800 (PST)
MIME-Version: 1.0
References: <DS7PR12MB6309BC9133877BCC6FC419FEAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
 <CAFEAcA_A45cj8RA03U0jOfawZihSp6WgSoaQ7XbGzxs0hAtkOg@mail.gmail.com>
In-Reply-To: <CAFEAcA_A45cj8RA03U0jOfawZihSp6WgSoaQ7XbGzxs0hAtkOg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 15:41:52 +0000
Message-ID: <CAFEAcA-dJA7NSR2jN2wy9JM+znoqigZAsV0w=KpSJ_MPEk1LfQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: align exposed ID registers with Linux
To: Zhuojia Shen <chaosdefinition@hotmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 1 Dec 2022 at 16:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 22 Nov 2022 at 23:25, Zhuojia Shen <chaosdefinition@hotmail.com> wrote:
> >
> > In CPUID registers exposed to userspace, some registers were missing
> > and some fields were not exposed.  This patch aligns exposed ID
> > registers and their fields with what the upstream kernel currently
> > exposes.
>
> Thanks; I've applied this to the target-arm-for-8.0 branch that
> will become target-arm.next when 7.2 is out.

Hi; unfortunately I had to drop this patch because it causes the
'sysregs' test case in 'make check-tcg' to fail.

Once you've built the test cases once, you can run the single
test with something like:
 $ ./build/arm-clang/qemu-aarch64
build/arm-clang/tests/tcg/aarch64-linux-user/sysregs
which then will give you the output.

It looks like the test is hard-coded to check that an expected
set of fields is exposed, so it should be straightforward to
update to match what we now intend to provide to the guest.
Would you mind respinning this patch to include the update to
the test case tests/tcg/aarch64/sysregs.c ?

Checking Counter registers
ctr_el0             : 0x0000000080038003
cntvct_el0          : 0x0173150270b0beff
cntfrq_el0          : 0x0000000003b9aca0
Checking CPUID registers
id_aa64isar0_el1    : 0x1021111110212120
  !!extra bits!!    : 0x1000000000000000
id_aa64isar1_el1    : 0x0011101101211012
  !!extra bits!!    : 0x0011100100000000
id_aa64mmfr0_el1    : 0xffffffffff000000
  !!extra bits!!    : 0xffffffff00000000
id_aa64pfr0_el1     : 0x0001000100110011
id_aa64pfr1_el1     : 0x0000000001000321
  !!extra bits!!    : 0x0000000001000301
id_aa64dfr0_el1     : 0x0000000000000006
id_aa64zfr0_el1     : 0x0110110100110021 (not RAZ!)
midr_el1            : 0x00000000000f0510
mpidr_el1           : 0x0000000080000000
Remaining registers should fail
id_mmfr0_el1        : 0x00000000deadbeef
id_mmfr1_el1        : 0x00000000deadbeef
id_mmfr2_el1        : 0x00000000deadbeef
id_mmfr3_el1        : 0x00000000deadbeef
mvfr0_el1           : 0x00000000deadbeef
mvfr1_el1           : 0x00000000deadbeef
Extra information leaked to user-space!

thanks
-- PMM

