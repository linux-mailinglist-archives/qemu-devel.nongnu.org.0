Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FD56D9383
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:02:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkMRO-0002Y9-HC; Thu, 06 Apr 2023 06:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkMRE-0002Os-Kc
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:01:55 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkMRB-0005BK-JH
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:01:51 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-4fb2f8d7716so1144944a12.2
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680775307; x=1683367307;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jGx+MkLJxmRsf5apDgfYxFbvXrsNs8gdt1KDvUXbYa8=;
 b=cMk6BzllFjkF3+5fpLt2Td4MEwvMCMe6zg2y4Ssh4B+89NObbB+ZGAf0h5vckIlc0b
 C4XIH15JImybNoqesdmkiApflfdeN+oM7TAiY3d5mi7eobOSrr9OkKr9yAquziNg6qYt
 FxaosjzXIJfgIjczexr6HgT1cPfK3aRoWjmm0O4qrFFhAyrH4UqUXsmndNF1apjb+OUd
 e2fR3rtZZYqhhknbRfpyXimOJZzZh4hvy62G0Lk6k18ey35nREdthEkmAh4NQdjDv+Gy
 QsK5NqevVPWeiWRzIP2DkT6JdG18BCTo52I3FilZ78yge/aL0kJnUg77J102URaSL94L
 mKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680775307; x=1683367307;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jGx+MkLJxmRsf5apDgfYxFbvXrsNs8gdt1KDvUXbYa8=;
 b=7ncaoNaGsxj83PstNEcbSxY3WgssFGRr9cEVlAze78aP0GcBnzxmzJAjO5slsPocv6
 3uVaepi4pb3OVQBes+jvAlB6tVdo6WEerQ1/0vTOthOerFnAtMF4DerExpkJEE4tBATk
 2jjIqPQmpv5gE2OjZvonOfHb5t5zS6zOKtJmbYKSh89Y+aOKmiqJMipH+fHtyAC1hXg9
 qvkJK58+hRgWcq8Y811jHaqNRzf/Fk7C0/G6BqatCSCa4yEXE9Rnu/sn9XwzpocwrQY3
 LILmH+dNaH7g7smtKtqLFtE16am1zWqLnIy4loeYOGVh+Obn8e0u4RWD4wCcRPmRKJne
 ZjGw==
X-Gm-Message-State: AAQBX9d4kcTeFmMCms6AF9Aj8GAH8sH9jlP8no7q6c8knlCf4RTD0RgM
 4eTZaDPk49fHPrBEF6EdrXSc7DiET+hxBBi27sQg/w==
X-Google-Smtp-Source: AKy350ZZRvdPcY01/Cq05bcYZBuV7HUFRBVFo4M1daqMGivOvbuUK1vnu2tkW1rrirRHCTiKMyDq5BjFfCPXUMxIrbE=
X-Received: by 2002:a50:d781:0:b0:500:547b:4e1b with SMTP id
 w1-20020a50d781000000b00500547b4e1bmr2846881edi.6.1680775306886; Thu, 06 Apr
 2023 03:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230406093157.104145-1-jth@kernel.org>
 <20230406093157.104145-2-jth@kernel.org>
In-Reply-To: <20230406093157.104145-2-jth@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 11:01:36 +0100
Message-ID: <CAFEAcA9Qu-dtjrKDUyT0UMg40EmjBHD4J3GLzQNhPkOhATN2Xg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] Add MEN Chameleon Bus emulation
To: Johannes Thumshirn <jth@kernel.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Javier Rodriguez <josejavier.rodriguez@duagon.com>, 
 =?UTF-8?Q?Jorge_Sanjuan_Garc=C3=ADa?= <Jorge.SanjuanGarcia@duagon.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 6 Apr 2023 at 10:34, Johannes Thumshirn <jth@kernel.org> wrote:
>
> The MEN Chameleon Bus (MCB) is an on-chip bus system exposing IP Cores of an
> FPGA to a outside bus system like PCIe.
>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Johannes Thumshirn <jth@kernel.org>
> @@ -0,0 +1,182 @@
> +/*
> + * QEMU MEN Chameleon Bus emulation
> + *
> + * Copyright (C) 2023 Johannes Thumshirn <jth@kernel.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */

Really version-2-only? We prefer 2-or-later, as noted in LICENSE...

thanks
-- PMM

