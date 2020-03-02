Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1AB1759EB
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 13:02:12 +0100 (CET)
Received: from localhost ([::1]:59512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8jlz-0003FE-K1
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 07:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jku-0002al-1F
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 07:01:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jkp-00043u-9c
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 07:01:03 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34852)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8jkp-00043c-4Q
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 07:00:59 -0500
Received: by mail-ot1-x341.google.com with SMTP id v10so2134369otp.2
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 04:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SieApYFXRzIQB5KH3cM4Gzj/UsCbSKojZUWWM5m4pls=;
 b=WJlclBzgN22npSWl6Vd+ZXTzgVd3AR0CbLRkxxc6Bxmuw6SrbxVjK3nU2uR8+fRxuS
 4g42h8tHQoSfLpM5AyPH4j05tS3TksS1vyZj0Db0P9qQuyGZjSBNQRFJzLnJuYRvcX1p
 x8OWF8mFe0lYJf1LQij+s3lqISevxh0w0pidd9/W2mCrIDl3AXphyZKQ9TfCMdNXX/bH
 sY70bEEyu+Io7SsV78xLsiEEGhznhb640jMA6SlS+cDEAfm8nyTwQWW3FUteJzmQJ7o2
 Cs71asFYcR+fnYvrn9nyxV/q0SsZ7EOM1Zw0uP8yq+EmMJKV5VasKM22jCeYoYHYBJ+t
 FfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SieApYFXRzIQB5KH3cM4Gzj/UsCbSKojZUWWM5m4pls=;
 b=d8cIcFhOHI+FrFXXBPLQkGFwUnislhZuQuw+2UoGdTHNu6zgPn3XLOAvESTr+ku6i6
 f859HHPlaHVS3MT7D1NQiSWtX8Ky7NFOFSXxiQjVCy65nlDBcJsPmi48ZxnPGslqngJ3
 jLo+7p79fx78s2kNSuY6PR5bN3F0HYXLbkre2l/2xUPW0RQJ/lm6JDLh3MPbVhQkMSjC
 pMR/cYy4vUio0kKPOgTswk8bewbqvqWeZAJHH+vqpCzcNZ7ixyl8y4gZaPqmWlkJzc+L
 s+dtGnNN/4vN6kpt/Jz1BiPtHcqYA1kmJgF1jZCononNhdcymppN6cbeKR3YF56x2P9V
 tiLA==
X-Gm-Message-State: APjAAAWDI0HngGozWhtdzQrF0qXSwl1T4IPjq76+iJbbHsTtcIegpOzr
 D0a6198BrVBYytfnkhtvzRevypJS3a88YlKujbVL3g==
X-Google-Smtp-Source: APXvYqxX+IWHdSnCr72Cm5O3a55rS1q0Ieo2wO5wC+SfpIrZRFdOr6e2w7vjHZ6lvmgPkeYQh2SWgJ04jxteIEHjScs=
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr12229792otq.221.1583150458104; 
 Mon, 02 Mar 2020 04:00:58 -0800 (PST)
MIME-Version: 1.0
References: <20200225031222.15434-1-richard.henderson@linaro.org>
 <20200225031222.15434-2-richard.henderson@linaro.org>
In-Reply-To: <20200225031222.15434-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 12:00:47 +0000
Message-ID: <CAFEAcA9p3O8bz563_fw21SHqvbLPf8Jz-cwFYh9L6QXh61Ne8w@mail.gmail.com>
Subject: Re: [PATCH 1/8] target/arm: Replicate TBI/TBID bits for single range
 regimes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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

On Tue, 25 Feb 2020 at 03:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replicate the single TBI bit from TCR_EL2 and TCR_EL3 so that
> we can unconditionally use pointer bit 55 to index into our
> composite TBI1:TBI0 field.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

