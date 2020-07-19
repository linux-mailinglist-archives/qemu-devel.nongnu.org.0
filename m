Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2A22537B
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jul 2020 20:24:32 +0200 (CEST)
Received: from localhost ([::1]:40584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxDzD-0001MD-Bi
	for lists+qemu-devel@lfdr.de; Sun, 19 Jul 2020 14:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxDyH-0000il-TT
 for qemu-devel@nongnu.org; Sun, 19 Jul 2020 14:23:33 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35]:45018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxDyG-0007KE-B4
 for qemu-devel@nongnu.org; Sun, 19 Jul 2020 14:23:33 -0400
Received: by mail-oo1-xc35.google.com with SMTP id o36so2758429ooi.11
 for <qemu-devel@nongnu.org>; Sun, 19 Jul 2020 11:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pt60wHKfwxD9/5sGrjX2ejJkmo2yeA/Dc+kD6RA7mG4=;
 b=uCImcpbVveD9RalyXlDcGBb+MMLcnvUUpzgoNMx5S3TB+vXybDB++VYnboGEAVKkOA
 zbncWSJzTYA9xJliZfTuveIiVtFLiq+mxSaQP4rbAHhF0si0vdsRU9SyDB+Ju45oCXFg
 lPDBTPk9u5MeXOplw9GRrS6drxyyPIuW6jwC/n83dRN0VpX0+77AlC4YO+GjsZspXTY4
 ppUVdzHPRTlbWr2DEKJQl1Xz0ca4DzCJrGJ0ytV+U2zh+ujF+btl6vMLb7OLp8rDteLX
 G3j0H75lYCbNvEpFKI61lBh9umlhnT1IqIZ+xqsnTYS4WB0HcEt0tbtwbo13uXF+R08Q
 tMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pt60wHKfwxD9/5sGrjX2ejJkmo2yeA/Dc+kD6RA7mG4=;
 b=OdGogzZJSDztbX0GzOCju3M8jfh3xHRvN/7Molp75UQ5pkf9ffglqqyACLGndnMzf6
 b3x/WiaV7fP7Hu+4YmiG8PEH2n0T2iPLtE/xrkJ6Lhv5/AExsOQ+n33fRgXORcheIkgF
 Rs/w+uUQWG+4LkMEoVcdP17/+BxxBvNqPiOxeHHdZjtdvMKYQkXzfXpW2E02JwnJ6DXO
 CxeAb9mA8aob9MDD9hwigXIHXFcmH5b+Q4B3Q8z+N4BA65B+69wiv7rePgadc6BDtmx9
 QRETq5lVwIIxiTbtesFU8dY6ihalYx1nAQW6lpp9qmyjC0ccNAs+pmgmP5g2z3TemBD5
 mfdA==
X-Gm-Message-State: AOAM532iBdNbBRbaeNNd0m7Ak+pVdWu3sJ70Nr7ReuKLoa7DI+HNLudE
 1i2S2WJx8dKbRpZljJ+zKz+YugKYYqCNdgaRcjdagw==
X-Google-Smtp-Source: ABdhPJwtyTQe7YCpdJKWKtxtoP1oiX/FdoeDWWW39mcAS1k7IINlOe46ig01pr0tSCSG7w+qUBCWV2kyq6VofKN1J5M=
X-Received: by 2002:a4a:8784:: with SMTP id b4mr16636725ooi.69.1595183010524; 
 Sun, 19 Jul 2020 11:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200717181623.2742758-1-richard.henderson@linaro.org>
In-Reply-To: <20200717181623.2742758-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 19 Jul 2020 19:23:19 +0100
Message-ID: <CAFEAcA8H-APE_Xttiz-J2HLkrys0zgcndv3tbmP7F1w3EY1xYA@mail.gmail.com>
Subject: Re: [PULL for-5.1 0/3] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc35.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Fri, 17 Jul 2020 at 19:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 95d1fbabae0cd44156ac4b96d512d143ca7dfd5e:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/fixes-20200716-pull-request' into staging (2020-07-16 18:50:51 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/rth7680/qemu.git tags/pull-tcg-20200717
>
> for you to fetch changes up to ba3c35d9c4026361fd380b269dc6def9510b7166:
>
>   tcg/cpu-exec: precise single-stepping after an interrupt (2020-07-17 11:09:34 -0700)
>
> ----------------------------------------------------------------
> Fix vector min/max fallback expansion
> Fix singlestep from exception and interrupt

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

