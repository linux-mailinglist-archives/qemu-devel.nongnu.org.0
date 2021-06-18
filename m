Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6643AC880
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:11:17 +0200 (CEST)
Received: from localhost ([::1]:57926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBT2-0006oZ-Do
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luBRX-0005fE-Fz
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:09:43 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luBRU-0004Ph-8t
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:09:43 -0400
Received: by mail-ed1-x52c.google.com with SMTP id df12so5400462edb.2
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 03:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QemU3WuO9xHB+LNy4EwIuYVFgPa+wpVEi3B2glLpiRY=;
 b=YVj3q2hzTT79p1wlY+jTipnLmsghk+2RflVWZWGuvylfFl8bXbbdAX2vxxpcV+QalN
 yZB1rk4ByJIQt0yIV6c5KwcX0flVDXnxwkaf8V6+yaXC8opq9iUfOEjrX9QXM/mYPPZt
 vPe/eDIw9WzP+/co4YwEt8ZZv+JOuk3qSNKhdEMPhKR6NT8BalLwasas/aHQSEgILGJ+
 /o5TFfjVhnCIHfOJmzlNb9+4h5bTbPIYRRZ2SXckIw8RDSShsxNLySQbXPIpUOnXJvnX
 5hevp/8Hltkz41ISHSI5V5ZVTOJmwX03DhwYB1rSXl2miO8WbTN1sS1X26k4lVQVTbqs
 z/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QemU3WuO9xHB+LNy4EwIuYVFgPa+wpVEi3B2glLpiRY=;
 b=o/8PlBTSlvgefSHADdIwlZwXduMaGWkZgAgyTNyjF5sqLStxM4J13XTGQk0JtL9AkE
 auUsyxPpqFUIU1p5nnEciChSoQ1XCkYXZw9AwJLfDZYFi2qnse7t8wFZX5rwZKmKKMUB
 KaVQ1uvsyS6ykqG7TfWshwdh4ZCRvmomfUV+ptJSJbqzKX6+efffCg0ICzmYU1/iC18n
 QBldrvoReGhjfrhAHaaHusM2+kRsvD+fq1pIElDtRRtVJX+Q/3UZONX5FzLCfLrgsQPZ
 0k9BiWnJLrGidbHF1mYu+685kcy/Dy2PYpg16r++9id9jdgOaVP38tw+JOKIe62+36jP
 Yutw==
X-Gm-Message-State: AOAM532LgqRz3sh715SaqCJ74Lp7OFOI9KNKRtlWmEOyxNjX7jC+P29T
 CVTG+98VTUs96zsipOUtegkLq928kZfc6cd2WWvYZA==
X-Google-Smtp-Source: ABdhPJy0sA1EpilmXmfpc5FCTuBl8B2/TuRG9u8nme2sPMGX53frfFlJBM3GC1aSBdkl42YM4cEL/9/f5/BVw4SWTAQ=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr3856445edt.100.1624010978226; 
 Fri, 18 Jun 2021 03:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210615165800.23265-1-alex.bennee@linaro.org>
 <20210615165800.23265-2-alex.bennee@linaro.org>
 <CAFEAcA8t8q8pJNOOYK-zkDtME7hOWfXVUj3+HLVMRkFzY6Ei1g@mail.gmail.com>
In-Reply-To: <CAFEAcA8t8q8pJNOOYK-zkDtME7hOWfXVUj3+HLVMRkFzY6Ei1g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Jun 2021 11:09:03 +0100
Message-ID: <CAFEAcA-OtgCRHPayXBsVZ64mqP7-aJj8+TV4rrLTE6Jh8JcgXA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Andrew Strauss <astrauss11@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Jun 2021 at 20:22, Peter Maydell <peter.maydell@linaro.org> wrote:
> This will pick the first MR it finds that happens to be RAM (which
> could be some tiny thing). You don't want that, you want specifically
> whatever the board decided was the system RAM, which is the MemoryRegion
> MachineState::ram.

As a concrete example, on the mps3-an547 machine this code finds
the 512KB ITCM at 0x0 rather than the much more useful 2GB DRAM
at 0x6000_0000...

-- PMM

