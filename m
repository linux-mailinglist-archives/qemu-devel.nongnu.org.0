Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508489B50B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 19:06:32 +0200 (CEST)
Received: from localhost ([::1]:59714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1D1D-0007Mi-4Y
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 13:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54968)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1CzW-0006Pa-6d
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:04:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1CzV-0000Fh-0z
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:04:46 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44751)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1CzU-0000Dn-QU
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:04:44 -0400
Received: by mail-pf1-x444.google.com with SMTP id c81so6817134pfc.11
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 10:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FQ87yz3Iy6Wzj8Jj/rRfRc/tCoi10QfnBZxnhnK64u8=;
 b=A8rqsPmBk5r50JnRSG1enIlR5JGM6MuG7QzOKPY9q5w0BgGCpbaYv3kULnLKdMU3Z0
 GL34miKn500W47JlstHqRb7FVYzmAqlXq0ZE2tsBL7DdHzoB3FKVIdHlmJoJJ/IeNIod
 Zt36ZY3clpLYLksAJVDbO6afKGbTM8DobZGpbuRGiLM0S1VBUpcThJInQdXkuoZMwasA
 ONvnatncl8H2ATL6TdhGWngCgDaK78yfhVHo/iMS7YXEFRj1ym0yJZUz43qBivM1auFj
 34yuJN7ooVfDu/rhQIJPk5AYvJGeqFL5397sJ4Z6BEngR/PfmV8Iv2Xdibc7SQO/i2mW
 BdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FQ87yz3Iy6Wzj8Jj/rRfRc/tCoi10QfnBZxnhnK64u8=;
 b=VE7smZEU7GZ3W7vUMWolKD+zXz32Aqy6XCUwb2oAR9nGoGl+oP7pvaJ1NmFIjy1vga
 d39GByEaLAqYBpiWUJQxkY5mcDtKdEz+WiMffdBNy2zdE+q4HsVOdC6wu4cjJIhx50Mz
 E9dJUbA7vz6GLkii8xWVbXz3Dat1VU9upEkHOqmLDkg5M2In+h4LZXd6LNIM+48FqCUb
 Q3T+Lvm99JVQZcKM/7a0p+4aXtqfhF48tRKTiRKK4aHf2xpVlFj1eiMhiSJp8e29PKD/
 evGJL7oEM0OFhAxzuoH1gbWrUbPFvybkz1lOGBbPJ6wbG8qYCsd3W+jG0WthIw6UZKB1
 HAig==
X-Gm-Message-State: APjAAAUM7JvTvDL/mA+H+DbnPjRF1dQBGrjhGaN/gBCKdDiCyriTpd2H
 P+nwU2bEz/vlHOZYHRSuETdBGw==
X-Google-Smtp-Source: APXvYqxqCO5U4r/HBSwFhUI3V4YKB7cPXhm5KcPmFcopILV6kaYa+2imQknioPm/4Do4dwUttTWhVw==
X-Received: by 2002:a17:90b:f13:: with SMTP id
 br19mr6267254pjb.124.1566579881656; 
 Fri, 23 Aug 2019 10:04:41 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 131sm2575198pge.37.2019.08.23.10.04.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 10:04:40 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190823135811.13883-1-philmd@redhat.com>
 <20190823135811.13883-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <64061664-f79f-b074-8fec-fea24594d5df@linaro.org>
Date: Fri, 23 Aug 2019 10:04:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823135811.13883-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-devel] [PATCH 1/4] target/arm: Restrict pre-ARMv7 cpus to
 TCG
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/19 6:58 AM, Philippe Mathieu-Daudé wrote:
> @@ -2535,6 +2544,7 @@ static const ARMCPUInfo arm_cpus[] = {
>      { .name = "arm1176",     .initfn = arm1176_initfn },
>      { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
>      { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
> +#endif
>                               .class_init = arm_v7m_class_init },
>      { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
>                               .class_init = arm_v7m_class_init },

Ifdef is misplaced.  This shouldn't even compile without CONFIG_TCG.

Also, m-profile shouldn't work with kvm either, so I think the endif should go
below cortex-m33.


r~

