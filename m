Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7533371DF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:56:31 +0100 (CET)
Received: from localhost ([::1]:51818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJvb-0007RK-2V
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKJul-0006ZP-0s
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:55:39 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKJuj-0006bR-Eu
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:55:38 -0500
Received: by mail-ej1-x633.google.com with SMTP id ox4so30026700ejb.11
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 03:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ngoTJXYonkmZMmfjgy+YZG5PZCuSFl953vdeTF7axBs=;
 b=aUG25z0GYO5iKLOi0WH3QE1eMjVOPf3cdsgnKHWtoA9qi29ox8nnz4o5Z4DlTprCdd
 0+X0q1QdfZ2t1ceqqd18emww0/zr/a52YijAWaDbNHF3VGnBIWRskLPjua48oAJCIxtq
 jH8LHdUFtX6gvj9/YMESPd3XvkXwEFbKFLs83Kp9k1LRPVsCp6NxXr5BZLMZ4BKPf/7b
 Anr7DT/xQZ18cTm2q6/F2cGqwCsYdTOv6rlccyzFELplcY2yRWGA0QArerLREHkAGKJ7
 1WTWZ6hFdkGWq2FKLdNgWyhprpgl/QwbSPg2IRoqZToeGTGTU+kt84BDDp7C9yb6ig1I
 RB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ngoTJXYonkmZMmfjgy+YZG5PZCuSFl953vdeTF7axBs=;
 b=RtKoDNROC5j4Xuu+t3usb+em+/Z3Y6Pk8W19dmHkC6V+KUbdCeQy2GiC2pCVn9T8dW
 fvoGy4TNJuws0Om3eQiS2Z2LZX3Xb7ikyZvaFUtMfdWnoDVuZnt38LlKJ9Jl8CJcsEx0
 3QIPXfj1TCh9ec33Kz+1WxNgjuclZVK3YnuwZ8cf60ihvUxa8zgmXglZduHSisFL8hxB
 mRlUB7t0jqPIfK6ZAA9PVWChwyq0Bqu/Rrjnj0rSo0doMWkG4CYoH8Sq6U/U/+F0CBla
 jdYtfpYtkmXCE70ekiZE769rTZuPa24yvwBZ8UkLRfdPzs8FR+/9cgFT/UiJnJH47n9C
 wCCA==
X-Gm-Message-State: AOAM533w7LVOuXRxfJjPBZNO4uXiIM7BQmeaae0gQQtH9MKE7y0vA03e
 hKnhMGCd7cwmpezLyxzmTsF/0/7dVJAlu/Q57oSb6A==
X-Google-Smtp-Source: ABdhPJzsKszDX7OdaVMvtRcWQhRBtVDHONJpO8Q5ockDF0ZLDPQMtAIOsrkF1r84BWip80V1Ljj9WzqrQ4IeljmNA54=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr2703960ejj.4.1615463735220; 
 Thu, 11 Mar 2021 03:55:35 -0800 (PST)
MIME-Version: 1.0
References: <20210308224637.2949533-1-edgar.iglesias@gmail.com>
In-Reply-To: <20210308224637.2949533-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 11:55:16 +0000
Message-ID: <CAFEAcA9oej-fc_hHsXCNQdikRzANwNEANxFqyK2LBJ9KOsGUbg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm: versal: Add support for the XRAMs
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Joe Komlodi <joe.komlodi@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 at 22:46, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> This series adds support for the 4x1MB Versal Accelerator RAMs (XRAMs).
> Most of the controller is dummy, but it's got enough to make firmware
> and some of our test SW happy.



Applied to target-arm.next, thanks.

-- PMM

