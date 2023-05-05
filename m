Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925D96F82A0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:08:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuDP-0001Cr-Hn; Fri, 05 May 2023 08:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDG-0001Aa-74
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:07:03 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDD-0003l3-2J
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:07:01 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bcc565280so2547411a12.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288416; x=1685880416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4Q/M6VkiRnc2u13pK8vm0RS70qXwvGYHSr84nhT/9k=;
 b=qCrvOz2yM6Yvc/27Ca3lvvqoJtZ8boRbw/nPBLetawCiL+oNC5/xNlxkWpWlzpP2K6
 A61O8wcmjsUET7pC1tWH7fZownT7Yfmh2KHjajpKXP2CYB9+73gzE3dXdAbhxFTjp7Cv
 sUEuY5d+8aiKdKN2L2Ge7rRUUOE2slz18kse0JpQ+BXvYS8iaa5mXWersJHBED6oK8Et
 lkVS0xCNuyq1ECjhf9lPPvDJc1Mo6iZQu5/boBshApoEElOqkyXdJCaDrUSwKKXQF9Tw
 0rpWKx2rVHm6208uwnVMmX7kyTDTBY8d9B1mC9xCW4PHlXpMxZrOqAhJaBR8ABlNHsEN
 g8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288416; x=1685880416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q4Q/M6VkiRnc2u13pK8vm0RS70qXwvGYHSr84nhT/9k=;
 b=g/sHU0Hbr8ThL+RgLEM2H75UdiqKnz7qjxc77c2O1opjV/sDXoWYx0nBrfBL0u+JCO
 FRkcfvCKKKU9kkdVqcAUyzh8tFeu3g0TCoSJ2iodWelEcVhcmNsMhrwo31rqJwURdzp8
 GuXiMgejtEkRav9sBWOY1S/W6m13i+GaOmcPvLzn/6l6Tcg5NOOliAf0sMP90/FAtUxV
 40aYyi+gZi5fHy6PV+CWwASqkOyjWGKREEvsGOI1dCJDdfdspfMgs9o5PN+zVOI1VvNo
 +8Gp9bXZr0Cw5AyPg0AfUaUxVaFA17qb2kbNDnx/R/dATJXx9Tj4KDwktzsnFDfUtzK3
 WXmQ==
X-Gm-Message-State: AC+VfDxsUOekbtVRjajhAt36pA9NrZh6Mh+WQd2Xa7tbPYrEJ+/e/Tet
 iEY/1qWg6wMChXtPrT7oIIlTxg8/eTGx3BkUq2OOeEiXdFg2YTWX
X-Google-Smtp-Source: ACHHUZ6YmfAbS2DWLZdyFpGhdG9ShQaHvYqfb7kFJliPX4REGVwRXdQCF/2eXqWAiI4BTKrQpEt1uPcrDdJFuVhdu4I=
X-Received: by 2002:aa7:d408:0:b0:50c:2215:3193 with SMTP id
 z8-20020aa7d408000000b0050c22153193mr1405048edq.13.1683288416187; Fri, 05 May
 2023 05:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-23-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:06:45 +0100
Message-ID: <CAFEAcA9ffNOA9oKV3e7PbecOzu7yyWAs7ecqKbNrTHtiDKsGTQ@mail.gmail.com>
Subject: Re: [PATCH v4 22/57] tcg/aarch64: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

