Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8ED4C5DA2
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 18:02:12 +0100 (CET)
Received: from localhost ([::1]:40968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOMvx-0005tc-Nf
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 12:02:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOMtI-0005Bi-8y
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 11:59:24 -0500
Received: from [2607:f8b0:4864:20::1136] (port=32809
 helo=mail-yw1-x1136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOMtG-0003Dn-BX
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 11:59:23 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2d66f95f1d1so84375847b3.0
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 08:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dNx3ilKGUiRjqfxCCgvHI3RUZNFraWy3BRm4uFFg8oc=;
 b=vmKoYugFirxjoMwLtH3zTgHn+qqnTPrFVUVs5djcV7Y7xSR/b5ClmYKJgh7jzSVkdj
 dbyXBWhL6pwl9o5n3bw9LalzHgiVEXs21T2KTQU32TNdKBZabNVg9ebvudrwR5ZDs4Gv
 Jy7w4yTZCPmgGp5v2rX2vuTaA+MBQJFH1ohQCPeN/Gcvqy6Blt+LGTL2ztfkAQMR/pda
 yuzKVceWEleIdWtDUlt34PL/LqSlJPsyOVUhZEpMy26SdyCqQAUlRD5TH6N2GQgB47rZ
 7TRaOQopT7uApBsHKpgc5gC3wHK1pDbknAWfxJ6hapcrrZX2FHOj90/HvIUj5WwWaIQB
 KoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dNx3ilKGUiRjqfxCCgvHI3RUZNFraWy3BRm4uFFg8oc=;
 b=yFMxNtuXfp/2DxzJw3qey7U4cmkgiBvQ7V14ZTVYjqd9BDQbNpqF9n+NV52ocg1aS+
 1ZtPtEvIE1Vf1Zds/1jEHMZPHOOB0uad5hTyFX6g7Y/6qUcbAxn/xJ32dJahW3tY8tfs
 +VbE0VS6CIhDlggKDp/JkkDdahf2E3F5L+mhmgkLf4AOJY86Tt8TYyj11ODUcBKV1BiG
 Im39lfV/Bd0F7v8i1q1LNX3SRKgvsjMqm1epLdI6gs4nejuntPqwrxXwEMPhX1xB2nsN
 sp2aCjH9mkPnR5W12KiAYdbLRgC+iWLrrZ7imBsBa9f9JVa8J0zxFnSh52DuYLji68oP
 X/oQ==
X-Gm-Message-State: AOAM532ugaQGbW2dfNPtlZdVPwWKp9AE0LoGCi64zMFud8baTphyb7YU
 tQA/QLnFgVYfXX4tLvpANTEdKYYqFp6DBVYWZK8kBg==
X-Google-Smtp-Source: ABdhPJxix7WGb6ZXqR8Axs3jDFjfyeLMdtrOZoji16IjbjPo9GkU/COCUpjOkhrudAGj3nr9r08XPwcDg+qPwE0XMeA=
X-Received: by 2002:a0d:d5c8:0:b0:2d5:e0a:56c0 with SMTP id
 x191-20020a0dd5c8000000b002d50e0a56c0mr16509375ywd.10.1645981161232; Sun, 27
 Feb 2022 08:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
 <20220224134901.500007-2-amir.gonnen@neuroblade.ai>
 <60ce1408-c219-7a02-e993-442bb254fe7c@linaro.org>
 <PA4PR09MB48804DD783E42A73B9F59AB1EB009@PA4PR09MB4880.eurprd09.prod.outlook.com>
In-Reply-To: <PA4PR09MB48804DD783E42A73B9F59AB1EB009@PA4PR09MB4880.eurprd09.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 27 Feb 2022 16:59:10 +0000
Message-ID: <CAFEAcA_KwkFdtWGM8YsixHmmKORN0_E6i8r38+1wWk45PuWSAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] target/nios2: Shadow register set
To: Amir Gonnen <amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Feb 2022 at 16:16, Amir Gonnen <amir.gonnen@neuroblade.ai> wrote:
> There's something I don't understand about gen_check_supervisor -
> it looks like it checks CR_STATUS_U when generating code instead
> of generating code that checks CR_STATUS_U.

This is OK because it is checking the value of CR_STATUS_U in
the tbflags, not the one in the CPU state. Basically, when QEMU
looks for a pre-existing TB it does so by looking up in a hash
table where the key is (program counter, flags, cs_base). (cs_base
here is named what it is for historical reasons, but it can be
used for any data the target likes.) So the target code can
put some parts of its CPU state into the TB flags word, and then
at code-generation time it can generate code that assumes the
value of that state. If we ever run the same bit of code both in
supervisor and non-supervisor mode, we generate two separate
TBs for it. (You can see what nios2 is putting in the flags if
you look at cpu_get_tb_cpu_state() in cpu.h -- currently it
just keeps the U and EH status bits there.)

> > As an existing bug to be fixed by a separate patch, eret should also check for supervisor.
>
> Do you suggest I shouldn't fix this here? Why not fix this anyway?

It should go in a separate patch (but you can put that patch in
a v3 of this series), because it's a separate bug
fix -- it is not related to support of shadow registers.
We like to keep distinct changes in distinct patches (and thus
git commits, because it makes things easier to code review and
also means we have more information if we need to track down
the reason for a change or diagnose a regression in future.

thanks
-- PMM

