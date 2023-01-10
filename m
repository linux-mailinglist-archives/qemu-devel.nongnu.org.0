Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9284664440
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:13:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFFFQ-0006gg-Jj; Tue, 10 Jan 2023 09:05:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFFFM-0006cN-Ux
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:05:01 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFFFJ-0003zs-MU
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:05:00 -0500
Received: by mail-pf1-x42c.google.com with SMTP id c26so4465751pfp.10
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 06:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CJY2eY0yqtVzgZ6za+IgLscxAJNfbEbpTN8QwyUxsyo=;
 b=HSgW3toxrOkMxdHyXyOs9lHtCVg1g16pDTNkhHKYOrailAIiB/HwgSj+tdSTUEF/Yh
 wtkMwfoGDDGNQq58WimeNkFVHDydW81KGinNlo+z6InaQs9tHQI1vfWz4R3m480KgCOF
 sTE0x68mnGCiILPI53knblUEvtqJLAE3c5VHnLGjWNc6NKgpKY9v13Zg4kOUGHwaJG5g
 flpcFw2rivYpvDb0anrNWEaPrp4NgD5nY94jKCjRuXaeteUS6InRcyfOS3KRLn9K4PZz
 XT3gfXGKptVEHj6lyNlguwGfkFHxllrdiFiRZugimxV9RTTzZBaLZ3gfi2vCkDIpQqeO
 K61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CJY2eY0yqtVzgZ6za+IgLscxAJNfbEbpTN8QwyUxsyo=;
 b=TUz+2Z/2l7G5IFNBbkfJ4yaeaS2TTNfocF4w4iiWfYiHCgNDeRyV2eDhnkxEJ3JNoj
 HwJUba8rtzMvN3gSY74QBpeelcZefzDN1DMydJClvAxhc7ywFcLJbsg3QfQQUQ+HAHvs
 5gdxDP1lDA77q2pQKlGxYnzdK07uuqrc6k3ZMC4AUmjbtrxQUtCpdUcyYu8FthHzN7yA
 XN0YFnLd2fKxTL+SCdTZEL9OScPsbUMrdhuoPqQNd4OMIMsoQu6q+sY/xnP9jVEu2Ezy
 LT9asZmS+Nd3GlpjcO2GP9CnMYskOq+3um4K41K22bKj2LTBZBB/+O4gksILzdN+4AZ4
 FNog==
X-Gm-Message-State: AFqh2kroQA6x+6QS/wzP8D8YTEEXwmXZxlTNLbxlT7PMO8lbi8tCb3BH
 d+5Ez4z7lLtWpPzemsbYFZKjXxO/p7Z9IUOwni8yDw==
X-Google-Smtp-Source: AMrXdXuuB2roj0oB9jj0j38YxOfvLoc2viXRiOny6vkD4I6KjPgaEQzxiMYaajjozUFlWJ+arjNA+if/VNwZjHbvj2k=
X-Received: by 2002:a65:694b:0:b0:477:86c1:640f with SMTP id
 w11-20020a65694b000000b0047786c1640fmr4894998pgq.231.1673359495492; Tue, 10
 Jan 2023 06:04:55 -0800 (PST)
MIME-Version: 1.0
References: <20230110071743.63507-1-its@irrelevant.dk>
 <Y70Rt+y56CP//81T@cormorant.local>
In-Reply-To: <Y70Rt+y56CP//81T@cormorant.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 14:04:44 +0000
Message-ID: <CAFEAcA_TD-LrnH_YUW_-wc_KGxTt+JPMqp6G+nwk-wQf4eH6Yg@mail.gmail.com>
Subject: Re: [PULL 0/4] hw/nvme updates
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
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

On Tue, 10 Jan 2023 at 07:20, Klaus Jensen <its@irrelevant.dk> wrote:
>
> On Jan 10 08:17, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > Hi,
> >
> > The following changes since commit 528d9f33cad5245c1099d77084c78bb2244d5143:
> >
> >   Merge tag 'pull-tcg-20230106' of https://gitlab.com/rth7680/qemu into staging (2023-01-08 11:23:17 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
> >
> > for you to fetch changes up to fa5db2aa168bdc0f15c269b6212ef47632fab8ba:
> >
> >   hw/nvme: fix missing cq eventidx update (2023-01-09 08:48:46 +0100)
> >
> > ----------------------------------------------------------------
> > hw/nvme updates
> >
> > ----------------------------------------------------------------
> >
> > Klaus Jensen (4):
> >   hw/nvme: use QOM accessors
> >   hw/nvme: rename shadow doorbell related trace events
> >   hw/nvme: fix missing endian conversions for doorbell buffers
> >   hw/nvme: fix missing cq eventidx update
> >
> >  hw/nvme/ctrl.c       | 121 ++++++++++++++++++++++++++-----------------
> >  hw/nvme/trace-events |   8 +--
> >  2 files changed, 78 insertions(+), 51 deletions(-)
> >
> > --
> > 2.39.0
> >
>
> Argh. I forgot to update the pull url to something https://.
>
> Do I need to send a new pull?

You can just send a new cover letter with the right URL-and-tag-line
(I tried guessing what the right URL was, but didn't guess right.)

thanks
-- PMM

