Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D0D35D793
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 07:57:15 +0200 (CEST)
Received: from localhost ([::1]:56788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWC30-0004s3-4L
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 01:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWC27-0004TL-EI
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 01:56:19 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:35355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWC25-0000dJ-R5
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 01:56:19 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id x8so11739586ybx.2
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 22:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ERbr6qiETDvCrF7oZokdpYJFyT7y2a13epdXPKyyElc=;
 b=Yi6EIHquQowE7cryEhrj0NCtITXMcax9j0SjbNUEcs7BCdGznRTK8cvASfsa+xH/ws
 AhJHhmLztVWV6GrzfCq/d+J8Fn+MdQ50m+2LuYko10ZWiUgvkvtd+Fd5zg6PLYmzNNL6
 EPlsdXt2ZzvNXIxLapWfLxioD3yZqZNJSEQjrrKIqv+Ge7YrVafuYOGsBl44I5dLIiXR
 9gbb84YduAQwcO8/jJlBYZBDo+vnauKZB2J6/YudMDoqwUJFroD/y9IyNx/rkiC6NvcV
 xyXiZkVlqhZ/HWfSwIPiW2d8+4ShFVaaGiVocTGE4oRguaZdf/QGzR55ybiEqUbLMie1
 X84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ERbr6qiETDvCrF7oZokdpYJFyT7y2a13epdXPKyyElc=;
 b=hstXL6MaWMTrIb/dU6wvgvxjGcAWz90AcVVqEJNtvKePUHkkBvU/NzV5MSJi542JC8
 nQZMGriB9fRUOetDQ8itZPFS1x71UN96z5LPzuoosObUg3xsH8emNeyXCmRATX4W8CEI
 2Wq+S0da1/IIE9Ew5AdkP7mXfwuh70N0+eW6FQKCAQLDipmjZ3wwthrH/Cr9C2Y6TqSy
 6GTm74NTPSDEeh2tJq/RNSqXPOcdAePLVBQJis8bgyiTbd4z38HscDKb3XoF3qPHJSdL
 tLnjUGWRh8WmEp+K3uWU6AumvzxI9d97+D4igHGRrwbAdVkCGWVcY8MjXjE/dvmcmNod
 eBpA==
X-Gm-Message-State: AOAM533nOV5ymlyKZ010pr2WyavbnvaufLGxkNdyFnChD1aAeNsZCfVY
 l3vpkjbfx0p/2EDF8SYzMNBCfEoFBsC/++AwkYNPTsLBNig=
X-Google-Smtp-Source: ABdhPJyoxltgCXdFHRgQeKEjIotAia4DYuSBs6LWTs20Mhh5eXl/B4vkFD6l+dA2vHIy1cupIvnNr9oZj6IcKfk8xIM=
X-Received: by 2002:a25:cf8f:: with SMTP id f137mr8003701ybg.122.1618293376851; 
 Mon, 12 Apr 2021 22:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
In-Reply-To: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 13 Apr 2021 13:56:05 +0800
Message-ID: <CAEUhbmWsBfhub-+hMvucshCRH412fuvz5_=fAU_y7UmYJ4_=dQ@mail.gmail.com>
Subject: Re: any remaining for-6.0 issues?
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 12, 2021 at 11:33 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Last call to note anything we need to fix for 6.0 on
> https://wiki.qemu.org/Planning/6.0#Known_issues please.
> The schedule is to tag rc3 tomorrow, which I would ideally like
> to be the last rc before release. After rc3 I will only be taking
> fixes for bugs which are absolutely critical...

This patch (affects Windows install)
http://patchwork.ozlabs.org/project/qemu-devel/patch/20210326062140.367861-1-bmeng.cn@gmail.com/

is still not applied.

Regards,
Bin

