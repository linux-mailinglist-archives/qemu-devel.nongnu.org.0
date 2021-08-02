Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE913DD8A2
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:53:46 +0200 (CEST)
Received: from localhost ([::1]:45464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAYO1-0006b4-JA
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAYN3-0005JG-9l
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:52:45 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAYN0-0003tx-1n
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:52:44 -0400
Received: by mail-ej1-x632.google.com with SMTP id e19so31012710ejs.9
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 06:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=jDOCdiNgIuDFyyhzNV2SN5a/IUQk3cPGZcx6FQY9lME=;
 b=zsXpMvqN4W1D/41C1/A6taN4vjsHxpGHQrQSGeYYsZAMHDSCdSFHFlE7bKdrWdbfIT
 zDsQZrce+pptoDysSYD8oIW2D7NdxXGxzH1ePXCyHdxTH1SOuFLuhAYPkRi7o88YlA73
 s6hOvTHj4HeED4WRMK04GedsvM/30pe6A7EzvmzZPQ525VOJzMQrmW+8rviWpdPqKhnB
 SgmTHISOS4wUTrLw3Yf+Fn0gW12J0OuKlcrUmasz9ZW7Xh3NlwmfLwzDZ9J5kIO3JRyv
 8PBinuRGh40MMus2SowSwhGxX2cfo8A5VYiURQBnc4HHLCdrCt+8Ink7yFOQqh3u4hXw
 YFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=jDOCdiNgIuDFyyhzNV2SN5a/IUQk3cPGZcx6FQY9lME=;
 b=QwAcY2AJdI2vXjp6RfQadsr8PtLbo+jujDThitkCLnlw1Xh4KnEOhj8k0OXnEKXQ6P
 2xnw7oM4hJzUpduerC24YFn5W8i/iNYq9UGJsi6nBz3hpZ3PTXPySxLgw12iEHnMuKs9
 5nwEiHrpL24CHBHZ9Li0ehi6OPTap9/GE/6UAgSMlCa3c/KSLB7uVG2KZKmuJckfuClZ
 acnnyciX6Bqp87QkeX51PrL3ZfaUflrFgqO04FpJq6+/6A1BbKlPyz4hkjFLERtMvG1z
 cPGUQOY/4CTDWfDFtLBfk3zzm4QE4TsJllzPZ+Ga95igITk+xOLEpVOjXVFWhdPyGx8/
 KhpQ==
X-Gm-Message-State: AOAM532CfUaZU3C91YVxmF+82/BTPYuSnhTx09jNbe+2/nckulDU6/GH
 O2Ck0+OiGdr3H0m29f2WUiv9Ye+hZZFcKnaD296E7W0cXhY=
X-Google-Smtp-Source: ABdhPJwdhlUdiE0A+YaBvATQaAlvpOdBwWJZC9iIeDlbg7IcO4JF8waGS8b+q5XD1gFXBEX7C1K9Y40UjpY/ofJ9MG4=
X-Received: by 2002:a17:906:948f:: with SMTP id
 t15mr15684888ejx.85.1627912360185; 
 Mon, 02 Aug 2021 06:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210802115812.10731-1-peter.maydell@linaro.org>
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 14:51:57 +0100
Message-ID: <CAFEAcA8pp3gtbxpdOkG6OGUR-gYXVorizfBozoM1Ukgo7vxDEQ@mail.gmail.com>
Subject: Re: [PULL 00/21] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2 Aug 2021 at 12:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> A largish pullreq but it's almost all docs fixes.
>
> -- PMM
>
> The following changes since commit 10a3c4a4b3e14208cfed274514d1911e5230935f:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-08-02 09:47:07 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210802
>
> for you to fetch changes up to 4a64939db76b10d8d41d2af3c6aad8142da55450:
>
>   docs: Move user-facing barrier docs into system manual (2021-08-02 12:55:51 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Add documentation of Arm 'mainstone', 'kzm', 'imx25-pdk' boards
>  * MAINTAINERS: Don't list Andrzej Zaborowski for various components
>  * docs: Remove stale TODO comments about license and version
>  * docs: Move licence/copyright from HTML output to rST comments
>  * docs: Format literal text correctly
>  * hw/arm/boot: Report error if there is no fw_cfg device in the machine
>  * docs: rSTify barrier.txt and bootindex.txt


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

