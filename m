Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477046F70FA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:35:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucq4-0003Bu-Hy; Thu, 04 May 2023 13:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pub89-000667-GF
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:44:29 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pub87-0004IP-P3
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:44:29 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so18496522a12.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 08:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683215066; x=1685807066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iIpxPPCGn5q4P6gM9rBx3mfBXwTmnjji3/HoVk/CHVk=;
 b=YZX7NjTtuRuW0PHT6NYHwI2cpi2v/9FVFGGZsH9vxX+Px9/6NeaiYC5pm/kOMTJLJK
 yH7JyHctqFKTe04qk8vovgtJi/xtnn5H/4HRTaJPxQkw80HIKzbVIyfh63VJgW4Lw6RQ
 X5p8+pz6hjlVzyv0CGKfqPkYYdi2a26itR8uz/0FhyVywI8LnWthP1nCkuRtFlw0mOoz
 3w0jwunP+OC1SzS6gO+sirhh69Rpejx49KURF36AEqA8gKQBuOpkQNTPqxZZd/gq/67r
 olroA23buRP/7+7IRFN7IhTOChzRj1XypFF3kZzwSJsL+uxwqMRqc3zl1KA9AM0FuFyx
 B5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683215066; x=1685807066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iIpxPPCGn5q4P6gM9rBx3mfBXwTmnjji3/HoVk/CHVk=;
 b=FLHuiIxNqlaxxAmKP5xmQiauvJp78fSVZUPHbumT1f5IvZqZOdVEM6tCgEkDD+++Dk
 5H8mXihO0f5Re6kHnkVQWAj/sQUFr2zOR0aiC0UHsto9MUFsSKsR5cggLtVc7WofGRhb
 9NbT/s1vRL90pDJrq5kklKog8zSehdJ8CWvPFJUYyWx1CVK0I8ux8Ljt8FGNKWk8mtum
 K5L1xHkecFPsIzU42u62vPVZR3XDG42F8MYaSBNGNg8kkW8wmRtjkDJDHADz8nsqhAPW
 za/qwSFhoU0iyv3sqEO6qTR4JvH886Q+d5sHIxNdTLT+Egyx0PnzFXm4CrlHdkGHgpqO
 RW1w==
X-Gm-Message-State: AC+VfDwgDbTw8E6WGdwGrFRT7Fxvj8tPQl1cKtdgSsC4vr5+Ki8mB/V4
 Og9Xs7JZQBodu3ju6dXN5jGX9nQCvjPgFkuWKfuLlBC4ddEAfT6u
X-Google-Smtp-Source: ACHHUZ5vVQAWtpxTBsS0yDud8X3Od/9iKx98WuA3C8BVBSoHUSa9eZ5cmDeDMiCBgFwTwFswyxzeXzt4mYFf0K6oMjc=
X-Received: by 2002:a17:907:1c97:b0:94e:c40b:71e3 with SMTP id
 nb23-20020a1709071c9700b0094ec40b71e3mr5504940ejc.5.1683215066393; Thu, 04
 May 2023 08:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-6-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 16:44:15 +0100
Message-ID: <CAFEAcA_ZW3EW1L6rCuhDjpaANhkaNvAbETWaaFFdvJ2V88aOSw@mail.gmail.com>
Subject: Re: [PATCH v4 05/57] accel/tcg: Reorg system mode store helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Wed, 3 May 2023 at 08:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of trying to unify all operations on uint64_t, use
> mmu_lookup() to perform the basic tlb hit and resolution.
> Create individual functions to handle access by size.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

