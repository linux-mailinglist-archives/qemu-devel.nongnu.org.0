Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D9C2FA0F0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 14:14:33 +0100 (CET)
Received: from localhost ([::1]:57606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1UMa-0000Dz-7Z
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 08:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1UIB-0007PU-Hf; Mon, 18 Jan 2021 08:10:01 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:38264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1UI3-0001w4-4j; Mon, 18 Jan 2021 08:09:59 -0500
Received: by mail-pg1-x530.google.com with SMTP id q7so10895788pgm.5;
 Mon, 18 Jan 2021 05:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bLteIkf8pj2o8arSLE+fvP+0nUspmcbUvEdsN2n8VYQ=;
 b=Nx7kxbGk2eHFRVD7GkVoUgX1uSvpCfqdTeCu04sXTlF7Q4Xv+OJo9qXcCjhwEhN/L/
 Bke7GkrG6pGJrd/BLPfHbWD1X2zHBOOIkP0VhqSeer0n+3tiz7pfvtDiDu963KztrZVR
 n4ME0df7GeUBYOkyCZrwZsvzJfkiwsFmeKW7OPtoEH4JaIOPHw6cqIxbg3kjQK47HfOd
 GPS4N9na4Jz0tYGJ11X+aerKXTdDkadwnFC/lHD6YDp1F6o7IVYQumI66y83eBTfUQMR
 nJoi8WDkB4cq1Zo1BjIH0PNtWd3HgUYXbaLj7lUWprolDaW3qx716SV3FAlZRe4XVsVe
 9gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bLteIkf8pj2o8arSLE+fvP+0nUspmcbUvEdsN2n8VYQ=;
 b=jr0CiF8sViNsX9ZVG8OoQrP+iCyhy49kN26FjSu3sAWSbqu3ak5pJANMGdEnIlRuoT
 HmDYM6pd7d+GUF3yL4dVp5DRj9at3XzmiDtpTd/yGhCWyGeRN6eqE5vpNgDq9uWdZrgd
 lu0mVJHWJrE7Ghm53WR2Qcmkc/LQqQ5a5P7VN0ZfQ323kkdZpX4WA6rAn6oqh89hzulT
 33lvgIuZE+hf3a73p1R/9cWKcY0/Kc6uDMr0Ugw01cToJ8bJA6XH26by7f7e46QF+sYs
 FaiL0seTQbin+3ztU0BfszaFzV/wGPeWOIYiX3waGKwUjOd0WvFXk1n9oH7jmZ5EOKZy
 YTlw==
X-Gm-Message-State: AOAM532sD1kBteBxdJx6oXMBo88EtPiRtjhWgieC38Wsq92fSQzKxXP4
 /cpNf/96tHB0dNxnQ55zrvw=
X-Google-Smtp-Source: ABdhPJxLaaiFUFyoh94d4kRN4v/Wkx4IWxJsHJhuYwuoIUdCVD/bX9f8MrsTEv++MP+6cN0hr8fWdg==
X-Received: by 2002:a63:1524:: with SMTP id v36mr26122941pgl.383.1610975389370; 
 Mon, 18 Jan 2021 05:09:49 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 6sm15245226pgo.17.2021.01.18.05.09.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 05:09:48 -0800 (PST)
Date: Mon, 18 Jan 2021 22:09:46 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 10/12] hw/block/nvme: move cmb logic to v1.4
Message-ID: <20210118130946.GJ18718@localhost.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-11-its@irrelevant.dk>
 <20210118125859.GH18718@localhost.localdomain>
 <YAWHSaXmpo64xmmp@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YAWHSaXmpo64xmmp@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x530.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > Yes, CMB in v1.4 is not backward-compatible, but is it okay to move onto
> > the CMB v1.4 from v1.3 without supporting the v1.3 usage on this device
> > model?
> 
> Next patch moves to v1.4. I wanted to split it because the "bump" patch
> also adds a couple of other v1.4 requires fields. But I understand that
> this is slightly wrong.

Sorry, I meant I'd like to have CMB for v1.3 support along with the v1.4
support in this device model separately.  Maybe I missed the linux-nvme
mailing list for CMB v1.4, but is there no plan to keep supportin CMB
v1.3 in NVMe driver?

