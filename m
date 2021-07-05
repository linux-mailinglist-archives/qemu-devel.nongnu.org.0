Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712683BB893
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:04:10 +0200 (CEST)
Received: from localhost ([::1]:55436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0JaL-0000PR-Hp
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0JYQ-0007Bj-Dv; Mon, 05 Jul 2021 04:02:10 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:45012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0JYN-0002eR-Ux; Mon, 05 Jul 2021 04:02:10 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id g19so27722925ybe.11;
 Mon, 05 Jul 2021 01:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tv7TIC0/qTW/6aqEiuAi+dS2jA/KU/JN6NQ+0qzLHpM=;
 b=O22SdZGuRzO/2Qrkvo5JiidMBfeorr89piQzasgV4huqjW+vn8Hq6uMNkePLP2rqh5
 0k1KkRrQD7sPIsIhSzYzvjVfriM6pwWhAxmp6Eeb5LvOC/CBPCcVVVT+EgEVYhZYQGM0
 zbQK3kwshi+TNtTtW2XpVxAc//T8SoZwvqC3gBvTEf/rgYKqLBOSP2lbEYPWq/5eFbQH
 zgfUuHH0o+EBdeWLP35LPh0P0FDdpgQteZv+hYshrYW68/nppmkTFr1Mk0o5Jxtz1Kob
 axvdt54tsF+MQQwxJqqJIY3Ye+Ei1GEApAtG9BbsZEnxejri+1FCAda3FVtmXwwcpdbw
 FE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tv7TIC0/qTW/6aqEiuAi+dS2jA/KU/JN6NQ+0qzLHpM=;
 b=ZdX1L65xc0622sDW1qUSWMwae8rlI9KfYUQ6uoq7tvp/r/hBRsXglAx2TVPan2bzNM
 y14mL5LuC3gV+4k9RW4e5JhmGcOEp+Ndj+QdpR4tbKlwVZtnFuc0aq/SmneiWx+uX++N
 VDlDvs2OnHHkRSZ94H/kGgUVDkiQA2eO1om/W54Q/JBRTmejJ2coXQy8jPb2jJ9pdoGR
 pfK7EvDquAxpiEOYJZjTmDU0kB25HLmkDGqwGZZHlRzsp9ugeEr/UcHmJBddGXqoK4eq
 Cxo4eewTT1JUrc/TwI9EoSh6PKycGgiKOQXY8grhAUcWk21hkqLggugd58hRxmbEUW7j
 qkBQ==
X-Gm-Message-State: AOAM532AT3zVMJ5Vb3G6e800Kv2W34eobqbkuiSWYyW9j3FpTAv3wuMo
 md94xd2Gue6esRFcqs9Af8MN5AEgnbMU6oyex58=
X-Google-Smtp-Source: ABdhPJzxpXJMTW8eXYBMsmVOD6VtSqOMOHvnmfWN82VI7PpX1dV3E3oZi1d0swMR1u2etvu5p6booS/xaeSaTQ4b8Z4=
X-Received: by 2002:a25:df11:: with SMTP id w17mr15879617ybg.314.1625472123434; 
 Mon, 05 Jul 2021 01:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210623185921.24113-1-joannekoong@gmail.com>
In-Reply-To: <20210623185921.24113-1-joannekoong@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Jul 2021 16:01:51 +0800
Message-ID: <CAEUhbmX-j0SL9L2d+0rCL1X59vZmKHcbnUUizpxHtcFuhnZQfQ@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: sdhci: Enable 64-bit system bus capability in the
 default SD/MMC host controller
To: Joanne Koong <joannekoong@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 3:01 AM Joanne Koong <joannekoong@gmail.com> wrote:
>
> The default SD/MMC host controller uses SD spec v2.00. 64-bit system bus capability
> was added in v2.
>
> In this change, we arrive at 0x157834b4 by computing (0x057834b4 | (1ul << 28))
> where 28 represents the BUS64BIT SDHC_CAPAB field.
>
> Signed-off-by: Joanne Koong <joannekoong@gmail.com>
> ---
>  hw/sd/sdhci-internal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

