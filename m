Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61F14028B5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:26:21 +0200 (CEST)
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaBA-0006qg-RZ
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNa5f-0006Jm-5J
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:20:41 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNa5c-0006E0-DR
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:20:38 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m9so14163750wrb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 05:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ianFqsv3asyyHYHf8mIeVNpopGZuWsQ6XYB3o0I70lU=;
 b=EZt9bp99mC3GEjbw4RinYZBDABKrla+F6SXBNZOtNuPmhpjztASkZmePbIDnzGbfwh
 D8SNEsM3Ip61oeAmQaF7dG4gYUqTrY85vj8A+ghHDhUPzcVQ+5EhpomyMoYcKzSWREMN
 f/TdMYTTHH1iNJCRwvfhWSvUvLnxmR/6DTRZfId5yaGvfVt1XJE52aEKo6tcU2LZKNJR
 u5T8V2Hy8L60K2LRxU4poB4l/SDrL5uJvGIrwNhHzhTkWtgFz7+3DEMQuoMrd0tS0zfW
 OGRBI8ZdGMek0cmr06rLG/++gF1E5HsGkW0tOD6DH4Pax2058UlCB3q2+CYFei63aqK5
 hmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ianFqsv3asyyHYHf8mIeVNpopGZuWsQ6XYB3o0I70lU=;
 b=c2xXJOOR8VmsXZt+SaO3nYijS0RzCMhC0TshTzDcwsQOoWLG++6YPMj+fmef6lamEz
 CsRz6IUEDiWv8agoDuWb3ftgCwCohUF/jeRHIJU80I7BMIKtl6WHB1dsJj7nZnEXvhzI
 xg6Bmg+D/FORmd1hHc5WVvu3CSpW8vfmEMpQVhsiJQoAYVXJBHG43KnTcKtefZIwNcTH
 5ig9w3/sthzfACG79vuJK3YABB47/lFSXJ2isUiw4ifpM4jH59J6qsuGlB0C1VbskEsI
 iDQqsoGW4LELb6cfEMnVX1ybTHVgnFKoMc/1ApHJLMFq00nw8+ZE/C+ZKBAlAFaAmL2W
 BVrg==
X-Gm-Message-State: AOAM532wCuNg3uOC1T9OI34K+UAV4EEQYpy3FRzJ0QrBfMDLXzX6ru0Y
 YJGnD/0kRDDfdHbQZ7b+SXUFeqadAd8poxmiZo6Q7w==
X-Google-Smtp-Source: ABdhPJzGpwuSK4TaQwGpVNpP7Mc9R8ndixIMyCeHiTVBPaq0wP8EW8reOAt9vlttiAwGDhN1CMAy7Jto4UYNK7kTx6k=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr18676304wrs.149.1631017234578; 
 Tue, 07 Sep 2021 05:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <CALUzjTbw0m-n0wmqYPw9C_SFVrCYvqOde6qUsB40FMM9BVPHZg@mail.gmail.com>
In-Reply-To: <CALUzjTbw0m-n0wmqYPw9C_SFVrCYvqOde6qUsB40FMM9BVPHZg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 13:19:45 +0100
Message-ID: <CAFEAcA-H_titydNAYO94k4i5uiJyTXXt=tNyPd7RfjFMjRYb1w@mail.gmail.com>
Subject: Re: Application of QEMUTimer in short timing.
To: Duo jia <jiaduo19920301@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

On Tue, 7 Sept 2021 at 12:28, Duo jia <jiaduo19920301@gmail.com> wrote:
>
> In the controller, QEMUTimer will be used in the implementation of timer simulation.
>
> I wrote an auto-loading timer with a period of 1ms and the clock source used is QEMU_CLOCK_VIRTUAL. But it doesn't seem to be very accurate, because the actual time after I accumulated it to 500 times took about 700ms.

It depends on how you use it. Generally the actual firing will not happen
exactly on the specified mark. So if your implementation is "set clock
for 1ms in the future; when it fires, set for 1ms in the future again"
that is likely to be inaccurate. If you implement it as "set clock for
1ms in the future; when it fires, set for 1ms after the time when it
should have fired" it will probably be better.

In particular, if the semantics of your timer fit the ptimer API
(which can implement oneshot and periodic timers) then I would recommend
using that instead of a raw QEMUTimer; it deals with a lot of these
fiddly details for you.

-- PMM

