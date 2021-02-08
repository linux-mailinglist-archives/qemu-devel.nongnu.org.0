Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB936313B83
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:51:48 +0100 (CET)
Received: from localhost ([::1]:39242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AhP-0006HS-LK
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94Rh-0003nx-Am
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:11:12 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94RY-0004MH-4h
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:11:08 -0500
Received: by mail-ed1-x536.google.com with SMTP id g10so17601038eds.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3DF93yNyqzKb1toCu6yzx0dUEmFgq5ReCwKiY1oBEBY=;
 b=dFKKpEYlHO3ujPR9poMry3j3rLy6Hsu3KoQccuPmZU4JrTgn1cuOKpI/UuhjS1cgd7
 +UTf4fZ9iHrm8MyKXc3oShlk0IYasDD9eJWrdS0knF9Id8RWlFN9aZBkrnM6YUAuV7oq
 NF/LHGDBnExVWBAPcIrPgQjCG9Kpo7IdcNKxrR402m7ha76TqSBEsXb2XmiHufB4UX0P
 gyFsiV2wF0Bol7tsiEQnE1/J7KNiIUMBf5r3cXzOXJ4zKBJP7QmsT21gvP2xwXDQCfq5
 JZSXwjcsOcZHUzxl9PKsxfIgGbdEjmsP5jWFGzgHksfcJPYrDC7xmrPafHVuIxbUezg2
 qi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3DF93yNyqzKb1toCu6yzx0dUEmFgq5ReCwKiY1oBEBY=;
 b=Ocmq8vHybfCCUy2M4jQeDKtTw1kiysMC3qmkHALEq++sQQFhlOv66GYXt4iuctMFiL
 LoME8lb+yRv5LTBFKumK83ZVXe1A+8WeHZk/be8e+IDxnOuLf4pv5Fz4Nga7ONsDgAXw
 D08kv730BIdli1YBhmW4Hq63RDEbHMHniFJQRYzT+B6UPnlXfu2L16hRo2FHEBDQqevK
 zMpUa+IPhTf6aketNNCBDgQUA2hbaZaNbWtEHbeiAiTIeo6G9flJpHo3jJEEw+WQTEKi
 9iC2wnmckBQCDOpYKUcK1lxl4GyvCBHNXQW5u5JHFQQ3D4l/X21Qf2r/zMJ/WFf91eJn
 VRgQ==
X-Gm-Message-State: AOAM531TV89dB4+dWJuh/P7eUxnF2I05MQReeljymzfOiOVDHXSgrGnu
 CH2Evjg5hDEOcFBFXlLQ8MkQKJhtDDyLmjkbgmfn6A==
X-Google-Smtp-Source: ABdhPJwXf75mw0tcrID7Zfq+92zXlqa+CIfBNrl9Mxn0sTsCVQtKQyMdB6CUP2mYt0l2YCtQBHdPli9ZUOP2iAlV394=
X-Received: by 2002:a50:d307:: with SMTP id g7mr15679256edh.204.1612782654099; 
 Mon, 08 Feb 2021 03:10:54 -0800 (PST)
MIME-Version: 1.0
References: <20210207222902.29099-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210207222902.29099-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 11:10:43 +0000
Message-ID: <CAFEAcA8tds7OdkyPZTA=2vtvO-_Z4LGB5ROpWN-3Upqsk0T86g@mail.gmail.com>
Subject: Re: [PULL 0/2] qemu-sparc queue 20210207
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Sun, 7 Feb 2021 at 22:29, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit 5b19cb63d9dfda41b412373b8c9fe14641bcab60:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210205' into staging (2021-02-05 22:59:12 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/qemu-sparc-20210207
>
> for you to fetch changes up to cdf01ca4810203e229bcac822b42eba58e1abbf9:
>
>   utils/fifo8: add VMSTATE_FIFO8_TEST macro (2021-02-07 20:38:34 +0000)
>
> ----------------------------------------------------------------
> qemu-sparc queue
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

