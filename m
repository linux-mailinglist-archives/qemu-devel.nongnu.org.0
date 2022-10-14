Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE7A5FF375
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 20:14:04 +0200 (CEST)
Received: from localhost ([::1]:35700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojPC7-0005i1-WF
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 14:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojP8I-0001ML-QW
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:10:07 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojP84-0004I3-5g
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:10:06 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 t12-20020a17090a3b4c00b0020b04251529so5434012pjf.5
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5ZvFMqfrgF41x4VjPAZ5hsY8jpRwoneASmxanG1vGS0=;
 b=J78WzcJrI1hIQTPbFC3zD4xOn33AUiui0bZ1soK8co0CHhWEETBNnWsCKNJBqA/Bu9
 DeufTeoNIM95bA86KPvjEzNpFi0aHJA5UHY0l8adCmjD1D3zwVAFmlzVHGuvugmhxV/K
 qrsmWImC6B2JgnsEeZ2CNps0vuPHHGRPICc+864Zhj9iihSAMya8WE3+vZdoQb0ApJxr
 Ccc93gpkdyvQPmV9CqM2Uv2OMZg/3UbEIC6kT8RYUfk5Vpg0V2Dv70dvSYw69qAcR2jO
 AEcLsFLlIfbAEnYxSXs8hKbRjliN1bbLgtZPJwewktBrWZAH11yDZyF0KDgO1lV/tZ9P
 LbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ZvFMqfrgF41x4VjPAZ5hsY8jpRwoneASmxanG1vGS0=;
 b=kQsKZVGTGrJejjqy5Wk+eEBXMKxq0IQPvluSPm/qCOTBLZ+Wp1QQ1Q6gLXOeJaFL7e
 VBW7cyFYvU0K9Nou19yRZGKy87Yn9APMK3DQW/jZoDQ0iqFJYKMIFWah9Svdi27TV6wZ
 7CdDJ+/vEF4WYZCdyVyHtd+MeWFvhr4F1yfC5P52YikLX6CHDzJAhX+Z+oUBoupMbD72
 gcx+2oqWQarp4PeRaic5DxBxWA8NtuCOQOPal1NQgPm6rOVe1J8djyxwMMuiYxtA46jm
 U1EgMLjzZsXM1P/T/dN6z+nxRgHYZ7AgwInIwDuvNVX5CtkRGa79ZXvMGQXuhPIbMu8X
 8GGg==
X-Gm-Message-State: ACrzQf0UE8nhgDQyxEJWU4BT2b2J/liKEfEgHD23YAU2W3w2U/ueV+nA
 ueLyu64gKt02VFOK0nKUFxKx09rbfS2Vf0fyZDxjUQ==
X-Google-Smtp-Source: AMsMyM4f0Ic5YdYE9E3JaTLjEr09IBqzdXIATkBQFtmI1oXD9CIHl8fjn41p+JmwJ2WMvyq5FfetgbLDTjhvnBiMyYI=
X-Received: by 2002:a17:90a:fe92:b0:20a:daaf:75ea with SMTP id
 co18-20020a17090afe9200b0020adaaf75eamr18094454pjb.221.1665770990616; Fri, 14
 Oct 2022 11:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
 <20221011031911.2408754-6-richard.henderson@linaro.org>
In-Reply-To: <20221011031911.2408754-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2022 19:09:39 +0100
Message-ID: <CAFEAcA_xq2_Poco1++6BNOfnDZirrsXyB5mfauETD_8CUL2SNw@mail.gmail.com>
Subject: Re: [PATCH v4 05/24] target/arm: Move ARMMMUIdx_Stage2 to a real tlb
 mmu_idx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 11 Oct 2022 at 04:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We had been marking this ARM_MMU_IDX_NOTLB, move it to a real tlb.
> Flush the tlb when invalidating stage 1+2 translations.  Re-use
> alle1_tlbmask() for other instances of EL1&0 + Stage2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v4: Implement the IPAS2 and RIPAS2 tlb flushing insns;
>     Reuse alle1_tlbmask to fix aa32 and vttbr flushing.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

