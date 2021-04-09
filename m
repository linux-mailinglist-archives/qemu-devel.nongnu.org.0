Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C32359FB9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 15:23:30 +0200 (CEST)
Received: from localhost ([::1]:39758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUr6e-0007pL-Mp
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 09:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUr5J-00071b-EG
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:22:05 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:45612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUr5H-0001WD-Mr
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:22:05 -0400
Received: by mail-ej1-x62d.google.com with SMTP id mh7so8605085ejb.12
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 06:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=olhipoDb5NpUygru0wfH3tpgHasRg0ZESXy3C6XX/0U=;
 b=xU6YmGP9Tg3h8Oa0Co45B09fCbJmy/93Vl8k4K2Ysa1tw3t0Lwb0ckU36iNRKENv1A
 jiJlST5xRxZyC4RBDKldhITLkCGpWaCmQJtSjkGF3pxiPEKQ1P2NUaHF+PeW8IgRvEWr
 HDxyleWzprIOJtkprA33pqt20RDgon85PdF3mnIvHdVQ60emnkt8aF/ec3pn9P1YaK4P
 myXetQ1aZt+b06hhhMoXygL1MyIZmg3ZoVBbvQSI+2sdfP+IQKCMKUkr0M0pRN6fzilm
 jhQ86eefAEnnRODgopypk4f6DJVsn5Xk7CG/rRc7S3zHeK9fO29EFzk4PzXAYvExtiFY
 +6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=olhipoDb5NpUygru0wfH3tpgHasRg0ZESXy3C6XX/0U=;
 b=bQJlQ2DtDbGiLYkHFXqqbVDh/LIcIN0XEwFzdeS3NxQx68BZ7t6BLWDajeOiLivUK5
 oN9hKejmFlF3bgFK6KkJ69j4hQRtrrJLpgodgEpD8GDBJHGlmOhCwQl3QeP9mnwlSwrb
 7iwY6IGSbelhN5CLx8JNPzspVaLX0XtlO1bcL/mxDG1h9SXQg55ccqILExGS4wusW0wD
 0M+RB9s5ZtD8VOJfMKa1HbJxpVth+kABXM7rSMu32pjhuG4APeUC/CQrqOez+3Lx572x
 JpvCoPwBwe14SW8NADM0bmlErLVBUNoaS4PYA557GFgD2x1Qf0FmGr4zKo4zQ0RVmGvX
 fwMg==
X-Gm-Message-State: AOAM532WwwW9o4Zi6IkGzAAEaoPpqmhRJUdecwqKtDw2ymSvMwJkzQN2
 XsYnDXNRKU7uZrEt5Mf6ohbYBC1noGhUQAOOZVR4TQ==
X-Google-Smtp-Source: ABdhPJyEPA186LebwA6sqtjkkrRfyx+JEQDnQ2p19mBHg4jKdc7wdd5Fze18QzN+LpwQ3F3MK9iEjINWlUxSUC48oW0=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr16236652ejg.482.1617974521839; 
 Fri, 09 Apr 2021 06:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <1617874931-4437-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1617874931-4437-1-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Apr 2021 14:21:20 +0100
Message-ID: <CAFEAcA8Y2GetY=LU1ZQ5m5qCutHk-kK17tHCwygo_r2aEyTXbg@mail.gmail.com>
Subject: Re: [PULL 0/6] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Thu, 8 Apr 2021 at 10:42, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit d0d3dd401b70168a353450e031727affee828527:
>
>   Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 21df394d9e2ffce9fa308f496d1ae228cf6cdb57:
>
>   tap-win32: correctly recycle buffers (2021-04-08 17:33:59 +0800)
>
> ----------------------------------------------------------------
>
> Fixes for rc3:
>
> - query-netdev is reverted (that's why the changeset is huge)
> - fix a regression caused by padding for in TAP for win32
>
>
> ----------------------------------------------------------------
> Jason Wang (6):
>       Revert "net: Do not fill legacy info_str for backends"
>       Revert "hmp: Use QAPI NetdevInfo in hmp_info_network"
>       Revert "net: Move NetClientState.info_str to dynamic allocations"
>       Revert "tests: Add tests for query-netdev command"
>       Revert "qapi: net: Add query-netdev command"
>       tap-win32: correctly recycle buffers


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

