Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064B7155D1F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 18:45:07 +0100 (CET)
Received: from localhost ([::1]:33388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j07gf-0006Qh-Qc
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 12:45:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44236)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j07fO-0005rp-Cb
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 12:43:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j07fN-0003ov-BZ
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 12:43:46 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37982)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j07fN-0003oL-5l
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 12:43:45 -0500
Received: by mail-oi1-x242.google.com with SMTP id l9so2775125oii.5
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CQgDk+b0mvymdlUuvilcBs0qZLfk9M4/wrhvvQA/BNc=;
 b=q038saeI2aDEK8Xd5y2WusscH2C1Rw5r64jHMBEJe2+yoBqiVd+7YWNmL9tLE/FnHw
 sPA5hpcRC11dHjEhJchDX0zAhNDJvkUDSCqtVMwZCUrMo3ehbFXBt03c1cUKgMgvaeVI
 Ok/w39WD9PI85R0/yxQwa4dZR39dQKE5041O3kNX6p1QJxIXo1fhUWiy5SJEFUjdvn7G
 6DjQjfY9QQ7tytuyNpGaJ9N+EjsfFgXLg97FOH+FRJfbOpWibbABN4WY/MGSm0Nxn4Uy
 v4KOlqDhsxPvjg/f2E6popjQ1cWMKxlUjyc48r4aKsRPLelTY17/fcwJ7UW1RXrFFgo8
 OPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CQgDk+b0mvymdlUuvilcBs0qZLfk9M4/wrhvvQA/BNc=;
 b=j/QlrnHNpBZm+LyZpyXMLQdaHguZ/ObXIUFUzp/Cb8vRRkNXc7g6LVfaRyqy5fGeiN
 KRwkWcHgh3b+11gT+siWZtqE7v/mcA07r5Q8xuHlDXAazVFQCKp3CLfASkgjDpXL/CUu
 zYFGTh2c/ao7qLY6So4PN7yiwQTiRdSTIvy+I1isKyWZAbPNKXRsUqj3cgoqfzsnrBLJ
 iYlG3pT4Hk4n2L7K+4KEXqm/tZStWc7qiXIboP09qkJNFULefQmIt82ZPvKD9xuIvtcj
 SHEMQyRoe+PrTWVRMuPGGDRUZ9yvdwA+ryNCZY3of6PcA98K1x3hbWt/rshpGRrSRb+d
 b8rg==
X-Gm-Message-State: APjAAAXXQTnFh7wPO6BL/pC8ItE7GqJ8DJSwnI3Zt1tj6afi7yWor+Qw
 PZbmQWjoaW2KgOygPtfsgkB/rxnur7pSmvl1zBQImw==
X-Google-Smtp-Source: APXvYqw7XXHx0kMBRuhSKPnG+S0XyFxK89hqCalpPRTSSHfushtoQcXLWWaPjFfbEG/UIn6OZK7wsYYxB4HB503J9Yo=
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr2758422oic.48.1581097423735; 
 Fri, 07 Feb 2020 09:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20200203144716.32204-1-richard.henderson@linaro.org>
 <20200203144716.32204-11-richard.henderson@linaro.org>
In-Reply-To: <20200203144716.32204-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2020 17:43:32 +0000
Message-ID: <CAFEAcA9710P7y-RtO0T=GQ4-qE4aBtRH4zHYXL9uCK1v7HMf4Q@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] target/arm: Introduce aarch64_pstate_valid_mask
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 Feb 2020 at 14:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use this along the exception return path, where we previously
> accepted any values.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

