Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2C4677BE3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 13:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwKp-0008PJ-2x; Mon, 23 Jan 2023 07:54:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwKn-0008P6-LW
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:54:01 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwKl-0002Gy-Tz
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:54:01 -0500
Received: by mail-pf1-x435.google.com with SMTP id z31so5577261pfw.4
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 04:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+smmb3mI+a1EFRHgpJeD30hVN6Eff9iGXB7D5qsN/vs=;
 b=IsxDx30bSiq0zHO+RN17Qswb336l9T0oLRDjn6WKu77dlT7Th2HUsD8ao31wCJsScr
 6+zSUXXedmObzDgKk76qoHG9CywKdfAJY+fzys1T0NGUNqcRar16eaLSJk2z80l7+WiI
 cmubWCi9UEH525SAFj4EUc9rl2bA/tMZTdCMcvMT9vz1FROKk0sGnn5xPBWMAsTfohF6
 XTqxM2esx7MxTz0j+ttMmyLl9zzhX1T//wR023vcYiMHfGrI2FkAyPvrnlxv+rONUbnB
 p9C+sWhAlydq2UnvUuCz8D4Drudj01fECaO47ghYflyq/Cn8SAADUeso0eqqqlxF4lHK
 Lt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+smmb3mI+a1EFRHgpJeD30hVN6Eff9iGXB7D5qsN/vs=;
 b=U1mYhUH2KeQmsAy7ZxMO/NL/zuIfq+TP+BBzJWkR1KQc0FQg8Uwj6/cFLXtxwK7njj
 /4Fqu2tQwtEk4lsddYtQsQg5OUaiT6A5tcSDBMUA2gkIMw+dubK/v12Z88LJHsofjv+0
 nSu3XBp10zT8RasKCAEzNv0T4+RyzW8mt4d16wZBQeYn1wDLJVt2iZJAe9b3r4rboF9u
 q2o9a7p9jrM8VLisnWvdPqkj1steaUJFMb3fDTJ8gEqWn2BUh2TMIKb9ygLkYDeD0lbD
 6twQVSRdKfTcH7JKlXPPPupZpYa+DohGYCmsqobI0Mc8PZ3qme5/f5kYha2d05Klc1Hq
 ifhw==
X-Gm-Message-State: AFqh2kq/5NyyjVwQ1fRC8tYfe67an6i+rcjW4du23VMU2022HsKGbPKn
 0+kEZtyiPx8qUoL/o00tW5uWBd8NARtTajHBzyTilA==
X-Google-Smtp-Source: AMrXdXs65aiqcHunQMnBR4YX47WnYOT7pIoQvoT1x0WHgD4m6sNTTX0istK2S8EG8pWf2IXkF4vXLWwiNbEqoW0UeSI=
X-Received: by 2002:a63:31c8:0:b0:4cd:418b:3d2d with SMTP id
 x191-20020a6331c8000000b004cd418b3d2dmr2193189pgx.221.1674478438286; Mon, 23
 Jan 2023 04:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
 <20230106194451.1213153-3-richard.henderson@linaro.org>
In-Reply-To: <20230106194451.1213153-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Jan 2023 12:53:47 +0000
Message-ID: <CAFEAcA9mh+eS8rHwqmyjOAmcnPDJ7K54QbJPd7itKZskQeox5g@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Look up ARMCPRegInfo at runtime
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
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

On Fri, 6 Jan 2023 at 19:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not encode the pointer as a constant in the opcode stream.
> This pointer is specific to the cpu that first generated the
> translation, which runs into problems with both hot-pluggable
> cpus and user-only threads, as cpus are removed.
>
> Perform the lookup in either helper_access_check_cp_reg,
> or a new helper_lookup_cp_reg.

As well as the use-after-free, this is also a correctness
bug, isn't it? If we hardwire in the cpregs pointer for
CPU 0 into the TB, and then CPU 1 with a slightly different
config executes the TB, it will get the cpregs of CPU 0,
not its own, so it might see a register it should not or
vice-versa.

So I think we need this patch anyway, even if we're going
to try to do something to improve sharing of cpreg hashtables
across CPUs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

