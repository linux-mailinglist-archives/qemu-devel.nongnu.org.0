Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E29C4E8
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 18:38:36 +0200 (CEST)
Received: from localhost ([::1]:43890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1vXH-0007V7-8V
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 12:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35441)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vVX-0006SS-Pl
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 12:36:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vVV-0003BY-WB
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 12:36:47 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33662)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1vVV-0003BG-SL
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 12:36:45 -0400
Received: by mail-oi1-x242.google.com with SMTP id l2so10453780oil.0
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1AEENBvaWT9CwODvTcq2LteBC3Mws8Ok8F6MJ4Glzd8=;
 b=Raa55hsm2WBh+rTjzdlgWIJl6nlJQ6inc0steHf0tkGKEP/YtndhPYm0W8YNXJ7OBF
 bXN4lDjLu5iFwO3ywF4aV7L4VbU42j5Me3NtZubaxPCs2hKUXRR55dunIiUHrgoQEksK
 rMdO2Ff4jQacQzpdjwubCJlzYhJsje6DsAAyt9w9SMthJLNomw2Mk6MyU7S5pn5qP/KQ
 GrtSKdcZEuI5wUF3NuKEVpsZ3ORkyaQilm/GV6KZNKdXJZDElqcRva/lpA2QATD4c/IE
 IE4C3ycaUrWaeIixX7y7HDEUGZw9Ji6PxNS5lgkzXrO9Mq9gImttkcqrjX5ymLhhvJBS
 EY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1AEENBvaWT9CwODvTcq2LteBC3Mws8Ok8F6MJ4Glzd8=;
 b=KuClGc9QBjNSyjUl4DX8W8evF5124SjTuLH1n7DUGlETVmtFbKHPi7KH2OQWZJwO84
 FH0gMSxRm7L3bIpuPVUkBpU582mvZA2bCh1hdGXyb1nxn/KpiXhph09LnJqlyBnW+iur
 cZ11uM+8QzDfjMYjnOa5zn4WwGJ0YKZh0XaNQ9TPrZ00DQtW27G0pilkP8gtJWPo7ZKu
 UAHHJCrIMvLyEG2RMcqN+evww2O/qXM68i9CQHxExHwplElcxx2z/eCRXzmYYkhdo/FF
 TV61yl3TK8gTQ8cjHd9RwMcbtqnCMa2Qeh3T0qZczMw8LbbHuI9vEiLBqfi6iKGiPmgt
 xNzQ==
X-Gm-Message-State: APjAAAUNPNd5CJPfFtQoX5G4yptTgNkuSzHEWIN3NMwGoluKGFdoL19z
 PG3rOv1vb7CMsD2/1pwNVvtp0iMY/KumfvtWHa9jkw==
X-Google-Smtp-Source: APXvYqxVO2TWRu4wepPDJN4Q2X+1hgkVOWshT2EqIAphpP/pVF76Nq281laX2HYtUzGdEuhLiskBqY0IsenpWYp1IHo=
X-Received: by 2002:aca:4a57:: with SMTP id x84mr9859819oia.170.1566751005023; 
 Sun, 25 Aug 2019 09:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-44-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 17:36:33 +0100
Message-ID: <CAFEAcA8SVkXO2hhP2ALkOAQ4+o9EmUvKV+Ja4djaaumGK6LnYw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH v2 43/68] target/arm: Simplify
 disas_arm_insn
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

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fold away all of the cases that now just goto illegal_op,
> because all of their internal bits are now in decodetree.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 69 ++++++++++--------------------------------
>  1 file changed, 16 insertions(+), 53 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

