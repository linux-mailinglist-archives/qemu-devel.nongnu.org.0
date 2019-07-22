Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B71970476
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 17:49:16 +0200 (CEST)
Received: from localhost ([::1]:34980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpaYs-0004jH-Ru
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 11:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53693)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hpaY8-00033G-VZ
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:48:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hpaY8-0007jH-2s
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:48:28 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37009)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hpaY7-0007iZ-S2
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:48:28 -0400
Received: by mail-pf1-x443.google.com with SMTP id 19so17568927pfa.4
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JjcO/8zCszdHC3wm++FqqIjYQ/ktCSoeJvmZg9Y2m64=;
 b=A/9uGuUr66vl7SZV+c6D+/FRrwWuVVa7sDlI+ZKo22W5cnhhagVfL1Z3RVX14l+1OE
 xAZ8fLNKs67buUHx1dCQnIUg9hZlrjzyACjMceEe7htNdjkDnEhyOyFV0rFXunHk0mpc
 xEg4LLQZD1lOUwIJNU6pPnVnbcvSdJ4abuAtUXw7lGqUKyDmjthEfnSLsnW4iAM/5xRQ
 GK96YKtramuwUBDheQcZRgotr0KbpEKnbhOs5bLofbDn0Fitah2MKwLT/Mq2MEJBih0P
 BtGNiyUdquSAajNYwT455TuhrVGgsePNnFPjXGwWcoz8iy2godL6kd6dGnH4rAX5qUyv
 S+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JjcO/8zCszdHC3wm++FqqIjYQ/ktCSoeJvmZg9Y2m64=;
 b=bOqBu3km8aIflecdSeSoYCG6VcosQW00y1gc9NRwPdPTWDzOQZ7iua/hTYMhxH3fKB
 1lpKTt0WeGpJ+Cwc6ePlMP8V61fUJhqBItkKGSFWpDG6/iK7m+WuRp9D5IO56tjok9Go
 wV6EYPDta/gq7vLeh2cpbhqCOdeoNs8j57SIs+ddodq9U+7LOHT5Yb7o5d+lSNXluxja
 5FS3l2qrA1GJbNze0/DTzl0G3xReFoNlzus4pUiSsfCLpe+M3bkNDIFMNwHwQT00MfU0
 +1IApk6GT86rJycj4clYUGe+aGVmleCTvr5KEaicLnarRZJrnhEh8q/DYOP+dneaqsel
 nD0A==
X-Gm-Message-State: APjAAAX/Ql3rO7plmH/V75uq2VPSVtGBKBC8tt8YbLBkhVHfV7Si2wA7
 XaR5cYXYSFMvpd3PTX4thTwMJg==
X-Google-Smtp-Source: APXvYqyeLBJh+wZNolv0YhFRc6Xg1nSw6Lgp/QCVUeKbipLGfq2rQMng/V2UldQO1mw+G/jTErnI/Q==
X-Received: by 2002:a65:63cd:: with SMTP id n13mr71853629pgv.153.1563810506545; 
 Mon, 22 Jul 2019 08:48:26 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id a5sm34691156pjv.21.2019.07.22.08.48.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 08:48:25 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190719210326.15466-1-richard.henderson@linaro.org>
 <20190719210326.15466-4-richard.henderson@linaro.org>
 <87o91mjdgp.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <18852c55-cc57-69b8-a4a4-fd3f63c8123f@linaro.org>
Date: Mon, 22 Jul 2019 08:48:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87o91mjdgp.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-devel] [PATCH for-4.2 03/24] target/arm: Install ASIDs
 for long-form from EL1
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
Cc: peter.maydell@linaro.org, beata.michalska@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/19 8:28 AM, Alex Bennée wrote:
>> -static void vmsa_ttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>> -                            uint64_t value)
>> +static void vmsa_ttbr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
>> +                                uint64_t value)
> 
> Why the rename here? It would make sense if it was only EL1 writes but
> the lpae_cp_reginfo doesn't seem to use that nomclature (unless we
> should fix .name for those as well?).

Because in a later patch we'll add vmsa_ttbr_el2_write.

The lpae_cp_reginfo naming is tied to the old aa32 naming,
which isn't as helpful as it might be for aa64.  But the
naming affects migration, iirc, so it can't be changed.


r~

