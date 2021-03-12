Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E33338DC7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 13:54:42 +0100 (CET)
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKhJR-0004dL-OG
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 07:54:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKhI3-0003uz-CM
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 07:53:15 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKhI1-0000oa-NZ
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 07:53:15 -0500
Received: by mail-ej1-x632.google.com with SMTP id p8so53126339ejb.10
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 04:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kK4B1DHNMhEV1S2zBMHr6FgjFX847uDCfiiP2/9A6g0=;
 b=i0DWE5zgSkpzJSt4P44oM10UzHy1fF0WRyp0st2Jye8LB00zJMuRyC4hDapaN9DH8F
 d3YyW0ywEPZL8XmIMiIsTmsRdPNdoojMJc3pbvatpsDUObRVQHUrjrA7wNp9m7GYqxhi
 h+oT4A2+fR6BLPLskXYS/7qIqQCOB+8g2zU4yyJVmEhpMHucGanDuuS9gxG0vlp91Kvq
 cw9d4dSKgixILjJPahzJGU4HeHFzI7GCg6A9UW3IltNDF7sMPt18jEIinxe2eGiNw5L2
 8oa1YsXBiqZgHSsr+iVE2aH4IBDDNtqEFL+tYHTVipRpCDw+DOejkKUPFzyOyIXeEyBA
 7UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kK4B1DHNMhEV1S2zBMHr6FgjFX847uDCfiiP2/9A6g0=;
 b=QoghGcrBSr9Nhg2paqKJb5p+OPThe21ba/rMh6iR3Ji6x0Aw2wFOFQDoxmAeV1D/b4
 SvTfGRFZBezpqJ2RRFBSWtpZ39l0Fpj9se4v5q7AaZvdtVJHnYeapiIPKmVarjQ/hooU
 0vxogM0k1+wNOIbEPFxMH/4m2zkYMCb5wJnMRI4J4RxMmVgaqUZeXWuFvJT+/JT/F1Ru
 8wOflX5cucxeJjfvJNbgCWTKNjbxYCu0El5oaBwi+Aifedeao4HZ2zBMfvTZwgQZoDRF
 +apCAaT5LZTadhL2E+4LNlTpCJwduKUyBO10jz2l0AImJPJ5SaqLqKzQZK/y3tb8vrsS
 ANKw==
X-Gm-Message-State: AOAM531Ko2/QCP6IxlFld99NJqBsW6bT6QChRMSK+c60U4YriPj11vU0
 4mKZQg1GZ72dh1bSdOL68o0eMLNsmt7TK4E+vy8S9A==
X-Google-Smtp-Source: ABdhPJy60GY7cIbEbahh0O+RMynk6AffuehaZa182zngSoPAt/Q9w6vepXkzg5DOB98TITJmAFnzyqhrIjv2/7ySF5s=
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr8291111ejb.407.1615553592454; 
 Fri, 12 Mar 2021 04:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20210311180855.149764-1-wuhaotsh@google.com>
In-Reply-To: <20210311180855.149764-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 12:52:53 +0000
Message-ID: <CAFEAcA9WchN2TLCTPW9FJqbrpEisSOhm74ODuAotn9jiAQN6oA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hw/arm: Add NPCM7XX Tachometer Device
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 18:08, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch set implements the Tachometer (a.k.a Multi Functional Timer/MFT)
> device in NPCM7XX SoC. This device is used by NPCM7XX boards to measure
> the RPM of PWM fans.
>
> To provide the RPM of a certain fan, since RPM = MAX_RPM * duty_percentage.
> We convert the duty output in NPCM7XX PWM module into GPIOs and feed them
> into the MFT module.
>
> The connection of PWM modules and fan modules are derived from their specific
> Linux device trees and coded in hw/arm/npcm7xx_boards.c.
>
> We amend the QTest for the PWM module to include verifying the reading from
> the Tachometer is correct.



Applied to target-arm.next, thanks.

-- PMM

