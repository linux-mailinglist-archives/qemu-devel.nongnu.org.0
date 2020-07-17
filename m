Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB492239BE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 12:52:56 +0200 (CEST)
Received: from localhost ([::1]:37616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwNz5-0005B3-ID
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 06:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jwNxE-00046M-1k
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 06:51:00 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jwNxC-0003im-Cc
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 06:50:59 -0400
Received: by mail-ot1-x344.google.com with SMTP id h13so6565234otr.0
 for <qemu-devel@nongnu.org>; Fri, 17 Jul 2020 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NWY3zkF1M6hKTA2sE5Tnn3/05iw5/fl9oYymANXDgco=;
 b=TJGgDigWI1dBUW3Qd23z7wFPiiF21C7edt9/Ivm0j0zoW5PHOj1X8doDC89APvDcCC
 n7oXQ4kPJkWlN4sybKkDXQtDo5LS95Ebcibr+WUiWFLF9rIa81rb7RBWZ45yfWnBbHRu
 aK+Geosq79PDOaLDJLLJaiCPc7yh012g4WNmHF/N/tkvzChDPZfnKx1YBgf/YUCV19SC
 LNPGG8y0gnMfkaM8SACDLLWZYV7z9x8gcvJuZhJ9MEe55GIFHc0AbXgXqhxeq5Z/NTWy
 BgPIUvDGstKxEIFFniPCCqnyZkUi6ky48GOVPWSx7w/Oj/XQ450vB1kEybvs7bh5ZjV0
 BPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NWY3zkF1M6hKTA2sE5Tnn3/05iw5/fl9oYymANXDgco=;
 b=YNeaXIPVPGReLW8FmbSa0bLlasgkhwKXiLunEpMma19e0IR0cS3osYuNFs6uIIQVXe
 70Gy4SBJX849S3rhV0xOoWOgARk4/YCz+t4UDNAW1VNmO1JuSn1JdIoFWPPKNI+MQyv4
 LqcWdYSOPPZCKirYdchvn54hBTax5OKxt9uXc+uKzuBaYr7gZoX0hoRDzgUazrib1UMI
 +N4q34ni/k23iBR4L7bGBJjWkhCyjbCFzlLt2tooWelJ5VJ0pjgPNVstrXZSGsLU/bsB
 Z6akKT/B8vfLJ5v1V35EwvL80WzjgPTeKXYLIXsM0HHpfV4sqccuXqLThy4RD1v1Xvos
 Cqmw==
X-Gm-Message-State: AOAM532WnDvz7UtkNiXRRAdJO6XzfFTQSa/1Yx1BxFIf93ZT1D+6OV/T
 pGAdBZxKhSOej3rNGlMA4l8HbCoCwRzTS287qym/rw==
X-Google-Smtp-Source: ABdhPJyR82d6VkNt6ZjOtam892mE1DEx4YKXdEjaeFVn+1KkQ6vGDXAg8WXNuERxSIR/wcKEgQajiko+bcbLklCVr44=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr8160438ota.91.1594983055825; 
 Fri, 17 Jul 2020 03:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200716174900.GL3235@minyard.net>
 <CAFEAcA-UWJBpM_-G2RAe9B-WcPzBaKGZTas1njehQ7gcjsMpew@mail.gmail.com>
 <20200716222601.GM3235@minyard.net>
In-Reply-To: <20200716222601.GM3235@minyard.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jul 2020 11:50:44 +0100
Message-ID: <CAFEAcA_5M8MD+2s_r1jjcgDY0LX69iZRkUP1kbUQTQYEuSN1Nw@mail.gmail.com>
Subject: Re: [GIT PULL] I2C updates
To: Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Jul 2020 at 23:26, Corey Minyard <minyard@acm.org> wrote:
>
> On Thu, Jul 16, 2020 at 09:45:41PM +0100, Peter Maydell wrote:
> > Hi; this failed to build on x86-64 Linux (incremental build):
>
> Hmm, I did test this, and I just rebuilt, then rebased on the end of
> master and rebuilt, without issue.
>
> It looks like the smbus code is not being included, but I don't see how
> that can be.

I was wrong about which config failed, sorry. Incremental builds
are fine, but the build that does "make -C builddir clean" first
fails.

It looks like the problem is that in the created config-devices.mak
files, CONFIG_SMBUS_EEPROM is set, but CONFIG_SMBUS is not.
So presumably the problem is in the change
"hw/i2c/Kconfig: Add an entry for the SMBus", or it is a more
general issue with changes to Kconfig files not correctly
resulting in rebuilds of config-devices.mak.

thanks
-- PMM

