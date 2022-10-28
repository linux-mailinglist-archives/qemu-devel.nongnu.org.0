Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446936119E1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 20:08:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooTlQ-00009g-9h; Fri, 28 Oct 2022 14:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooTke-0008Iw-N8
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 14:06:43 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooTkc-0000GT-UH
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 14:06:40 -0400
Received: by mail-pl1-x636.google.com with SMTP id y4so5516391plb.2
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 11:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cgiUie0XsNZhwdSCJ1tdnJfUfdSXLnzs8dTzYxI7w/I=;
 b=J3XcgdDONEI/ueXBwVa8m0c+iFA12v5zd9NzRIDOBWBuZ/fMOn4cTdl+9mGcMEGPJo
 y8PM7aY2ShVxKatBGEt8oC7uy3+ZpXTtM76dU9SdTqFxRyQN00+xQyuYGlYs0KiflPsr
 fOEfogDcqDNSSlecT/y6byUT7WC+kQB0qOi+uSsxULubK+o+kiXk3Qtt0uf21HLjD3T9
 G3BWbtLbzBMevz7bS4v8yEuPpcuI+fThUu/3p4j6syFFErn2nAWqW5cYFGSnnZ7kyFBp
 XDbRumeXIvL4Wn0IaYI9p9NYzUd0yFic4Xb26fYJKj9mLwfQRthZFhXMW+zQPuLe0Mzw
 AHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cgiUie0XsNZhwdSCJ1tdnJfUfdSXLnzs8dTzYxI7w/I=;
 b=FpmiTBVwhZwsy2gkHf01aM7Lcu5mFakV7/HMbpWWdzfQQ7hOHIFHz7KV62awIaP4rg
 /xvmMbs2iC21QNeq1c9CLrLBPRLHySJ/zrWb4FR5gOMoGHpVyZZ2gCutbOImVOwnFItL
 ObdU4HiUQjWY8HLsYcAxMyPf33JFpbIbtXXhrrRuQ4SJ1WPDbNMzInl3wFQqWj86OYRu
 Y8HjsdUURVTO56SUEogDAKIzlzrM6q0JuQRdyuOE/skVKGObAw2v5qPVjtPRrSY1APdX
 EcvB/lKFdj03lwkOqGbSPem2O84y9FimARlmTP3cA0qj3ieaV9VgqpDqDEGOLZT7oP7N
 95+g==
X-Gm-Message-State: ACrzQf1BUCFVGr0J1S2xOTNtItkZg0zKDzFLmJUOp+bgniGr3+Mp0+7/
 2FMqugOgfI7J5PHGXBFDGRG7jZfnkoGJHtrTEtH49w==
X-Google-Smtp-Source: AMsMyM7zJpMKvufRhKCVSM+fcqz7JVeTNgK0sXM85aYNrN/gipUI/AuElLmwazlwup6qu92WBpcxPZRp+kjuk1JwXWA=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr203995pll.19.1666980397125; Fri, 28 Oct
 2022 11:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221024035416.34068-1-gshan@redhat.com>
 <fcf82677-dd16-82db-c502-a8baf35192f3@redhat.com>
In-Reply-To: <fcf82677-dd16-82db-c502-a8baf35192f3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Oct 2022 19:06:25 +0100
Message-ID: <CAFEAcA_XVOKS1mDwAMMiUeeo8CeeO-GCXmXECAJTP7Ys79bnAQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] hw/arm/virt: Improve address assignment for high
 memory regions
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, maz@kernel.org, 
 eric.auger@redhat.com, cohuck@redhat.com, zhenyzha@redhat.com, 
 richard.henderson@linaro.org, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 26 Oct 2022 at 01:30, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Peter and Marc,
>
> On 10/24/22 11:54 AM, Gavin Shan wrote:
> > There are three high memory regions, which are VIRT_HIGH_REDIST2,
> > VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> > are floating on highest RAM address. However, they can be disabled
> > in several cases.

> Could you help to take a look when getting a chance? I think Connie and
> Eric are close to complete the reviews, but v7 is still needed to address
> extra comments from them. I hope to make v7 mergeable if possible :)

If Eric and Connie and Marc are happy with it then I don't have
any further issues on top of that.

NB that since softfreeze is next Tuesday, this is going to be
8.0 material at this point, I'm afraid :-( (Softfreeze caught
me by surprise this cycle...)

-- PMM

