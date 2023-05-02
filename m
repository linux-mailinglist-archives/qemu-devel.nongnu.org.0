Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80BE6F42F4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:43:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptoPY-0007z8-KJ; Tue, 02 May 2023 07:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoPW-0007yg-ET
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:43:10 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoPU-0007HR-Md
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:43:10 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc570b4a3so4109206a12.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683027787; x=1685619787;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4aBmh74TWFAPSKGw9M0gRiL7reB7+TWQBABRNo5lGCY=;
 b=mXb3PC8+dVaIiqJcrtbd4AZcQqFq5uIpFmYmy8vCjvGqmRur2t/7punyCe4iWtU/Pf
 Cmcwi6Y4zP/OvdC9Ln3b1xOufQf0kg+qSvA7uAq1fQEAP8YCySMQrRtPeFLNw9//A414
 lF7MWwx6j2J+b8y/yF7z9bTt+yhHEQ/lEvrDcKS6D1RteQG9NxKWhmNKhcO6BP5lF/Ga
 T8m6gyviXC8l/qHXz4RVPNyr22lreleJhJXyzWXOLCPxz9365U9RGmn18cpY0KsezqoV
 /Nk+9qDDK3QF7j2KPzPr/+M9V9gWfhdmDCOFLGkvPGngddYxNXObkNKMYyNgYeI5guC0
 g42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683027787; x=1685619787;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4aBmh74TWFAPSKGw9M0gRiL7reB7+TWQBABRNo5lGCY=;
 b=DoxgpRxhA9MDmEF5KXnV4hVbiPJbKJOMmORIh/7pRKJPg8p5tAk0BuX4+u88n/MJQD
 Bjarwxh8r8H+d3Pe2SnyCSsWDT7t4/zd6Zx+llOPoubrIETlDv0WgRwX9fku1MYi53m4
 WjrJd+wljj1dXnM2vvjVOENWAHJ3z2L31WdbN0MGZy0K5Cj9JyntJwdQ47VBxgpvzeE/
 OJoJFGd6qI5xq+ZsWbhQatnSIZZ54Y3HiftDui/TyLjr13ZIbv2qCDjb7znWRnFegGQO
 1/6UWDcZ/aE5d8ymqo+ICZdttfVXgpnYCVvrLagZXJ0FqxJcNj1pd7Lz6xLCuGSYI1ES
 XAww==
X-Gm-Message-State: AC+VfDx735eopuK4HwnmBHIvEMIel2b1Vyap+88ZQ0l2ozxWJcBBrmzp
 1H3/Ad0IIMV5wIrg7zP0vngMRlEXWE2Gwr2ETRCo8vjPDzJAZvut
X-Google-Smtp-Source: ACHHUZ5nux3zJougRNatVIIo7AziyvfoKxp8AAlYcsUmO33yhDLZTRatKgLzSKxZaBHawYLp8bsTOpxeEDbTMk3Iu3Q=
X-Received: by 2002:aa7:cb50:0:b0:50b:d731:9fa8 with SMTP id
 w16-20020aa7cb50000000b0050bd7319fa8mr547723edt.28.1683027786880; Tue, 02 May
 2023 04:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230425103250.56653-1-dani@danielbertalan.dev>
 <CAFEAcA9vHxxNGp4SC9AYnqCmLZ-a87MeD7Uq6no8n2Vxy9gi_w@mail.gmail.com>
 <vxR7X7H0IH2rUOb1rvzXmmG3_3raS-2LMKN-ugFoq0ziCSX199bwb_i-zZ5_KdhWzllmtwIlvJF74epNBag-Etjya_nhkplFFNGmi6blpvs=@danielbertalan.dev>
In-Reply-To: <vxR7X7H0IH2rUOb1rvzXmmG3_3raS-2LMKN-ugFoq0ziCSX199bwb_i-zZ5_KdhWzllmtwIlvJF74epNBag-Etjya_nhkplFFNGmi6blpvs=@danielbertalan.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 12:42:55 +0100
Message-ID: <CAFEAcA-_a3Qx9UnsJf++9aM=5X_S22yajkA-p4iaXHWScQrcyA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/bcm2835_property: Implement "get command line"
 message
To: Daniel Bertalan <dani@danielbertalan.dev>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 2 May 2023 at 12:10, Daniel Bertalan <dani@danielbertalan.dev> wrote:
>
> Hi Peter,
>
> Thank you for merging the patch.
>
> On Tuesday, May 2nd, 2023 at 12:15, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > Are there any particularly interesting bits of guest software
> > that try to read this property ?
>
> We plan to use it in the AArch64 port of SerenityOS temporarily, while
> we are in the process of bringing up device tree support.
> I added it here: <https://github.com/SerenityOS/serenity/pull/18557>
>
> [sidenote]
> By the way, do you know if anyone has managed to run the raspi3b emulation in
> EL1 (under KVM/HVF)?

No, that's not supported. The only board we have that works in
KVM is the 'virt' board. I guess in theory it could be bodged
into working, but AArch64 KVM isn't really intended as "run
an arbitrary guest kernel that uses an arbitrary machine and
set of devices", it's more "run a guest kernel that knows it's
running as a VM" (for instance there is no way to give the
guest something that says it's a Cortex-A53 -- you always get
the CPU type the host has).

-- PMM

