Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E131A3FD553
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 10:25:04 +0200 (CEST)
Received: from localhost ([::1]:39566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLLYN-0000Hv-Nv
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 04:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLLXF-0007pr-De
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 04:23:53 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLLXC-0001AQ-10
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 04:23:53 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v10so3179116wrd.4
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 01:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=92BObO8RTM+Mo2JEAic2IS0WryqOsOn7gZKcj2QnUw4=;
 b=meciSSH3RLL8VxW/A91DJfmzd0thJycfEKXt/My6OdaF7712DWheojy+wxQH1LI3ib
 JjOhwmT8WY8jv+hpZdjXc+3wsduuvWCyZwKe9guNqY85Uk4r/qKmhsULHMmT57mt4M0E
 IomFZjr/DUX5fEPEsf8PKPtXyVamxFxuqgBENttJPbxDIllIOUKPIXTYG4oDonxVDlDQ
 qV5NXhmLvbuQroToq0O7w+4VEAIEyt9EIg6vyxytZIDzWrsYhSXczB6g6HW3PMBgSTui
 RHiJEzfQH0l4/kUlMQQ7v90Fkfc4xmdaDPUclFPN9S7z2i7TuOHNpCFMvAfH7VJc5s4Z
 KU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=92BObO8RTM+Mo2JEAic2IS0WryqOsOn7gZKcj2QnUw4=;
 b=eask8CIH2O3Kcf+SrbJIjP6ZvskOi1sBBhaOK2Pmlg7ojBxz2wGEreOx1sTOHpp+YS
 kuHy4MNbcbQC37Cac+zvQKKvBlO3iQQUMB0CzlxDuAbKfTouMU+zh7rDzmVwQlZKaL8K
 zcpNf6L0PZRN95cjUnVEj1Ri3oiprJNMR170uqGOj1OeIyFixSPyi9KDxYAa8Ke5sobs
 uF0BM994Evha6JjvCgkwfYG2wLiHbTv6iZNXfPTLS2p8oSdHcuybjEX1wm8kvWFbpPs9
 sMMUyo/aMlV7HdrxJIFpcmr7vywO3VZBV1hMxLoi8di+q66jQ2sxhyZMxP99Wm2vB+3y
 1oCA==
X-Gm-Message-State: AOAM531FnDP3/jNA8xzxLVlsq1kbya9q+2Y2XXAtUCsgN52YOcorearT
 0mSCvv5xLvHJK0Qk54C2xThKQ6WKDVYZBIYky5KAeA==
X-Google-Smtp-Source: ABdhPJxL3BcwC2U1Lx1e2GqWL+jAxHruJqI0/CDYvUmUY1ysfEWYluUU0WM3JhDvPZstzYKt2Kh80CYgfvhyMiBZujI=
X-Received: by 2002:adf:ba0f:: with SMTP id o15mr35685531wrg.386.1630484628434; 
 Wed, 01 Sep 2021 01:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
In-Reply-To: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 09:23:00 +0100
Message-ID: <CAFEAcA-F-gBMJiW1MEJ3m89Y14fXwOXx33=MvxvyHTBqpLM4bg@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add support for Fujitsu A64FX processor
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Aug 2021 at 09:29, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> This is the v6 patch series.
>
> v6:
> For patch 1[1/3], added the commit messages that the Identification registers
> value are defined based on FX700, and has been tested and confirmed.


Applied to target-arm.next. Thanks!

-- PMM

