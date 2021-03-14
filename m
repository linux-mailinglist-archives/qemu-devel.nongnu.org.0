Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F9533A79E
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 20:16:55 +0100 (CET)
Received: from localhost ([::1]:38994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLWEP-0002mJ-PL
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 15:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLWDW-0002Fj-M0
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 15:15:58 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLWDR-0003Bx-QI
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 15:15:58 -0400
Received: by mail-ej1-x635.google.com with SMTP id ci14so62546141ejc.7
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 12:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Y9QV1eZL1NUBZhMkVFVdPs2tQtQ5AMoQseYtiSlth8=;
 b=gJ8H3dbPt8QubC3eXq2U0EKjQekjJ3xip/00QgWvQaI8GqdETQJqKQ3lJrZIgaGXHA
 LaFi7rqVTmhjUL+u0FkAQbDWvlS5+YXBaWSiUbWi1LPxfVvEzh8SwXdZx5OhIlRNajSA
 bog62tC83MUie0Ie2c1BP3Ahww3iUpf5Yxh0+tO8/b/oHksn7n4497uMixfsn8PTcK9M
 det2k9ovwlkjjjLieiHhBGbn3brh7BMBJsa28sFdcRDCCO8+pyVAQPi8/m+/b/m7cJQa
 756Uk+jcaXzZ7DGiCgz0zwXWlmijIILBnBsqgrC4qvXJXXgSlFXo8Lyiud+7gEPPnGzK
 Z5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Y9QV1eZL1NUBZhMkVFVdPs2tQtQ5AMoQseYtiSlth8=;
 b=JuVThTCvxaQstFDI47JiKhtKQFmKOYOjd9MtlVEQ1ETZ5/4Czuo/ENWmO6RNYLY8nH
 ZcVpho6NzF8Q5OzTmKv/TgFJJ9QOR6MeIJN38igwBC+9lEIHMjPJLyuM4OLr8HeZtaUY
 81Z38JJ7rxDehsDSIXdB0RJlJwKYKGDUR1zKIFYtYQTmyd5z6ZzXpLnldaDxUGTj47dk
 f3QBU+PXGToVRHI5SrlI+MCdSK7pn6aCJNXQTXd7uhvwiAeAdRC7LTvL1gOSl4cYS1oS
 bwygiZtLet/m24S4qR8LP41YXnNT3jPwSqhlIhyQOshy2Stlvd+qyStYvxRTHSSOUyfE
 PiHw==
X-Gm-Message-State: AOAM530/6DuozYrYuryQSmSV3c08KJHetIwzQ82uw2orj0UxjbO7L47/
 1pz54j7ZUjWSOS8kY/R4A2BcNFMxXPY33QL+N24vjw==
X-Google-Smtp-Source: ABdhPJz+4klFaBG/QcoHrOLAe5EJvcIirUSRraQslzDdGHeBzYNmt5cAEyHZ6RHPOb8Medd9EbrM1cJyUGpiz4aSuwU=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr20293060ejc.250.1615749351915; 
 Sun, 14 Mar 2021 12:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210313094747.2966948-1-laurent@vivier.eu>
In-Reply-To: <20210313094747.2966948-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Mar 2021 19:15:30 +0000
Message-ID: <CAFEAcA_zwuiW=TDunk22BiyYWvcF8TLSi7nQ+3Y_Vj2bHQC1Hw@mail.gmail.com>
Subject: Re: [PULL 0/5] Linux user for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Sat, 13 Mar 2021 at 09:50, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 3f8d1885e48e4d72eab0688f604de62e0aea7a38:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210311-pull-request'=
>  into staging (2021-03-12 13:53:44 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request
>
> for you to fetch changes up to 0266e8e3b3981b492e82be20bb97e8ed9792ed00:
>
>   linux-user/elfload: fix address calculation in fallback scenario (2021-03-1=
> 3 10:45:11 +0100)
>
> ----------------------------------------------------------------
> linux-user pull request 20210313
>
> - fix elfload
> - fix executable page of /proc/self/maps
> - add preserve-arg[0] support for binfmt_misc
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

