Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E325D3E497C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 18:10:48 +0200 (CEST)
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD7rT-0004PU-W8
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 12:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD7me-0006iJ-CN
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:05:48 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:39752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD7ma-0008W5-Qj
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:05:48 -0400
Received: by mail-ed1-x52e.google.com with SMTP id y12so25390977edo.6
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 09:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2zzHtJyYntp2WIaeLU6simvxP/xORLQJDFqr0gYqOFc=;
 b=edKoftcBHY3FtkUuRZztAirQw6ifDYn4+x/D+3MqFGHkQ5/295eVxxmHk3A8Kprtcy
 OGoFHgzqDF7d6LeuA0i/Oupe97RmpH27XvpP3pV95hhZfoQ1ElaRtj6PmxnfKHLJ4If4
 hL2JggqY3orBqHFuOXj497P1hda9CVag4ZAR+QUwvftL8+HPXL9Rmw2GuFc4Zl80YfyR
 UbOLPxc0GmeN5ghahBu260R0MfESi6QDh6fWtkM56QeClDUDwBe2ra5sMsRxbbDhLAF4
 gFWcyBOWV8F3xe6z+7L9NPrSJblDue0aU5FbXfRwTLEzWwwVri30t6cujPJcsVcAPUs0
 sXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2zzHtJyYntp2WIaeLU6simvxP/xORLQJDFqr0gYqOFc=;
 b=G9aVGdRPCDS/4D0tNt39cdmYxpT36XN69cGPmOozHJejX8rCN85BHqxsRGryicZUtQ
 4Ko9v9ZS7mfmLfs6Mpwkv2YLPADTVKlOJ8qbpDW7VIbEGH3xA5GBtfWM6x7QH9m89C7I
 XaVd9SIKjl9T0h00zup2HF7+MlHEy1pDmc9juGvtqqMoKRkk4Qr3TE75kEXtPFo+yTo6
 SVnFWJmVcDGoG3DgzB/PfLFIpp0vxYCudR9KZWQgaNxlGF2Bhrq9sCBO7AXYAJ2Qc05O
 clDdoE2A20XzALQ4W2mwIa40JA0R8tcIK4tuxFHsgADMgvcfQWSxCeEshT8aMhKFMTEF
 N9pw==
X-Gm-Message-State: AOAM5329FeRnCrYkhalHMbnwvFaVJXIB9ySk8e1KS60BMzSars9RbnIk
 XsU51fVXT8JUVXZ3SgJH8Bn5oeejhXtDuSV5BPUfbQ==
X-Google-Smtp-Source: ABdhPJw3NK5OLQxLybGuYW487UwXpNtkQPbjGUf4LU6HL4d5QAppWU804oC/E/uS30SlDR0Z+As6utz4DHwV2k9IoNQ=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr1218129edc.204.1628525143132; 
 Mon, 09 Aug 2021 09:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210809105609.51177-1-its@irrelevant.dk>
In-Reply-To: <20210809105609.51177-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Aug 2021 17:04:58 +0100
Message-ID: <CAFEAcA_6H5rxsogR1At1XK9WF0eXVssa7_U+bReqAJZ6oFez-g@mail.gmail.com>
Subject: Re: [PULL for-6.1 0/1] hw/nvme fixes
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Aug 2021 at 11:56, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> The following changes since commit dee64246ded3aa7dbada68b96ce1c64e5bea327d:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-08-06 10:28:33 +0100)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
>
> for you to fetch changes up to 5f4884c4412318a1adc105dea9cc28f7625ce730:
>
>   hw/nvme: fix missing variable initializers (2021-08-09 12:52:16 +0200)
>
> ----------------------------------------------------------------
> hw/nvme fixes
>
> * coverity fixes
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

