Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BFB3C627F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 20:16:10 +0200 (CEST)
Received: from localhost ([::1]:56876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m30TR-0000Je-9c
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 14:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m30S4-00081t-Js
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 14:14:44 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m30S1-0005jJ-Pu
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 14:14:44 -0400
Received: by mail-ej1-x629.google.com with SMTP id v20so36342992eji.10
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SSwGwEUGT7DvOpOgl2RNEy5hnlllM5QM5ahlNOVLrXU=;
 b=t+9iMlEVG0W4sHJ7RCdKLYgncnq9Vlim6was7GZysIlvY1HhkLUP0KPrbmCtcpcJVp
 hGrZWgWQWZpdeqpnLh9eUg9585KmesaUN4bqkOkFHQJ0746Hto8vZy8i0pNXdCPpuYc0
 OmAbjbTekJz7MeQWNMWByGQVKiFOvPSGvRkPxJOIfyq+/iULHqYYonW6oMMFz0vH8Hag
 nrEHtfUFSvuGxtaFfg12gKRkYgiFnYrrNjGxy6FohRomZWyTerFDVB4ncX076V4l33Qq
 LCJbNzcvzfuZPzGW+v8rkZGu6QbEEgyWeYyHjqupBe6OPE00VVn+rqBtSc18iYeY0YTj
 FRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SSwGwEUGT7DvOpOgl2RNEy5hnlllM5QM5ahlNOVLrXU=;
 b=JlG/JgQtcOWbQ1i0TExxyMF1X9TkaotBsu60Hro0DOOp/mm/hq1h6pbDFcyyQHAvWk
 yWvf2LgnNZ9SKDizh29lu+ewQOxHzKLzGji0ZsiOJsE02uy0Q51IzUiiuKD83TZqDREF
 qbHqMTXzdKp6CTz5FK9s+hJqjnBLKeT2gtwp3iJWlUHhcOjenGCbr2tOTNELFxQyrIYj
 rAHRxilKNj2D0TY9XA7wjUCVhF4VqZAq5KxQYfi9iHCH34MhiDslDJ8IoJq6HPbx8CDC
 rPwMhoz0GVLXbK9NGI4j4vj08F5Q8xUc+Ctx5pZ+HhEJJOxOh0tBnMN0C2yJi4x2G5mk
 1COQ==
X-Gm-Message-State: AOAM533fAV4DB/v1lsDRfeljYvlywSQMf9xUUYCSs/EYNlBC45ps8A18
 Fknq4LtXBn65D+Lv6eZ4JW3NOpstRsfgetF7BKWPPA==
X-Google-Smtp-Source: ABdhPJy3DQftKg7QG7XjseLQKTJto0XS7p2aR/MdWutOwbLPmYoHeJ235Pe3MNaqvrt1qCP5O6eJJbX/rqhaOBw3aYs=
X-Received: by 2002:a17:907:a05c:: with SMTP id
 gz28mr442859ejc.56.1626113680263; 
 Mon, 12 Jul 2021 11:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210711211945.2718558-1-f4bug@amsat.org>
In-Reply-To: <20210711211945.2718558-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jul 2021 19:14:00 +0100
Message-ID: <CAFEAcA_DgwW2jVm_OoQYv7RgRYCj8kG1N6==1tyrp7QZDtk1kg@mail.gmail.com>
Subject: Re: [PULL RESEND 00/19] MIPS patches for 2021-07-11
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Sun, 11 Jul 2021 at 22:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit 9516034d05a8c71ef157a59f525e4c4f7ed798=
27:
>
>   Merge remote-tracking branch 'remotes/cminyard/tags/for-qemu-6.1-2' int=
o staging (2021-07-11 14:32:49 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-20210711
>
> for you to fetch changes up to 39d9919f4b4c3e7f230efd7d845439d6d732dc89:
>
>   dp8393x: don't force 32-bit register access (2021-07-11 22:29:54 +0200)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Rename Raven ASIC PCI bridge, add PCI_IO_BASE_ADDR definition
> - Various Toshiba TX79 opcodes implemented
> - Rewrite UHI errno_mips() using switch statement
> - Few fixes and improvements in the SONIC model (dp8393x)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

