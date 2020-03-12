Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CA61835DC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 17:09:03 +0100 (CET)
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCQOL-000652-LH
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 12:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCQNA-00035W-7K
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:07:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCQN9-0003je-3n
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:07:48 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:51999)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCQN8-0003gF-S3
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:07:47 -0400
Received: by mail-pj1-x1041.google.com with SMTP id y7so2740567pjn.1
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 09:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CfOlm33yq7HPm3H++4bpQOCqAWPyMg4tSknKyEUmJYs=;
 b=vNFfwPbxrxQAQRsMxb3Z+Rdpru2vPF9ds/jjHlbJ6BxRxFxfjoUFXX8bPHJ+F9Rmuf
 qA4G5N+OjIdIJ7Q9hFx/swwbx30/Ta5WfERFXdNG6eZX18Rb/mkmkfcak6THWgcFknA9
 FMkYNPaecdYEz9D5ZmOIDjY6q/LeN7Yh+J7h/TzPnfqDk3hSINV/9Bd9XM0ODqfd6t+1
 +zqntGwa74Sc+SlPNocs2kqtwb+TOdz3sW/S2iSaZiOH8/UwdORYhsdjtK+xlHNJBjdE
 6EQM1mcp33RUd32/6ixXhtVcOTEFTXUmbWbL4uD+qk710H3z0QeRsSC2TzAqYulXTmIp
 4xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CfOlm33yq7HPm3H++4bpQOCqAWPyMg4tSknKyEUmJYs=;
 b=kMASnSgpgo18GpIGYa7+MZK3XZATLCUT2vd9QzkhgEC3lHBQojr2B3WZZlqPzKTppL
 gP7/eO+sBCYZp+x5YszVAB7PlW87xenTdEEiBXmpYsfmyR+Q+ZVOkvm5HUBIzOzUC1iX
 zcdVbX0Y4GlvZ+y6z4C5co8XEZjRz8jdnjBTO+D4hRB0WXtch7TJqi8LAUBeTcrnbbBv
 iTU9MNG67W+HMMvJh2muGMEeeVZax52IXiv7mC8jPATcHrOF74EwV8ecPySC0BZ0yHaD
 XoBOcfD01oaybVHDfSMCq6DppCHpQXmQ+i39UbO2k+wesgCB1BwTQDlUEdecqrHlpzSx
 hSEA==
X-Gm-Message-State: ANhLgQ1S+M6hqodILfpjOL+Ai/ewu33UOyQQAIlr09qqMIqJYvxbrgC7
 9hyIGOk+XsY7dW1G0F/cxrid8A==
X-Google-Smtp-Source: ADFU+vu9wbX79SC2014ZbTH9bNRHBRNMdV4gaeohJaCi54FaL2Z9gkRsYC/jukb55sKLkBIDVYBsKg==
X-Received: by 2002:a17:90a:a48b:: with SMTP id
 z11mr4992016pjp.1.1584029261958; 
 Thu, 12 Mar 2020 09:07:41 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 y1sm51319631pgs.74.2020.03.12.09.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2020 09:07:41 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] target/arm: Misc cleanups surrounding TBI
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200308012946.16303-1-richard.henderson@linaro.org>
 <CAFEAcA9KdR8ZcjngFfSf7Y_zG8+VL+6pXDOJpWxP+VM7dj-XUg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a34362a5-3f77-7e84-70af-a29ff100603e@linaro.org>
Date: Thu, 12 Mar 2020 09:07:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9KdR8ZcjngFfSf7Y_zG8+VL+6pXDOJpWxP+VM7dj-XUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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

On 3/12/20 5:02 AM, Peter Maydell wrote:
> On Sun, 8 Mar 2020 at 01:29, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Changes for v3:
>>   * All but 2 patches are now merged.
>>   * Use regime_el to determine aa64-ness of physical memory addressing.
>>
> 
> 
> 
> Applied to target-arm.next, thanks.

Amusingly a bug report came in yesterday about this.
If you like, you can add

Buglink: https://bugs.launchpad.net/qemu/+bug/1867072

to the final patch.


r~

