Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD336650EA1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:30:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7I55-0003Jr-M6; Mon, 19 Dec 2022 10:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7I52-0003Jg-IZ
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:29:28 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7I50-0004HI-T1
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:29:28 -0500
Received: by mail-pg1-x52a.google.com with SMTP id q71so6385524pgq.8
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 07:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4r/3jMHTZQw1NNMLOfnBJhrKZbCRI8ONeARRykuDj0U=;
 b=CBERFZk/CuhNOGP4k2BPM5cXy23mVEi+kVoF3krG8xl8Bsn5a8n0DmGa1DipWkl4bn
 jp0DAdYPBW2OwNA8D61RsbB3Jl0xsc9RBWAjblozWVZTq1m0PRMO55SKvA1o6fHYbZgx
 Dde7B4Ip5nrVt3S7FYFd016jsLt0XjlTERkiMY9U8FnyIlSxASlGc7vZjxqH7NB2r7eu
 cn8I0tOSNiDIzzirqXPbjVkSzW/onSoGC0TGpRyRGOnQ59nRsfdgg+ZX/4pZqccQOkgs
 1EpljlwSYkeFPPPZ5Uw6phIzzFromvIlUWCq7XQhP4u5McMZg+rmW8z3jk9UXKBogCoQ
 Odtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4r/3jMHTZQw1NNMLOfnBJhrKZbCRI8ONeARRykuDj0U=;
 b=FgYY/Pa2HUllVWtgUf7z/5Ln9SFfvuxUxe5VG630KsS7dkPFyDmKr8DcFudFQjsK+c
 s428WlGA/rEDYT+67xjI6Rwk7tMG1xyR07m/BUFxz4l5qoP7MEcWzl2bWPo7pa2J9iIo
 CVbD1CK96tNNrrLDe6YwgTewPaX7hhA4Y3Fdf52xwPE4NWNYwK4CBrEukc7uC8NdOMnZ
 T5WJ9cqp7B2bVIVj3fFQps+DX4Lw6i4pQiYn+LNyalGa0+4kIAWnyb1LVPjfIQ7zVvmi
 hEHqvFCIWUxKQEcRkWfKAKeBvN4aylpxlzPJpeprHzS7CATjn4Db+U2SG7Pm2CP84FbK
 xdTw==
X-Gm-Message-State: ANoB5pneMnzP0OlcqaaFNm/E+03rOll9qvBOB38HtKCd30uRXlkrHUPm
 S2yJWEuiyiOTIg/q7yFguB6QEXgq/r3a0mmMS3kOHA==
X-Google-Smtp-Source: AA0mqf7YUHwnM004CgzGkczLkTO+lb5jzdlvS/b+ULEXWeNZ7F6xy2KKF4MmdpMeO+EtLP7DSK2LB0kGOwBmezXf1WI=
X-Received: by 2002:a62:5f81:0:b0:56b:bb06:7dd5 with SMTP id
 t123-20020a625f81000000b0056bbb067dd5mr81004541pfb.3.1671463765165; Mon, 19
 Dec 2022 07:29:25 -0800 (PST)
MIME-Version: 1.0
References: <20221207021322.16165-1-vikram.garhwal@amd.com>
In-Reply-To: <20221207021322.16165-1-vikram.garhwal@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Dec 2022 15:29:13 +0000
Message-ID: <CAFEAcA9_rNvfuYU67vs+KDxkE1ye+7dtStLPki_qzBi0t399MQ@mail.gmail.com>
Subject: Re: [QEMU][PATCH v3 0/4] Introduce Xilinx Versal CANFD
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, francisco.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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

On Wed, 7 Dec 2022 at 02:13, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>
> Hi,
> This patch implements CANFD controller for xlnx-versal-virt machine. There are
> two controllers CANFD0@0xFF06_0000 and CANFD1@0xFF07_0000 are connected to the
> machine.
>
> Also, added basic qtests for data exchange between both the controllers in
> various supported configs.
>
> Changelog:
> v2->v3:
>     Corrected reg2frame().
>     Added assert to prevent out of bound cases.
>     Replace tx_id link list with GSList and removed sorting function.
>     Replaced PTIMER_POLICY_LEGACY with proper timer policies.
>     Corrected minor code format issues.
>
> v1->v2
>     Update xlnx-versal-virt.rst with CANFD examples and add this in 03/05 patch.
>     Addressed comments for patch 02/05 and 03/05.
>     Add reviewed-by tags for patch 01/05, 04/05 and 05/05.
>     Change commit message for patch 02/05.
>     Add SPDX license for Qtest.
>
> Regards,
> Vikram
>
> Vikram Garhwal (4):
>   MAINTAINERS: Include canfd tests under Xilinx CAN
>   hw/net/can: Introduce Xilinx Versal CANFD controller
>   xlnx-versal: Connect Xilinx VERSAL CANFD controllers
>   tests/qtest: Introduce tests for Xilinx VERSAL CANFD controller

Hi -- this patch cover letter lists 4 patches, but the thread
has 5 patches, as you can see in the archive:
 https://lore.kernel.org/qemu-devel/20221207021322.16165-1-vikram.garhwal@amd.com/
Is the extra patch 3 intended ?

thanks
-- PMM

