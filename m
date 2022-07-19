Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C845795B1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:58:48 +0200 (CEST)
Received: from localhost ([::1]:58236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDj43-0007zH-2U
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDj2X-0006Dl-N2
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:57:13 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:41501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDj2S-0003PH-KB
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:57:11 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-31e1ecea074so57075627b3.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B00G6w5Ym+38OytbdVuDnmErD/PRsy0rwQqZkegjztg=;
 b=YSOXi/sDiGtjcQlFvEFrXZmWS51D30jyypZixxpATuCDZRmcqtrbTjyweayqQyyL0P
 zcsgZP45FPR5kVJnpWLV9f8/P4W0v8k4CpR25WicvkJP+3w/gE+0AIErRQQw2SsIbEAJ
 Bbp3oeCtVpu+pD6A4LbVCVbMIDK13KooALysrm2KdL4/QCiEm/9yTi6yZ2svKMg121u3
 BvOGNbrgLTtZlQawpSKEP4qI10esk+OOxbR5XGH4DuNAYtFnQXRI7lK8WW8T9DXNNyLz
 s2J/O68jszmzcRrxHFdr7BmSSRmttDrVNL2LyPYBz3B0IUd+565G2VTfsD2zEARGSDIO
 tIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B00G6w5Ym+38OytbdVuDnmErD/PRsy0rwQqZkegjztg=;
 b=jkm3fwS09lgPB5zb9rGYO0BlPRXc56o79qfkaiyX/nKl1RBD0t+NIBiukyfaZjJF+G
 EK7+ZvxyPQrTedN2pxNsHn/cDa/nh2HDwpTYG0Vy8/nZWvv/K9y8VQf+rvNaPhzERlLi
 qwmZPax56bPszT49jeqlxWAkEeZeMJirR6arly+rS1djyOJeAhdrpOkhcErRoQmPDr95
 CP6AGxsNiTJOPeRviAh5h4md5gnhnCMbvcTdl8VeVKUaSEgletO1XVT9NQGGalPC4Tsu
 WY82wBvbgXYgYB0SM0J+SkDUcEEsWwid7CCjwQduwr6mPE6XN0ZQalkgUtjlmmtO+UWG
 7WfQ==
X-Gm-Message-State: AJIora/wq/cTef0KI/ejkGu4iN5A9g2x0OzBdk3dq82DcOOcFKaoi8iE
 dHnK+Vtntjm1ZZT0J1nl5dvEt4AthgtEHyyXiYETug==
X-Google-Smtp-Source: AGRyM1sP1gfZtF9wAJsLGvDYfJO0i7H887ahtRLdtyY//yeoFhW4XYZZzU9pcHjT5Zy9e7GNCmvsgo6pDwzEBBIcG4A=
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr35278714ywe.455.1658221027418; Tue, 19
 Jul 2022 01:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220718172208.1247624-1-danielhb413@gmail.com>
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 09:56:56 +0100
Message-ID: <CAFEAcA-cscBc16nShZwU_VLawA8wrz5ddAEAq2vHtZWc+bBNDw@mail.gmail.com>
Subject: Re: [PULL 00/30] ppc queue
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Jul 2022 at 18:22, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> The following changes since commit 782378973121addeb11b13fd12a6ac2e69faa33f:
>
>   Merge tag 'pull-target-arm-20220718' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-07-18 16:29:32 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220718
>
> for you to fetch changes up to d2066bc50d690a6605307eaf0e72a9cf51e6fc25:
>
>   target/ppc: Check page dir/table base alignment (2022-07-18 13:59:43 -0300)
>
> ----------------------------------------------------------------
> ppc patch queue for 2022-07-18:
>
> This is the last ppc patch queue before the soft freeze. It contains new
> TCG instructions and changes, a tricky bug fix in kvmppc_find_cpu_dt()
> and other enhancements/fixes.
>
> - tcg and target/ppc:
>   - move instructions to decodetree
>   - check for bad Radix configs
>   - ISA 3.00 tlbie[l]
>   - fix gen_*_exception error codes
>   - check fortb_env != 0 when printing TBU/TBL/DECR
> - fix kvmppc_find_cpu_dt() returning the wrong CPU DT path when there's a
> 'clock-frequency' property in the root node
> - spapr, e500: pass a random seed in /chosen/rng-seed
> - all boards: allocate IRQ lines with qdev_init_gpio_in()
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

