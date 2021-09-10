Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE90406C67
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:42:58 +0200 (CEST)
Received: from localhost ([::1]:37976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOfrt-0001Fd-V6
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOfWm-00072z-OW
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:21:08 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOfWg-0007Q6-5A
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:21:08 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso1314470wmb.2
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 05:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5EbyyGnLmhrlQSlWQpukmKJ7fS4PXC75I0aNaGf5goE=;
 b=ZEUdgN+/otd0qWvCIvzji09j3LoTr8CdBzlsNKgBkz9V9aMfwxNfNPx5X51JrPtdtO
 qaU7rOqLvRGfCUpr+MxYgfNd15RFKdSnd0W/TcrCPcgA4TEOgJMq+ghdXA4brQJicnwB
 7QN4R2vi4534ki5XdyxAtqtU9yW+JC8W5ja+79SfaZCQOR+BaRJuidQTDwI3Dnwqo4R/
 iSLiEoxUBpx30kl+QLfH6TLsmqqa23a2NBscc5CxLJ8t2S0eWL5UF4fXT1XyYApHMevt
 iZI4lFEkhSNflMEkFZ+MYseHd9RHOfyqlxUVRQsk4jgGNr8JIVDu9TA0e2CtaKYcbFZ6
 4nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5EbyyGnLmhrlQSlWQpukmKJ7fS4PXC75I0aNaGf5goE=;
 b=mKh8nb7MNAL55tTWUiz6QoXzSCSLxQvMBt1wceH3Ycm75H2ub77nfpkUWrQP0GsdiX
 ImLuDzusmmg9lzhXtnkUq4LlmAIoW0ZkmcZ1kabtGoxRS3rdJwa4u1GDfze0qXVActwM
 uyHo5nGwMJo8Ky8t3ZosYVv83+zAe158+JsaWjzxFRQaCmHkxfY2x0ZQJrSjz84V6LSX
 Iksow+o9QWqK0L1DgsxVPRmXUTMlrwGxbfKIud6n5z9Xn/gwFll6nor7R63zmAdSHzPV
 Ug0w9/pEJRJYFe2hISeOmfKJaOdGL7oqnz1+VH1Z84eT2sGVH6arsz3k5RKpYL79dr2J
 Nm5w==
X-Gm-Message-State: AOAM533YCgDtr6ukCwqgbu0msKX1bh3sVROkvzCWuDIX4dso+oJl1wmR
 N942dRayJkEzzU0ZxADA8Ow0QT38hDv3SGw0CQgYTQ==
X-Google-Smtp-Source: ABdhPJx92tD9WsBGK56Ju9zFWkIz5n65xviQD1GXRcZVaMjkSZ3olyakmh1E9bS76TynHv9JfHBeyfYWZtQYLVntuQU=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr2616923wmh.126.1631276460031; 
 Fri, 10 Sep 2021 05:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210908153529.453843-1-laurent@vivier.eu>
In-Reply-To: <20210908153529.453843-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Sep 2021 13:20:09 +0100
Message-ID: <CAFEAcA8QrAiAEziNRtG3XFJ7uZ8mEM7oQi0-+99G+JeS=ob4hg@mail.gmail.com>
Subject: Re: [PULL 00/12] Q800 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Sept 2021 at 16:40, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit abf7aee72ea66944a62962603e4c2381f5e473e7:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/s390x-pull-request-2021-09-07' into staging (2021-09-07 17:46:13 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu-m68k.git tags/q800-pull-request
>
> for you to fetch changes up to dde602ae539910c3579952834b713e2f360ec34a:
>
>   mac_via: add qdev gpios for nubus slot interrupts to VIA2 (2021-09-08 15:37:41 +0200)
>
> ----------------------------------------------------------------
> q800 pull request 20210908
>
> mac_via: remove MAC_VIA device and prepare for Nubus IRQs
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

