Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205C7789A9
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 12:34:58 +0200 (CEST)
Received: from localhost ([::1]:50970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs2zY-0006Nz-UD
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 06:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40832)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hs2z0-0005zF-F1
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 06:34:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hs2yz-0001Y9-EL
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 06:34:22 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:40370)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hs2yz-0001VG-70
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 06:34:21 -0400
Received: by mail-ot1-x332.google.com with SMTP id l15so4781096oth.7
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 03:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=28wKYrw+PB2qf7MYtlXfMbxVM/QPzyO1QbIheEBhZzs=;
 b=EhM8NlQGYdi2t/zh0AIkdqn9ihJy51NTBDO6ajqlamoERM+F+eFHW1bXjydy/sACgi
 Jq5JlJzipWNm+1DHBii/wLbSmHHzJada4HjNWeOcuI+C/SmSOA7k+Z255OUNqwHWQIH9
 q+fIMmiFrcrV5mmYeOLVvyiuQlGA1gp0QggfyO6gIVcgCFxjl1UOFcuGL1/UcJHIzKxC
 3ldLGTPX6BLorJZt6WxIPEsc73io4VQWCkEc/cOU8RX7hwzlsygy6LZYNgVsJZV9Myay
 5PnMjxG7YzwNWDfxS8DIu6g8JlqX75v+k36YKGlUpPdeyW/ZbcijsRdjRq3r8A1ILqhH
 Fi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=28wKYrw+PB2qf7MYtlXfMbxVM/QPzyO1QbIheEBhZzs=;
 b=D9nfyq0KoPyvSop8mQi72gq1fS2AZHpRuoAFSrSDcw42buc6sFj7KwjDkSOHJtEtlu
 101rXxchsoMkIJQOj+/uJ7j28rAifN36t7ZK00EZIoEwg0bht/8AJVjIk8JEOcKKdXjh
 GYsYOhKlelnqti4N4vj9dpI3c4y4wUDNIho2lS0qgvOwfP6MRAGIjck5b6CI3Wxafw+O
 Hwws5x+smvXEVT/Thcttxlbp5MVwRyVLQR78+a73f6aicYSTBVqxQxtdRqSXb/bIVUec
 T8/lkLKPcV17bsYtS1BxGuSPCAny6EcWypdr6efBRU06oG5XwEZ6KPan6HZEg86Nu3nh
 Kg1A==
X-Gm-Message-State: APjAAAWiG3d8y3OHsel+nnQbyxvxpwmI2+0gkeMmQ2F5dsp/ASdEmMMj
 oNOlnEmEU+qjMYAtOkyEAJOtNUe8ozX7noP4pyhKmQ==
X-Google-Smtp-Source: APXvYqwQLByyjD12AT6+xad0gBxGmCu5xe4pZMlr+WB2NfoqGotwRpEM6RL0fshKLBz/E4nwHa5eab/UsLWXbXpG628=
X-Received: by 2002:a05:6830:1653:: with SMTP id
 h19mr26137056otr.232.1564396460365; 
 Mon, 29 Jul 2019 03:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190726232731.28572-1-palmer@sifive.com>
In-Reply-To: <20190726232731.28572-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 11:34:09 +0100
Message-ID: <CAFEAcA_S8+D4iaPRTo1Z2aUt8xpg=W-3bte5vBg78R4AgfxW1w@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::332
Subject: Re: [Qemu-devel] [PULL] RISC-V Patch for 4.1-rc3
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 27 Jul 2019 at 00:27, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit bf8b024372bf8abf5a9f40bfa65eeefad23ff988:
>
>   Update version for v4.1.0-rc2 release (2019-07-23 18:28:08 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.1-rc3
>
> for you to fetch changes up to 75ea2529cf09aa4630c5357f9814f04b6697e8b7:
>
>   riscv/boot: Fixup the RISC-V firmware warning (2019-07-26 16:03:48 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patch for 4.1-rc3
>
> This contains a single patch that fixes the warning introduced as part
> of the OpenSBI integration.
>
> ----------------------------------------------------------------
> Alistair Francis (1):
>       riscv/boot: Fixup the RISC-V firmware warning
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

