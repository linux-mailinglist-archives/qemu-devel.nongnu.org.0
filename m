Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB8D39ABC4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 22:27:02 +0200 (CEST)
Received: from localhost ([::1]:43232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lotvg-0000WQ-HB
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 16:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lotug-0008G6-6T
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 16:25:58 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:34434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lotue-0007Pj-DP
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 16:25:57 -0400
Received: by mail-ed1-x535.google.com with SMTP id cb9so8622155edb.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 13:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=iobSE8/3wcdWDbBwc8xQf6W5ZY920/w6Uh4nOjZ/i0Q=;
 b=yxZjcgVMNS3B7mdc2w+vV5PYfkc5EuqK5V1EXexuTTYz8mVLlQ3IJ5HtxWJV96Fz2i
 sBQc6M2gsHrAh72ILpWRj9RXsKnBGY93K+NJWpIl9/S7BqrYIBaY5MajRg3uWt+BHuAq
 +6TWvG3lbBirKwvR/v88VYFGgG0wVuzvQQuCkTTZTbiCdCSnr3poKosdteFodVgR2KML
 8le8dCUv3LmlLVuAz70XImwp3JuGx8DN9nOlkB+MiR6BwVW6EZ+fBLHDfX3uCROd7dRI
 ZJrEgu+5DlsEBxTscuBv2nSTwuY06kf2kYA/0n14oFIQ17Mt4UmiRnT1w4aDxfM5Ekb0
 yx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=iobSE8/3wcdWDbBwc8xQf6W5ZY920/w6Uh4nOjZ/i0Q=;
 b=rxF5GaysVo71Rxo4y1s8rtHtOmleYtaZuLu5yIPbSc0An04cAWMZIyBesP59sEA88M
 Kb+0o3CXFQA/wzQad8q04CmZbI4uIeBhVTuqL8sgT+f3BTmMeJeqo6k7dhcIeCg60Cnu
 IAOBgwyzfYIQhpB1v0tiqb2R8fbXiuHNDINfiiHOJmuGFpcBtNnxOvI6BpF4JCj4aJqX
 OBNvlswOdlxdKzlvCargB2KDOUjvaA2SCEp59n/0FS6hQKb9fGA7aoa3Ro9hygObslM1
 uiNIhC3M/f4vqy2qFw+iBULHRrjjLDwKUDlQckWMfm/AkENWnYJL2cSwv/xlgxpfqePe
 sK6Q==
X-Gm-Message-State: AOAM530i7YLG7UiSN2zcBAmwubbCVAg5ALjlTYryXNwZfyOdlii/safx
 eSe210UItFRiQOBVOWgFB/8+6Bi7drMtSWlpLI14W0EigJI=
X-Google-Smtp-Source: ABdhPJwu+MZnUIAXDv5AflbA7stTThFq2yRBKG+xjzkqi1SHdeWNPd/GEDS5yY7be7yiD9IMb2IT35KKSP/bCARxDj4=
X-Received: by 2002:a05:6402:1216:: with SMTP id
 c22mr1204467edw.36.1622751954101; 
 Thu, 03 Jun 2021 13:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210603155904.26021-1-peter.maydell@linaro.org>
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 21:25:21 +0100
Message-ID: <CAFEAcA9RO9nOQZgw53+zO_xbMumw9nAEY9y-Crtcu_xFR5ejkQ@mail.gmail.com>
Subject: Re: [PULL 00/45] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Jun 2021 at 16:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit a97978bcc2d1f650c7d411428806e5b03082b8c7:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210603' into staging (2021-06-03 10:00:35 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210603
>
> for you to fetch changes up to 1c861885894d840235954060050d240259f5340b:
>
>   tests/unit/test-vmstate: Assert that dup() and mkstemp() succeed (2021-06-03 16:43:27 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Some not-yet-enabled preliminaries for M-profile MVE support
>  * Consistently use "Cortex-Axx", not "Cortex Axx" in docs, comments
>  * docs: Fix installation of man pages with Sphinx 4.x
>  * Mark LDS{MIN,MAX} as signed operations
>  * Fix missing syndrome value for DAIF and PAC check exceptions
>  * Implement BFloat16 extensions
>  * Refactoring of hvf accelerator code in preparation for aarch64 support
>  * Fix some coverity nits in test code


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

