Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB32331432A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:47:47 +0100 (CET)
Received: from localhost ([::1]:58334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FJq-0003Rx-Nx
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9BGm-0007OY-Iv
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:28:20 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9BGk-0007wO-KE
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:28:20 -0500
Received: by mail-ed1-x530.google.com with SMTP id y8so19753217ede.6
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nti+nIys+s/M2U+QWxzR12jYSAUGWD78vogQc3R8/fk=;
 b=gnBnnXk4tA4qQkSA0J34Mxd3mAs8NFhYeWEz18WVfFAKje3F7o4mdFlWfoEwsoCaeL
 f69z1pPNdMWmw7eyKQ8rvYI+tl9lZRD6TaSeWfGartsypZkbQihhOW4ajEHnOFgZrSQL
 uFEHXUZvbox5L2f2KxdnBaHd8wlhUWK2ve0Blfb1TqGzolr2d/OBmfMS3pbrBIR/YCN+
 O4zghHmiao7efm/gIiA+Lf7tbmPuRLGQFi54kWJeUWe89TjkKlL/rClIUgPBR7oWjhKq
 Vz1bkNwy0h8CoYx/uGFM84eDkwQIIi+v6DMP2hDbRDrPvewEfKJwAl1aLoLqxuBpBVnL
 PxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nti+nIys+s/M2U+QWxzR12jYSAUGWD78vogQc3R8/fk=;
 b=oxZrH66+4ceADcfv+qn4AyDTLeJFyslVAPWTwXOhMBQPP9fDxO+HuILEyxwjkFpJnr
 KEO2OJ3zvfwsgABCGAqYll/gc0/+dQCKT0V6Z4aQNk4aEoyTNjmtRMevESaGQNJ5t4s6
 LirSV8WHAwg7C/yOaUh+gsybej+593dU/f1m8KvPW0z/Q8xazSgRAwznVDCBxUoIZdBA
 qqW4DQGrtbdL8vRiwkjHasYOZRDebj+5NCF+QWdp1jADmZk/ZuCUG6BOyOjIZ3B2WRNJ
 2/EclmF2j3JbUosVm8mcdYQYftmgfIR6QnGG2RDzVI4siRDO6exXnKrz3XybSQgQDcK7
 FGtg==
X-Gm-Message-State: AOAM5329PXxgP9nVnVmROzYk6f1BHHzOgBAjjVAgD3qjTIlBb1ipi8nF
 N1YEQvy0T4P8GFc0PHA6UtFlNKATrxqv647Iv3avRA==
X-Google-Smtp-Source: ABdhPJzbLG5pYcESvnj3X0Pp5moAkP3xZUDcx18jkDlEKqed0nrPLwUxFcIZZLI6VA/Gcjq7Oni34LUhpvrWvoVbM68=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr18334782edd.52.1612808896780; 
 Mon, 08 Feb 2021 10:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-3-richard.henderson@linaro.org>
 <CAFEAcA9bfj0X1Pb6_Em2hX7OkgmobFf=SGWQe=cXHaCO8n5jCQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9bfj0X1Pb6_Em2hX7OkgmobFf=SGWQe=cXHaCO8n5jCQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 18:28:05 +0000
Message-ID: <CAFEAcA9C+DG33fu-=zNN+6M9qc_bh6Lc=jx0ttNLg-tQWQtrxA@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] tcg/arm: Add host vector framework
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 17:53, Peter Maydell <peter.maydell@linaro.org> wrote:
> The AAPCS says that q4-q7 are preserved across calls.

Speaking of which, doesn't that mean we also need to
save and restore q4-q7 in tcg_target_qemu_prologue()
if we might be generating neon insns? (It doesn't look like
aarch64's prologue does this, which seems like a bug.)

thanks
-- PMM

