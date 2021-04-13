Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07DF35E78A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 22:18:27 +0200 (CEST)
Received: from localhost ([::1]:54948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWPUQ-0005ir-Ni
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 16:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWPSL-0004s1-6P
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 16:16:18 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:35670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWPSD-00082K-FJ
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 16:16:16 -0400
Received: by mail-ed1-x529.google.com with SMTP id x4so20931833edd.2
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 13:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tFLSz6rGH9eCCh8O8EgNJo2/Wypb2qcUdLGZ/KYVDlE=;
 b=A7iaRv8kY6WO6VGFsauffZ/E61612MOwVFdeifrWB2AnQ6Nk+Jon+DnL3y2bpAZyxP
 sObn8WLfx6KXNqRBe9IIAICHfl7X0QOPbnAiSn1cyEUPCx6Y4jvP951ZURzhhkqSKMFo
 ZoY6rVcMIML+49VIDwHT0VY3bI8OIGhARl4IZ7PGq3FQfGjUyku/zcM1hDcopM+vz9O6
 wj1QZmC2TYVw2TbCuAt0VVe1jZnBHWjwVu4jDLmKtGp/Z+eH4ACbrrDffvjFrcaMga/N
 rd5HjHgsUZ63Qn0QWr7ht7IliRODvLsdcfCQC7e3QzB+ZNgKmtdZeP3flmeElZYP0MFq
 5jzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tFLSz6rGH9eCCh8O8EgNJo2/Wypb2qcUdLGZ/KYVDlE=;
 b=oJD866kHk0dhzajm06SM/mAmcso8vDoYLONPnmGSQEaxZtVwvFO7GwELn88eD8WTx4
 JrTZyR1+yXuiFOx9UnpqorWDEJ0xNYTlxc+eA4Tk8cohpD8Ng5H/a6t0kMxF0XqfaIK7
 swpZPbYACEE7Bhqg6C3Xno7eXXfPjH2zU755L8u0RLzQ34qKAJYazpb0jOL7XfswM/bx
 r8rzcJ1X1CB9459uUhvXrCNUyRinY4mzu4wfMZEQSG1HJ7hnnvDEa852VUlPEpVIVTbQ
 Il5A7vQ6SS2iYEZFhmfiLaaLcmWydCZmNDBrwUPvIqYt9mZWH9QHHuBd9SVlcMWIJrfB
 RQgA==
X-Gm-Message-State: AOAM532x+YEofNO6OU0Wt/hXdX9xfo/Knr7niBhfneUmvuOW63A1TI39
 9OKq38PuSj62PRLW8vgeXE3wPVS01pzRkbrItZudaA==
X-Google-Smtp-Source: ABdhPJyBDx8eBX9T9tVV3LEfkC2UpSfx7ZdklJgIjuA8N3l9vnwkSzMmMPbRqKGasw6TT7QQfhMrke3bF924n9dW7II=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr36379466edv.44.1618344967799; 
 Tue, 13 Apr 2021 13:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210413160850.240064-1-pbonzini@redhat.com>
In-Reply-To: <20210413160850.240064-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Apr 2021 21:15:22 +0100
Message-ID: <CAFEAcA8V05A1CPzxQ-3H02MSXP-NP3L8eqXQxW0z5wJaOBQfiQ@mail.gmail.com>
Subject: Re: [PULL v2 0/3] osdep.h + QOM changes for QEMU 6.0-rc3
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Tue, 13 Apr 2021 at 17:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit c1e90def01bdb8fcbdbebd9d1eaa8e4827ece620:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210412' into staging (2021-04-12 12:12:09 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 1a0b186eaf3d1ce63dc7bf608d618b9ca62b6241:
>
>   qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common code (2021-04-13 18:04:23 +0200)
>
> ----------------------------------------------------------------
> * Fix C++ compilation of qemu/osdep.h.
> * Fix -object cryptodev-vhost-user
>
> ----------------------------------------------------------------
> Paolo Bonzini (2):
>       osdep: include glib-compat.h before other QEMU headers
>       osdep: protect qemu/osdep.h with extern "C"
>
> Thomas Huth (1):
>       qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common code

This still seems to have the same version of patch 2 that I gave
review comments on, and which you haven't replied to ?

thanks
-- PMM

