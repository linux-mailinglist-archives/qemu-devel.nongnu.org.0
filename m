Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A805E40B436
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:09:18 +0200 (CEST)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQAzl-0000br-QU
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mQAoa-0000Yv-SB
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:57:46 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:40696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mQAoZ-0007MK-5s
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:57:44 -0400
Received: by mail-qt1-x82f.google.com with SMTP id c19so11875109qte.7
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 08:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A0mY3ZlodGBhMm7U/q2lrq3niN1WZAvU+Kkky+/Nb58=;
 b=dWV648Nc6ZfNp1wpE3EmEIYrGt45p2FkUDU2jvKC2ZVJm3E1A1eaCloQr9lb/WFnB1
 G/csErP0FKYBML7ZpYpySjl//grHxverHxMWgt5dGXTzAxOOwRsow08cut3fzNjlgvLD
 S6M1Gl2P/r4vHwmUyXvQIe0KDs+2Bw70JrMJW2/WGA7fmJ/LfsSQQj4e+AcMRy00d4sN
 Q4qyGk3dUV3v5YutkiRqgdd4T9LbNT7Zf535Js9o4QQ+p5D97Yzfs1QO/LKSc8mLQJqi
 10i/kmqaRhXWoUoCEEnkFL14i7t2tJCjbPRV7iDZBnqf6094YIl3e3KyqEgqfY+ipdb7
 VwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A0mY3ZlodGBhMm7U/q2lrq3niN1WZAvU+Kkky+/Nb58=;
 b=X7PmsyX2aASQexDajGDYuaay/wTx9io21GZHsfWCWniBKoslpzdQn8yrWE11xnZ4Sg
 ar6bbZfiB3e27Gtz6HHhMXlSeoSaiGYseawhwdTwpqKUZMqTlBECZ35R+m1hk5ESIzwH
 Xm7lxdBvlewoANIx0wXiU0L/kije2DMl9PDaEdN+B6jNkmtSUS4LSScFKBPsMFL1JOBU
 ptW7ZFdicyAZN5ivXvEU4av4lfHB73J3t3DXBqkgeGr1j4KUHv7tgzEhaZeNVSFOA701
 9DmXg2F/TAx2gNvr+7OtzmlFaTb3jfFnxq7UARjNWGAeC22aaKf2AxIavk3vcH3MdP6j
 Dfvg==
X-Gm-Message-State: AOAM5337Vn5XBm/Aw9S4GymzZpsusi+p+HaucB7SunPCPDmtdpoz4Hnh
 UbkDHjQyXNLKVK5G9inu08yeFQ==
X-Google-Smtp-Source: ABdhPJyLU72vUpUFTLimMOfQF4CVxZ3Liq1CG7S4vHLBJZBPFlAcOES7cPaJEpjbwxzcQXhJRoWf8Q==
X-Received: by 2002:ac8:5417:: with SMTP id b23mr5685779qtq.140.1631635060118; 
 Tue, 14 Sep 2021 08:57:40 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id s16sm6155855qtq.31.2021.09.14.08.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 08:57:39 -0700 (PDT)
Message-ID: <b73156aeb1817ee46e79f73abd2ac22326c3a07b.camel@linaro.org>
Subject: Re: SMMU Stage 2 translation in QEMU
From: shashi.mallela@linaro.org
To: eric.auger@redhat.com, Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 11:57:38 -0400
In-Reply-To: <f788c9de-17be-025a-a723-c7ba86548970@redhat.com>
References: <bac0b38fc7c5f7a5a1c91784eb7236de39b6f18a.camel@linaro.org>
 <CAFEAcA-k8=M5KQWoJ=yurAZuHt9=F9mb002Z=7T_EC6x5EP95w@mail.gmail.com>
 <909bcf70ba8d88d485ec0b36371633e54edef81c.camel@linaro.org>
 <CAFEAcA8=7-hHEHyABS-FFPtacYvhFpwa7_PLVsC7-x_5rxjicg@mail.gmail.com>
 <e8ccd74e89ba9d30d8588f0aa6966dc71d0ae923.camel@linaro.org>
 <f788c9de-17be-025a-a723-c7ba86548970@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,
On Mon, 2021-09-13 at 10:19 +0200, Eric Auger wrote:
> Hi Shashi,
> 
> On 9/10/21 3:32 PM, shashi.mallela@linaro.org wrote:
> > So that would be the driver code running in guest OS because i see
> > tables being setup by arm-smmu driver code in linux,which is
> > similar to
> > what happens with ITS(table base addresses programmed in registers
> > by
> > linux driver).
> Stage2 SMMU tables are generally not used today. Only stage 1 is
> used,
> even with VFIO (with KVM).
The stage 2 SMMU capability is required for qemu sbsa reference
platform to satisfy the sbsa level 3 acs(arm compliance suite)
requirements.

> SMMUv3 upstream driver does not support S1+S2 (nested). It only
> supports
> either S1 or S2. Enabling S2 can be done through VFIO driver, if you
> select the VFIO_TYPE1_NESTING_IOMMU IOMMU type. This then calls IOMMU
> .enable_nesting  = arm_smmu_enable_nesting which sets smmu_domain-
> >stage
> = ARM_SMMU_DOMAIN_NESTED. But the name is misleading as it actually
> forces the use of S2 instead of S1.
> 
> However if you look at QEMU VFIO code, no one uses
> VFIO_TYPE1_NESTING_IOMMU.
Since the current smmuv3 implementation in qemu advertises only stage 1
support,from the qemu device point of view is the stage 2 support
included in the integration effort you mentioned or does it need to be
taken up from scratch?
> 
> Note I have worked on 2 stage integration for years, without much
> success yet:
> [RFC v9 00/29] vSMMUv3/pSMMUv3 2 stage VFIO integration
> 
> [PATCH v15 00/12] SMMUv3 Nested Stage Setup (IOMMU part)
> [PATCH v13 00/13] SMMUv3 Nested Stage Setup (VFIO part)
> 
> 
> Thanks
> 
> Eric
> > On Fri, 2021-09-10 at 13:54 +0100, Peter Maydell wrote:
> > > On Fri, 10 Sept 2021 at 13:39, <shashi.mallela@linaro.org> wrote:
> > > > I am referring to the latter,"purely emulated QEMU with an
> > > > emulated
> > > > SMMU that handles accesses to emulated devices"
> > > In that case, the stage 2 tables are set up by the guest
> > > code (running at emulated EL2), just as they would be if
> > > it were running on real hardware.
> > > 
> > > -- PMM


