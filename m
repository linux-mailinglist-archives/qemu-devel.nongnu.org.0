Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE9021B304
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 12:14:27 +0200 (CEST)
Received: from localhost ([::1]:39428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtq30-0000Js-DR
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 06:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jtq0l-0007FB-BM
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 06:12:07 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jtq0j-0001Kk-Sn
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 06:12:07 -0400
Received: by mail-wm1-x332.google.com with SMTP id f18so5333528wml.3
 for <qemu-devel@nongnu.org>; Fri, 10 Jul 2020 03:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9PKtxgb6fPgX7qblDHqwYjJVZs0MDQ1wEGsnPQT9wt4=;
 b=onmfP9WIWJP5chcN6W7UxDrb+9DWFN3nVj/0gqOrRpUIXTPnesKoYScnGHiCixnI5b
 OUPp8GnyI1XEohLXODFl0VRpLR8m+DGAu7RLyW2rE0J5k5ZDwlBL+OWsex37Hy9OaNhw
 00hpqlch3Il00pSkaqueNaxGetZXQn8V+qI4N3eIb9PBywaLDQRv2RAcip2Rg94EzKqj
 BHnYsFreB75WnA4AJqaoUou8WZB/KX7Jf9zzRCOKZ9kKwEWP/0gha/tDjqzlJCSpzu6W
 93Tmd5KUKNtCEyCDCkd7lKyhG2wazpVp9pqDcJr8YX8CxGvQ55yF7gmsg3qpmIbEhvaW
 XW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9PKtxgb6fPgX7qblDHqwYjJVZs0MDQ1wEGsnPQT9wt4=;
 b=es3cDBz7Lwr3zmaKOkmN3MevxksdW1zaSycYfKp5t4XmpE1sbxrfXnZvog7tA5kSdh
 C/t13WtPrjomgiDvUWcLfsmtpYYFIWsJQgYTzw735Ui3xQPF1yMCFkePrAVM+46TR/Uo
 Lg9Sey8mSks+dNr6LtibOxEAH1pwSdkFbH/MvvQNJDEH3CgFFsald0yKASUe9exTADzJ
 iSlQ6ehyxX/WMH+oFEZtmwMnYgCw8PbqzvwlK9pahNhEdRI4kN+OFD8lNPhCbO+iqaIU
 ds0iCXHcdbPgUpYo8/ud++ZIa/8wh4L6G9FQ9ufu8cvpbnPUz9fSXEvonRBsOcy0ZYNt
 VfOw==
X-Gm-Message-State: AOAM533Zgqt1oAq9AaRnEwuOpxYnhyK1b2860duG6B9Srgak/iDNlS3d
 bJqz6Q0SJjaYgs563Ud/ZvA=
X-Google-Smtp-Source: ABdhPJxdi/3PMXMnJRQjg7O5IEZ9x6bXP5HZZDdezpMXRuJaPhEp4mES03oXseIcizunfz3AxOhxFQ==
X-Received: by 2002:a1c:5982:: with SMTP id n124mr4461893wmb.77.1594375924364; 
 Fri, 10 Jul 2020 03:12:04 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id u8sm9145833wrt.28.2020.07.10.03.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 03:12:03 -0700 (PDT)
Subject: Re: [REPORT] [GSoC - TCG Continuous Benchmarking] [#3] QEMU 5.0 and
 5.1-pre-soft-freeze Dissect Comparison
To: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CALTWKrUE3r4+BMKQY1YX6zMOriKcd_5QNyqGBk5Z_S5ZZPs+4w@mail.gmail.com>
 <87eepkn42e.fsf@linaro.org>
 <CALTWKrWONHNa2atJ+S6cnjqkHvWs_+A+U7e7V5ZYJLwdoKBf4Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0d4d0e8d-1b85-105a-b748-cc067e668785@amsat.org>
Date: Fri, 10 Jul 2020 12:12:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CALTWKrWONHNa2atJ+S6cnjqkHvWs_+A+U7e7V5ZYJLwdoKBf4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>,
 luoyonggang@gmail.com, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/10/20 11:20 AM, Ahmed Karaman wrote:
> On Thu, Jul 9, 2020 at 4:41 PM Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> If you identify a drop in performance due to a commit linking to it from
>> the report wouldn't be a bad idea so those that want to quickly
>> replicate the test can do before/after runs.
>>
> 
> Report number 5 will introduce a new tool for detecting commits
> causing performance improvements and degradations. The report will
> utilize this tool to find out the specific commit introducing these
> changes.

Great news! Looking forward to test/use it :)

>>>
>>> Previous reports:
>>> Report 1 - Measuring Basic Performance Metrics of QEMU:
>>> https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg06692.html
>>> Report 2 - Dissecting QEMU Into Three Main Parts:
>>> https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg09441.html
>>>
>>> Best regards,
>>> Ahmed Karaman

