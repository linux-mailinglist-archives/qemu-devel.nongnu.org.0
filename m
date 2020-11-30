Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1872C8393
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 12:58:37 +0100 (CET)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjhpE-0007wD-Lb
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 06:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjhna-0007A4-Nh
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 06:56:54 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:38068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjhnY-0001Rl-NC
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 06:56:54 -0500
Received: by mail-ej1-x641.google.com with SMTP id a16so21257489ejj.5
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 03:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J7TdQWFyBiJllZLrTMcwK1fWX3ABOvJIPpciwspLNbg=;
 b=XmZm94vtoL0Yw4OgDupcNaldUdTPQlHNukSRz+/0pckyGIUKYVjJNn3K9+nz2jK5zJ
 sG6DojnjRp1dqHX6X0F9CSPi0rEriVzcztWneOhqz6NpyJrH4Ue6yIQrlBYXDg6srNhU
 8jUDwUxwBX+7a4Gd7JPpwCUKtagB7kSbGtzqMAlx32F5PyM0V5t8HaSQJuVHbo5Rauha
 mxsnAKfaVpedQu3hwidzUHTGa4ktmprsqSk1+BvtCRPGkCtDoWcwjvyieqGLVKypV/a8
 hNIPmnDcVwzPb6c1TqdwaFIZhbUPzfoO1PHfjjKk4Dlk5GDOvKxTHRfIAxDCB3tofd1D
 OUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J7TdQWFyBiJllZLrTMcwK1fWX3ABOvJIPpciwspLNbg=;
 b=FbFiyBFhipnkU4naMYF+oIkVMbtXpbQWT3xM0Seihbp937OtF8ODQM6iIyC9GvPHqq
 HkL0byfHw5MBsyKFpFZWp0DfRMe/miZRzFs3nvmQ9UX8h9FzBHDfplbilGjJQGd51Q66
 aKUXP/5FUhJ1u/Ta/bk4LI8uzSN8WIyeCjUUCkxUCK2qFl+yo29YrhpFUNz3Wb/OPaOt
 LLeoJr+oqotX+TGODYM+8WVdYgCaLLKdYd40HWt4lkkf5VBCZFEjwBspRDMNx05XAuF5
 NC7MiUhvIAMYtFtYdK1jchQiNXS8DcPl0v1HF4f34L5vdP1gQ7p/0Bkf449DZidvja1c
 VEwQ==
X-Gm-Message-State: AOAM533nSqpsO8ZNtL8zc4gBo6RqOsaVww/sLqv1W4u+O+fJR584ik51
 wbTSMHiCx7BTUKCp5cOs+twTdxJEpuamFX5de+64Yw==
X-Google-Smtp-Source: ABdhPJy5G/weFdKmp41d0VWhNpK6semr86atxkgFWcywFPmrL1ZDHIlepKigIk7UBY8OZ4pGN0dcnRtw/Li6qx4BHqs=
X-Received: by 2002:a17:906:4bc6:: with SMTP id
 x6mr20919183ejv.4.1606737411120; 
 Mon, 30 Nov 2020 03:56:51 -0800 (PST)
MIME-Version: 1.0
References: <e79639f0-041e-d190-c895-0e1f24d64102@linaro.org>
 <20201124125912.1108631-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20201124125912.1108631-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 11:56:39 +0000
Message-ID: <CAFEAcA-ZPvnf686NJEK=+A8pTZkEtMwiK2yuLz-Snha4r_92Hw@mail.gmail.com>
Subject: Re: [PATCH] sbsa-ref: allow to use Cortex-A53/57/72 cpus
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
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
Cc: Leif Lindholm <leif@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Nov 2020 at 12:59, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Trusted Firmware now supports A72 on sbsa-ref by default [1] so enable
> it for QEMU as well. A53 was already enabled there.
>
> 1. https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7117
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Applied to target-arm.next, thanks.

-- PMM

