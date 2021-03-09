Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72953327C2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:53:00 +0100 (CET)
Received: from localhost ([::1]:53250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcnD-0005gE-QJ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJcku-00047k-3z
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:50:36 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJckq-0005tC-GS
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:50:35 -0500
Received: by mail-ej1-x635.google.com with SMTP id p8so27817584ejb.10
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 05:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P+WnGODOBfoKEu1XelnwUh6jVmt9kMG6I2xJyYC2NXs=;
 b=F7aR9o8e1rPHIzOQTzVNxTvA3mGYeKg7IpjOAUxAMx8hBIcyUrolYLKYKXRvR7TLC2
 K21OIpepPw7a6DNyfcxCIs1c2tCM1psRpCXL8mVA97856t+LOGlMBIBQ1meqtMZp/bEy
 9M8S+jaO7DW0B4LZXducP+ehDXRv/JQ2ws4FuV7oPQvjhMHWfhZnjTI9Ms53Jduu2Aqi
 12PzTcYGxPMem7qY8D/MZQsawLV3DpHOr15vHPrUfTWIsEbpotfw1bifjnKljlxfcjn4
 WI3iZQLjuIUclqadeH3ltrnjIGMOsFVO3vss68MzCxS1BiwXF1irutba5tEjCPd6NKDW
 SZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P+WnGODOBfoKEu1XelnwUh6jVmt9kMG6I2xJyYC2NXs=;
 b=lrpWlyT8yB3Azrd0cFuZ2dM09bvVtgbqsLPIhGMTlRLjqkqKFYD1+uadCW+FiH1keF
 9xDLIj0MLdwTtWcPu87jYS9JJsC/rdEmik7rKCR2ZISpwagH275aK6/JwQ9eMASeDEK5
 in5tBHMcbjFAOxIHImSYqT/7wItCCe+x8pi9r0MhvtQ5HpWaDVSEQGMtQVCl3pVoaOu5
 NVGlb1Tzer+3iZyhepC+nEBSHTPbtz34K0Vkz0uLlc2jkrtE9MnDwbYDuOztUQsjVbIK
 M/PElOvielIp75wjO7B0mtOHNmXqYZCCJ0sHYH5mX2gX/GFcHMbNjl2ooXU2jZrYRxRY
 J4BQ==
X-Gm-Message-State: AOAM533E5TaoXIgi1jbDC4FvWOLbNnI2mba4YqiVkB7iwKZQhcQhuX/v
 ycU5SoQ7rdVUxYdHQxBGYKpvsNHEfzmJMMTu24unFpEqoC8=
X-Google-Smtp-Source: ABdhPJw/ZW3pBspq8hynhQvNaGPJhFlkO0c0k1KPnKZHnpZ9mOkFHmAMd+tvRE29nXaEhTR1PKV4Y15rgxDD1Y3fEUo=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr20269670ejj.4.1615297830727; 
 Tue, 09 Mar 2021 05:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20210307013905.115019-1-richard.henderson@linaro.org>
In-Reply-To: <20210307013905.115019-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 13:50:14 +0000
Message-ID: <CAFEAcA8DrjDMSFv_VRAadFxoh-v1sFCCU+K74swR=HChNQA64w@mail.gmail.com>
Subject: Re: [PULL 0/3] Hexagon patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Sun, 7 Mar 2021 at 01:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 91e92cad67caca3bc4b8e920ddb5c8ca64aac9e1:
>
>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210305' into staging (2021-03-05 19:04:47 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-hex-20210306
>
> for you to fetch changes up to 2526e69efd8e386573212bf3ea05171a727a598b:
>
>   target/hexagon/opcodes: Add missing varargs cleanup (2021-03-06 17:35:43 -0800)
>
> ----------------------------------------------------------------
> Add hexagon to include/exec/poison.h
> Two Coverity fixes for target/hexagon/
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

