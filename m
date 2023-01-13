Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEB866972C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 13:34:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGJEz-0007l6-R3; Fri, 13 Jan 2023 07:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJEs-0007kS-ER
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 07:32:54 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJEq-0004zB-Gy
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 07:32:53 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 u1-20020a17090a450100b0022936a63a21so400292pjg.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 04:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pXHvi2sDYotp+flcrr0cEQVYMDUeKT/Siu/DP01paMs=;
 b=JUExiaQSJ8OeJlCnR+mKauqc4zRK1/iOJbObVfLG2jVj9tcAZ0juNF5VJesAa7VTmC
 tY6fxPd2pbREeZU8dtRmR8YTuYjn4GNMBrC+iZ/vcJwm65y0++QMlXYCJfsFueKbWHSn
 l9JNTsujyP3gbdpBTct8jS8G8Z/XF6Rb4AY9JkaJ7o1u/Np/CpThY2AJABDiHoLrAvbu
 CTEKEfw3oUym0Bj/L/XbcZ02gJM3z2JgMT6LQ53xeocAvLzv31jOCjWLre/8yyfkt63Y
 OMfHdV5fI5ioMs43LlGLJpm2hPle+SjK9g2zMJ367ap2Kz9ioKOvTH7ocUJOvPcZhRyA
 20qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pXHvi2sDYotp+flcrr0cEQVYMDUeKT/Siu/DP01paMs=;
 b=mhkqSBaJi/Kis45esornmohi8QmQfbsCZc39r2cQ7BqfKRB07wH8J0OR9wMJ+oD80q
 OutPvhD6UX/ZZ/qEPIievawrTSfVCuV5RRNi+ewhXot8KNqatx+m8WTGdeG3sqiiTm5R
 dDAjsAenhhmgW1t523/31LwrLmCsed58QrJCQnhb77j00og4OwVvxtBEEaCZipGZ5wfq
 dRrVca9l69GT8aNFT3c/jRy95YuJRtqEKHJEDq6JN/HUVgG2b+tODoyrXmDPcIYev5BB
 onkmPC7Q5+0hP7BDlArASno2tlwHaC7GvdzD+O7XOYMCkX+gJestq6up+RBe2zhIUdRI
 11+g==
X-Gm-Message-State: AFqh2kr13HQTIP+93T/U5hdBTuNwTptiJaBeAY89+aDzzrtIFS3tttFl
 y0Y8XdFIFJVmrY7/rSY75E8CHa+Plt2fxyMiJstRDA==
X-Google-Smtp-Source: AMrXdXv6VWqjBeWYalofNoO0TIFL61KvOGZjh+8aSFjzCfLWyJgfOKGEaB0gEcLnM9KXprGDuTyTwrDTDYVjNUvimiA=
X-Received: by 2002:a17:902:b287:b0:192:ff91:98b6 with SMTP id
 u7-20020a170902b28700b00192ff9198b6mr1693226plr.90.1673613160841; Fri, 13 Jan
 2023 04:32:40 -0800 (PST)
MIME-Version: 1.0
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8EcOFE52X5KbzO7@cormorant.local>
In-Reply-To: <Y8EcOFE52X5KbzO7@cormorant.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 12:32:29 +0000
Message-ID: <CAFEAcA9y0E=EZwmetyvymvt64BpQxAnKMHs0E=BBH9_3OfMwFA@mail.gmail.com>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
To: Klaus Jensen <its@irrelevant.dk>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, 
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
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

On Fri, 13 Jan 2023 at 08:55, Klaus Jensen <its@irrelevant.dk> wrote:
>
> +CC qemu pci maintainers
>
> Michael, Marcel,
>
> Do you have any comments on this thread? As you can see one solution is
> to simply deassert prior to asserting, the other is to reintroduce a
> pci_irq_pulse(). Both seem to solve the issue.

Both seem to be missing any analysis of "this is what is
happening, this is where we differ from hardware, this
is why this is the correct fix". We shouldn't put in
random "this seems to happen to cause the guest to boot"
fixes, please.

thanks
-- PMM

