Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47A0A66EA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 12:57:15 +0200 (CEST)
Received: from localhost ([::1]:44020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i56Ut-0006OP-0g
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 06:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i56Tg-0005jT-B4
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 06:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i56Tf-0001tF-Gq
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 06:56:00 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35899)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i56Tf-0001sf-Ag
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 06:55:59 -0400
Received: by mail-ot1-x343.google.com with SMTP id 67so4780597oto.3
 for <qemu-devel@nongnu.org>; Tue, 03 Sep 2019 03:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4AuSqKxqun6TlKh0JT+UXYcVeve7rtoGZH9FW811eRM=;
 b=uUM9rbY6MBe2CNN1dhfFPPCYVRDTofe3+0o/xB35Jz91ZDCBS0anzqZLIDrerInUuT
 GEieAgAa4QHXfZWXwsc0lk1SpNuXkvl8CuIRTczNDO9AZjZmHgqRQWo2hSSpEtJPgR1V
 NkmLYfVFZFdJoHM1/E1urAXkLfQ+6mndbG1peO01e2mMqhan8yqZbxpbmbeHa11XibXK
 Ie2qeoq74DR2ZLgxVIC1hfR3Gj3PUYxr8e44yXgfrPlnjnLY/zNBhDNBZbrtOpOyi6Yk
 6cTGXRUnh14gvY9eC3KI9Cqi5ryJwDJmVFLEdGu5YSk+Rm3cLwJVAI/sA48oThGUGSl1
 J/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4AuSqKxqun6TlKh0JT+UXYcVeve7rtoGZH9FW811eRM=;
 b=Z6LfoSddNWtgIw3L66xXYcj1cwwD85XG+acm0TAtVwWZ7jhyUA7hXrKFVc2guLAfrZ
 mLwlOZXwCwYRCcoDY4R7mHymrOh8WfULJC/WeGXya38rgQfHwi0C5G82nco4QskdwcwM
 C6lZGEIo5xVEIvpq0Cu2QkSu9gbyMEc1HB4U0eCIoxQocEcCGoU0nfvL5cU4ZP3K0udv
 e1pptIXEUwbzuTmEfsFQdyjZn128iDrsAn7gBPbtnV18R14eFD1OQrZtETMt9T28Jqco
 RBUtQtyqcSY+IpbNVJ54oJ/QgcN4viwBa6Zgrd9MGZ+GneMBO7d0etM0NsjBL8YA0wjQ
 SYqw==
X-Gm-Message-State: APjAAAVbbNUbPwLF040WwKMshzuez3ir6VCjELp3qm5NM9n0jx/+GWto
 pSandn9IkAh8ikDNXgZ4y1SURmLGc9o4MSkPAYTZcA==
X-Google-Smtp-Source: APXvYqxWCOOptjWp50CreOdWBlaGYw6+/p8s5kUD7b52w5VUQA/3gvwYe7jxQ1s20HWV6yIL3W0mDFYBUTxENZgWkkY=
X-Received: by 2002:a9d:7504:: with SMTP id r4mr10178369otk.221.1567508158317; 
 Tue, 03 Sep 2019 03:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190828190456.30315-1-richard.henderson@linaro.org>
 <20190828190456.30315-58-richard.henderson@linaro.org>
In-Reply-To: <20190828190456.30315-58-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2019 11:55:47 +0100
Message-ID: <CAFEAcA-pVrF2oj5EMtVTd9REdig__J96YgHNSzYgctFiFFnW1w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v3 57/69] target/arm: Convert T16,
 Change processor state
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

On Wed, 28 Aug 2019 at 20:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add a check for ARMv6 in trans_CPS.  We had this correct in
> the T16 path, but had previously forgotten the check on the
> A32 and T32 paths.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Fix cps architecture checks.  Rename s/v6m/v7m/g
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

