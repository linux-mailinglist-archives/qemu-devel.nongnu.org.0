Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B0B4AC084
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:06:27 +0100 (CET)
Received: from localhost ([::1]:33474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH4ew-0001o9-Ja
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:06:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH4Jc-0000Dm-Pz
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:44:24 -0500
Received: from [2a00:1450:4864:20::432] (port=36586
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH4Ja-000645-MQ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:44:24 -0500
Received: by mail-wr1-x432.google.com with SMTP id i15so2482292wrb.3
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 05:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sd7RW5xW5ASHrCH8lYA6A1bzj3dh8tftpaIEiRyJzPk=;
 b=vsNVSbshJ+bnEz8vYLK8ORK7CoOgi+9GG6Wc7ylTBTTs6lSE4xC7fGzJegPNCcKw94
 alCWF9LF8dwh/NY/YlUuhHhuE7P8RSkpYJuGpD+QIQI8kw5E3SgO6PA4p7S2eTUeZ09v
 MLEXs4ITA28EIcWJ8veguJOfWfJzfSB3F+4P6T0oGbtlP9KgTaR5YXBl9u0V4krphLt2
 yfy0JY/uBfnspr5hgKJPtYO29MVH505L4hH9R9OVqR6DCc2/qY+2mU+0jc4GqHJNNzsi
 033mVabWwD3RFZWLsFp63taVamsh/in8xgpyOJiWjYNZ3KSeywDfjL1TRb45wR2J1z0Q
 vZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sd7RW5xW5ASHrCH8lYA6A1bzj3dh8tftpaIEiRyJzPk=;
 b=U7Sfae0wx2XVM/7JssYz0bLPZdrg/B2EbmZ9QRO78Ovenk0aomKrTIvn0T8E5sTy+o
 dLwvx6F8Oe/63ANjrI7vUmn5hDlDIJUQcp8nZ+x8oVB/VWN2sASgBpuodYdrIoSpXYUx
 xFd6F89Y08qBgpH5EXsfUIcGyvRNq3YnDTrxfEY8rc0/hn4OR/33yOCmQagGW8YeMLhl
 z3qPBSaf2JCwtGLe81HZyjP9yHn++Z+XfygJoHJnszSoMG5L9bRLCefx2ZB036618Dhb
 HUGGlpyNK56Gz/NhlUkDiJyajvI9LKdSHTEgh1h63ko0Uj5iuVykVW2BcS8UpmUf1UZE
 /XTQ==
X-Gm-Message-State: AOAM530rbG8ttiNDH1DlN42eUZK60OPVu/+JUt+c3o46RF9SpbBLrPwY
 9igdYResd9vLssbSU8TXSwPREHCq8atcw2KRa/ybQg==
X-Google-Smtp-Source: ABdhPJxuaH7n9y+YGgB1cgLSIY2HOMH2zdy1/In3HMiGw0/5j4KW8pkZnPzhO4PBrQ03B95pvbJylMw2avhJSXgwa+s=
X-Received: by 2002:adf:a51b:: with SMTP id i27mr6544960wrb.172.1644241459314; 
 Mon, 07 Feb 2022 05:44:19 -0800 (PST)
MIME-Version: 1.0
References: <662aca02-da99-524f-d9df-cd61427ca520@ispras.ru>
In-Reply-To: <662aca02-da99-524f-d9df-cd61427ca520@ispras.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 13:44:08 +0000
Message-ID: <CAFEAcA_U1hgz55mGX7DZp36aOHGriU0wjr9Dvt4Y=f2EGNgF+A@mail.gmail.com>
Subject: Re: target/arm: cp15.dacr migration
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 at 12:13, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> wrote:
>
> I recently encountered a problem with cp15.dacr register.
> It has _s and _ns versions. During the migration only dacr_ns is
> saved/loaded.
> But both of the values are used in get_phys_addr_v5 and get_phys_addr_v6
> functions. Therefore VM behavior becomes incorrect after loading the
> vmstate.

Yes, we don't correctly save and restore the Secure banked
registers. This is a long standing bug (eg it is the
cause of https://gitlab.com/qemu-project/qemu/-/issues/467).
Almost nobody notices this, because almost nobody both runs
Secure-world AArch32 code and also tries migration or save/restore.

> I found that kvm_to_cpreg_id is responsible for disabling dacr_s
> migration, because it always selects ns variant.

> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index c6a4d50e82..d3ffef3640 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2510,11 +2510,6 @@ static inline uint32_t kvm_to_cpreg_id(uint64_t
> kvmid)
>           if ((kvmid & CP_REG_SIZE_MASK) == CP_REG_SIZE_U64) {
>               cpregid |= (1 << 15);
>           }
> -
> -        /* KVM is always non-secure so add the NS flag on AArch32 register
> -         * entries.
> -         */
> -         cpregid |= 1 << CP_REG_NS_SHIFT;
>       }
>       return cpregid;
>   }

This change is wrong, or at least incomplete -- as the comment notes,
a guest running under KVM is always NonSecure, so when KVM says "this is
DACR" (or whatever) it always means "this is the NS banked DACR".
(Though now AArch32 KVM support has been dropped we have some flexibility
to not necessarily use KVM register ID values that exactly match what
the kernel uses, if we need to do that.)
Also, kvm_to_cpreg_id() and cpreg_to_kvm_id() are supposed to be
inverses of each other -- at the moment they are not, hence
this bug, but I think your change has probably resulted in both
the S and the NS banked versions of each register being treated
as the S banked version, which will have a different set of problems.

There is also the question of migration compatibility to consider
in any change in this area.

thanks
-- PMM

