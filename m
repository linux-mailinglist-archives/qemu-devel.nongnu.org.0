Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1B73C5E9F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:54:07 +0200 (CEST)
Received: from localhost ([::1]:51080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xJu-0004ux-GD
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2xIN-0003zR-Rk
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:52:31 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2xIM-0007h8-2j
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:52:31 -0400
Received: by mail-ed1-x52e.google.com with SMTP id ec55so3578931edb.1
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hJamTPjMnqdzBJnvHR00VSYxGvsukVfOE11A+dzI7xI=;
 b=tnHLglC1H6MvuBvdrjKMYV5I7izreEKOdibOtwbvhomGqS2/pTDzqZWrVF+dGSAGRs
 NEw0sRK30TH1MMJrXk/0k5iscXi5E9wdMB+1S9qpGSKQOOFA2SOy//ZxRqL8L7sTGY25
 T7Wul5I2/6Ybk0BIfc23MaWHrGSNbpBim2iZHCzHXDfRZGOrvq4+mbIdjJkYFaDoemSN
 Lwr/UshQ8CUng7jsGeEz/oZ5w0IXpvhAc27/UkyZZXAT7BxTbnSc8W8zbtGzONlth26n
 nSs/PvWEzkGwSKSr/UiV8pkDTYNY3fLwr6mtferbvEIBdRompjAaGnnqd24hrbxRhCHn
 X83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hJamTPjMnqdzBJnvHR00VSYxGvsukVfOE11A+dzI7xI=;
 b=SGLtttJcJ+duTfGYxIp2INEE+TZdHL2TH13PhXb7+4CoA1cF7HDGng5QWXcwVa3XZf
 pHnDiixjqWQEvcq+kqKZ5B2USuJk6bf/NNAUBMa2IirdmY50zB5VdLZAIpNiLkxIx8lD
 TXv91Im1A63Ss3H34vo2ZuLywlMAIT7BmMkVZzHMqjrcoi3bhvq5hViXM+65y6nE7i9D
 vMO6vpkPFmWTd423xmjbiQE1AAJNvpR2lUfQz7ak+SX0dt4oaHILJ3vePPeM+ZHwU5ct
 mxmR/DtmBFDTrmRZfA5bEX4A/SG0cAGGaES4E3/17RZk0UIe5TtcX2D1oj/qXxh+Ih4X
 fHPQ==
X-Gm-Message-State: AOAM5323ogZ7dO+K1Moowpv9yQBZo4k2l+rKWzm2W+MTRzqpGtbIbfYT
 MCiFMYCr5TJcZUdGIiSudxlbPhP61O4gDGq42eJaQA==
X-Google-Smtp-Source: ABdhPJysO6Ck6qELeBSDXxehbU9vkeTSV2JzQchKyiNDmwhzYEEpAeEqVTSsRmGjLDsQAGZX4GsOz6huvuKRpOVQN50=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr41223990eds.204.1626101548279; 
 Mon, 12 Jul 2021 07:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210711202736.591334-1-its@irrelevant.dk>
In-Reply-To: <20210711202736.591334-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jul 2021 15:51:48 +0100
Message-ID: <CAFEAcA_RqcLGDvjhmd9a5hxXLzWEF0PpC5BNZi1THtOwLRdyzA@mail.gmail.com>
Subject: Re: [PULL 0/6] hw/nvme patches
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 11 Jul 2021 at 21:27, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Pater,
>
> The following changes since commit 9516034d05a8c71ef157a59f525e4c4f7ed79827:
>
>   Merge remote-tracking branch 'remotes/cminyard/tags/for-qemu-6.1-2' into staging (2021-07-11 14:32:49 +0100)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
>
> for you to fetch changes up to 9cc1a34ec4fe7e89e44e460dcf50159e40962e59:
>
>   hw/nvme: fix controller hot unplugging (2021-07-11 21:50:22 +0200)
>
> ----------------------------------------------------------------
> hw/nvme patches
>
> * new PMR test (Gollu Appalanaidu)
> * pmr/sgl mapping fix (Padmakar Kalghatgi)
> * hotplug fixes (me)
>
> ----------------------------------------------------------------
>
> Gollu Appalanaidu (1):
>   tests/qtest/nvme-test: add persistent memory region test
>
> Klaus Jensen (4):
>   hw/nvme: remove NvmeCtrl parameter from ns setup/check functions
>   hw/nvme: mark nvme-subsys non-hotpluggable
>   hw/nvme: unregister controller with subsystem at exit
>   hw/nvme: fix controller hot unplugging
>
> Padmakar Kalghatgi (1):
>   hw/nvme: error handling for too many mappings

Hi; this failed an assertion on two of the travis CI jobs and
then got timed-out for not producing any more output:

https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/523720897
https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/523720898

ERROR:../tests/qtest/nvme-test.c:89:nvmetest_pmr_reg_test: assertion
failed (NVME_PMRCAP_RDS(pmrcap) == 0x1): (0 == 1)

ERROR qtest-ppc64/qos-test - Bail out!
ERROR:../tests/qtest/nvme-test.c:89:nvmetest_pmr_reg_test: assertion
failed (NVME_PMRCAP_RDS(pmrcap) == 0x1): (0 == 1)

No output has been received in the last 10m0s, this potentially
indicates a stalled build or something wrong with the build itself.



These jobs both run on s390, and my ppc64be and s390 hosts
both hung during "make check", so I think you have an
issue on big-endian hosts somewhere.

thanks
-- PMM

