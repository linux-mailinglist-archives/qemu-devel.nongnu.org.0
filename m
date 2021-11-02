Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2286442B4D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:04:15 +0100 (CET)
Received: from localhost ([::1]:45940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhqeM-0004j0-Hl
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhqdP-0003R5-EP
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:03:15 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:34756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhqdM-0007dB-U2
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:03:15 -0400
Received: by mail-qt1-x833.google.com with SMTP id v17so18355813qtp.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H3rgNfkRORT9RVV7KgvRugFcAPq1l0XVhDNjnInePpg=;
 b=ZVvS+LxU4vI0Lh9Yb0odhYFl3Se6XvKvEi4Bx64hBxAmqGRrPI0XPx1KqaQkPqdp5s
 Otm14KQOODOKprcpAuJdUWJxLbOWdkDkiQ3Sp8XxZNzUvk/WTgnYP06A5EMWPLNYdh4s
 fN+GTTKYGZPjiDZyKZKLVV0vpI+tLAlUVMbEZyx4Oi4/JjnW/hAZrvL3HGAuHxi6YtCl
 Wp2FiAJVZlZ06pFLnYzRoC+ScZBaIFQP+7kno33jjphbj3hYIzDOW8Q/UkT1NJ1+n4I/
 q6+Mi8UUvUUVD+Cf+rAL6QYA2bNdjPfFdDO+j4IJ9Pl5nJDEkOPMrzNsOplv0NSvZFn6
 bnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H3rgNfkRORT9RVV7KgvRugFcAPq1l0XVhDNjnInePpg=;
 b=Gf5vEpHvqy+W2P4HtQYEyWPoIWwsa+VqnkV3QpIkSXkUYzJ42iubzfd9UKQj6LknnJ
 1A+dX0GnPq900z7htDui9xmeC4E+XvmAA9opsKW5MEc9ilKbunS8denv3y/1T0syUDzr
 x/5EzBWxW0g6nK3/gn+a5bkgoXseB1+ehfmNO5MtqBFGUdIazf+V2b3Cfy4DU5WUzF1t
 YUp3U2S7FZOwHZMZx+95slLd3mc1QvMYgSPMw0r64e72xnqZe62YEq4xFHxK84xjCa/s
 MwzIFP6pBrFrFYisqhcnRxatZkSF8rP6w+FY5SAGhLpIqOrFOiYa2wlHibmDC6lCQ0Nz
 yIeg==
X-Gm-Message-State: AOAM531NBKGfUEoV5gmTdIEwKzC0eXbJq7DUfSPYE+Om3dFJAv85uW1R
 xvFvV5b1QytlxB1eYvn0dlUpEg==
X-Google-Smtp-Source: ABdhPJw3myN3HnYOKFYSPHZudUFUjyXgOtUoM0pgqutceJQLkNRZnr6FXc/LBTkcYZSVPz3rQOiKDA==
X-Received: by 2002:ac8:4e8d:: with SMTP id 13mr16015484qtp.414.1635847389519; 
 Tue, 02 Nov 2021 03:03:09 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id f10sm7483390qko.78.2021.11.02.03.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 03:03:09 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] hw/arm: Add NPCM7XX Tachometer Device
To: Hao Wu <wuhaotsh@google.com>
References: <20210311180855.149764-1-wuhaotsh@google.com>
 <CAFXwXrnm2yveebfyq0cPPZBAeW33_sVu0jrkpbNQNUDBRBFQUQ@mail.gmail.com>
 <CAGcCb10wR6sfZCD_1N+jV9gi6f5Vq=0q9mHzky844nDwkzb7yg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d2a1f82-a32d-a423-ee6c-12a842bbf6c8@linaro.org>
Date: Tue, 2 Nov 2021 06:03:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAGcCb10wR6sfZCD_1N+jV9gi6f5Vq=0q9mHzky844nDwkzb7yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: peter.maydell@linaro.org, venture@google.com, hskinnemoen@google.com,
 qemu-devel@nongnu.org, KFTING@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 1:50 PM, Hao Wu wrote:
> Is this reply to a wrong thread? I thought it was applied a long time ago.

Probably.

r~

> 
> Thanks,
> 
> On Mon, Nov 1, 2021 at 10:33 AM Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On Thu, 11 Mar 2021 at 13:11, Hao Wu <wuhaotsh@google.com
>     <mailto:wuhaotsh@google.com>> wrote:
>      >
>      > This patch set implements the Tachometer (a.k.a Multi Functional Timer/MFT)
>      > device in NPCM7XX SoC. This device is used by NPCM7XX boards to measure
>      > the RPM of PWM fans.
>      >
>      > To provide the RPM of a certain fan, since RPM = MAX_RPM * duty_percentage.
>      > We convert the duty output in NPCM7XX PWM module into GPIOs and feed them
>      > into the MFT module.
>      >
>      > The connection of PWM modules and fan modules are derived from their specific
>      > Linux device trees and coded in hw/arm/npcm7xx_boards.c.
>      >
>      > We amend the QTest for the PWM module to include verifying the reading from
>      > the Tachometer is correct.
>      >
>      > Changes since v1:
>      > - Split implementation of device and addition to board file to separate patches
>      > - Adapt to new Clock API and address conflicts
>      > - Use the new clock_ns_to_ticks API to calculate tachometer counts
>      >
>      > Hao Wu (5):
>      >   hw/misc: Add GPIOs for duty in NPCM7xx PWM
>      >   hw/misc: Add NPCM7XX MFT Module
>      >   hw/arm: Add MFT device to NPCM7xx Soc
>      >   hw/arm: Connect PWM fans in NPCM7XX boards
>      >   tests/qtest: Test PWM fan RPM using MFT in PWM test
>      >
>      >  docs/system/arm/nuvoton.rst    |   2 +-
>      >  hw/arm/npcm7xx.c               |  45 ++-
>      >  hw/arm/npcm7xx_boards.c        |  99 ++++++
>      >  hw/misc/meson.build            |   1 +
>      >  hw/misc/npcm7xx_mft.c          | 540 +++++++++++++++++++++++++++++++++
>      >  hw/misc/npcm7xx_pwm.c          |   4 +
>      >  hw/misc/trace-events           |   8 +
>      >  include/hw/arm/npcm7xx.h       |  13 +-
>      >  include/hw/misc/npcm7xx_mft.h  |  70 +++++
>      >  include/hw/misc/npcm7xx_pwm.h  |   4 +-
>      >  tests/qtest/npcm7xx_pwm-test.c | 205 ++++++++++++-
>      >  11 files changed, 974 insertions(+), 17 deletions(-)
>      >  create mode 100644 hw/misc/npcm7xx_mft.c
>      >  create mode 100644 include/hw/misc/npcm7xx_mft.h
> 
>     Thanks, queued to target-arm.next.
> 
>     r~
> 


