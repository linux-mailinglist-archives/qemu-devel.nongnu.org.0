Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A4F19987E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 16:30:17 +0200 (CEST)
Received: from localhost ([::1]:38942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJHuC-00015G-Nq
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 10:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jJHtE-0000Cq-F5
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 10:29:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jJHtD-0006Jc-D9
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 10:29:16 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34517)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jJHtD-0006Ix-6d
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 10:29:15 -0400
Received: by mail-pl1-x62a.google.com with SMTP id a23so8190135plm.1
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 07:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I6mGhiM8t6lCGgoRpN+0eQykgvIVJkPGS20hfbwKfxg=;
 b=LV2mEmQP6ADDBtKbzk3PzSa3bHCpcrKwBhVHzLLdVY9unb6dbCR/HEkIbaYlbaHutW
 HKdjqQ+uEJkQruJl0Bj1e7TJa/QXWHZh5ht3GTf+nmeQIKQ+D3FKDh4zFeLtjCLihoq9
 yiPqt8dYY75sjWsuLBWdWGLN3/jnO44tXG/2Fthad6HGj1DqC4FjzzePzlJuCJOlwbKI
 JGxhj7So66D61xhdXaVbxkq0awPFrovdX/xw9G+1XsLXojT4E7XQAUHl71hDe8w5vpl1
 ydw/nu0sYpc620RwZX5MVqPmiiOHTGQ0QLyd0duWDfAAuWRXAgyQvYtYJ5j5/wH7dDRF
 xZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I6mGhiM8t6lCGgoRpN+0eQykgvIVJkPGS20hfbwKfxg=;
 b=eFeVrw1ayolG+Xi0low9vD2mjFWxUzxMV2lvtI5NAZGsUQ0Lr8Oy8fL6lLtUgxO0cP
 VgH26SxPXK6TQ5BeMi4FVst9b2P9Rbqqb8WDFAdu9yqMv2arnzqepeIgXxSXSHqOx0Wn
 3yN3wFsOlfu2pIoaEuiQ5J68l0DONUOAdWmUbNp2N5vJdjJVTPub5aTn4m/ONGLHLB0b
 oBf59ClOwXKy9HEGedjaBVltmz5h4OGE8ayAulIArViWexhpY4zH5SCfFlL1Jht9r75l
 dQb5Zlw8ttdCNpy/fl3jykc7bmPrkhjvIkrHHXuRO2uJBT9VeM7HVxQvIN4+rDrw4u0L
 H79Q==
X-Gm-Message-State: AGi0PubdU4ZmpCk5k2E7Sc+bDomYbl8aYtJVPL+e/CPlILdKWNnNuRFc
 kUEReJSjpua1khX1Zz60Jw/NBQ==
X-Google-Smtp-Source: APiQypLcFaFfGhVO78oVlKADJBWGwmor4lQx56JJauiqtQ99CRN9EDa67VOBU6PU1cF/FxHQJJeHPw==
X-Received: by 2002:a17:90a:36c7:: with SMTP id
 t65mr4232026pjb.182.1585664953724; 
 Tue, 31 Mar 2020 07:29:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id m7sm2081166pjb.7.2020.03.31.07.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 07:29:13 -0700 (PDT)
Subject: Re: [PULL for-5.0 07/10] configure: Support -static-pie if requested
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20200331035456.6494-1-richard.henderson@linaro.org>
 <20200331035456.6494-9-richard.henderson@linaro.org>
 <a36effc1-cf0b-411d-2a2a-97dd2932e95f@redhat.com>
 <7818b819-10b5-b1ed-6f96-4f27e4369222@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c4f57f5e-d17d-f677-f64f-1467283324f4@linaro.org>
Date: Tue, 31 Mar 2020 07:29:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7818b819-10b5-b1ed-6f96-4f27e4369222@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62a
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/20 6:44 AM, Laurent Vivier wrote:
>> QEMU_LDFLAGS       -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -static-pie
>> -m64  -fstack-protector-strong
...
>> $ file m68k-linux-user/qemu-m68k
>> m68k-linux-user/qemu-m68k: ELF 64-bit LSB pie executable, x86-64,
>> version 1 (GNU/Linux), dynamically linked,
>> BuildID[sha1]=363ee31697e874085ec53c2af454a070c62647e1, for GNU/Linux
>> 3.2.0, with debug_info, not stripped, too many notes (256)
...
> In fact, the binary works well in a chroot, so it should be  a bug in
> "file" command.

I hadn't noticed that before, but yes, it appears that file needs an update for
-static-pie.


r~

