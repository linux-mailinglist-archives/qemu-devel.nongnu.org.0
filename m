Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49085BE455
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 13:23:27 +0200 (CEST)
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oabLa-0002k8-Ss
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 07:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaaLX-0001Ci-V3
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:19:19 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaaLW-0001i2-3P
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:19:19 -0400
Received: by mail-ed1-x532.google.com with SMTP id z13so3052453edb.13
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=UIpM85W6npQ9ioLX5EJVz7rpqXRfFAqBpz9oOBMQ2Xs=;
 b=cR2ojbScjcZijKBtd6oayNsKSN1ASEUJvoX+5rQ/TT/lUPddpYj81DtZzrEx4HfnCV
 vrW80v31f4H0X3nYNTOk4aZApxQkIwzlxZ4QLY+Hvct17PAssVD/hrP+lV0ERKwOZ1Zb
 +bO3qSn90CTdFEXrENtIv9K4oJd+BBTom9jlnKPVUeJYPlhKcTAXgB00CO9CxgIu1+7E
 dNbV6KjS9pO+tH8mKZILr85P20CJk7vy1ImL/dOV18VyYyG0VlsdAalY/JFwZNkTphtU
 nMBRHtuBlAwqZh4isLTpFGUaoWrC/BLS7lekvWbdzdGaNJc3V2lKe2pv/5x18uw3y0wG
 QWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=UIpM85W6npQ9ioLX5EJVz7rpqXRfFAqBpz9oOBMQ2Xs=;
 b=62wHgGPy1htVAeoDrhJLREnsGZVEXU23XzF+Hq9nmk/wPU5kMHSx7TNn4fKv36Czyq
 q8STEgW4rKtWKsUFnaqw+pizyMKl1cA0Y2I1aoTVtFyflvOYzwLWTJxjBawufyaY/g/s
 ILxTHZhGthFPEt98Ha36X7XK74RSjz20TEqso46D0F2pBtCqmB4Q0/yeV5+sL/ebbpzG
 H65qAx7iqhSnIBXpvPNAmZMIvM9KTcEfle1aowbIx6PVDQMXC50Rzem5f925WbM4oS6V
 vFJDDLVgzOnRGp6EvRFGLvJeYfuZKP4U92c3fumP5tinKyEBXoS7qn2j1neD5BTNYB1P
 BCig==
X-Gm-Message-State: ACrzQf2+0hhuiVEmtkDC04vX1uhIsl5GARW/btXh7C51TrkEZX2aiD3N
 WBCChDoP36ttEOR9Qs0y6zzqrYAAnywqSt5vhEXSrw==
X-Google-Smtp-Source: AMsMyM78nRbfS9o4F9XyPCju+7+dMklQnLU/1gWJx8gA50hMQ8Q2P3m74CDqtX9ZH30wBht1w1HtRvwi/x2Ck1GKM6M=
X-Received: by 2002:a05:6402:516f:b0:44e:9151:d54b with SMTP id
 d15-20020a056402516f00b0044e9151d54bmr19273351ede.241.1663669156270; Tue, 20
 Sep 2022 03:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220817141754.2105981-1-anton.kochkov@proton.me>
 <CAFEAcA-ii9vOLvtO_Yb4c90KaH8dENbgUEquiuqJPkQKd03D-g@mail.gmail.com>
In-Reply-To: <CAFEAcA-ii9vOLvtO_Yb4c90KaH8dENbgUEquiuqJPkQKd03D-g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 11:19:04 +0100
Message-ID: <CAFEAcA_ddWZX8-YPEOx8secLwBSyTcY7MskY_x42Z3mXxo7ThQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net/can: fix Xilinx ZynqMP CAN RX FIFO logic
To: Anton Kochkov <anton.kochkov@proton.me>
Cc: qemu-devel@nongnu.org, Francisco Iglesias <frasse.iglesias@gmail.com>, 
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, 
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Wed, 17 Aug 2022 at 15:33, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 17 Aug 2022 at 15:24, Anton Kochkov <anton.kochkov@proton.me> wrote:
> >
> > For consistency, function "update_rx_fifo()" should use
> > the RX FIFO register names, not the TX FIFO ones even if
>
> "register field names"
>
> > they refer to the same memory region.
>
> "same bit positions in the register".
>
> (No need to spin a v3 just for that; if there's no other
> issues with the patch I'll fix it up when I take it into
> target-arm.next.)



Applied to target-arm.next, thanks.

-- PMM

