Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B6232F37B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 20:08:09 +0100 (CET)
Received: from localhost ([::1]:55926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFo0-0003hV-He
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 14:08:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIFkl-0000wT-Pr
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 14:04:47 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:41930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIFkj-00066f-OY
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 14:04:47 -0500
Received: by mail-ej1-x631.google.com with SMTP id lr13so5518917ejb.8
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 11:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DC5J5sLXEOp4TTAx9aokDrzSE39IqdepVMnm1utptpU=;
 b=keGnSsrCoZO35VCwi+xtG8tfOqBaEdNIy/IGT2rXdQy7clq4Hf3WkQLjSYMh5R9kaA
 iKsiOk4M+2WFcyIvw9iPkSyvzxr3iWaJJ6/tC8/bu3y7NYDovLHsujRteoVIuvdzN+8H
 2xXHkGHrcN1sU+3FE4+5YVWeLEZpfhJgR895hCm4fC9GinsTNtte7nLkG9UpxeaWcv4A
 t8AsIUtZr3yNvOMoCbNJ6bK6MfR2jb0iGmTzwy9m/RMNG0DyCaAETwGm6Vl+/PmOON1X
 fmiEKn3bputS0yNuLryo8Rw48PFtoqQ3SX0JKMzy3OIyIP9Qyp4zsYN8Enr6IsYQVATF
 1JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DC5J5sLXEOp4TTAx9aokDrzSE39IqdepVMnm1utptpU=;
 b=NRbNpylKJmKv8GIfjIQk215yB/NFNgCR0kP0XRUqnJtceXBNgilocAiOuLBeUAwQGA
 2MamsJD7ItbM7jimiABdYmqZNIgBchypEyk1lnZT9UXB6wSXczhIKBkT5L2iFE3+Tdz7
 ie3wXAZTwiWZ4jU7Djkx6i7m92wLqGsi40kjqXVxTNBaEF76tj6/JD+y6tg109FKoY8w
 UsRrgVNkqAwqVJccfkzdQ/RE4U7nMgpBuCUy/6HpZAJmwDC4QywBpkvFygjOiuHoYch8
 qWfi9NrTy+uc5utNfXGWsPjMNe3qqJXdZuKbc/7M3DwNlLfxksNC21JXnzNwWSg8lcV2
 53zg==
X-Gm-Message-State: AOAM530Di26XC6JXoW1YojuTxydYd+FFPdfWdHeAKW2qw08J14mgY715
 EcSOSnWv4i4PuTAcYeIKH9xvKQJZs6dlXW45TjgCwg==
X-Google-Smtp-Source: ABdhPJwBlMWOj9r/Inwd3zUzmKHb9ceLo2nTZ7ioEwpk6ZLDvIcAx+zpMJhRNOQBCI0YxVEb300pkaSkQSPWOp70L8I=
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr3670227ejb.407.1614971084223; 
 Fri, 05 Mar 2021 11:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20210305151143.741181-1-armbru@redhat.com>
In-Reply-To: <20210305151143.741181-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 19:04:27 +0000
Message-ID: <CAFEAcA-8cACaLaUp8x4fnofet5+Rg0BTfeDQaTQ52csqoHK5CA@mail.gmail.com>
Subject: Re: [PULL 0/4] QAPI patches patches for 2021-03-05
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Fri, 5 Mar 2021 at 15:11, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit fe352f5c0056b4d21ae033ec49acc0bce9897e53:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210304-pull-request' into staging (2021-03-04 12:58:50 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-03-05
>
> for you to fetch changes up to 0e92a19b8c3b269dee377b76898c8bd7cadc1273:
>
>   qapi: Fix parse errors for removal of null from schema language (2021-03-05 15:40:50 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-03-05
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

