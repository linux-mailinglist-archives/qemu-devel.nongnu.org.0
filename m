Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C00A676676
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 14:18:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJDkD-0002f9-M2; Sat, 21 Jan 2023 08:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJDjl-0002au-3q
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 08:16:56 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJDjj-0000vS-8S
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 08:16:48 -0500
Received: by mail-pl1-x630.google.com with SMTP id z20so5612353plc.2
 for <qemu-devel@nongnu.org>; Sat, 21 Jan 2023 05:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j4cBaa6L0hiY++1HS1yyhj2EK28eM9beplE2nggnJ2Y=;
 b=eRgjHWSJ80IJ0rsnqqAw6VvxGQ6dpGy18b7GvzBQOqRJowAxWoicQCwnJE1L3E27KS
 W9IaOHo7vhQ2yUW7oa07QWY+Mo4U3dzOcGJXOSaY6VtSqqoP8NsMRKarQLJGOeBfYMkL
 jc//twKEiP4obhlCAgrpO7RpLauoN3b36u86fwjbND+1TxiWc31T5fCzhOv+W+kE5lpW
 CuRf6K/Bis7nkCQ5dzyE6Vq6L0zM6JvceCg2Z2ITA0c1063aCgjyI03vg3nXxjP/jEiW
 R50isEyC83f8AfzMMfUzqNZlvjqvW1bJd4vxjRT08wLG2kgzroBagG8KU+1pXnH37pBC
 saEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j4cBaa6L0hiY++1HS1yyhj2EK28eM9beplE2nggnJ2Y=;
 b=OcyRHUIQo9rdFxXBp1qr99xau0dk1xEuTSiXD72RVMimZtds2a+ULDfamzWChKW5xt
 agtHSa6XZE5mFPqPw5m4DhDn0RAe/MgrabbQPRnN6lwc2RjCmsaAGgYnjWjnugnExz5E
 KXekgUgKzLZDow4IJDo1fExUcDtXSnQTCFs7Q5VaJ9kGuCR3CEzKWYV2K6Tp+vESkKj4
 7EWuNo1k1iflRfPCYeEoYkakwOPvec7D5xvfr84hJ7S4bGW4/NnHJ5b/G85SIbOvLHTy
 kZU+8YC0DyH0xsaVrxUJifmQXxqmCjtXxO70JSjC4dVG/b5axU5i7AVShLeCmG09fRje
 rBfg==
X-Gm-Message-State: AFqh2krm4jHRiA8qrkrUyRZRS1HMWjuPNFHM6p2O3N0WXmIurL9PlE97
 X9eWP8SobUDWUQHsoPqajt7zH9jHoimBYuOROFBlTA==
X-Google-Smtp-Source: AMrXdXslXWu78XFPzX6ML+WcFZLIyaainOzN9YXN0qQis3WFel7EaXRkuU6mM3TY9DmNmitqBXtonmOmqQK40sVEXQQ=
X-Received: by 2002:a17:90a:c784:b0:229:2631:e8 with SMTP id
 gn4-20020a17090ac78400b00229263100e8mr1783866pjb.215.1674307005938; Sat, 21
 Jan 2023 05:16:45 -0800 (PST)
MIME-Version: 1.0
References: <d64812ad-5c7f-ac9e-bb87-ebc8451c3602@landley.net>
 <CAFEAcA8zsvLErJXJZG+HzKzWjACO9RH9PRbO3XemxnP=6TZJvg@mail.gmail.com>
In-Reply-To: <CAFEAcA8zsvLErJXJZG+HzKzWjACO9RH9PRbO3XemxnP=6TZJvg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Jan 2023 13:16:34 +0000
Message-ID: <CAFEAcA_+0YzmdtGrcz7aa88rkZdPKSryAqffFbLYLi4ChhnkSA@mail.gmail.com>
Subject: Re: Commit 145e2198d749 broke mips big endian.
To: Rob Landley <rob@landley.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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

On Sat, 21 Jan 2023 at 13:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 21 Jan 2023 at 10:45, Rob Landley <rob@landley.net> wrote:
> >
> > wget https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/mips.tgz extract
> > and ./run-qemu.sh in there. Before this commit it goes:
>
> Hi; does this patchset fix the regression for you?
> https://lore.kernel.org/qemu-devel/20230118095751.49728-1-philmd@linaro.org/
> ("[PATCH v2 0/2] hw/pci-host/gt64120: Fix regression on big-endian targets")

...looking a bit deeper into that thread I see the proposed fix
isn't right. I suspect it's the same underlying bug, though.

-- PMM

