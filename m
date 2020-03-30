Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD15E197BA2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 14:15:42 +0200 (CEST)
Received: from localhost ([::1]:48822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jItKP-0001b9-P6
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 08:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37256)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jItJ9-0000e4-UL
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 08:14:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jItJ8-0001u4-9M
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 08:14:23 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42085)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jItJ7-0001th-SK
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 08:14:22 -0400
Received: by mail-ot1-x344.google.com with SMTP id z5so17466739oth.9
 for <qemu-devel@nongnu.org>; Mon, 30 Mar 2020 05:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FdKRckxZ6V8t6EaPLNA3h8R0ImgkURpUKZ3ovqJEVvw=;
 b=F1w8I3fExY/TM574dqHR6Dige0oXLFE7OGdE9ftJlyLitw4IEs/D2RFxsyJ7aX4Ahe
 Vrc44cNz7RFzC8nFPdoEOQHrWX2KMyZ5mWv8sPjc2K9tI/gZfAzbtVWxUUnacUm+XkMX
 13KJpZsgF41YJkQw4wbznw7uWz3QU6VeT2vHKKf9EGDAVCcSZ8vh9KIkhQY798H/Gq9w
 fPWhorTRwDAuHrA6Gmc4Y0QjuCQRA/aHMkDpXyrsBCInggp6M+PCuAQreUKANbAzrpS1
 8E2oRSOgXlA1hBlFzOxKkOGIA8HN4AvFUnM2YzVvAp7EfVayV6y6/U6rZXY5rX70oRgE
 pFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FdKRckxZ6V8t6EaPLNA3h8R0ImgkURpUKZ3ovqJEVvw=;
 b=aZZ85cxl6a4JuqtY38pCk27EJgx07nrTOin/vXxSIprYENCRRD5HxVG5F6N22jKoPf
 yRfSxn1vqsPyckzFxgXy53Ab4LMfHXKl6bCWemZqijYqxwjYLqG+SQCxP+QCuGPUAgxc
 ovkxNcXhp5js6J+bLPyHBq2r+tvol8pr2xO2zm5pzCgb4aXAiat7duRNdTnA7fybt46V
 aCQFy80cWIrBCrZ93zqlv+a39YQthBgGdb6rhsqkBQLvHpGwd6WxbzO5pX5sROlqCk1n
 K8V3e5W9sNVV7Leqfx4BOYGw9U9vrP+Key4ZHVifixdny8pPBWATzTG0s808Y7ySm5sQ
 HolQ==
X-Gm-Message-State: ANhLgQ2EoScVw4i8MxvLlQj8J4saLnVJxKwaba1EpTMi32IXzYKSy1+d
 k/HfXkH7WFANMvTFEMWHewtSbSUFp2qCslKITEIV0g==
X-Google-Smtp-Source: ADFU+vtqwW3RdgKVaFnOew7+Ct85uFRi4FHlLuPUyNRSA5jKgFH2HADw7BDPbqVzLXEspUHsLsLj6FbFZdB5OBm+pK8=
X-Received: by 2002:a05:6830:18f4:: with SMTP id
 d20mr9022862otf.91.1585570460905; 
 Mon, 30 Mar 2020 05:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200330102945.2388294-1-laurent@vivier.eu>
In-Reply-To: <20200330102945.2388294-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Mar 2020 13:14:09 +0100
Message-ID: <CAFEAcA9MKKYQpwir9CvXHQqmWCs3aFwxp=2tb4_FP3jr4p5MnA@mail.gmail.com>
Subject: Re: [PULL 0/1] Linux user for 5.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Mar 2020 at 11:31, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit cfe68ae025f704f336d7dd3d1903ce37b445831d:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-5.0-pull-request' into staging (2020-03-26 20:55:54 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-5.0-pull-request
>
> for you to fetch changes up to 146902964d66881da797e45a5950732e38532e3e:
>
>   linux-user: Support futex_time64 (2020-03-30 12:28:30 +0200)
>
> ----------------------------------------------------------------
> Add support for futex_time64
>
> ----------------------------------------------------------------
>
> Alistair Francis (1):
>   linux-user: Support futex_time64
>
>  linux-user/syscall.c | 140 ++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 126 insertions(+), 14 deletions(-)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

