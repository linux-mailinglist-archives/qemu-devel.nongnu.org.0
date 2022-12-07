Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CB764573E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 11:12:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2rPJ-0006Cb-94; Wed, 07 Dec 2022 05:12:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p2rP8-000684-Ir; Wed, 07 Dec 2022 05:11:57 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p2rOs-0001mS-1w; Wed, 07 Dec 2022 05:11:54 -0500
Received: by mail-lf1-x12c.google.com with SMTP id 1so14305851lfz.4;
 Wed, 07 Dec 2022 02:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PQb2ACBdfNxeza8zs12UmsyMha/7qmmvpjD2Kj7qyiM=;
 b=TU1gkdENIofduDPbJ92XkTnOsvS9MUgjUdhyTfILEZFyGsjzfctXOMTX6Y9NbXM0OZ
 PjQXID2g9jod5iw9daxsG9F6MpnuKq2j35q7EBkHESCh5/jMmN25YB3CDvbnP84zMTUk
 B/e/XXcvpX9mg6hRmJojwWYxDqjsl2xLpZEWeF+u6IIIUxX+l36bkuQduuIxoXMY9VKr
 7vriHNHUcQXA+WPd3feheilOrkvPUMgCjBM3fuO+RIwuvZz+7YOhsZT9MdPWbDj7nKqb
 Kbl4khhd7qGmnA3jLIpks5xJtfLQLT/XHAFFZsrnRkkaku+RLH6Xm2HHSxKFm/xg+XQR
 cudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PQb2ACBdfNxeza8zs12UmsyMha/7qmmvpjD2Kj7qyiM=;
 b=HgNJCOvtmDX7X4Zn6hCdZATstrMC4lNBjPdYm0CttxUpXAfVNf+6xtRhz2ldJDaDcY
 x6wDcNvUrz/bEHIaoVotpqmtDPe8/87cQV+RfM9Q1jCfBU+d4ewV2u3PtmGIg4qNO8+c
 iw4vkI6zCo3UDgkwDpT/t77LfVAWFikf2c/Qcz5Bp3+5XabShp5r8pyzdnI/OMRNlqqJ
 O+ZL9aEXHMXgZXbMGIOrtJoHQtrI9jizBgSzGiUdz7UEUzwsMc8HSZGpuHBRFFE27tDW
 yugK3t5uDuOjZZiAg8EQ0YLtFsgNINW/dxyD3849Yavz6sH32EUw/AxWNPbGFEn9KmJe
 DlfA==
X-Gm-Message-State: ANoB5plLmM57J2o108a+Z1RzlLnHTleBYa1VgaKGOP4r1oNWrBrdfF5r
 O+3BfADHERv3h06Uu/L/X8yt8kagZPSvXm6zuIA=
X-Google-Smtp-Source: AA0mqf5r/0js/DA3f73u7AAYqxggMOTAD+K+R8p3rXY/UvY06xETvk0B+6LzzvNTlna0koalfaGFpiBINhDBG2K+1YQ=
X-Received: by 2002:a05:6512:3f96:b0:4b5:478d:821e with SMTP id
 x22-20020a0565123f9600b004b5478d821emr7834621lfa.250.1670407895274; Wed, 07
 Dec 2022 02:11:35 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-14-bmeng@tinylab.org>
 <CAKmqyKOu+f8PjYMmyXRktMJCR1BnSb1qG0gAA_CaDztU=kuHxg@mail.gmail.com>
In-Reply-To: <CAKmqyKOu+f8PjYMmyXRktMJCR1BnSb1qG0gAA_CaDztU=kuHxg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 7 Dec 2022 18:11:23 +0800
Message-ID: <CAEUhbmV6mMdy6Og3-mnP=4zq_YfG6sQpQy8ZbeH-Z2DHMaP0Og@mail.gmail.com>
Subject: Re: [PATCH 14/15] hw/riscv: opentitan: Drop "hartid-base" and
 "priority-base" initialization
To: Alistair Francis <alistair23@gmail.com>
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Alistair,

On Wed, Dec 7, 2022 at 12:38 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Dec 2, 2022 at 12:09 AM Bin Meng <bmeng@tinylab.org> wrote:
> >
> > "hartid-base" and "priority-base" are zero by default. There is no
> > need to initialize them to zero again.
>
> What is the defaults change though? I feel like these are worth leaving in
>

If the defaults change we should review all codes that use this model
and do necessary change accordingly. I just see no need to
re-initialize them to the default value, that's why we have a default
one assigned. But I am fine to keep these codes if you think it's
worth it.

Regards,
Bin

