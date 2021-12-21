Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF86347C842
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 21:34:00 +0100 (CET)
Received: from localhost ([::1]:53954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzlpe-0002Gd-CF
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 15:33:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzlnn-0000l0-Ft
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 15:32:03 -0500
Received: from [2607:f8b0:4864:20::62a] (port=33433
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzlnl-0002yb-SH
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 15:32:03 -0500
Received: by mail-pl1-x62a.google.com with SMTP id y7so188682plp.0
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 12:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x3f0zOJgyNuQwABDT8vbx4eC4xDgjpHB+RNjiXXu1so=;
 b=hdEWSEw8NE31llvCDVMNDZU62RTfJSW0TMe1gSq/vywhF73Okj8WS7snBd1954GHfy
 87yY2tztrmNSMbIXA7Y5huJsF75tN1UhS5G4v/qZCiTxxkl+jE2hR8qC1VeKfkeHQMmE
 L6TXUsdWb1XiUuVbzgBBv1OHV4QEBMuo//dHr/3OUQBeFr7kbhhhVyEo8sJkteYWOLjv
 wUmGo3YEXEUdMXcIDiuzVyIvg9y5rx/gked8dCCX/c4ixnhoz9WsiHYn8X9Wuia6nPYU
 bIxbHrsehvsEoBFaW+zRvR5AxeFE2ej4UM9Bgkz8TREwoH1BqLlWJA8J+/3E8iqZ4JJh
 i7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x3f0zOJgyNuQwABDT8vbx4eC4xDgjpHB+RNjiXXu1so=;
 b=I5ctXpQQWJaOL+95swxZ7/9/s0C+FM/zV425QvrYPwXDRf6MwuyXnVsOaR8UCsoqEe
 D84LF3e2ReDgk5iigvbfoLXekOMqu5OFSIk7Tdiy3lDiDCml9dIEfz/0ivvgLE9RmVvP
 X8ccCBrZTcbbLAnbK8Ahp0235yV56fA6TW1C2lkvqolxuyKtAKBYW6dIxxbt3qH7rzVX
 figpRoXcjHbYSvp5OOL+Wfa9H/UPwG8amHFhR/NIpTWITrA24adIb4u9f6kdt4E3bvbz
 PH8KK+rDil7tVWsdQpbq8qaJ5hJ/B6k03qgrB2lh45fUyPiCEOG+9PpQlWjcYyTVkUfm
 z6kw==
X-Gm-Message-State: AOAM533lU8HjZvfEhEzGbo6/hRd0+m0f2k3PywRfuZJ+AEXdORExO66Q
 o8qRNANMA16gsxyG7kkSICXRxQ==
X-Google-Smtp-Source: ABdhPJwpB9tPdR+929wHPjOOwnXGY9qC6te+flrWcxvcP5DOSsWFVslxtvOT4MfXhfV+oWaribwh8g==
X-Received: by 2002:a17:90b:38c1:: with SMTP id
 nn1mr170381pjb.65.1640118720496; 
 Tue, 21 Dec 2021 12:32:00 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id k3sm20174486pgq.54.2021.12.21.12.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 12:32:00 -0800 (PST)
Subject: Re: [PATCH 3/3] meson: cleanup common-user/ build
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211221163300.453146-1-pbonzini@redhat.com>
 <20211221163300.453146-4-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b94b5e23-6e34-d948-2f06-71c1da0ec120@linaro.org>
Date: Tue, 21 Dec 2021 12:31:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221163300.453146-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 8:33 AM, Paolo Bonzini wrote:
> Do not go through a static_library, which is only necessary in order to reuse
> some source files between emulators and tests.

That's not true, is it.  Anyway, you're moving the file to a different static_library.  I 
though I had tried this myself, but I don't remember the details now.

Tested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

