Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3D85D14A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 16:15:16 +0200 (CEST)
Received: from localhost ([::1]:53774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiJYx-0002Cz-ST
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 10:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44826)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hiJTm-0006vY-Fd
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 10:09:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hiJTk-0004bV-K0
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 10:09:54 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34733)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hiJTj-0004Yr-70
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 10:09:52 -0400
Received: by mail-oi1-x241.google.com with SMTP id l12so13139875oil.1
 for <qemu-devel@nongnu.org>; Tue, 02 Jul 2019 07:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YlTlLMZQYm26g/e2QEcTS37y9KclWpkZi3M4vw9x8cA=;
 b=tRD4U5Hik9DOym6FowX4ZA8Mi1i+ewzVnAyVH/9rtxjSZGB22273gHoYxwxrV8acqH
 eZdsUTcAlSlXeW0UihLcdWDoxoj8m0SUst8wBN7dz/gOA5l1ExsohgLRhtj13htKC/zw
 oqDGDPKXNAag3zbladMbNntxs3YtNrY1JYXr5Lg4OAL4CY7TSedxX9NHh/kQcu0wVRw5
 IrToRsimulamcoT5NTSWcMXjc0PL6Yw/Bzqo1okIlv0XKq8sJX6Kfxpk8RXQmsHKR60x
 Qh7/04jKDrIMtTIn/Fve8ovxgx9ef7bT+JMqCFxe81xkE6CLC7YYGLC88QQwm1iGeq/T
 bMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YlTlLMZQYm26g/e2QEcTS37y9KclWpkZi3M4vw9x8cA=;
 b=PocXkL8opBkAjNoEPTkE4k42ANQdJ6oHLMpELkUHs5DljqY9hwqT9X5NHzOYMHbjSc
 JyZ9SCPjRJq1KkfBQ/2NgFbD7JzG1fEBGiQ0wGpaTb4Eh+CAca2fYE4XLzsCmJTaZ5L2
 Qj7Aq2V9DJYNCJwNC5sb7qI3QX5WV1kAK9Z80alOct5KQM+YGCnsqQGzpmxznFjChcti
 tqCl0eURGFTKBC1+wmBFQebYZcwTB9cFlph6rFAZ+hjTT/TN0sKEbHG86MCayFASqvVt
 qCgBomDzWBduf0zBF9y236cXqVWxeQA3EYfnIgTYBoa1WRz5vujTDavh9wLN7isqgNMd
 80rw==
X-Gm-Message-State: APjAAAVWAXVtWHOJtBaT5KEEVdxpQQuf6iigzBgoAw+fUAUBctN1pfms
 5J4OQLAZAJALSXxcKg3DqgUeRGgcetumoKfzo2KEyQ==
X-Google-Smtp-Source: APXvYqwnQXnLmgr5tJevFFh9ISVLmU20uOXrt9KLoUPMiGi96EadczfZRz/dZ0BO2xYmpsgfHiUNMMiA9sUrHU4OC9E=
X-Received: by 2002:a05:6808:d4:: with SMTP id
 t20mr3213222oic.170.1562076589911; 
 Tue, 02 Jul 2019 07:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190702104732.31154-1-richard.henderson@linaro.org>
In-Reply-To: <20190702104732.31154-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jul 2019 15:09:38 +0100
Message-ID: <CAFEAcA_Q40JLHhBj9ixLr_7Z-3JFk+UTRVM_1EHthKzAGjAZsQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH for-4.1] target/arm: Fix sve_zcr_len_for_el
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

On Tue, 2 Jul 2019 at 11:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Off by one error in the EL2 and EL3 tests.  Remove the test
> against EL3 entirely, since it must always be true.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> This bug resulted in an infinite loop in the kernel's initialization
> of SVE with EL2 and VHE enabled.  It's probably worth including in 4.1,
> even though VHE itself won't be included.
>
>
> r~


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

