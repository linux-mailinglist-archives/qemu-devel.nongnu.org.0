Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408685B2833
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 23:14:01 +0200 (CEST)
Received: from localhost ([::1]:54082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWOqV-00065J-Tn
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 17:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oWOod-00049G-DW
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 17:12:03 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:34539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oWOob-0005En-P4
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 17:12:03 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id p200so9265587yba.1
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 14:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=W62T+eNgD5YeEU3Jd5f9ufa7I4g31DfY3X1HgFb2YRk=;
 b=Lj9QPPmMryBAPd/yMsuQmfwApoxcck2XTYzqosEGTL7eCpysmRyO/i8g884sxHJX/U
 pyLD+kwMBqIFaSK93k6CnYwy2bTQSH7PpGxCoCaVvLVNzb7aKSP51aJ0JlEyRlEI9Tds
 fOTWjgPmNvia2x1kUjhpuHTFCv9/LgBLxSSNmbKIlQPyeTrP3OdRfh8sCMcFWuQgAjm2
 WcHkdmVSssNWYaoF4OoGTztRtGvIRcLBDGRj7sDWXlZPXYzzqUNmk+CTUeK7qXlgl9M/
 5o4ozqmPFYNC4C1BJ0R18uu5Yppn3Ez2eRlCECcafwDRTLgTrOC+AL/hfymeukh4154L
 2nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=W62T+eNgD5YeEU3Jd5f9ufa7I4g31DfY3X1HgFb2YRk=;
 b=csZZIr5dzmbZGubJSubawoMYV1gmZOuG3iIZN9I9aQhAF7SiSigI0zQwIem2DYqNRn
 1UMbr6cuwuU94oWPwTs3egZR/qUrCqjTE/nnG1KFroAcqxDn0yIybmbPw09nB0fVaRTB
 j5g3UPBUqVbMCeMCAX/TGtvRnraiOE1loXy1KXtGghFzB6NrEftLdSonFuT77YKjYd1l
 oqn1MkEmnbA19elL6IRkA5VH/7jnemffXpHy1mCSu84ufiBTkjzRWeRYu8eZu5G2CFxp
 JpKf7gJBLJpkRndbhuPjV8F1aXwrZl9wiZpOhttnQyg56qTrfFIQQiC0wXutSVidRS5T
 tC/g==
X-Gm-Message-State: ACgBeo0PBQUpXl5mTov+4MtTA9h3lhzlNGdOsXZoD4WqrCryzUcYGI9E
 aZg5nC6/oDMAQkqQ7WeLZzTD5jMdptunZ/9iTwNriw==
X-Google-Smtp-Source: AA6agR4sIa0nl91RHM4tKlXF8s6/jkGMaCcEP1+khSD1mnNVrw3i0PNFOcVULtNyXI7hn5I+F2XddBOjsldHXHvWHRI=
X-Received: by 2002:a25:23d4:0:b0:6a9:3cce:f811 with SMTP id
 j203-20020a2523d4000000b006a93ccef811mr9847160ybj.193.1662671519965; Thu, 08
 Sep 2022 14:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
 <20220908173120.16779-2-arwed.meyer@gmx.de>
In-Reply-To: <20220908173120.16779-2-arwed.meyer@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Sep 2022 22:11:49 +0100
Message-ID: <CAFEAcA_F+ETYHT-HSs3wHwjqP4CEe2LtdfCf8B_P2Ted4xvk+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] msmouse: Handle mouse reset
To: Arwed Meyer <arwed.meyer@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Sept 2022 at 18:43, Arwed Meyer <arwed.meyer@gmx.de> wrote:
>
> Detect mouse reset via RTS or DTR line:
> Don't send or process anything while in reset.
> When coming out of reset, send ID sequence first thing.
> This allows msmouse to be detected by common mouse drivers.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
> Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>

How does this work across migration? There doesn't seem
to be anything that handles migration of the existing
state inside the MouseChardev either, though...

-- PMM

