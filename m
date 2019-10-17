Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29435DAD84
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 14:55:23 +0200 (CEST)
Received: from localhost ([::1]:46500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL5JK-0003Uy-6X
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 08:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iL5IK-00035j-Dz
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 08:54:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iL5IJ-0004hb-Eo
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 08:54:20 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54601)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iL5IJ-0004h8-77
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 08:54:19 -0400
Received: by mail-wm1-x343.google.com with SMTP id p7so2445117wmp.4
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 05:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D5Eu7bOTFGaZ9y1gn0jALJIwMznA7mHgWe1Zy7hNNSs=;
 b=JJ2cMUEMsm5jM6oL2C+IjVkMMppBSREXUnv8gj6CTwL/uY8wk1ZiFzCw6mIl2UsPSD
 ZtZLMNY6Q1RPXxwCXGubaAwMnzdDJHexXli1dJLGcjFrJe8ZZKd9rIQR2/4LRxKwpoas
 Mbf8XBQtwDd67GWsXkSuFC1/LKQmh/AQZV+5Vcs++1IQyxGFLZrd23ShOyyh1lS+LFk/
 J419/B7DFqnt0S8yy/l95eqIbd6026B9cx+HHHtaLMEoe7XoBXhjZDiY70jtUQFZyuAC
 +TBZ6muaLJE9OHiW1bqtNubXnZcWWp1nS9Nm+AlWD3K1pjje5Ta6SgiCj57gDG5eRGHH
 vLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D5Eu7bOTFGaZ9y1gn0jALJIwMznA7mHgWe1Zy7hNNSs=;
 b=rIJz9hT2QDDaSf6hVXzQieMDsxPsr0sbHWePFvD7tjDzHSzR/aDD76JofiBkRQ+v5z
 c5nY9KIJ9YI1ExpwlliJNcCut761SJoul0wd1ZoxYHn+4utOtoGBcGKbb/IamnlSLYas
 nBsF5rpobaE06X4pGLI+BSi76E+aYADosd8vroI4d2qrNtRxwQS5z+LHgmJamEo5ibiP
 5eJA4umJ0qLPlxI/eBC/I8IPDds39MM7gHwHhsXhdEwJ7xGPb/XSU6yKAmHBu/ZoyqB6
 cb9k8nHCmp0dTsa9hPhFhBEWAHp4s9Z8vBQddQ+7yLIDv+5hKdNmHTVu7GajUI/naE0K
 uSbA==
X-Gm-Message-State: APjAAAWY0d5op9EH6HNAPwgeLouxHfosK5H4AHmf6RjcRLqINu/RvLvh
 ya9SFno39iLsUvxaeEy9ZLs=
X-Google-Smtp-Source: APXvYqzg+bxvM3KFMIdZC6XwwIp3ItI2LSlrPScygg9eTKZNSBStKZ+oJHfDtfLSPSgs2s3nJIW8zA==
X-Received: by 2002:a7b:caa9:: with SMTP id r9mr2692624wml.58.1571316857774;
 Thu, 17 Oct 2019 05:54:17 -0700 (PDT)
Received: from [192.168.1.36] (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id 63sm2289972wri.25.2019.10.17.05.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2019 05:54:17 -0700 (PDT)
Subject: Re: [PATCH 0/3] tests/acceptance: Add tests for the Leon3 board
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
References: <20190627115331.2373-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0fbfa3b9-8f4b-594c-04e4-32fcc35a53a4@amsat.org>
Date: Thu, 17 Oct 2019 14:54:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190627115331.2373-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 6/27/19 1:53 PM, Philippe Mathieu-Daudé wrote:
> Quick tests worth to avoid regressions, idea from
> https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg04177.html
> "Maintainers, please tell us how to boot your machines"
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (3):
>    tests/acceptance: Add test that boots the HelenOS microkernel on Leon3
>    tests/acceptance: Add test that boots Linux up to BusyBox on Leon3
>    .travis.yml: Let the avocado job run the Leon3 test
> 
>   .travis.yml                             |  2 +-
>   MAINTAINERS                             |  1 +
>   tests/acceptance/machine_sparc_leon3.py | 89 +++++++++++++++++++++++++
>   3 files changed, 91 insertions(+), 1 deletion(-)
>   create mode 100644 tests/acceptance/machine_sparc_leon3.py
> 

