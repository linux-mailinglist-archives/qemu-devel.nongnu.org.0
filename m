Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB6A2BB0CE
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:42:17 +0100 (CET)
Received: from localhost ([::1]:38978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9UG-0007s6-JD
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9SW-00065y-3Z
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:40:28 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:40393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9ST-0000oi-SD
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:40:27 -0500
Received: by mail-ej1-x641.google.com with SMTP id oq3so13733522ejb.7
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/eGltTOKyfKvrChaf2BpxhfQrvDgPj4R/DA6RZ4a4w=;
 b=co0u2cLSQKoR2/vZ0ZwtwhLzJPoGXksZBsHvV8ZQ2TSqaOmeCL9JlzjIqi4vxKs6QE
 tGHPCe6UATmZzKauisZ1n+Gam8P9V8A8rsgyZSwXBWVGzKebfdGeDxoD+m97syySrPPP
 Nn0MBsTo6mkkP/s2zIjMfT01tNoV490kQwSmAP/ZVQeoc7WI37IS2NsWVxu0SydsOXzN
 Vu/c/Gk32n4bKigL7H3f6Vm+PM1J3htT817P3fOLTfgpEjb6dJPx+opprslwnV/0AUJt
 qlOu8hxR+okMmZwk+z1DRFjkCIuTcwFjUktpdEc4Rd+YzDaGUfP1IDRoD+5QRFZazDwV
 I3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/eGltTOKyfKvrChaf2BpxhfQrvDgPj4R/DA6RZ4a4w=;
 b=dC/WkXBUsQ6LHmg2VzJO82qFCIFHC6hJ9M9X7WrjsMErh5r4BF+/PegFiXGxozPiFQ
 ejaoWzhS3T5D26SwoA2G23RaPTt+TfJ+UTlKSWO5QjHHmfXH0fp5xgy46JjhU+0cE1kK
 Hdh76bmDLi9grmKnY9K9uKIZDbgq6Msc/ZSidWaPS+jZaiHB5ZHPJdVMpZRtpvb3W5WX
 oc0UrlKJiBjiVB6vQ1Hep33udUqTZ/MLdB0eOzi4CWCI6Gy5wr3T3oIOK4mP2gPzm6nI
 iUm9sZIVRgrQxqN+yO2hBC5wzaN6Hro+h3Bxy1jARw49CfWZmNTti5ShFA5k/b6nYjNO
 ZL5Q==
X-Gm-Message-State: AOAM533Pd45v0MWfBHr/gfwX9OdbsXamGA1HVUAKlC+MEMisR92PgmfB
 c6RKV6xfKM6Cwl+s/F9ym1TjOWjz9ucQAjrPm0KE85D2Jes=
X-Google-Smtp-Source: ABdhPJyqQtkWhwBK+kxEw0pqP0S9jdxaoiCsk+OuA4aVIjFhr4Im/UhqB2zQDPbpzVGv4q048plvkzlKX2PoQzby0IY=
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr33051933ejb.85.1605890423353; 
 Fri, 20 Nov 2020 08:40:23 -0800 (PST)
MIME-Version: 1.0
References: <5F9FD78B.8000300@huawei.com>
In-Reply-To: <5F9FD78B.8000300@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2020 16:40:11 +0000
Message-ID: <CAFEAcA9twgUD_xvHz3eUMznP69RVHYL1vZ4wBRG53vaUi6=Hcg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Fix bad print format specifiers
To: AlexChen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>, zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2 Nov 2020 at 09:56, AlexChen <alex.chen@huawei.com> wrote:
>
> We should use printf format specifier "%u" instead of "%i" for
> argument of type "unsigned int".
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/arm/pxa2xx.c | 2 +-
>  hw/arm/spitz.c  | 2 +-
>  hw/arm/tosa.c   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)



Applied to target-arm.next for 5.2, thanks.

-- PMM

