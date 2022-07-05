Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38471566C0C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 14:10:51 +0200 (CEST)
Received: from localhost ([::1]:55290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8hOE-0003T3-5x
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 08:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8hMq-0002SI-2P
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:09:24 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:44770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8hMn-0005S4-B1
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:09:22 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31cb2c649f7so32037047b3.11
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 05:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZQEr7bRZVPwz/woTzs2/QHh1H/x1QhJTT0mo/i5Mr+w=;
 b=CaLrIneP9pgODmDggu9l3tlEhAEh+yJU+A/3pnvapZ8YRG/xEl/AOpDa+ZEhBHyFyj
 A1yxKGcALcpoNbqxexCcds7NhA023nB0fe1non2TBk/XlNsku6oib9BJOJBgcbZsNnoj
 lZGoCjYFnPk4Lpw+AbKgDqIS4icqR6jv2w3zpsh+9kCWT7L76R7oG+HZSdJT3kPSzZeA
 rX30mGSzkEloizTc9QnzefjD4GbKczz0G6jPU7c1BMpjRsLkkZLfJxsdRVnqGvAmUd5b
 mUh1+ZUWOfyGmzNAXSFUkn2ggYaCN7PzdwTIDyVuiR1PV1CqcR6mQm/a0SnKzFf1dMvX
 7gIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZQEr7bRZVPwz/woTzs2/QHh1H/x1QhJTT0mo/i5Mr+w=;
 b=yeUUaOaCun7SrWwLobLtD4RSvGQAVytApCzZFfWuLqpcArEnfJhCHdM3Cpzn42NAcF
 Ed/sw11iDxn3gEvgbokcmABQWxrReToqeeemHeDUnktlrRLaNlRyWhawk8vjDTZpdlTj
 dfe0W5cHtZ1MsUB7QDUxFVL+8p00E/poyCXSM+OB4OCsfOUG7hsNX23gDldBs2IM4l54
 86Xiwue8UnXK9RQVZ4bhrVpQeThFsAtwcqe8F6Tk7my+dANDPBPikXGr2yTr8y4txAyQ
 l8DFLsDWiW6wmuQQq5bd0UmtxaBrlPQIleoS9pCBL6APdBqjWFnjFYWQ87TxyOGyxgnP
 BrWw==
X-Gm-Message-State: AJIora9mUuICXMe6Z81UjuoX4lsTYgktagaICv5BQj4Yxyb597GQxBYv
 HreBNyOGTKixikkHYn1Z5i1ex6Mx5WJ3TM+iHvrMRQ==
X-Google-Smtp-Source: AGRyM1uyp6BvO61w/0pjr+OJ1Wjvs7LRtk87/br7ajGK+PMj/w3JHs8nI9DSoiybkOzLpmIlqpgBjNI9xtg4ey6WOnk=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr38138248ywg.329.1657022960165; Tue, 05
 Jul 2022 05:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-5-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 13:09:09 +0100
Message-ID: <CAFEAcA-Y7rFFHeXmqsNvXz4M45CkzvvUuNzaXACGS3vmbH5svA@mail.gmail.com>
Subject: Re: [PATCH 04/62] target/arm: Record tagged bit for user-only in
 sve_probe_page
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Sun, 3 Jul 2022 at 09:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fixes a bug in that we were not honoring MTE from user-only
> SVE. Copy the user-only MTE logic from allocation_tag_mem
> into sve_probe_page.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 3 +++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and added to target-arm.next as a bugfix.

thanks
-- PMM

