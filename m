Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907765F6518
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 13:17:20 +0200 (CEST)
Received: from localhost ([::1]:45390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogOsR-0003iE-Ms
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 07:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogOTy-0007dx-Kh
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 06:52:02 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogOTv-0001Lh-Kl
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 06:52:02 -0400
Received: by mail-pg1-x534.google.com with SMTP id b5so1546502pgb.6
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W+6lPPCfyXOyZ7QleOhL92iBJUIL1jcD/2lPHaHHe80=;
 b=BhtZXK8G5fIfm7tZkhEjA12rX/cPZuZDKB6BHVE2sTp26mKaekzrNzj3RYSCdKEYFC
 Z4hVec2+7s4/J59O6UmBJwSy2+vMDfXBzXx+gpVkiwFHbYcUFbxXFmgBrYG1lfcOGfMv
 zQJgrZYBzET8CM+LHDzRWvohd0StagLF+dUsre5JTgrDkhEwSzleEalEanZy3nBDZgL4
 FAP2onV5NTRf4aphRfvjPK50W7NghaXo3AOmznEsz+Fa+o7wgy9yTEdRtHjOj7UWECgY
 lZobmeHN2jXTfZ1a3pnYsa+xyG+5bN1UmMRGCj82Z4gyr+6yp9kp3nu58RlsjuTzChcW
 IPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W+6lPPCfyXOyZ7QleOhL92iBJUIL1jcD/2lPHaHHe80=;
 b=JiwtKfGB5ts7WWXGvWbEGyF4gShIpS5x7mAchi0WcDTE7qNoQXnuGztWx8p2kBxj+8
 AXshw9TfPK2mzW5xNKD02Z346qdM90ZB0Di5JilS5r+WNub72EAVqKHWlC0xe7OIvATy
 pRq0404A9O6+XFlClX7jV8m6x9168dWFJBsNajo0kj0R7HB+hgM6ig6RYgUCDINKDek8
 9Mb1LEal7Z6L8fy0mPhcBv/6M6LythKwsZpwSrmngmKe+BRlMGLDTprqd7yVgIL8TCuf
 a+fUstpVDyYczDibazt/4sx0sVAME3ArCau6kHxzxKkh94f4TbJ2OcNEvDc4QnqoxRdb
 87pg==
X-Gm-Message-State: ACrzQf1neW4m9g+FvnLDCwn35iTozSLYbQlDWhGhrLANxseMth3vybF4
 ZbgOlkmTJR9fD8WUC/0mvq6fYe8YNUmXK4hIzxrDmQ==
X-Google-Smtp-Source: AMsMyM5P3B7dOwJMRty2w6XQQjGdTlSi0wa+5KOltn9cyOjxWLUc6hZBvPZTVWPfsDxVQODOPktM6uHz0zN4BjUH2KA=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr4011505pgi.192.1665053510088; Thu, 06
 Oct 2022 03:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <1408f62a2e45665816527d4845ffde650957d5ab.1665051588.git.baruchs-c@neureality.ai>
In-Reply-To: <1408f62a2e45665816527d4845ffde650957d5ab.1665051588.git.baruchs-c@neureality.ai>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 11:51:38 +0100
Message-ID: <CAFEAcA8fbToN9D4cm=2VfaUn3GHyYZhbETa3CY-Y0-2jqwbYcA@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: fix baud rate calculation
To: Baruch Siach <baruch@tkos.co.il>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 6 Oct 2022 at 11:20, Baruch Siach <baruch@tkos.co.il> wrote:
>
> The PL011 TRM says that "UARTIBRD = 0 is invalid and UARTFBRD is ignored
> when this is the case". But the code looks at FBRD for the invalid case.
> Fix this.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  hw/char/pl011.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for this patch (I'll review it in a bit). Did you find this
because it caused problems for a guest, or just because you were
looking at the QEMU source code? (If it's the former, we like to
include some details of that in the commit message.)

-- PMM

