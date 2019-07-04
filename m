Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C25FBB5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 18:26:44 +0200 (CEST)
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hj4ZH-0000eO-9V
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 12:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44926)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hj4LK-0004W5-Bv
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 12:12:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hj4LJ-00051i-9J
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 12:12:18 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:43518)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hj4LH-000505-Gp
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 12:12:17 -0400
Received: by mail-ot1-x32b.google.com with SMTP id q10so6408215otk.10
 for <qemu-devel@nongnu.org>; Thu, 04 Jul 2019 09:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=00JDCefD4NWPvA5XJuBq0WBIgCTnF/LahPqpuB0moZg=;
 b=Qt88JRBWxXtbUrdUTVDD6zf0ou15FR47+pI3qw6qrCP7H2htLYOjwbo18662WuL4Jp
 ERaeTrTV4IhOPrRxHxQqXsZkCbdJimmmEio05vLp+4UJ/y3B2PsjfTwGcvNM7Tqwq1xt
 fJvUshFxT2dS76s9Zd8/d2IAor73SKFXM81t7RkB6B3oqURynNd9l5O5v6NZGq5k30pt
 n01PoJ2vpXiqczAPvbNBjCGmNTLxlQbeLToHqQBIBnPsIS6tg8aEhdRv47hpgE2snEwW
 ddM/dRBDGb5uvk8SeJe0R4KZE3mlITpQlhZDL2rn0g/Fqf+Vfk/Q2x3oKaxrijs7HTXU
 BRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=00JDCefD4NWPvA5XJuBq0WBIgCTnF/LahPqpuB0moZg=;
 b=ZL8pBVG/KMD9fdz4057m9jyMvrIdcLnlclsWQo35XH2o5Y357hpa7ZjgMS5ajCpXtT
 Q/i9y1fL1XIb0vBEQ8nUNTuKgODB8A/kj/UHf5hh5V95FvaGIW38ETECd3cjbMEJIAgv
 lhh9ZWGXBGV1T3thiHVqhioW64wvzEuMMmULz1HwajavaU8YLoqMf/dxpORzAqNAdRqZ
 AxBI5KkNfNiEXxLCEqqHLuKXdr0FcSra78ridoFPWLTii6BkJtXNNQqGYfgY7hmWhZ0B
 y+Gr4hpO3nn4RuRzqW6bSX7hm/1D83AjK75/S9DYpeP32iXcKgryQ+um2u1w3I0xbiZq
 guRw==
X-Gm-Message-State: APjAAAVK6vqYZo3AVjX6glj1H3Kf4a1HKOq5TSYRecU5yAUqnB6v+rK9
 sYPXWXOa21KX7AyrIP2A9pt6XYDq/LE0FWNVzxj33w==
X-Google-Smtp-Source: APXvYqzUd7fqPUSuWCU7d0Wj6Ytdmc2QOL7fVulRZVkPV3f8QeelWsV9qhiWLliFfFBnkgJT9i+o7RXl2ynKjldXt/I=
X-Received: by 2002:a9d:711e:: with SMTP id n30mr32206589otj.97.1562256734237; 
 Thu, 04 Jul 2019 09:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190704070442.2277-1-kraxel@redhat.com>
In-Reply-To: <20190704070442.2277-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jul 2019 17:12:03 +0100
Message-ID: <CAFEAcA9u7scht9EP3Dx3iVy4c_-Nmt7=8pU24_J5rDFLUcYydA@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32b
Subject: Re: [Qemu-devel] [PULL 0/1] Ui 20190704 patches
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

On Thu, 4 Jul 2019 at 08:09, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 506179e42112be77bfd071f050b15762d3b2cd43:
>
>   Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.1-20190702' into staging (2019-07-02 18:56:44 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20190704-pull-request
>
> for you to fetch changes up to 5b8541c6c70db776d0701bb5ce5862ae15779fb5:
>
>   console: fix cell overflow (2019-07-03 10:57:12 +0200)
>
> ----------------------------------------------------------------
> ui: terminal emulation fix.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

