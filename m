Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64E93FE39C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 22:20:29 +0200 (CEST)
Received: from localhost ([::1]:53868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLWii-0007tf-Fo
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 16:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLWgJ-0006K9-Hs
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 16:17:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLWgH-0001wD-Ll
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 16:17:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t15so1438004wrg.7
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 13:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p9UBRKgyzRdgCiSJEcWquldt5GvHQ1+Bn1FwDPaDK8g=;
 b=UDxCHgNECCUsIQajOnr0Rcg9Lm17IIir2RTZpxJ/nPNOsFCIN8mOTZVbYnXK4Rsauz
 9mt3/shmMcSEmhTYLgsQ0BbIagRg5WGRCuZjgNDhPdY4cAGDhhhyaPNIaiQanJFoGtGO
 v62KDFh60RM7nWq8PX/+h+1ei8VYoieGthYWDM9Xxfz/PFqnb8wj29HXeK7x8zpK4XoE
 5RR4SfWGrpe/3AS/BW+KcXXp+RH96F9wXEUGryXmmHhXg59/UK8UUueZKNr7uYs7d4Ll
 1tFfR+O8+vGT40KP9QbfsVoYP4slLMQ739gz3ciW8zs4LtZUQ3pDKLDudIr/GoKl5Hzz
 5m2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p9UBRKgyzRdgCiSJEcWquldt5GvHQ1+Bn1FwDPaDK8g=;
 b=YIKzgO75RZIOEBfpq5IVJa4yhveJnD+hFIy+Dg6EFuVF2zEzgWOYtCTFzso1yWGb0m
 Ty4rg0Qu48mIT+riJbm8djEdoFv0XzWG/zIIPqIQ0WGsVrXdt1U7tQtkxsVgNHzguaRF
 BRIMPPQxBe9+GpWU2cr7ZGMDFzelAgh8s5n0KmsqTLpag5wF/phv2oNVR7I5KD1SMetZ
 olA9W8vjcsHTkbF4fO8JlEP7sTqQksL3BhN/YYhA43Fg5lIP/RkDL1J8RSFBiH5kFC52
 CUHn8LKvBwVWkFBWlHQBjNUjpXVMAFcWrlrItZhT1teM0T0/MiylNnQma7J5E4icC2DZ
 uRxA==
X-Gm-Message-State: AOAM532ssA6DJjsUUp0vLswtyw+gxSaE9KPtmq3vh+pGXNJOwYTR8J/O
 GKcBQeaLdaJLJnGsapzEG7DN6GmDDnKDNi2MM6dniw==
X-Google-Smtp-Source: ABdhPJwIeJ0+EnLeFB3YMF4nR7o3YYD/zWJzHFITk6xHU1Cq+yBNvtNcR9mCl5YjYyWK3SNFdBamVsOkrnnVZFr1A4Y=
X-Received: by 2002:adf:ba0f:: with SMTP id o15mr1279561wrg.386.1630527475986; 
 Wed, 01 Sep 2021 13:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210901164446.2722007-1-rjones@redhat.com>
 <20210901164446.2722007-2-rjones@redhat.com>
 <CAFEAcA8WD97HqQRRzB8Z1LVMCmkKZu3_EAQZM1HAMxccQ=PMnA@mail.gmail.com>
 <20210901183009.GG26415@redhat.com>
 <CAFEAcA-V7kp+HGBkHM_Zjfq28KhRReo74nowbtP4ZuZzVaw+kw@mail.gmail.com>
 <20210901185115.GI26415@redhat.com>
In-Reply-To: <20210901185115.GI26415@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 21:17:07 +0100
Message-ID: <CAFEAcA_JiWFrtj8nyVuPio-qPmu2z4_V4mu1kXFSv-UPXXxPNA@mail.gmail.com>
Subject: Re: [PATCH] tcg/arm: Increase stack alignment for function generation
To: "Richard W.M. Jones" <rjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-stable <qemu-stable@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sept 2021 at 19:51, Richard W.M. Jones <rjones@redhat.com> wrote:
>
> On Wed, Sep 01, 2021 at 07:41:21PM +0100, Peter Maydell wrote:
> > Is the failure case short enough to allow -d ... logging to
> > be taken? That's usually the most useful info, but it's so huge
> > it's often not feasible.
>
> I can try -- what exact -d option would be useful?

Depends what you're after. Personally I'm fairly sure I know
what's going on, I'm just not sure what the right fix is.

-- PMM

