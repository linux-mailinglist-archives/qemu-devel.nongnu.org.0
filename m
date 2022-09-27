Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9715EC3E4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:13:15 +0200 (CEST)
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAOf-0005ue-Sr
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8u1-0007bo-IC
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:37:33 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8u0-0004HC-0f
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:37:29 -0400
Received: by mail-ej1-x62c.google.com with SMTP id lh5so20027476ejb.10
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=rXZ/T2r4VDqAOXswZFfDoDu++VxaTSoXzEtp0/J9a28=;
 b=zT57unUn7n0g+wBFL2mR0fELsm/UYJ3VosnZwcmxwKnIrWR/zSoXJCz35o89CXb80p
 jchKcBixQkjcvM7MDePLYUNW326l018WHzXXDCVtRdAWujdKgetZ4FCXXKWEipg//WTb
 xfQNDkDUI7Nofi84tqFs6ed3zsFJWfu9fmRHv06+qDKmn8DnLaoTwMJNsj2xQVml5f4B
 VewwDZKvVMQGpHgtSQdFFL/3WmG9xFh3Sz+9FD6/Rmj30oYjJMR053zHM+AFiX7R4qG1
 9oRnN75xPjRFGRHYCqgSLbT698/qhNTa1NdGwZqxT+Y+17mffo16hyRHY9L1+mRbOg5m
 ixwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=rXZ/T2r4VDqAOXswZFfDoDu++VxaTSoXzEtp0/J9a28=;
 b=h801YZRQ8Jfu7LA8rBR1RozEA6cLjERXgWGXPV16qhb8njaSrXSK9laiC13RJMvxGb
 Xa3lB69W5YgAiGQ/nvofA+SRp8yIAOSvXT27a5FfkBs/aXHzlOpS81p0XGpb6WDGp9E3
 fF3DfD/GLqa2n5xpa2MgPWyeq6G8QrfjLPPfaMGzaJy1vztJsFdSWudeXHI3O0AL4FoM
 VKVrcMLw9JlRERpdlYuNjI06jLQYuJGZPksFpwQWJPmgwzBzKz1pa0AMJeCQa9X9u083
 sIG+ei+l7QxgcWWhv8qscXjo+QJlQFkfaqA0R22zOle9ABEPtQSsC0Mjm4wMosTdBGS9
 SE2Q==
X-Gm-Message-State: ACrzQf04jrBFKjC5tCQ2TySd/JUbaZzUV7B8WvX4JGkmUQ2OTUFeFj7u
 GDlLD1Dxldg79uA3A/O5VpYX/eqsDpSlIu+/pcNirA==
X-Google-Smtp-Source: AMsMyM7laqnzLW4KJKl6re42thQ2Yx0qKONYe4lhQKG37W36JTw7UYw/5T6AwYRhz415b848UlbvW5CPbuiCOZySsW0=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr21927063ejc.365.1664278646367; Tue, 27
 Sep 2022 04:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-7-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-7-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 12:37:15 +0100
Message-ID: <CAFEAcA-cbe23jaG4BW8+5EAkVdPZJj8QpeXpaEckLu_JwS5Tpg@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] hw/arm/virt: Fix devicetree warning about the SMMU
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The SMMUv3 node isn't expected to have clock properties. Fix the
> corresponding dt-validate warning:
>
>   smmuv3@9050000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
>   From schema: linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/virt.c | 2 --
>  1 file changed, 2 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

