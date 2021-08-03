Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10FE3DE930
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 11:05:27 +0200 (CEST)
Received: from localhost ([::1]:53138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAqMY-0003c8-Rz
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 05:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAqLC-0001YQ-UL
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:04:02 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAqLB-0003w0-Ct
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:04:02 -0400
Received: by mail-ed1-x533.google.com with SMTP id y7so25833426eda.5
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 02:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/nL1N8J/kAZD6OZneyvpICTLnNqpZHKan2Reg9Ci1y0=;
 b=lyMs/Qb/I9nVQCDfNhyHylNrIsKkmeTik1pgjtFGUohKyzxQQKyU3g3fxAdq/98Awz
 CERZDDJu/nbmMAMoHWKdhNhfSc+F7cNUx/HwVgWaF1FW6JG4gpQU3Nnl9rswQDQ9VUW7
 xgplq1dTiFwVv5QDt5Y2UMRblyYciE7P7gCAYMPwkd6QXtns2WyG8c8pD0dCDgPJA4Mk
 QXpULLjQfsaV+vBUcvOjFfAfKLFvD/TwCThCVF9cMARCQ6UNmgIRoUWAv2LYdKLQnxZo
 ZhaLbyQ0cf/DAE3Hb+Wwm/dLcMc/ityTU7U5VifPYKPpRWTKgf8Nr0NDZ80l+6piHEvB
 UxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/nL1N8J/kAZD6OZneyvpICTLnNqpZHKan2Reg9Ci1y0=;
 b=laVc/0E1kVuG0w6DGsN7z4RxiwQfSGgYmIiO+1PbDVQbqjzZLDGvetoU2pEVqI4CSS
 r+o4ZHx11dd1LGIBhzgxqaNEBAVtyRKe0/8bazd9gZs+GCemnS5c9FoGgjjT3vgFQdEa
 a/GxlZmTyVC+DGgN+ykj8KkinBXdVhQasHg6jXp3b6NXkDEv6Ijd48piufZnL63Z9IeB
 /Lxd+khZHosJ+49ubS8WmFfSNZFhNtQAKDiB8TK8fIIF3vryF0urchiAXBpm1X3zbw/K
 lhI2TZw6QUD8gTgk/4SwQcTTbG4zusNevJYj7ibj6XkZa97fGDKTYmK8mrHzCuolI5EI
 RDUg==
X-Gm-Message-State: AOAM530kh32HYnTVYl0uj3nBb06BLCnbqCQmerEe293s7/+f7roo/ZsI
 9fBBGXR9XfL6WRYtdn1bFBJYKsg2F9XIGlBvY0C++2RWmII=
X-Google-Smtp-Source: ABdhPJyvWaS7C5a4Ig4fWgP4HJpdkI+ECE81GfTYIvqdDCOmcFb1B8bIfVOJ7YRVpVqi9/TjfeDZlK5m2st3Vo264Mk=
X-Received: by 2002:a05:6402:2789:: with SMTP id
 b9mr12956623ede.44.1627981440050; 
 Tue, 03 Aug 2021 02:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
 <CAFEAcA_=685EKqdsLh=rnXPXQNSRJ+PNuDYec5LTxr_rcAbeOQ@mail.gmail.com>
 <TYCPR01MB616096BA80EBBA7FFA10A119E9F09@TYCPR01MB6160.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB616096BA80EBBA7FFA10A119E9F09@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 10:03:16 +0100
Message-ID: <CAFEAcA_VS9MfZM2NumtScxk_8mXtF=D_-YPsb+tt_acO3r3U7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add support for Fujitsu A64FX processor
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 at 01:37, ishii.shuuichir@fujitsu.com
<ishii.shuuichir@fujitsu.com> wrote:
>
> > I'm afraid this isn't the way a v2 patchseries should be structured.
> > The idea is that a v2 series should be complete in itself, not based on whatever v1
> > was. So when you make the changes requested in review of v1, you update the
> > commits in your local git branch, and then you send out the patches as the v2. v2
> > should apply cleanly on to master, and all the patches in it should be logically
> > separated out changes (with no "patch 1 makes a change and then patch 2
> > changes the code that was added in patch 1" effects).
>
> Thank you for comments.
> We apologize for the inconvenience caused by our lack of understanding.
> I understood your point.
>
> Just to confirm,
> should I update to v3 and resubmit it as a patch series based on the points you mentioned?

Yes, please.

thanks
-- PMM

