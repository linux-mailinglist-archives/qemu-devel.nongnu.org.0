Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3599E1AC564
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 16:19:59 +0200 (CEST)
Received: from localhost ([::1]:34824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP5N0-0004gt-9R
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 10:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5M6-00049M-Aj
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:19:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5M5-0006C4-Fr
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:19:02 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46540)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP5M5-0006Bn-B9
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:19:01 -0400
Received: by mail-oi1-x243.google.com with SMTP id q204so16654235oia.13
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 07:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IMeJfc+vCl0HW4OFAaGQKhiEiYWeHp3jOvXvTEYD8EY=;
 b=Ax8LmD9lkd8WX3GMTamVLV4i2+B4SN7vWs8gYVIIpDppOkmmGCshJrOpAHTPIVUR09
 BCLc87uwxo+svsa8eTAKCe82MgmSurAd8qwt7EbqjBXsas43DriHClwL0jT1KR6G5ZNu
 obqokjG4C7A0WAH3kWpowqh93InqooDmJFdhrtsteXHMdaTfZMwo0/wh/Tn6x+jwV5OP
 WW9SMmI+o+52jIaFeRafw7Uv8J4DmR4Jbe2zkVqksUtKz2ssh1tQLyiEASB+9cRGDpoE
 B1d0hS4rQSNDX9feUaryd4MET7LaheUQJbSNZ0NduKj4gQ6E3wl8ltPlnj8OIoNaGjPm
 T+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMeJfc+vCl0HW4OFAaGQKhiEiYWeHp3jOvXvTEYD8EY=;
 b=HpuRdLkAK7o+9KsKM4Ap9u9P3fhM5K7G1gBJwna/MtFX5YVK+ZpU6XQ7H09xL5/Ke1
 5umR69V434lGlZIGZjyubUoRuYP9d+ADBCgb8/fuaT0dHBhQfGUIMc7QXDm47BPDQzAC
 tJsb4zZToYE/9RcOxGu6umsVmEBwWYO8gDU14kYSYKKP5gQmfOih15iBOWKgo8NRAZ0U
 B4Ddqvs83iPpIDKD+HmwQlCcynplQPYkjF31Nji/tvTLV8wN2AfidKxF9P+SOt8ge/Au
 zBCMc+f/du65xlcPlFfCKi1lT6rqYiuEneLlltWchLM1iIheXGoZ7fidWhLJz8zL5dDK
 Ws3g==
X-Gm-Message-State: AGi0PuYQZbWuAONDthGI7baNGE7DBL/Pu3ZOgTQztyASFg7w76ZxGA+c
 igfaKKs9kgirgRP/LTd7pXfjeXiOO4ziUKG0qVkqEw==
X-Google-Smtp-Source: APiQypLChrVwGcmst1F8JkFSFmSkKNtqCtuJJDuM7+enykZSXdqSobG0XB+Qwveg7ao//s1AwZEoY2eVl8BocsvupPI=
X-Received: by 2002:aca:170e:: with SMTP id j14mr3025435oii.163.1587046740512; 
 Thu, 16 Apr 2020 07:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-13-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 15:18:49 +0100
Message-ID: <CAFEAcA80hY9L+sgf=jYmor6ONgumP92_T5t3PTr0kOh1gnAsAg@mail.gmail.com>
Subject: Re: [PATCH 12/16] target/arm: Use SVEContLdSt for contiguous stores
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
> Follow the model set up for contiguous loads.  This handles
> watchpoints correctly for contiguous stores, recognizing the
> exception before any changes to memory.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 288 ++++++++++++++++++++++------------------
>  1 file changed, 162 insertions(+), 126 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

