Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DD3321100
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:46:42 +0100 (CET)
Received: from localhost ([::1]:42338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4zR-0000gN-SC
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4xo-0000Cv-ND
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:45:00 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:38740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4xm-0001JE-G5
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:45:00 -0500
Received: by mail-pf1-x432.google.com with SMTP id 201so2890279pfw.5
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 22:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MpPm7CIp4WGyV/KM1aYj1tiVYZ6UXuAUrFhsq2N5Lv0=;
 b=nCU3EExgiaYHFCIe7oUOGJDLcGb9qFyFhpxVfG/R0ddApprhQvWgNUx8QOnX6iXQbO
 c7ncOfBiQ0Z/ko4U+e4sXRzIfQrtRLI8jivjW1y6nDXGU4g5Li+YcwjCaT3kZiUktt0U
 TyL3gqupcjPml83ZYiZnYkjE5emeV7rlkzY16HQhXYt4INyXarwPVOX1TYTc7LE02AgG
 D5C5AeSCeO/67PZ7GJnJJKJlrgRF0yI5Yi2FoJR/gc2/7s98SXBV2Ui5yKl3RIWyEEVL
 9T/biP0q1N4hwXhqAwkZaE8J8algbATU1nPnr96awqk2Ih2gsXnG1Vr2NjufqnETLoT2
 RzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MpPm7CIp4WGyV/KM1aYj1tiVYZ6UXuAUrFhsq2N5Lv0=;
 b=hHwOgaclYTjKFm7Y61QOdafBnbVrBqTUaJzj2eK6JzuwEoLUpxovyiYr65sL77HqtD
 iIZw5ExO8znvbbbH6MNJ9ge0GFp9wPNnaH41APGWEfADxZDRgfjQ/QM9fTCfeNx0roe9
 ePAwmDftAKwuMdYD7ie2zj0UVYxAIRJXibjO1OyDrjyRX7vUuQ5LA6rRCgFbth9srz0J
 aBaW8K27NRi8oA8HSmuRf2PgiB0H5DWaBD0IZtIDqVgNCIknYzMyP84BBYR51ze2YaSo
 8YK4FnJiHvLWvoUkf0yxlA8+PnxqvIcVcNy6SNCy2fzxr7lbAlssKanPaxXR9DTvLTNG
 06QA==
X-Gm-Message-State: AOAM533Vq2kXm3lUuSEnZ+qfF4j+rYBcnfeGFkrnfj6kkaHDp+2DhM5c
 QR2/6ErtJelD6V6LhM9LSOxQ2IigZFSeBQ==
X-Google-Smtp-Source: ABdhPJwsT8dBj2hK7Sx9S0L4urLfwdU6/NvfQ8yfN/hdz6C4wvVmuvD/9sIWF9dQkCVoMM3phlqghw==
X-Received: by 2002:a63:234f:: with SMTP id u15mr18827065pgm.360.1613976294047; 
 Sun, 21 Feb 2021 22:44:54 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id c23sm17202785pfi.47.2021.02.21.22.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 22:44:53 -0800 (PST)
Subject: Re: [PATCH v4 70/71] tests/tcg: Increase timeout for TCI
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-71-richard.henderson@linaro.org>
 <a8fa5191-e387-b759-fa16-ebe969d4a020@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6035cdc7-f99a-b52f-0afa-a546acbbe599@linaro.org>
Date: Sun, 21 Feb 2021 22:44:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a8fa5191-e387-b759-fa16-ebe969d4a020@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 10:09 PM, Thomas Huth wrote:
>> -ifeq ($(CONFIG_DEBUG_TCG),y)
>> +# If TCG debugging, or TCI is enabled things are a lot slower
>> +ifneq ($(CONFIG_TCG_INTERPRETER),)
>> +TIMEOUT=90
>> +else ifneq ($(CONFIG_DEBUG_TCG),)
>>   TIMEOUT=60
>>   else
>>   TIMEOUT=15
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> Does it even get slower if you enable both at the same time, TCG debugging and
> TCI?

As it happens, my testing was with --enable-debug-tcg.
So, unless you're doing --enable-debug (-O0) testing, we should be fine.


r~

