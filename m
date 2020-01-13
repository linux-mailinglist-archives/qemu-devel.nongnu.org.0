Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3561139C2A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 23:08:03 +0100 (CET)
Received: from localhost ([::1]:56416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir7sQ-000237-CS
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 17:08:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ir7rW-0001cn-88
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 17:07:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ir7rU-0006Hm-NS
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 17:07:05 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34358)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ir7rU-0006HI-FZ
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 17:07:04 -0500
Received: by mail-pg1-x52d.google.com with SMTP id r11so5383260pgf.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 14:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e0iy0HjHOhRR2ZOWyH+uX04rxD8vV1e0VLBJOi/0Jyo=;
 b=akjHcFFQ9FudQcrNGPlHEs331NSA6HcNA54FYjrtBqNBE9e8o/JLP+JZHR3bQxqMw+
 NIFT8YV+o1kXcKO6w9GoLkkZtsJI8SimyFC53OMUAuyKcJx/miWBaQ9m+3weO8Eb2KKV
 cWuX7ad2zB9f1r5koAqr8WBH9IlFw0ArDfZXpvT424LR7jch5+T28MZaks30NNj6EYDV
 KuhENgNP09vWUyxe3xMm+d7G9W4RD807sixoNAYI71myVuq4Pohpb/LSl1aYde6tuczM
 g/GzG18j923l4AKBC6aPo5q3MOCM4ohfSE3tp01heSKIbwvqulpOs3JDS4WX1BR86Meh
 KQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e0iy0HjHOhRR2ZOWyH+uX04rxD8vV1e0VLBJOi/0Jyo=;
 b=PFH0AgL5bjFa0NhGwWgvw2zYatMmyWln1wOwkQYKU3HpJKLyTd2yAgWIIJOOxNyqRe
 iFcWO2NiNykAQja6DSwdAalyHvwTiC5NmI2VZjYxgEqXlFO0SBYpEaAjXiw8GCZZPLdh
 rcfIr1aI9gMrTOCII4WYRvk9PB0LORtPdeVry8xrtB+W+2V2j3ypBsjOtXRrDig5qcQ9
 +UBEmFzxgVY+ntyOtM+vVzVjMpO7O9gdLYlioqsoMlvWDqfJjgraCQDLufyO9jXVo1V7
 xdJPP+kMMayWelU3c7q4F9bTnnKBLltlAxhasAHUr+wVwepK1XZjd3U0CC6bXNtgxe3S
 4eNg==
X-Gm-Message-State: APjAAAWeG6++I5P0E7rSx/cVi0hWvLf0EkQKccf6RTytInjWuDTaolLo
 Kj4pCBhgoM9t7OypoPNROPyJ4MWBclA=
X-Google-Smtp-Source: APXvYqwdrpFcokvAQIdFiLSH4kPDm3rIcVNLFhQLGcJBHWuBEM6k8tH9zW6ffmX7ND1hc3SKiCuYWg==
X-Received: by 2002:a63:646:: with SMTP id 67mr23137011pgg.150.1578953222865; 
 Mon, 13 Jan 2020 14:07:02 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id i127sm16334735pfe.54.2020.01.13.14.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 14:07:02 -0800 (PST)
Subject: Re: [PULL 00/41] tcg patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200108034523.17349-1-richard.henderson@linaro.org>
 <CAFEAcA9P_3enu_M-55aoqWScFFAhw=Jfs92+vCc+yY-2nXUehA@mail.gmail.com>
 <df405ec5-190e-946d-fc2f-b52c695a39d4@linaro.org>
 <d115421a-497d-42d2-5dc5-6a3d4b19b0b0@linaro.org>
Message-ID: <67615704-a1e9-1d2f-752f-7ab84178e060@linaro.org>
Date: Mon, 13 Jan 2020 12:06:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <d115421a-497d-42d2-5dc5-6a3d4b19b0b0@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52d
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

On 1/13/20 11:50 AM, Richard Henderson wrote:
> On 1/13/20 11:10 AM, Richard Henderson wrote:
>> Details of this test system?
>>
>> I suppose I'll grab your tarball just to see if the binaries are different...
> 
> Ho hum.  Something is different.  I reproduce the problem with your tarball.

Well, yes and no.  Your tarball also fails for me with master, v4.2.0, and
v4.1.1, so I can't see how I can trust it at all.

Thoughts?


r~

