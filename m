Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECB923DA8F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 15:07:25 +0200 (CEST)
Received: from localhost ([::1]:51880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3fcC-00074T-C2
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 09:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3fa4-0004AI-Ty
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 09:05:12 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:44123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3fa2-0007CK-5A
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 09:05:12 -0400
Received: by mail-oi1-x242.google.com with SMTP id h3so19174805oie.11
 for <qemu-devel@nongnu.org>; Thu, 06 Aug 2020 06:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a5VsPjTZL2NDQ0SByYGQq+rFR4fYGfHX+fiU31UUZdw=;
 b=BDs7NszgDlpGPZk4BcsY+K7MDuGLU5cVLI7pqokZxTALypn7B55YSuiyQZWUPs5vzl
 L7PyMC8uG/lWXoW02yOjR6x4eyZy6x19GvJuPDINY8jCrfxwvIZJzWTaChbF+aaNz8lx
 yNwzowFBaNzUFG1xMlzHXSSHzhSrvA4Wm7X8Bjcfwj4qcJ7RUVbLT0Zdcj3t807syr5p
 5/7BfXGOlV4ShdZoD2szBEINk1+/ZGO5Pyk+O4+Wk6d34ADqmdxn1QsNAD36yGZhA0JR
 yKGyVmqPIaTZxfdoCN8PY003GUZ+jpSQ+JjlasHm9GqXpThhiKSbFSpldc9BCypI5sKU
 XGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a5VsPjTZL2NDQ0SByYGQq+rFR4fYGfHX+fiU31UUZdw=;
 b=clm8CAU7wc+eoIn+vJzlx9Jp9OPdFOlYriFaD2IP6VSoiAULIqKj8a+ttagYtkbNOP
 +qW+IuhmDiviIjxW3SPR5PUVx6VugAGOiEP2KaN/+l2wMWzZJY4SWlFKSLqF0UOVaFZT
 yhbXFWEo97z20cHoYOMtmxXGSl4dEekLFD54Ekx9q7RFgV+2ti/viUiOjmOdDZgKykQd
 niqRUIcQg+HUwhSl1UQnE6gD2vtjy7sW9Xhq3CaosEv4aoSlsQBjvGP9MgSFCJcZ7wKv
 AYqyanSWCq16GQAX6vXplBMARPsV0reoERt/tD83b8zcNPOUyD1zDUtw9jtb37Fgc5Gt
 20vA==
X-Gm-Message-State: AOAM530iWieY08x4P9kXpUGIEKc6XPfmRZrWSQIKES5WwUVbQQn5UJZ3
 HeKTRw9tbBu9xaUrPzs/Qck5i96VTruDjath+bQtiw==
X-Google-Smtp-Source: ABdhPJy6Dtev5XGoLyO4ZnNmlr0VbmR9VoU+d7W6snO20kpKk6DbSwplBYtbP9FSR1DFWUcBKDBv2gwRbGH7F9nE9RU=
X-Received: by 2002:aca:4a96:: with SMTP id x144mr6834152oia.163.1596719108443; 
 Thu, 06 Aug 2020 06:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200803164749.301971-1-edgar.iglesias@gmail.com>
In-Reply-To: <20200803164749.301971-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Aug 2020 14:04:57 +0100
Message-ID: <CAFEAcA_ZAgnW4zjaTPUCVHjzWhHeiEastQVfGTP39V0og8u8Vg@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] docs/system/arm: Document the Xilinx Versal Virt
 board
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 Aug 2020 at 17:47, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Hi,
>
> This adds some basic documentation for the Xilinx Versal Virt board,
> including a few command-line examples on how to run ARM Trusterd Firmware,
> U-boot, Xen and Linux.
>
> If this looks OK I'll send similar basic documentation for the ZynqMP and
> Zynq.

Looks good to me; applied to target-arm.next for 5.2.

thanks
-- PMM

