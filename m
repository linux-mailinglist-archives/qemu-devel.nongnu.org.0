Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBEB459482
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 19:08:11 +0100 (CET)
Received: from localhost ([::1]:44888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpDje-0007VW-GI
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 13:08:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpDiI-00067i-Oa
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 13:06:46 -0500
Received: from [2a00:1450:4864:20::42b] (port=43572
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpDiG-0004Fr-Ou
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 13:06:46 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t30so34220376wra.10
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 10:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7VZpd7wHnJqRumawbJbXlpoBD05f4hWB6rWFW//Gx7A=;
 b=P19DRofLnSH4dcl/8UXqkBlCSjcoG/6KbRCq2IIM94xw3cWojIkczSZr3e4pmSYFJ4
 zMKCVxMqj6NL5OWOlspe2P/WSK+9rQT9lLJg2prQ5OeSdndTa0pHl91+dLVOPSiwsZFA
 GL0JNbpuYyRLKFK0HVlYTPGGXJy2wGbqRN1f90sJzUErpmyxMbJIz+2TWj4Ph3GRm0n4
 ILv1NvUBrpE8nET5+Mr/YBOYm9iwZr2YAVcODl1HBFwrgd/mriEBcD4L5YWCBfo6TZtJ
 QtGV1Pjv54OsVXGaZ5cUWGG5lIGSzrlrBmbSfZd+ZTfbDrgTnQn/YREyVDBKuMVvnbVW
 shUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7VZpd7wHnJqRumawbJbXlpoBD05f4hWB6rWFW//Gx7A=;
 b=xD2wY8c/oOH0ZVHDaiRJlOQwkzclHGTM1mQY7BQtd4RIW8poJlCFlG8oBwfYXzqkH8
 AuRXBNRqPMvT3J8E12Nrpom21c4YZjRPxrulSlQXCfQ3SgHCDuc+dlIfO4Ir3IOZ+XMo
 BWyREuMoMpwsHPpbGli+Fxf79Cyirdy1W8ZLOnFty+fknbZYJchE+JRabg9/nyIjOvF+
 xiAegG9gnB9UR49xHPsNA4Xw0p4qCTZM3PYrt8x4nbwVJzUrv6YCcnHLhBJcoYFH8JP2
 qxsoUgFnyQ6GsSAL1hu9PF27+fxpOWoS0NAJyE7omnWiEheb0Jd482ZgaWUTL7n0yVu+
 40kw==
X-Gm-Message-State: AOAM532uqLp0i9+Ec3x4Gv5+DdWNboYQAET5m+xD5Cpn1tD6yTzXktbQ
 ZGCHQ42zi5xSCwQf+u8LaubZPEKs8DWO2h1MvfKfGQmZ1UI=
X-Google-Smtp-Source: ABdhPJzIw3apfkwZ4SNBw6SkHPOuTgXxBC1vCI0sDEtJgfIKemwSbdkq0mWQkpfttUprohtnXGqPVvj/Ff71TzB/c38=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr41231272wrt.275.1637604403122; 
 Mon, 22 Nov 2021 10:06:43 -0800 (PST)
MIME-Version: 1.0
References: <20211122134342.660953-1-peter.maydell@linaro.org>
In-Reply-To: <20211122134342.660953-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Nov 2021 18:06:32 +0000
Message-ID: <CAFEAcA_f6pYLNigkEpYWAEJCEsySqJOARH+e8OmftAFj+iCCeg@mail.gmail.com>
Subject: Re: [PULL 0/1] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Nov 2021 at 13:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Just one patch for rc2, a revert.
>
> -- PMM
>
> The following changes since commit 49aaac3548bc5a4632a14de939d5312b28dc1ba2:
>
>   Merge tag 'linux-user-for-6.2-pull-request' of git://github.com/vivier/qemu into staging (2021-11-22 10:33:13 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20211122
>
> for you to fetch changes up to 4825eaae4fdd56fba0febdfbdd7bf9684ae3ee0d:
>
>   Revert "arm: tcg: Adhere to SMCCC 1.3 section 5.2" (2021-11-22 13:41:48 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * revert SMCCC/PSCI change, as it regresses some usecases for some boards

Since this hasn't been applied yet I'll reroll it to add Eric's
"don't bump the ITS version fields" patch. (But if you get here
first that's fine too.)

-- PMM

