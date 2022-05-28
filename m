Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6FB536D49
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 16:29:17 +0200 (CEST)
Received: from localhost ([::1]:46140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuxRM-0000lX-3r
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 10:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuxO3-0007E4-GB
 for qemu-devel@nongnu.org; Sat, 28 May 2022 10:25:55 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:37701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuxO2-0002tY-0n
 for qemu-devel@nongnu.org; Sat, 28 May 2022 10:25:51 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2ff90e0937aso72601987b3.4
 for <qemu-devel@nongnu.org>; Sat, 28 May 2022 07:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AM0cNHzCWj4Ji/uqNhELc1LXF0bBR2zXTqPahDwobPA=;
 b=q1owlYsUFSsz9oeyAnTj/1mKeUn5Sx9IO89h+6jG1XeL17lD1j3irWfHQrjmEQr8s6
 W+GfgFxl6N9/RyKY0zS0agE//514fwKA3LISeFb10Qr7/KOHGyVjJ0fYYpnKHosG5ue9
 FDy3yC+YbFOl3YIZOzrhMIi/aYScDM6cXGJ2dfJQQZAu/mstnlXMRhKtqxs+fUqIhkQK
 vXab0AAng3QDJsYX/Tmnzma48UEgC0PaH2kNZadzVc3Pe1Ytk2eepSjZykSDMDqFLhiN
 riHrs9ZQFFJYES/yqlEG7sPxhcKPC2wcZNMIEpL1xt4zZVVCgn8ECsIaApwFDqMOHZwO
 d1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AM0cNHzCWj4Ji/uqNhELc1LXF0bBR2zXTqPahDwobPA=;
 b=b3BMM7zo+5gobPJ222GmT3+jh1w8jFHtUfpmH7TJK31Pm3eTbfYpPlqLKgBSQu3FnV
 l/3XQCjLsOC/SqiEIzboR4Ji1FRKfwQS5kVu+uDnIn7pqzQ7Hr4jcJXSK4KWwOGMdpI5
 dKl0t0MZeLa3T4SU3NiY+ufybB1wycxgflR9H3WYaCBkikoXKfWwJDUJdRRZ8KUBReft
 umrKT0etgHtr/GQF1rl2g5g/8LUT9GqENaYlnyEg5ZX0rjrI+er8nILF21c4ztZFreFs
 FYX46MzsmpZUtt79qg+9HdYnjThs4C/Ho/+qv8CNOZLRVEyuIRyX/CyHFfQHcz4vBg3p
 LISQ==
X-Gm-Message-State: AOAM530E+rhA9HrWXCRSoJBRZLAIoZEMpQql/pe3sGIm/ZDSYmx/eF4O
 BqdxN/PZ220O4HwpDBvg7SnXFBe4yfymHoLG42fZoqZ63Mw=
X-Google-Smtp-Source: ABdhPJx5mdo51vjb0kptf6WdE+yMVxf57xEdXPFIHJgTZAEtL7vkPMQ6ZhR8a83h1vWnkTTZhtpYamdv2hqFhsVjB/c=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr48975623ywc.329.1653747948846; Sat, 28
 May 2022 07:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220526111926.19603-1-deller@gmx.de>
 <20220526111926.19603-3-deller@gmx.de>
 <CAFEAcA-Lzg_OcEU4gytwCzm-QwVWAqio=xcUC8Lf_zofS1Pi+g@mail.gmail.com>
In-Reply-To: <CAFEAcA-Lzg_OcEU4gytwCzm-QwVWAqio=xcUC8Lf_zofS1Pi+g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 28 May 2022 15:25:38 +0100
Message-ID: <CAFEAcA_1R-Z-KBj4x9g0tzgz=1nzL+qUEa+64MKkZetq5+2E5Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] hppa: Fix serial port pass-through
To: Helge Deller <deller@gmx.de>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Sven Schnelle <svens@stackframe.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Sat, 28 May 2022 at 15:24, Peter Maydell <peter.maydell@linaro.org> wrote:
> Not related to this change, but you should consider removing these
> "if (serial_hd(n))" conditionals.

...oops, I just saw the 3/3 patch in your pullreq which does
exactly that, so ignore my email :-)

-- PMM

