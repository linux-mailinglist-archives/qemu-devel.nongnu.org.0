Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117603B8084
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 12:02:43 +0200 (CEST)
Received: from localhost ([::1]:58038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyX3J-0003RN-KU
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 06:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyX21-0002b9-83
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:01:21 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:41883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyX1z-0005xv-9b
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:01:20 -0400
Received: by mail-ej1-x635.google.com with SMTP id b2so3256777ejg.8
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 03:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wxo6R9KeS95tSq6+IAUQbuq6fwHBqe+aP89uiKsQ0Bs=;
 b=A/6Qv5AS1nyu0rOnSv306xjkz3o8Z5YWmFwOSFMc86AZPDxSh+X61pS1gcLzKMG/jn
 WJDocvn13beGa5cVwmd1ZgCgtA2VGxv849cvDnD/lptgurG5mXm91tHs0bFl5c4j03bW
 WTlxXI/Y+J43Owy2Q4XSoHSkXaQBKbbBTC1NTxPuLNWjJO5YGl0idZWjLmdFFQ2X/GlC
 pZR604MWVuqgzkwO3V+6GzGdd1bbebGf2vI7oG4MoO3qU41EeyPP/eJDuYamGR13L1uT
 3/Ifvf6GgtLeD2WO939BTJ/yYmStPl7g3/jLIz4EP2L0nfebO2eJ1pOJgLRXW0Q305H5
 9reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wxo6R9KeS95tSq6+IAUQbuq6fwHBqe+aP89uiKsQ0Bs=;
 b=et1JY8fjcQkPr+YsggEEdars7ijczJFlSp7teaqJJChUd7GpVi25unDAirzpeM+U41
 c94EFAtnJfOOnaqdWPcYvgphnhEb6Nk/+9M7XhTUyICLPYB7TCDAo2ytuwLN9DLp0zrb
 OuU58mM5I7rpQRvBwGQOPvW1gLEomPs4uopRaSFLeV132ek6gUKOt39bhXY7r23HHESH
 1P+VkYW0YbFCWDMhMNx5VsH695rrv6NPytannqX4BfdY1YUpYi2I83RSw0QGoziR+QpC
 OTpt4KwRKWPEDGKtAF3UV9gj7NhJ7fy8tRHoTmlAgprplUkDiHSEOOFPrpjw2Zka/Uyl
 EuXQ==
X-Gm-Message-State: AOAM531z5UDpgCmyDaBclOvZTo4/cAToE+oX5jcEpYwoFU0VoMmJf+Q9
 A6HLnkH81bEX537QUrn5dmP3Bc1boS08GgmCH8z+Mg==
X-Google-Smtp-Source: ABdhPJyhKuE+OCUms1qQNvdmG+Nu2cdtfpv0yUaR61AhGNfDJUZiyELHmyJBHz6EL+764/hJDLVT3fqzZvH4MhgGZho=
X-Received: by 2002:a17:906:4759:: with SMTP id
 j25mr34030661ejs.4.1625047277262; 
 Wed, 30 Jun 2021 03:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210630092127.374720-1-thuth@redhat.com>
In-Reply-To: <20210630092127.374720-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Jun 2021 11:01:06 +0100
Message-ID: <CAFEAcA_XDvTxRHWE3TwP-hZk_DeS-AUCyv9-WZCYKE3zQtSU6Q@mail.gmail.com>
Subject: Re: [PATCH] ui: Mark the '-no-quit' option as deprecated
To: Thomas Huth <thuth@redhat.com>
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
Cc: Libvirt <libvir-list@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 10:22, Thomas Huth <thuth@redhat.com> wrote:
>
> It's just a cumbersome wrapper around the -display ...,window_close=off
> parameter, so we should rather tell our users to use that instead.

This is an interesting definition of "cumbersome" -- personally
I would say the long -display option is the cumbersome one :-)

-- PMM

