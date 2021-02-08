Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4323140EC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:51:07 +0100 (CET)
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DUw-0000LE-G5
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99ln-00031I-C0
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:52:25 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99lj-00084A-Hz
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:52:15 -0500
Received: by mail-ed1-x532.google.com with SMTP id z22so19080930edb.9
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 08:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gH+tlT7ntK/krzP31qbwxm9FnsbagvS8jMw39i5JdlQ=;
 b=ZzvokyOqQ4YfxAhgpYAERpyvqZ1RlBDlCK/HnhxyhsqZos93TOscEN5a0zqFJWpJOp
 lrVXGh9M6CXHva42z+DHNVWMDeFRRT8XLViTDyN6IfGHNus5DRrKiPmQ0xH29qPtTVIM
 YK6bWwSN8HtX/zL5FCWwr2G3wKaZi7hamDKSDfNABmGqegOm6iTLrsPNnYDkB33P2x6e
 ouTRIpJ8xZsOV5jwQnLgsQuKGOByOQMVmSYucouDwJZZ/Xb9yFS1O4a9d5RI4ROlkvXf
 F3PvEzm/WfmUZGR3Wuc0RvaHe/tpw7bfirhl6S/mJzy3gi1si9KXYWxU8ZB0tCGAswkH
 7Nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gH+tlT7ntK/krzP31qbwxm9FnsbagvS8jMw39i5JdlQ=;
 b=NRSrZRat03LxqYqPS1UJ61EFQt+JS8Q+5U4ghS/SPgjtOlrGbrNLFgf2ezJ/j5caHc
 FH/AV+wAwyVcfx/+ksBdpbD+R5plwj1sCPWCASJA/ZlG213zggyUcOOf3wzGaqEZ79nS
 A3WrFvKCV2XbaBAACi1xyLZpkF3gdQiTXF4L6n7y0No/PlG9WsHBFHSvrDj16pE0RNWv
 /alGXAEj6+grXkJt9+H1sa+bfaRMcRP/eCgQqyLbq7LHhRsfLiFxSCIaK6axQcDyIJmy
 sUwwU6WUPNPWsQA0stFd4D/cf2x88W9HsIBxFqmbHquK/igUwdFYecBXYNpDEE4N7eGv
 mzsg==
X-Gm-Message-State: AOAM530LZuxuKP5oe0tIVITc/HHDUhUJ9xCcWCW+wblx+eHvRsLLQG5x
 5tr4krnHX77bnkEs4kKu/KXTJ+J6QHF5n5dJswHCxA==
X-Google-Smtp-Source: ABdhPJzn4Yotf7dhsNYamY7NIJSFjmsdYr35BfenI2BYbrJmGhRfRMVUAyCVZeAr5wx3JasWz/rxY8V5ie5wqKrHfYU=
X-Received: by 2002:a50:d307:: with SMTP id g7mr17078522edh.204.1612803126885; 
 Mon, 08 Feb 2021 08:52:06 -0800 (PST)
MIME-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
 <20210129005845.416272-6-wuhaotsh@google.com>
In-Reply-To: <20210129005845.416272-6-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:51:55 +0000
Message-ID: <CAFEAcA9jfSaYiF_BYNo3Eh3dZvbvZy+gWDDHSLa+woBtFST+Xg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] hw/i2c: Add a QTest for NPCM7XX SMBus Device
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 01:04, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch adds a QTest for NPCM7XX SMBus's single byte mode. It sends a
> byte to a device in the evaluation board, and verify the retrieved value
> is equivalent to the sent value.
>
> Reviewed-by: Doug Evans<dje@google.com>
> Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

