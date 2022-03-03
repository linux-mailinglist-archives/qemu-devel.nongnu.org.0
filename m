Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61434CBD0F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 12:46:12 +0100 (CET)
Received: from localhost ([::1]:41284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPjuN-0004Vi-Lw
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 06:46:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPjsQ-0002oe-0z
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:44:10 -0500
Received: from [2607:f8b0:4864:20::b30] (port=42779
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPjsO-0007Py-GA
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:44:09 -0500
Received: by mail-yb1-xb30.google.com with SMTP id f5so9596001ybg.9
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 03:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C/JQj4MOq+sKXFEjWyZLXtAunHJWj0p9MhFrltauh/Q=;
 b=U35Y89QQ9SopL7Aj0hiyMUkhOYEG2jTHyCFdF27Ex/0RmGIYCRdHi6SZ0TLHgQAakr
 GDCswqgU1gHDlqyG4pIGTB5GS7yZM2VxyvtwLYpuZF5K/sboMa8M4yNWSAuLU2/9TxfM
 8q9y/HkRaQuPFe1Qi7lvlfaZfAg9x3Is6xXDHQrzXsFQjWKebn0DDOpMB6oC3tnKKsG5
 6XfuJOZKmESBYnuQXTY3ccribQY8eW2W2n8snaOfg/CPVE4ST7zpXKjKFh1Aa16ok3jn
 GPLIlcKvRb3Usomv6Td2v2iY4Bvxj0v9jRyn5fr+ZtQPtf1L/5MVH41737/1/JBN7GHj
 xswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C/JQj4MOq+sKXFEjWyZLXtAunHJWj0p9MhFrltauh/Q=;
 b=h8XURGXnZBQ4+J1q019jgWuKB9kF3cJmVPi6uoNQJo9WJrS2PIWZtniGLklkvGtq3K
 OmqZfhOE0YoWIKX1z8+HvOKXrbsMaXZ/JryXAt/DGeWjeC7KzSGn1ks1G4iHO0w45aw9
 ZbL1EnwsBHUVifG1Yt7iBoWRpuCTrwkE0yRX4wmBCaM8in/0m6KfDyZLHZxlqEZWJzQm
 85qAAFo/5OR5dW+UEVCaSLEqjgatKUgqBQmHizJQVOLtRGTbqGq3Ws7kDmDPWFNS/GRb
 CCWYTJwH32ueOpP/4mQ49ubm/id0/g3b5bjQca/KDMYpW+z4XNM2mWMfiiBnYrI4kYzJ
 NSKQ==
X-Gm-Message-State: AOAM530ha34iVnYDXZxVFlb9rxBrLqE3krdZ5zpfJTdFukMcMgbyFd+W
 QYtDSU/vhES2zxpI12B5YPw3zHjdPDDJNvGF7Toebg==
X-Google-Smtp-Source: ABdhPJw67o9WsMuiXzrDrZI0ElqJmRuzJd0Au566EI8HqdfoTBufryei1fVc6FpdUhaDSzlOb8yIuKQd2A+64+XbzoQ=
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr8867743ybc.288.1646307847400; Thu, 03
 Mar 2022 03:44:07 -0800 (PST)
MIME-Version: 1.0
References: <20220303113741.2156877-1-peter.maydell@linaro.org>
 <20220303113741.2156877-2-peter.maydell@linaro.org>
In-Reply-To: <20220303113741.2156877-2-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 11:43:56 +0000
Message-ID: <CAFEAcA9H3Cc+E9G91xrvH-YcD-fJU-84hOekbekca-MOz7d_eA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm/translate-neon: UNDEF if VLD1/VST1 stride
 bits are non-zero
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 at 11:37, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> For VLD1/VST1 (single element to one lane) we are only accessing one
> register, and so the 'stride' is meaningless.  The bits that would
> specify stride (insn bit [4] for size=1, bit [6] for size=2) are

This should say "bit [5] for size=1".

> specified to be zero in the encoding (which would correspond to a
> stride of 1 for VLD2/VLD3/VLD4 etc), and we must UNDEF if they are
> not.

-- PMM

