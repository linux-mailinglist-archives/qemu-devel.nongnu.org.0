Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6BC6F82A1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:08:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuED-00020y-SN; Fri, 05 May 2023 08:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuE7-0001uD-I3
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:07:55 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuE5-0003uy-9P
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:07:54 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bc3a2d333so2562276a12.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288471; x=1685880471;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p9PE4FJ0jA2F/7HzTPSy9Nl+g41niveHCq2SmQngHJw=;
 b=toCwEcBpcgznIvluG75IaXc21e31dkk2dhDH/BmSuaT9MCPkXZ4cryBg31RS0IhyCz
 y9MPG/MM43JArzFEQb9vGN0T2I2DvHS9R2pjP9Pd4oAikI7A2TCqqCMayyLsD6xPbVsi
 Fc2pRyypF5NF1WG7fl0woqZboLWo9yCtkP88KcQJR/UWNqWcA+9kaPd7/6Rn4NtLson4
 ZL9eiIGLQCLSSaWJlypva7wIMoDeWYTQIr3vU2tK+lBbekCjHFZpz06GV1OZM1fbkkUS
 O6a80gv/DI1ksLpSSfH1cEaPc1imfmVsDAZG3cLR0Xu9Z5JeTFQCKHw0aVklgzaatXqP
 DUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288471; x=1685880471;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p9PE4FJ0jA2F/7HzTPSy9Nl+g41niveHCq2SmQngHJw=;
 b=LlT3Gcih2yrBdXOtYXCvoIGOTqXp4NJ4fe4dDOgwGrFOK/3zWv7igobeMW6e8RO7z6
 1dKeoF6A17DZeLZvEAhgEojWn1YggwRytkPZO9NTIT48uxQ5XOMnzGCaw30QDBpZ8GON
 hB+ZK6g8SCPCXTWPsw+6yCD/LYBAktgl3VCzNRN7ozIUupRsTw4+1ReB/2JfxxrHMG/8
 jhOKXcowhEOizYxK10GfWtunSsFHGMp8xxkJjliHLMsJuzweQ8tIO5xE6ZsYJaRM08QR
 5zz74bA4hjVcLkueBXGkkx5jS24Xtz48ertZHJCVpY7QmVgQ6FHWo9M14Te7XP0ZOZwi
 RSOg==
X-Gm-Message-State: AC+VfDxE+k3v81yR/R4za1pJQ4yh2YyQRy5xcULBrgNQnh+sF5DdBAU2
 JX9tkQxZMDxdUvlqUKelNvdU9HgnMlmRoB3iaWJZNQ==
X-Google-Smtp-Source: ACHHUZ6ycNwUU6FZZQsTUBIRzrQ60zMtGvjekW/pniytSxbWsfbBPnPx3gqF8EDOC9xspJH+inZ37erHI3todzQkF00=
X-Received: by 2002:a05:6402:31f4:b0:50b:c370:4967 with SMTP id
 dy20-20020a05640231f400b0050bc3704967mr1447655edb.19.1683288471040; Fri, 05
 May 2023 05:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-26-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:07:40 +0100
Message-ID: <CAFEAcA-Z7m+jP4NnDf-yS_junBx7PMY91rWgWO9-1qFOg4s4Fw@mail.gmail.com>
Subject: Re: [PATCH v4 25/57] tcg/riscv: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Wed, 3 May 2023 at 08:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

