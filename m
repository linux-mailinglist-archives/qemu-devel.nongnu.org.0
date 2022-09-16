Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD045BA9FB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 12:09:07 +0200 (CEST)
Received: from localhost ([::1]:56212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ8HS-00036j-GO
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 06:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ8DT-0007lT-QL; Fri, 16 Sep 2022 06:04:59 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:34522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ8DS-0004qD-BS; Fri, 16 Sep 2022 06:04:59 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id ml1so16269046qvb.1;
 Fri, 16 Sep 2022 03:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=vuLgNrTkBjRwr7h0YGOwJUivY+0XfOZYuCo94DeL3P0=;
 b=dZBpTgaIyfgVcCxhsECbEwX2Fd8CaWXAHjyHijfs7h72B+XZ9OemXz864rMiyFjfBg
 pLiB1ZYQHg9zAgiLA8WZmgUOZe7dCVLDGep6Ef76M97bNCUj3Z+rlzlecrenu+zhLwZP
 Ubo5/2sGAOMAxV74Am/gEeo2i732kfy+OIWoWPEhl2fyI9gsuqtJsHTECFHBbbqasurE
 jGfd8wShKC3qYSyNvjK/S/ZtF5nJYfpdC3hrLS1JUAh2cIVsF+9k7M0ux1mjm5uK3ABa
 +p8yDETHzJHAsZerZlWk2z5KnKOCWaw2h2Dt8JT6HNN/vUK97wPq0VyiR4uTBgpgPBc5
 pQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=vuLgNrTkBjRwr7h0YGOwJUivY+0XfOZYuCo94DeL3P0=;
 b=Gt0bUoiQ6gnXYAaynR4UciHWHb5cEQ/ZM6oEYJJtuw1bIN4xUtDRHh/ZRLBgFYnn4x
 fexuQsG5TohBhtuT4I7X14Oe/cD0nGF17Rg0750rkRXIK2GlPmg+eG3MVsxp4H+X9bH4
 m/Mi9Yh5KlC56PO1ZluyFeJaVx7rO8UZnFT21xGChdHx4dKpRMNffT1Y+0GT8W/KNInd
 NEYRKefrK4w5nmCKD+hb/m0fgiCCkwH7V4tz1NwYg2OGEq938S9Cn6pj3n22m4O7DVIM
 3WWaAXAwGfjipdZC+Eu7jYEeGmx9ttDZDZlH0XUjKNwnd4Ysa2V9CK0IC6taUC4w0lJw
 4N2Q==
X-Gm-Message-State: ACrzQf32OdGasLVYSVqfr3c2iSudbPfNyaq++jV3Tu+UWB0upavwLyA0
 HTO0tkOYwI/SRQjVjZxtw8Vh4a11vTliMrTko6Np/Fw5mIA=
X-Google-Smtp-Source: AMsMyM4r63uFtOJZJ8IB8iFsH9ZRY2DLKTJOL8LbhgXMDoPz66tY4QngrDjYu2Jq5VZMSbndIVwJqM/4M5v7vdyOZ+Y=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr3606785qvc.12.1663322694888; Fri, 16 Sep
 2022 03:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-9-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-9-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Sep 2022 18:04:43 +0800
Message-ID: <CAEUhbmW2p4k+gdy8HMzJDpMVm16eqM-hWdwZ4+qATSBvBHd=Zg@mail.gmail.com>
Subject: Re: [PATCH 08/11] hw/sd/sdhci-internal: Unexport ESDHC defines
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Sep 15, 2022 at 11:39 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> These defines aren't used outside of sdhci.c, so can be defined there.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/sd/sdhci-internal.h | 20 --------------------
>  hw/sd/sdhci.c          | 19 +++++++++++++++++++
>  2 files changed, 19 insertions(+), 20 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

