Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA33B5753D1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 19:16:30 +0200 (CEST)
Received: from localhost ([::1]:60928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC2Rx-0002Ex-Ix
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 13:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC2Pg-0000ZB-0D
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 13:14:08 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:34656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC2Pe-0003W5-75
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 13:14:07 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id i14so4355573yba.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 10:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aa6c69MgYoaWxoEjvwlGk3yRaXxNKA8bgpKtS5mD+2A=;
 b=waOhw9yQgS9o55EL8PtuwWZT9wtCQvF3eVN4LVS397rSXTYqjeufStl3BfpiHmLFpH
 vsN9scWgwQOCWSEg2aNJoxh3rWKF4ltqeEpb0beSJIuVZua37Wfy3E+YvhD/DluugdlE
 /smQgZNNRkqWhIhqd+Dzv25EtbJCZKysvqimwrynhE4c7rm8FmHzKYyqFM4KkLno33iI
 TbheVaf5KItFRsOgLCIlbGXy/fneST78iHsGJ3u6Dsz4qIkj+54w7pJPLQBQTxFZU3io
 bVt6CdZFy0Rc9Wmu9OCc9XWccfdsBee7hmacdjqcpAGZFV2ZaP7wHrqzjd65i3SqAqlM
 dwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aa6c69MgYoaWxoEjvwlGk3yRaXxNKA8bgpKtS5mD+2A=;
 b=KvfjF+UO9kF3ZkJ207zQaWKvRCMEQhuHfrooy5yOCcWGk/vQyodf1pKuPZN+0zy2xa
 g9gXWm7dM2gmPcC/781fVal5mXaF97W6jGjhkJQcKJZ2+fJxfTK5pc0FNT14jwQ0Tdzi
 KcLp+BbFacTxiNNqSg41zUkkAsz0dACuDOqyEFEJIIH5VhHKAi5abM+6nQ3VCaxXRLnA
 GiI7IyqIn6Px4UC7xoBHorRejschGvDc7M348moo0JrwqV47hFPV1LlLHxJXirm0sivO
 3DtDy6Dmjtz7Apt7y8V+ZJjlcafwzbwPVVDlKZG/kuuwNg/PaWnNtH0RsgzM28PzXV6D
 gfuw==
X-Gm-Message-State: AJIora89mmy6U2zWohlTKdH/1j/E3AjrrAc6cqWuCgsVTdLUhwNRbrCn
 tx25dPka9N1j2KZt0VN1dzbH2Z5XNj9vTlzGO+jd3Q==
X-Google-Smtp-Source: AGRyM1tgVaUXgJGmVx2Bt9DmnXko6zAovoGMh1wzD2VYvRIIVCeXEMQUcQzcw5QhyMx9RFSbt/13hjSXKLrdCO8sQaA=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr9767341ybg.140.1657818844805; Thu, 14
 Jul 2022 10:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220713101908.2212307-1-kkostiuk@redhat.com>
In-Reply-To: <20220713101908.2212307-1-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 18:13:25 +0100
Message-ID: <CAFEAcA8bZhbJ2aZqbheqsrGCH1OAgwkb9R-zPXHP+UWA8BGFsQ@mail.gmail.com>
Subject: Re: [PULL 0/3] Guest Agent patches 2022-07-13
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 13 Jul 2022 at 11:19, Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
> The following changes since commit 08c8a31214e8ca29e05b9f6c3ee942b28ec58457:
>
>   Merge tag 'pull-tcg-20220712' of https://gitlab.com/rth7680/qemu into staging (2022-07-12 11:52:11 +0530)
>
> are available in the Git repository at:
>
>   git@github.com:kostyanf14/qemu.git tags/qga-win32-pull-2022-07-13
>
> for you to fetch changes up to 1db8a0b0ea2fb72ecab36bd3143a9715c083d5d3:
>
>   qga: add command 'guest-get-cpustats' (2022-07-13 12:19:18 +0300)
>
> ----------------------------------------------------------------
> qga-win32-pull-2022-07-13
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

