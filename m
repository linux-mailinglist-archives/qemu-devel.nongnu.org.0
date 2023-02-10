Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DE2691D43
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 11:52:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQQzc-0004wP-Um; Fri, 10 Feb 2023 05:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQQyj-0004si-Bv
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:50:06 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQQyh-00021M-KK
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:50:04 -0500
Received: by mail-pf1-x42b.google.com with SMTP id v3so3212852pfn.6
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 02:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kvHX3mpuSE60duCiFn6IKQuKCW0qYmKxPbhEGLYYiww=;
 b=J1mrolRRWq8Qu0XiMlZz7mccs750p6eJtH7Uey4+GoQJ8alNtu69mG0xXlHXR21MyX
 ufvIgCBgu18R7cjehi6aIyWy/UHTCudSsyxVCkX2xySATycdR4YRtx7hT9xKkRqEQTR8
 ghto8bluPPl+6aEKfXsGnRrleJozPsHoPldszBfBm16rfX6OXr8glS5XyLP3dqWXLk3f
 yH4DnFHWLoXGs+iGpVm+JWIWGvC3ipPb0+CKxmydBPuRgvA10+RVCvJzVehCnkYOzIoQ
 OMedaGTqrOzaaXTVcnAXePIPOcXZdKJXD15oqXXpGCT3PGGx3gCo9w9CfM8voA1ODeR4
 f2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kvHX3mpuSE60duCiFn6IKQuKCW0qYmKxPbhEGLYYiww=;
 b=P/2iyKJ5/j7rGBA6evsxr2V+7XX7pFvZKhBO5zkJpDt9C05uGPVKmj4aS4Gpj0CBbH
 X7iziEqWZIzYbwH0ZONjbBukBitH8F4I/sBLsjGrJHJVskLaaYvLFzOWnoSYDhMm90Rx
 0wjnexe3xkeN84dNHGAoVvaGW/bPPCd0204sKT2apgr1LV7Yq6SaVXPLwpjjn0XW9Ip1
 iygmB6ADdSVpTlZ2zBCucqd3kyg1Jh4K9hahobWC33SGBX2pplIs31b8NmzPeQDzcRGx
 P7fP633zN6wc1Ca/nUlbs50AbT9pGA1WoOke8hBAxyl8EVEE1R2HW7UmGlOoGTJAyxK1
 ujag==
X-Gm-Message-State: AO0yUKVylld3v5GBQJt6LHWKVWNfnFgDQXpYHdZpWd1ePqaB1w2RA67f
 qPjkaHf/5jvQOZhcVK6y9IZCJt9ypuhlSZJE/gsQCA==
X-Google-Smtp-Source: AK7set/RSSW69TmIPZF5301f0DfiEySuwDmuJUEjWY9wSBrtVPxEMLnIbmZbgTkVJjpXN0FgK+PBhHIACR3Knc6m1Yo=
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr3231569pfb.48.1676026201840; Fri, 10
 Feb 2023 02:50:01 -0800 (PST)
MIME-Version: 1.0
References: <20230209152520.434183-1-stefanha@redhat.com>
In-Reply-To: <20230209152520.434183-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 10:49:50 +0000
Message-ID: <CAFEAcA8E_egc6qL=htY-QAvWZb-rPoQOosVMTykiA2Fp+wJn-w@mail.gmail.com>
Subject: Re: [PULL 0/6] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-fs@redhat.com, qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 9 Feb 2023 at 15:25, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:
>
>   tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to acbc8aee5b09222dc6a5cb88306b67bcbe37e30b:
>
>   iotests/detect-zeroes-registered-buf: add new test (2023-02-09 10:22:30 -0500)
>
> ----------------------------------------------------------------
> Pull request
>
> A few fixes that I've picked up.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

