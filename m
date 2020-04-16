Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A972A1AC5AB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 16:26:43 +0200 (CEST)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP5TW-000140-O2
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 10:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41036)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5Sg-0000Sb-46
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:25:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5Sf-0000hx-7p
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:25:50 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44316)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP5Sf-0000hc-05
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:25:49 -0400
Received: by mail-oi1-x244.google.com with SMTP id o25so16665919oic.11
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 07:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LbEv7BSJhfmeZsEBRpflbOl0RzbW3gd+CcYyFhMsz/0=;
 b=Nx6WPkmjbumIORxCD4Btw2twZpes4NHd52xYIkpjF0L3zQ7bO0V7D/yhfNnK2m8jRm
 oTIUGvTgQzXhS+FUD2+aBB8dffeiWpERFVph754KJfk00DCagH6cu43JCzKyOAv8d5De
 lCeOjtlI9wQTNpJPNtJo4kMyfCgq8vv6PM8adnCItjKI9JxGX50JmesKiQUIc9nB0xA8
 1Nsn/fj4E3Q/vou/7fSWq0fblqSwnSHvgU5fzi0gD+QQY9ak7pKMciGK5NCCkD4YXVKs
 NT4I2P0mgMYzBa5u7Zr9z5uj8hyQoikt4Ao/7plLE/S9oiDfF609TMUaOkzDb/Z3lYla
 +5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbEv7BSJhfmeZsEBRpflbOl0RzbW3gd+CcYyFhMsz/0=;
 b=ZZzw/Gt+4+g7Jjb4Y2sno3hXXJPeJoTqZU3FcFF3VEjRn4mdjlAbTOzPIQYsa/O15N
 lBgV0cht76FPRfNi16SWsmBBfT/F1oPL85mCJ2mr7O0eHDxzGsQifNnMT6OlfIXzWAr2
 1Vw9hMmWo9IB5tWTJqNE33pRx8nj+kLVuEywqazvAV6MX9BRtWyAdxubViobndgy1XZ6
 xpLOuLJ4F8RajLjxPWlnjUygBiuRjV3n8Dy1pnrhKthlZlCT0qs7X9YcCrlFHxFTQCBr
 K4jWP95T2C058StSLR3RLBIS8LoVAEc5RIdnrppkezGiZi+CBhwdkJUmfWUOSByLjdBV
 9MkA==
X-Gm-Message-State: AGi0PuaXc5VjicXvbN0nmiA1ew6cPMBXSn1PNUO5bdTa/JgdjjEsw215
 dCGpoai5DQT9PDWNdQMvLlBFFl7L3RauePRBDliJ9w==
X-Google-Smtp-Source: APiQypKC1zFOFFyvke4XXJx1stbYXx6SauXJxERN/BfcM2TVZqHnt6pVW+4crxAS73CuWxvJbS7mKadQklXOaYu3kCE=
X-Received: by 2002:aca:170e:: with SMTP id j14mr3047364oii.163.1587047148413; 
 Thu, 16 Apr 2020 07:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-15-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 15:25:36 +0100
Message-ID: <CAFEAcA9+GQbZ2COG=JnirsTUEj_CMmOnhxEwGZG9ZxYr6=s0dQ@mail.gmail.com>
Subject: Re: [PATCH 14/16] target/arm: Reuse sve_probe_page for scatter stores
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 182 ++++++++++++++++++++++++----------------
>  1 file changed, 111 insertions(+), 71 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

