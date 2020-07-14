Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7ED21FD69
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 21:32:07 +0200 (CEST)
Received: from localhost ([::1]:57362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvQes-0001s7-TE
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 15:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvQe1-0001QD-0q
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 15:31:13 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvQdz-00075m-Ju
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 15:31:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id f18so8907413wml.3
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 12:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:cc:references:to:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lZ7xXaiSVAdV6/ItVmS4cfIaqjWr/X2q+kbIHna7Jbg=;
 b=GPVAcuC2VlfImbZLVz7OuhstYfNIHs1PtkAIM4JJhnDbKvdCk61ZmiQO3T2fkCfvzk
 bMik2LTKd+vilXMLI0M1OPXnmCQr48QzdRo2Og5R+uMfkxsxqL+fDP5RWTZx7VMuYCG8
 bnz8QSSsKqb6sXyxbuvrnqCLYyY/BddCaLT/acNzB+VulUXJWMTl+7SGSNkdcQO9abA8
 +pvL2B0BoLqvJUu2iDXJDXhfc9IAMsME5OkXRhN1gM3SOiK7CU3ybze2Q+Vo5uZfKmUu
 8BlzCe1llk0Lnms2zSLmvx+qOtU+S03VYBZFGroUYxJRiMWPgmzLl+WHQSsAnvT5LFDg
 ADUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:cc:references:to:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lZ7xXaiSVAdV6/ItVmS4cfIaqjWr/X2q+kbIHna7Jbg=;
 b=DJ882HoalZBs18FYfwYjlOYFexxx6sxU63W9PBjjxLEGHdKRlYQnR3Rk60OCw+gUlP
 eWaRpXipH5mstoSEMujIeGI+xI6JoYRgReH+U2xSKgsT/ycoNI3QZVA/kCeTO3udr99x
 bME7R78zMQzWif7+u36i0RiiWcP2O107d1vf2LUDoNRqBhowNPifCJkyJYYspOYjRdIw
 +wBnUTBp4LMSKrXCKXHQfQoE/wNxnZckKM3MwP3EotOOQOkEL3B1J3l2u5ZwDWEh2GfJ
 VbHT10YtaqpHTVZb/YibhUORYgadIffJF9/DbgC+OjJHBXmXaoTT4kD13en5nRZXzKzk
 krsg==
X-Gm-Message-State: AOAM532uDqS31OsLvPNPinR9NnaiErlekjZgpyIjtIzVewHMAmaWW8Q+
 LJKll2Vn2fieRPROvsIl4t8=
X-Google-Smtp-Source: ABdhPJznK6tAO3sytnuOw8tRK+/ppY++h3Ya5HbvdG4a1ocdQXzcXzCc7vQKaPMX5n/PJojERyyrdw==
X-Received: by 2002:a1c:2045:: with SMTP id g66mr5085697wmg.184.1594755070213; 
 Tue, 14 Jul 2020 12:31:10 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id r8sm29654437wrp.40.2020.07.14.12.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 12:31:09 -0700 (PDT)
Subject: Re: [PULL v3 00/32] AVR port
References: <20200711090544.29302-1-f4bug@amsat.org>
 <CAFEAcA-5iHCUPDPU+eA-ZV6_At2uHffLzDZqaFS--AoYZXOmfw@mail.gmail.com>
To: Thomas Huth <huth@tuxfamily.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6efa2dd7-5ef9-3813-0f87-b3f8c6587cde@amsat.org>
Date: Tue, 14 Jul 2020 21:31:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-5iHCUPDPU+eA-ZV6_At2uHffLzDZqaFS--AoYZXOmfw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/20 4:31 PM, Peter Maydell wrote:
> On Sat, 11 Jul 2020 at 10:07, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> ----------------------------------------------------------------
>> 8bit AVR port from Michael Rolnik.
>>
>> Michael started to work on the AVR port few years ago [*] and kept
>> improving the code over various series.
...
> 
> 
> Applied, thanks.
> 
> Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
> for any user-visible changes.

Oh, Thomas already did that :) Thanks!

Phil.

